library(shiny)
library(tidyverse)

#####Import Data

dat<-read_csv(url("https://www.dropbox.com/s/uhfstf6g36ghxwp/cces_sample_coursera.csv?raw=1"))
dat<- dat %>% select(c("pid7","ideo5"))
dat<-drop_na(dat)

ui<-fluidPage(
  sliderInput("ideo","Select Five Point Ideology (1=Very liberal, 5=Very conservative)",min = 1,max = 5,value = 3),
  plotOutput("histPlot")
)

server<-function(input,output){

  output$histPlot <- renderPlot({
  
    plot_dat<-filter[dat,ideo5 %in% input$ideo]
    
   ggplot(data=plot_dat, mapping=aes(x=pid7))+
    geom_bar()+
      labs(x="7 Point Party ID, 1=Very D, 7 = Very R", y="count")
})
}
  
shinyApp(ui,server)
