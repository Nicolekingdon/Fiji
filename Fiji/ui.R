#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
# install.packages("shinythemes")
# install.packages("tmap")
library(shiny)
library(bslib)
library(shinypanels)
library(shinydashboard)
library(shinydashboardPlus)
library(leaflet)
library(tmap)
library(shinythemes)



ui <- navbarPage(id = "tabs",
                 title = "Fiji",
                 theme = shinytheme("united"),
                 
                 navbarMenu(
                   title = "About",
                   tabPanel(
                     "General Information",
                     h1("The Pacific Island: Fiji", style = "text-align: center;"),
                     h4("Where Happiness Comes Naturally...", style = "text-align: center; font-style: italic;"),
                     fluidRow(
                       column(
                         width = 6,
                         style = "height: 650px; overflow-y: auto; text-align: center;",
                         h2("Population & Islands"),
                         tags$div(
                           HTML('<iframe width="560" height="315" src="https://www.youtube.com/embed/zleIaEIBs2M?si=W6UnMss6sNIK98F4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>'),
                           p(
                             style = "font-size:12pt; text-align: left;",
                             "Located in the South Pacific, Fiji has over 300 islands and 540 islets that span over 1,000,000 square miles. Only 100 of the 300 islands hold inhabitants with a total population of 898,000."
                           ),
                           h3("Main Islands"),
                           tags$div(
                             img(src = "islands.png", height = 300, width = 500),
                             p(
                               style = "font-size:12pt; text-align: left;",
                               "There are 13 major islands; in order of highest to lowest population, the islands are Suva, Nadi, Nasusori, Lautoka, Labasa, Lami, Nakasi, Ba, Sigatoka, Navua, Vaileka, Savusavu, and Levuka."
                             ),
                             h3("Capital"),
                             tags$div(
                               img(src = "Suva.png", height = 300, width = 500),
                               p(
                                 style = "font-size:12pt;text-align: left;",
                                 "Fiji's capital is Suva. The name derived from its location on the Suva Point between the Rewa River and Suva Harbour. This is a main commercial hub of Fiji with tourism and exports (see Culture for more information)."
                               )
                             )
                           )
                         )
                       ),
                       column(
                         width = 6,
                         style = "height: 650px; overflow-y: auto; text-align: center;",
                         
                         h2("Culture", style = "text-align: center;"),
                         HTML('<iframe width="560" height="315" src="https://www.youtube.com/embed/-QOPPKBNOck?si=X-b5VLyaxreN6ZsX" 
               title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; 
               clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>'),
                         p(style = "font-size:12pt; text-align: left;","Fijian natives continue to use their culture in their everyday lives. Tourists
            tend to visit tradtional villages and participate in cultural activities.
            "),
                         img(src = "tradition.png", height = 300, width = 500),
                         p(style = "font-size:12pt; text-align: left;","Fijian language is divided into Eastern (standard Fijian) and Western (Bauan Fijian). Indigenous Fijians speak Bauan Fijian. 
                         The indigenous people of Fiji make up over half of the population.
                         Due to intermarriage of Fijians with the Polynesian island of Tonga,
                         Fijian holds Melanesian ethic values but Polynesian social and political practices.
                         (See the 'Pacific Region' tab for more information.)
                           "),
                         h3("Flag"),
                         img(src = "Flag_of_Fiji.svg", height = 300, width = 500),
                         p(style = "font-size:12pt; text-align: left;", "The Fijian flag has changed three times over the course of the island's
            inhabitancy. The original Fijian flag was removed in 1874 when the British 
            colonized the island. In celebration of independence, Fiji held a competition,
            where islanders could submit a design for a national flag. Through this, the final and current Fijian
            flag was created (see above)."),
                         
                         h3("Exports"),
                         img(src = "Sugar.png", height = 300, width = 500),
                         p(style = "font-size:12pt; text-align: left;", "One of the largest exports is sugar, which is in a government-controlled production monopoly. The European Union (EU) relies
            heavily on this export. Due to the EU reforming their sugar pricing, 
            Fiji was pressured to increase productivity to make back lost income. Since,
            the garment industry and tourism have become the largest sources of income to Fiji. Additionally,
            Fiji water has became a very important export."),
                         
                         h3("Sports & Recreation"),
                         HTML('<iframe width="560" height="315" src="https://www.youtube.com/embed/pTfMUebDqMY?si=f2PK5J8HRZdnDB-a&amp;start=49" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>'),
                         p(style = "font-size:12pt; text-align: left;","Sports and recreation is plentiful, including snorkeling, canoe racing, wrestling, surfing, suffleboard, windsurfing, scuba diving,
            and rafting. Furthermore, native Fijians enjoy rugby, football, lawn bowls,
            cricket, and basketball. Fiji has a well-ranked national rugby team and participate
            in the Summer Olympic Games.")
                       )
                     )
                   ),
                   
                   
                   tabPanel("Demographics", 
                            h2("Fijian Population Demographics", style = "text-align: center;"),
                            fluidRow(
                              column(
                                width = 6,
                                style = "height: 750px; overflow-y: auto;",
                                h3("Total Population", style = "text-align: center;"),
                                plotOutput("myPlot"),
                                h3("Total Male Population", style = "text-align: center;"),
                                plotOutput("myPlot2"),
                                h3("Total Female Population", style = "text-align: center;"),
                                plotOutput("myPlot3")
                              ),
                              column(
                                width = 6,
                                style = "height: 750px; overflow-y: auto;",
                                h3("Median Age of Population", style = "text-align: center;"),
                                plotOutput("myPlot4"),
                                h3("Total Births", style = "text-align: center;"),
                                plotOutput("myPlot6"),
                                h3("Total Deaths", style = "text-align: center;"),
                                plotOutput("myPlot5")
                              )
                            )
                   ),
                   tabPanel("SWOT Analysis", 
                            style = "height: 700px; overflow-y: auto;",
                            h2("Strengths, Weaknesses, Opportunites & Threats (SWOT) Analysis of Fiji", 
                               h4("The United Nation's Multidimensional Vulnerability
                                  Index (MVI) has two pillars: Structural Vulnerability 
                                  and Structural Resilience, each with three dimensions: 
                                  social, economic, and environmental stressors. The
                                  overall MVI for Fiji is just below the median (51.7) with
                                  a maximum score of 100."
                               ),
                               
                               
                               panelsPage(
                                 panel(title = "Strengths",
                                       width = 350,
                                       collapsed = TRUE,
                                       body = 
                                         p(style = "font-size:20pt","Fiji's enviornment is one of their largest strengths, as
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
                                     p(style = "font-size:20pt","Lack of economic resilience is high with extremely low capacity to
                                              integrate with international markets. Additionally there is a low
                                              population size, which impacts the economy of the island. On the other hand,
                                              there is lack of crop land, which impacts their agricultural system. Finally,
                                              there is a lack of gender equity in the country with few women represented
                                              in national parliament. Although, there is almost the equal number of women to men in the 
                                       country (see the 'Demographics' tab in the 'About' page for more information).")
                                 ),
                                 
                                 panel(
                                   title = "Opportunities",
                                   width = 350,
                                   collapsed = TRUE,
                                   body = 
                                     p(style = "font-size:20pt","Since population is low and the economy is weak, 
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
                                     p(style = "font-size:20pt","Most of Fiji's conservation efforts have been put towards
                                              rainforests, coral reefs, and beaches, but they have left out dry forests.
                                              Fijian dry forests require addtional supports to prevent against grazing, fire
                                              forest clearing, and invasive species. The Fijian government fails to support
                                              environmental planning and puts little care into improving their efforts.")
                                   
                                 )
                               )
                               
                            )
                   )
                 ),
                 
                 
                 nav_panel(
                   "Pacific Region",
                   style = "height: 750px; overflow-y: auto; text-align: center;",
                   h1("Pacific Region Islands"),
                   p(style = "font-size:14pt; text-align: left;", "There are three subregions that make up the Pacific Islands:
                             Melanesia, Micronesia, and Polynesia. Melanesia (meaning 'Black Islands') holds about 2,000 islands.
                             Micronesia also consists of approimately 2,000 islands located between Hawaii
                             and the Philippines. Finally, Polynesia has about 1,000 islands,
                             spanning from Hawaii, to Easter Island to New Zealand."),
                   img(src = "Pacific_Culture_Areas.png", height = 550, width = 750, style = "text-align: center;"),
                   p(style = "font-size:14pt; text-align: left;", "Although up for debate,
                             there are 15 main countries Northern Mariana Islands,
                             Micronesia, Fiji, French Polynesia, Kiribati, Marshall Islands,
                             Nauru, New Caledonia, New Zealand, Palau, Solomon Islands, Tonga,
                             Tuvalu, Vanuatu, and Wallis and Futuna located within the subregions. Each island experiences different areas of risk
                             and resilience that impact their inhabitants."),
                   h2("Multidimensional Vulnerability Index Scores", style = "text-align: center;"),
                   p(style = "font-size:14pt; text-align: left;", "Using the United Nations
                             Multidimensional Vulnerability Index (MVI), the Pacific Region countries,
                             with available data from the UN, were compared and contrasted based on their
                             MVI scores. (See more information on Fiji specifically in the SWOT tab.)"),
                   fluidRow(
                     column(
                       width = 6,
                       style = "height: 750px; overflow-y: auto;",
                       h2("Structural Vulnerability Index", style = "text-align: center;"),
                       plotOutput("myPlot7"),
                       h3("Economic Vulnerability Index", style = "text-align: center;"),
                       plotOutput("myPlot8"),
                       h3("Social Vulnerability Index", style = "text-align: center;"),
                       plotOutput("myPlot9"),
                       h3("Environmental Vulnerability Index", style = "text-align: center;"),
                       plotOutput("myPlot14")
                     ),
                     column(
                       width = 6,
                       style = "height: 750px; overflow-y: auto;",
                       h2("Structural Resilience Index", style = "text-align: center;"),
                       plotOutput("myPlot10"),
                       h3("Economic Resilience Index", style = "text-align: center;"),
                       plotOutput("myPlot11"),
                       h3("Social Resilience Index", style = "text-align: center;"),
                       plotOutput("myPlot13"),
                       h3("Environmental Resilience Index", style = "text-align: center;"),
                       plotOutput("myPlot12")
                     )
                   )
                 ),
                 
                 navbarMenu(
                   title = "Location Maps",
                   tabPanel("World Map",
                            h1("Fiji's World Location", style = "text-align: center;"),
                            leafletOutput("myworldmap", height = 700)
                   ),
                   tabPanel("Regional Map", 
                            h1("Fiji's Regional Location", style = "text-align: center;"),
                            h2("Pacific Ocean", style = "text-align: center; font-style: italic;"),
                            leafletOutput("myregionalmap", height = 700)
                   ),
                   tabPanel("Country Map",
                            h1("Map of Fiji", style = "text-align: center;"),
                            h3("Zoom in for city names", style = "text-align: center; font-style: italic;"),
                            leafletOutput("mycountrymap", height = 700)
                   )
                 ),
                 
                 
                 
                 navbarMenu(
                   title = "References",
                   align = "right",
                   tabPanel(tags$a(href="https://icem.com.au/portfolio-items/assessment-of-needs-and-opportunities-to-improve-ecosystem-resilience-and-sustainable-tourism-in-fiji/",
                                   "Assessment of Needs and Opportunities")),
                   
                   tabPanel(tags$a(href="https://www.britannica.com/place/Fiji-republic-Pacific-Ocean/Cultural-life",
                                   "Fijian Culture")),
                   
                   tabPanel(tags$a(href="https://www.britannica.com/place/Fiji-republic-Pacific-Ocean/Economy",
                                   "Fijian Exports")),
                   
                   tabPanel(tags$a(href="https://www.britannica.com/topic/Oceanic-languages",
                                   "Fijian Language")),
                   
                   tabPanel(tags$a(href = "https://www.britannica.com/topic/flag-of-Fiji",
                                   "History of the Fijian Flag")),
                   
                   tabPanel(tags$a(href = "https://simplemaps.com/data/fj-cities",
                                   "Mapping Data for Fiji")),
                   
                   tabPanel(tags$a(href="https://www.un.org/ohrlls/mvi/documents",
                                   "Multidimensional Vulnerability Index")),
                   
                   tabPanel(tags$a(href = "https://www.goodhousekeeping.com/life/a36433344/pacific-island-countries/",
                                   "Pacific Islands")),
                   
                   tabPanel(tags$a(href="https://rstudio.github.io/leaflet/",
                                   "Threats to Conservation")),
                   
                   tabPanel(tags$a(href="https://www.un.org/ohrlls/mvi/documents",
                                   "UN Multidimensional Vulnerability Index")),
                   
                   tabPanel(tags$a(href="https://data.worldbank.org/indicator/SP.POP.TOTL?locations=FJ",
                                   "World Bank Demographic Data"))
                   
                   
                   
                   
                 )
                 
)
