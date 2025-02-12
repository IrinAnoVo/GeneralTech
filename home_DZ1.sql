/*1. В базе данных homeworks создайте таблицу workers со следующими полями:
worker_id – целое число, первичный ключ, автоинкремент
fname – строка (не NULL)
last_name – строка (не NULL)
email – строка (не NULL)
phone – строка (не NULL)
*/
use homeworks;
create table workers (
worker_id int primary key auto_increment,
fname varchar(100) not null,
last_name varchar(100) not null,
email varchar(100) not null,
phone varchar(100) not null);
select * from workers;

-- 2. Ой, забыли про зарплату!
-- Добавьте поле salary с типом NUMERIC(9,2).
alter table workers
add column salary decimal(9,2);

-- 3. Ой-ой, нет, зарплата должна быть целым числом!
-- Измените тип salary на INTEGER.
alter table workers
modify column salary int not null;

-- 4. Как-то странно… fname?
-- Переименуйте поле fname в first_name.
alter table workers
rename column fname to first_name;

-- 5. Телефон нам не нужен!
-- Удалите поле phone. 
alter table workers
drop column phone;

-- 6. А где отдел?
-- Добавьте поле department (строка, NOT NULL), и пусть оно будет сразу после last_name.
alter table workers
add column department varchar(100) not null after last_name;

-- 7. Заполняем таблицу
-- Добавьте 7 сотрудников с произвольными данными (имя, фамилия, отдел, email и зарплата).
insert into workers(first_name, last_name, department, email, salary) 
values("Mike", "Wazowski", "Pixar_Animation", "KRUGLIK", 4000);
insert into workers(first_name, last_name, department, email, salary) 
values("James", "Sullivan", "Pixar_Animation", "MONSTER", 4250);
insert into workers(first_name, last_name, department, email, salary) 
values("Boo", "Girlie", "Pixar_Animation", "BABY", 4050);
insert into workers(first_name, last_name, department, email, salary) 
values("Coraline", "Jones", "Laika_Entertainment", "PlYUSHCH", 4300);
insert into workers(first_name, last_name, department, email, salary) 
values("Cat", "Mister", "Laika_Entertainment", "KOT", 4200); 
insert into workers(first_name, last_name, department, email, salary) 
values("Bumblebee", "Autobot", "Hasbro", "MALISH", 4200);
insert into workers(first_name, last_name, department, email, salary) 
values("Optimus", "Prime", "Hasbro", "LIDER", 4350);

select * from workers;