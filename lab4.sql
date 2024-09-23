--4.1 
No, You cannot delete VA from the name table because of the 1 to M relationship */
--4.2
*/ No, because 80 is not a valid fips */
--4.3
*/ just fine */ 
    /* pretty good, can be improved*/

    --4.5 
    /* yes perfect*/
--4.6 
Select s.name, i.income 
from income i 
JOIN name n ON i.fips = n.fips
JOIN recent_year ry ON i.year = ry.latest.year
ORDER BY i.income DESC
LIMIT 1;
-- It is washington DC */

--4.7
-- Prompt:
-- Write a SQL query to calculate the population growth rate of Virginia (VA) over the past five years. 
-- The growth rate should be calculated as the percentage increase from the population in the first year to the population in the most recent year.

-- SQL Code:
WITH population_data AS (
    SELECT
        p.year,
        CAST(p.pop AS FLOAT) AS population_float
    FROM
        population p
    JOIN
        name n ON p.fips = n.fips
    WHERE
        n.name = 'Virginia'  -- Replace with the correct state name if needed
        AND p.year >= EXTRACT(YEAR FROM CURRENT_DATE) - 5
)
SELECT
    ROUND(
        100.0 * (MAX(population_float) - MIN(population_float)) / MIN(population_float),
        2
    ) AS growth_rate_percentage
FROM
    population_data;

-- Comments:
-- I started with a prompt that asked for a simple percentage increase calculation. 
-- The initial SQL query might have required filtering the data to include only the past five years.
-- To ensure accuracy, I included a CTE (Common Table Expression) to filter and order the population data by year.
-- I then had to switch it to a float in order to correct the error 
-- The final calculation determines the growth rate percentage based on the difference between the most recent and the earliest population figures.
-- No major modifications were needed; the approach seemed straightforward and effective.

-- population was 0, it would constantly come back with errors

--4.8 
/* No, it doesn't always produce accurate results because it is always just trying to find the fastest way to write a code


