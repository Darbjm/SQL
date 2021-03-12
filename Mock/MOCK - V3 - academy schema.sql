DROP TABLE streams CASCADE CONSTRAINTS;
DROP TABLE courses CASCADE CONSTRAINTS;
DROP TABLE streams_courses CASCADE CONSTRAINTS;
DROP TABLE trainees CASCADE CONSTRAINTS;
DROP TABLE exam_results CASCADE CONSTRAINTS;
DROP TABLE academies CASCADE CONSTRAINTS;
DROP TABLE trainers CASCADE CONSTRAINTS;
DROP TABLE trainers_courses CASCADE CONSTRAINTS;


CREATE TABLE streams
(
stream_id NUMBER(2) PRIMARY KEY,
name VARCHAR2(30),
duration_weeks NUMBER(2)
);


CREATE TABLE courses
(
course_id NUMBER(3) PRIMARY KEY,
name VARCHAR2(30),
duration_days NUMBER(2)
);


CREATE TABLE streams_courses
(
stream_id NUMBER(2),
course_id NUMBER(3),
CONSTRAINT streams_courses_pk PRIMARY KEY(stream_id, course_id),
CONSTRAINT stream_id_fk FOREIGN KEY(stream_id) REFERENCES streams(stream_id),
CONSTRAINT course_id_fk FOREIGN KEY(course_id) REFERENCES courses(course_id)
);


CREATE TABLE academies
(
academy_id  NUMBER(2) PRIMARY KEY,
city        VARCHAR2(20),
address     VARCHAR2(100)
);

CREATE TABLE trainees
(
trainee_id NUMBER(5) PRIMARY KEY,
name VARCHAR2(50),
stream_id NUMBER(2),
start_date DATE,
academy_id NUMBER(2),
CONSTRAINT trainee_stream_fk FOREIGN KEY(stream_id) REFERENCES streams(stream_id),
CONSTRAINT trainee_academy_fk FOREIGN KEY(academy_id) REFERENCES academies(academy_id)
);


CREATE TABLE exam_results
(
trainee_id NUMBER(4),
course_id NUMBER(3),
exam_date DATE,
score NUMBER(3),
CONSTRAINT exam_pk PRIMARY KEY (trainee_id, course_id, exam_date),
CONSTRAINT exam_trainee_id FOREIGN KEY (trainee_id) REFERENCES trainees(trainee_id),
CONSTRAINT exam_course_id FOREIGN KEY (course_id) REFERENCES courses(course_id)
);


CREATE TABLE trainers
(
trainer_id NUMBER(4) PRIMARY KEY,
name      VARCHAR2(40),
start_date  DATE,
academy_id NUMBER(2),
CONSTRAINT trainer_academy_fk FOREIGN KEY (academy_id) REFERENCES academies(academy_id)
);

CREATE TABLE trainers_courses
(
trainer_id NUMBER(4),
course_id  NUMBER(3),
CONSTRAINT trainer_course_pk PRIMARY KEY (trainer_id, course_id),
CONSTRAINT trainer_course_fk1 FOREIGN KEY (trainer_id) REFERENCES trainers(trainer_id),
CONSTRAINT trainer_course_fk2 FOREIGN KEY (course_id) REFERENCES courses(course_id)
);



INSERT INTO academies VALUES (1,'London','Cottons Centre, Cottons Ln, London SE1 2QG, United Kingdom');
INSERT INTO academies VALUES (2,'Manchester','Westminster House, 11 Portland St, Manchester M1 3HU, United Kingdom');
INSERT INTO academies VALUES (3,'Frankfurt','Mainzer Landstraße 41, 60329 Frankfurt, Germany');

INSERT INTO streams VALUES (1,'PMO',9);
INSERT INTO streams VALUES (2,'Data Analyst',6);
INSERT INTO streams VALUES (3,'Application Support',11);
INSERT INTO streams VALUES (4,'Testing',8);
INSERT INTO streams VALUES (5,'Development',14);

