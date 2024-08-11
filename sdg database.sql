-- CREATE DATABASE UrbanHousingAnalysis;
-- USE UrbanHousingAnalysis;

-- -- Creating UrbanArea table
-- CREATE TABLE UrbanArea (
--     AreaID INT PRIMARY KEY AUTO_INCREMENT,
--     Location VARCHAR(100),
--     City VARCHAR(100),
--     Country VARCHAR(100)
-- );

-- -- Creating HousingUnits table
-- CREATE TABLE HousingUnits (
--     UnitID INT PRIMARY KEY AUTO_INCREMENT,
--     Location VARCHAR(100),
--     UnitType VARCHAR(50),
--     Cost DECIMAL(10, 2),
--     AvailabilityStatus VARCHAR(20),
--     YearConstructed INT,
--     AreaID INT,
--     FOREIGN KEY (AreaID) REFERENCES UrbanArea(AreaID)
-- );

-- -- Creating Population table
-- CREATE TABLE Population (
--     PopulationID INT PRIMARY KEY AUTO_INCREMENT,
--     Location VARCHAR(100),
--     PopulationCount INT,
--     Year INT,
--     AreaID INT,
--     FOREIGN KEY (AreaID) REFERENCES UrbanArea(AreaID)
-- );

-- -- Creating WasteManagement table
-- CREATE TABLE WasteManagement (
--     WasteID INT PRIMARY KEY AUTO_INCREMENT,
--     Location VARCHAR(100),
--     WasteGenerated DECIMAL(10, 2), -- in tons
--     Year INT,
--     AreaID INT,
--     FOREIGN KEY (AreaID) REFERENCES UrbanArea(AreaID)
-- );

-- -- Inserting data into UrbanArea table
-- INSERT INTO UrbanArea (Location, City, Country)
-- VALUES
-- ('Westlands', 'Nairobi', 'Kenya'),
-- ('Mvita', 'Mombasa', 'Kenya'),
-- ('Milimani', 'Kisumu', 'Kenya'),
-- ('Kasarani', 'Nairobi', 'Kenya');

-- -- Inserting data into HousingUnits table
-- INSERT INTO HousingUnits (Location, UnitType, Cost, AvailabilityStatus, YearConstructed, AreaID)
-- VALUES
-- ('Westlands', 'Apartment', 50000, 'Occupied', 2015, 1),
-- ('Mvita', 'House', 30000, 'Available', 2010, 2),
-- ('Milimani', 'Apartment', 40000, 'Occupied', 2018, 3),
-- ('Kasarani', 'Apartment', 60000, 'Available', 2020, 4),
-- ('Westlands', 'House', 70000, 'Occupied', 2012, 1),
-- ('Mvita', 'Apartment', 55000, 'Available', 2016, 2);

-- -- Inserting data into Population table
-- INSERT INTO Population (Location, PopulationCount, Year, AreaID)
-- VALUES
-- ('Westlands', 120000, 2022, 1),
-- ('Mvita', 80000, 2022, 2),
-- ('Milimani', 100000, 2022, 3),
-- ('Kasarani', 150000, 2022, 4),
-- ('Westlands', 115000, 2021, 1),
-- ('Mvita', 78000, 2021, 2);

-- -- Inserting data into WasteManagement table
-- INSERT INTO WasteManagement (Location, WasteGenerated, Year, AreaID)
-- VALUES
-- ('Westlands', 500, 2022, 1),
-- ('Mvita', 300, 2022, 2),
-- ('Milimani', 400, 2022, 3),
-- ('Kasarani', 600, 2022, 4),
-- ('Westlands', 480, 2021, 1),
-- ('Mvita', 290, 2021, 2);

-- SELECT 
--     u.Location,
--     COUNT(h.UnitID) AS TotalHousingUnits,
--     SUM(CASE WHEN h.AvailabilityStatus = 'Available' THEN 1 ELSE 0 END) AS AvailableUnits,
--     p.PopulationCount,
--     ROUND(SUM(CASE WHEN h.AvailabilityStatus = 'Available' THEN 1 ELSE 0 END) / p.PopulationCount * 1000, 2) AS HousingPerThousand
-- FROM 
--     UrbanArea u
-- JOIN 
--     HousingUnits h ON u.AreaID = h.AreaID
-- JOIN 
--     Population p ON u.AreaID = p.AreaID AND p.Year = 2022
-- GROUP BY 
--     u.Location, p.PopulationCount;

-- SELECT 
--     w.Location,
--     w.Year,
--     w.WasteGenerated,
--     COUNT(h.UnitID) AS TotalHousingUnits
-- FROM 
--     WasteManagement w
-- JOIN 
--     HousingUnits h ON w.AreaID = h.AreaID
-- WHERE 
--     w.Year = 2022
-- GROUP BY 
--     w.Location, w.Year, w.WasteGenerated;

-- SELECT 
--     p.Location,
--     p.Year,
--     p.PopulationCount,
--     COUNT(h.UnitID) AS TotalHousingUnits,
--     SUM(CASE WHEN h.AvailabilityStatus = 'Available' THEN 1 ELSE 0 END) AS AvailableUnits
-- FROM 
--     Population p
-- JOIN 
--     HousingUnits h ON p.AreaID = h.AreaID
-- WHERE 
--     p.Year BETWEEN 2021 AND 2022
-- GROUP BY 
--     p.Location, p.Year, p.PopulationCount;

-- SELECT * FROM UrbanHousingAnalysis;


