use gt081024;

create table emp_test(
	id int primary key auto_increment, 
    full_name varchar(255),
    email varchar(128),
    age int
);

insert into emp_test(full_name, email, age)
values ('boB broWn', 'bobby1@gmail.com', 23),
		('john smith  ', 'jsmith@yahoo.com', 43),
        (' DEN HAMPSON', 'denny5@gmail.com', 22),
        ('lola jamesoN', 'lolajamson@mail.ru', 40),
        ('mIkE lOgAn', 'logan_mike@hotmail.com', 20);
        
-- Задание 1:
-- Необходимо обновить данные в таблице emp_test, чтобы значения в столбце full_name соответствовали следующему формату:
  -- Формат: 'Имя Фамилия'
  -- Требования к оформлению:
  	-- Имя и фамилия должны начинаться с заглавной буквы.
  	-- Остальные буквы в имени и фамилии должны быть строчными.
  	-- Лишние пробелы в начале и конце строки должны быть удалены.
    
select upper(left(('boB broWn'), 1)); -- первая буква первого слова строки в верхнем регистре - 'B'!
select length(substring_index('boB broWn', ' ', 1)) - 1; -- кол/во символов в имени без первой буквы
select lower(substring(substring_index('boB broWn', ' ', 1), 2)); -- имя без первой буквы в нижнем регистре

select upper(left(substring_index('boB broWn', ' ', -1), 1)); -- первая буква второго слова строки в верхнем регистре 'B'!
select length(substring_index('boB broWn', ' ', -1)) - 1; -- кол/во символов в фамилии без первой буквы
select lower(substring(substring_index('boB broWn', ' ', -1), 2)); -- фамилия без первой буквы в нижнем регистре

-- строчки с 25 по 31, надо обновить через update? не понимаю, ка это всё уместить в update(

-- =============
update emp_test
set full_name = initcap(trim(full_name));
-- нашла простое решение))

-- locate, я не смогла записать сама, помог deepseek(

-- Задание 2: Необходимо извлечь и вывести доменное имя (часть адреса электронной почты после символа '@', но до '.') из столбца email в таблице emp_test.
select substring(email, locate('@', email) + 1, locate('.', email) - locate('@', email) - 1) as main
from emp_test;

-- Задание 3: Необходимо извлечь инициалы сотрудников из столбца full_name и вывести их в формате 'И.И.' (первые буквы имени и фамилии с точками).
select concat(left(full_name, 1), '. ', left(substring(full_name, locate(' ', full_name) + 1), 1), '.') as initials
from emp_test;

select * from emp_test;

