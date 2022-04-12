CREATE DATABASE P201Meals

USE P201Meals

CREATE TABLE Meals
(
	Id INT PRIMARY KEY IDENTITY,
	Name NVARCHAR(25) NOT NULL,
)

CREATE TABLE Ingridients
(
	Id INT PRIMARY KEY IDENTITY,
	Name NVARCHAR(20) NOT NULL UNIQUE
)


INSERT INTO Ingridients
VALUES
('Mayonez'),
('Yumurta'),
('Sud'),
('Duzlu xiyar'),
('Zeytun yagi'),
('Kere yagi'),
('Ketcup'),
('Merci'),
('Sogan'),
('Mal eti'),
('Toyuq'),
('Melememis quzu eti'),
('Kartof'),
('Qaymaq'),
('Limon')

INSERT INTO Meals
VALUES
('Merci supu'),
('Et Burger'),
('Toyuq Burger'),
('Toyuq salati'),
('Kartof yumurta'),
('Kartof yumurta'),
('Bozbas')

CREATE TABLE MealIngridients
(
	Id INT PRIMARY KEY IDENTITY,
	MealId INT FOREIGN KEY REFERENCES Meals(Id),
	IngridientId INT FOREIGN KEY REFERENCES Ingridients(Id),
)

SELECT * FROM Meals
SELECT * FROM Ingridients

INSERT INTO MealIngridients(MealId,IngridientId)
VALUES
(7,8),
(7,9),
(7,13),
(8,12),
(8,7),
(8,1),
(8,4),
(11,2),
(11,6),
(11,13),
(13,13),
(13,6),
(13,10)




SELECT Id,Name,
(SELECT COUNT(Id) FROM MealIngridients WHERE MealId=Meals.Id) AS 'IngridientCount' FROM Meals

SELECT * FROM Ingridients
WHERE (SELECT COUNT(Id) FROM MealIngridients WHERE IngridientId=Ingridients.Id)>0

SELECT MI.Id,M.Name AS 'MealName',C.Name AS 'CountryName', I.Name AS 'IngridientName' FROM MealIngridients AS MI
FULL OUTER JOIN Meals AS M ON MI.MealId=M.Id
FULL OUTER JOIN Ingridients AS I ON MI.IngridientId = I.Id
FULL OUTER JOIN Countries AS C ON M.CountryId=C.Id

CREATE TABLE Countries
(
	Id INT PRIMARY KEY IDENTITY,
	Name NVARCHAR(100)
)

ALTER TABLE Meals
ADD CountryId INT FOREIGN KEY REFERENCES Countries(Id)

SELECT M.Id,M.Name,
	C.Name AS 'CountryName',
	(SELECT COUNT(Id) FROM MealIngridients WHERE MealId=M.Id) AS 'IngridientCount' 
FROM Meals AS M
JOIN Countries AS C ON M.CountryId = C.Id













