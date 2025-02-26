# Exercise 2: working with data frames

# Create a vector of 100 employees ("Employee 1", "Employee 2", ... "Employee 100")
# Hint: use the `paste()` function and vector recycling to add a number to the word
# "Employee"
employees <- paste("Employee", 1:100)

# Create a vector of 100 random salaries for the year 2017
# Use the `runif()` function to pick random numbers between 40000 and 50000
random_salaries <- runif(100, 40000, 50000)

# Create a vector of 100 salaries in 2018 that have changed from 2017
# Use `runif()` to add a random number between -5000 and 10000 to each of 2017's
# salaries (the negative number means that a salary may have decreased!)
changed_salaries <- random_salaries + runif(100, -5000, 10000)

# Create a data frame 'salaries' by combining the 3 vectors you just made
# Remember to set `stringsAsFactors=FALSE`!
salaries <- data.frame(employees, random_salaries, changed_salaries, stringsAsFactors = FALSE)

# Create a column 'change' that stores each person's change in salary between
# 2017 and 2018
salaries$changes <- changed_salaries - random_salaries

# Create a column 'got_raise' that is TRUE if the person got a raise (their
# salary went up)
salaries$got_raise <- (changed_salaries - random_salaries) > 0


### Retrieve values from your data frame to answer the following questions
### Note that you should get the value as specific as possible (e.g., a single
### cell rather than the whole row!)

# What was the 2018 salary of employee 57
employee_57 <- salaries[salaries$employees == "Employee 57", "changed_salaries"]

# How many employees got a raise?
nrow(salaries[salaries$got.raise == TRUE,])

# What was the dollar value of the highest raise?
max_raise <- max(salaries$changes)

# What was the "name" of the employee who received the highest raise?
big_shot <- salaries[salaries$changes == max_raise, "employees"]

# What was the largest decrease in salaries between the two years?
slacker <- min(salaries$changes)
# What was the name of the employee who recieved largest decrease in salary?
slacker_identified <- salaries[salaries$change == slacker, "employees"]

# What was the average salary change?


# For people who did not get a raise, how much money did they lose on average?


## Consider: do the above averages match what you expected them to be based on 
## how you generated the salaries?

# Write a .csv file of your salary data to your working directory
write.csv(salaries, 'salarydata.csv')