INSERT INTO trainees VALUES (1,'Roni Whitney',1,SYSDATE-99,1);
INSERT INTO trainees VALUES (2,'Shanti Gould',1,SYSDATE-98,1);
INSERT INTO trainees VALUES (3,'Antonina Wilbanks',2,SYSDATE-98,1);
INSERT INTO trainees VALUES (4,'Sophia Hartwig',2,SYSDATE-96,3);
INSERT INTO trainees VALUES (5,'Josef Krumrey',5,SYSDATE-94,3);
INSERT INTO trainees VALUES (6,'Marko Schmucker',2,SYSDATE-90,3);
INSERT INTO trainees VALUES (7,'Traute Seifert',2,SYSDATE-85,3);
INSERT INTO trainees VALUES (8,'Nidia Dowd',3,SYSDATE-84,2);
INSERT INTO trainees VALUES (9,'Thurman Wing',1,SYSDATE-83,2);
INSERT INTO trainees VALUES (10,'Ima Quinonez',2,SYSDATE-83,2);
INSERT INTO trainees VALUES (11,'Rosanne Marino',1,SYSDATE-81,1);
INSERT INTO trainees VALUES (12,'Bharadwaj Santhanakrishnan',2,SYSDATE-80,1);
INSERT INTO trainees VALUES (13,'Sumathi Sahar',1,SYSDATE-80,1);
INSERT INTO trainees VALUES (14,'Zachariah Acevedo',4,SYSDATE-79,1);
INSERT INTO trainees VALUES (15,'Salina Blakely',5,SYSDATE-77,1);
INSERT INTO trainees VALUES (16,'Sri Munish',2,SYSDATE-73,1);
INSERT INTO trainees VALUES (17,'Giuseppe Rosas',2,SYSDATE-68,1);
INSERT INTO trainees VALUES (18,'Marry Roland',1,SYSDATE-67,1);
INSERT INTO trainees VALUES (19,'Leighann Oldham',4,SYSDATE-65,1);
INSERT INTO trainees VALUES (20,'Amati Jinen',5,SYSDATE-64,1);
INSERT INTO trainees VALUES (21,'Nydia Mcwilliams',1,SYSDATE-64,1);
INSERT INTO trainees VALUES (22,'Brianna Leavitt',2,SYSDATE-61,1);
INSERT INTO trainees VALUES (23,'Lannie Handley',3,SYSDATE-59,1);
INSERT INTO trainees VALUES (24,'Devorah Kahn',1,SYSDATE-55,1);
INSERT INTO trainees VALUES (25,'Buck Bonilla',5,SYSDATE-54,1);
INSERT INTO trainees VALUES (26,'James Ritter',1,SYSDATE-54,1);
INSERT INTO trainees VALUES (27,'Tifany Fite',2,SYSDATE-53,1);
INSERT INTO trainees VALUES (28,'Hana Treadwell',3,SYSDATE-52,1);
INSERT INTO trainees VALUES (29,'Abbie Byrnes',1,SYSDATE-52,1);
INSERT INTO trainees VALUES (30,'Ashlea Nowak',5,SYSDATE-50,1);
INSERT INTO trainees VALUES (31,'Annett Roden',1,SYSDATE-50,1);
INSERT INTO trainees VALUES (32,'Sibongile Toure',2,SYSDATE-48,1);
INSERT INTO trainees VALUES (33,'Daina Aviles',3,SYSDATE-46,1);
INSERT INTO trainees VALUES (34,'Bettie Vickery',4,SYSDATE-45,1);
INSERT INTO trainees VALUES (35,'Reinhold Blech',1,SYSDATE-42,3); 
INSERT INTO trainees VALUES (36,'Thies Güntzler',2,SYSDATE-39,3); 
INSERT INTO trainees VALUES (37,'Stefan Gildehaus',3,SYSDATE-38,3); 
INSERT INTO trainees VALUES (38,'Syble Bivins',2,SYSDATE-38,1);
INSERT INTO trainees VALUES (39,'Hallie Hawks',4,SYSDATE-34,1);
INSERT INTO trainees VALUES (40,'Mariette Kirk',1,SYSDATE-33,1);
INSERT INTO trainees VALUES (41,'Serwa Ndiaye',1,SYSDATE-31,1);
INSERT INTO trainees VALUES (42,'Leslee Laird',2,SYSDATE-31,1);
INSERT INTO trainees VALUES (43,'Femi Bah',3,SYSDATE-30,1);
INSERT INTO trainees VALUES (44,'Fay Quezada',2,SYSDATE-30,1);
INSERT INTO trainees VALUES (45,'Bud Hardesty',1,SYSDATE-28,1);
INSERT INTO trainees VALUES (46,'Cliff Marble',1,SYSDATE-28,2);
INSERT INTO trainees VALUES (47,'Dannielle Sapp',2,SYSDATE-25,2);
INSERT INTO trainees VALUES (48,'Celinda Valencia',2,SYSDATE-23,2);
INSERT INTO trainees VALUES (49,'Tawanda Tinsley',1,SYSDATE-22,2);
INSERT INTO trainees VALUES (50,'Tarah Shay',5,SYSDATE-22,2);
INSERT INTO trainees VALUES (51,'Rosanne Funk',1,SYSDATE-21,2);
INSERT INTO trainees VALUES (52,'Harley Littlejohn',2,SYSDATE-19,2);
INSERT INTO trainees VALUES (53,'Albina Mclaurin',2,SYSDATE-18,2);
INSERT INTO trainees VALUES (54,'Meda Layne',1,SYSDATE-18,2);
INSERT INTO trainees VALUES (55,'Lilian Denning',5,SYSDATE-12,2);
INSERT INTO trainees VALUES (56,'Callie Sheldon',1,SYSDATE-8,2);
INSERT INTO trainees VALUES (57,'Bernarda Labbe',2,SYSDATE-5,2);
INSERT INTO trainees VALUES (58,'Margarete Empting',3,SYSDATE-3,3);  
INSERT INTO trainees VALUES (59,'Lidia Jung',4,SYSDATE-2,3);  
INSERT INTO trainees VALUES (60,'Markus Rebohle',2,SYSDATE-1,3);


