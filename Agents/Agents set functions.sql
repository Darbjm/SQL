{\rtf1\ansi\ansicpg1252\cocoartf2577
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs24 \cf0 --Q1 Agent ids of agents who haven\'92t been on a mission.\
SELECT AGENT_ID\
FROM AGENTS\
MINUS\
SELECT AGENT_ID\
FROM MISSIONS_AGENTS;\
\
--Q2 The birth dates of the oldest and the youngest agent (in a single column)\
SELECT MIN(BIRTH_DATE)\
FROM AGENTS\
UNION\
SELECT MAX(BIRTH_DATE)\
FROM AGENTS;\
\
--Q3 Dates when an agent and a target were born (use TO_CHAR and show in the\
--format like \'9228 June 2017\'92)\
SELECT TO_CHAR(BIRTH_DATE, 'DD MONTH YY')\
FROM AGENTS\
INTERSECT\
SELECT TO_CHAR(BIRTH_DATE, 'DD MONTH YY')\
FROM TARGETS;\
\
--Q4 Dates when an agent or a target were born (use TO_CHAR and show in the\
--format like \'9228 June 2017\'92).\
SELECT TO_CHAR(BIRTH_DATE, 'DD MONTH YY')\
FROM AGENTS\
UNION\
SELECT TO_CHAR(BIRTH_DATE, 'DD MONTH YY')\
FROM TARGETS;\
\
--Q5 Agent\'92s birthdays (day and month) which are not also the birthday of a target (use\
--TO_CHAR and show in the format like \'9228 June\'92).\
SELECT TO_CHAR(BIRTH_DATE, 'DD MONTH')\
FROM AGENTS\
MINUS\
SELECT TO_CHAR(BIRTH_DATE, 'DD MONTH')\
FROM TARGETS;}