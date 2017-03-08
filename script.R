###############Library Declarations###############

libraryRequireInstall = function(packageName, ...) {
    if (!require(packageName, character.only = TRUE))
        warning(paste("*** The package: '", packageName, "' was not installed ***", sep = ""))
    }

libraryRequireInstall("gridExtra")
libraryRequireInstall("grid")
#libraryRequireInstall("MASS")
libraryRequireInstall("ggplot2")
libraryRequireInstall("gridBase")
#libraryRequireInstall("gridExtra")



t_dataset <- as.data.frame(iris[, 1:3])
chi_dataset <- as.data.frame(survey[, c("Smoke", "Exer", "Sex")])

if (!exists("dataset") && exists("Values"))
    dataset = Values


tl.col = "blue"
if (exists("settings_labels_params_tl_col"))
    tl.col = settings_labels_params_tl_col



method = NULL
if (exists("settings_stats_tests_params_statistics_test"))
    method = settings_statistics_test

Confidence = "95%"
if (exists("settings_stats_tests_params_Confidence_Level"))
    Confidence = settings_statistics_test

if (Confidence == "95%") {
    significance_level <- 0.05
} else if (Confidence == "90%") {
    significance_level <- 0.1
} else if (Confidence == "99%") {
    significance_level <- 0.01
}






#Testing:
dataset <- t_dataset #t_dataset  #chi_dataset
method <- "t_test" #"t_test"  #"chi_square"

#Outcome: 

if (is.null(method)) {
    outcome <- "Please select the statiscical test" #"Please select at least 2 variables"
    Warning_msg <- ""
} else if (method == "t_test") {
    if (!exists("dataset") | dim(dataset)[2] < 2) {
        outcome = "Please select 2 variables"
    } else {
        summary_t_test1 <- summary(dataset[, 1:2])
        summary_t_test <- rbind(colnames(summary_t_test1), summary_t_test1)
        stat_test <- t.test(dataset[, 1:2])
        options(digits = 3)
        T <- data.frame(format(round(stat_test$statistic, 2), nsmall = 2), row.names = NULL)
        P <- data.frame(format(round(stat_test$p.value, 5), nsmall = 5), row.names = NULL)
        Comment <- ifelse(stat_test$p.value >= significance_level, "The averages of the 2 variables are significantly similar", "The averages of the 2 variables are significantly different")
        outcome <- data.frame(cbind(T, P, Comment))
        rownames(outcome) <- " "
        colnames(outcome) <- c("t-test value", "p-value", "Comment")
        Warning_msg <- if (dim(dataset)[2] > 2) {
            paste("Only the following 2 variables were used: ", colnames(dataset[1]), "and", colnames(dataset[2]), sep = " ")
        } else { "" }
        }

} else if (method == "chi_square") {
    if (!exists("dataset") | dim(dataset)[2] < 2) {
        outcome = "Please select 2 variables"
    } else {
        chi_table <- table(factor(dataset[, 1]), factor(dataset[, 2]))
        chi_test <- chisq.test(chi_table)
        #options(digits = 2)
        chi_score <- chi_test$statistic
        chi_pv <- chi_test$p.value
        Comment <- ifelse(chi_test$p.value >= significance_level,
            paste("There is no relationship between", names(dataset)[1], "and", names(dataset)[2], sep = " "),
            paste("There is a relationship between", names(dataset)[1], "and", names(dataset)[2], sep = " ")
        )
        #options(digits = 2)
        outcome <- data.frame(cbind(format(round(chi_score, 3), nsmall = 2), format(round(chi_pv, 3), nsmall = 2), Comment))
        colnames(outcome) <- c("Chi-Square value", "p-value", "Comment")
        Warning_msg <- if (dim(dataset)[2] > 2) {
            paste("Only the following 2 variables were used: ", colnames(dataset[1]), "and", colnames(dataset[2]), sep = " ")
        } else { paste("") }
        }
}



#Plots themes
theme_def <- ttheme_default()
theme_min <- ttheme_minimal()
theme_blue <- ttheme_minimal(
  core = list(bg_params = list(fill = blues9[c(6,2,2,2,2,2,2,2,2)], col = NA),
            fg_params = list(fontface = 3)),
  colhead = list(fg_params = list(col = tl.col, fontface = 4L)),
  rowhead = list(fg_params = list(col = tl.col, fontface = 3L)))
theme_blue2 <- ttheme_minimal(
  core = list(bg_params = list(fill = blues9[c(2, 2, 2, 2, 2, 2, 2, 2, 2)], col = NA),
            fg_params = list(fontface = 3)),
  colhead = list(fg_params = list(col = tl.col, fontface = 4L)),
  rowhead = list(fg_params = list(col = tl.col, fontface = 3L)))
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
} else if (method == "chi_square") {
    grid.arrange(
        tableGrob(chi_table, theme = theme_blue2),
        tableGrob(outcome, theme = theme_def),
        tableGrob(Warning_msg,theme=theme_min),
    nrow = 3,
    ncol = 1
        )
}


