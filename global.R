library(shiny)
library(shinydashboard)
library(leaflet)
library(tidyverse)

# read in some abrolhos metadata
metadata <- read.csv("data/2021-05_Abrolhos_stereo-BRUVs_Metadata.csv")

# read in some abrolhos maxn
maxn <- read.csv("data/2021-05_Abrolhos_stereo-BRUVs.checked.maxn.csv")

# read in some length data
length <- read.csv("data/2021-05_Abrolhos_stereo-BRUVs.complete.length.csv") %>%
  mutate(scientific = paste(genus, species))


