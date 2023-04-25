USE workshem;
SELECT MARK, COLOR, COUNT(*) AS COUNT
FROM auto
WHERE MARK IN ('BMW', 'LADA')
GROUP BY MARK, COLOR;

USE workshem;
SELECT MARK, COUNT(*) AS COUNT, 
(SELECT COUNT(*) FROM auto WHERE MARK <> a.MARK) AS COUNT_NOT_THIS_MARK
FROM auto a
GROUP BY MARK;


USE workshem;
create table test_a (id INT, test varchar(10));
create table test_b (id INT);
insert into test_a(id, test) values
(10, 'A'),
(20, 'A'),
(30, 'F'),
(40, 'D'),
(50, 'C');
insert into test_b(id) values
(10),
(30),
(50);

USE workshem;
SELECT a.id, a.test
FROM test_a a
LEFT JOIN test_b b ON a.id = b.id
WHERE b.id IS NULL;





