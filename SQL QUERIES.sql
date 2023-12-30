use hr_analysis;
show tables;
select * from hr1;
select * from hr2;

alter table hr2 rename column Employeenumber to  Employee_Number;

### Left Join  ###
select * from hr1 
left join
hr2 
on HR1.Employeenumber  =  HR2.Employee_number;

create table EmployeeRetension as ( select * from hr1 
left join
hr2 
on HR1.Employeenumber  =  HR2.Employee_number);

select count(*) from Employeeretension where attrition ="Yes";
select count(*) from Employeeretension where attrition ="No";

select count(*) from Employeeretension where attrition ="Yes";
select count(*)  from employeeretension;


select  (((SELECT COUNT( * ) FROM employeeretension where attrition ="Yes")/count(*)) * 100)as attritionrate from employeeretension;
select (count(*) - (select count(*) from Employeeretension where attrition ="Yes"))from employeeretension;

select * from employeeretension;
select avg(age) as Average_Age from employeeretension;


#### KPI(1)#####
SELECT Department, AVG(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)*100 AS AvgAttritionRate
FROM employeeretension
GROUP BY Department order by avgattritionrate;

#### KPI(2)#####
select jobrole,avg(hourlyRate) as Avghourlyrate  from employeeretension where gender="Male" and jobrole= 'Research Scientist';

#### KPI(3)#####

SELECT
    CASE
        WHEN MonthlyIncome BETWEEN 1000 AND 10000 THEN '1000-10000'
        WHEN MonthlyIncome BETWEEN 10001 AND 20000 THEN '10001-20000'
        WHEN MonthlyIncome BETWEEN 20001 AND 30000 THEN '20001-30000'
        WHEN MonthlyIncome BETWEEN 30001 AND 40000 THEN '30001-40000'
        WHEN MonthlyIncome BETWEEN 40001 AND 50000 THEN '40001-50000'
        WHEN MonthlyIncome BETWEEN 50001 AND 60000 THEN '50001-60000'
        WHEN MonthlyIncome > 60000 THEN '60000 and above'
        ELSE 'Below 1000'
    END AS MonthlyIncomeSlab,
    COUNT(*) AS NumberOfEmployees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS NumberOfLeavingEmployees
FROM employeeretension
GROUP BY MonthlyIncomeSlab
ORDER BY MonthlyIncomeSlab;



#### KPI(4)#####
select department,avg(totalworkingyears) as Avg_workingyears from employeeretension group by department order by Avg_workingyears;


#### KPI(5)#####
select jobrole,avg(worklifebalance) as Avg_worklifebalance from employeeretension group by jobrole order by avg_worklifebalance;

#### KPI(6)#####
select YearsSinceLastPromotion,avg(case when attrition="yes" then 1 else 0 end)*100 as Attrition_Rate from employeeretension group by YearsSinceLastPromotion order by YearsSinceLastPromotion;