
# load config 
source("config/config.R")

# load data 
my_fav_restaurant <- fread("data/my_fav_restaurant.csv")

#---------------------- Data Cleaning
# convert to date 
my_fav_restaurant$purchase_date <- 
  mdy(my_fav_restaurant$purchase_date)  # mdy matches: month/day/year

# check structure
str(my_fav_restaurant$purchase_date)

# order data by date: ascending order
my_fav_restaurant <- arrange(my_fav_restaurant, purchase_date)

# filter data: 
# - food that was ordered more than once
# - only include "pizza" and "dessert" 
#   (since they are often ordered)
my_fav_restaurant_sub <- 
  my_fav_restaurant %>% 
  filter(order_more_than_once == 1 & 
           item_type %in% c("pizza", "dessert")) 

# get mean price for each type to smooth plot 
my_fav_restaurant_sub <- 
  my_fav_restaurant_sub %>% 
  group_by(purchase_date, item_type) %>% 
  mutate(mean_price = mean(price_paid))

# subset: dessert data
my_fav_restaurant_dessert <- 
  my_fav_restaurant_sub %>% 
  filter(item_type == "dessert")

# subset: pizza data 
my_fav_restaurant_pizza <- 
  my_fav_restaurant_sub %>% 
  filter(item_type == "pizza")

# save data 
fwrite(my_fav_restaurant_dessert,
       "cache/my_fav_restaurant_dessert.csv",
       row.names = F)

fwrite(my_fav_restaurant_pizza,
       "cache/my_fav_restaurant_pizza.csv",
       row.names = F)
