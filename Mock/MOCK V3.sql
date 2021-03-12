--Q1 Write a query which shows the trainee_id of the trainee with the lowest score in the exam_results table. (1 row) \'96 use a simple subquery\
SELECT TRAINEE_ID\
FROM EXAM_RESULTS\
WHERE SCORE = (\
SELECT MIN(SCORE)\
FROM EXAM_RESULTS\
);\
\
--Q2 Write a query showing the name of the trainee who has been in the academy the longest. (1 row) - use a simple subquer\
SELECT NAME\
FROM TRAINEES\
WHERE START_DATE = (\
    SELECT MIN(START_DATE)\
    FROM TRAINEES\
);\
\
--Q3 Write a query which lists the longest serving trainer in each academy. \
--There should be 3 columns \'96 academy_id, trainer name and start date. (3 rows) \'96 use a correlated subquery\
\
SELECT T.ACADEMY_ID , T.NAME, T.START_DATE\
FROM TRAINERS T\
WHERE T.START_DATE = (\
    SELECT MIN(T2.START_DATE)\
    FROM TRAINERS T2\
    WHERE T.ACADEMY_ID = T2.ACADEMY_ID\
);\
\
--Q4 Write a query which shows the highest number of exams taken by a single trainee. (1 row) \'96 use an inline view\
\
SELECT MAX(S) AS EXAMS\
FROM (\
    SELECT COUNT(SCORE) AS S\
    FROM EXAM_RESULTS\
    GROUP BY TRAINEE_ID\
)\
;\
}