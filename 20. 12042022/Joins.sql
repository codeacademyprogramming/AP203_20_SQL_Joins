SELECT * FROM Posts
JOIN Users ON Posts.UserId=Users.Id

SELECT * FROM Posts
LEFT JOIN Users ON Posts.UserId=Users.Id

SELECT * FROM Posts
RIGHT JOIN Users ON Posts.UserId = Users.Id

SELECT * FROM Posts
FULL OUTER JOIN Users ON Posts.UserId = Users.Id