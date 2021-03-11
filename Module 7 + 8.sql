--Q1 Write a query which shows the names of stock exchanges where some trades have been made.\
SELECT NAME\
FROM STOCK_EXCHANGES\
WHERE STOCK_EX_ID IN (\
SELECT STOCK_EX_ID\
FROM TRADES);\
\
--Q2 Modify your previous query so that it shows the names of stock exchanges where no trades have been made.\
SELECT NAME\
FROM STOCK_EXCHANGES\
WHERE STOCK_EX_ID NOT IN (\
SELECT STOCK_EX_ID\
FROM TRADES);\
\
--Q3 Write a query which shows the names of cities which have a stock exchange.\
SELECT CITY\
FROM PLACES\
WHERE PLACE_ID IN (\
SELECT PLACE_ID\
FROM STOCK_EXCHANGES\
);\
\
--Q4 Modify your previous query to show cities which don\'92t have a stock exchange.\
SELECT CITY\
FROM PLACES\
WHERE PLACE_ID NOT IN (\
SELECT PLACE_ID\
FROM STOCK_EXCHANGES\
);\
\
--Q5 Write a query which shows share ids traded by broker 1.\
-- Write a query which shows share ids traded on stock exchange 3.\
-- Use a set function to combine the two queries to show share ids which were traded by broker 1 or traded on stock exchange 3 (or both)\
SELECT SHARE_ID\
FROM TRADES\
WHERE BROKER_ID = 1\
UNION\
SELECT SHARE_ID\
FROM TRADES\
WHERE STOCK_EX_ID = 3;\
\
\
--Q6 Use a set function to show share ids which were traded by broker 1 but not traded on stock exchange 3.\
SELECT SHARE_ID\
FROM TRADES\
WHERE BROKER_ID = 1\
MINUS\
SELECT SHARE_ID\
FROM TRADES\
WHERE STOCK_EX_ID = 3;\
\
--Q7 Use a set function to show share ids which were traded by broker 1 on stock exchange 3.\
SELECT SHARE_ID, BROKER_ID, STOCK_EX_ID\
FROM TRADES\
WHERE BROKER_ID = 1\
INTERSECT\
SELECT SHARE_ID, BROKER_ID, STOCK_EX_ID\
FROM TRADES\
WHERE STOCK_EX_ID = 3;\
\
}