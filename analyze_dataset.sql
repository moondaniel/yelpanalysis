Part 1: Yelp Dataset Profiling and Understanding

1. Profile the data by finding the total number of records for each of the tables below:
	
i. Attribute table = 10,000
ii. Business table = 10,000
iii. Category table = 10,000
iv. Checkin table = 10,000
v. elite_years table = 10,000
vi. friend table = 10,000
vii. hours table = 10,000
viii. photo table = 10,000
ix. review table = 10,000
x. tip table = 10,000
xi. user table = 10,000
	


2. Find the total distinct records by either the foreign key or primary key for each table. If two foreign keys are listed in the table, please specify which foreign key.

i. Business = 10,000 distinct rows of primary key column ID 
ii. Hours = 1562 distinct rows of foreign key column business_id
iii. Category = 2643 distinct rows of foreign key column business_id
iv. Attribute = 1115 distinct rows of foreign key column business_id  
v. Review = 10,000 distinct rows of primary key column ID 
vi. Checkin = 493 distinct rows of foreign key column business_id   
vii. Photo = 10,000 distinct rows of primary key column ID  
viii. Tip = 537 distinct rows of foreign key column user_id
ix. User = 10,000 distinct rows of primary key column ID  
x. Friend = 11 distinct rows of foreign key column user_id
xi. Elite_years = 2780 distinct rows of foreign key column user_id

Note: Primary Keys are denoted in the ER-Diagram with a yellow key icon.	



3. Are there any columns with null values in the Users table? Indicate "yes," or "no."

	Answer: No
	
	
	SQL code used to arrive at answer:
SELECT sum(CASE 
			WHEN id IS NULL
				THEN 0
			ELSE 1
			END) AS id
	,sum(CASE 
			WHEN name IS NULL
				THEN 0
			ELSE 1
			END) AS name
	,sum(CASE 
			WHEN review_count IS NULL
				THEN 0
			ELSE 1
			END) AS review_count
	,sum(CASE 
			WHEN yelping_since IS NULL
				THEN 0
			ELSE 1
			END) AS yelping_since
	,sum(CASE 
			WHEN useful IS NULL
				THEN 0
			ELSE 1
			END) AS useful
	,sum(CASE 
			WHEN funny IS NULL
				THEN 0
			ELSE 1
			END) AS funny
	,sum(CASE 
			WHEN cool IS NULL
				THEN 0
			ELSE 1
			END) AS cool
	,sum(CASE 
			WHEN fans IS NULL
				THEN 0
			ELSE 1
			END) AS fans
	,sum(CASE 
			WHEN review_count IS NULL
				THEN 0
			ELSE 1
			END) AS review_count
	,sum(CASE 
			WHEN average_stars IS NULL
				THEN 0
			ELSE 1
			END) AS average_stars
	,sum(CASE 
			WHEN compliment_hot IS NULL
				THEN 0
			ELSE 1
			END) AS compliment_hot
	,sum(CASE 
			WHEN compliment_more IS NULL
				THEN 0
			ELSE 1
			END) AS compliment_more
	,sum(CASE 
			WHEN compliment_profile IS NULL
				THEN 0
			ELSE 1
			END) AS compliment_profile
	,sum(CASE 
			WHEN compliment_cute IS NULL
				THEN 0
			ELSE 1
			END) AS compliment_cute
	,sum(CASE 
			WHEN compliment_list IS NULL
				THEN 0
			ELSE 1
			END) AS compliment_list
	,sum(CASE 
			WHEN compliment_note IS NULL
				THEN 0
			ELSE 1
			END) AS compliment_note
	,sum(CASE 
			WHEN compliment_plain IS NULL
				THEN 0
			ELSE 1
			END) AS compliment_plain
	,sum(CASE 
			WHEN compliment_cool IS NULL
				THEN 0
			ELSE 1
			END) AS compliment_cool
	,sum(CASE 
			WHEN compliment_funny IS NULL
				THEN 0
			ELSE 1
			END) AS compliment_funny
	,sum(CASE 
			WHEN compliment_writer IS NULL
				THEN 0
			ELSE 1
			END) AS compliment_writer
	,sum(CASE 
			WHEN compliment_photos IS NULL
				THEN 0
			ELSE 1
			END) AS compliment_photos
FROM user
	

	
4. For each table and column listed below, display the smallest (minimum), largest (maximum), and average (mean) value for the following fields:

	i. Table: Review, Column: Stars
	
		min: 1		max: 5		avg :3.7082
		
	
	ii. Table: Business, Column: Stars
	
		min: 1.0		max: 5.0		avg: 3.6549
		
	
	iii. Table: Tip, Column: Likes
	
		min: 0		max: 2		avg: 0.0144
		
	
	iv. Table: Checkin, Column: Count
	
		min: 1		max: 53		avg: 1.9414
		
	
	v. Table: User, Column: Review_count
	
		min: 0		max: 2000		avg: 24.2995
		


