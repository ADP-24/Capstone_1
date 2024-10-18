SELECT * FROM google_trends;

-- Displays trends of google search for 'Whey Protein Isolate' from the years of 2004 to 2024

SELECT year, Whey_Protein_Isolate,
    LAG(Whey_Protein_Isolate) OVER (ORDER BY year) AS Previous_Month,
    (Whey_Protein_Isolate - LAG(Whey_Protein_Isolate) OVER (ORDER BY year)) AS Increase_Amount,
    CASE 
        WHEN Whey_Protein_Isolate - LAG(Whey_Protein_Isolate) OVER (ORDER BY year) > 0 THEN 'Increase'
        WHEN Whey_Protein_Isolate - LAG(Whey_Protein_Isolate) OVER (ORDER BY year) < 0 THEN 'Decrease'
        ELSE 'No Change'
    END AS Change_Type
FROM google_trends
ORDER BY year;

-- Displays trends of google search for 'Protein' from the years of 2004 to 2024

SELECT year, Protein_Macro,
    LAG(Protein_Macro) OVER (ORDER BY year) AS Previous_Month,
    (Protein_Macro - LAG(Protein_Macro) OVER (ORDER BY year)) AS Increase_Amount,
    CASE 
        WHEN Protein_Macro - LAG(Protein_Macro) OVER (ORDER BY year) > 0 THEN 'Increase'
        WHEN Protein_Macro - LAG(Protein_Macro) OVER (ORDER BY year) < 0 THEN 'Decrease'
        ELSE 'No Change'
    END AS Change_Type
FROM google_trends
ORDER BY year;

SELECT * FROM fitness_memberships_census;

-- Displays the last 5 years of the highest expenditure in fitness memberships

SELECT Year, Value 
FROM fitness_memberships_census
ORDER BY Value DESC
LIMIT 5;

-- A incorperated subquery that average value of expenditure between years.

SELECT 
    (SELECT AVG(Value) 
     FROM fitness_memberships_census 
     WHERE Year BETWEEN 2010 AND 2017) AS avg_value_2010_to_2017,
     
    (SELECT AVG(Value) 
     FROM fitness_memberships_census 
     WHERE Year BETWEEN 2018 AND 2022) AS avg_value_2018_to_2022;


SELECT * FROM whey_exports;

-- Volume in (Metric Tons) for each year for China and the Percentage of change from he previous year.

SELECT 
    Country,
    2019_Metric_Tons,
    2020_Metric_Tons,
    2021_Metric_Tons,
    2022_Metric_Tons,
    ROUND(((2020_Metric_Tons - 2019_Metric_Tons) / 2019_Metric_Tons) * 100, 1) AS growth_2019_to_2020_Percentage,
    ROUND(((2021_Metric_Tons - 2020_Metric_Tons) / 2020_Metric_Tons) * 100, 1) AS growth_2020_to_2021_Percentage,
    ROUND(((2022_Metric_Tons - 2021_Metric_Tons) / 2021_Metric_Tons) * 100, 1) AS growth_2021_to_2022_Percentage
FROM whey_exports
WHERE Country = 'China';

-- Displays the (Metric Tons) for each year for All countries in 'Total' and the Percentage of change from the previous year.

SELECT 
    'All Countries' AS Country,
    SUM(2019_Metric_Tons) AS Total_2019_Metric_Tons,
    SUM(2020_Metric_Tons) AS Total_2020_Metric_Tons,
    SUM(2021_Metric_Tons) AS Total_2021_Metric_Tons,
    SUM(2022_Metric_Tons) AS Total_2022_Metric_Tons,
    ROUND(((SUM(2020_Metric_Tons) - SUM(2019_Metric_Tons)) / SUM(2019_Metric_Tons)) * 100, 1) AS growth_2019_to_2020,
    ROUND(((SUM(2021_Metric_Tons) - SUM(2020_Metric_Tons)) / SUM(2020_Metric_Tons)) * 100, 1) AS growth_2020_to_2021,
    ROUND(((SUM(2022_Metric_Tons) - SUM(2021_Metric_Tons)) / SUM(2021_Metric_Tons)) * 100, 1) AS growth_2021_to_2022
FROM whey_exports;






