{\rtf1\ansi\ansicpg1252\cocoartf2577
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs24 \cf0 --Q1 The full names of agents who\'92ve never been on a mission.\
SELECT A.FIRST_NAME || ' ' || A.LAST_NAME AS AGENT_NAME\
FROM AGENTS A\
WHERE A.AGENT_ID NOT IN (\
    SELECT agent_id\
    FROM MISSIONS_AGENTS\
);\
\
--Q2 The full name of the oldest agent.\
SELECT A.FIRST_NAME || ' ' || A.LAST_NAME AS AGENT_NAME\
FROM AGENTS A\
WHERE A.BIRTH_DATE = (\
    SELECT MIN(AG.BIRTH_DATE)\
    FROM AGENTS AG\
);\
\
--Q3 The full names of agents with an above average security level\
SELECT FIRST_NAME || ' ' || LAST_NAME AS AGENT_NAME\
FROM AGENTS\
WHERE SECURITY_LEVEL > (\
    SELECT AVG(SECURITY_LEVEL)\
    FROM AGENTS\
);\
\
--Q4 The code name of the most recent mission\
SELECT CODE_NAME, MISSION_DATE\
FROM MISSIONS\
WHERE MISSION_DATE = (\
    SELECT MAX(MISSION_DATE)\
    FROM MISSIONS\
);\
\
--Q5 The full names of agents who share a birthday with a target (they can be born in\
--different years).\
SELECT FIRST_NAME || ' ' || LAST_NAME AS AGENT\
FROM AGENTS\
WHERE  TO_CHAR(birth_date,'DDMM') IN\
(SELECT TO_CHAR(birth_date,'DDMM')\
FROM   targets);\
\
--Q6 The full names of agents who were born on the date that a mission took place.\
SELECT FIRST_NAME || ' ' || LAST_NAME AS AGENT\
FROM AGENTS\
WHERE TO_CHAR(BIRTH_DATE, 'DDMMYY') IN\
(SELECT TO_CHAR(MISSION_DATE, 'DDMMYY')\
FROM MISSIONS);}