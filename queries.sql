
-- Which departments have the highest average salaries?
SELECT dept_name,
       AVG(salary) AS average_salary
FROM departments
JOIN dept_emp USING (dept_no)
JOIN salaries USING (emp_no)
GROUP BY dept_name
ORDER BY average_salary DESC;


-- What is the average salary per job title?
SELECT title,
       AVG(salary) AS average_salary
FROM titles
JOIN salaries USING (emp_no)
GROUP BY title
ORDER BY average_salary DESC;


-- Who are the top 10 highest-paid employees?
SELECT emp_no,
       first_name,
       last_name,
       salary
FROM employees
JOIN salaries USING (emp_no)
ORDER BY salary DESC
LIMIT 10;


-- Which department has the most employees?
SELECT dept_name,
       COUNT(emp_no) AS employee_count
FROM departments
JOIN dept_emp USING (dept_no)
GROUP BY dept_name
ORDER BY employee_count DESC;


-- How does salary differ by department and job title?

SELECT title,
       AVG(salary) AS average_salary
FROM titles
JOIN salaries USING (emp_no)
GROUP BY title
HAVING AVG(salary) > (
    SELECT AVG(salary)
    FROM salaries
)
ORDER BY average_salary DESC;



-- what is the average salary by department and job title?
SELECT d.dept_name,
       t.title,
       AVG(s.salary) AS average_salary
FROM departments d
JOIN dept_emp de USING (dept_no)
JOIN titles t USING (emp_no)
JOIN salaries s USING (emp_no)
GROUP BY d.dept_name, 
         t.title
ORDER BY d.dept_name, 
         average_salary DESC;
