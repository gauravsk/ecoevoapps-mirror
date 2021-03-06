# standard ggplot2 theme to use throughout the package
#' @export
theme_apps <- function() {
  ggplot2::theme_minimal() +
    ggplot2::theme(panel.border = ggplot2::element_blank(),
          panel.grid.major = ggplot2::element_blank(),
          panel.grid.minor = ggplot2::element_blank(),
          axis.line = ggplot2::element_line(colour = "black"),
          plot.tag = ggplot2::element_text(face = "bold"),
          axis.title = ggplot2::element_text(size = 15),
          plot.caption = ggplot2::element_text(size = 15)
    )
}


#' Set origin of ggplot objects to 0,0
#' @param plot ggplot object
#' @export
originator <- function(plot) {
  plot +
    ggplot2::scale_x_continuous(expand = c(0, 0)) +
    ggplot2::scale_y_continuous(expand = c(0, 0))
}
