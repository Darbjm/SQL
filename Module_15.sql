{\rtf1\ansi\ansicpg1252\cocoartf2577
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs24 \cf0 --Q1 Write a query which shows the average share amount for each broker_id rounded to zero\
--Decimal places. (this query is not an inline view)\
SELECT ROUND(AVG(SHARE_AMOUNT),0) AS AVERAGE_SHARE_AMOUNT, BROKER_ID\
FROM TRADES\
GROUP BY BROKER_ID;\
\
--Q2 Write a query which shows the lowest average share amount for any broker.\
-- HINT: turn the query in question 1 into an inline view and select the lowest number from\
-- the average share amount column.\
SELECT MIN(AVERAGE_SHARES)\
FROM (\
SELECT BROKER_ID, AVG(SHARE_AMOUNT) AS AVERAGE_SHARES\
FROM TRADES\
GROUP BY BROKER_ID\
);\
\
--Q3 Write a query which shows the average share amount for every broker including those\
--brokers who haven\'92t made any trades. Your query should return 2 columns: broker name,\
--average share amount.\
--HINT: turn the query from question 1 into an inline view and join it to the brokers table.\
SELECT B.FIRST_NAME || ' ' || B.LAST_NAME AS BROKER_NAME, SHARES\
FROM BROKERS B\
LEFT OUTER JOIN\
(\
SELECT BROKER_ID, AVG(SHARE_AMOUNT) AS SHARES\
FROM TRADES\
GROUP BY BROKER_ID) T\
ON T.BROKER_ID = B.BROKER_ID;\
\
--Q4 Write a query which shows the number of trades for each share. (this query is not an\
-- inline view)\
SELECT COUNT(*) AS NUMBER_OF_TRADES, SHARE_ID\
FROM TRADES\
GROUP BY SHARE_ID;\
\
--Q5 Write a query which shows the highest number of trades for any share.\
-- HINT: turn the query from question 4 into an inline view and select the highest number of\
--trades from it.\
SELECT MAX(NUMBER_OF_TRADES)\
FROM (\
SELECT COUNT(TRADE_ID) AS NUMBER_OF_TRADES, SHARE_ID AS SHARES\
FROM TRADES\
GROUP BY SHARE_ID\
);}