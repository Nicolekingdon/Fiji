#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
# install.packages("ggthemes")
library(shiny)
library(ggplot2)
library(dplyr)
library(ggthemes)

csv4 <- read.csv("/Users/nicolekingdon/Documents/Education/MSSP /BOOTCAMP/floods/Fiji/Fiji/sr-MVI.csv")

csv4 <- csv4 |>
  filter(Country %in% c("Fiji", "Vanuatu", "Tuvalu", "Tonga", 
                        "Solomon Islands", "Palau", "Nauru", 
                        "Marshall Islands", "Kiribati", 
                        "Micronesia (Federated States of)"))


csv3 <- read.csv("/Users/nicolekingdon/Documents/Education/MSSP /BOOTCAMP/floods/Fiji/Fiji/sv-MVI.csv")

csv3 <- csv3 |>
  filter(Country %in% c("Fiji", "Vanuatu", "Tuvalu", "Tonga", 
                        "Solomon Islands", "Palau", "Nauru", 
                        "Marshall Islands", "Kiribati", 
                        "Micronesia (Federated States of)"))


csv2 <- read.csv("/Users/nicolekingdon/Documents/Education/MSSP /BOOTCAMP/floods/Fiji/Fiji/MVI-scores.csv")

colnames(csv2) <- csv2[1, ]
csv2 <- csv2[-1, ]

csv2 <- csv2 |>
  filter(Country %in% c("Fiji", "Vanuatu", "Tuvalu", "Tonga", 
                        "Solomon Islands", "Palau", "Nauru", 
                        "Marshall Islands", "Kiribati", 
                        "Micronesia (Federated States of)")) |>
  mutate(svi = 'Structural vulnerability index' / 10)




csv_file_path <- read.csv("/Users/nicolekingdon/Documents/Education/MSSP /BOOTCAMP/floods/Fiji/Fiji/Demographics.csv")
                  
csv_file_path <- csv_file_path |>
  filter(Location == "Fiji") |>
  filter(Time < 2024)

# Define server logic required to make a ggplot
function(input, output) {
  # Create reactive for the filtered data
  filtered_data <- reactive({
    csv_file_path
  })
  
  data2 <- reactive({
    csv2
  })
  
  data3 <- reactive({
    csv3
  })
  
  data4 <- reactive({
    csv4
  })
  
  # Create total population ggplot based on the data
  output$myPlot <- renderPlot({
    ggplot(filtered_data(), aes(x = Time, y = TPopulation1July)) +
      geom_point() +
      labs(title = "Total Population of Fiji (1950-2023)",
           x = "Year",
           y = "Total Population in 1,000s"
           ) +
      theme_economist()
  })
  
  # Create total male population ggplot based on the data
  output$myPlot2 <- renderPlot({
    ggplot(filtered_data(), aes(x = Time, y = TPopulationMale1July)) +
      geom_point() +
      labs(title = "Total Male Population of Fiji (1950-2023)",
           x = "Year",
           y = "Total Male Population in 1,000s"
      ) +
      theme_economist()
  })
  
  # Create total female population ggplot based on the data
  output$myPlot3 <- renderPlot({
    ggplot(filtered_data(), aes(x = Time, y = TPopulationFemale1July)) +
      geom_point() +
      labs(title = "Total Female Population of Fiji (1950-2023)",
           x = "Year",
           y = "Total Female Population in 1,000s"
      ) +
      theme_economist()
  })
  
  output$myPlot4 <- renderPlot({
    ggplot(filtered_data(), aes(x = Time, y = MedianAgePop)) +
      geom_point() +
      labs(title = "Median Age of Fiji's Population (1950-2023)",
           x = "Year",
           y = "Median Age in Years"
      ) +
      theme_economist()
  })
  
  output$myPlot5 <- renderPlot({
    ggplot(filtered_data(), aes(x = Time, y = Deaths)) +
      geom_point() +
      labs(title = "Total Deaths per a Year (1950-2023)",
           x = "Year",
           y = "Total Deaths per Year"
      ) +
      theme_economist()
  })
  
  output$myPlot6 <- renderPlot({
    ggplot(filtered_data(), aes(x = Time, y = Births)) +
      geom_point() +
      labs(title = "Total Births per a Year (1950-2023)",
           x = "Year",
           y = "Total Births per Year"
      ) +
      theme_economist()
  })
  
  output$myPlot7 <- renderPlot({
    ggplot(csv2, aes(x = Country, y = ('MVI - Score'))) +
      geom_bar(stat = "identity") +
      labs(title = "Total MVI Score for Pacific Countries",
           x = "Country",
           y = "MVI Score"
      ) +
      theme_economist() +
      theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1)) 
  })
  
  output$myPlot8 <- renderPlot({
    ggplot(csv2, aes(x = Country, y = ('Structural vulnerability index'))) +
      geom_bar(stat = "identity") +
      labs(title = "Total Structural Vulnerability Score for Pacific Countries",
           x = "Country",
           y = "Structural Vulnerability Score"
      ) +
      theme_economist() +
      theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1)) 
  })
}
