library(shiny)
library(caret)
library(randomForest)

data(iris)
ir <- as.data.frame(iris)
model <- randomForest(Species ~ ., data = ir, ntree = 50)

shinyServer(function(input, output) {
    specPred <- reactive({
        data <- data.frame(
            Sepal.Length = input$sepLen,
            Sepal.Width = input$sepWid,
            Petal.Length = input$petLen,
            Petal.Width = input$petWid
        )
        
        class <- predict(model, data)
        probs <- predict(model, data, type = "prob")
        
        species <- switch(as.numeric(class), "Setosa", "Versicolor", "Virginica")
        probability <- probs[as.numeric(class)] * 100
        
        result <- paste(species, " (", probability, '% prob.)', sep = '' )
        result
    })
    
    output$specPred <- renderText({
        specPred()
    })
})