INSERT INTO trainers VALUES (1,'Edmund Blair',SYSDATE-772,1);
INSERT INTO trainers VALUES (2,'Sherman Brown',SYSDATE-978,1);
INSERT INTO trainers VALUES (3,'Arthur Santiago',SYSDATE-1022,1);
INSERT INTO trainers VALUES (4,'Ted Waters',SYSDATE-287,1);
INSERT INTO trainers VALUES (5,'Patrick Carroll',SYSDATE-594,1);
INSERT INTO trainers VALUES (6,'Cecil Griffin',SYSDATE-242,1);
INSERT INTO trainers VALUES (7,'Jessica Owens',SYSDATE-625,1);
INSERT INTO trainers VALUES (8,'Alfonso Valdez',SYSDATE-317,1);
INSERT INTO trainers VALUES (9,'Lamar Carson',SYSDATE-1137,1);
INSERT INTO trainers VALUES (10,'Scott Robbins',SYSDATE-698,1);
INSERT INTO trainers VALUES (11,'Connie Douglas',SYSDATE-687,2);
INSERT INTO trainers VALUES (12,'Myrtle Wolfe',SYSDATE-627,2);
INSERT INTO trainers VALUES (13,'Maureen Franklin',SYSDATE-457,2);
INSERT INTO trainers VALUES (14,'Cedric Houston',SYSDATE-994,2);
INSERT INTO trainers VALUES (15,'Vivian Lambert',SYSDATE-611,2);
INSERT INTO trainers VALUES (16,'Alexander Krenz',SYSDATE-855,3);
INSERT INTO trainers VALUES (17,'Elke Manteuffel',SYSDATE-350,3);


INSERT INTO courses VALUES (1,'FIA',5);
INSERT INTO courses VALUES (2,'SQL',5);
INSERT INTO courses VALUES (3,'UNIX',5);
INSERT INTO courses VALUES (4,'Excel VBA',5);
INSERT INTO courses VALUES (5,'Web Applications',5);
INSERT INTO courses VALUES (6,'Manual Testing',5);
INSERT INTO courses VALUES (7,'PSO',5);
INSERT INTO courses VALUES (8,'Common Development',5);
INSERT INTO courses VALUES (9,'Communication Skills',3);
INSERT INTO courses VALUES (10,'PRINCE 2',5);
INSERT INTO courses VALUES (11,'BA',5);
INSERT INTO courses VALUES (12,'Agile Testing',1);
INSERT INTO courses VALUES (13,'ISTQB ISEB',5);


INSERT INTO streams_courses VALUES (1,1);
INSERT INTO streams_courses VALUES (2,1);
INSERT INTO streams_courses VALUES (3,1);
INSERT INTO streams_courses VALUES (1,2);
INSERT INTO streams_courses VALUES (2,2);
INSERT INTO streams_courses VALUES (3,2);
INSERT INTO streams_courses VALUES (4,2);
INSERT INTO streams_courses VALUES (5,2);
INSERT INTO streams_courses VALUES (3,3);
INSERT INTO streams_courses VALUES (4,3);
INSERT INTO streams_courses VALUES (5,3);
INSERT INTO streams_courses VALUES (1,4);
INSERT INTO streams_courses VALUES (2,4);
INSERT INTO streams_courses VALUES (3,4);
INSERT INTO streams_courses VALUES (4,4);
INSERT INTO streams_courses VALUES (5,4);
INSERT INTO streams_courses VALUES (3,5);
INSERT INTO streams_courses VALUES (4,5);
INSERT INTO streams_courses VALUES (4,6);
INSERT INTO streams_courses VALUES (1,7);
INSERT INTO streams_courses VALUES (5,8);
INSERT INTO streams_courses VALUES (1,9);
INSERT INTO streams_courses VALUES (2,9);
INSERT INTO streams_courses VALUES (3,9);
INSERT INTO streams_courses VALUES (4,9);
INSERT INTO streams_courses VALUES (5,9);
INSERT INTO streams_courses VALUES (1,10);
INSERT INTO streams_courses VALUES (1,11);
INSERT INTO streams_courses VALUES (4,12);
INSERT INTO streams_courses VALUES (4,13);


INSERT INTO trainers_courses VALUES (1,1);
INSERT INTO trainers_courses VALUES (1,2);
INSERT INTO trainers_courses VALUES (1,3);
INSERT INTO trainers_courses VALUES (2,2);
INSERT INTO trainers_courses VALUES (2,3);
INSERT INTO trainers_courses VALUES (3,6);
INSERT INTO trainers_courses VALUES (3,12);
INSERT INTO trainers_courses VALUES (3,13);
INSERT INTO trainers_courses VALUES (3,3);
INSERT INTO trainers_courses VALUES (4,7);
INSERT INTO trainers_courses VALUES (4,9);
INSERT INTO trainers_courses VALUES (4,11);
INSERT INTO trainers_courses VALUES (4,10);
INSERT INTO trainers_courses VALUES (5,9);
INSERT INTO trainers_courses VALUES (6,8);
INSERT INTO trainers_courses VALUES (6,5);
INSERT INTO trainers_courses VALUES (7,1);
INSERT INTO trainers_courses VALUES (7,2);
INSERT INTO trainers_courses VALUES (8,5);
INSERT INTO trainers_courses VALUES (8,8);
INSERT INTO trainers_courses VALUES (9,7);
INSERT INTO trainers_courses VALUES (9,11);
INSERT INTO trainers_courses VALUES (10,2);
INSERT INTO trainers_courses VALUES (10,3);
INSERT INTO trainers_courses VALUES (11,2);
INSERT INTO trainers_courses VALUES (11,3);
INSERT INTO trainers_courses VALUES (11,9);
INSERT INTO trainers_courses VALUES (12,1);
INSERT INTO trainers_courses VALUES (12,4);
INSERT INTO trainers_courses VALUES (12,5);
INSERT INTO trainers_courses VALUES (13,7);
INSERT INTO trainers_courses VALUES (13,9);
INSERT INTO trainers_courses VALUES (13,10);
INSERT INTO trainers_courses VALUES (13,11);
INSERT INTO trainers_courses VALUES (14,12);
INSERT INTO trainers_courses VALUES (14,13);
INSERT INTO trainers_courses VALUES (15,7);
INSERT INTO trainers_courses VALUES (16,7);
INSERT INTO trainers_courses VALUES (16,2);
INSERT INTO trainers_courses VALUES (16,3);
INSERT INTO trainers_courses VALUES (16,5);
INSERT INTO trainers_courses VALUES (17,6);
INSERT INTO trainers_courses VALUES (17,9);
INSERT INTO trainers_courses VALUES (17,2);

