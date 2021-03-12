{\rtf1\ansi\ansicpg1252\cocoartf2577
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs24 \cf0 --Q1 The full names of agents and the names of their locations\
SELECT A.FIRST_NAME || ' ' || A.LAST_NAME AS AGENT_NAME,\
L.DESCRIPTION\
FROM AGENTS A\
JOIN\
LOCATIONS L\
ON A.LOCATION_ID = L.LOCATION_ID;\
\
--Q2 The full names of agents and the code names of any missions they\'92ve been on.\
SELECT a.first_name||' '||a.last_name AS agent,\
       m.code_name\
FROM   agents a\
INNER JOIN\
       missions_agents ma\
ON     a.agent_id = ma.agent_id\
INNER JOIN\
       missions m\
ON     m.mission_id = ma.mission_id;\
\
--Q3 The code names of missions and the full names of any targets of those missions.\
SELECT M.CODE_NAME,\
T.FIRST_NAME || ' ' || T.LAST_NAME AS TARGET_NAME\
FROM MISSIONS M\
JOIN\
TARGETS T\
ON M.LOCATION_ID = T.LOCATION_ID;\
\
--Q4 The full names of targets located in Oxford.\
SELECT T.FIRST_NAME || ' ' || T.LAST_NAME AS TARGET_NAME,\
L.DESCRIPTION\
FROM TARGETS T\
JOIN\
LOCATIONS L\
ON T.LOCATION_ID = L.LOCATION_ID\
WHERE L.DESCRIPTION = 'Oxford';\
\
--Q5 The full names of any agents who haven\'92t been on a mission.\
SELECT A.FIRST_NAME || ' ' || A.LAST_NAME AS AGENT_NAME\
FROM AGENTS A\
LEFT OUTER JOIN\
MISSIONS_AGENTS MA\
ON A.AGENT_ID = MA.AGENT_ID\
WHERE MA.MISSION_ID IS NULL;\
\
--Q6 The code names of any missions which took place in Lincoln or Manchester last year.\
SELECT M.CODE_NAME\
FROM MISSIONS M\
JOIN\
LOCATIONS L\
ON M.LOCATION_ID = L.LOCATION_ID\
WHERE L.DESCRIPTION = 'Lincoln'\
OR L.DESCRIPTION = 'Manchester'\
AND TO_CHAR(M.MISSION_DATE,'YY') = TO_CHAR(ADD_MONTHS(SYSDATE,-12),'YY');}