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

