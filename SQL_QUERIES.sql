#1) -- Restuarants based on Countries
select count(distinct(CountryName)) as total_country from country;

#2) -- Restuarants based on Cities
select count(distinct(City)) as Total_Cities from restaurantdetail;

#3) -- Total Restuarants
select count(*) as total_restaurants from restaurantdetail;

#4) -- Total Votes
SELECT SUM(votes) AS Total_Votes FROM restaurantdetail;

#5) -- Restuarants based Avg rating
select round(avg(rating),2) as Avg_Rating from restaurantdetail;

#6) -- Restaurants opening by Year
SELECT Year_Opening AS Year,COUNT(*) AS Total_Restaurants FROM restaurantdetail
GROUP BY Year_Opening
ORDER BY Year_Opening;

-- Restaurants opening by Month
SELECT Month_Opening AS Month,COUNT(*) AS Total_Restaurants FROM restaurantdetail
GROUP BY Month_Opening
ORDER BY Month_Opening;

-- Restaurants opening by Quarter
SELECT 
    CASE 
        WHEN Month_Opening IN (1, 2, 3) THEN 'Q1'
        WHEN Month_Opening IN (4, 5, 6) THEN 'Q2'
        WHEN Month_Opening IN (7, 8, 9) THEN 'Q3'
        WHEN Month_Opening IN (10, 11, 12) THEN 'Q4'
    END AS Quarter,
    COUNT(*) AS Total_Restaurants
FROM restaurantdetail
GROUP BY Quarter
ORDER BY Quarter;

#7) -- Number of Restaurants by city
SELECT city, COUNT(RestaurantID) AS Total_restaurants FROM restaurantdetail
GROUP BY city
ORDER BY COUNT(RestaurantID) DESC;

#8) -- Number of Restaurants by Country
select c.CountryName,count(r.RestaurantID) AS Total_Restaurants from restaurantdetail r
join country c on  r.CountryCode = c.CountryCode 
group by c.CountryName
order by count(r.RestaurantID) desc;

#9) -- Restaurant % for Has_online delivery

SELECT Has_Online_Delivery, COUNT(*) AS Total_Restaurants,floor((COUNT(*)) * 100.0 / (SELECT floor( COUNT(*)) FROM restaurantdetail)) AS Percentage
FROM restaurantdetail
GROUP BY Has_Online_Delivery;

#10) -- Restaurant % for Has_Table_Booking
SELECT Has_Table_Booking,COUNT(*) AS Total_Restaurants, floor((COUNT(*)) * 100.0 / (SELECT floor( COUNT(*)) FROM restaurantdetail)) AS Percentage
FROM restaurantdetail
GROUP BY Has_Table_Booking;

#11) -- Resturants falls in each buckets
SELECT 
    CASE 
        WHEN Indian_Rupees_Cost <= 500 THEN '0-500'
        WHEN Indian_Rupees_Cost > 500 AND Indian_Rupees_Cost <= 1000 THEN '501-1000'
        WHEN Indian_Rupees_Cost > 1000 AND Indian_Rupees_Cost <= 2000 THEN '1001-2000'
        WHEN Indian_Rupees_Cost > 2000 AND Indian_Rupees_Cost <= 3000 THEN '2001-3000'
        WHEN Indian_Rupees_Cost > 3000 AND Indian_Rupees_Cost <= 4000 THEN '3001-4000'
        ELSE '4001+'
    END AS Price_Bucket,
    COUNT(*) AS Total_Restaurants
FROM restaurantdetail
GROUP BY Price_Bucket
ORDER BY Price_Bucket;


