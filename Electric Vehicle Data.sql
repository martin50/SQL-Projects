SELECT * from electric_vehicle_population.electric_vehicle_population_data;

SELECT county, city, `Electric Vehicle Type` from electric_vehicle_population.electric_vehicle_population_data;

SELECT county, city from electric_vehicle_population.electric_vehicle_population_data;

SELECT County AS "Country", `Electric Vehicle Type` AS "EVT" FROM electric_vehicle_population.electric_vehicle_population_data;

SELECT DISTINCT County FROM electric_vehicle_population.electric_vehicle_population_data;

SELECT * FROM electric_vehicle_population.electric_vehicle_population_data 
WHERE `Electric Vehicle Type` IS NULL;



SELECT County, `Electric Vehicle Type`, COUNT(*) AS Vehicle_Count
FROM electric_vehicle_population.electric_vehicle_population_data
GROUP BY County, `Electric Vehicle Type`
ORDER BY County, `Electric Vehicle Type`;


SELECT company, model from electric_vehicle_population.electric_vehicle_population_data;

SELECT `Electric Vehicle Type` from electric_vehicle_population.electric_vehicle_population_data;

SELECT `Electric Vehicle Type` from electric_vehicle_population.electric_vehicle_population_data 

SELECT COUNT(*) AS BEV_Count
FROM electric_vehicle_population.electric_vehicle_population_data 
WHERE `Electric Vehicle Type` = 'Battery Electric Vehicle (BEV)';

SELECT COUNT(*) AS PHEV_COUNT
FROM electric_vehicle_population.electric_vehicle_population_data 
WHERE `Electric Vehicle Type` = 'Plug-in Hybrid Electric Vehicle (PHEV)';


SELECT COUNT(DISTINCT `Electric Vehicle Type`) AS Number_of_Electric_Vehicle_Types
FROM electric_vehicle_population.electric_vehicle_population_data;

SELECT `Electric Vehicle Type`, COUNT(*) AS Total_Count
FROM electric_vehicle_population.electric_vehicle_population_data
GROUP BY `Electric Vehicle Type`;



SELECT 
    CASE 
        WHEN COUNT(CASE WHEN `Electric Vehicle Type` = 'Battery Electric Vehicle (BEV)' THEN 1 END) > 
             COUNT(CASE WHEN `Electric Vehicle Type` = 'Plug-in Hybrid Electric Vehicle (PHEV)' THEN 1 END)
        THEN 'BEV is dominant'
        ELSE 'PHEV is dominant'
    END AS Dominant_Type
FROM electric_vehicle_population.electric_vehicle_population_data
WHERE `Electric Vehicle Type` IN ('Battery Electric Vehicle (BEV)', 'Plug-in Hybrid Electric Vehicle (PHEV)');


SELECT State, COUNT(*) AS Total_EVs
FROM electric_vehicle_population.electric_vehicle_population_data
GROUP BY State
ORDER BY Total_EVs DESC
LIMIT 1;


SELECT State, `Electric Vehicle Type`, COUNT(*) AS EV_Count
FROM electric_vehicle_population.electric_vehicle_population_data
WHERE State = (
    SELECT State
    FROM (
        SELECT State, COUNT(*) AS Total_EVs
        FROM electric_vehicle_population.electric_vehicle_population_data
        GROUP BY State
        ORDER BY Total_EVs DESC
        LIMIT 1
    ) AS max_state
)
GROUP BY State, `Electric Vehicle Type`
ORDER BY EV_Count DESC;







