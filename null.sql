-- 1. List the teachers who have NULL for their department
SELECT teacher.name
FROM teacher
LEFT JOIN dept
ON teacher.dept = dept.id
WHERE teacher.dept IS NULL;

-- 2. Use a different JOIN so that all teachers are listed
SELECT teacher.name, dept.name
FROM teacher
LEFT JOIN dept
ON dept.id = teacher.dept;

-- 3. Use a different JOIN so that all departments are listed
SELECT teacher.name, dept.name
FROM teacher
RIGHT JOIN dept
ON teacher.dept = dept.id;

-- 4. Use COALESCE to show the teacher name and mobile number or '079864442266'
SELECT name, COALESCE(mobile, '07986 444 2266')
FROM teacher;

-- 5. Use the COALESCE function and a LEFT JOIN to print the teacher name and department name
SELECT teacher.name, COALESCE(dept.name, 'None')
FROM teacher
LEFT JOIN dept
ON dept.id = teacher.dept;

-- 6. Use COUNT to show the number of teachers and the number of mobile phones
SELECT Count(teacher.name), COUNT(mobile)
FROM teacher;

-- 7. USE COUNT and GROUP BY dept.name to show each department and the number of staff. Use a RIGHT JOIN for enginnering
SELECT dept.name, COUNT(teacher.name)
FROM dept
LEFT JOIN teacher
ON teacher.dept = dept.id
GROUP BY dept.name;

-- 8. Use CASE to show the name of each teacher followed by 'Sci' if the teacher is dept 1 or 2 and 'Art' otherwise.
SELECT name,
CASE 
  WHEN dept = 1 THEN 'Sci'
  WHEN dept = 2 THEN 'Sci'
  ELSE 'Art'
END
FROM teacher;

-- 9. Use CASE to show the name of each teacher followed by 'Sci' if the teacher is dept 1 or 2, show 'Art' is the teacher's dept is 3
--    and 'None' otherwise
SELECT name,
CASE
  WHEN dept = 1 THEN 'Sci'
  WHEN dept = 2 THEN 'Sci'
  WHEN dept = 3 THEN 'Art'
  ELSE 'None'
END
FROM teacher;
