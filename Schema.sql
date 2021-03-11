{\rtf1\ansi\ansicpg1252\cocoartf2577
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs24 \cf0 DROP TABLE trades CASCADE CONSTRAINTS;\
DROP TABLE broker_stock_ex CASCADE CONSTRAINTS;\
DROP TABLE shares_prices CASCADE CONSTRAINTS;\
DROP TABLE shares CASCADE CONSTRAINTS;\
DROP TABLE stock_exchanges CASCADE CONSTRAINTS;\
DROP TABLE companies CASCADE CONSTRAINTS;\
DROP TABLE brokers CASCADE CONSTRAINTS;\
DROP TABLE currencies CASCADE CONSTRAINTS;\
DROP TABLE places CASCADE CONSTRAINTS;\
\
CREATE TABLE places (\
  place_id          NUMBER(6),\
  city              VARCHAR2(50),\
  country           VARCHAR2(50),\
  CONSTRAINT place_pk PRIMARY KEY (place_id)\
);\
\
CREATE TABLE currencies (\
  currency_id       NUMBER(6),\
  symbol            VARCHAR2(5),\
  name              VARCHAR2(50),\
  CONSTRAINT currency_pk PRIMARY KEY (currency_id)\
);\
\
CREATE TABLE brokers (\
  broker_id         NUMBER(6),\
  first_name        VARCHAR2(25),\
  last_name         VARCHAR2(25),\
  CONSTRAINT broker_pk PRIMARY KEY (broker_id)\
);\
\
CREATE TABLE companies (\
  company_id        NUMBER(6),\
  name              VARCHAR2(20),\
  place_id          NUMBER(6),\
  CONSTRAINT company_pk PRIMARY KEY (company_id),\
  CONSTRAINT comp_place_fk FOREIGN KEY (place_id) REFERENCES places(place_id)\
);\
\
CREATE TABLE stock_exchanges (\
  stock_ex_id       NUMBER(6),\
  name              VARCHAR2(50),\
  symbol            VARCHAR2(10),\
  place_id          NUMBER(6),\
  CONSTRAINT stock_ex_pk PRIMARY KEY (stock_ex_id),\
  CONSTRAINT se_place_fk FOREIGN KEY (place_id) REFERENCES places(place_id)\
);\
\
CREATE TABLE broker_stock_ex (\
  broker_id         NUMBER(6),\
  stock_ex_id       NUMBER(6),\
  CONSTRAINT bse_broker_fk FOREIGN KEY (broker_id) REFERENCES brokers(broker_id),\
  CONSTRAINT bse_se_fk FOREIGN KEY (stock_ex_id) REFERENCES stock_exchanges(stock_ex_id),\
  CONSTRAINT bse_pk PRIMARY KEY (broker_id, stock_ex_id)\
);\
\
CREATE TABLE shares (\
  share_id          NUMBER(6),\
  company_id        NUMBER(6),\
  currency_id       NUMBER(6),\
  CONSTRAINT share_pk PRIMARY KEY (share_id),\
  CONSTRAINT share_company_fk FOREIGN KEY (company_id) REFERENCES companies(company_id),\
  CONSTRAINT share_currency_fk FOREIGN KEY (currency_id) REFERENCES currencies(currency_id)\
);\
\
CREATE TABLE shares_prices (\
  share_id          NUMBER(6),\
  price             NUMBER(10,4),\
  time_start        DATE,\
  time_end          DATE,\
  CONSTRAINT shares_prices_pk PRIMARY KEY (share_id,time_start),\
  CONSTRAINT shares_prices_fk FOREIGN KEY (share_id) REFERENCES shares(share_id)\
);\
\
CREATE TABLE trades (\
  trade_id          NUMBER(9),\
  share_id          NUMBER(6),\
  broker_id         NUMBER(6),\
  stock_ex_id       NUMBER(6),\
  transaction_time  DATE,\
  share_amount      NUMBER(9),\
  price_total       NUMBER(20,2),\
  CONSTRAINT trade_pk PRIMARY KEY (trade_id),\
  CONSTRAINT trade_share_fk FOREIGN KEY (share_id) REFERENCES shares(share_id),\
  CONSTRAINT trade_broker_fk FOREIGN KEY (broker_id) REFERENCES brokers(broker_id),\
  CONSTRAINT trade_stock_ex_fk FOREIGN KEY (stock_ex_id) REFERENCES stock_exchanges(stock_ex_id)\
);\
\
INSERT INTO places (place_id,city,country) VALUES (1,'London','United Kingdom');\
INSERT INTO places (place_id,city,country) VALUES (2,'Paris','France');\
INSERT INTO places (place_id,city,country) VALUES (3,'New York','USA');\
INSERT INTO places (place_id,city,country) VALUES (4,'Tokyo','Japan');\
INSERT INTO places (place_id,city,country) VALUES (5,'Sydney','Australia');\
INSERT INTO places (place_id,city,country) VALUES (6,'Moscow','Russia');\
\
INSERT INTO currencies (currency_id,symbol,name) VALUES (1,'$','Dollar');\
INSERT INTO currencies (currency_id,symbol,name) VALUES (2,'\uc0\u128 ','Euro');\
INSERT INTO currencies (currency_id,symbol,name) VALUES (3,'\'a3','British Pound');\
INSERT INTO currencies (currency_id,symbol,name) VALUES (4,'p','British Pence');\
INSERT INTO currencies (currency_id,symbol,name) VALUES (5,'\'a5','Yen');\
\
INSERT INTO brokers (broker_id,first_name,last_name) VALUES (1,'John','Smith');\
INSERT INTO brokers (broker_id,first_name,last_name) VALUES (2,'Herbert','Jackson');\
INSERT INTO brokers (broker_id,first_name,last_name) VALUES (3,'Richard','Bradley');\
INSERT INTO brokers (broker_id,first_name,last_name) VALUES (4,'Frank','Denzel');\
INSERT INTO brokers (broker_id,first_name,last_name) VALUES (5,'Elric','Crofton');\
INSERT INTO brokers (broker_id,first_name,last_name) VALUES (6,'Ted','Gore');\
INSERT INTO brokers (broker_id,first_name,last_name) VALUES (7,'John','Bush');\
INSERT INTO brokers (broker_id,first_name,last_name) VALUES (8,'Andre','Sinclair');\
INSERT INTO brokers (broker_id,first_name,last_name) VALUEs (9,'Danielle','Perety');\
INSERT INTO brokers (broker_id,first_name,last_name) VALUES (10,'Arabella','Volvitz');\
INSERT INTO brokers (broker_id,first_name,last_name) VALUES (11,'Parker','Hamilton');\
INSERT INTO brokers (broker_id,first_name,last_name) VALUES (12,'Andrew','Wallace');\
INSERT INTO brokers (broker_id,first_name,last_name) VALUES (13,'Bruce','Smith');\
INSERT INTO brokers (broker_id,first_name,last_name) VALUES (14,'Tommy','Mack');\
INSERT INTO brokers (broker_id,first_name,last_name) VALUES (15,'Frederick','Raven');\
\
INSERT INTO companies (company_id,name,place_id) VALUES (1,'British Airways',1);\
INSERT INTO companies (company_id,name,place_id) VALUES (2,'The New York Times',3);\
INSERT INTO companies (company_id,name,place_id) VALUES (3,'Toyota',3);\
INSERT INTO companies (company_id,name,place_id) VALUES (4,'BNP Paribas',2);\
INSERT INTO companies (company_id,name,place_id) VALUES (5,'EDF',2);\
INSERT INTO companies (company_id,name,place_id) VALUES (6,'Tesco',1);\
INSERT INTO companies (company_id,name,place_id) VALUES (7,'IBM',1);\
INSERT INTO companies (company_id,name,place_id) VALUES (8,'Google',3);\
INSERT INTO companies (company_id,name,place_id) VALUES (9,'Castlemaine',5);\
\
INSERT INTO stock_exchanges (stock_ex_id,name,symbol,place_id) VALUES (1,'London Stock Exchange','LSE',1);\
INSERT INTO stock_exchanges (stock_ex_id,name,symbol,place_id) VALUES (2,'Euronext Paris','EP',2);\
INSERT INTO stock_exchanges (stock_ex_id,name,symbol,place_id) VALUES (3,'New York Stock Exchange','NYSE',3);\
INSERT INTO stock_exchanges (stock_ex_id,name,symbol,place_id) VALUES (4,'Tokyo Stock Exchange','TSE',4);\
INSERT INTO stock_exchanges (stock_ex_id,name,symbol,place_id) VALUES (5,'Moscow Stock Exchange','MSE',6);\
\
INSERT INTO broker_stock_ex (broker_id,stock_ex_id) VALUES (13,2);\
INSERT INTO broker_stock_ex (broker_id,stock_ex_id) VALUES (15,4);\
INSERT INTO broker_stock_ex (broker_id,stock_ex_id) VALUES (2,1);\
INSERT INTO broker_stock_ex (broker_id,stock_ex_id) VALUES (6,2);\
INSERT INTO broker_stock_ex (broker_id,stock_ex_id) VALUES (14,4);\
INSERT INTO broker_stock_ex (broker_id,stock_ex_id) VALUES (15,2);\
INSERT INTO broker_stock_ex (broker_id,stock_ex_id) VALUES (14,3);\
INSERT INTO broker_stock_ex (broker_id,stock_ex_id) VALUES (7,2);\
INSERT INTO broker_stock_ex (broker_id,stock_ex_id) VALUES (7,3);\
INSERT INTO broker_stock_ex (broker_id,stock_ex_id) VALUES (12,3);\
INSERT INTO broker_stock_ex (broker_id,stock_ex_id) VALUES (8,3);\
INSERT INTO broker_stock_ex (broker_id,stock_ex_id) VALUES (1,1);\
INSERT INTO broker_stock_ex (broker_id,stock_ex_id) VALUES (9,1);\
INSERT INTO broker_stock_ex (broker_id,stock_ex_id) VALUES (1,4);\
INSERT INTO broker_stock_ex (broker_id,stock_ex_id) VALUES (13,4);\
INSERT INTO broker_stock_ex (broker_id,stock_ex_id) VALUES (1,2);\
INSERT INTO broker_stock_ex (broker_id,stock_ex_id) VALUES (11,4);\
INSERT INTO broker_stock_ex (broker_id,stock_ex_id) VALUES (1,3);\
INSERT INTO broker_stock_ex (broker_id,stock_ex_id) VALUES (3,1);\
INSERT INTO broker_stock_ex (broker_id,stock_ex_id) VALUES (3,3);\
INSERT INTO broker_stock_ex (broker_id,stock_ex_id) VALUES (10,1);\
INSERT INTO broker_stock_ex (broker_id,stock_ex_id) VALUES (4,1);\
INSERT INTO broker_stock_ex (broker_id,stock_ex_id) VALUES (4,2);\
INSERT INTO broker_stock_ex (broker_id,stock_ex_id) VALUES (4,3);\
INSERT INTO broker_stock_ex (broker_id,stock_ex_id) VALUES (4,4);\
INSERT INTO broker_stock_ex (broker_id,stock_ex_id) VALUES (11,2);\
INSERT INTO broker_stock_ex (broker_id,stock_ex_id) VALUES (5,1);\
INSERT INTO broker_stock_ex (broker_id,stock_ex_id) VALUES (5,2);\
INSERT INTO broker_stock_ex (broker_id,stock_ex_id) VALUES (5,3);\
INSERT INTO broker_stock_ex (broker_id,stock_ex_id) VALUES (12,1);\
INSERT INTO broker_stock_ex (broker_id,stock_ex_id) VALUES (15,3);\
\
INSERT INTO shares (share_id,company_id,currency_id) VALUES (1,8,1);\
INSERT INTO shares (share_id,company_id,currency_id) VALUES (2,1,4);\
INSERT INTO shares (share_id,company_id,currency_id) VALUES (3,2,1);\
INSERT INTO shares (share_id,company_id,currency_id) VALUES (4,3,1);\
INSERT INTO shares (share_id,company_id,currency_id) VALUES (5,4,2);\
INSERT INTO shares (share_id,company_id,currency_id) VALUES (6,5,2);\
INSERT INTO shares (share_id,company_id,currency_id) VALUES (7,6,4);\
INSERT INTO shares (share_id,company_id,currency_id) VALUES (8,7,1);\
\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE,468.15);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -3,474.06);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -4,465.3);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -5,469.37);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -6,471.22);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -7,471.76);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -10,471.65);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -11,472.99);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -12,474.82);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -13,467.53);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -14,418.99);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -17,408.49);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -18,409.61);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -19,396.63);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -20,402.49);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -21,410.39);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -24,414.4);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -25,424.3);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -26,424.69);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -27,438.17);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -28,442.6);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -31,430.25);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -32,430.17);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -33,427.9);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -34,427.9);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -35,437.34);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -38,446.72);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -39,444.8);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -40,439.85);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -41,436.24);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -42,445.64);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -45,443.05);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -46,452.21);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -47,453.73);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -48,451.14);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -49,450.36);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -52,457.1);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -53,456.61);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -54,453.94);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -55,458.58);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -56,462.28);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -57,460);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -60,444.89);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -61,445.28);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -62,443.97);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -63,460.41);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -64,465.24);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -67,468.73);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -68,471.37);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -69,468);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -70,466.06);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -71,464.75);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -74,461.67);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -75,455.76);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -76,453.01);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -77,457.52);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -78,461.3);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -81,458.62);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -82,463.97);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -83,470.94);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -84,472.14);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -85,475.12);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -88,477.54);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -89,488.29);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -90,491.72);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -91,491.46);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -92,497);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -95,499.06);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -96,498.46);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -97,496.77);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -98,492.48);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -99,498.53);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -102,498.53);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -103,495.85);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -104,487.2);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -105,484.58);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -106,488.52);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -109,498.74);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -110,517.54);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -111,514.18);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -112,516.25);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -113,524.04);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -116,526.11);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -117,535.32);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -118,529.91);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -119,549.85);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -120,552.09);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -123,551.72);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -124,551.1);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -125,554.09);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -126,553.69);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -127,554.21);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -130,548.29);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -131,540.3);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -132,551.05);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -133,536.12);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -134,533.99);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -137,537.29);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -138,540.33);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -139,548.65);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -140,551.1);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -141,562.51);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -144,566.76);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -145,570.56);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -146,567.85);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -147,572.05);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -148,576.28);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -151,577.49);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -152,576.65);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -153,572.99);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -154,569.96);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -155,582.35);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -158,583.09);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -159,585.74);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -160,579.76);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -161,583);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -162,589.87);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -165,587.51);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -166,585.74);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -167,585.74);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -168,586.25);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -169,587.05);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -171,589.02);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -172,591.5);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -173,590.51);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -174,595.73);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -175,593.14);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -178,597.76);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -179,593.94);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -180,596.42);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -183,598.68);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -184,601.12);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -185,611.68);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -186,618.48);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -187,622.87);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -190,619.43);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -200,613.21);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -210,608.95);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -220,611.46);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -230,612.53);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -240,613.48);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -250,616.14);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -260,617.39);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -270,621.73);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -280,625.21);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -290,623.67);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -300,628.42);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -310,630.59);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -320,632.88);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -330,633.34);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -340,631.75);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -350,630.11);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -360,634.47);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -370,637.84);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -380,639.98);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (1,SYSDATE -390,642.38);\
\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE,124);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -3,119);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -4,125.5);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -5,123.9);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -6,122.2);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -7,118);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -10,119.9);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -11,120);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -12,126.6);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -13,128.1);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -14,128.8);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -17,132.1);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -18,136);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -19,132.8);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -20,136);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -21,137.3);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -24,138.4);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -25,136.9);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -26,132.3);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -27,128.4);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -28,130.9);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -31,134.3);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -32,142.4);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -33,145.5);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -34,150.2);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -35,161.7);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -38,169.9);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -39,171);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -40,168.8);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -41,164);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -42,170.9);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -45,170.9);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -46,175.6);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -47,173.9);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -48,173.2);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -49,172);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -52,175.5);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -53,188.2);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -54,189.9);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -55,196.6);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -56,191.7);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -57,187.5);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -60,191.5);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -61,187.8);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -62,181.5);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -63,184);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -64,189.4);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -67,192.8);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -68,201);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -69,201);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -70,215.7);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -71,221.4);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -74,217);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -75,217);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -76,227.4);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -77,239.9);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -78,235.7);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -81,233.1);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -82,231.2);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -83,229.9);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -84,220);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -85,213.6);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -88,215.8);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -89,216.6);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -90,220.5);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -91,217.8);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -92,210.3);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -95,217);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -96,222.8);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -97,223);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -98,221.3);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -99,218.9);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -102,221.8);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -103,219.6);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -104,224.9);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -105,220.9);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -106,214.1);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -109,213.8);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -110,216);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -111,218.5);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -112,209.5);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -113,209.8);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -116,199.7);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -117,193.7);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -118,183.3);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -119,189.5);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -120,181.8);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -123,179.9);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -124,179.9);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -125,191.8);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -126,186.3);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -127,198.8);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -130,199.3);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -131,196.4);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -132,200);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -133,215);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -134,217);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -137,215.3);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -138,208.5);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -139,206.4);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -140,201);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -141,202.6);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -144,203.9);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -145,204);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -146,202.1);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -147,193.2);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -148,193.8);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -151,195.3);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -152,199);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -153,202.4);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -154,206.2);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -155,212);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -158,207.4);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -159,204.6);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -160,200.1);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -161,202.3);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -162,201.3);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -165,201);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -166,196.6);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -167,197);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -168,192.2);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -169,188.5);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -171,193);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -172,189.1);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -173,188.2);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -174,192);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -175,192);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -178,189);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -190,189.5);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -200,188.3);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -210,187.1);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -220,186.7);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -230,185.4);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -240,186.2);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -250,184.3);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -260,182.1);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -270,183.2);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -280,182.1);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -290,180.9);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -300,179.7);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -310,178.8);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -320,177.9);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -330,177.2);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -340,176.6);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -350,176.9);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -360,176.8);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -370,177.2);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -380,177.3);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (2,SYSDATE -390,177.1);\
\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE,6.19);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -3,6.15);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -4,5.52);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -5,5.39);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -6,5.07);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -7,4.96);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -10,4.91);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -11,4.8);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -12,4.77);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -13,4.95);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -14,5.05);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -17,5.63);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -18,5.54);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -19,6.08);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -20,6.42);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -21,6.62);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -24,6.5);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -25,6.66);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -26,7.71);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -27,7.56);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -28,7.52);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -31,7.62);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -32,7.87);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -33,8.38);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -34,8.39);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -35,8.1);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -38,8.13);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -39,8.14);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -40,8.1);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -41,7.96);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -42,8.02);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -45,8.07);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -46,8);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -47,7.58);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -48,7.69);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -49,7.88);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -52,5.46);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -53,7.68);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -54,7.71);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -55,7.82);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -56,8);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -57,8.01);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -60,7.95);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -61,7.95);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -62,7.97);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -63,7.61);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -64,7.3);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -67,7.12);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -68,7.14);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -69,7.14);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -70,7.2);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -71,7.37);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -74,7.72);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -75,7.78);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -76,7.73);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -77,7.88);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -78,8.82);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -81,8.42);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -82,8.36);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -83,8.16);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -84,8.37);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -85,8.12);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -88,7.75);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -89,7.78);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -90,7.99);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -91,8.39);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -92,8.12);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -95,7.75);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -96,7.32);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -97,7.81);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -98,8.2);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -99,8.03);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -102,8.59);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -103,8.48);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -104,8.39);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -105,8.31);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -106,8.67);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -109,8.67);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -110,8.48);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -111,8.91);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -112,8.65);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -113,8.75);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -116,10.72);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -117,10.74);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -118,10.08);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -119,9.71);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -120,8.56);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -123,8.79);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -124,7.97);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -125,7.78);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -126,7.98);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -127,7.65);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -130,8.26);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -131,8.17);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -132,8.63);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -133,8.67);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -134,8.99);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -137,8.91);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -138,8.95);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -139,9.55);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -140,9.55);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -141,9.25);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -144,8.84);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -145,8.65);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -146,8.91);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -147,8.88);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -148,8.99);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -151,8.76);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -152,8.44);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -153,8.6);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -154,8.52);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -155,8.55);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -158,8.72);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -159,8.9);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -160,9.01);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -161,8.96);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -162,9.08);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -165,9.19);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -166,9.69);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -167,10.1);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -168,10.68);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -169,10.25);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -171,10.4);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -172,10.79);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -178,11.03);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -180,12.1);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -183,12.16);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -186,12.22);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -190,12.13);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -200,12.42);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -210,12.48);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -220,12.57);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -230,12.55);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -240,12.61);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -250,12.72);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -260,12.74);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -270,12.80);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -280,12.76);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -290,12.85);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -300,12.89);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -310,12.87);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -320,12.93);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -330,13.02);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -340,12.99);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -350,12.97);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -360,12.95);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -370,12.99);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -380,13.02);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (3,SYSDATE -390,13.10);\
\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE,75.38);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -3,75.3);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -4,74.09);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -5,75.61);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -6,74.45);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -7,73.66);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -10,73.65);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -11,73.76);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -12,74.59);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -13,75.45);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -14,75.61);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -17,75.47);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -18,75.3);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -19,76.11);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -20,77.52);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -21,77.41);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -24,79.24);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -25,80.06);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -26,79.88);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -27,80.35);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -28,82.62);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -31,84.37);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -32,84.18);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -33,87.19);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -34,86.66);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -35,84.2);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -38,86.03);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -39,85.32);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -40,84.78);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -41,85.16);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -42,85.05);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -45,85.89);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -46,85.75);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -47,83.71);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -48,85.86);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -49,86.63);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -52,87.43);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -53,86.34);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -54,85.75);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -55,86.6);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -56,86.91);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -57,86.78);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -60,86.26);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -61,85.19);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -62,84.61);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -63,84.19);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -64,82.98);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -67,83.9);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -68,83.82);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -69,83.26);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -70,85.46);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -71,83.96);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -74,83.11);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -75,82.72);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -76,82.46);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -77,82.61);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -78,83.58);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -81,82.69);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -82,82.89);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -83,82.32);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -84,82.23);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -85,81.1);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -88,80.63);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -89,79.32);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -90,78.57);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -91,76.84);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -92,75.19);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -95,75.07);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -96,77.27);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -97,77.42);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -98,78.81);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -99,78.3);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -102,78.93);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -103,79.93);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -104,80.37);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -105,80.58);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -106,79.14);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -109,80.31);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -110,78.78);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -111,78.87);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -112,79.89);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -113,77.66);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -116,78.25);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -117,79.15);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -118,77.73);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -119,80.08);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -120,78.89);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -123,79.12);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -124,79.07);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -125,79.46);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -126,80.58);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -127,78.16);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -130,79.12);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -131,76.4);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -132,76.79);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -133,77.72);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -134,78.25);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -137,80.2);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -138,80.31);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -139,79.39);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -140,77.51);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -141,76.97);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -144,77.48);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -145,76.05);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -146,77.86);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -147,77.02);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -148,78.54);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -151,81.45);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -152,81.98);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -153,84.59);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -154,84.3);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -155,82.9);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -158,83.6);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -159,84.02);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -160,83.42);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -161,84.34);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -162,83.49);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -165,83.19);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -166,84.13);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -167,83.11);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -168,82.92);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -169,82.36);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -171,83.41);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -172,83.75);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -173,84.91);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -174,84.55);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -175,85.06);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -180,85.06);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -190,84.57);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -200,84.32);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -210,84.09);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -220,84.36);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -230,84.11);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -240,83.99);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -250,83.47);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -260,83.05);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -270,82.84);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -280,82.46);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -290,81.79);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -300,80.96);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -310,79.87);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -320,80.56);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -330,81.29);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -340,81.36);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -350,81.66);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -360,82.01);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -370,82.01);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -380,81.75);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (4,SYSDATE -390,81.80);\
\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE,45.97);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -3,45.85);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -4,46.76);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -5,46.3);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -6,46.25);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -7,45.31);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -10,46.42);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -11,47.85);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -12,48.37);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -13,49.17);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -14,49.48);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -17,50.57);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -18,49.73);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -19,50.2);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -20,51.28);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -21,51.16);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -24,47.4);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -25,51.22);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -26,48.62);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -27,49.07);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -28,50.3);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -31,51.15);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -32,46.87);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -33,52.53);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -34,52.7);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -35,51.59);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -38,53);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -39,54.6);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -40,54.35);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -41,53.67);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -42,55.1);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -45,55.75);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -46,55.77);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -47,54.72);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -48,55.43);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -49,54.77);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -52,55.57);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -53,58.9);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -54,59);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -55,58.65);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -56,57.38);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -57,56.9);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -60,57.15);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -61,56.17);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -62,54.05);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -63,53.98);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -64,53.63);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -67,54.99);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -68,55.64);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -69,53.8);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -70,54.15);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -71,52.9);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -74,52.93);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -75,52.09);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -76,53.1);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -77,55.83);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -78,57.16);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -81,57.01);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -82,56.11);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -83,55.74);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -84,56.41);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -85,55.56);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -88,55.33);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -89,56.57);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -90,57.9);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -91,54.6);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -92,52.51);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -95,50.77);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -96,51.12);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -97,53.99);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -98,52.93);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -99,53.4);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -102,53.3);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -103,53.89);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -104,54.16);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -105,55.95);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -106,56.21);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -109,54.7);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -110,56);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -111,55.86);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -112,56.25);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -113,55.1);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -116,56.25);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -117,54.17);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -118,53.24);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -119,52.12);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -120,53.74);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -123,51.45);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -124,53.16);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -125,50.87);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -126,52.63);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -127,54.36);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -130,55.17);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -131,56.71);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -132,57);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -133,57.9);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -134,57.19);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -137,57.6);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -138,58.1);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -139,57.38);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -140,57.57);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -141,56.94);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -144,56.24);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -145,58.15);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -146,56.62);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -147,56.72);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -148,53.85);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -151,55.14);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -152,55);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -153,55.75);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -154,55.05);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -155,54.73);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -158,55.25);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -159,55.41);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -160,54.54);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -161,54.4);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -162,54.81);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -165,54.26);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -166,54.76);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -167,54.6);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -168,56.03);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -169,55.16);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -171,54.4);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -172,55.88);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -173,55.56);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -174,55.65);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -175,55.55);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -178,55.55);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -179,56.21);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (5,SYSDATE -180,56.56);\
\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE,32.17);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -3,31.97);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -4,30.83);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -5,31.36);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -6,30.92);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -7,31.38);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -10,31.47);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -11,32.15);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -12,31.75);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -13,31.6);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -14,32);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -17,32.78);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -18,32.74);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -19,33.31);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -20,31.82);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -21,34.81);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -24,31.5);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -25,32.01);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -26,33.13);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -27,34.93);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -28,34.78);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -31,30.91);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -32,35.04);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -33,34.59);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -34,33.62);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -35,33.53);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -38,34.08);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -39,33.88);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -40,33.57);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -41,34.65);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -42,35);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -45,34.76);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -46,33.95);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -47,34.4);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -48,34.95);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -49,35.41);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -52,36.42);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -53,36.95);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -54,36.78);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -55,36.56);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -56,36.91);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -57,36.65);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -60,36.55);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -61,35.97);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -62,36.27);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -63,36.31);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -64,36.81);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -67,37.02);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -68,36.9);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -69,36.42);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -70,37.9);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -71,37.61);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -74,37.67);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -75,40.2);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -76,41.53);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -77,40.9);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -78,39.51);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -81,39.88);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -82,39.59);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -83,39.89);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -84,39.29);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -85,38.93);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -88,39.9);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -89,40.38);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -90,40.54);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -91,39.64);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -92,38.72);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -95,38.6);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -96,39.03);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -97,38.51);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -98,39.6);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -99,39.4);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -102,39.51);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -103,39.13);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -104,39.73);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -105,39.88);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -106,39.53);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -109,40.52);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -110,40.59);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -111,40.62);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -112,39.8);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -113,39.41);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -116,39.77);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -117,39.63);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -118,38.85);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -119,38.6);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -120,38);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -123,38.26);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -124,37.75);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -125,38.26);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -126,38.22);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -127,37);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -130,37.19);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -131,37.57);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -132,37.95);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -133,37.28);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -134,38.17);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -137,38.49);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -138,38.34);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -139,38.83);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -140,38.71);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -141,38.81);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -144,39.19);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -145,39.1);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -146,39.49);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -147,38.5);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -148,38.65);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -151,38.42);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -152,38.9);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -153,39.15);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -154,39.47);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -155,39.78);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -158,39.75);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -159,39.53);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -160,39.65);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -161,40.11);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -162,40.33);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -165,40.21);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -166,40.9);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -167,40.76);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -168,40);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -169,39.99);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -171,40.46);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -172,40.64);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -173,40.85);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -174,40.9);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -175,40.9);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -178,41.41);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (6,SYSDATE -179,41.76);\
\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE,426.72);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -3,426.54);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -4,360.1);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -5,350.5);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -6,350.5);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -7,348.5);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -10,350.2);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -11,349.2);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -12,348.7);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -13,357.4);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -14,362.9);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -17,359.5);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -18,364.1);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -19,367.5);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -20,373);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -21,370);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -24,375);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -25,374.5);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -26,370);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -27,368.4);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -28,366.8);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -31,369.9);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -32,372.7);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -33,375);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -34,367.5);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -35,427.64);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -38,364.7);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -39,366.1);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -40,370.6);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -41,368.5);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -42,370.2);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -45,366);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -46,364.6);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -47,369.7);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -48,371.9);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -49,364.5);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -52,365.3);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -53,363.6);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -54,363.3);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -55,364.9);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -56,369.6);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -57,372.1);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -60,369.8);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -61,371.9);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -62,375.2);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -63,375.9);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -64,367.4);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -67,371);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -68,369.8);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -69,372);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -70,377);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -71,376.6);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -74,381.3);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -75,378.4);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -76,385.9);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -77,387.5);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -78,391.5);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -81,389);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -82,388);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -83,395.6);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -84,395.6);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -85,389.2);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -88,395.9);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -89,389.7);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -90,387.1);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -91,392.7);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -92,396.4);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -95,399.6);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -96,393.7);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -97,390);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -98,391.4);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -99,390.7);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -102,381.9);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -103,386);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -104,386);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -105,385.1);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -106,378.5);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -109,374);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -110,380.2);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -111,377.5);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -112,379.15);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -113,383.5);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -116,392.45);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -117,388.8);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -118,389.7);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -119,388);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -120,395.85);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -123,403.4);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -124,407.35);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -125,407.35);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -126,408.95);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -127,410.8);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -130,409);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -131,418.7);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -132,418);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -133,418.85);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -134,414.55);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -137,418.7);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -138,425);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -139,425.75);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -140,429);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -141,430.85);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -144,423.35);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -145,424.8);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -146,420.5);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -147,427.35);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -148,428.35);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -151,434.75);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -152,429.3);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -153,429);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -154,423);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -155,426.4);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -158,426.15);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -159,428.95);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -160,433.4);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -161,435.65);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -162,425.45);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -165,414.65);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -166,419);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -167,416.85);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -168,418.25);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -169,417.5);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -171,417);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -172,410);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -173,406.65);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -174,416.5);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -175,418);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -178,417.8);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -179,426.95);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -180,426.95);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (7,SYSDATE -183,427.7);\
\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE,131.29);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -3,130.27);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -4,104.84);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -5,101.73);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -6,131.64);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -7,131.67);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -10,101.65);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -11,100.19);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -12,100.68);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -13,102.08);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -14,100.83);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -17,103.62);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -18,103.25);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -19,107.22);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -20,110.64);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -21,115.42);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -24,116.44);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -25,117.04);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -26,115.57);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -27,117.06);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -28,117.64);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -31,117.63);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -32,117.28);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -33,117.26);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -34,117.86);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -35,117.93);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -38,119.92);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -39,119.6);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -40,118.47);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -41,117.38);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -42,119.33);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -45,118.7);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -46,117.79);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -47,119.29);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -48,119.58);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -49,118.57);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -52,116.86);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -53,117.63);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -54,118.57);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -55,118.95);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -56,119.9);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -57,119.32);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -60,118.83);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -61,119.47);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -62,119.43);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -63,118.22);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -64,118.05);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -67,116.69);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -68,116.09);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -69,116.33);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -70,117.46);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -71,117.16);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -74,116.76);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -75,117.67);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -76,118.05);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -77,118.88);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -78,119.35);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -81,121.82);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -82,121.88);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -83,122.11);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -84,121.57);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -85,121.61);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -88,120.82);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -89,120.94);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -90,121.08);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -91,119.33);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -92,118.81);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -95,119.61);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -96,117.9);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -97,119.02);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -98,119.75);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -99,121.35);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -102,122.78);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -103,122.29);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -104,125.93);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -105,127.04);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -106,127.02);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -109,128.35);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -110,127.98);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -111,121.64);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -112,123.06);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -113,122.82);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -116,120.87);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -117,122.69);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -118,120.36);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -119,120.11);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -120,120.65);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -123,121.5);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -124,122.87);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -125,120.61);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -126,120.56);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -127,121.16);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -130,121.29);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -131,123.1);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -132,123.49);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -133,126);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -134,126.91);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -137,127.19);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -138,126.26);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -139,127.03);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -140,128.21);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -141,128.63);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -144,128.15);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -145,127.54);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -146,126.96);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -147,128.2);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -148,127.93);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -151,127.28);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -152,125.7);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -153,126.35);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -154,127.94);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -155,127.21);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -158,127.55);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -159,127.25);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -160,127.04);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -161,126.8);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -162,128.39);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -165,129.34);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -166,129.68);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -167,129.93);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -168,128.49);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -169,128.71);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -171,127.4);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -172,127.91);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -173,128.65);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -174,129.93);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -175,130);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -178,130.57);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -179,132.31);\
INSERT INTO shares_prices (share_id,time_start,price) VALUES (8,SYSDATE -180,131.85);\
\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (71,1,1,3,SYSDATE,20000,19400000);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (70,3,1,3,SYSDATE -3,4223,27069.43);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (69,1,1,3,SYSDATE -5,150,71305.5);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (68,7,1,1,SYSDATE -11,854,312564);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (67,3,1,3,SYSDATE -13,5000,42500);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (66,1,1,3,SYSDATE -19,3000,1395000);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (65,8,1,1,SYSDATE -24,10,1200);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (64,5,1,2,SYSDATE -28,6049,317572.5);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (63,1,3,3,SYSDATE -31,1000,478000);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (62,1,1,3,SYSDATE -35,1250,662500);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (61,4,1,3,SYSDATE -40,344,29240);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (60,1,1,3,SYSDATE -45,10230,4557190);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (59,1,3,3,SYSDATE -49,500,290000);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (58,2,1,1,SYSDATE -53,444,89910);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (57,1,1,3,SYSDATE -56,75000,35090000);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (56,2,2,1,SYSDATE -60,25000,6350000);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (55,8,2,1,SYSDATE -64,25000,3000000);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (54,8,2,1,SYSDATE -70,1543,185468.6);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (53,7,2,1,SYSDATE -75,8523,3272832);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (52,7,2,1,SYSDATE -81,45600,18652680);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (51,2,2,1,SYSDATE -84,2342,519104.3);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (50,1,1,3,SYSDATE -89,20000,9965800);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (49,3,1,3,SYSDATE -95,4223,33338);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (48,1,1,3,SYSDATE -98,150,73950);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (47,7,1,1,SYSDATE -102,854,326236.54);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (46,3,1,3,SYSDATE -105,5000,46550);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (45,1,1,3,SYSDATE -110,3000,1552920);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (44,8,1,1,SYSDATE -113,10,1200);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (43,5,1,2,SYSDATE -119,6049,324226.4);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (42,1,3,3,SYSDATE -123,1000,551270);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (41,1,1,3,SYSDATE -126,1250,692500);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (40,4,1,3,SYSDATE -130,344,27864);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (39,1,1,3,SYSDATE -132,10230,5657190);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (38,1,3,3,SYSDATE -133,500,290000);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (37,2,1,1,SYSDATE -137,444,189910);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (36,1,1,3,SYSDATE -140,75000,43390000);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (35,2,2,1,SYSDATE -141,24000,4950000);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (34,8,2,1,SYSDATE -144,25000,3203750);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (33,8,2,1,SYSDATE -147,1543,198468.6);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (32,7,3,1,SYSDATE -151,8523,3772832);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (31,7,3,1,SYSDATE -154,45600,19352680);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (30,2,2,1,SYSDATE -158,2342,644980);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (29,2,4,1,SYSDATE -161,50000,10116000);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (28,8,2,1,SYSDATE -165,25000,3235000);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (27,8,4,1,SYSDATE -168,1543,198468.6);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (26,7,2,1,SYSDATE -171,8523,3572832);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (25,7,5,1,SYSDATE -172,45600,18696680);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (24,2,1,1,SYSDATE -175,2342,449980);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (23,1,3,3,SYSDATE -178,3452,2063913.6);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (22,3,4,3,SYSDATE -180,84260,1047116.8);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (21,1,1,3,SYSDATE -183,256,153672.3);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (20,3,2,3,SYSDATE -186,9531,116863.7);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (19,1,5,3,SYSDATE -190,1024,636309.1);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (18,1,5,3,SYSDATE -220,800,503843.04);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (17,2,4,3,SYSDATE -230,500,95481);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (16,3,3,3,SYSDATE -240,10000,129883);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (15,4,2,2,SYSDATE -250,500,42987.05);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (14,1,1,2,SYSDATE -260,7500,4769337.75);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (13,2,5,2,SYSDATE -270,4500,849132);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (12,3,4,1,SYSDATE -280,50000,657140);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (11,4,3,1,SYSDATE -290,1100,92668.07);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (10,1,2,1,SYSDATE -300,3500,2265454.10);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (9,2,1,3,SYSDATE -310,7100,1306101.8);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (8,3,7,3,SYSDATE -320,30000,399537);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (7,4,7,3,SYSDATE -330,2500,209321.75);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (6,1,5,2,SYSDATE -340,3100,2017177.75);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (5,2,4,2,SYSDATE -350,250,45551.75);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (4,3,3,1,SYSDATE -360,45000,600232.50);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (3,4,2,1,SYSDATE -370,5000,422351.5);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (2,1,7,3,SYSDATE -380,1490,982177.31);\
INSERT INTO trades (trade_id,share_id,broker_id,stock_ex_id,transaction_time,share_amount,price_total) VALUES (1,1,7,3,SYSDATE -390,500,330825.70);\
\
\
\
\
\
\
\
\
\
\
\
COMMIT;}