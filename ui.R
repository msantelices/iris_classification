library(shiny)

shinyUI(fluidPage(
    titlePanel("Iris Species Classification"),
    sidebarLayout(
        sidebarPanel(
            p("Please fill the Sepal and Petal data"),
            sliderInput('sepLen', 'Sepal Length', min = 0.1, max = 10, step = 0.1, value = 5.1),
            sliderInput('sepWid', 'Sepal Width', min = 0.1, max = 10, step = 0.1, value = 3.5),
            sliderInput('petLen', 'Petal Length', min = 0.1, max = 10, step = 0.1, value = 1.4),
            sliderInput('petWid', 'Petal Width', min = 0.1, max = 10, step = 0.1, value = 0.2)
        ),
        mainPanel(
            h3("The expected species is:"),
            h4(textOutput("specPred")),
            p("*Based on a random forest of the Iris dataset")
        )
    )
)
)