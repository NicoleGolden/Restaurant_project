

# load config 
source("config/config.R")

# load data 
my_fav_restaurant <- 
  fread("data/my_fav_restaurant.csv")

#------------- 1. Data Cleaning: get price increase 
# For each item: 
# - Standardize beginning price to 1
# - Standardize latest price by dividing 
#   latest price with beginning price

# subset: pizza + dessert
# and order more than once
my_fav_restaurant_sub <- 
  my_fav_restaurant %>% 
  filter(order_more_than_once == 1 & 
           item_type %in% c("pizza", "dessert")) 

# extract item_name 
item_name <- unique(my_fav_restaurant_sub$item_name)

# split data 
my_fav_restaurant_split <- 
  split(my_fav_restaurant_sub,
        f = my_fav_restaurant_sub$item_name)

# create function: 
# standardize beginning and latest new price
get_price_change <- 
  function(df, item_name) {
    list_price_change = 
      df %>% 
      filter(item_name == item_name) %>% 
      mutate(min_price = 
               min(df$price_paid) / 
                  min(df$price_paid),
             max_price = 
               max(df$price_paid) / 
               min(df$price_paid))
    return(list_price_change)
  }

# apply function 
price_change <- 
  lapply(my_fav_restaurant_split, 
         get_price_change)

# create function: conver to date 
to_date <- function(df) {
  df$purchase_date = mdy(df$purchase_date)
  return(df)
}

# apply function 
price_change <- lapply(price_change,
       to_date)

# length: 11 items 
length(price_change)

# check data 
price_change[[4]]


#---------------- 2. Plot: price change for each food item

