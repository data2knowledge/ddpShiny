library(shiny)
library(car)
library(datasets)
library(ggplot2)
library(data.table)
library(rCharts)
library(reshape2)
library(markdown)

data(discovries)
shinyServer(
  function(input, output) {
    
    ranges <- reactive({
      input$range
    })
    
    output$discov <- renderPlot({
                        
      output$yr <-renderPrint({input$range})              
      output$ranges <-renderPrint(discoveries[input$range-1860])      
      plot(discoveries, xlab='year', col='lightblue', lwd=10, main='The numbers of great inventions and scientific discoveries in each year from 1860 to 1959.')     
      abline(a = discoveries[input$range-1860], b = 0, col = "yellow", lwd=4) 
      
      output$table <- renderDataTable(
      {dataTable()}, options = list(bFilter = FALSE, iDisplayLength = 50))
                      
    })
    
  })