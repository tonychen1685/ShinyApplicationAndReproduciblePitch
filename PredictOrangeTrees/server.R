library(shiny)
shinyServer(function(input, output) {
    data("Orange")        
    
    mod2 <- lm(circumference ~ ., data = Orange)
    
    mod1Pred <- reactive({
        subOrange <- subset(Orange, Tree == input$selectTreeType)
        mod1 <- lm(circumference ~ age, data = subOrange)
        predict(mod1, data.frame(age = input$sliderAge))
    })
    
    mod2Pred <- reactive({
        predict(mod2, data.frame(Tree = input$selectTreeType, 
                                 age = input$sliderAge))
    })
    
    output$plot1 <- renderPlot({
        subOrange <- subset(Orange, Tree == input$selectTreeType)
        mod1 <- lm(circumference ~ age, data = subOrange)
        
        xx <- Orange$age[Orange$Tree == input$selectTreeType]
        yy <- Orange$circumference[Orange$Tree == input$selectTreeType]
        
        plot(xx, yy,
             xlab = "Age",
             ylab = "Circumference", 
             xlim = c(0, 2000), ylim = c(0, 250), bty = "n")
        
        modColor <- c("red", "green", "brown", "blue", "purple")
        
        if(input$showModel1) {
            abline(mod1, col = modColor[as.numeric(input$selectTreeType)], lwd = 2)
        }
        
        legend(25, 250, "Model 1 Prediction", pch = 16,
               col = modColor[as.numeric(input$selectTreeType)], bty = "n", cex = 1.2)
        
        points(input$sliderAge, mod1Pred(), 
               col = modColor[as.numeric(input$selectTreeType)], pch = 16, cex = 2)
    })
    
    output$pred1 <- renderText({
        paste(round(mod1Pred(), digits = 2), " mm")
    })
    
    output$pred2 <- renderText({
        paste(round(mod2Pred(), digits = 2), " mm")
    })
})