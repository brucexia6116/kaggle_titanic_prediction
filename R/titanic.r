#This code scores 0.80383

# The train and test_new data is stored in the ../input directory
library(rpart)
library(rattle)
library(rpart.plot)
library(RColorBrewer)

# train_new and test_new are new datasets where the Title is included as a feature

train_new <- read.csv("~/Documents/QMUL/DM/Titanic_Savers/RCode/train_new.csv") #importing training set
test_new <- read.csv("~/Documents/QMUL/DM/Titanic_Savers/RCode/test_new.csv")

# Finish the command
my_tree_five <- rpart(Survived ~ Pclass + Sex + CalculatedAge + SibSp + Parch + Fare + Embarked + Title,
                      data = train_new, method = "class")

# Make prediction
my_prediction <- predict(my_tree_five, test_new, type = "class")

# Make results ready for submission
my_solution <- data.frame(PassengerId = test_new$PassengerId, Survived = my_prediction)
write.csv(my_solution, file = "~/Documents/QMUL/DM/Titanic_Savers/decision_tree.csv", row.names = FALSE)
