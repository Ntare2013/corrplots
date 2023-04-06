#' Computes all three measures of correlation and adds scatter plots
#' @export
#' @keywords internal

corplots = function(dt, group){
  # Customize the lower panel: correlation coefficients
  correlation.panel = function(x, y){
    usr = par("usr"); on.exit(par(usr))
    par(usr = c(0, 1, 0, 1))

    # 3 types of correlation
    rp = round(cor(x, y, method = "pearson", use = "complete.obs"),
               digits = 2)
    r2 <- cor.test(x, y, method = "pearson")$p.value
    r3 <- symnum(r2, cutpoints = c(0, 0.001, 0.01, 0.05, 1), symbols = c("***","**","*",""))
    text(0.5, 0.75, paste("r  = ", rp, r3))

    rs = round(cor(x, y, method = "spearman", use = "complete.obs"),
               digits = 2)
    r4 <- cor.test(x, y, method = "spearman")$p.value
    r5 <- symnum(r4, cutpoints = c(0, 0.001, 0.01, 0.05, 1), symbols = c("***","**","*",""))

    text(0.5, 0.5, bquote(~rho~" = "~.(rs)~.(r5)))

    rk = round(cor(x, y, method = "kendall", use = "complete.obs"),
               digits = 2)
    r6 <- cor.test(x, y, method = "kendall")$p.value
    r7 <- symnum(r6, cutpoints = c(0, 0.001, 0.01, 0.05, 1), symbols = c("***","**","*",""))
    text(0.5, 0.25, bquote(~tau~" = "~.(rk)~.(r7)))
  }

  # Customize upper panel: scatter plots
  scatterplot.panel = function(x, y){
    points(x, y, pch = 20, col = "black", cex = 0.7)
  }

  pairs(dt,
        lower.panel = correlation.panel,
        upper.panel = scatterplot.panel)

  title(main = "Correlation coefficients and scatter plots", line = 0)
  mtext(quote(paste(italic("Significance levels"), ":" , " (***) for " , 0 < {p <= 0.001 }, ";" , "  (**) for " , 0.001 < {p <= 0.01 },";" , "  (*) for " , 0.01 < {p <= 0.05 },";" , italic("  Otherwise, insignificant"))), cex = 0.7, side = 1, line = -0.4)

  par(mar = c(1, 1, 1, 1))

}
