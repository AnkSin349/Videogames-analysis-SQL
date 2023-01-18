Create Schema videogames;
use videogames;

create table games
(
Name	varchar(500),
Platform	varchar(20),
Release_Year int,
Genre	varchar(100),
Publisher	varchar(100),
NA_Sales	float,
EU_Sales	float,
JP_Sales	float,
Other_Sales float,
Global_Sales float);
select * from games;

#Top 5 games genre with max sales over the years
SELECT genre,round(sum(Global_Sales),2) AS TotalSales
FROM games
GROUP BY genre
ORDER BY TotalSales DESC
LIMIT 5;

#Top 5 platforms with max sales over the years
SELECT Platform,round(sum(Global_Sales),2) AS TotalSales
FROM games
GROUP BY Platform
ORDER BY TotalSales DESC
LIMIT 5;

#Number of games release per genre 
SELECT genre,count(*) as No_of_Games_Released
FROM games 
GROUP BY genre
ORDER BY 1,2 DESC;

#Platform with most games 
Select Platform,count(*) as No_of_games_platform
FROM games
GROUP BY platform
ORDER BY 2 DESC;

select platform,count(*) as no_of_Games,
dense_rank() over (ORDER BY count(*) DESC) as Ranking
FROM games
GROUP BY platform
LIMIT 10;

#Top 10 Publishers whose sales are highesr per region 
SELECT publisher,round(sum(NA_Sales),2) AS NA_Total_Sales,
round(sum(EU_Sales),2) as Europe_Total_sales,
round(sum(JP_Sales),2) as Japan_Total_sales,
round(sum(Other_Sales),2) as Other_Total_sales
FROM games 
GROUP BY Publisher
ORDER BY 2 DESC,3 DESC, 4 DESC, 5 Desc
LIMIT 10;

#Best selling platform Genre genre wise in regions 
SELECT Platform,genre,round(max(NA_Sales),2) as MaxNASales 
FROM games;

SELECT Platform,genre,round(max(EU_Sales),2) as MaxEUSales 
FROM games;

SELECT Platform,genre,round(max(JP_Sales),2) as MaxJPSales 
FROM games;

SELECT Platform,genre,round(max(Global_Sales),2) as MaxGlobalSales 
FROM games;