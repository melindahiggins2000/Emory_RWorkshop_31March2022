# ====================================
# PART 02 - Read in data, dplyr data wrangling
# ====================================

# To read in the data, we will use the
# readr package. What are "packages"?
# look at current session details
sessionInfo()

# Learn more at 
# https://cran.r-project.org/
# also see https://www.datacamp.com/community/tutorials/r-packages-guide
# install readr - got to Tools/Install Packages
# or type 
# install.packages("readr")

# after installing the package
# you have to "load" is using library()
# Let's read in the hospital_ops.csv dataset
library(readr)

# now look at session details
sessionInfo()

# Let's read in the hospital_ops.csv dataset
# using read_csv() from readr package
hospital_ops <- read_csv("hospital_ops.csv")

# ====================================
# EXERCISE
# How many rows and columns are in hospital_ops?



# ====================================

# a quick easy way to get a list of all
# of the variable names in this dataset
names(hospital_ops)

# ====================================
# EXERCISE
# Using the plot() function,
# make a scatterplot for
# x=Count_Staff_Shortage_Yes and
# y=Pct_Patients_Covid
# for the dataset hospital_ops
# HINT: use data$varname format



# ====================================

# TIDYVERSE
# see https://www.tidyverse.org/
# load the ggplot2 package
library(ggplot2)

# redo plot above using ggplot2
ggplot(data = hospital_ops,
       aes(x = Count_Staff_Shortage_Yes,
           y = Pct_Patients_Covid)) +
  geom_point()

# add colors for Jan and Feb
# Month 1 or 2
ggplot(data = hospital_ops,
       aes(x = Count_Staff_Shortage_Yes,
           y = Pct_Patients_Covid)) +
  geom_point(aes(color = Month))

# Let's add some labels for the months
# create Month.f as a "factor" type variable
hospital_ops$Month.f <-
  factor(hospital_ops$Month,
         levels = c(1, 2),
         labels = c("Jan", "Feb"))

# get frequencies of months
table(hospital_ops$Month.f, useNA = "ifany")

# make plot again, set color to Month.f
ggplot(data = hospital_ops,
       aes(x = Count_Staff_Shortage_Yes,
           y = Pct_Patients_Covid)) +
  geom_point(aes(color = Month.f))

# load dplyr package for a little
# data wrangling
library(dplyr)

# sorting data
# look at the 5 rows with the lowest Bed_Utilization
hospital_ops %>%
  arrange(Bed_Utilization) %>%
  head(n=5)

# selecting variables
# select Month, State, and Bed_Utilization
# and then get 5 rows with
# lowest Bed_Utilization
hospital_ops %>%
  select(Month, State, Bed_Utilization) %>%
  arrange(Bed_Utilization) %>%
  head(n=5)

# filtering out rows
# do this again but let's only
# look at Month == 1 (Jan)
hospital_ops %>%
  select(Month, State, Bed_Utilization) %>%
  arrange(Bed_Utilization) %>%
  filter(Month == 1) %>%
  head(n=5)

# ====================================
# EXERCISE
# using the functions above
# find the 10 rows with
# the largest Pct_Patients_Covid values
# only show these variables:
# Month.f, State, Pct_Patients_Covid


# ====================================

# let's combine these to filter
# out the outlier with values > 60
# let's keep Count_Staff_Shortage_Yes < 60
# and then remake the plot we just did

hospital_ops2 <- hospital_ops %>%
  filter(Count_Staff_Shortage_Yes < 60)

# and let's add a title
ggplot(data = hospital_ops2,
       aes(x = Count_Staff_Shortage_Yes,
           y = Pct_Patients_Covid)) +
  geom_point(aes(color = Month.f)) +
  labs(title = "Proportion of Patients with COVID by Number of Hospitals with Staff Shortages by State and Month")

# add smoothed lines by group
# move group color up to main data step
# add better labels for both X nd Y axes
ggplot(data = hospital_ops2,
       aes(x = Count_Staff_Shortage_Yes,
           y = Pct_Patients_Covid,
           color = Month.f)) +
  geom_point() +
  geom_smooth() + 
  labs(title = "Proportion of Patients with COVID by Number of Hospitals with Staff Shortages by State and Month") +
  xlab("Number Hospitals in State with Staff Shortages") +
  ylab("Proportion of Patients with COVID in State")

# ====================================
# EXERCISE
# using the original data hospital_ops
# make a scatterplot of 
# x = Count_Beds
# y = Bed_Utilization_Covid
# color = Month.f
# add smoothed fit lines by group
# update title and axes labels


# ====================================
