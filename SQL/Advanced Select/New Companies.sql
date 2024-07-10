select distinct t1.company_code,
                t1.founder,
                t2.total_lead_managers,
                t3.total_senior_managers,
                t4.total_managers,
                t5.total_employees
from Company as t1
left join
  (select company_code,
          count(distinct lead_manager_code) as total_lead_managers
   from lead_manager
   group by 1) as t2 on t1.company_code = t2.company_code
left join
  (select company_code,
          count(distinct senior_manager_code) as total_senior_managers 
   -- lead_manager_code,
   from senior_manager
   group by 1) as t3 on t1.company_code = t3.company_code
left join
  (select company_code,
          count(distinct manager_code) as total_managers 
   -- senior_manager_code,
   -- lead_manager_code,
   from manager
   group by 1) as t4 on t1.company_code = t4.company_code
left join
  (select company_code,
          count(distinct employee_code) as total_employees 
   -- manager_code,
   -- senior_manager_code,
   -- lead_manager_code,
   from employee
   group by 1) as t5 on t1.company_code = t5.company_code
order by 1 asc;
