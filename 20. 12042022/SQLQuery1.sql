CREATE DATABASE BlogSite

USE BlogSite

CREATE TABLE Users
(
	Id INT PRIMARY KEY IDENTITY,
	Name NVARCHAR(20) NOT NULL,
	Surname NVARCHAR(20) NOT NULL,
	Email NVARCHAR(100) NOT NULL
		CONSTRAINT USR_EMAIL_UNQ UNIQUE 
		CONSTRAINT USR_EMAIL_CHK CHECK(LEN(Email)>3)
)

CREATE TABLE Posts
(
	Id INT PRIMARY KEY IDENTITY,
	Text NVARCHAR(500) NOT NULL,
	LikeCount INT CONSTRAINT POST_LC_CHK CHECK(LikeCount>=0),
	CreatedAt DATETIME2 DEFAULT(GETUTCDATE()),
)

ALTER TABLE Posts
ADD UserId INT 

ALTER TABLE Posts
ADD CONSTRAINT FK_POSTS_USERID FOREIGN KEY (UserId) REFERENCES Users(Id)


INSERT INTO Users(Name,Surname,Email)
VALUES
('Hikmet','Abbasov','hikmet@gmail.com'),
('Nermin','Abbasova','nermin@gmail.com'),
('Nezrin','Abbaszade','nezrin@gmail.com'),
('Tofiq','Quluzade','totu@gmail.com'),
('Elmeddin','Qezenferoglu','qezi@gmail.com')

SELECT * FROM Users

INSERT INTO Posts(UserId,Text,LikeCount,CreatedAt)
VALUES
(1,'Salam',30,'2020-10-20'),
(1,'Sag ol',3,'2020-10-21'),
(2,'Necesen?',20,'2021-10-20'),
(2,'Men yaxsi deyilem...',3,'2022-10-20'),
(4,'Salam dostlar',0,'2022-04-20'),
(2,'Qiril Tofiq',50,'2022-04-21')



SELECT Id,Name+' '+Surname AS 'FullName',Email FROM Users

SELECT * FROM Posts WHERE LikeCount>10
SELECT * FROM Posts WHERE LEN(Text) BETWEEN 6 AND 10

SELECT Id,Name,Surname,Email,(SELECT COUNT(Id) FROM Posts WHERE UserId=Users.Id) AS 'PostsCount' FROM Users

SELECT COUNT(Id) FROM Posts WHERE UserId=1

SELECT * FROM Users
WHERE (SELECT COUNT(Id) FROM Posts WHERE UserId = Users.Id)=0

SELECT AVG(LikeCount) FROM Posts
SELECT * FROM Posts WHERE LikeCount > (SELECT AVG(LikeCount) FROM Posts)	

 


