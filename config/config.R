


# Title:       Configure Project Work Space

# Description: Script for Project Configurations



#----------- 1. Load Libraries

# Load essential packages
suppressMessages(library(dplyr))           
suppressMessages(library(ggplot2))    
suppressMessages(library(data.table))   
suppressMessages(library(rvest))
suppressMessages(library(janitor))
suppressMessages(library(tidyverse))
suppressMessages(library(lubridate))
# suppressMessages(library(forecast))
# suppressMessages(library(xts))
# suppressMessages(library(tidyr))
# suppressMessages(library(MLmetrics))



#----------- 2. Configure Graphic Devices 



#----------- Configure Graphic Devices 

# define global ggplot theme
theme <- theme(
  # change font type

  # Background grids: remove 
  panel.border = element_blank(),  
  panel.grid.major = element_blank(),
  panel.grid.minor = element_blank(),
  panel.background = element_blank(),
  axis.line = element_line(colour = "black"),
  
  # Legend text size 
  legend.title = element_text(size = 8),
  legend.text = element_text(size = 8),
  
  # Title: center
  plot.title = element_text(hjust = 0.5, 
                            size = 10),
  
  # Subtitle: center 
  # subtitle text size
  plot.subtitle = element_text(hjust = 0.5, 
                               size = 8),
  
  # X, Y axis text size
  axis.text = element_text(size = 8),

  # Caption text size / font / color 
  plot.caption = element_text(size = 6,
                              face = "italic",
                              color = "gray"),
  
  # Y-axis line: remove
  axis.line.y = element_blank(),
  
  # Y-axis ticks: remove
  axis.ticks.y = element_blank(),
  
  # X-axis text angle: 90 degree
  axis.text.x = element_text(angle = 0,
                             # move x-axis title to top
                             vjust = 230),
  
  # remvoe x-axis line & ticks 
  axis.line.x.bottom = element_blank(),
  axis.ticks.x = element_blank(),
 
   # remove x,y axis title
  axis.title = element_blank()
)
