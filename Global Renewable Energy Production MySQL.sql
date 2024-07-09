SELECT * FROM globalrenwableenergyproduction.global_renewable_energy_production;

SELECT *
FROM global_renewable_energy_production
WHERE Country IS NULL;

-- Total Renewable Energy Production by Year
SELECT Year, SUM(TotalRenewableEnergy) AS "Total Energy Production"
FROM global_renewable_energy_production
GROUP BY Year
ORDER BY Year;

-- Top 5 Countries by Total Renewable Energy Production for the year 2022
SELECT Country, TotalRenewableEnergy
FROM global_renewable_energy_production
WHERE Year = 2022
ORDER BY TotalRenewableEnergy DESC
LIMIT 5;

-- Average Contribution of Each Renewable Energy Source by Year
SELECT Year,
       AVG(SolarEnergy) AS avg_solar_energy,
       AVG(WindEnergy) AS avg_wind_energy,
       AVG(HydroEnergy) AS avg_hydro_energy,
       AVG(OtherRenewableEnergy) AS avg_other_renewable_energy
FROM global_renewable_energy_production
GROUP BY Year
ORDER BY Year;

-- Highest Wind Energy Production in Each Year
SELECT Year, Country, MAX(WindEnergy) AS max_wind_energy
FROM global_renewable_energy_production
GROUP BY Year, Country
ORDER BY Year, max_solar_energy DESC;

-- Year-over-Year Growth Rate of Total Renewable Energy Production Globally
SELECT Year,
       total_energy_production,
       LAG(total_energy_production) OVER (ORDER BY year) AS previous_year_energy,
       (total_energy_production - LAG(total_energy_production) OVER (ORDER BY year)) / LAG(total_energy_production) OVER (ORDER BY year) * 100 AS growth_rate
FROM (
    SELECT Year, SUM(TotalRenewableEnergy) AS total_energy_production
    FROM global_renewable_energy_production
    GROUP BY Year
) AS yearly_production
ORDER BY year;


-- CTE(Top 3 Countries with the Highest Renewable Energy Production Increase Year-over-Year)
WITH yearly_production AS (
    SELECT Year, Country, TotalRenewableEnergy,
           LAG(TotalRenewableEnergy) OVER (PARTITION BY Country ORDER BY year) AS previous_year_energy
    FROM global_renewable_energy_production
),
production_increase AS (
    SELECT Year, Country,
           (TotalRenewableEnergy - previous_year_energy) AS energy_increase
    FROM yearly_production
    WHERE previous_year_energy IS NOT NULL
)
SELECT Year, Country, energy_increase
FROM production_increase
ORDER BY energy_increase DESC
LIMIT 3;

-- Total Renewable Energy Production by Country
SELECT Country, SUM(TotalRenewableEnergy) AS total_energy_production
FROM global_renewable_energy_production
GROUP BY Country
ORDER BY total_energy_production  DESC;
