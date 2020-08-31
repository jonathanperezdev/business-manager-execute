INSERT INTO UBICACION
(id,
nombre)
VALUES
(4,
'Oficina Heroes');

insert into empleado (id, nombres, apellidos, id_ubicacion)
values(1, 'Jhon', 'Perez', 4);

insert into festivo (festivo)
values('2020-01-06');
commit;

select * from Festivo f where EXTRACT(year from f.festivo) IN (2020) Order by f.festivo;

delete from recargo where id_dia in (select id from dia_pago where id_semana in (select id_semana from SEMANA_pago where id_periodo = 41));
delete from dia_pago where id_semana in (select id_semana from SEMANA_pago where id_periodo = 41);
delete from SEMANA_pago where id_periodo = 41;
delete from periodo_pago where id = 41;
commit;

select * from recargo;
select * from dia_pago;
select * from SEMANA_pago;
select * from periodo_pago;


--Years Hollidays
select distinct extract(year from festivo) from Festivo f Order by extract(year from f.festivo);

select * from ubicacion u;
select * from horario_ubicacion hu ;

select * from ubicacion u where u.id not in (select distinct hu.id_ubicacion from horario_ubicacion hu)
