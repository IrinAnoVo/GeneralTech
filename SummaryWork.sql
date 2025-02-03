create database company_db;

use company_db;

create table employees(
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL,
	position VARCHAR(50) NOT NULL,
	salary DECIMAL(10,2) CHECK(salary > 0),
	hire_date VARCHAR(10) NOT NULL);
    
alter table employees
add column email varchar(100) not null;

alter table employees
drop column hire_date;

alter table employees
rename column position to job_title;

alter table employees
modify column salary INT not null;

alter table employees
add column department varchar(100) not null after job_title;

insert into employees(name, job_title, department, salary, email)
value("Анна Иванова", "Менеджер", "Отдел продаж", 60000, "anna.ivanova@example.ru");
insert into employees(name, job_title, department, salary, email)
value("Иван Смирнов", "Разработчик", "IT", 75000, "ivan.smirnov@example.com");
insert into employees(name, job_title, department, salary, email)
value("Мария Петрова", "Бухгалтер", "Финансы", 50000, "maria.petrova@example.com");
insert into employees(name, job_title, department, salary, email)
value("Петр Васильев", "Разработчик", "IT", 80000, "petr.vasiliev@example.ru");
insert into employees(name, job_title, department, salary, email)
value("Екатерина Соколова", "HR-специалист", "HR", 55000, "ekaterina.sokolova@example.com");
insert into employees(name, job_title, department, salary, email)
value("Алексей Кузнецов", "Менеджер по продажам", "Отдел продаж", 65000, "alexey.kuznetsov@example.ge");
insert into employees(name, job_title, department, salary, email)
value("Ольга Морозова", "Аналитик", "Финансы", 70000, "olga.morozova@example.com");
 select * from employees;
-- 9. Вывести всех сотрудников, работающих в отделе "IT" или "Финансы"
select*
from employees
where department in ("IT","Финансы");
-- 10. Вывести всех сотрудников, у которых фамилия начинается с "С"
select*
from employees
where name like '% С%';
-- 11. Вывести всех сотрудников, у которых email оканчивается на "@example.com"
select*
from employees
where email like '%@example.com';
-- 12. Вывести всех сотрудников, у которых зарплата от 60000 до 75000
select*
from employees
where salary between 60000 and 75000;
-- 13. Вывести всех сотрудников, у которых должность содержит слово "Менеджер"
select*
from employees
where job_title like '%Менеджер%';
-- 14. Вывести всех сотрудников, кроме тех, кто работает в отделе "HR"
select*
from employees
where department not in ("HR");
-- 15. Вывести всех сотрудников, у которых зарплата больше 70000 или они работают в отделе "Финансы"
select*
from employees
where salary > 70000 or department in ("Финансы");
-- 16. Вывести всех сотрудников, у которых email содержит ".ru" или ".ge"
select*
from employees
where email like "%.ru%" or email like "%.ge%";
-- 17. Вывести всех сотрудников, у которых фамилия содержит "ов" или "ев"
select*
from employees
where name like "%ов%" or name like "%ев%";
-- 18. Вывести всех сотрудников, у которых зарплата меньше 55000 и они не работают в IT-отделе
select*
from employees
where salary < 55000 or department not in ("IT");
-- 19. Вывести всех сотрудников в алфавитном порядке по имени
SELECT*
from employees 
order by name ASC;
-- 20. Вывести всех сотрудников в порядке убывания зарплаты
select* 
from employees
order by salary desc; 
-- 21. Вывести всех сотрудников, работающих в отделе "IT" или "Финансы", отсортировав их по зарплате (по убыванию)
select* 
from employees
where department in ("IT","Финансы") order by salary desc;
-- 22. Вывести всех сотрудников, у которых зарплата выше 60000, отсортировав по фамилии в алфавитном порядке
select* 
from employees
where salary > 60000 order by name ASC;
-- 23. Вывести все уникальные отделы, в которых работают сотрудники
select distinct department
from employees;
-- 24. Вывести все уникальные должности сотрудников
select distinct job_title
from employees;
-- 25. Удалить таблицу employees
/*drop table ... */ 