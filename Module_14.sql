--Q1 Use a correlated subquery to show the trade_id of the earliest transaction_time for each \
-- stock_exchange. The output should have 3 columns: stock_ex_id, trade_id,\
-- transaction_time.\
SELECT T.STOCK_EX_ID, T.TRANSACTION_TIME, T.TRADE_ID\
FROM TRADES T\
WHERE T.TRANSACTION_TIME = (\
SELECT MIN(T2.TRANSACTION_TIME)\
FROM TRADES T2\
WHERE T2.STOCK_EX_ID = T.STOCK_EX_ID\
);\
\
--Q2 Use a correlated subquery to show the broker with the highest price total for each\
\
-- stock_exchange. The output should have 3 columns: stock_ex_id, broker_id, price_total.\
\
SELECT T.STOCK_EX_ID, T.BROKER_ID, T.PRICE_TOTAL\
FROM TRADES T\
WHERE T.PRICE_TOTAL = (\
SELECT MAX(T2.PRICE_TOTAL)\
FROM TRADES T2\
WHERE T2.STOCK_EX_ID = T.STOCK_EX_ID\
);\
\
--Q3 Modify your query from question 1 to show the name of the stock exchange instead of the stock_ex_id.\
-- HINT: join the stock exchanges table to the trades table in the outer query.\
\
SELECT S.NAME, T.TRANSACTION_TIME, T.TRADE_ID\
FROM TRADES T\
JOIN\
STOCK_EXCHANGES S\
ON T.STOCK_EX_ID = S.STOCK_EX_ID\
WHERE T.TRANSACTION_TIME = (\
SELECT MIN(T2.TRANSACTION_TIME)\
FROM TRADES T2\
WHERE T2.STOCK_EX_ID = T.STOCK_EX_ID\
);\
\
--Q4 Modify your query from question 2 to show the name of the stock exchange and the name\
-- of the broker instead of their IDs.\
\
SELECT S.NAME, B.FIRST_NAME || ' ' || B.LAST_NAME AS BROKER_NAME, T.PRICE_TOTAL\
FROM TRADES T\
JOIN\
STOCK_EXCHANGES S\
ON T.STOCK_EX_ID = S.STOCK_EX_ID\
JOIN\
BROKERS B\
ON T.BROKER_ID = B.BROKER_ID\
WHERE T.PRICE_TOTAL = (\
SELECT MAX(T2.PRICE_TOTAL)\
FROM TRADES T2\
WHERE T2.STOCK_EX_ID = T.STOCK_EX_ID\
);\
\
--Q5 Use a correlated subquery to show the broker with the lowest share amount for each\
--month. The output should have 3 columns: month, broker_id, share_amount.\
--HINT: use the TO_CHAR function to extract the month from the transaction_time colum\
SELECT TO_CHAR(t.transaction_time,'MONTH') AS month,\
       t.broker_id,\
       t.share_amount\
FROM   trades t\
WHERE t.share_amount = \
(\
SELECT MIN(t2.share_amount)\
FROM trades t2\
WHERE TO_CHAR(t.transaction_time,'MONTH') = TO_CHAR(t2.transaction_time,'MONTH')\
);\
\
--Q6 Modify the previous query to show the name of the broker instead of the broker_id.\
SELECT TO_CHAR(t.transaction_time,'MONTH') AS month,\
       B.FIRST_NAME,\
       t.share_amount\
FROM   trades t\
JOIN\
BROKERS B\
ON T.BROKER_ID = B.BROKER_ID\
WHERE t.share_amount = \
(\
SELECT MIN(t2.share_amount)\
FROM trades t2\
WHERE TO_CHAR(t.transaction_time,'MONTH') = TO_CHAR(t2.transaction_time,'MONTH')\
);\
}