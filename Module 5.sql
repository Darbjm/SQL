-- Q1
SELECT *
FROM CURRENCIES;

-- Q2
SELECT trade_id, transaction_time
FROM trades
WHERE TO_CHAR(transaction_time, 'MMYY') = TO_CHAR(SYSDATE, 'MMYY'); 

-- Q3
SELECT company_id, name, place_id
FROM companies
WHERE place_id = 3;

-- Q4
SELECT symbol
FROM stock_exchanges
WHERE name LIKE 'London%';

-- Q5
SELECT CITY
FROM PLACES
WHERE COUNTRY LIKE 'France%';

-- Q6
SELECT FIRST_NAME, LAST_NAME
FROM BROKERS
WHERE FIRST_NAME LIKE 'John%';

-- Q7
SELECT trade_id, transaction_time
FROM TRADES
WHERE transaction_time > SYSDATE - 7;

-- Q8
SELECT broker_id
FROM broker_stock_ex
WHERE stock_ex_id = 1;

-- Q9
SELECT *
FROM companies
WHERE company_id = 1;

-- Q10
SELECT *
FROM currencies
WHERE currency_id = 1;

-- Q11
SELECT *
FROM stock_exchanges
WHERE symbol LIKE 'TSE';

-- Q12
SELECT last_name
FROM brokers
WHERE broker_id = 2;

-- Q13
SELECT trade_id, price_total
FROM trades
WHERE stock_ex_id = 3 
AND share_amount > 20000;

-- Q14
SELECT broker_id
FROM broker_stock_ex
WHERE stock_ex_id = 2
ORDER BY broker_id ASC;

-- Q15
SELECT name
FROM currencies
WHERE name LIKE '%British%';

-- Q16
SELECT name
FROM stock_exchanges
WHERE symbol LIKE '%SE%'
ORDER BY name DESC;

-- Q17
SELECT share_id
FROM shares_prices
WHERE price >= 400 
AND price <= 500;

-- Q18
SELECT trade_id, transaction_time
FROM trades
WHERE transaction_time > SYSDATE - 365;

-- Q19
SELECT trade_id, transaction_time
FROM trades
WHERE TO_CHAR(transaction_time, 'YY') = TO_CHAR(SYSDATE, 'YY');

-- Q20
SELECT *
FROM trades
WHERE TO_CHAR(transaction_time, 'YY') = TO_CHAR(ADD_MONTHS(SYSDATE, -12), 'YY');

-- Q21
SELECT *
FROM trades
WHERE TO_CHAR(transaction_time, 'YYQ') = TO_CHAR(SYSDATE, 'YYQ');

-- Q22
SELECT trade_id 
FROM trades
WHERE price_total > 1000000
AND transaction_time > SYSDATE - 90;