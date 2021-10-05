select dept, employee, salary 
from (
    select department.name as Dept, employee.name as Employee, salary, rank()
        over (partition by departmentid order by salary desc)
    from employee join department on employee.departmentid=department.id) as foo
    where rank <= 3;
