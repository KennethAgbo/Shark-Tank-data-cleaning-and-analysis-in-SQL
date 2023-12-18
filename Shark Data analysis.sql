USE shark_tank;

-- 1. What is the distribution of startups across different seasons of Shark Tank?
-- NOTE; TO JOIN SQL AND POWER BI,WE USE CREATE VIEW AS
	CREATE VIEW  `DISTRIBUTION OF STARTUPS` AS
    SELECT `season number`, count(`Startup Name`) as `count of pitchers`
    FROM `data`
    GROUP BY 	`Season number`
    ORDER BY `COUNT OF PITCHERS` ASC;
    
    SELECT * FROM data;

-- 2. What industries were most commonly represented in the show?
CREATE VIEW  `highest industries represented` AS
SELECT `season number`,industry, count(industry)
    FROM `data`
    GROUP BY 	`Season number`, industry
    ORDER BY `count(industry)` DESC;

-- 3. How was the gender distribution among the entrepreneurs who pitched their startups?
CREATE VIEW  `Entrepreneurs by gender` AS
SELECT `pitchers gender`, count(`pitchers gender`) as `count of pitchers gender`
FROM data
GROUP BY `pitchers gender`
order by `count of pitchers gender` DESC;

SELECT * FROM data;
-- 4. Which city and state were most entrepreneurs from?
CREATE VIEW  `most appeared entrepreneurs city and state` AS
SELECT `pitchers state`,`pitchers city`, count(`pitchers city`),count(`pitchers state`)
    FROM `data`
    GROUP BY 	`pitchers state`, `pitchers city`
    ORDER BY `pitchers state` DESC;
    -- 0R 
    SELECT `pitchers state`,`pitchers city`, count(`pitchers city`),count(`pitchers state`)
    FROM `data`
    GROUP BY 	1, 2
    ORDER BY 3 DESC;

SELECT * FROM data;
-- 5. How many of the pitches actually got a deal with the sharks?
CREATE VIEW  `number of pitchers that secured deal` AS
SELECT  count(`Got Deal`) FROM data
	WHERE `Got Deal` = 1;
-- 6. What was the total amount secured by startups in deals?
CREATE VIEW  `Total amount of deals by startups` AS
SELECT sum(`investment amount per shark`) `Total Amount`
FROM data
where `Got Deal` = 1;

-- 7. What was the total average equity given up by startups in each industries when got deals?
SELECT * FROM data;

CREATE VIEW  `total average equity` AS
SELECT Industry, round(avg(`Total Deal equity`),2) `average equity`
From data
WHERE `Got Deal`= 1
GROUP BY Industry;


--  8. How much did Barbara Corcoran typically invest in startups, and what equity did she receive?\
 (SELECT * FROM `data`);

SELECT sum(`Barbara Corcoran Investment Amount`),`Total Amount`, sum(`Barbara Corcoran Investment Equity`) `Total equity` from data;
-- 9. How much did Mark Cuban typically invest in startups, and what equity did he receive?

SELECT sum(`Mark Cuban Investment Amount`) `Total Amount`, sum(`Mark Cuban Investment Equity`) `Total equity`
FROM data;

-- 10. How much did Lori Greiner typically invest in startups, and what equity did she receive?
SELECT * FROM data;
SELECT sum(`Lori Greiner Investment Amount`) `Total amount`, sum(`Lori Greiner Investment equity`) `total equity`
FROM data;
-- 11. How much did Robert Herjavec typically invest in startups, and what equity did he receive?
SELECT sum(`Robert Herjavec Investment Amount`) `Total amount`, sum(`Robert Herjavec Investment equity`)`total equity`
FROM data;
-- 12. How much did Daymond John typically invest in startups, and what equity did he receive?
SELECT sum(`Daymond John Investment Amount`) `Total amount`, sum(`Daymond John Investment Amount`) `total equity`
FROM data;
-- 13. How much did Kevin O'Leary typically invest in startups, and what equity did he receive?
SELECT sum(`Kevin O Leary Investment Amount`) `Total amount`, sum(`Kevin O Leary Investment Amount`) `total equity`
FROM data;

-- TO JOIN TWO QUARIES TOGETHER, we use UNION. BUT THE COLUMNS MUST HAVE THE SAME NUMBER OF COLUMNS
CREATE VIEW  `display of union of sharks investments` AS
SELECT "Barbara Corcoran" AS NAME, sum(`Barbara Corcoran Investment Amount`) `Total Amount`, sum(`Barbara Corcoran Investment Equity`) `Total equity` from data

UNION

SELECT "Mark Cuban" AS NAME,sum(`Mark Cuban Investment Amount`) `Total Amount`, sum(`Mark Cuban Investment Equity`) `Total equity`
FROM data
UNION
SELECT "Lori Greiner" AS NAME, sum(`Lori Greiner Investment Amount`) `Total amount`, sum(`Lori Greiner Investment equity`) `total equity`
FROM data
UNION
SELECT "Robert Herjavec" AS NAME, sum(`Robert Herjavec Investment Amount`) `Total amount`, sum(`Robert Herjavec Investment equity`) `total equity`
FROM data
UNION
SELECT "Daymond John" AS NAME, sum(`Daymond John Investment Amount`) `Total amount`, sum(`Daymond John Investment Equity`) `total equity`
FROM data
UNION
SELECT "Kevin O Leary" AS NAME, sum(`Kevin O Leary Investment Amount`) `Total amount`, sum(`Kevin O Leary Investment Equity`) `total equity`
FROM data;