ggplot() + 
  
  # label "pizza"
  annotate(geom = "text",
           label = as.character(
             "Pizza"),
           x = 1.3,
           y = "Vegana",
           angle = 0, 
           vjust = 1,
           color = "#d1563b",
           size = 4) + 
  
  # label "dessert" 
  annotate(geom = "text",
           label = as.character(
             "Dessert"),
           x = 1.4,
           y = "Tiramisu",
           angle = 0, 
           vjust = 1,
           color = "#5c322a",
           size = 4) + 
  
  # 1. "Boscaiola"
  geom_point(price_change[[1]],
             mapping = aes(
               x = 1,
               y = "Boscaiola"), 
             shape = 21,
             color = "white",
             fill = "white") +      # early price
  geom_point(price_change[[1]],
             mapping = aes(
               x = 1.15,
               y = "Boscaiola"), 
             color = "#d1563b") +     # late price 
  geom_line(price_change[[1]],
            mapping = aes(
              x = c(1, 1.15),
              y = "Boscaiola"),
            color = "#e6b095") +      # connect line 
  
  # 2. "Calzone"
  geom_point(price_change[[2]],
             mapping = aes(
               x = 1,
               y = "Calzone"), 
             shape = 21,
             color = "white",
             fill = "white") + 
  geom_point(price_change[[1]],
             mapping = aes(
               x = 1.39,
               y = "Calzone"), 
             color = "#d1563b") +
  geom_line(price_change[[1]],
            mapping = aes(
              x = c(1, 1.39),
              y = "Calzone"),
            color = "#e6b095") +      # connect line 
  
  # 3. "Capricciosa"
  geom_point(price_change[[3]],
             mapping = aes(
               x = 1,
               y = "Capricciosa"), 
             shape = 21,
             color = "white",
             fill = "white") + 
  geom_point(price_change[[1]],
             mapping = aes(
               x = 1.39,
               y = "Capricciosa"), 
             color = "#d1563b") +
  geom_line(price_change[[1]],
            mapping = aes(
              x = c(1, 1.39),
              y = "Capricciosa"),
            color = "#e6b095") +      # connect line 
  
  # 4. "Formaggio e Porri"
  geom_point(price_change[[4]],
             mapping = aes(
               x = 1,
               y = "Formaggio e Porri"), 
             shape = 21,
             color = "white",
             fill = "white") + 
  geom_point(price_change[[1]],
             mapping = aes(
               x = 1.35,
               y = "Formaggio e Porri"), 
             color = "#d1563b") +
  geom_line(price_change[[1]],
            mapping = aes(
              x = c(1, 1.35),
              y = "Formaggio e Porri"),
            color = "#e6b095") +      # connect line 
  
  # 5. "Marinara"
  geom_point(price_change[[5]],
             mapping = aes(
               x = 1,
               y = "Marinara"), 
             shape = 21,
             color = "white",
             fill = "white") + 
  geom_point(price_change[[1]],
             mapping = aes(
               x = 1.31,
               y = "Marinara"), 
             color = "#d1563b") +
  geom_line(price_change[[1]],
            mapping = aes(
              x = c(1, 1.31),
              y = "Marinara"),
            color = "#e6b095") +      # connect line 
  
  # 6. "Pere e Noci"
  geom_point(price_change[[6]],
             mapping = aes(
               x = 1,
               y = "Pere e Noci"), 
             shape = 21,
             color = "white",
             fill = "white") + 
  geom_point(price_change[[1]],
             mapping = aes(
               x = 1.26,
               y = "Pere e Noci"), 
             color = "#d1563b") +
  geom_line(price_change[[1]],
            mapping = aes(
              x = c(1, 1.26),
              y = "Pere e Noci"),
            color = "#e6b095") +      # connect line 
  
  # 7. "Saporita"
  geom_point(price_change[[7]],
             mapping = aes(
               x = 1,
               y = "Saporita"), 
             shape = 21,
             color = "white",
             fill = "white") + 
  geom_point(price_change[[1]],
             mapping = aes(
               x = 1.06,
               y = "Saporita"), 
             color = "#d1563b") +
  geom_line(price_change[[1]],
            mapping = aes(
              x = c(1, 1.06),
              y = "Saporita"),
            color = "#e6b095") +      # connect line 
  
  # 8. "The 'Angelina' Pizza"
  geom_point(price_change[[8]],
             mapping = aes(
               x = 1,
               y = "The 'Angelina' Pizza"), 
             shape = 21,
             color = "white",
             fill = "white") + 
  geom_point(price_change[[1]],
             mapping = aes(
               x = 1.14,
               y = "The 'Angelina' Pizza"), 
             color = "#d1563b") +
  geom_line(price_change[[1]],
            mapping = aes(
              x = c(1, 1.14),
              y = "The 'Angelina' Pizza"),
            color = "#e6b095") +      # connect line 
  
  # 9. "Vegana"
  geom_point(price_change[[11]],
             mapping = aes(
               x = 1,
               y = "Vegana"), 
             shape = 21,
             color = "white",
             fill = "white") + 
  geom_point(price_change[[1]],
             mapping = aes(
               x = 1.26,
               y = "Vegana"), 
             color = "#d1563b") +
  geom_line(price_change[[1]],
            mapping = aes(
              x = c(1, 1.26),
              y = "Vegana"),
            color = "#e6b095") +      # connect line 
  
  # DESSERT
  # 10. "Tiramisu"
  geom_point(price_change[[9]],
             mapping = aes(
               x = 1,
               y = "Tiramisu"), 
             shape = 21,
             color = "white",
             fill = "white") + 
  geom_point(price_change[[1]],
             mapping = aes(
               x = 1.33,
               y = "Tiramisu"), 
             color = "#5c322a") +
  geom_line(price_change[[1]],
            mapping = aes(
              x = c(1, 1.33),
              y = "Tiramisu"),
            color = "#87554a") +      # connect line 
  
  # 11. "Torta al Cioccolato"
  geom_point(price_change[[10]],
             mapping = aes(
               x = 1,
               y = "Torta al Cioccolato"), 
             shape = 21,
             color = "white",
             fill = "white") + 
  geom_point(price_change[[1]],
             mapping = aes(
               x = 1.67,
               y = "Torta al Cioccolato"), 
             color = "#5c322a") +
  geom_line(price_change[[1]],
            mapping = aes(
              x = c(1, 1.67),
              y = "Torta al Cioccolato"),
            color = "#87554a") +      # connect line 
  
  # vline 
  geom_vline(
    xintercept = c(1.1, 1.2, 1.3, 1.4, 1.5, 1.6),
    color = "gray", 
    size = 0.1) + 
  
  # themes
  theme + 
  theme(axis.text.x = element_text(
    angle = 0,
    vjust = 230),
    axis.line.x.bottom = element_blank(),
    axis.ticks.x = element_blank(),
    # remove axis title
    axis.title = element_blank()
  ) 
