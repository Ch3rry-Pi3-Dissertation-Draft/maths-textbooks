from pathlib import Path

import matplotlib.pyplot as plt
import numpy as np


BACKGROUND = "#F7F3EA"
INK = "#17243A"
MUTED = "#6B7280"
GRID = "#D8D2C4"
BLUE = "#2563EB"
ORANGE = "#F97316"
YELLOW = "#F4C542"
ASSET_DIR = Path(__file__).parent / "assets"


def setup_axes(x_label: str, y_label: str):
    figure, axes = plt.subplots(figsize=(16, 9), dpi=100)
    figure.patch.set_facecolor(BACKGROUND)
    axes.set_facecolor(BACKGROUND)
    axes.spines["top"].set_visible(False)
    axes.spines["right"].set_visible(False)
    axes.spines["bottom"].set_color(INK)
    axes.spines["left"].set_color(INK)
    axes.tick_params(colors=INK, labelsize=15)
    axes.grid(color=GRID, linewidth=1, alpha=0.65)
    axes.set_xlabel(x_label, color=INK, fontsize=18, labelpad=12)
    axes.set_ylabel(y_label, color=INK, fontsize=18, labelpad=12, rotation=0)
    return figure, axes


def save(figure, filename: str):
    figure.savefig(
        ASSET_DIR / filename,
        facecolor=BACKGROUND,
        bbox_inches="tight",
        pad_inches=0.18,
    )
    plt.close(figure)


def plot_value_and_rate(show_tangent: bool):
    figure, axes = setup_axes("time, $t$", "position, $s$")
    time = np.linspace(0, 3.2, 400)
    position = time**2

    axes.plot(time, position, color=BLUE, linewidth=5)
    axes.scatter([2], [4], s=180, color=ORANGE, zorder=5)
    axes.axvline(2, ymin=0, ymax=4 / 8.5, color=MUTED, linestyle="--", linewidth=2)
    axes.axhline(4, xmin=0, xmax=2 / 3.2, color=MUTED, linestyle="--", linewidth=2)
    axes.annotate(
        "$s(2)=4$",
        xy=(2, 4),
        xytext=(2.32, 2.4),
        color=INK,
        fontsize=22,
        arrowprops={"arrowstyle": "->", "color": INK, "linewidth": 2},
    )

    if show_tangent:
        tangent_time = np.linspace(0.9, 3.15, 100)
        tangent_position = 4 + 4 * (tangent_time - 2)
        axes.plot(
            tangent_time,
            tangent_position,
            color=ORANGE,
            linewidth=4,
            linestyle="--",
        )
        axes.annotate(
            "instantaneous rate\n$s'(2)=4$",
            xy=(2.55, 6.2),
            xytext=(2.72, 5.35),
            color=ORANGE,
            fontsize=21,
            fontweight="bold",
            ha="left",
            arrowprops={"arrowstyle": "->", "color": ORANGE, "linewidth": 2},
        )

    axes.set_xlim(0, 3.2)
    axes.set_ylim(0, 8.5)
    axes.set_xticks([0, 1, 2, 3])
    axes.set_yticks([0, 2, 4, 6, 8])
    figure.tight_layout()
    return figure


def draw_direction_field(axes):
    x_points = np.linspace(-2.4, 2.4, 17)
    y_points = np.linspace(-1.5, 6.5, 15)
    for x_value in x_points:
        slope = 2 * x_value
        norm = np.sqrt(1 + slope**2)
        delta_x = 0.11 / norm
        delta_y = slope * delta_x
        for y_value in y_points:
            axes.plot(
                [x_value - delta_x, x_value + delta_x],
                [y_value - delta_y, y_value + delta_y],
                color=MUTED,
                linewidth=1.7,
                alpha=0.72,
                solid_capstyle="round",
            )


def plot_direction_field(show_solution: bool):
    figure, axes = setup_axes("$x$", "$y$")
    draw_direction_field(axes)

    if show_solution:
        x_values = np.linspace(-2.6, 2.6, 500)
        axes.plot(x_values, x_values**2 + 1, color=ORANGE, linewidth=5, zorder=4)
        axes.scatter([0], [1], color=YELLOW, edgecolor=INK, linewidth=2, s=220, zorder=5)
        axes.annotate(
            "one curve that follows\nevery local slope",
            xy=(1.25, 2.56),
            xytext=(1.48, 5.15),
            color=INK,
            fontsize=20,
            ha="left",
            arrowprops={"arrowstyle": "->", "color": INK, "linewidth": 2},
        )

    axes.set_xlim(-2.7, 2.7)
    axes.set_ylim(-1.7, 6.7)
    axes.set_xticks([-2, -1, 0, 1, 2])
    axes.set_yticks([-1, 0, 1, 2, 3, 4, 5, 6])
    figure.tight_layout()
    return figure


def plot_solution_family(highlight_initial_condition: bool):
    figure, axes = setup_axes("$x$", "$y$")
    x_values = np.linspace(-2.6, 2.6, 500)
    constants = [-2, 0, 1, 3]
    colors = ["#9CA3AF", "#7C8BA1", ORANGE, "#64748B"]

    for constant, color in zip(constants, colors):
        if highlight_initial_condition and constant != 1:
            color = "#C9C6BE"
            alpha = 0.45
            width = 3
        else:
            alpha = 1
            width = 5 if constant == 1 and highlight_initial_condition else 4
        axes.plot(
            x_values,
            x_values**2 + constant,
            color=color,
            linewidth=width,
            alpha=alpha,
        )

        if not highlight_initial_condition:
            label_x = 1.63
            label_y = label_x**2 + constant
            axes.text(
                label_x + 0.12,
                label_y,
                f"$C={constant}$",
                color=color,
                fontsize=17,
                va="center",
            )

    if highlight_initial_condition:
        axes.scatter([0], [1], color=YELLOW, edgecolor=INK, linewidth=2, s=240, zorder=5)
        axes.annotate(
            "$y(0)=1$ selects $C=1$",
            xy=(0, 1),
            xytext=(0.55, -0.45),
            color=INK,
            fontsize=22,
            fontweight="bold",
            arrowprops={"arrowstyle": "->", "color": INK, "linewidth": 2},
        )

    axes.set_xlim(-2.7, 2.7)
    axes.set_ylim(-2.5, 8)
    axes.set_xticks([-2, -1, 0, 1, 2])
    axes.set_yticks([-2, 0, 2, 4, 6, 8])
    figure.tight_layout()
    return figure


def main():
    ASSET_DIR.mkdir(parents=True, exist_ok=True)
    save(plot_value_and_rate(False), "01-value-at-a-time.png")
    save(plot_value_and_rate(True), "02-rate-at-a-time.png")
    save(plot_direction_field(False), "03-rate-rule.png")
    save(plot_direction_field(True), "04-rate-rule-with-solution.png")
    save(plot_solution_family(False), "05-solution-family.png")
    save(plot_solution_family(True), "06-initial-condition.png")


if __name__ == "__main__":
    main()
