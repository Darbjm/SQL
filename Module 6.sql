--Q1 List brokers names who work at stock exchange id of 1.\
SELECT b.first_name||' '||b.last_name AS broker\
FROM BROKERS B\
INNER JOIN\
BROKER_STOCK_EX S\
ON B.BROKER_ID = S.BROKER_ID\
WHERE S.STOCK_EX_ID = 1;\
\
--Q2 List brokers names who work at NYSE .\
SELECT b.first_name||' '||b.last_name AS broker\
FROM   brokers b\
INNER JOIN\
       broker_stock_ex bs\
ON     b.broker_id = bs.broker_id\
INNER JOIN \
       stock_exchanges s\
ON     s.stock_ex_id = bs.stock_ex_id\
WHERE  s.symbol = 'NYSE';\
\
--Q3 List the names of the companies based in London.\
SELECT NAME, C.PLACE_ID\
FROM COMPANIES C\
INNER JOIN\
PLACES P\
ON C.PLACE_ID = P.PLACE_ID\
WHERE P.CITY = 'London';\
\
--Q4 List the places where there are no companies.\
SELECT P.CITY\
FROM COMPANIES C\
RIGHT OUTER JOIN\
PLACES P\
ON C.PLACE_ID = P.PLACE_ID\
WHERE C.COMPANY_ID IS NULL;\
\
--Q5 List the names of companies and the names of currencies their shares are priced in.\
SELECT C.NAME, CR.NAME\
FROM COMPANIES C\
JOIN\
SHARES S\
ON S.COMPANY_ID = C.COMPANY_ID\
JOIN\
CURRENCIES CR\
ON S.CURRENCY_ID = CR.CURRENCY_ID;\
\
--Q6 List the names of brokers who work in the United Kingdom.\
SELECT B.FIRST_NAME || ' ' || B.LAST_NAME AS BROKER\
FROM BROKERS B\
JOIN\
BROKER_STOCK_EX BX\
ON B.BROKER_ID = BX.BROKER_ID\
JOIN\
STOCK_EXCHANGES SE\
ON BX.STOCK_EX_ID = SE.STOCK_EX_ID\
JOIN\
PLACES P\
ON SE.PLACE_ID = P.PLACE_ID\
WHERE P.COUNTRY = 'United Kingdom';\
\
--Q1.1 Create a list of companies and their locations. The results should have three columns - company name, city & country.\
SELECT C.NAME, P.CITY, P.COUNTRY\
FROM COMPANIES C\
JOIN\
PLACES P\
ON C.PLACE_ID = P.PLACE_ID;}