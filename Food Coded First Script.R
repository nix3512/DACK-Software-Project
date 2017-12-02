### DACK Project - Food Coded

# Overview: 125 responses from Mercyhurst University (Catholic Liberal Arts University in Pennsylvania)

#------------------------------#
# Initialise your environment  #
#------------------------------#

# install the following package
install.packages("dplyr")
install.packages("ggplot2")
library("dplyr")
library("ggplot2")
library("stringr")

# get R directory
setwd("C:/Users/Nix3512/Documents/R/DAWR Directory")

# import the dataset
food <- read.csv(file = "food_coded.csv")
View(food)

# preliminary check on attributes
nrow(food)
ncol(food)
rownames(food)
colnames(food)
attributes(food)
class(food)
dim(food)
names(food)
str(food)
glimpse(food)


#-------------------------#
# Cleaning the dataframe  #
#-------------------------#

# used to eliminate rows with NaN
nonafood <- na.omit(food)

# select only numeric columns of data frame
numfood <- select_if(food, is.numeric)

# extracting chosen columns as a new dataframe
testfood <- select(food, GPA, Gender, weight)
View(testfood)

# eliminating irrelevent text from numeric columns
tf <- lapply(testfood, gsub, pattern='[[:alpha:]]', replacement='')
tf <- lapply(tf, gsub, pattern=' ', replacement='')
tf <- lapply(tf, gsub, pattern=',', replacement='')
tf <- lapply(tf, gsub, pattern="'\\.", replacement='')
View(tf)
newtf <- data.frame(tf, stringsAsFactors = FALSE)
is.na(newtf) <- newtf==""
newtf <- na.omit(newtf)
str(newtf)
newtf$GPA <- as.numeric(as.character(newtf$GPA))
newtf$weight <- as.numeric(as.character(newtf$weight))
View(newtf)



#----------------------------#
# Testing codes as Practice  #
#----------------------------#

my_dataframe <- data.frame(GPA = c(3.5, NaN, 4.0, 4.0, 3.5, 3.0, 4.0), 
                           Gender = c(1, 2, "Not Answering It", 2, 2, 1, 1),
                           Weight = c("65 lbs", 55, 40, 50, 60, 40, 40),
                           stringsAsFactors = FALSE)
dim(my_dataframe)
str(my_dataframe)
attributes(my_dataframe)
View(my_dataframe)

df <- lapply(my_dataframe, gsub, pattern='[[:alpha:]]', replacement='')
df <- lapply(df, gsub, pattern=' ', replacement='')
View(df)
newdf <- data.frame(df, stringsAsFactors = FALSE)
is.na(newdf) <- newdf==""
newdf
newdf1 <- na.omit(newdf)
str(newdf1)
newdf1$GPA <- as.numeric(as.character(newdf1$GPA))
newdf1$Weight <- as.numeric(as.character(newdf1$Weight))
View(newdf1)
