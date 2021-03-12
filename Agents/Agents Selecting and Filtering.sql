{\rtf1\ansi\ansicpg1252\cocoartf2577
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs24 \cf0 --Q1 The full names of agents with a security level above 3\
SELECT FIRST_NAME || ' ' || LAST_NAME AS AGENT_NAME\
FROM AGENTS\
WHERE SECURITY_LEVEL > 3;\
\
--Q2 The full names of agents in location 1\
SELECT FIRST_NAME || ' ' || LAST_NAME AS AGENT_NAME\
FROM AGENTS\
WHERE LOCATION_ID = 1;\
\
--Q3 The code names of missions which took place in the last 10 days.\
SELECT CODE_NAME\
FROM MISSIONS\
WHERE MISSION_DATE > SYSDATE - 10;\
\
--Q4 The code names of missions which took place last year.\
SELECT code_name,\
       mission_date\
FROM   missions\
WHERE  TO_CHAR(mission_date,'YY') = TO_CHAR(ADD_MONTHS(SYSDATE,-12),'YY'); \
\
--Q5 The code names of missions which took place in the previous quarter and had a\
--security level of 5 or more.\
SELECT CODE_NAME\
FROM MISSIONS\
WHERE SECURITY_LEVEL >= 5\
AND TO_CHAR(MISSION_DATE,'YYQ') = TO_CHAR(ADD_MONTHS(SYSDATE,-3),'YYQ');}