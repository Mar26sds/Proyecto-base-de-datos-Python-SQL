-- Borrar rental_clean

drop table rental_clean;

-- TABLA ACTOR
-- añadir una columna vacía y actualizarlo con los datos de un select
SET SQL_SAFE_UPDATES = 0;
alter table actor add name_1 varchar(100); 

update actor 
set name_1 = concat(first_name,' ',last_name);

alter table actor drop column first_name;
alter table actor drop column last_name;

select*
from actor;

alter table actor
add primary key(name_1);

DELETE ACTOR
FROM ACTOR
where name_1= ('SUSAN DAVIS');


-- TABLA OLD_HDD:
-- Crear columna name_ y que sea FK que viene desde actor
alter table old_HDD1 add name_ varchar(100); 
 

update old_HDD1
set name_ = concat(first_name,' ',last_name);

select*
from old_HDD1;

alter table old_HDD1 drop column first_name;
alter table old_HDD1 drop column last_name;


-- set foreign_key_checks=0;

alter table old_HDD1
add foreign key (name_) references actor(name_1);

select*
from old_HDD;


-- category
select*
from category;

alter table category
add primary key(category_id);

alter table old_HDD1
add foreign key (category_id) references category(category_id);

-- Film con title con old
select*
from film;

alter table film modify title varchar(100);
alter table old_HDD1 modify title varchar(100);

alter table film
add primary key(title);

alter table old_HDD1
add foreign key (title) references film(title);


-- Inventory. poner pk film_id y luego fk en film 

select* from inventory;
alter table inventory
add primary key(film_id);


-- Voy a borrar inventory y language ya que no las puedo relacionar.

drop table inventory;
drop table language;

