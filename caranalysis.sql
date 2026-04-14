-- creating the table for the project

create table  cars_data (
    id BIGINT,
    price DECIMAL(10,2),
    year INT,
    state VARCHAR(50),
    car_long DECIMAL(9,6),
    posting_date VARCHAR(50),
    lat DECIMAL(9,6),
    vin VARCHAR(50),
    car_condition VARCHAR(50),
    model VARCHAR(50),
    manufacturer VARCHAR(50),
    car_type VARCHAR(50),
    region VARCHAR(50),
    cylinders VARCHAR(20),
    odometer BIGINT
);

-- (data cleaning--) 

SELECT 
  sum(id IS NULL) AS missing_id,
  sum(price IS NULL) AS missing_price,
  sum(year IS NULL) AS missing_year,
  sum(state is null) as missing_state,
  sum(car_long is null) as missing_carlong,
  sum(posting_date is null) as missing_postingdate,
  sum(lat is null) as missing_lat,
  sum(model IS NULL) AS missing_model,
  sum(manufacturer IS NULL) AS missing_manufacturer,
  sum(vin is null) as missing_vin,
  sum(car_type is null) as missing_cartype,
  sum(region is null) as missing_region,
  sum(cylinders is null) as missing_cylinders,
  sum(odometer is null) as missing_odometer
from cars_data;

-- (nothing appears to be NULL, however I found empty strings/columns which suggests missing data.) --

SELECT *
FROM cars_data
WHERE vin IS NULL OR vin = ''
   OR car_condition IS NULL OR car_condition = ''
   OR manufacturer IS NULL OR manufacturer = ''
   OR cylinders IS NULL OR cylinders = '';
   
 -- ((returned with 136 rows, 67% of the dataset is missing values in the vin, car_condition, manfacturer and cylinder column)) --
SELECT 
  SUM(vin IS NULL OR vin = '') AS missing_vin,
  SUM(car_condition IS NULL OR car_condition = '') AS missing_condition,
  SUM(manufacturer IS NULL OR manufacturer = '') AS missing_manufacturer,
  SUM(cylinders IS NULL OR cylinders = '') AS missing_cylinders
FROM cars_data;

 -- (( There's 60 missing vins, 22 missing car_conditions, 7 missing_manufacturers and 82 missing_cylinders )) --
 
 -- ((What would be the the most common car manufacturer? --))
 
 select manufacturer, count(*) as numbers_of_cars
 from cars_data
 group by manufacturer
 order by numbers_of_cars desc
 limit 20;
 
-- ford is the most common manufacturer with a number of 29 cars-- 

-- ((What is the average price by manufacturer??)) --

select manufacturer, avg(price) as avg_carprice
from cars_data
group by manufacturer
order by avg_carprice desc;

-- Jaguar is #1 in average price--

-- (What are the most expensive cars?--))

select manufacturer, model, price
from cars_data
order by price desc
limit 20;

-- The GMC sierra 3500 is the most expensive car--

-- (What are the cheapest cars?--))

select manufacturer, model, price
from cars_data
order by price asc
limit 20;

-- jeep is the cheapest--

-- (Checking market trends with cars by year)

select year, count(*) as total_cars
from cars_data
group by year
order by year;

-- (analyzing car_condition--)

select car_condition, avg(price) as avg_price
from cars_data
group by car_condition;

-- ((what are the most popular car type?--))

SELECT car_type, COUNT(*) AS total
FROM cars_data
GROUP BY car_type
ORDER BY total DESC;