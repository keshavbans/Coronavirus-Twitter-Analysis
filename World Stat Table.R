

## COVID-19 - WORLD TABLE


library(stringr)
library(tidyr)
library(rvest)

url = 'https://www.worldometers.info/coronavirus/'


world_table  = url %>% read_html() %>%
  html_nodes(xpath = '//*[@id="main_table_countries_today"]') %>% html_table(fill = TRUE)

## NOTE: DATA AS ON 20/03/2020

world_table = world_table[[1]]

View(world_table)

world_table = world_table[, c(1,2,4,6,7,8)]

names(world_table) = c('Country', 'TotalCases', 'TotalDeaths', 
                       'TotalRecovered', 'TotalActive', 'Critical')

world_table[world_table == ''] = 0

world_table = world_table[-184, ]  # Remove Total row



## WHO REPORT on HEALTH SYSTEM COUNTRY wise. 

# url1 = 'https://en.wikipedia.org/wiki/World_Health_Organization_ranking_of_health_systems_in_2000#Ranking'


# WHO_Health  = url1 %>% read_html() %>%
#  html_nodes(xpath = '//*[@id="mw-content-text"]/div/table[2]') %>% html_table(fill = TRUE)


# WHO_Health = WHO_Health[[1]]

# View(WHO_Health)

# WHO_Health = WHO_Health[, c(1,7)]

# names(WHO_Health) = c('Country', 'Overall_Health_System_Performance')




## Merge Bothe the data tables

#WORLD_MAP = merge(world_table,WHO_Health,by="Country")


  
  
## *************************************************************  
  
## WORLD Population Country wise

## DAta Downloaded from: https://worldpopulationreview.com/



World_ppl = read.csv('World_ppl.csv')

View(World_ppl)

World_ppl = World_ppl[, c(2,3)]

names(World_ppl) = c('Country', 'Population')


World_ppl$Population = round(World_ppl$Population)



# Due to change in Names we need to do cleaning to match the COuntry names

World_ppl$Country = gsub('Central African Republic', 'CAR', World_ppl$Country)

World_ppl$Country = gsub('Czech Republic', 'Czechia', World_ppl$Country)

World_ppl$Country = gsub('Macedonia', 'North Macedonia', World_ppl$Country)

World_ppl$Country = gsub('Reunion', 'Réunion', World_ppl$Country)

World_ppl$Country = gsub('South Korea', 'S. Korea', World_ppl$Country)

World_ppl$Country = gsub('Saint BarthÃ©lemy', 'St. Barth', World_ppl$Country)

World_ppl$Country = gsub('Saint Vincent and the Grenadines', 'St. Vincent Grenadines', World_ppl$Country)

World_ppl$Country = gsub('United Arab Emirates', 'UAE', World_ppl$Country)

World_ppl$Country = gsub('United Kingdom', 'UK', World_ppl$Country)

World_ppl$Country = gsub('United States', 'USA', World_ppl$Country)

World_ppl$Country = gsub('United States Virgin Islands', 'U.S. Virgin Islands', World_ppl$Country)


World_ppl$Country = gsub('Curacao', 'Curaçao', World_ppl$Country)

World_ppl$Country = gsub('DR Congo', 'DRC', World_ppl$Country)

World_ppl$Country = gsub('Swaziland', 'Eswatini', World_ppl$Country)

World_ppl$Country = gsub('Faroe Islands', 'Faeroe Islands', World_ppl$Country)

World_ppl$Country = gsub('Macau', 'Macao', World_ppl$Country)

World_ppl$Country = gsub('DR Congo', 'DRC', World_ppl$Country)






## Merge Country Population into WOrld_Map

WORLD_MAP = merge(world_table, World_ppl, by = 'Country')

View(WORLD_MAP)


write.csv(WORLD_MAP, 'World_map.csv')
