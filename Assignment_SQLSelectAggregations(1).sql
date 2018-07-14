-- Assignment: SQL Select and Aggregations

-- Please use the tables in the flights database. Your deliverable should include the SQL queries that you write in support of your conclusions.

-- 1. Which destination in the flights database is the furthest distance away, based on information in the flights table. Show the SQL query(s) that support your conclusion.
SELECT origin, dest, distance 
	FROM flights 
    ORDER BY distance DESC
	LIMIT 1;
-- Because distance is dependant on origin and origins are not equal the furtherst distance traveled in the flights database is JFK to HNL

-- 2. What are the different numbers of engines in the planes table? For each number of engines, which aircraft have the most number of seats? Show the SQL statement(s) that support your result.
SELECT engines FROM planes GROUP BY engines;
-- There are planes with 1, 2, 3, or 4 engines in the flights database
SELECT * FROM planes WHERE engines = 1 ORDER BY seats DESC;
-- Of planes with number of engines 1 the model 'OTTER DHC-3' with 16 seats is the most
SELECT * FROM planes WHERE engines = 2 ORDER BY seats DESC;
-- Of planes with number of engines 2 the models '777-222', '777-200', '777-224' and '777-232' each with 400 seats have the most
SELECT * FROM planes WHERE engines = 3 ORDER BY seats DESC;
-- Of planes with number of engines 3 the model 'A330-223' with 379 seats has the most
SELECT * FROM planes WHERE engines = 4 ORDER BY seats DESC;
-- Of planes with number of engines 4 the model '747-451' with 450 seats has the most

-- 3. Show the total number of flights.
SELECT COUNT(*) FROM flights;
-- Each row in the flights table representing a flight when counted total 336776

-- 4. Show the total number of flights by airline (carrier).
SELECT carrier, COUNT(*) FROM flights GROUP BY carrier;
-- Each row in the flights table representing a flight when counted and grouped by carrier total as follows:
-- 'UA','58665'
-- 'AA','32729'
-- 'B6','54635'
-- 'DL','48110'
-- 'EV','54173'
-- 'MQ','26397'
-- 'US','20536'
-- 'WN','12275'
-- 'VX','5162'
-- 'FL','3260'
-- 'AS','714'
-- '9E','18460'
-- 'F9','685'
-- 'HA','342'
-- 'YV','601'
-- 'OO','32'

-- 5. Show all of the airlines, ordered by number of flights in descending order.
SELECT carrier, COUNT(*)
  FROM flights
  GROUP BY carrier
  ORDER BY COUNT(*) DESC;
-- Each row in the flights table representing a flight when counted and grouped by carrier in descending order total and display as follows:
-- 'UA','58665'
-- 'B6','54635'
-- 'EV','54173'
-- 'DL','48110'
-- 'AA','32729'
-- 'MQ','26397'
-- 'US','20536'
-- '9E','18460'
-- 'WN','12275'
-- 'VX','5162'
-- 'FL','3260'
-- 'AS','714'
-- 'F9','685'
-- 'YV','601'
-- 'HA','342'
-- 'OO','32'
  
-- 6. Show only the top 5 airlines, by number of flights, ordered by number of flights in descending order.
SELECT carrier, COUNT(*)
  FROM flights
  GROUP BY carrier
  ORDER BY COUNT(*) DESC
  LIMIT 5;
-- Each row in the flights table representing a flight when counted and grouped by carrier in descending order, limited to 5, total and display as follows:
-- 'UA','58665'
-- 'B6','54635'
-- 'EV','54173'
-- 'DL','48110'
-- 'AA','32729'

-- 7. Show only the top 5 airlines, by number of flights of distance 1,000 miles or greater, ordered by number of flights in descending order.
SELECT carrier, COUNT(*),  AVG(distance)
  FROM flights
  WHERE distance >= 1000
  GROUP BY carrier
  ORDER BY COUNT(*) DESC
  LIMIT 5;
-- Each row in the flights table representing a flight when counted and grouped by carrier in descending order including only those that flew 1000 miles or more, limited to 5, total and display, including the average distance of those flights for verification, as follows:
-- 'UA','41135','1899.5889'
-- 'B6','30022','1531.0580'
-- 'DL','28096','1613.7663'
-- 'AA','23583','1596.8537'
-- 'EV','6248','1097.1084'

-- 8. Create a question that (a) uses data from the flights database, and (b) requires aggregation to answer it, and
-- write down both the question, and the query that answers the question.
-- Show only the top 3 airlines, by total air time of distance 100 miles or less, ordered in ascending order
SELECT carrier, SUM(air_time), AVG(distance)
  FROM flights
  WHERE distance <= 100
  GROUP BY carrier
  ORDER BY SUM(air_time)
  LIMIT 3;
-- The total air time of flights when summed and grouped by carrier in ascending order including only those that flew 100 miles or less, limited to 3, total and display, including the average distance of those flights for verification, as follows:
-- 'DL','68','94.0000'
-- 'YV','317','96.0000'
-- 'EV','1376','80.0000'
