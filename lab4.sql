--4.1 
No, You cannot delete VA from the name table because of the 1 to M relationship */
--4.2
*/ No, because 80 is not a valid fips */
--4.3
*/ just fine */ 
--4.6 
SELECT s.name, i.income
FROM income i
JOIN state s ON i.fips = s.fips
WHERE i.year = 2023
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
        year,
        population
    FROM
        population_table
    WHERE
        state = 'VA'
        AND year >= EXTRACT(YEAR FROM CURRENT_DATE) - 5
    ORDER BY
        year
)
SELECT
    ROUND(
        100.0 * (MAX(population) - MIN(population)) / MIN(population),
        2
    ) AS growth_rate_percentage
FROM
    population_data;

-- Comments:
-- I started with a prompt that asked for a simple percentage increase calculation. 
-- The initial SQL query might have required filtering the data to include only the past five years.
-- To ensure accuracy, I included a CTE (Common Table Expression) to filter and order the population data by year.
-- The final calculation determines the growth rate percentage based on the difference between the most recent and the earliest population figures.
-- No major modifications were needed; the approach seemed straightforward and effective.

-- population was 0


