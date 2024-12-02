Select product_id from products where low_fats ='Y'and recyclable ='Y';

select name from customer where referee_id != 2 or  referee_id is null;

Select name, population, area from World where area>=3000000 or population>=25000000;

Select distinct author_id as id from views where author_id = viewer_id order by id asc;

Select tweet_id from tweets where len(content) > 15;

select EmployeeUNI.unique_id, employees.name from Employees left join EmployeeUNI on employees.id = EmployeeUNI.id;

select product.product_name, Sales.year, Sales.price from sales inner join product on sales.product_id = product.product_id;

Select visits.customer_id, count(visits.visit_id) as count_no_trans from visits left join transactions on visits.visit_id = transactions.visit_id where transactions.transaction_id is null group by visits.customer_id;

--DATEADD(interval, number, date)
Select Weather.id from Weather join weather temp on dateAdd(day,-1,weather.recordDate) = temp.recordDate and weather.temperature > temp.temperature;

--ROUND (col to be rounded, round length, round/truncate)
Select at1.machine_id, round(avg(at2.timestamp - at1.timestamp),3) as processing_time from activity as at1 join activity as at2 on 
at1.machine_id = at2.machine_id and
at1.process_id = at2.process_id and
at1.activity_type = 'start' and
at2.activity_type = 'end' group by at1.machine_id;

Select employee.name, bonus.bonus from employee left join bonus on employee.empId = bonus.empId where bonus < 1000 or bonus is null;

--cross join (Cartesian product - every student row will be combined with every subject row) 
Select Students.student_id, students.student_name, subjects.subject_name, 
count(examinations.student_id) as attended_exams 
from students 
cross join subjects 
left join examinations
on  Students.student_id = examinations.student_id 
and subjects.subject_name = examinations.subject_name  
group by Students.student_id, students.student_name, subjects.subject_name  
order by Students.student_id, subjects.subject_name;

Select empy.name from employee as empy
join employee as emp
on empy.id = emp.managerId
group by empy.name
having count(emp.managerId) >=5;

select name from employee where id in 
(select managerid from employee group by managerid having count(*)>=5);

--SELECT 
--    CASE expression
--        WHEN value1 THEN result1
--        WHEN value2 THEN result2
--        ELSE result3
--    END AS alias_name
--FROM table_name;

--CAST(value to be converted AS convert datatype)

Select signups.user_id, 
round(cast(count(case 
when action = 'confirmed'
then 1 
else null end)as float)/count(*),2) as confirmation_rate
from signups
left join confirmations
on signups.user_id = confirmations.user_id
group by signups.user_id;


Select * from Cinema where description != 'boring' and id%2 = 1 order by rating desc;

--ISNULL(expression, if expression null-replacement_value) and 1.0 for floating division
--COALESCE(expression1, expression2, ..., expressionN)- return first non-null value. If all values are NULL, it returns NULL.
Select p.product_id, isnull(round(sum(p.price*u.units*1.0) / sum(u.units),2),0) as average_price from prices p
left join unitssold u
on p.product_id = u.product_id 
and purchase_date between start_date and end_date
group by p.product_id;

Select p.project_id, round(avg(experience_years*1.0),2) as average_years 
from project p inner join employee e
on p.employee_id = e.employee_id group by project_id;

SELECT r.contest_id,round(count(distinct r.user_id)*100.0/(select count(*) from users),2) as percentage
from register r group by r.contest_id
order by percentage desc, r.contest_id asc;

Select  query_name,
round(avg(rating * 1.0 / position),2) as quality,
round(sum(case when rating < 3 then 1 else 0 end) * 100.0 / count(*), 2) as poor_query_percentage
from queries where query_name is not null group by query_name;

