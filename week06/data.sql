USE sen307_11288;
INSERT INTO department (dept_name) VALUES
('Software Engineering'),
('Computer Science'),
('Artificial Intelligence'),
('Data Science'),
('Cybersecurity');

INSERT INTO Department (dept_id, dept_name) VALUES
  (1, 'Software Engineering'),
  (2, 'Computer Science'),
  (4, 'Information Systems'),
  (5, 'Information Technology'),
  (6, 'Information Systems'),
  (7, 'Software Engineering'),
  (8, 'Computer Science');
  
INSERT INTO course (course_code, course_title, credit_units, description, dept_id) VALUES
('SEN307', 'Database Systems', 3,
'Relational database design, SQL queries, normalization, transactions and indexing using
MySQL.',
(SELECT dept_id FROM department WHERE dept_name = 'Software Engineering')),
('SEN301', 'Software Architecture', 3,
'Architectural styles, design patterns, microservices and how to structure large software
systems.',
(SELECT dept_id FROM department WHERE dept_name = 'Software Engineering')),
('COS301', 'Operating Systems', 3,'Processes, threads, CPU scheduling, memory management and file systems.',
(SELECT dept_id FROM department WHERE dept_name = 'Computer Science')),
('COS305', 'Computer Networks', 3,
'TCP/IP, routing, switching, LAN and WAN design and network protocols.',
(SELECT dept_id FROM department WHERE dept_name = 'Computer Science')),
('AIN301', 'Introduction to Artificial Intelligence', 3,
'Intelligent agents, search algorithms, knowledge representation and reasoning.',
(SELECT dept_id FROM department WHERE dept_name = 'Artificial Intelligence')),
('AIN305', 'Machine Learning', 3,
'Supervised and unsupervised learning, neural networks, deep learning and model
evaluation.',
(SELECT dept_id FROM department WHERE dept_name = 'Artificial Intelligence')),
('AIN307', 'Natural Language Processing', 3,
'Text processing, word embeddings, language models, sentiment analysis and chatbots.',
(SELECT dept_id FROM department WHERE dept_name = 'Artificial Intelligence')),
('DTS301', 'Data Visualization and Analytics', 2,
'Exploratory data analysis, charts, dashboards and telling stories with data.',
(SELECT dept_id FROM department WHERE dept_name = 'Data Science')),
('DTS305', 'Big Data Technologies', 3,
'Distributed storage and processing of very large datasets with Hadoop and Spark.',
(SELECT dept_id FROM department WHERE dept_name = 'Data Science')),
('CYB301', 'Network Security', 3,
'Firewalls, cryptography, intrusion detection and protecting networks from attacks.',
(SELECT dept_id FROM department WHERE dept_name = 'Cybersecurity'));
SELECT d.dept_name, COUNT(c.course_id) AS courses
FROM Department d LEFT JOIN Course c ON d.dept_id = c.dept_id
GROUP BY d.dept_name;

SELECT dept_id, dept_name FROM Department;
SELECT course_id, course_code FROM Course;

INSERT INTO Lecturer (staff_no, full_name, email, dept_id) VALUES
('VUA/ST/101', 'Dr Amaka Okafor', 'a.okafor@vua.edu.ng', 1),
('VUA/ST/102', 'Dr Musa Bello', 'm.bello@vua.edu.ng', 1),
('VUA/SEN/103', 'Dr Victor ode', 'V.ode@vua.edu.ng', 2),
('VUA/SEN/104', 'Dr julius obi', 'j.obi@vua.edu.ng', 2),
('VUA/CSC/105', 'Mr Ibukun David', 'I.david@vua.edu.ng', 3),
('VUA/CSC/106', 'Mrs Mary camer', 'm.camer@vua.edu.ng', 3),
('VUA/EEN/107', 'Mrs Immacilate', 'm.Imma@vua.edu.ng', 4),
('VUA/EEN/108', 'Dr valantine', 'D.Valantine@vua.edu.ng', 4),
('VUA/CEN/109', 'Mr Nangar david', 'n.david@vua.edu.ng', 5),
('VUA/CEN/110', 'Dr Ada Osarr', 'a.osarr@vua.edu.ng', 5);