INSERT INTO exam_results VALUES (1,1,SYSDATE-54,36);
INSERT INTO exam_results VALUES (1,1,SYSDATE-42,65);
INSERT INTO exam_results VALUES (1,1,SYSDATE-35,94);
INSERT INTO exam_results VALUES (1,2,SYSDATE-40,88);
INSERT INTO exam_results VALUES (1,2,SYSDATE-30,80);
INSERT INTO exam_results VALUES (1,4,SYSDATE-56,82);
INSERT INTO exam_results VALUES (1,7,SYSDATE-27,96);
INSERT INTO exam_results VALUES (1,9,SYSDATE-52,85);
INSERT INTO exam_results VALUES (1,10,SYSDATE-14,88);
INSERT INTO exam_results VALUES (1,11,SYSDATE-14,78);
INSERT INTO exam_results VALUES (2,1,SYSDATE-11,76);
INSERT INTO exam_results VALUES (2,2,SYSDATE-29,76);
INSERT INTO exam_results VALUES (2,4,SYSDATE-17,88);
INSERT INTO exam_results VALUES (2,7,SYSDATE-24,82);
INSERT INTO exam_results VALUES (2,9,SYSDATE-58,99);
INSERT INTO exam_results VALUES (2,10,SYSDATE-24,95);
INSERT INTO exam_results VALUES (2,11,SYSDATE-29,89);
INSERT INTO exam_results VALUES (3,1,SYSDATE-21,83);
INSERT INTO exam_results VALUES (3,2,SYSDATE-10,84);
INSERT INTO exam_results VALUES (3,4,SYSDATE-45,79);
INSERT INTO exam_results VALUES (3,9,SYSDATE-49,77);
INSERT INTO exam_results VALUES (4,1,SYSDATE-30,75);
INSERT INTO exam_results VALUES (4,2,SYSDATE-60,86);
INSERT INTO exam_results VALUES (4,4,SYSDATE-40,81);
INSERT INTO exam_results VALUES (4,9,SYSDATE-22,96);
INSERT INTO exam_results VALUES (5,2,SYSDATE-47,57);
INSERT INTO exam_results VALUES (5,2,SYSDATE-40,74);
INSERT INTO exam_results VALUES (5,2,SYSDATE-36,98);
INSERT INTO exam_results VALUES (5,3,SYSDATE-54,76);
INSERT INTO exam_results VALUES (5,4,SYSDATE-13,77);
INSERT INTO exam_results VALUES (5,8,SYSDATE-43,70);
INSERT INTO exam_results VALUES (5,8,SYSDATE-30,80);
INSERT INTO exam_results VALUES (5,9,SYSDATE-25,97);
INSERT INTO exam_results VALUES (6,1,SYSDATE-24,94);
INSERT INTO exam_results VALUES (6,2,SYSDATE-52,78);
INSERT INTO exam_results VALUES (6,4,SYSDATE-41,76);
INSERT INTO exam_results VALUES (6,9,SYSDATE-28,83);
INSERT INTO exam_results VALUES (7,1,SYSDATE-28,98);
INSERT INTO exam_results VALUES (7,2,SYSDATE-55,90);
INSERT INTO exam_results VALUES (7,4,SYSDATE-37,99);
INSERT INTO exam_results VALUES (7,9,SYSDATE-25,98);
INSERT INTO exam_results VALUES (8,1,SYSDATE-42,85);
INSERT INTO exam_results VALUES (8,2,SYSDATE-11,86);
INSERT INTO exam_results VALUES (8,3,SYSDATE-54,75);
INSERT INTO exam_results VALUES (8,4,SYSDATE-58,82);
INSERT INTO exam_results VALUES (8,5,SYSDATE-26,91);
INSERT INTO exam_results VALUES (8,9,SYSDATE-56,94);
INSERT INTO exam_results VALUES (9,1,SYSDATE-53,81);
INSERT INTO exam_results VALUES (9,2,SYSDATE-12,82);
INSERT INTO exam_results VALUES (9,4,SYSDATE-25,92);
INSERT INTO exam_results VALUES (9,7,SYSDATE-30,81);
INSERT INTO exam_results VALUES (9,9,SYSDATE-60,89);
INSERT INTO exam_results VALUES (9,9,SYSDATE-42,86);
INSERT INTO exam_results VALUES (9,10,SYSDATE-31,90);
INSERT INTO exam_results VALUES (9,11,SYSDATE-30,82);
INSERT INTO exam_results VALUES (10,1,SYSDATE-24,86);
INSERT INTO exam_results VALUES (10,2,SYSDATE-10,98);
INSERT INTO exam_results VALUES (10,4,SYSDATE-53,92);
INSERT INTO exam_results VALUES (10,9,SYSDATE-42,93);
INSERT INTO exam_results VALUES (11,1,SYSDATE-58,77);
INSERT INTO exam_results VALUES (11,2,SYSDATE-10,91);
INSERT INTO exam_results VALUES (11,4,SYSDATE-16,96);
INSERT INTO exam_results VALUES (11,7,SYSDATE-36,75);
INSERT INTO exam_results VALUES (11,9,SYSDATE-55,96);
INSERT INTO exam_results VALUES (11,10,SYSDATE-18,77);
INSERT INTO exam_results VALUES (11,11,SYSDATE-27,75);
INSERT INTO exam_results VALUES (12,1,SYSDATE-53,89);
INSERT INTO exam_results VALUES (12,2,SYSDATE-39,100);
INSERT INTO exam_results VALUES (12,4,SYSDATE-46,98);
INSERT INTO exam_results VALUES (12,9,SYSDATE-45,87);
INSERT INTO exam_results VALUES (13,1,SYSDATE-28,86);
INSERT INTO exam_results VALUES (13,2,SYSDATE-23,90);
INSERT INTO exam_results VALUES (13,4,SYSDATE-10,85);
INSERT INTO exam_results VALUES (13,7,SYSDATE-41,76);
INSERT INTO exam_results VALUES (13,9,SYSDATE-20,92);
INSERT INTO exam_results VALUES (13,10,SYSDATE-49,78);
INSERT INTO exam_results VALUES (13,11,SYSDATE-10,75);
INSERT INTO exam_results VALUES (14,2,SYSDATE-4,98);
INSERT INTO exam_results VALUES (14,3,SYSDATE-28,88);
INSERT INTO exam_results VALUES (14,4,SYSDATE-45,80);
INSERT INTO exam_results VALUES (14,5,SYSDATE-46,50);
INSERT INTO exam_results VALUES (14,5,SYSDATE-41,35);
INSERT INTO exam_results VALUES (14,5,SYSDATE-34,28);
INSERT INTO exam_results VALUES (14,6,SYSDATE-32,75);
INSERT INTO exam_results VALUES (14,9,SYSDATE-36,84);
INSERT INTO exam_results VALUES (14,12,SYSDATE-12,94);
INSERT INTO exam_results VALUES (14,13,SYSDATE-16,86);
INSERT INTO exam_results VALUES (15,2,SYSDATE-17,85);
INSERT INTO exam_results VALUES (15,3,SYSDATE-2,80);
INSERT INTO exam_results VALUES (15,3,SYSDATE-10,72);
INSERT INTO exam_results VALUES (15,4,SYSDATE-48,78);
INSERT INTO exam_results VALUES (15,8,SYSDATE-46,78);
INSERT INTO exam_results VALUES (15,9,SYSDATE-5,96);
INSERT INTO exam_results VALUES (16,1,SYSDATE-42,78);
INSERT INTO exam_results VALUES (16,2,SYSDATE-19,95);
INSERT INTO exam_results VALUES (16,4,SYSDATE-40,93);
INSERT INTO exam_results VALUES (16,9,SYSDATE-30,81);
INSERT INTO exam_results VALUES (17,1,SYSDATE-31,99);
INSERT INTO exam_results VALUES (17,2,SYSDATE-43,80);
INSERT INTO exam_results VALUES (17,4,SYSDATE-47,84);
INSERT INTO exam_results VALUES (17,9,SYSDATE-41,87);
INSERT INTO exam_results VALUES (18,1,SYSDATE-11,78);
INSERT INTO exam_results VALUES (18,2,SYSDATE-15,97);
INSERT INTO exam_results VALUES (18,4,SYSDATE-28,81);
INSERT INTO exam_results VALUES (18,7,SYSDATE-3,88);
INSERT INTO exam_results VALUES (18,9,SYSDATE-8,98);
INSERT INTO exam_results VALUES (18,10,SYSDATE-34,85);
INSERT INTO exam_results VALUES (18,11,SYSDATE-14,97);
INSERT INTO exam_results VALUES (19,2,SYSDATE-38,75);
INSERT INTO exam_results VALUES (19,3,SYSDATE-45,69);
INSERT INTO exam_results VALUES (19,3,SYSDATE-37,72);
INSERT INTO exam_results VALUES (19,3,SYSDATE-30,83);
INSERT INTO exam_results VALUES (19,4,SYSDATE-33,86);
INSERT INTO exam_results VALUES (19,5,SYSDATE-45,84);
INSERT INTO exam_results VALUES (19,6,SYSDATE-22,77);
INSERT INTO exam_results VALUES (19,9,SYSDATE-34,86);
INSERT INTO exam_results VALUES (19,12,SYSDATE-12,90);
INSERT INTO exam_results VALUES (19,13,SYSDATE-2,91);
INSERT INTO exam_results VALUES (20,2,SYSDATE-35,95);
INSERT INTO exam_results VALUES (20,3,SYSDATE-6,78);
INSERT INTO exam_results VALUES (20,4,SYSDATE-32,98);
INSERT INTO exam_results VALUES (20,8,SYSDATE-21,79);
INSERT INTO exam_results VALUES (20,9,SYSDATE-17,99);
INSERT INTO exam_results VALUES (21,1,SYSDATE-3,85);
INSERT INTO exam_results VALUES (21,2,SYSDATE-23,76);
INSERT INTO exam_results VALUES (21,4,SYSDATE-2,96);
INSERT INTO exam_results VALUES (21,7,SYSDATE-34,77);
INSERT INTO exam_results VALUES (21,9,SYSDATE-26,99);
INSERT INTO exam_results VALUES (21,10,SYSDATE-14,80);
INSERT INTO exam_results VALUES (21,11,SYSDATE-43,61);
INSERT INTO exam_results VALUES (21,11,SYSDATE-38,86);
INSERT INTO exam_results VALUES (22,1,SYSDATE-4,82);
INSERT INTO exam_results VALUES (22,2,SYSDATE-38,88);
INSERT INTO exam_results VALUES (22,4,SYSDATE-9,91);
INSERT INTO exam_results VALUES (22,9,SYSDATE-15,77);
INSERT INTO exam_results VALUES (23,1,SYSDATE-12,92);
INSERT INTO exam_results VALUES (23,2,SYSDATE-41,88);
INSERT INTO exam_results VALUES (23,3,SYSDATE-43,20);
INSERT INTO exam_results VALUES (23,3,SYSDATE-35,36);
INSERT INTO exam_results VALUES (23,3,SYSDATE-30,47);
INSERT INTO exam_results VALUES (23,4,SYSDATE-44,77);
INSERT INTO exam_results VALUES (23,5,SYSDATE-30,80);
INSERT INTO exam_results VALUES (23,9,SYSDATE-14,91);
INSERT INTO exam_results VALUES (24,1,SYSDATE-43,79);
INSERT INTO exam_results VALUES (24,2,SYSDATE-42,90);
INSERT INTO exam_results VALUES (24,4,SYSDATE-2,86);
INSERT INTO exam_results VALUES (24,7,SYSDATE-19,90);
INSERT INTO exam_results VALUES (24,9,SYSDATE-13,87);
INSERT INTO exam_results VALUES (24,10,SYSDATE-9,78);
INSERT INTO exam_results VALUES (24,11,SYSDATE-13,77);
INSERT INTO exam_results VALUES (25,2,SYSDATE-44,45);
INSERT INTO exam_results VALUES (25,2,SYSDATE-40,57);
INSERT INTO exam_results VALUES (25,2,SYSDATE-34,68);
INSERT INTO exam_results VALUES (25,3,SYSDATE-40,17);
INSERT INTO exam_results VALUES (25,3,SYSDATE-35,35);
INSERT INTO exam_results VALUES (25,3,SYSDATE-31,51);
INSERT INTO exam_results VALUES (25,4,SYSDATE-23,12);
INSERT INTO exam_results VALUES (25,4,SYSDATE-17,34);
INSERT INTO exam_results VALUES (25,4,SYSDATE-12,44);
INSERT INTO exam_results VALUES (25,8,SYSDATE-22,85);
INSERT INTO exam_results VALUES (25,9,SYSDATE-25,91);
INSERT INTO exam_results VALUES (26,1,SYSDATE-42,94);
INSERT INTO exam_results VALUES (26,2,SYSDATE-31,87);
INSERT INTO exam_results VALUES (26,4,SYSDATE-11,79);
INSERT INTO exam_results VALUES (26,7,SYSDATE-34,79);
INSERT INTO exam_results VALUES (26,9,SYSDATE-28,89);
INSERT INTO exam_results VALUES (26,10,SYSDATE-43,92);
INSERT INTO exam_results VALUES (26,11,SYSDATE-8,98);
INSERT INTO exam_results VALUES (27,1,SYSDATE-45,78);
INSERT INTO exam_results VALUES (27,2,SYSDATE-4,79);
INSERT INTO exam_results VALUES (27,4,SYSDATE-18,81);
INSERT INTO exam_results VALUES (27,9,SYSDATE-29,76);
INSERT INTO exam_results VALUES (28,1,SYSDATE-6,98);
INSERT INTO exam_results VALUES (28,2,SYSDATE-29,77);
INSERT INTO exam_results VALUES (28,3,SYSDATE-5,93);
INSERT INTO exam_results VALUES (28,4,SYSDATE-44,77);
INSERT INTO exam_results VALUES (28,5,SYSDATE-32,95);
INSERT INTO exam_results VALUES (28,9,SYSDATE-12,91);
INSERT INTO exam_results VALUES (29,1,SYSDATE-32,96);
INSERT INTO exam_results VALUES (29,2,SYSDATE-11,78);
INSERT INTO exam_results VALUES (29,4,SYSDATE-50,65);
INSERT INTO exam_results VALUES (29,4,SYSDATE-45,94);
INSERT INTO exam_results VALUES (29,7,SYSDATE-19,77);
INSERT INTO exam_results VALUES (29,9,SYSDATE-1,99);
INSERT INTO exam_results VALUES (29,10,SYSDATE-10,85);
INSERT INTO exam_results VALUES (29,11,SYSDATE-37,89);
INSERT INTO exam_results VALUES (30,2,SYSDATE-11,84);
INSERT INTO exam_results VALUES (30,3,SYSDATE-5,88);
INSERT INTO exam_results VALUES (30,4,SYSDATE-13,97);
INSERT INTO exam_results VALUES (30,8,SYSDATE-45,96);
INSERT INTO exam_results VALUES (30,9,SYSDATE-0,77);
INSERT INTO exam_results VALUES (31,1,SYSDATE-25,80);
INSERT INTO exam_results VALUES (31,2,SYSDATE-24,82);
INSERT INTO exam_results VALUES (31,4,SYSDATE-35,85);
INSERT INTO exam_results VALUES (31,7,SYSDATE-15,98);
INSERT INTO exam_results VALUES (31,9,SYSDATE-33,100);
INSERT INTO exam_results VALUES (31,10,SYSDATE-35,93);
INSERT INTO exam_results VALUES (31,11,SYSDATE-9,91);
INSERT INTO exam_results VALUES (32,1,SYSDATE-9,89);
INSERT INTO exam_results VALUES (32,2,SYSDATE-17,91);
INSERT INTO exam_results VALUES (32,4,SYSDATE-35,81);
INSERT INTO exam_results VALUES (32,9,SYSDATE-4,83);
INSERT INTO exam_results VALUES (33,1,SYSDATE-1,89);
INSERT INTO exam_results VALUES (33,2,SYSDATE-14,89);
INSERT INTO exam_results VALUES (33,3,SYSDATE-26,85);
INSERT INTO exam_results VALUES (33,4,SYSDATE-20,92);
INSERT INTO exam_results VALUES (33,5,SYSDATE-6,81);
INSERT INTO exam_results VALUES (33,9,SYSDATE-20,96);
INSERT INTO exam_results VALUES (34,2,SYSDATE-11,89);
INSERT INTO exam_results VALUES (34,3,SYSDATE-8,98);
INSERT INTO exam_results VALUES (34,4,SYSDATE-34,77);
INSERT INTO exam_results VALUES (34,5,SYSDATE-6,87);
INSERT INTO exam_results VALUES (34,6,SYSDATE-27,35);
INSERT INTO exam_results VALUES (34,6,SYSDATE-35,54);
INSERT INTO exam_results VALUES (34,6,SYSDATE-30,70);
INSERT INTO exam_results VALUES (34,9,SYSDATE-14,83);
INSERT INTO exam_results VALUES (34,12,SYSDATE-13,87);
INSERT INTO exam_results VALUES (34,13,SYSDATE-9,80);
INSERT INTO exam_results VALUES (35,1,SYSDATE-30,93);
INSERT INTO exam_results VALUES (35,2,SYSDATE-17,75);
INSERT INTO exam_results VALUES (35,4,SYSDATE-22,86);
INSERT INTO exam_results VALUES (35,7,SYSDATE-32,84);
INSERT INTO exam_results VALUES (35,9,SYSDATE-14,90);
INSERT INTO exam_results VALUES (35,10,SYSDATE-21,98);
INSERT INTO exam_results VALUES (35,11,SYSDATE-21,96);
INSERT INTO exam_results VALUES (36,1,SYSDATE-11,81);
INSERT INTO exam_results VALUES (36,2,SYSDATE-23,86);
INSERT INTO exam_results VALUES (36,4,SYSDATE-15,98);
INSERT INTO exam_results VALUES (36,9,SYSDATE-23,83);
INSERT INTO exam_results VALUES (37,1,SYSDATE-11,94);
INSERT INTO exam_results VALUES (37,2,SYSDATE-17,83);
INSERT INTO exam_results VALUES (37,3,SYSDATE-18,76);
INSERT INTO exam_results VALUES (37,4,SYSDATE-8,93);
INSERT INTO exam_results VALUES (37,5,SYSDATE-20,93);
INSERT INTO exam_results VALUES (37,9,SYSDATE-25,98);
INSERT INTO exam_results VALUES (38,1,SYSDATE-3,98);
INSERT INTO exam_results VALUES (38,2,SYSDATE-4,77);
INSERT INTO exam_results VALUES (38,4,SYSDATE-21,84);
INSERT INTO exam_results VALUES (38,9,SYSDATE-15,100);
INSERT INTO exam_results VALUES (39,2,SYSDATE-10,74);
INSERT INTO exam_results VALUES (39,2,SYSDATE-6,100);
INSERT INTO exam_results VALUES (39,3,SYSDATE-3,89);
INSERT INTO exam_results VALUES (39,4,SYSDATE-18,93);
INSERT INTO exam_results VALUES (39,5,SYSDATE-18,97);
INSERT INTO exam_results VALUES (39,6,SYSDATE-18,88);
INSERT INTO exam_results VALUES (39,9,SYSDATE-24,97);
INSERT INTO exam_results VALUES (39,12,SYSDATE-4,93);
INSERT INTO exam_results VALUES (40,1,SYSDATE-22,81);
INSERT INTO exam_results VALUES (40,2,SYSDATE-9,78);
INSERT INTO exam_results VALUES (40,4,SYSDATE-0,91);
INSERT INTO exam_results VALUES (40,9,SYSDATE-15,80);
INSERT INTO exam_results VALUES (40,10,SYSDATE-7,92);
INSERT INTO exam_results VALUES (40,11,SYSDATE-18,96);
INSERT INTO exam_results VALUES (41,1,SYSDATE-15,99);
INSERT INTO exam_results VALUES (41,2,SYSDATE-0,86);
INSERT INTO exam_results VALUES (41,4,SYSDATE-19,99);
INSERT INTO exam_results VALUES (41,9,SYSDATE-17,100);
INSERT INTO exam_results VALUES (41,10,SYSDATE-3,87);
INSERT INTO exam_results VALUES (41,11,SYSDATE-7,78);
INSERT INTO exam_results VALUES (42,1,SYSDATE-23,57);
INSERT INTO exam_results VALUES (42,1,SYSDATE-15,70);
INSERT INTO exam_results VALUES (42,1,SYSDATE-5,83);
INSERT INTO exam_results VALUES (42,2,SYSDATE-16,97);
INSERT INTO exam_results VALUES (42,4,SYSDATE-15,85);
INSERT INTO exam_results VALUES (42,9,SYSDATE-22,83);
INSERT INTO exam_results VALUES (43,1,SYSDATE-13,84);
INSERT INTO exam_results VALUES (43,2,SYSDATE-2,92);
INSERT INTO exam_results VALUES (43,3,SYSDATE-2,89);
INSERT INTO exam_results VALUES (43,4,SYSDATE-10,80);
INSERT INTO exam_results VALUES (43,5,SYSDATE-8,75);
INSERT INTO exam_results VALUES (43,9,SYSDATE-6,82);
INSERT INTO exam_results VALUES (44,1,SYSDATE-2,98);
INSERT INTO exam_results VALUES (44,2,SYSDATE-15,90);
INSERT INTO exam_results VALUES (44,9,SYSDATE-8,99);
INSERT INTO exam_results VALUES (45,1,SYSDATE-19,82);
INSERT INTO exam_results VALUES (45,2,SYSDATE-13,94);
INSERT INTO exam_results VALUES (45,4,SYSDATE-8,77);
INSERT INTO exam_results VALUES (45,9,SYSDATE-18,77);
INSERT INTO exam_results VALUES (45,10,SYSDATE-12,100);
INSERT INTO exam_results VALUES (45,11,SYSDATE-2,93);
INSERT INTO exam_results VALUES (46,1,SYSDATE-12,78);
INSERT INTO exam_results VALUES (46,2,SYSDATE-0,75);
INSERT INTO exam_results VALUES (46,4,SYSDATE-4,83);
INSERT INTO exam_results VALUES (46,9,SYSDATE-11,75);
INSERT INTO exam_results VALUES (47,1,SYSDATE-6,95);
INSERT INTO exam_results VALUES (47,2,SYSDATE-6,96);
INSERT INTO exam_results VALUES (47,9,SYSDATE-17,91);
INSERT INTO exam_results VALUES (48,1,SYSDATE-11,95);
INSERT INTO exam_results VALUES (48,2,SYSDATE-15,100);
INSERT INTO exam_results VALUES (48,9,SYSDATE-5,82);
INSERT INTO exam_results VALUES (49,1,SYSDATE-5,75);
INSERT INTO exam_results VALUES (49,2,SYSDATE-9,78);
INSERT INTO exam_results VALUES (49,9,SYSDATE-3,91);
INSERT INTO exam_results VALUES (50,2,SYSDATE-9,94);
INSERT INTO exam_results VALUES (50,3,SYSDATE-13,94);
INSERT INTO exam_results VALUES (50,9,SYSDATE-0,80);
INSERT INTO exam_results VALUES (51,1,SYSDATE-6,100);
INSERT INTO exam_results VALUES (51,2,SYSDATE-13,83);
INSERT INTO exam_results VALUES (51,9,SYSDATE-15,97);
INSERT INTO exam_results VALUES (52,2,SYSDATE-6,86);
INSERT INTO exam_results VALUES (52,9,SYSDATE-11,79);
INSERT INTO exam_results VALUES (53,2,SYSDATE-3,94);
INSERT INTO exam_results VALUES (53,9,SYSDATE-1,77);
INSERT INTO exam_results VALUES (54,2,SYSDATE-2,87);
INSERT INTO exam_results VALUES (54,9,SYSDATE-9,75);
INSERT INTO exam_results VALUES (55,2,SYSDATE-2,81);
INSERT INTO exam_results VALUES (55,9,SYSDATE-9,88);
INSERT INTO exam_results VALUES (56,9,SYSDATE-2,95);

