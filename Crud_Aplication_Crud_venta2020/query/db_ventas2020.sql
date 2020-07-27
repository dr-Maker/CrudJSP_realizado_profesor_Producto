
-- create database db_crud_venta2020;

use db_crud_venta2020;

drop table producto;
drop table estado;
drop table familiapro;

create table estado(
estadoid int,
estadodesc varchar(20),
primary key(estadoid));

create table familiapro(
familiaid int,
familiadesc varchar(100),
primary key(familiaid));

create table producto(
productoid int identity(1001,1),
nombre varchar(100),
precio int,
estadoid int,
familiaid int,
primary key(productoid),
foreign key(estadoid) references estado(estadoid),
foreign key(familiaid) references familiapro(familiaid)
);

insert into estado values(1, 'Activo');
insert into estado values(2, 'No activo');

insert into familiapro values(1, 'Computacion');
insert into familiapro values(2, 'Libreria');
insert into familiapro values(3, 'Bolsos/mochila');
insert into familiapro values(4, 'Audio y sonido');

insert into producto values ('SSD 250GB', 30990, 1, 1);
insert into producto values ('SSD 500GB', 54990, 1, 1);
insert into producto values ('Monitor 19p', 72590, 1, 1);
insert into producto values ('Monitor 21p', 89990, 1, 1);

insert into producto values ('Resma F/carta', 4690, 1, 2);
insert into producto values ('Sobre carta', 390, 1, 2);

insert into producto values ('Mochila NTB 14p', 29980, 1, 3);
insert into producto values ('Morral cuero', 51490, 1, 3);

insert into producto values ('Audífonos DJ SRH750', 82390, 1, 4);

select p.*, e.estadodesc, f.familiadesc
from producto p 
join estado e on p.estadoid = e.estadoid 
join familiapro f on p.familiaid = f.familiaid 


select * from producto
update producto set nombre = 'Vaio Pc', precio = 190000 where productoid = 1010
