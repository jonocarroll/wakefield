#' Generate Random Vector of Religions
#'
#' Generate a random vector of religion.
#'
#' @details The religion and probabilities used match approximate world
#' religion make-up (from \href{http://www.pewforum.org/}{Pew Research Center}).  
#' The default make up is:
#'
#' \tabular{lrr}{
#'   \bold{ Religion} \tab \bold{N} \tab \bold{Percent} \cr
#'   Christian \tab 2,173,260,000 \tab 31.48 \%\cr
#'   Muslim    \tab 1,599,280,000 \tab 23.16 \%\cr
#'   None      \tab 1,127,000,000 \tab 16.32 \%\cr
#'   Hindu     \tab 1,034,620,000 \tab 14.99 \%\cr
#'   Buddhist  \tab   489,030,000 \tab 7.08 \% \cr
#'   Folk      \tab   406,140,000 \tab 5.88 \% \cr
#'   Other     \tab    59,330,000 \tab  .86 \% \cr
#'   Jewish    \tab    15,670,000 \tab  .23 \% \cr
#' }
#'
#' @inheritParams r_sample_factor
#' @return Returns a random factor vector of religion elements.
#' @keywords religion
#' @references \url{http://www.pewforum.org/2012/12/18/table-religious-composition-by-country-in-numbers}
#' @export
#' @include utils.R r_sample.R
#' @family variable functions
#' @examples
#' religion(10)
#' barplot(table(religion(10000)))
#' pie(table(religion(10000)))
religion <- hijack(r_sample_factor,
    name = "Religion",
    x = c("Christian", "Muslim", "None", "Hindu", "Buddhist", "Folk", "Other", "Jewish"),
    prob = c(0.31477, 0.23163, 0.16323, 0.14985, 0.07083, 0.05882, 0.00859, 0.00227)
)

## pacman::p_load(dplyr, curl, qdapRegex)
##
## m <- read.csv(curl("https://raw.githubusercontent.com/ramnathv/data/gh-pages/all/pew_religion_religionByCountry.csv"))
## 
## m[, -1] <- lapply(m[, -1], function(x) {
##     as_numeric(sapply(rm_number(x, extract= TRUE), paste, collapse=""))
## })
## 
## 
## c(apply(m[, -1], 2, sum)) %>%
##     vect2df("Religion", "Total") %>%
##     mutate(
##         Proportion = Total/sum(Total),
##         Percent = paste(round(100*Proportion, 2), "\\%"),
##         Proportion = round(Proportion, 5),
##         Total = format(Total,  big.mark = ",", scientific=FALSE),
##         Religion = gsub("^U.+", "None", gsub("\\..+", "", Religion))
##     ) %>%
##     arrange(desc(Proportion)) %>%
##     #select(1, 3) %>% dput
##     select(-3) %>%
##     tabular() %>%
##     cat(file="clipboard")

