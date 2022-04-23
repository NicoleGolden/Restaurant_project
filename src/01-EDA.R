


# load config 
source("config/config.R")



##############################
###   xkcd Style Plot   ###
##############################

#------------------ 1. Import "xkcd" font 

# load packages 
library(extrafont)
library(remotes)
library(xkcd)

# import font 
font_import(pattern = "[X/x]kcd", 
            prompt=FALSE)

# check font 
fonts()
fonttable()

# load "xkcd" font 
if(.Platform$OS.type != "unix") {
  ## Register fonts for Windows bitmap output
  loadfonts(device = "win")
} else {
  loadfonts()
}

#------------------ 2. Load data 

# load data 
my_fav_restaurant_dessert <-
  fread("cache/my_fav_restaurant_dessert.csv")

my_fav_restaurant_pizza <-
  fread("cache/my_fav_restaurant_pizza.csv")

#------------------ 3. get percentage increase 
# in average prices 

# desset: 
dessert_change <- 
  (max(my_fav_restaurant_dessert$mean_price) - 
     min(my_fav_restaurant_dessert$mean_price)) /
  min(my_fav_restaurant_dessert$mean_price)

# 33.33%
dessert_change

# pizza: get percentage increase 
pizza_change <- 
  (max(my_fav_restaurant_pizza$mean_price) - 
     min(my_fav_restaurant_pizza$mean_price)) /
  min(my_fav_restaurant_pizza$mean_price)

# 63.33
pizza_change


#------------------ 4. Plot data
ggplot() + 
  
  # add smooth lines 
  geom_smooth(my_fav_restaurant_dessert,
              mapping = aes(x = purchase_date,
                            y = mean_price), 
              colour = "#f29c96",    # dessert color
              size = 0.5, 
              position="jitter", 
              fill = NA) +
  geom_smooth(my_fav_restaurant_pizza,
              mapping = aes(x = purchase_date,
                            y= mean_price), 
              colour="#63b5cc",    # pizza color
              size = 0.5, 
              position = "jitter", 
              fill = NA) + 
  
  # annotate each line
  geom_text(data = my_fav_restaurant_sub[60, ], 
            aes(x = purchase_date), 
            colour="#f29c96",      
            y = 12,            # dessert text position
            label="Dessert:\n 33.33 percent increase",
            family = "xkcd")+
  geom_text(data = my_fav_restaurant_sub[15, ], 
            aes(x = purchase_date), 
            colour = "#63b5cc",      
            y = 18.5,             # pizza text position
            label = "Pizza:\n 63.33 percent increase",
            family = "xkcd") +
  
  # x, y, title
  labs(x = "Purchase Date",
       y = "Average Price",
       title = "Evolution of Food Prices At My Favorite Pizza Place",
       subtitle = "Percentage Change in Average Prices",
       caption = "Data Source: Doordash Orders") + 
  
  # horizontal line
  geom_hline(
    yintercept = c(10, 15, 20, 25),
    linetype = "solid", 
    color = "gray", 
    size = 0.2) + 
  
  # vertical line
  geom_vline(
    xintercept = as.Date("2020-05-01"),
    linetype = "dotted", 
    color = "gray", 
    size = 0.3) + 
  
  # annotate vline
  annotate(geom = "text",
           label = as.character(
             "First Purchase After Lockdown"),
           x = as.Date("2020-05-01"),
           y = 23,
           angle = 0, 
           vjust = 1,
           color = "gray48",
           size = 2.5,
           family = "xkcd") + 
  scale_x_date(date_labels = '%Y-%b',
               breaks = '4 week') + 
  theme + 
  theme(text = element_text(family = "xkcd"))


