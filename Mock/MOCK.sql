--PHASE 1

--Q1 Write a query which shows the names of any trainees in the academy with academy_id 3
SELECT NAME
FROM TRAINEES
WHERE ACADEMY_ID = 3;

--Q2 Write a query showing the trainee_ids of anyone scoring 100% in course_id 2
SELECT TRAINEE_ID
FROM EXAM_RESULTS
WHERE SCORE = 100 AND COURSE_ID = 2;

--Q3 Write a query which shows the names of any trainees with start dates in the last 7 days
SELECT NAME
FROM TRAINEES
WHERE START_DATE > SYSDATE - 7;

--Q4 Write a query which shows the name of each trainee and the name of their stream
SELECT T.NAME, S.NAME
FROM TRAINEES T
JOIN
STREAMS S
ON T.STREAM_ID = S.STREAM_ID;

--Q5 Write a query which shows the names of each trainer and the names of any courses they teach
SELECT T.NAME, C.NAME
FROM TRAINERS T
JOIN
TRAINERS_COURSES TC
ON T.TRAINER_ID = TC.TRAINER_ID
JOIN
COURSES C
ON TC.COURSE_ID = C.COURSE_ID;


-- PHASE 2

--Q1 Write a query which shows the shortest stream duration.
SELECT NAME, DURATION_WEEKS
FROM STREAMS
WHERE DURATION_WEEKS = (
    SELECT MIN(DURATION_WEEKS)
    FROM STREAMS
);

--Q2 Write a query which shows the longest and shortest stream durations.
SELECT NAME, DURATION_WEEKS
FROM STREAMS
WHERE DURATION_WEEKS = (
    SELECT MIN(DURATION_WEEKS)
    FROM STREAMS
)
UNION
SELECT NAME, DURATION_WEEKS
FROM STREAMS
WHERE DURATION_WEEKS = (
    SELECT MAX(DURATION_WEEKS)
    FROM STREAMS
);

--Q3 Write a query which shows the average score for each course_id - use the exam_results table. Round the averages to zero decimal places and order by the average score
SELECT COURSE_ID, ROUND(AVG(SCORE), 0) AS AVERAGE_SCORE
FROM EXAM_RESULTS
GROUP BY COURSE_ID
ORDER BY AVERAGE_SCORE;


--Q4 Write a query which shows trainer_ids of trainers who teach 4 or more courses
SELECT TRAINER_ID
FROM TRAINERS_COURSES 
GROUP BY TRAINER_ID
HAVING COUNT(COURSE_ID) > 3;

--Q5 Write a query which shows the trainee_ids of any trainee who has taken 3 or more exams in the last 7 days.
SELECT T.TRAINEE_ID
FROM TRAINEES T
JOIN
EXAM_RESULTS E
ON T.TRAINEE_ID = E.TRAINEE_ID
WHERE E.EXAM_DATE > SYSDATE - 7
GROUP BY T.TRAINEE_ID
HAVING COUNT(SCORE) > 2;