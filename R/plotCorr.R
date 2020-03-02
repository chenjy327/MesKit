plotCorr <- function(corrMat, use.circle = TRUE, title = NULL){
    corrMat[lower.tri(corrMat)] <- 0
    maxCorr <- max(corrMat[corrMat!=1])
    TSBs <- colnames(corrMat)

    #col_fun <- circlize::colorRamp2(pretty(c(0, maxCorr),6),
    #                                c("#f1eef6", "#d0d1e6", "#a6bddb", "#74a9cf", "#2b8cbe", "#023858"))
    
    col_fun <- circlize::colorRamp2(breaks = seq(0, maxCorr, length = 6),
                                    c("#f1eef6", "#d0d1e6", "#a6bddb", "#74a9cf", "#2b8cbe", "#023858"))

    p <- ComplexHeatmap::Heatmap(
        corrMat,
        col = col_fun,
        #rect_gp = grid::gpar(type = "none"),
        rect_gp = grid::gpar(type = "none", col = "white", lwd = 2),
        cell_fun = function(j, i, x, y, width, height, fill) {
            
            if (j > i) {
                if (use.circle) {
                    if(i == 1 & j != i+1) {
                        grid::grid.segments(x, y-height*0.5, x, y)
                    } else if(i != 1 & j == i+1) {
                        grid::grid.segments(x, y, x, y+height*0.5)
                    } else if(i != 1){
                        grid::grid.segments(x, y-height*0.5, x, y+height*0.5)
                    }
                    
                    if(j == ncol(corrMat) & j != i+1){
                        grid::grid.segments(x-width*0.5, y, x, y)        
                    } else if(j < ncol(corrMat) & j == i+1) {
                        grid::grid.segments(x, y, x+width*0.5, y)
                    } else if (j != i+1){
                        grid::grid.segments(x-width*0.5, y, x+width*0.5, y)
                    }
                   
                    grid::grid.circle(
                        x = x,
                        y = y,
                        r = corrMat[i, j] / maxCorr/ 2 * min(grid::unit.c(width, height))*0.7,
                        gp = grid::gpar(
                            fill = col_fun(corrMat[i, j]),
                            col = NA
                        )
                    )
                } else {
                    grid::grid.rect(
                        x = x, y = y,
                        width = 0.99*width,
                        height = 0.99*height,
                        gp = grid::gpar(
                            col = "white",
                            fill = col_fun(corrMat[i, j])
                        )
                    )
                }
                
                grid::grid.text(
                    sprintf("%.2f", corrMat[i, j]),
                    x, y,
                    gp = grid::gpar(fontsize = 10, col = "white")
                )
            }
            
            if (j == i) {
                grid::grid.text(
                    TSBs[i],
                    x = x,
                    y = y,
                    gp = grid::gpar(fontsize = 10)
                )
            }
        },
        column_title = title,
        cluster_rows = FALSE,
        cluster_columns = FALSE,
        show_column_names = FALSE,
        show_row_names = FALSE,
        width = grid::unit(12, "cm"),
        height = grid::unit(12, "cm"),
        heatmap_legend_param = list(
                title = NULL,
                col_fun = col_fun,                
                legend_height = grid::unit(4, "cm")
            )

    )
    return(p)
}
    