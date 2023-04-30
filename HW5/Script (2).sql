USE workshem;
DROP TABLE IF EXISTS Cars;
CREATE TABLE  Cars 
(       
	id INT AUTO_INCREMENT PRIMARY KEY,
	Name VARCHAR(10), 
	Cost INT NOT NULL
);
INSERT INTO Cars (Name, Cost)
VALUES
('Audi', 52642),
('Mercedes', 57127),
('Skoda', 9000),
('Volvo', 29000),
('Bentley', 350000),
('Citroen', 21000),
('Hummer', 41400),
('Volkswagen', 21600);
SELECT * FROM Cars;


DROP VIEW IF EXISTS autos;
CREATE VIEW autos
	AS SELECT *
    FROM Cars
    WHERE Cost < 25000;
SELECT * FROM autos;

ALTER VIEW autos 
AS SELECT *
    FROM Cars
    WHERE Cost < 30000;
SELECT * FROM autos;

DROP VIEW IF EXISTS skoda_audi;
CREATE VIEW skoda_audi
	AS SELECT *
    FROM Cars
    WHERE Name IN ('Audi', 'Skoda');
SELECT * FROM skoda_audi;


DROP TABLE IF EXISTS Analysis;
CREATE TABLE  Analysis
(
	an_id INT AUTO_INCREMENT PRIMARY KEY, -- ID анализа
    an_name VARCHAR(20), -- название анализа
    an_cost INT NOT NULL, -- себестоимость анализа
    an_price INT NOT NULL, -- розничная цена анализа
    an_group INT NOT NULL -- группа анализов
);
INSERT INTO Analysis (an_name, an_cost, an_price, an_group)
VALUES
('Гемоглобин', 2500, 3000, 3),
('Эритроциты', 1500, 3000, 2),
('Лейкоциты', 2500, 4000, 1),
('Лимфоциты', 500, 1000, 3),
('Базофилы', 500, 1000, 3),
('Тромбоциты', 1000, 4000, 1);
SELECT * FROM Analysis;
-- Есть таблица групп анализов Groups:
DROP TABLE IF EXISTS Groups_s;
CREATE TABLE  Groups_s
(
	gr_id INT AUTO_INCREMENT PRIMARY KEY, --  ID группы
    gr_name VARCHAR(20), -- название группы
    gr_temp INT NOT NULL -- температурный режим хранения
);
INSERT INTO Groups_s (gr_name, gr_temp)
VALUES
('Низкотемпературные', -5),
('Среднетемпературные', 0),
('Высокотемпературные', 22);
SELECT * FROM Groups_s;
-- Есть таблица заказов Orders:
DROP TABLE IF EXISTS Orders;
CREATE TABLE  Orders
(
	ord_id INT AUTO_INCREMENT PRIMARY KEY, --  ID заказа
    ord_datetime DATE NOT NULL, -- дата и время заказа
    ord_an INT NOT NULL -- ID анализа
);
INSERT INTO Orders (ord_datetime, ord_an)
VALUES
('2020-01-14', 3),
('2020-02-5', 5),
('2020-02-7', 1),
('2020-02-9', 4),
('2020-02-12', 6),
('2020-04-15', 3),
('2020-12-10', 2);
SELECT * FROM Orders;

SELECT an_name, an_price FROM Analysis
JOIN Orders ON Analysis.an_id = Orders.ord_an 
WHERE Orders.ord_datetime BETWEEN '2020-02-05' AND '2020-02-12';


DROP TABLE IF EXISTS Train_timetable;
CREATE TABLE  Train_timetable 
(       
	Id INT AUTO_INCREMENT PRIMARY KEY,
    train_id INT NOT NULL,
	staition VARCHAR(20), 
	staition_time TIME(0)
);
INSERT INTO Train_timetable (train_id, staition, staition_time)
VALUES
(110, 'San Francisco', '10:00:00'),
(110, 'Redwood City', '10:54:00'),
(110, 'Palo Alto', '11:02:00'),
(110, 'San Jose', '12:35:00'),
(120, 'San Francisco', '11:00:00'),
(120, 'Palo Alto', '12:49:00'),
(120, 'San Jose', '13:30:00');

SELECT train_id, staition, staition_time,
TIMEDIFF(LEAD(staition_time) OVER (PARTITION BY train_id ORDER BY train_id), staition_time) AS 'Time_to_next_station'
FROM Train_timetable;




















