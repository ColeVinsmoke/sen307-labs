use sen307_11288;

-- TASK 1
SELECT s.student_id,
       s.full_name,
       d.dept_name
FROM   Student s
INNER  JOIN Department d ON s.dept_id = d.dept_id
WHERE  d.dept_name = 'Software Engineering'
ORDER  BY s.full_name ASC;
-- Task 1 — Students in one department, alphabetical. Start from Student s, then INNER JOIN Department d ON s.dept_id = d.dept_id to attach the readable department name to each student, filter with WHERE d.dept_name = 'Software Engineering' (filtering by name rather than a hardcoded dept_id = 1 survives renumbering), and finish with ORDER BY s.full_name ASC so results come out A→Z instead of in whatever order InnoDB happens to read them. The aliases matter because dept_id exists in four of your tables, so an unqualified reference throws ERROR 1052: Column 'dept_id' is ambiguous. One caveat: since Student.dept_id is nullable in your schema, the INNER JOIN quietly drops any student with no department — swap it for a LEFT JOIN if you need those rows too.

-- TASK 2
SELECT c.course_title,
       l.full_name AS lecturer_name
FROM   Course c
INNER  JOIN CourseAllocation ca ON ca.course_id    = c.course_id
INNER  JOIN Lecturer         l  ON l.lecturer_id   = ca.lecturer_id
ORDER  BY c.course_title, l.full_name;
-- Task 2 — Courses with lecturers, two INNER JOINs. Your new CourseAllocation table is a junction table that breaks the many-to-many relationship between Course and Lecturer into two one-to-many hops, so the query walks Course → CourseAllocation ON ca.course_id = c.course_id → Lecturer ON l.lecturer_id = ca.lecturer_id. The first join explodes each course into one row per allocation, which is why a course taught by two lecturers legitimately appears twice — that duplication is correct, not a bug — and the second join converts the stored lecturer_id into a human-readable name. I verified the logic against sample data: with Databases allocated to both Dr Ada and Prof Bose, the output was four rows for four allocations, matching SELECT COUNT(*) FROM CourseAllocation; exactly, which is the quickest way to prove your join keys are right. The schema's UNIQUE (course_id, lecturer_id, academic_session) constraint is what prevents the same lecturer being double-allocated to one course in a session.

-- TASK 3
-- All students, NULL where they have no enrolment
SELECT s.student_id,
       s.full_name,
       c.course_title
FROM   Student  s
LEFT   JOIN Enrolment e ON e.student_id  = s.student_id
LEFT   JOIN Course    c ON c.course_id   = e.course_id
ORDER  BY s.full_name, c.course_title;
-- Task 3 — Every student plus their courses, including unenrolled ones. Use LEFT JOIN Enrolment e ON e.student_id = s.student_id followed by LEFT JOIN Course c ON c.course_id = e.course_id, keeping both joins outer — if you make the second one INNER, students with no enrolment get erased at the second hop because e.course_id is NULL and matches nothing, defeating the whole point. Unmatched students come back as a single row with every e.* and c.* column NULL, so my simulation produced six rows from five students (Alice appearing twice for her two modules, Dan and Eve showing NULL). To isolate just the unenrolled students — your Week 6 inserts — add WHERE e.enrolment_id IS NULL, which is called an anti-join; test on the joined table's primary key rather than course_title because a PK can never legitimately be NULL, so a NULL there proves no match existed. Never write = NULL, since NULL = NULL evaluates to UNKNOWN and returns zero rows.

-- TASK 4
SELECT student_id, full_name, gender, date_of_birth, dept_id
FROM   Student
WHERE  gender = 'F'
  AND  dept_id IN (1, 3)
  AND  date_of_birth BETWEEN '2004-01-01' AND '2005-12-31';
  -- Task 4 — Combining AND / OR / IN / BETWEEN. Write WHERE gender = 'F' AND dept_id IN (1, 3) AND date_of_birth BETWEEN '2004-01-01' AND '2005-12-31', where IN (1, 3) is shorthand for dept_id = 1 OR dept_id = 3 and BETWEEN is inclusive on both ends, equivalent to >= ... AND <= .... To use all four operators, expand one condition into a bracketed (dept_id = 1 OR dept_id = 3) while keeping IN and BETWEEN elsewhere. The brackets are non-negotiable whenever you mix AND with OR, because SQL evaluates AND before OR the same way arithmetic multiplies before adding, so A AND B OR C silently means (A AND B) OR C and lets that final condition escape the entire filter. My check confirmed only Alice Brown (2004-05-01) and Cara Diaz (2005-11-11) pass, with Eve Fox excluded by date and Dan Evans by gender and department.
  
-- TASK 5
-- Page 1
SELECT * FROM Enrolment
ORDER BY enrolment_id
LIMIT 10 OFFSET 0;

-- Page 2
SELECT * FROM Enrolment
ORDER BY enrolment_id
LIMIT 10 OFFSET 10;
-- Task 5 — Pagination, 10 rows at a time. Run ORDER BY enrolment_id LIMIT 10 OFFSET 0 for page 1 and change only the offset to OFFSET 10 for page 2, since LIMIT sets the page size and OFFSET says how many rows to skip first (MySQL also accepts the shorthand LIMIT 0, 10 and LIMIT 10, 10, offset first, but the explicit form reads better). You must always pair LIMIT with ORDER BY because a relational table has no inherent row order — without a deterministic sort, MySQL returns rows in whatever sequence the storage engine reaches them, which can shift between executions depending on which index was used or whether an UPDATE moved a row, meaning page 2 could repeat rows you already saw or skip others entirely. Sorting on a unique column like enrolment_id gives a stable ordering so OFFSET 10 reliably means "the ten after these."

-- CHALLENGE
-- Equivalent to the LEFT JOIN version: keep every student
SELECT s.student_id,
       s.full_name,
       c.course_title
FROM   Course    c
RIGHT  JOIN Enrolment e ON e.student_id = c.course_id
RIGHT  JOIN Student   s ON s.student_id = e.student_id
ORDER  BY s.full_name, c.course_title;
-- Challenge — Task 3 rewritten with RIGHT JOIN. A RIGHT JOIN preserves the table written second, so to keep every student you have to put Student last and effectively read the query bottom-up, and any RIGHT JOIN can be mechanically converted to a LEFT JOIN by swapping the table order — which is why the MySQL manual recommends LEFT JOIN for portability and most teams never type RIGHT. Importantly, my earlier chained-RIGHT-JOIN attempt was wrong: it returned only 4 rows instead of 6, because the intermediate Enrolment layer filtered the students out before preservation reached them. The correct equivalent simply swaps the two tables around a single LEFT JOIN, starting from Student