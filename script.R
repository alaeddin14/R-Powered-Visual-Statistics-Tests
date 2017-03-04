###############Library Declarations###############

libraryRequireInstall = function(packageName, ...) {
    if (!require(packageName, character.only = TRUE))
        warning(paste("*** The package: '", packageName, "' was not installed ***", sep = ""))
    }

libraryRequireInstall("gridExtra")
libraryRequireInstall("grid")
libraryRequireInstall("MASS")
libraryRequireInstall("ggplot2")
libraryRequireInstall("gridBase")
libraryRequireInstall("gridExtra")



t_dataset <- as.data.frame(iris[, 1:3])
chi_dataset <- as.data.frame(survey[, c("Smoke", "Exer")])

if (!exists("dataset") && exists("Values"))
    dataset = Values


tl.col = "red"
if (exists("settings_labels_params_tl_col"))
    tl.col = settings_labels_params_tl_col

textSize = 1
if (exists("settings_labels_params_textSize"))
    textSize = settings_labels_params_textSize


method = NULL
if (exists("settings_statistics_test"))
    method = settings_statistics_test


#Outcome: 

if (method = NULL) {
    outcome <- "Please select the statiscical test" #"Please select at least 2 variables"
} else if (method = t_test) {
    if (!exists("dataset") | dim(dataset)[,2]<2) {
        outcome = "Please select 2 variables"
    } else {
        stat_test <- t.test(dataset)
        options(digits = 2)
        T <- data.frame(format(round(stat_test$statistic, 2), nsmall = 2), row.names = NULL)
        P <- data.frame(format(round(stat_test$p.value, 5), nsmall = 5), row.names = NULL)
        Comment <- ifelse(stat_test$p.value >= 0.05, "The variables are not significantly different", "The variables are significantly different")
        outcome <- data.frame(cbind(T, P, Comment))
        rownames(outcome) <- " "
        colnames(outcome) <- c("t-test value", "p-value", "Comment")
    }

} else if (method = chi_square) {
    if (!exists("dataset") | dim(dataset)[, 2] < 2) {
        outcome = "Please select 2 variables"
    } else {
        chi_table <- table(factor(datasets[, 1]), factor(datasets[, 2]))
        chi_test <- chisq.test(chi_table)
        chi_score <- chi_test$statistic
        chi_pv <- chi_test$p.value
        Comment <- ""
        outcome <- data.frame(cbind(chi_score, chi_pv, Comment))
        colnames(outcome) <- c("Chi-Square value", "p-value", "Comment")
    }
}





par(mfrow = c(2, 1))
plot.new()
vps <- baseViewports()
pushViewport(vps$figure)
vp1 <- plotViewport()
grid.table(tbl)
popViewport()

plot.new()
vps <- baseViewports()
pushViewport(vps$figure)
vp1 <- plotViewport()
grid.table(outcome_chi)
popViewport()





















#######################################################

DDT <- as.data.frame(survey[, c("Smoke", "Exer")])

tbl = table(factor(survey$Smoke), factor(survey$Exer))
a <- chisq.test(tbl)

chi <- a$statistic
pv <- a$p.value
outcome_chi <- data.frame(cbind(chi, pv))
rownames(outcome_chi) <- " "
colnames(outcome_chi) <- c("chi-test value", "p-value")

par(mfrow = c(2, 1))
grid.table(tbl)
grid.table(outcome_chi)

p1 <- tableGrob(tbl)
p2 <- tableGrob(outcome_chi)
par(mfrow = c(2, 1))
layout(matrix(c(1, 1), 2, 1, byrow = TRUE))
grid.arrange(p1)
grid.arrange(p2)

stat_test <- t.test(dataset)
options(digits = 2)
T <- data.frame(format(round(stat_test$statistic, 2), nsmall = 2), row.names = NULL)

P <- data.frame(format(round(stat_test$p.value, 5), nsmall = 5), row.names = NULL)
Comment <- ifelse(stat_test$p.value >= 0.05, "The variables are not significantly different", "The variables are significantly different")
outcome <- data.frame(cbind(T, P, Comment))
rownames(outcome) <- " "
colnames(outcome) <- c("t-test value", "p-value", "Comment")
grid.table(b)




par(mfrow = c(2, 1))
plot.new()
vps <- baseViewports()
pushViewport(vps$figure)
vp1 <- plotViewport()
grid.table(tbl)
popViewport()

plot.new()
vps <- baseViewports()
pushViewport(vps$figure)
vp1 <- plotViewport()
grid.table(outcome_chi)
popViewport()