5. List the cities with the most reviews in descending order:

	SQL code used to arrive at answer:
	SELECT count(review_count), city
	from business
	group by city
	ORDER BY count(review_count) DESC
	
	
	Copy and Paste the Result Below:
	+---------------------+-----------------+
| count(review_count) | city            |
+---------------------+-----------------+
|                1561 | Las Vegas       |
|                1001 | Phoenix         |
|                 985 | Toronto         |
|                 497 | Scottsdale      |
|                 468 | Charlotte       |
|                 353 | Pittsburgh      |
|                 337 | Montréal        |
|                 304 | Mesa            |
|                 274 | Henderson       |
|                 261 | Tempe           |
|                 239 | Edinburgh       |
|                 232 | Chandler        |
|                 189 | Cleveland       |
|                 188 | Gilbert         |
|                 188 | Glendale        |
|                 176 | Madison         |
|                 150 | Mississauga     |
|                 141 | Stuttgart       |
|                 105 | Peoria          |
|                  80 | Markham         |
|                  71 | Champaign       |
|                  70 | North Las Vegas |
|                  64 | North York      |
|                  60 | Surprise        |
|                  54 | Richmond Hill   |

	
6. Find the distribution of star ratings to the business in the following cities:

i. Avon

SQL code used to arrive at answer:
SELECT city, stars, count(stars)
FROM business 
where city = 'Avon'
group by city, stars

Copy and Paste the Resulting Table Below (2 columns – star rating and count):
+-------+--------------+
| stars | count(stars) |
+-------+--------------+
|   1.5 |            1 |
|   2.5 |            2 |
|   3.5 |            3 |
|   4.0 |            2 |
|   4.5 |            1 |
|   5.0 |            1 |
+-------+--------------+

ii. Beachwood

SQL code used to arrive at answer:
SELECT stars, count(stars)
FROM business 
where city = 'Beachwood'
group by stars

Copy and Paste the Resulting Table Below (2 columns – star rating and count):
		
+-------+--------------+
| stars | count(stars) |
+-------+--------------+
|   2.0 |            1 |
|   2.5 |            1 |
|   3.0 |            2 |
|   3.5 |            2 |
|   4.0 |            1 |
|   4.5 |            2 |
|   5.0 |            5 |
+-------+--------------+

7. Find the top 3 users based on their total number of reviews:
		
	SQL code used to arrive at answer:
	
		SELECT id, SUM(review_count)
FROM user
GROUP BY id
ORDER BY sum(review_count) DESC
LIMIT 3
	Copy and Paste the Result Below:
		
+------------------------+-------------------+
| id                     | SUM(review_count) |
+------------------------+-------------------+
| -G7Zkl1wIWBBmD0KRy_sCw |              2000 |
| -3s52C4zL_DHRK0ULG6qtg |              1629 |
| -8lbUNlXVSoXqaRRiHiSNg |              1339 |
+------------------------+-------------------+

8. Does posing more reviews correlate with more fans?

	Please explain your findings and interpretation of the results:
	More reviews does not correlate with more fans. We can see that users with less reviews than the user with the most reviews has more fans.
SQL Code:SELECT id, SUM(review_count), sum(fans)
FROM user
GROUP BY id
ORDER BY sum(review_count) DESC

Results:            | SUM(review_count) | sum(fans) |
+------------------------+-------------------+-----------+
| -G7Zkl1wIWBBmD0KRy_sCw |              2000 |       253 |
| -3s52C4zL_DHRK0ULG6qtg |              1629 |        50 |
| -8lbUNlXVSoXqaRRiHiSNg |              1339 |        76 |
| -K2Tcgh2EKX6e6HqqIrBIQ |              1246 |       101 |
| -FZBTkAZEXoP7CYvRV2ZwQ |              1215 |       126 |
| --2vR0DIsmQ6WfcSzKWigw |              1153 |       311 |
| -gokwePdbXjfS0iF7NsUGA |              1116 |        16 |
| -DFCC64NXgqrxlO8aLU5rg |              1039 |       104 |
| -8EnCioUmDygAbsYZmTeRQ |               968 |       497 |
| -0IiMAZI2SsQ7VmyzJjokQ |               930 |       173 |
| -fUARDNuXAfrOn4WLSZLgA |               904 |        38 |
| -hKniZN2OdshWLHYuj21jQ |               864 |        43 |
| -9da1xk7zgnnfO1uTVYGkA |               862 |       124 |
| -B-QEUESGWHPE_889WJaeg |               861 |       115 |
| -kLVfaJytOJY2-QdQoCcNQ |               842 |        85 |
| -kO6984fXByyZm3_6z2JYg |               836 |        37 |
| -lh59ko3dxChBSZ9U7LfUw |               834 |       120 |
| -g3XIcCb2b-BD0QBCcq2Sw |               813 |       159 |
| -l9giG8TSDBG1jnUBUXp5w |               775 |        61 |
| -dw8f7FLaUmWR7bfJ_Yf0w |               754 |        78 |
| -AaBjWJYiQxXkCMDlXfPGw |               702 |        35 |
| -jt1ACMiZljnBFvS6RRvnA |               696 |        10 |
| -IgKkE8JvYNWeGu8ze4P8Q |               694 |       101 |
| -hxUwfo3cMnLTv-CAaP69A |               676 |        25 |
| -H6cTbVxeIRYR-atxdielQ |               675 |        45 |
+------------------------+-------------------+-----------+

	
9. Are there more reviews with the word "love" or with the word "hate" in them?

	Answer: More with love

	
	SQL code used to arrive at answer:
SELECT sum(case when text like '%love%' then 1 else 0 end) as love_text , 
sum(case when text like '%hate%' then 1 else 0 end) as hate_text
from review

	
	
10. Find the top 10 users with the most fans:

	SQL code used to arrive at answer:
	SELECT id, sum(fans)
from user
group by id 
order by sum(fans) DESC
limit 10
	
	Copy and Paste the Result Below:

+------------------------+-----------+
| id                     | sum(fans) |
+------------------------+-----------+
| -9I98YbNQnLdAmcYfb324Q |       503 |
| -8EnCioUmDygAbsYZmTeRQ |       497 |
| --2vR0DIsmQ6WfcSzKWigw |       311 |
| -G7Zkl1wIWBBmD0KRy_sCw |       253 |
| -0IiMAZI2SsQ7VmyzJjokQ |       173 |
| -g3XIcCb2b-BD0QBCcq2Sw |       159 |
| -9bbDysuiWeo2VShFJJtcw |       133 |
| -FZBTkAZEXoP7CYvRV2ZwQ |       126 |
| -9da1xk7zgnnfO1uTVYGkA |       124 |
| -lh59ko3dxChBSZ9U7LfUw |       120 |
+------------------------+-----------+
	
	
11. Is there a strong relationship (or correlation) between having a high number of fans and being listed as "useful" or "funny?" Out of the top 10 users with the highest number of fans, what percent are also listed as “useful” or “funny”?

Key:
0% - 25% - Low relationship
26% - 75% - Medium relationship
76% - 100% - Strong relationship
	
	SQL code used to arrive at answer:
	SELECT name,fans,useful,funny
FROM user
ORDER BY fans DESC
LIMIT 10
	
	Copy and Paste the Result Below:
	
	+-----------+------+--------+--------+
| name      | fans | useful |  funny |
+-----------+------+--------+--------+
| Amy       |  503 |   3226 |   2554 |
| Mimi      |  497 |    257 |    138 |
| Harald    |  311 | 122921 | 122419 |
| Gerald    |  253 |  17524 |   2324 |
| Christine |  173 |   4834 |   6646 |
| Lisa      |  159 |     48 |     13 |
| Cat       |  133 |   1062 |    672 |
| William   |  126 |   9363 |   9361 |
| Fran      |  124 |   9851 |   7606 |
| Lissa     |  120 |    455 |    150 |
+-----------+------+--------+--------+
	Please explain your findings and interpretation of the results:
	
	There is a high correlation of having a lot of fans and being interpreted as useful or funny.
	The top 10 users all have useful and funny remarks on their reviews.
	

Part 2: Inferences and Analysis

1. Pick one city and category of your choice and group the businesses in that city or category
 by their overall star rating. Compare the businesses with 2-3 stars to the businesses 
 with 4-5 stars and answer the following questions. Include your code.
	
i. Do the two groups you chose to analyze have a different distribution of hours?
Majority of 2-3 stars come from Saturday with a time frame from 5:00AM to 20:00PM. There were no results for the category 'Coffee' for reviews that have 4 or 5 stars.

ii. Do the two groups you chose to analyze have a different number of reviews?
        30 reviews for 2-3 stars.  
         
iii. Are you able to infer anything from the location data provided between these two groups? Explain.
There are not enough reviews for just coffee shops to infer anything from the two groups, but we know that in Phoenix that the coffee shop with reviews written have an average of a 3.0 star rating and usually see the most 2-3 star reviews on Saturday at 21:00PM
We can infer that the longer a store is open, the higher the reviews they receive. Based on the locational data, the restaurants that are the closest to each other will likely have similar ratings due to biases that may occur from the reviews of the businesses nearby.

SQL code used for analysis:
SELECT b.city, b.name, avg(b.stars), h.hours, strftime('%H','now'), c.category
FROM business b
JOIN hours h
ON b.id = h.business_id
JOIN category c 
ON b.id = c.business_id
WHERE b.city = 'Phoenix' and c.category = 'Coffee & Tea'
GROUP BY b.city, b.name, c.category
HAVING avg(b.stars) BETWEEN 4 and 5

