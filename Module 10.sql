--Q1 Show the stock_ex_id of the stock exchange where the most recent trade took place.
SELECT STOCK_EX_ID
FROM TRADES 
WHERE TRANSACTION_TIME = 
( 
SELECT MAX(TRANSACTION_TIME)
FROM TRADES
);

--Q2 Show the broker_id of the broker who made the trade with the highest trade_id.
SELECT BROKER_ID
FROM TRADES
WHERE TRADE_ID = (
SELECT MAX(TRADE_ID)
FROM TRADES);

--Q3 List the trade_ids which have an above average share_amount.
SELECT TRADE_ID
FROM TRADES
WHERE SHARE_AMOUNT > (
SELECT AVG(SHARE_AMOUNT)
FROM TRADES);