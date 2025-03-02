-- Использовать таблицу employees.
-- https://github.com/annykh/GT081024-m/blob/main/employees.sql
 use gt081024;
select * from employees;
 
-- 1. Повысить зарплаты для отдела Sales на 20%, для Finance 15%, для Shipping 10%, для Marketing 25%, 
-- для Human Resources 20% и для IT 35%. Записать данные в новое поле new_salary. Поле создавать не нужно, используем AS. 
select 
    employee_id,
    department,
    salary,
    case
        when department = 'Sales' then salary * 1.20
        when department = 'Finance' then salary * 1.15
        when department = 'Shipping' then salary * 1.10
        when department = 'Marketing' then salary * 1.25
        when department = 'Human Resources' then salary * 1.20
        when department = 'IT' then salary * 1.35
        else salary
    end as new_salary
from employees;

-- 2. Создать поле new_salary типа numeric(7, 2)
alter table employees
add column new_salary_two dec(7, 2);

-- 3. Заполнить поле: повысить зарплаты для отдела Sales на 20%, для Finance 15%, для Shipping 10%, 
-- для Marketing 25%, для Human Resources 20% и для IT 35%. 
update employees
set new_salary_two = case
	when department = 'Sales' then salary * 1.20
        when department = 'Finance' then salary * 1.15
        when department = 'Shipping' then salary * 1.10
        when department = 'Marketing' then salary * 1.25
        when department = 'Human Resources' then salary * 1.20
        when department = 'IT' then salary * 1.35
        else salary
	end;

select * from employees;

-- 4. Вывести из таблицы employees first_name как user_name, last_name как surname и новое поле full_name, 
-- которое состоит из имен и фамилий сотрудников.
select 
    first_name as user_name,
    last_name as surname,
    concat(first_name, ' ', last_name) as full_name
from employees;

-- 5. Вывести новое поле commission, которое будет null, если зарплата сотрудника меньше 3000, будет 10, 
-- если зарплата меньше 6000, будет 15, если зарплата меньше 9000, и будет 20, если зарплата больше/равно 9000.
select employee_id, first_name, last_name, salary, case
        when salary < 3000 then null
        when salary < 6000 then 10
        when salary < 9000 then 15
        when salary >= 9000 then 20
    end as commission_two
from employees;

-- 6. Создать новое поле commission и соответственно заполнить.
alter table employees
add column commission_two decimal(7, 2);

update employees
set commission_two = case
	when salary < 3000 then null
        when salary < 6000 then 10
        when salary < 9000 then 15
        when salary >= 9000 then 20
    end;

select * from employees;

-- 7. Создать поле final_salary и заполнить формулой salary + salary * commission / 100. Проверить commission на null, 
-- так чтобы в случае неопределенности final_salary принимал значение salary. 
alter table employees
add column final_salary_two int not null;

update employees
set final_salary_two = case
		when commission is null then final_salary
		else (final_salary + final_salary * commission / 100)
end;

select * from employees;

-- 8. Вывести поле email в нижнем регистре.
select lower(email)
from employees;

-- 9. Создать новое поле chk_email типа varchar(128).
alter table employees
add column chk_email varchar(128);

-- 10. Заполнить поле chk_email. Если длина email меньше 3, значением chk_email будет 'Введите больше символов', 
-- если длина email больше/равно 3 и меньше 7,  значением chk_email будет 'Кол/во символов совпадает', если длина 
-- email больше/равно 7,  значением chk_email будет 'Введите меньше символов'.
update employees
set chk_email = 
    case
        when LENGTH(email) < 3 then 'Введите больше символов'
        when LENGTH(email) >= 3 and LENGTH(email) < 7 then 'Кол/во символов совпадает'
        when LENGTH(email) >= 7 then 'Введите меньше символов'
    end;
    
select * from employees;    
