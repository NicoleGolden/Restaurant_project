<h1>Doordash Delivery:
 <br>Are My Pizzas Getting More Expensive?</h1>
<p>Author: Nicole Golden<br> Date: April 22, 2022 </p>

<p class="lead">
Yes, inflation is here. As someone who has to order take-out food weekly, I definitely felt the pinch since the lockdown in 2020. So I collected food prices from my favorite pizza place in Irvine for this project. First, I used smooth lines to visualize the evolution of the price changes for all pizzas and desserts. Then I plot the price changes for each food item.
<br><br>
(You can find the data and code on my <a hrf="https://github.com/NicoleGolden/Restaurant_project" target=_blank>GitHub</a> page.)
<p>

<h3> Data</h3>
<p class="lead">
he data comes from my Doordash order record. Since pizza and dessert are the most ordered food types, I only made plots for these two types. In addition, I included food that was ordered more than once.
The main variables are purchase date and the average prices for pizza or dessert for that purchase date.
<p>

<h3> Behold: How Much Have The Prices Increased since Lockdown in 2020?</h3>
<p class="lead">
I plotted with raw data first.
<p>

<center>
<img src="figure/fig2.png" width="450"/>
<h6>Figure 1 - Average Price Changes Over Time for Pizza and Dessert(Raw Data) (Image Source: Nicole Golden. Data Source: <a href=https://www.doordash.com/ target=_blank>Doordash</a>)
</center>

Then I plotted with smoothed lines and indicated the price changes. The price increase is about 66% for the pizza and a 33% increase for dessert!

<center>
<img src="figure/fig3.png" width="500"/>
<h6>Figure 2: Average Price Changes Over Time for Pizza and Dessert
(with Smoothed Lines)
(Image Source: Nicole Golden. Data Source: <a href=https://www.doordash.com/ target=_blank>Doordash</a>)
</center>

<h3> Take A Look At Price Change for Each Food Item</h3>
I thought it might be interesting to look at the price change for each food item. So I standardized the original price to 1, and I normalized the new price by dividing the latest price by the beginning price.
<br><br>
(Spoiler alert: "Pere e Noci" is my favorite pizza! Because its absolute price and percentage change are not that crazy, I almost always order this one!)

Here comes the plot!

<center>
<img src="figure/fig5.png" width="500"/>
<h6>Figure 3: Price Changes For Each Food Item
(Image Source: Nicole Golden. Data Source:<a href=https://www.doordash.com/ target=_blank>Doordash</a>)
</center>