SELECT * FROM data;



-- 14. Which entrepreneur has secured the largest investment deal in "Shark Tank" history
CREATE VIEW `top five entrepreneurs that secured largest investment deal` AS
SELECT `Entrepreneur Names`,(`investment amount per shark`) FROM data
ORDER BY (`investment amount per shark`) DESC
LIMIT 0,5;

-- 15.  Which shark has invested the most money in businesses related to the food and beverage industry?
-- Note: apply CTE= Common Table Expression

 SELECT * FROM data;
CREATE VIEW  `max investment by the sharks` AS
With W AS (
SELECT "Barbara Corcoran" AS NAME, max(`Barbara Corcoran Investment Amount`) max FROM data
where  Industry= "food and beverage"
UNION

SELECT "Mark Cuban" AS NAME, max(`Mark Cuban Investment Amount`) max FROM data
where  Industry= "food and beverage"
UNION

SELECT "Lori Greiner" AS NAME, max(`Lori Greiner Investment Amount`) max FROM data
where  Industry= "food and beverage"
UNION

SELECT "Robert Herjavec" AS NAME, max(`Robert Herjavec Investment Amount`) max FROM data
where  Industry= "food and beverage"
UNION

SELECT "Daymond John" AS NAME, max(`Daymond John Investment Amount`) max FROM data
where  Industry= "food and beverage"
UNION

SELECT "Kevin O Leary" AS NAME, max(`Kevin O Leary Investment Amount`) max FROM data
where  Industry= "food and beverage")
SELECT * FROM W
WHERE Max =(SELECT max(max) from W);

-- To get total amount invested on food and beverages by sharks

CREATE VIEW `Total investment by sharks on food and beverages` AS
SELECT "Barbara Corcoran" AS NAME, sum(`Barbara Corcoran Investment Amount`) `Total Amount` FROM data
where  Industry= "food and beverage"
UNION

SELECT "Mark Cuban" AS NAME, sum(`Mark Cuban Investment Amount`) `Total Amount` FROM data
where  Industry= "food and beverage"
UNION

SELECT "Lori Greiner" AS NAME, sum(`Lori Greiner Investment Amount`) `Total Amount` FROM data
where  Industry= "food and beverage"
UNION

SELECT "Robert Herjavec" AS NAME, sum(`Robert Herjavec Investment Amount`) `Total Amount` FROM data
where  Industry= "food and beverage"
UNION

SELECT "Daymond John" AS NAME, sum(`Daymond John Investment Amount`) `Total Amount` FROM data
where  Industry= "food and beverage"
UNION

SELECT "Kevin O Leary" AS NAME, sum(`Kevin O Leary Investment Amount`) `Total Amount` FROM data
where  Industry= "food and beverage";

-- 16. Are there any trends in the industries or product categories that tend to receive higher valuation offers from the sharks?
-- Note;;; once you hear trend, the best visualization chart is scatter area chart. it is use to monitor trend relationship. 
SELECT* FROM data;

CREATE VIEW `deal valuations by industries` AS
SELECT `industry`, sum(`Valuation Requested`),sum( `Deal Valuation`) FROM data
WHERE `Deal Valuation` <> 0
group by industry;

-- 17. Did startups with a larger number of entrepreneurs tend to secure more favorable deals?
-- AFTER THAT, INTRODUCE CTE
CREATE VIEW `DISTRIBUTION OF START UP WITH LARGE ENTREPRENEURS` AS
WITH TEMPO AS (SELECT `Multiple Entrepreneurs`,`Original Ask Amount` - `Total Deal Amount` AS `FAVOURABLE DEAL` FROM data
WHERE `Got Deal` IS NOT NULL)
SELECT `Multiple Entrepreneurs`,count(`FAVOURABLE DEAL` ) FROM TEMPO
WHERE `FAVOURABLE DEAL` >=0
GROUP BY `Multiple Entrepreneurs` ;

SELECT `Multiple Entrepreneurs`, count(`Multiple Entrepreneurs`) 
FROM data
GROUP BY `Multiple Entrepreneurs`;


-- 18. Which industry or product category receives the highest average deal valuation from the sharks?
SELECT * FROM data;
CREATE VIEW `Industry with highest deal valuation` AS
SELECT Industry, avg(`Deal Valuation`) FROM data
group by  Industry
order by avg(`Deal Valuation`) DESC;


-- 19. How do the total investments made by male and female entrepreneurs compare?
CREATE VIEW `total investment by gender` AS
SELECT `Pitchers Gender`, sum(`Total Deal Amount`) FROM data
GROUP BY `Pitchers Gender`
ORDER BY sum(`Total Deal Amount`) DESC ;

CREATE VIEW `count of pitchers` AS
SELECT count(`Entrepreneur Names`) from data;

-- 20. Are there any correlations between the amount of equity offered and the probability of securing a deal?


