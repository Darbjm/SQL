
--Q1 Show the average price total for each broker. The results should have two columns: broker_id and average price total.
SELECT broker_id, AVG(price_total) AS avg_price_total
FROM   trades
GROUP BY broker_id;

--Q2 Find the date of the earliest trade for each stock exchange. The results should have two columns: stock_ex_id and transaction_time.
SELECT STOCK_EX_ID, MIN(TRANSACTION_TIME) AS EARLIEST
FROM TRADES
GROUP BY STOCK_EX_ID;

--Q3 Show the number of shares priced in each currency. The results should have two columns: currency_id and number of shares priced in that currency.
SELECT CURRENCY_ID, COUNT(SHARE_ID) AS "NUMBER OF SHARES"
FROM SHARES
GROUP BY CURRENCY_ID;

--Q4 Show the total share amount for each share. The results should have two columns: share_id and total share amount.
SELECT SHARE_ID, SUM(SHARE_AMOUNT) AS "TOTAL SHARE AMOUNT"
FROM TRADES
GROUP BY SHARE_ID;

--Q5 How many trades have been made on NYSE
SELECT COUNT(T.TRADE_ID) AS "NUMBER OF TRADES"
FROM TRADES T
JOIN
STOCK_EXCHANGES S
ON T.STOCK_EX_ID = S.STOCK_EX_ID
WHERE S.SYMBOL = 'NYSE';

--Q6 How many shares have been traded on the LSE (total share_amount).
SELECT COUNT(T.SHARE_AMOUNT) AS "TOTAL SHARES TRADED"
FROM TRADES T
JOIN
STOCK_EXCHANGES S
ON T.STOCK_EX_ID = S.STOCK_EX_ID
WHERE S.SYMBOL = 'LSE';

--Q7 How many companies based in the UK have names starting with B.
SELECT C.NAME
FROM COMPANIES C
JOIN
PLACES P
ON C.PLACE_ID = P.PLACE_ID
WHERE p.country = 'United Kingdom' AND c.name LIKE 'B%';

--Q8 The number of trades made by any broker in the last 10 days. Show 2 columns: broker name and number of trades.
SELECT b.first_name||' '||b.last_name AS broker,
COUNT(T.TRADE_ID) AS "TOTAL SHARES TRADED"
FROM TRADES T
JOIN
BROKERS B
ON B.BROKER_ID = T.BROKER_ID
WHERE SYSDATE > SYSDATE - 10
GROUP BY b.first_name||' '||b.last_name;