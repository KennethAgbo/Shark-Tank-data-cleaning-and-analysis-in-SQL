CREATE DATABASE shark_tank;

USE shark_tank;

SELECT * FROM `data`;

DESCRIBE `data`;

SELECT `Original Air Date` FROM Data;

SELECT str_to_date(`Original Air Date`,"%d-%M-%y") FROM `data`;
-- note;;; str_to_date, must write the date and format its formal form

-- SELECT date_format ( str_to_date(`Original Air Date`,"%d-%M-%y"),"%y-%M-%d" FROM data;

-- SELECT date_format("%y-%M-%d);

ALTER TABLE data
MODIFY `Original Air Date` date; 

UPDATE data
SET `Original Air Date` = str_to_date(`Original Air Date`,"%d-%M-%y");

-- firstly run the str_to_date, update data, then alter table data modify

-- UPDATE the total deal amount to 0 where they are empty

SELECT `Total Deal Amount` from data;

UPDATE data
SET  `Total Deal Amount` =0
where `total deal amount` = "";

-- change the data type or total deal amount to int

ALTER Table data
MODIFY `Total Deal Amount` int;

describe `data`;

-- update total deal equity to 0 where they empty
UPDATE data
SET `Total DEAL equity`= 0
WHERE `Total DEAL equity`= "";

-- Change the data type of total deal equity from text to int
ALTER Table data
modify `Total Deal equity` int;

SELECT `Deal Valuation` from data;

UPDATE data
SET  `deal valuation` =0
where ` deal valuation` = "";

ALTER Table data
modify `Deal Valuation` int;

UPDATE data
SET  `number of sharks in deal` =0
where `number of sharks in deal` = "";

ALTER Table data
modify `number of sharks in deal` int;


UPDATE data
SET  `investment amount per shark` =0
where `investment amount per shark` = "";

ALTER Table data
modify `investment amount per shark` int;

UPDATE data
SET  `equity per shark` =0
where `equity per shark` = "";

ALTER Table data
modify `equity per shark` int;

SELECT `Loan` from data;
DESCRIBE `DATA`;

/*
Barbara Corcoran Investment Amount,Barbara Corcoran Investment Equity,Mark Cuban Investment Amount,Mark Cuban Investment Equity,
Lori Greiner Investment Amount,Lori Greiner Investment Equity,Robert Herjavec Investment Amount,Robert Herjavec Investment Equity,
Daymond John Investment Amount,Daymond John Investment Equity,Kevin O Leary Investment Amount,Kevin O Leary Investment Equity,
Guest Investment Amount,Guest Investment Equity
*/
UPDATE data
SET  `Barbara Corcoran Investment Amount` =0
where `Barbara Corcoran Investment Amount` = "";

ALTER Table data
modify `Barbara Corcoran Investment Amount` int;

UPDATE data
SET  `Barbara Corcoran Investment Equity` =0
where `Barbara Corcoran Investment Equity` = "";

ALTER Table data
modify `Barbara Corcoran Investment Equity` int;

UPDATE data
SET  `Mark Cuban Investment Amount` =0
where `Mark Cuban Investment Amount` = "";

ALTER Table data
modify `Mark Cuban Investment Amount` int;

UPDATE data
SET  `Mark Cuban Investment Equity` =0
where `Mark Cuban Investment Equity` = "";

ALTER Table data
modify `Mark Cuban Investment Equity` int;

UPDATE data
SET  `Lori Greiner Investment Amount` =0
where `Lori Greiner Investment Amount` = "";

ALTER Table data
modify `Lori Greiner Investment Amount` int;


UPDATE data
SET  `Lori Greiner Investment Equity` =0
where `Lori Greiner Investment Equity` = "";

ALTER Table data
modify `Lori Greiner Investment Equity` int;



UPDATE data
SET  `Robert Herjavec Investment Amount` =0
where `Robert Herjavec Investment Amount` = "";

ALTER Table data
modify `Robert Herjavec Investment Amount` int;

UPDATE data
SET  `Robert Herjavec Investment Equity` =0
where `Robert Herjavec Investment Equity` = "";

ALTER Table data
modify `Robert Herjavec Investment Equity` int;

UPDATE data
SET  `Daymond John Investment Amount` =0
where `Daymond John Investment Amount` = "";

ALTER Table data
modify `Daymond John Investment Amount` int;

UPDATE data
SET  `Daymond John Investment Equity` =0
where `Daymond John Investment Equity` = "";

ALTER Table data
modify `Daymond John Investment Equity` int;

UPDATE data
SET  `Kevin O Leary Investment Amount` =0
where `Kevin O Leary Investment Amount` = "";

ALTER Table data
modify `Kevin O Leary Investment Amount` int;

UPDATE data
SET  `Kevin O Leary Investment Equity` =0
where `Kevin O Leary Investment Equity` = "";

ALTER Table data
modify `Kevin O Leary Investment Equity` int;

UPDATE data
SET  `Guest Investment Amount` =0
where `Guest Investment Amount` = "";

ALTER Table data
modify `Guest Investment Amount` int;

UPDATE data
SET  `Guest Investment Equity` =0
where `Guest Investment Equity` = "";

ALTER Table data
modify `Guest Investment Equity` int;

UPDATE data
SET  `loan` =0
where `loan` = "";

UPDATE data
SET  `royalty deal` =0
where `royalty deal` = "";

DESCRIBE data;
SELECT* FROM Data;

SELECT `royalty deal` FROM Data;

SELECT `pitchers city` FROM Data;



CREATE Database classwork;

use classwork;

SELECT* FROM `sale record`;

DESCRIBE `sale record`;

/*
,Date,
*/


SELECT `date` from `sale record`;
SELECT str_to_date(`Date`,"%m/%d/%Y") FROM `sale record`;

UPDATE `sale record`
SET `Date` =str_to_date(`Date`,"%m/%d/%Y");

ALTER TABLE `sale record`
MODIFY `Date` date; 

-- 1. What is our best selling product?
SELECT (Price*quantity) as total_sales from `sale record`;

SELECT `product`, total_sales from `sale record`
ORDER BY total_sales DESC
LIMIT 0,1

-- 1.  What is the distribution of startups across different seasons of Shark Tank?





