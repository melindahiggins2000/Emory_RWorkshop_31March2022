# ====================================
# PART 01 - Introduction to R Objects
# ====================================

# run calculations in temporary memory
# output to the console
4 + 4
sqrt(25)

# save these data in objects
# these placed into temporary memory
# see Global Environment
add4s <- 4 + 4
x <- 25
sqrtx <- sqrt(x)

# make some vectors
id <- c(1,2,3,4,5,6,7,8,9,10)
age <- seq(from=21, to=30, by=1)
agesq <- age * age
ht <- c(61, 73, 64, 67, 70, 68, 73, 63, 62, 74)

# combine these into a data.frame
agedat <- data.frame(id, age, agesq, ht)

# get dimensions of data
dim(agedat)

# see structure of data
str(agedat)

# look at top 6 rows of data
# or bottom 3 rows
head(agedat)
tail(agedat, n=3)

# make a simple plot
plot(x=agedat$age, y=agedat$agesq)

# create new variable height in decimal feet
agedat$htfeet <- agedat$ht/12

# ====================================
# EXERCISE
# make a plot of Height in Feet (Y, vertical axis)
# by age (X, horizontal axis)

