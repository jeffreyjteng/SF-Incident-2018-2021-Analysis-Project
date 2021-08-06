-- Count of incident type per year
SELECT 
    incident_year AS Year,
    incident_category AS Type_of_Incident,
    COUNT(incident_category) Number_of_Times
FROM
    main_data
GROUP BY incident_year , incident_category
ORDER BY Number_of_Times DESC;

-- Count of incident base on year and month
SELECT 
    incident_year AS Year,
    MONTHNAME(incident_date) AS Month,
    COUNT(incident_Description) Number_of_Times
FROM
    main_data
GROUP BY incident_year , Month
ORDER BY COUNT(incident_Description) DESC;

-- Count of incident base on month
SELECT 
    MONTHNAME(incident_date) AS Month,
    COUNT(incident_subcategory) Number_of_Times
FROM
    main_data
GROUP BY Month
ORDER BY COUNT(incident_subcategory) DESC;

-- Count of incident base on day of week
SELECT 
    incident_day_of_week, COUNT(incident_category)
FROM
    main_data
GROUP BY incident_day_of_week
ORDER BY COUNT(incident_code) DESC;

-- Incident happened base on lat and lng
SELECT 
    incident_Description, latitude, longitude
FROM
    main_data;

-- Incident base on lat and lng group
SELECT 
    incident_category,
    COUNT(analysis_neighborhood),
    Analysis_Neighborhood,
    latitude,
    longitude
FROM
    main_data
WHERE
    latitude != '0' AND longitude != '0'
GROUP BY latitude , longitude
ORDER BY COUNT(Incident_Category) DESC
LIMIT 8;

-- Count of incident base on resolution
SELECT 
    resolution, COUNT(resolution)
FROM
    main_data
GROUP BY resolution
ORDER BY COUNT(resoltion);

-- File online or not
SELECT 
    filed_online,
    ROUND((COUNT(filed_online) / (SELECT 
                    COUNT(filed_online)
                FROM
                    main_data) * 100),
            2) AS Percentage_of_File
FROM
    main_data
GROUP BY filed_online;

-- Count based on police district and neighborhood
SELECT 
    police_district,
    analysis_neighborhood,
    COUNT(incident_description)
FROM
    main_data
GROUP BY police_district , analysis_neighborhood
ORDER BY COUNT(incident_description) DESC;