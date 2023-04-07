# corrplots

Calculates Pearson, Spearman and Kendall correlation coefficients, adds their statistical significance and correlation plots.

You may access the function corplots inside the package corrplots using corrplots::corplots.

# How to use this package. Follow the steps below and copy & paste one line at a time:

a) Import the data named 'dat' in R first, all data must be numeric and without 'Date' column.

b) install.packages("devtools")  

c) library(devtools)

d) install_github('Ntare2013/corrplots')

e) library(corrplots)

f) par(mar = c(1, 1, 1, 1))   # To increase plot area

g) corrplots::corplots(dat)

h) title(main = "Correlation coefficients and scatter plots", line = 0)

i) mtext(quote(paste(italic("Significance levels"), ":" , " (***) for " , 0 < {p <= 0.001 }, ";" , "  (**) for " , 0.001 < {p <= 0.01 },";" , "  (*) for " , 0.01 < {p <= 0.05 },";" , italic("  Otherwise, insignificant"))), cex = 0.7, side = 1, line = -0.4)
