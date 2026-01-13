USE world;

#cQuestion 1 : Count how many cities are there in each country?

select * from city;

select * from country;


select * from countrylanguage;

SELECT CountryCode, COUNT(*) AS city_count
FROM city
GROUP BY CountryCode;

# Question 2 : Display all continents having more than 30 countries.

SELECT Continent, COUNT(Code) AS country_count
FROM country
GROUP BY Continent
HAVING COUNT(Code)  > 30;

# Question 3 : List regions whose total population exceeds 200 million.

SELECT Region, SUM(Population) AS total_population
FROM country
GROUP BY Region
HAVING SUM(Population) > 200000000;

# Question 4 : Find the top 5 continents by average GNP per country.

SELECT Continent, AVG(GNP) AS avg_gnp
FROM country
GROUP BY Continent
ORDER BY avg_gnp DESC
LIMIT 5;

# Question 5 : Find the total number of official languages spoken in each continent.

SELECT country.Continent,
COUNT(DISTINCT countrylanguage.Language) AS Total_official_languages
FROM country
JOIN countrylanguage
ON country.Code = countrylanguage.CountryCode
GROUP BY country.Continent;

# Question 6 : Find the maximum and minimum GNP for each continent.

SELECT Continent,
       MAX(GNP) AS max_gnp,
       MIN(GNP) AS min_gnp
FROM country
GROUP BY Continent;

# Question 7 : Find the country with the highest average city population.

SELECT c.Name AS Country,
AVG(ci.Population) AS avg_city_population
FROM country c
JOIN city ci 
ON c.Code = ci.CountryCode
GROUP BY c.Name
ORDER BY avg_city_population DESC
LIMIT 1;

# Question 8 : List continents where the average city population is greater than 200,000

SELECT c.Continent,
AVG(ci.Population) AS avg_city_population
FROM country c
JOIN city ci 
ON c.Code = ci.CountryCode
GROUP BY c.Continent
HAVING AVG(ci.Population) > 200000;

#Question 9 : Find the total population and average life expectancy for each continent, ordered by average life expectancy descending.

SELECT Continent,
SUM(Population) AS total_population,
AVG(LifeExpectancy) AS avg_life_expectancy
FROM country
GROUP BY Continent
ORDER BY avg_life_expectancy DESC;

# Question 10 : Find the top 3 continents with the highest average life expectancy, but only include those where the total population is over 200 million.

SELECT Continent,
SUM(Population) AS total_population,
AVG(LifeExpectancy) AS avg_life_expectancy
FROM country
GROUP BY Continent
HAVING SUM(Population) > 200000000
ORDER BY avg_life_expectancy DESC
LIMIT 3;











