Iris Species Classification
========================================================
author: Mauricio Santelices
date: 02/03/2021
autosize: true

Overview
========================================================

The application let users to determine the species of a Iris flower by its sepal length, sepal width, petal length and petal width, using a Random Forest classification model.

The app is available at: https://msantelices.shinyapps.io/iris_classification/

The app will output the expected species with the corresponding probability.


Dataset
========================================================
The model was built using the Iris dataset.


```r
head(iris)
```

```
  Sepal.Length Sepal.Width Petal.Length Petal.Width Species
1          5.1         3.5          1.4         0.2  setosa
2          4.9         3.0          1.4         0.2  setosa
3          4.7         3.2          1.3         0.2  setosa
4          4.6         3.1          1.5         0.2  setosa
5          5.0         3.6          1.4         0.2  setosa
6          5.4         3.9          1.7         0.4  setosa
```



Model
========================================================
We created a random forest with 50 trees, using Species as outcoume and Sepal.Length, Sepal.Width, Petal.Length and Petal.Width as variables. 


Model
========================================================


```r
library(randomForest)

randomForest(Species ~ ., data = iris, ntree = 50)
```

```

Call:
 randomForest(formula = Species ~ ., data = iris, ntree = 50) 
               Type of random forest: classification
                     Number of trees: 50
No. of variables tried at each split: 2

        OOB estimate of  error rate: 4.67%
Confusion matrix:
           setosa versicolor virginica class.error
setosa         50          0         0        0.00
versicolor      0         47         3        0.06
virginica       0          4        46        0.08
```

