#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
# install.packages("shinythemes")

library(shiny)
library(bslib)
library(shinypanels)
library(shinydashboard)
library(shinydashboardPlus)
library(leaflet)
library(shinythemes)


### Don't forget to comment your code!!



ui <- navbarPage(id = "tabs",
                 title = "Fiji",
                 theme = shinytheme("united"),
                 
                 navbarMenu(
                   title = "About",
                   tabPanel("General Information",
                            h1("The Pacific Island: Fiji"),
                            h2("Size"),
                            img(src="Scenic-fiji.png"),
                            p(style="font-size:12pt", "Located in the South Pacific, 
                                Fiji has over 300 islands and 540 islets than span over 
                                1,000,000 square miles. Only 100 of the 300 islands hold 
                                inhabitants with a total population of 898,000."),
                            h2("Main Islands"),
                            p(style="font-size:12pt", "There are 13 major islands in Fiji;
                              in order of highest to lowest population, the islands are Suva,
                              Nadi, Nasusori, Lautoka, Labasa, Lami, Nakasi, Ba, Sigatoka, Navua,
                              Vaileka, Savusavu, and Levuka.
                                "),
                            h2("Capital"),
                            img(src="Flag_of_Fiji.svg"),
                            p(style="font-size:12pt", "Fiji's capital is Suva.
                                The name derived from it being located on the Suva Point
                                between the Rewa River and Suva Harbour. This is a main
                                commerical hub of Fiji with tourism, exports, and an airport.
                                "),
                   ),
                   
                   tabPanel("World Location"),
                   tabPanel("Regional Location"),
                   tabPanel("Country Location",
                            leafletOutput("mycountrymap", height = 700),
                            p()
                   )
                 ),
                 
                 nav_panel("Demographics", p("Tables and plots go here."),
                           
                           shinypanels::box("box", colapsed=F)
                 ),
                 
                 nav_panel("Pacific Region",
                           p("A regional map goes here.
              Be sure to include comparisons -- maybe a table,
              definitely different graphs"),
                           
                           shinydashboardPlus::box(
                             solidHeader = FALSE,
                             title = "Status summary",
                             background = NULL,
                             width = 4,
                             status = "danger",
                             footer = fluidRow(
                               column(
                                 width = 6,
                                 descriptionBlock(
                                   number = "17%",
                                   numberColor = "green",
                                   numberIcon = icon("caret-up"),
                                   header = "$35,210.43",
                                   text = "TOTAL REVENUE",
                                   rightBorder = TRUE,
                                   marginBottom = FALSE
                                 )
                               )
                             )
                           )
                 ),
                 
                 nav_panel("SWOT", h2("Strengths, Weaknesses, Opportunites & Threats (SWOT)", 
                                  h4("The United Nation's Multidimensional Vulnerability
                                  Index (MVI) has two pillars: Structural Vulnerability 
                                  and Structural Resilience, each with three dimensions: 
                                  social, economic, and environmental stressors.
                                  These were used to determine the strengths, weaknesses,
                                  opportunites, and threats to the island of Fiji. The
                                  overal MVI for Fiji is just below the median (51.7) with
                                  a maximum score of 100."
                                      ),
                              
                                      
                                      panelsPage(
                                        panel(title = "Strengths",
                                              width = 350,
                                              collapsed = TRUE,
                                              body = 
                                                p("Fiji's enviornment is one of their largest strengths, as
                                                 they have a positive Environmental Vulnerability score (70.48).
                                                 There exposure to natural hazards is low, rarely being victims
                                                 of natural hazards and experiencing no damages. Additionally,
                                                 extreme weather events are rare with very few rainfall, heat, or temperature shocks. 
                                                 Lack of environmental resilience is low for Fiji (53.2), where they rarely experience
                                           inadequacy of water supply and are able to renew their freshwater resources. There 
                                           are also many trees to block heat. Additionally, lack of social resilience is around the middle (43.43),
                                                 with low demographic pressure (dependency ratio and population density) and social service provision,
                                                 where there is not a lot of use of basic services, low child mortality, and more years of schooling.")
                                        ),
                                        panel(
                                          title = "Weaknesses",
                                          width = 350,
                                          collapsed = TRUE,
                                          body = 
                                            p("Lack of economic resilience is high with extremely low capcaity to
                                              integrate with international markets. Additionally there is a low
                                              population size, which impacts the economy of the island. On the other hand,
                                              there is lack of crop land, which impacts their agricultural system. Finally,
                                              there is a lack of gender equity in the country with few women represented
                                              in national parliament.")
                                        ),
                                        
                                        panel(
                                          title = "Opportunities",
                                          width = 350,
                                          collapsed = TRUE,
                                          body = 
                                            p("Since population is low and the economy is weak, 
                                              it is important to capitalize on the tourism on the island. 
                                              The COVID-19 Pandemic appeared to disrupt the tourism on the island.
                                              The World Bank and the Marine Ecology Consulting has conducted a 
                                              needs and opportunites assessment to determine areas to build upon
                                              and provide additional supports related to ecosystem resilience and sustainable
                                              tourism.")

                                        ),
                                        panel(
                                          title = "Threats",
                                          width = 350,
                                          collapse = TRUE,
                                          body =
                                            p("Most of Fiji's conservation efforts have been put towards
                                              rainforests, coral reefs, and beaches, but they have left out dry forests.
                                              Fijian dry forests require addtional supports to prevent against grazing, fire
                                              forest clearing, and invasive species. The Fijian government fails to support
                                              environmental planning and puts little care into improving their efforts.")

                                        )
                                      )
                                      
                 )
                 ),
                 
                 navbarMenu(title = "Pacific Ocean",
                            
                            tabPanel("Regions of the Pacific",
                                     img(src="Oceania_UN_Geoscheme_-_Map_with_Zones.svg",
                                         height="600",
                                         width="800")
                            ),
                            
                            tabPanel("where?",
                                     leafletOutput("myOnemap", height = 700),
                                     p()
                                     #actionButton("recalc", "New points")
                            )
                            
                            
                 ),
                 
                 navbarMenu(
                   title = "References",
                   align = "right",
                   tabPanel(tags$a(href="https://icem.com.au/portfolio-items/assessment-of-needs-and-opportunities-to-improve-ecosystem-resilience-and-sustainable-tourism-in-fiji/",
                                   "Assessment of Needs and Opportunities")),
                   tabPanel(tags$a(href="https://www.shinyapps.io/",
                                   "shinyapps.io for publishing")),
                   
                   
                   tabPanel(tags$a(href="https://www.un.org/ohrlls/mvi/documents",
                                   "UN Multidimensional Vulnerability Index")),
                   
                   tabPanel(tags$a(href = "https://kiribati.gov.ki/",
                                   "Kiribati_gov")),
                   tabPanel(tags$a(href="https://www.forumsec.org/",
                                   "Pacific Islands Forum")),
                   tabPanel(tags$a(href="https://rstudio.github.io/leaflet/",
                                   "Threats to Conservation")),
                   tabPanel(tags$a(href="https://www.un.org/ohrlls/mvi/documents",
                                   "Multidimensional Vulnerability Index"))
                   
                   
                 )
                 
)



