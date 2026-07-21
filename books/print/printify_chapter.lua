local interpretation_labels = {
  "In everyday terms:",
  "The key intuition:",
  "Another way to see it:",
  "What this tells us:",
  "The practical meaning:",
  "Read it this way:",
  "The main point:",
  "A useful interpretation:",
  "In simple terms:",
  "Conceptually:",
  "The takeaway:",
  "From a modelling viewpoint:",
  "What to remember:",
  "The geometric idea:",
  "In one sentence:"
}

local label_index = 1
local summary_index = 0

local function inlines_from_markdown(text)
  local parsed = pandoc.read(text, "markdown")
  return parsed.blocks[1].content
end

local function clean_summary_inlines(block)
  local cleaned = {}

  for _, inline in ipairs(block.content) do
    if inline.t ~= "RawInline" then
      table.insert(cleaned, inline)
    end
  end

  return cleaned
end

local function raw_html_is(block, text)
  return block.t == "RawBlock"
    and block.format == "html"
    and block.text == text
end

local function is_display_math_paragraph(block)
  return block
    and block.t == "Para"
    and #block.content == 1
    and block.content[1].t == "Math"
    and block.content[1].mathtype == "DisplayMath"
end

function Pandoc(doc)
  local output = {}
  local blocks = doc.blocks
  local index = 1
  local first_section_seen = false
  local chapter_title = pandoc.utils.stringify(
    doc.meta["print-chapter-title"] or "Chapter"
  )
  local running_title = pandoc.utils.stringify(
    doc.meta["print-running-title"] or chapter_title
  )
  local chapter_label = chapter_title:match("^(Chapter%s+%d+)") or chapter_title
  local first_section_title = pandoc.utils.stringify(
    doc.meta["print-first-section-title"] or ""
  )

  while index <= #blocks do
    local block = blocks[index]

    if block.t == "Header" then
      if block.level == 1 then
        table.insert(output, pandoc.RawBlock("latex", "\\clearpage"))
        table.insert(
          output,
          pandoc.RawBlock(
            "latex",
            "\\fancyhead[L]{\\sffamily\\small\\color{ChapterBlue}\\textbf{" .. chapter_label .. "}}\n"
              .. "\\fancyhead[R]{\\sffamily\\small\\color{BodyInk}" .. running_title .. "}"
          )
        )
        block.content = inlines_from_markdown(chapter_title)
        block.identifier = chapter_title
          :lower()
          :gsub("[^%w%s-]", "")
          :gsub("%s+", "-")
      elseif block.level == 2 then
        table.insert(
          output,
          -- Reserve enough room for the section heading and the opening of
          -- its first source block, which has its own keep-together rule.
          pandoc.RawBlock("latex", "\\Needspace{20\\baselineskip}")
        )
        local title = pandoc.utils.stringify(block.content)
        title = title:gsub("^Block%s+%d+:%s*", "")
        if not first_section_seen and first_section_title ~= "" then
          title = first_section_title
        end
        first_section_seen = true
        block.content = inlines_from_markdown(title)
      elseif block.level == 3 then
        -- These are mini-headings inside a collapsible source section. Keep
        -- them visible in print without adding them to the three-level TOC.
        local mini_title = pandoc.utils.stringify(block.content)
        if mini_title:match("^Step%s+[67]:") then
          table.insert(
            output,
            pandoc.RawBlock("latex", "\\Needspace{10\\baselineskip}")
          )
        elseif mini_title:match("^Answer%s+%d+") then
          table.insert(
            output,
            pandoc.RawBlock("latex", "\\Needspace{12\\baselineskip}")
          )
        end
        block.level = 4
      end

      table.insert(output, block)
      index = index + 1

    elseif raw_html_is(block, "<!-- print-compact-equation -->")
      and blocks[index + 1]
      and blocks[index + 1].t == "Para"
      and is_display_math_paragraph(blocks[index + 2]) then
      -- A short local explanation and equation need less room than the
      -- default keep-together rule. The marker prevents avoidable gaps while
      -- still ensuring that the equation follows its introduction.
      table.insert(
        output,
        pandoc.RawBlock("latex", "\\Needspace{7\\baselineskip}")
      )
      table.insert(output, blocks[index + 1])
      index = index + 2

    elseif raw_html_is(block, "<!-- print-page-break -->") then
      table.insert(output, pandoc.RawBlock("latex", "\\clearpage"))
      index = index + 1

    elseif raw_html_is(block, "<details open>")
      or raw_html_is(block, "</details>") then
      index = index + 1

    elseif block.t == "HorizontalRule" then
      -- Horizontal rules separate collapsible blocks in the reading copy.
      -- The print hierarchy already provides enough visual separation.
      index = index + 1

    elseif raw_html_is(block, "<summary>") then
      local title_block = blocks[index + 1]
      local closing_block = blocks[index + 2]

      if title_block
        and title_block.t == "Plain"
        and closing_block
        and raw_html_is(closing_block, "</summary>") then
        local content = clean_summary_inlines(title_block)
        summary_index = summary_index + 1
        local identifier = pandoc.utils.stringify(content)
          :lower()
          :gsub("[^%w%s-]", "")
          :gsub("%s+", "-")
          .. "-" .. summary_index

        -- Keep a source block heading with enough opening content to identify
        -- the block on the same page.
        table.insert(
          output,
          pandoc.RawBlock("latex", "\\Needspace{12\\baselineskip}")
        )
        table.insert(output, pandoc.Header(3, content, pandoc.Attr(identifier)))
        index = index + 3
      else
        index = index + 1
      end

    elseif block.t == "Para"
      and pandoc.utils.stringify(block.content) == "Plain English:" then
      local label = interpretation_labels[label_index]
        or "A useful interpretation:"
      label_index = label_index + 1

      table.insert(
        output,
        pandoc.RawBlock("latex", "\\Needspace{12\\baselineskip}")
      )
      table.insert(
        output,
        pandoc.Para({ pandoc.Strong(inlines_from_markdown(label)) })
      )
      index = index + 1

    elseif block.t == "Para"
      and is_display_math_paragraph(blocks[index + 1]) then
      -- Keep an equation on the same page as the sentence that introduces
      -- it, so a result never appears without its local explanation.
      table.insert(
        output,
        pandoc.RawBlock("latex", "\\Needspace{10\\baselineskip}")
      )
      table.insert(output, block)
      index = index + 1

    elseif block.t == "Para"
      and blocks[index + 1]
      and blocks[index + 1].t == "BlockQuote" then
      -- Fixed interpretation labels such as "The practical meaning:" use
      -- the same page-binding rule as labels generated from "Plain English:".
      table.insert(
        output,
        pandoc.RawBlock("latex", "\\Needspace{12\\baselineskip}")
      )
      table.insert(output, block)
      index = index + 1

    elseif block.t == "BlockQuote" then
      -- Summary and key-idea boxes should move as a unit instead of leaving
      -- only a continuation line on the following page.
      table.insert(
        output,
        pandoc.RawBlock("latex", "\\Needspace{8\\baselineskip}")
      )
      table.insert(output, block)
      index = index + 1

    else
      table.insert(output, block)
      index = index + 1
    end
  end

  doc.blocks = output
  return doc
end
