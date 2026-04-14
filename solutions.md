## Introduction
This file was created to simplify and summarize the SQL code used, making it easier to understand and review.
The raw SQL code written can still be viewed in the dataset tab. 


## List of Questions + Solutions

1. What is the most common car manufacturer?

```sql
select manufacturer, count(*) as numbers_of_cars
 from cars_data
 group by manufacturer
 order by numbers_of_cars desc
 limit 20;
```
**Result Set :**

| manufacturer                            | numbers_of_cars   |
| ------------------------------------- | --------- |
| ford                                  | 29 |
| gmc                                   | 18 |
| toyota                                | 16 |
| volvo                                 | 13 |
| honda                                 | 8 |

<br>

2. What is the average price of manufacturer?

```sql
select manufacturer, avg(price) as avg_carprice
from cars_data
group by manufacturer
order by avg_carprice desc;
```

**Result Set :**

| manufacturer                            | avg_carprice   |
| ------------------------------------- | --------- |
| jaguar                                  | 40656.666667 |

<br>

3. What are the most expensive cars?

```sql
select manufacturer, model, price
from cars_data
order by price desc
limit 20;
```
**Result Set :**

| manufacturer                            | model   |    
| ------------------------------------- | --------- |
| gmc                                  | sierra 3500 |

4. What are the cheapest cars?

```sql
select manufacturer, model, price
from cars_data
order by price asc
limit 20;
```
**Result Set :**

| manufacturer                            | model   |    
| ------------------------------------- | --------- |
| jeep                                  | compass |

5. What are the market trends of cars by year?

```sql
select year, count(*) as total_cars
from cars_data
group by year
order by year;
```

**Result Set :**
--Increases up to 2020. 

6. What is the most popular car type?

```sql
SELECT car_type, COUNT(*) AS total
FROM cars_data
GROUP BY car_type
ORDER BY total DESC;
```
**Result Set :**
| car_type                              | total   |    
| ------------------------------------- | --------- |
| pickup                                | 47 |

7. What results happen from analyzing car condition?

```sql
select car_condition, avg(price) as avg_price
from cars_data
group by car_condition;
```
**Result Set :**

| car_condition                              | avg_price   |    
| -------------------------------------  | --------- |
| good                                   | 26906.448276|
| excellent                              | 11840.172414 |
| fair                                   | 3833.333333 |
| like new                               | 19000 |
| new                                    | 21250 |



   


