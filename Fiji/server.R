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

countries <- read.csv("countries.csv")
republicFiji <- list(lat = -17.713371, lng = 178.065033)
republicFiji2 <- data.frame(
  lat = -17.713371,
  lon = 178.065033
)

# reading in the structural resilience data

csv4 <- read.csv("sr-MVI.csv")

## selecting only the Pacific Countries

csv4 <- csv4 |>
  filter(Country %in% c("Fiji", "Vanuatu", "Tuvalu", "Tonga", 
                        "Solomon Islands", "Palau", "Nauru", 
                        "Marshall Islands", "Kiribati", 
                        "Micronesia (Federated States of)"))

## trimming Micronesia country name

csv4$Country <- gsub("\\s*\\(.*\\)$", "", csv4$Country)

# reading in the structural vulnerability data

csv3 <- read.csv("sv-MVI.csv")

## selecting the relevant Pacific countries

csv3 <- csv3 |>
  filter(Country %in% c("Fiji", "Vanuatu", "Tuvalu", "Tonga", 
                        "Solomon Islands", "Palau", "Nauru", 
                        "Marshall Islands", "Kiribati", 
                        "Micronesia (Federated States of)"))

## trimming the Micronesia country name

csv3$Country <- gsub("\\s*\\(.*\\)$", "", csv3$Country)

# reading in the demographic data 

csv_file_path <- read.csv("Demographics.csv")
     

## selecting only Fiji and removing any projected data past 2023

csv_file_path <- csv_file_path |>
  filter(Location == "Fiji") |>
  filter(Time < 2024)