SELECT b.city, b.name, avg(b.stars), h.hours, strftime('%H','now'), c.category
FROM business b
JOIN hours h
ON b.id = h.business_id
JOIN category c 
ON b.id = c.business_id
WHERE b.city = 'Phoenix' and c.category = 'Coffee & Tea'
GROUP BY b.city, b.name, c.category
HAVING avg(b.stars) BETWEEN 2 and 3

select
business.name
, business.city,
business.latitude,
business.longitude
, category.category
, business.stars
, hours.hours
, business.review_count
from (business inner join category on business.id = category.business_id) inner join hours on hours.business_id = category.business_id
where business.city = 'Phoenix' 
 group by business.stars;

		
		
2. Group business based on the ones that are open and the ones that are closed. What differences can you find between the ones that are still open and the ones that are closed? List at least two differences and the SQL code you used to arrive at your answer.
		
i. Difference 1:
        Businesses that are open have higher ratings.
         
ii. Difference 2:
         Business that are open have more reviews.
         
         
SQL code used for analysis:

SELECT
business.name
, business.is_open
, category.category
, business.stars
, hours.hours
, business.review_count
, business.postal_code
FROM (business 
INNER JOIN category ON business.id = category.business_id) 
INNER JOIN hours ON hours.business_id = category.business_id
WHERE business.city = 'Mesa' 
GROUP BY business.is_open;
	
3. For this last part of your analysis, you are going to choose the type of analysis you want to conduct on the Yelp dataset and are going to prepare the data for analysis.

Ideas for analysis include: Parsing out keywords and business attributes for sentiment analysis, 
clustering businesses to find commonalities or anomalies between them, predicting the overall star rating for a business, 
predicting the number of fans a user will have, and so on. 
These are just a few examples to get you started, so feel free to be creative and come up with your own problem you want to solve. 
Provide answers, in-line, to all of the following:
	
i. Indicate the type of analysis you chose to do:
To find the correlation between number of checkins and the average rating of reviews.
         
ii. Write 1-2 brief paragraphs on the type of data you will need for your analysis and why you chose that data:
        The type of analysis I want to do is to take the business table and the checkin table to see if there is a correlation between checkins and 
   review ratings. The hypothesis I want to test is to see if more checkins equals higher review ratings from Yelp users. If we see that businesses
   with a higher number of checkins have a higher average on overall ratings, then we can conclude that businesses that incentivize customers to checkin their business
   with promotions or discounts can expect to have better ratings from customers.                         
                  
iii. Output of your finished dataset:
  +--------------+-------------------------------------------+-------------------+
| AVG(b.stars) | name                                      | sum_checkin_count |
+--------------+-------------------------------------------+-------------------+
|          3.5 | Cracker Barrel Old Country Store          |               161 |
|          3.0 | Courtyard Cleveland Willoughby            |                95 |
|          3.5 | LongHorn Steakhouse                       |                95 |
|          3.0 | John Christ Winery                        |                64 |
|          4.5 | Chagrin Valley Little Theatre             |                54 |
|          2.0 | Rite Aid                                  |                46 |
|          2.5 | Highland Square Tavern                    |                38 |
|          3.5 | Panda Chinese Restaurant                  |                31 |
|          3.0 | Atlas Cinemas                             |                29 |
|          4.0 | Pizza Cutter                              |                28 |
|          4.5 | Spudnut Shop Donuts                       |                26 |
|          3.0 | CVS Pharmacy                              |                25 |
|          4.0 | Chapman's Food Mart                       |                24 |
|          3.0 | Davitino's Restaurant                     |                21 |
|          2.0 | Stella's Pizza & Italian Restaurant       |                15 |
|          3.5 | Red Wagon Farm                            |                14 |
|          3.5 | Manakiki Golf Course-Cleveland Metroparks |                13 |
|          4.5 | Dairy Queen                               |                11 |
|          3.0 | Berkshire Hills Golf Course               |                10 |
|          4.0 | Brownie's Market                          |                 9 |
|          1.0 | Days Inn Willoughby/Cleveland             |                 7 |
|          4.0 | The Inn of Chagrin Falls                  |                 6 |
|          4.5 | Galleria Gowns                            |                 5 |
|          3.5 | Wah Sun                                   |                 4 |
|          1.0 | Burger King                               |                 3 |
+--------------+-------------------------------------------+-------------------+       
         
iv. Provide the SQL code you used to create your final dataset:
SELECT AVG(b.stars), b.name, SUM(c.count) as sum_checkin_count
FROM business b 
INNER JOIN checkin c ON b.id = c.business_id 
GROUP BY b.name 
ORDER BY sum_checkin_count DESC