
library(MASS)
library(gridExtra)
library(grid)

tbl = table(survey$Smoke, survey$Exer)
a <- chisq.test(tbl)

a$method
grid.table(tbl)

plot(tbl)

d <- t.test( iris[, 1:3])
grid.table(a)
options(digits = 2)
T <- data.frame(format(round(d$statistic, 2), nsmall = 2), row.names = NULL)

P <- data.frame(format(round(d$p.value, 5), nsmall = 5), row.names = NULL)
Comment <- ifelse(d$p.value >= 0.05, "The variables are not significantly different", "The variables are significantly different")
b <- data.frame(cbind(T,P,Comment))
rownames(b) <- " "
colnames(b) <- c("t", "p-value", "Comment")
grid.table(b)