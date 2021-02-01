select * from dept_emp

select emp_no, first_name, last_name 
into ret_emp
from employees
where birth_date between '1952-01-01' and '1955-01-01'


SELECT  
ret_emp.emp_no,
ret_emp.first_name,
ret_emp.last_name,
titles.title,
titles.from_date,
titles.to_date

into retirement_titles
FROM ret_emp
left JOIN titles 
on ret_emp.emp_no = titles.emp_no
ORDER BY emp_no;

select * from retirement_titles

SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title


INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, last_name DESC;

select * from unique_titles

select count(distinct title) from unique_titles

select title, count(distinct emp_no) as "num" from retirement_titles
group by title
order by "num"

--checking this against the book because the numbers are so different. this count doesn't take into account the unique filter of retiring employees
select title, count(distinct emp_no) as "# retirees" 
into r_titles2
from retirement_titles
group by title
order by "# retirees" desc

select * from r_titles2


--This is the one to export. looks a little diff than the book but oh well
select title, count(distinct emp_no) as "# retirees" 
into r_titles5
from unique_titles
group by title
order by "# retirees" desc

select * from r_titles5


--for D2 I'm gonna refactor my building blocks from before
select emp_no, first_name, last_name, birth_date 
into ment_emp
from employees
where birth_date between '1965-01-01' and '1965-12-31'
--actually nah. i can probably chain this

select distinct on (e.emp_no) e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
dept_emp.from_date,
dept_emp.to_date,
titles.title

into mentor_elig3
from employees as e
left join dept_emp
on e.emp_no = dept_emp.emp_no 
left join titles
on e.emp_no = titles.emp_no
where e.birth_date between '1965-01-01' and '1965-12-31'
order by emp_no

select * from mentor_elig
--shit. forgot the birthday filter.

select * from mentor_elig3
--third time's the charm