# Define server logic required to make a ggplot
function(input, output) {
  # Create reactive for dataframes that were added
  filtered_data <- reactive({
    csv_file_path
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
  
  # create a median age ggplot based on demographic data
  output$myPlot4 <- renderPlot({
    ggplot(filtered_data(), aes(x = Time, y = MedianAgePop)) +
      geom_point() +
      labs(title = "Median Age of Fiji's Population (1950-2023)",
           x = "Year",
           y = "Median Age in Years"
      ) +
      theme_economist()
  })
  
  # create a average deaths ggplot based on demographic data
  output$myPlot5 <- renderPlot({
    ggplot(filtered_data(), aes(x = Time, y = Deaths)) +
      geom_point() +
      labs(title = "Total Deaths per a Year (1950-2023)",
           x = "Year",
           y = "Total Deaths per Year"
      ) +
      theme_economist()
  })
  
  # create a total births ggplot based on demographic data
  output$myPlot6 <- renderPlot({
    ggplot(filtered_data(), aes(x = Time, y = Births)) +
      geom_point() +
      labs(title = "Total Births per a Year (1950-2023)",
           x = "Year",
           y = "Total Births per Year"
      ) +
      theme_economist()
  })
  
  # create a structural vulnerability index ggplot based on UN MVI
  output$myPlot7 <- renderPlot({
    ggplot(data3(), aes(x = Country, y = (Structural.Vulnerability.Index))) +
      geom_bar(stat = "identity") +
      labs(title = "Structural Vulnerability Index (SVI) Scores for Pacific Countries",
           x = "Country",
           y = "SVI Score",
           caption = "Total score is out of 100 with the higher the score, the more vulnerable the country."
           
      ) +
      theme_economist() +
      theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1)) 
  })
  
  # create an economic vulnerability index ggplot based on UN MVI
  output$myPlot8 <- renderPlot({
    ggplot(data3(), aes(x = Country, y = Economic.vulnerability)) +
      geom_bar(stat = "identity") +
      labs(title = "Economic Vulnerability Index (EVI) Scores for Pacific Countries",
           x = "Country",
           y = "EVI Score",
           caption = "Total score is out of 100 with the higher the score, the more vulnerable the country."
           
      ) +
      theme_economist() +
      theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1)) 
  })
  
  # create a social vulnerability index ggplot based on UN MVI
  output$myPlot9 <- renderPlot({
    ggplot(data3(), aes(x = Country, y = Social.vulnerability)) +
      geom_bar(stat = "identity") +
      labs(title = "Social Vulnerability Index (SVI) Scores for Pacific Countries",
           x = "Country",
           y = "SVI Score",
           caption = "Total score is out of 100 with the higher the score, the more vulnerable the country."
      ) +
      theme_economist() +
      theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1)) 
  })
  
  # create a structural resilience index ggplot based on UN MVI
  output$myPlot10 <- renderPlot({
    ggplot(data4(), aes(x = Country, y = Lack.of.Structural.Resilience.Index)) +
      geom_bar(stat = "identity") +
      labs(title = "Structural Resilience Index (SRI) Scores for Pacific Countries",
           x = "Country",
           y = "SRI Score",
           caption = "Total score is out of 100 with the higher the score meaning less resilience."
           
      ) +
      theme_economist() +
      theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1)) 
  })
  
  # create an economic resilience index ggplot based on UN MVI
  output$myPlot11 <- renderPlot({
    ggplot(data4(), aes(x = Country, y = Lack.of.Economic.Resilience)) +
      geom_bar(stat = "identity") +
      labs(title = "Economic Resilience Index (ERI) Scores for Pacific Countries",
           x = "Country",
           y = "ERI Score",
           caption = "Total score is out of 100 with the higher the score meaning less resilience."
           
      ) +
      theme_economist() +
      theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1)) 
  })
  
  # create an environmental resilience index ggplot based on UN MVI
  output$myPlot12 <- renderPlot({
    ggplot(data4(), aes(x = Country, y = Lack.of.Environmental.Resilience)) +
      geom_bar(stat = "identity") +
      labs(title = "Environmental Resilience Index (EnvRI) Scores for Pacific Countries",
           x = "Country",
           y = "EnvRI Score",
           caption = "Total score is out of 100 with the higher the score meaning less resilience."
           
      ) +
      theme_economist() +
      theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1)) 
  })
  
  # create a social resilience index ggplot based on UN MVI
  output$myPlot13 <- renderPlot({
    ggplot(data4(), aes(x = Country, y = Lack.of.Social.Resilience)) +
      geom_bar(stat = "identity") +
      labs(title = "Social Resilience Index (SRI) Scores for Pacific Countries",
           x = "Country",
           y = "SRI Score",
           caption = "Total score is out of 100 with the higher the score meaning less resilience."
      ) +
      theme_economist() +
      theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1)) 
  })
  
  # create an environmental vulnerability index ggplot based on UN MVI
  output$myPlot14 <- renderPlot({
    ggplot(data3(), aes(x = Country, y = Environmental.vulnerability)) +
      geom_bar(stat = "identity") +
      labs(title = "Environmental Vulnerability Index (EnvVI) Scores for Pacific Countries",
           x = "Country",
           y = "EnvVI Score",
           caption = "Total score is out of 100 with the higher the score, the more vulnerable the country."
           
      ) +
      theme_economist() +
      theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1)) 
  })
  
  output$mycountrymap <- renderLeaflet({
    leaflet()  %>%
      addProviderTiles(providers$OpenStreetMap.HOT) %>%
      setView(lng = republicFiji$lng,
              lat = republicFiji$lat, zoom = 6.5) %>%
      addCircleMarkers(data = countries,
                       fillColor="red",
                       stroke = TRUE,
                       color="red",
                       radius = 4)
    
  })
  
  output$myregionalmap <- renderLeaflet({
    leaflet()  %>%
      addProviderTiles(providers$OpenStreetMap.HOT) %>%
      setView(lng = republicFiji$lng,
              lat = republicFiji$lat, zoom = 4) %>%
      addCircleMarkers(data = republicFiji2,
                       label = "Fiji",
                       labelOptions = labelOptions(noHide=T),
                       fillColor="red",
                       stroke = TRUE,
                       color="red",
                       radius = 4)
    
  })
  
  output$myworldmap <- renderLeaflet({
    leaflet()  %>%
      addProviderTiles(providers$OpenStreetMap.HOT) %>%
      setView(lng = republicFiji$lng,
              lat = republicFiji$lat, zoom = 1) %>%
      addCircleMarkers(data = republicFiji2,
                       label = "Fiji",
                       labelOptions = labelOptions(noHide=T),
                       fillColor="red",
                       stroke = TRUE,
                       color="red",
                       radius = 4)
    
  })
  
}