INSERT INTO Student (matric_no, full_name, gender, date_of_birth, dept_id) VALUES
('VUG/SEN/24/11288', 'Okoye Cyril Okwuchukwu', 'M', '2007-02-09', 1),
('20231234', 'Ada Obi',                  'F', '2005-03-14', 1),
('20231236', 'Justina Obi',              'F', '2005-03-14', 3),
('20231237', 'Chidi James',              'M', '2004-09-02', 2),
('20231238', 'Chisom Deniella Aka',      'F', '2004-09-02', 3),
('20231239', 'John Musa Bello',          'M', '2004-11-02', 2),
('20231201', 'Amina Bello',              'F', '2003-05-14', 1),
('20231202', 'Chinedu Okafor',           'M', '2004-07-22', 2),
('20231203', 'Fatima Abdullahi',         'F', '2005-01-30', 3),
('20231204', 'Emeka Nnamdi',             'M', '2006-11-08', 1),
('20231205', 'Grace Adesola',            'F', '2004-03-19', 4),
('20231206', 'Ibrahim Suleiman',         'M', '2005-08-25', 2),
('20231207', 'Halima Yusuf',             'F', '2003-12-03', 5),
('20231208', 'Joseph Eze',               'M', '2007-04-11', 3),
('20231209', 'Kemi Abiodun',             'F', '2006-06-17', 6),
('20231210', 'Lawal Musa',               'M', '2004-09-28', 1),
('20231211', 'Ngozi Chukwu',             'F', '2005-10-05', 7),
('20231212', 'Oluwaseun Adewale',        'M', '2007-02-14', 8),
('20231213', 'Patience Okonkwo',         'F', '2003-08-20', 4),
('20231214', 'Rashidi Garba',            'M', '2006-01-09', 5),
('20231215', 'Sarah Balogun',            'F', '2004-11-23', 2),
('20231216', 'Tunde Adeyemi',            'M', '2005-05-31', 6),
('20231217', 'Uchenna Mbah',             'F', '2007-07-07', 3),
('20231218', 'Yakubu Sani',              'M', '2003-03-16', 7),
('20231219', 'Zainab Lawal',             'F', '2006-09-12', 8),
('20231220', 'Adaeze Nwosu',             'F', '2004-06-29', 1),
('20231221', 'Bukola Adekunle',          'F', '2005-04-08', 2),
('20231222', 'Daniel Obi',               'M', '2006-10-19', 3),
('20231223', 'Emmanuella Dike',          'F', '2003-07-25', 4),
('20231224', 'Femi Afolabi',             'M', '2004-01-13', 5),
('20231225', 'Grace Emenike',            'F', '2007-05-30', 1),
('20231226', 'Haruna Bawa',              'M', '2005-12-02', 6),
('20231227', 'Ifeoma Nnaji',             'F', '2006-08-14', 7),
('20231228', 'James Okoro',              'M', '2004-02-21', 8),
('20231229', 'Kuda Musah',               'F', '2003-09-07', 3),
('20231230', 'Ladi Abubakar',            'M', '2007-11-18', 4),
('20231231', 'Musa Ibrahim',             'M', '2005-06-26', 2),
('20231232', 'Nneka Eze',                'F', '2006-03-09', 5),
('20231233', 'Onyeka Okwu',              'M', '2004-10-11', 1),
('20231252', 'Pauline Uka',              'F', '2003-04-27', 6),
('20231235', 'Chisom Deniella Okoro',    'F', '2004-09-02', 3),
('20231251', 'John Musa Danjuma',        'M', '2004-11-02', 2),
('20231253', 'Rahma Aliyu',              'F', '2007-01-05', 7),
('20231254', 'Samuel Dauda',             'M', '2005-08-18', 8),
('20231255', 'Tolu Ajayi',               'F', '2006-12-30', 4),
('20231256', 'Usman Bello',              'M', '2004-05-15', 1),
('20231240', 'Victoria Idris',           'F', '2003-11-22', 5),
('20231241', 'Wale Adeyemi',             'M', '2007-07-04', 2),
('20231242', 'Yewande Balogun',          'F', '2005-02-28', 3),
('20231243', 'Zamir Garba',              'M', '2006-06-13', 6),
('20231244', 'Abigail Eze',              'F', '2004-08-09', 7),
('20231245', 'Babatunde Ogun',           'M', '2003-03-23', 8),
('20231246', 'Chidinma Okafor',          'F', '2007-10-16', 1),
('20231247', 'Dauda Sule',               'M', '2005-04-07', 5),
('20231248', 'Efe Adesola',              'F', '2006-11-24', 2),
('20231249', 'Gideon Nnamdi',            'M', '2004-01-31', 3),
('20231250', 'Hauwa Abdullahi',          'F', '2003-07-19', 4);

SELECT student_id, matric_no, full_name FROM Student;
SELECT lecturer_id, full_name FROM Lecturer;

INSERT INTO enrolment (student_id, course_id) VALUES
  (1, 1), (2, 1), (3, 1), (4, 1),
  (5, 1), (6, 1), (7, 1), (1, 2),
  (2, 2), (3, 2), (4, 2), (5, 2),
  (6, 2), (1, 3), (2, 3), (3, 3),
  (4, 3), (5, 3), (6, 3), (1, 4),
  (2, 4), (3, 4), (4, 4), (5, 4),
  (6, 4), (1, 5), (2, 5), (3, 5),
  (4, 5), (5, 5), (6, 5), (1, 6),
  (2, 6), (3, 6), (4, 6), (1, 7),
  (2, 7), (3, 7), (4, 7), (1, 8);
  
  INSERT INTO CourseAllocation (course_id, lecturer_id) VALUES
  (1, 1), 
  (1, 2),  
  (2, 2),
  (3, 3),
  (4, 3),
  (5, 4),
  (6, 4),
  (7, 5),
  (8, 5);
  
SELECT matric_no, full_name, dept_id FROM Student WHERE matric_no = '20231234';
UPDATE Student SET dept_id = 2 WHERE matric_no = '20231234';
SELECT matric_no, full_name, dept_id FROM Student WHERE matric_no = '20231234';

INSERT INTO Department (dept_name) VALUES ('Library and Information Science');
INSERT INTO Student (matric_no, full_name, dept_id)
VALUES ('20239999', 'Transfer Student',
(SELECT dept_id FROM Department WHERE dept_name = 'Library and Information
Science'));

DELETE FROM Department WHERE dept_name = 'Library and Information Science';

DELETE FROM student WHERE `student`.`student_id` = 21;

UPDATE Student
SET dept_id = (SELECT dept_id FROM Department

WHERE dept_name = 'Software Engineering')

WHERE matric_no = '20239999';
-- Step 2: now the delete succeeds
DELETE FROM Department WHERE dept_name = 'Library and Information Science';
SELECT * FROM Department;

SELECT 'Departments' AS tbl, COUNT(*) AS total FROM Department
UNION ALL SELECT 'Lecturers', COUNT(*) FROM Lecturer
UNION ALL SELECT 'Students', COUNT(*) FROM Student
UNION ALL SELECT 'Courses', COUNT(*) FROM Course
UNION ALL SELECT 'Enrolments', COUNT(*) FROM Enrolment
UNION ALL SELECT 'Allocations', COUNT(*) FROM CourseAllocation;