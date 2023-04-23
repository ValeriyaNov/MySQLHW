USE workshem;
SELECT sity, sname, snum, comm
FROM salespeople;

USE workshem;
SELECT rating, cname
FROM customers
WHERE sity = 'San Jose';

USE workshem;
SELECT DISTINCT snum
FROM orderss;

USE workshem;
SELECT *
FROM customers
WHERE cname LIKE 'G%';

USE workshem;
SELECT MIN(amt)
FROM orderss;



USE workshem;
SELECT *
FROM orderss
WHERE amt > 1000;

USE workshem;
SELECT *
FROM customers
WHERE rating > 100 and sity != 'Rome';


USE workshem;
SELECT *
FROM staff
ORDER BY salary;

USE workshem;
SELECT *
FROM staff
ORDER BY salary DESC;


USE workshem;
SELECT post, SUM(salary) as total_salary 
FROM staff
GROUP BY post
HAVING total_salary > 100000;
