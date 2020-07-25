library(shiny)
shinyUI(fluidPage(
    titlePanel("Predict Circumference from Tree Type and Age"),
    p("Dataset: Orange from the {datasets} package in R"),
    
    sidebarLayout(
        
        sidebarPanel(
            
            selectInput("selectTreeType", "Select Tree Type:",
                        c("1" = 1,
                          "2" = 2,
                          "3" = 3,
                          "4" = 4,
                          "5" = 5)
            ),
            
            sliderInput("sliderAge", "Tree Age (days since 1968/12/31):",
                        min = 100, max = 2000, step = 10, value = 1000),
            
            checkboxInput("showModel1", "Show/Hide Model 1", value = T),
            
            submitButton("Submit")
        ),
        
        
        mainPanel(
            
            tabsetPanel(
                type = "tabs",
                
                tabPanel("Model 1",
                         plotOutput("plot1"),
                         h4("Predicted Circumference from Model 1:"),
                         textOutput("pred1")
                ),
                
                tabPanel("Model 2",
                         br(),
                         h4("Predicted Circumference from Model 2:"),
                         textOutput("pred2")
                ),
                
                tabPanel("Documentation",
                         h4(strong("Introduction")),
                         
                         p("This is a model that predicts the trunk circumference 
                           of an orange tree using its tree type and its age as 
                           predictors."),
                         
                         p("Source code can be found", 
                           a("here.", 
                             href = "https://github.com/tonychen1685/ShinyApplicationAndReproduciblePitch")),
                         
                         br(),
                         
                         h4(strong("Dataset Information")),
                         
                         p("This dataset,", strong("Orange"), ", comes from the 
                           built-in {datasets} package in R. The Orange data frame 
                           has 35 rows and 3 columns of records of the 
                           growth of orange trees."),
                         
                         p("The dataset has 3 variables:"),
                         
                         p(em("Tree"), ": the type of the tree, ranging from 1 to 5."),
                         
                         p(em("Age"), ": the age of the tree (days since 1968/12/31)."),
                         
                         p(em("Circumference"), ": the trunk circumference of the tree (mm).
                           This is probably “circumference at breast height”, 
                           a standard measurement in forestry.."),
                         
                         br(),
                         
                         h4(strong("Source")),
                         
                         p("Draper, N. R. and Smith, H. (1998),", 
                           em("Applied Regression Analysis (3rd ed),"), 
                           "Wiley (exercise 24.N)."),
                         
                         p("Pinheiro, J. C. and Bates, D. M. (2000),", 
                           em("Mixed-effects Models in S and S-PLUS,"), 
                           "Springer."),
                         
                         br(),
                         
                         h4(strong("Methedology")),
                         
                         p("This app contains 2 prediction models."),
                         
                         h5(strong("Model 1")),
                         
                         p("This model has only 1 predictor, Age. After the user inputs
                           the Tree Type, the dataset is subsetted such that all trees 
                           are from the input Tree Type. 
                           The regression model is linear model."),
                         
                         p(code("lm(circumference ~ age, data = subOrange)"),
                           ", where", code("subOrange"),
                           "is the subsetted dataset."),
                         
                         h5(strong("Model 2")),
                         
                         p("This model has 2 predictor, Age and Tree Type. 
                           The regression model is linear model."),
                         
                         p(code("mod2 <- lm(circumference ~ ., data = Orange)"))
                ),
                
                tabPanel("Bonus!",
                         h3(strong("She Walks in Beauty")),
                         
                         h4("Lord Byron"),
                         
                         br(),
                         
                         p("She walks in beauty, like the night"),
                         
                         p("Of cloudless climes and starry skies;"),
                         
                         p("And all that's best of dark and bright"),
                         
                         p("Meet in her aspect and her eyes"),
                         
                         p("Thus mellow'd to that tender light"),
                         
                         p("Which heaven to gaudy day denies."),
                         
                         br(),
                         
                         p("One shade the more, one ray the less,"),
                         
                         p("Had half impair'd the nameless grace"),
                         
                         p("Which waves in every raven tress,"),
                         
                         p("Or softly lightens o'er her face;"),
                         
                         p("Where thoughts serenely sweet express"),
                         
                         p("How pure, how dear their dwelling-place."),
                         
                         br(),
                         
                         p("And on that cheek, and o'er that brow,"),
                         
                         p("So soft, so calm, yet eloquent,"),
                         
                         p("The smiles that win, the tints that glow,"),
                         
                         p("But tell of days in goodness spent,"),
                         
                         p("A mind at peace with all below,"),
                         
                         p(" A heart whose love is innocent!")
                )
            )
        )
    )
))