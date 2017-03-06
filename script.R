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

#Testing:
dataset <- iris[, 1:3]
method <- "t_test"

#Outcome: 

if (is.null(method)) {
    outcome <- "Please select the statiscical test" #"Please select at least 2 variables"
    Warning_msg <- ""
} else if (method == "t_test") {
    if (!exists("dataset") | dim(dataset)[2] < 2) {
        outcome = "Please select 2 variables"
    } else {
        summary_t_test1 <- summary(dataset[, 1:2])
        summary_t_test <- rbind(colnames(summary_t_test), summary_t_test)
        stat_test <- t.test(dataset[, 1:2])
        options(digits = 2)
        T <- data.frame(format(round(stat_test$statistic, 2), nsmall = 2), row.names = NULL)
        P <- data.frame(format(round(stat_test$p.value, 5), nsmall = 5), row.names = NULL)
        Comment <- ifelse(stat_test$p.value >= 0.05, "The averages of the 2 variables are significantly similar", "The averages of the 2 variables are significantly different")
        outcome <- data.frame(cbind(T, P, Comment))
        rownames(outcome) <- " "
        colnames(outcome) <- c("t-test value", "p-value", "Comment")
        Warning_msg <- if (dim(dataset)[2] > 2) {
            paste("Only the following 2 variables were used: ", colnames(dataset[1]), "and", colnames(dataset[2]), sep = " ")
        } else { "" }
        }

} else if (method == chi_square) {
    if (!exists("dataset") | dim(dataset)[2] < 2) {
        outcome = "Please select 2 variables"
    } else {
        chi_table <- table(factor(datasets[, 1]), factor(datasets[, 2]))
        chi_test <- chisq.test(chi_table)
        options(digits = 2)
        chi_score <- chi_test$statistic
        chi_pv <- chi_test$p.value
        Comment <- ""
        outcome <- data.frame(cbind(chi_score, chi_pv, Comment))
        colnames(outcome) <- c("Chi-Square value", "p-value", "Comment")
        Warning_msg <- if (dim(dataset)[2] > 2) {
            paste("Only the following 2 variables were used: ", colnames(dataset[1]), "and", colnames(dataset[2]), sep = " ")
        } else { "" }
        }
}


#Plots themes
theme_def <- ttheme_default()
theme_min <- ttheme_minimal()
theme_blue <- ttheme_minimal(
  core = list(bg_params = list(fill = blues9[c(6,2,2,2,2,2,2,2,2)], col = NA),
            fg_params = list(fontface = 3)),
  colhead = list(fg_params = list(col = "navyblue", fontface = 4L)),
  rowhead = list(fg_params = list(col = "orange", fontface = 3L)))

n_rows <- if (Warning_msg == "") { 2 } else { 3 }



#Plots

if (is.null(method)) {
    n_rows <- 1
    grid.arrange(
  tableGrob(outcome, theme = theme_blue),
  nrow = n_rows)
} else if (method == "t_test") {
    grid.arrange(
    tableGrob(summary_t_test, theme = theme_blue, cols = colnames(dataset[, 1:2])),
    tableGrob(outcome, theme = theme_def),
    tableGrob(Warning_msg, theme = theme_min),
    nrow = n_rows,
    ncol = 1
    )
} else { NULL }




grid.arrange(
  tableGrob(outcome, theme = theme_blue),
  tableGrob(outcome_chi, theme = theme_def),
  nrow = n_rows)























par(mfrow = c(3, 1))
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

plot.new()
vps <- baseViewports()
pushViewport(vps$figure)
vp1 <- plotViewport()
grid.table(outcome_chi)
popViewport()


## Formatting reference 
tt1 <- ttheme_default()
tt2 <- ttheme_minimal()
tt3 <- ttheme_minimal(
  core = list(bg_params = list(fill = blues9[1:4], col = NA),
            fg_params = list(fontface = 3)),
  colhead = list(fg_params = list(col = "navyblue", fontface = 4L)),
  rowhead = list(fg_params = list(col = "orange", fontface = 3L)))

grid.arrange(
  tableGrob(iris[1:4, 1:2], theme = tt1),
  tableGrob(iris[1:4, 1:2], theme = tt2),
  tableGrob(iris[1:4, 1:2], theme = tt3),
  nrow = 1)

















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


tt2 <- ttheme_minimal()
tt3 <- ttheme_minimal(
  core = list(bg_params = list(fill = blues9[1:4], col = NA),
            fg_params = list(fontface = 3)),
  colhead = list(fg_params = list(col = "navyblue", fontface = 4L)),
  rowhead = list(fg_params = list(col = "orange", fontface = 3L)))

grid.arrange(
  tableGrob(tbl, theme = tt3),
  tableGrob(outcome_chi, theme = tt2),
  nrow = 2)





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




aaa <- iris[1:3]
colnames(aaa[3])


if (dim(aaa)[2] > 2) { paste("Only the following 2 variables were used: ", colnames(aaa[1]), colnames(aaa[2]), sep = " ") } else { NULL }










