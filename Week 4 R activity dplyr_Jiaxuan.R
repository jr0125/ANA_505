#Week 4: dplyr package

#Task: Write the function to get a dataset from Base R: Titanic
#and give the dataframe a new name of your choice
#(hint: you will want your data to be a dataframe. Use the function: as.data.frame(Titanic))

# Load Titanic dataset as dataframe and name it as titantic.
titanic <- as.data.frame(Titanic)

#See the top rows of the data
#TASK: Write the function to see the top rows of the data

# Disply first 3 rows of the data. You can change the number to the number of rows you want to display. (less than 32 for Titantic dataset)
head(titanic, 3)

#Install and call the package dplyr
#TASK: Write the functions to install and call dplyr

# Running the following command to install the dplyr library.
install.packages("dplyr")

# Load dplyr library
library(dplyr)

#Let's just see the Survived and Sex columns
#Task: Write the function to 'select' the Survived and Sex columns 
#(hint: use the 'select' function)
titanic %>% select(Survived, Sex)

#Let's name the dataset with just the two columns, Survived and Sex
#TASK: Write the function to save the two columns as one new dataset
#and give it a name

#Name the new dataset as tit_sur_sex
tit_sur_sex <- titanic %>% select(Survived, Sex)


#Let's get rid of the Sex column in the new dataset created above
#TASK: Write the function that deselects the sex column
#(hint: use the 'select' function to not select a -column)
tit_sur_sex %>% select(!Sex)

#Let's rename a column name
#TASK: Write the function that renames 'Sex' to 'Gender'
tit_sur_sex %>% rename(Gender = Sex)

#Let's make a new dataframe with the new column name
#TASK: Write the function that names a new dataset that includes the 'gender' column
custom_tit <- tit_sur_sex %>% rename(Gender = Sex)

#Let's 'filter' just the males from our dataset
#TASK: Write the function that includes only rows that are 'male'
male_tit <- custom_tit %>% filter(Gender == "Male")

#Let's 'arrange' our data by gender (not the data you just filtered)
#TASK: Write the function to group the data by gender (hint: arrange())
custom_tit %>% arrange(Gender)

#Let's see how many people were examined in the dataset (total the frequency in the original dataframe)
#TASK: Sum the Freq column
#TASK: After you run it, write the total here:2201
titanic %>% summarise(Freq=sum(Freq))

#Since we have a males dataset, let's make a females dataset
#TASK: Write the function that includes only rows that are 'female'
female_tit <- custom_tit %>% filter(Gender == 'Female')

#And now let's join the males and females
#TASK: Write the function that joins the male and female rows 
#(hint: try using 'union' or 'bind_rows')

#Using either union or union_all function. union function does not allow duplicate rows.
union_male_female_tit <- union_all(male_tit, female_tit)


#Optional Task: add any of the other functions 
#you learned about from the dplyr package

#groupby is used to collect identical data into groups on DataFrame and perform aggregate functions on the grouped data.
titanic %>% group_by(Class)
