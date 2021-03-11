--Q1 List broker IDs which have an average price total of over 4,000,000 HINT: modify your query from module 9 part 1.
SELECT BROKER_ID, AVG(price_total) AS avg_price_total 
FROM TRADES
GROUP BY BROKER_ID
HAVING AVG(PRICE_TOTAL) > 4000000
;

--Q2 List stock exchange IDs where each stock exchange’s earliest transaction time took place within the last 365 days. HINT: modify your query from module 9 part 2
SELECT STOCK_EX_ID, MIN(TRANSACTION_TIME)
FROM TRADES
GROUP BY STOCK_EX_ID
HAVING MIN(TRANSACTION_TIME) > SYSDATE - 365
;

--Q3 List currency IDs used to price 4 or more shares.
SELECT CURRENCY_ID, COUNT(SHARE_ID)
FROM SHARES
GROUP BY CURRENCY_ID
HAVING COUNT(SHARE_ID) > 3;

--Q4 List share IDs with a total share amount above 100,000
SELECT SHARE_ID, SUM(SHARE_AMOUNT)
FROM TRADES
GROUP BY SHARE_ID
HAVING SUM(SHARE_AMOUNT) > 100000;

--Q5 List place IDs with more than 2 companies.
SELECT PLACE_ID, COUNT(COMPANY_ID)
FROM COMPANIES
GROUP BY PLACE_ID
HAVING COUNT(COMPANY_ID) > 1;

--Q6 List share IDs whose highest price total is above 1 million.
SELECT SHARE_ID, MAX(PRICE_TOTAL)
FROM TRADES
GROUP BY SHARE_ID
HAVING MAX(PRICE_TOTAL) > 100000;

--Q7 List share IDs which have been traded more than twice by broker ID 1
SELECT SHARE_ID, COUNT(TRADE_ID)
FROM TRADES
WHERE BROKER_ID = 1
GROUP BY SHARE_ID
HAVING COUNT(TRADE_ID) > 2;

--Q8 List share IDs which have more than 5 trades with a price_total above 1 million
SELECT SHARE_ID, COUNT(TRADE_ID)
FROM TRADES
WHERE PRICE_TOTAL > 100000
GROUP BY SHARE_ID
HAVING COUNT(TRADE_ID) > 5;

--EXTRA QS

--Q1 List stock ex ids with an average share amount above 1000 in the last 60 day
SELECT STOCK_EX_ID, AVG(SHARE_AMOUNT)
FROM TRADES
WHERE TRANSACTION_TIME > SYSDATE - 60
GROUP BY STOCK_EX_ID
HAVING AVG(SHARE_AMOUNT) > 1000;

--Q2 Modify your query to show the names of the stock exchanges.
SELECT S.NAME
FROM TRADES T
JOIN
STOCK_EXCHANGES S
ON T.STOCK_EX_ID = S.STOCK_EX_ID
WHERE T.TRANSACTION_TIME > SYSDATE - 60
GROUP BY S.NAME
HAVING AVG(T.SHARE_AMOUNT) > 1000;
