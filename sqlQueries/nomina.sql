select distinct e.*
from empleado e
inner join recargo r 
on e.id = r.id_empleado
where r.id_periodo = 1;

select *
from descuento d,
     periodo_pago p
where (d.id_periodo = p.id)
and d.concepto = 'INTERESES'
and p.fecha_inicio between '01/01/2020' and '14/02/2020';

select sum(d.monto)
from descuento d,
     periodo_pago p
where (d.id_periodo = p.id) 
and d.concepto = 'CESANTIAS'
and d.id_empleado =1
and d.id_periodo =39
and extract(year from p.fecha_inicio) = 2010;

select count(*) 
from recargo r,
     periodo_pago p
where (r.id_periodo =p.id)
and r.concepto = 'DIURNO'
and r.id_empleado =1
and r.id_periodo =39
and extract(year from p.fecha_inicio) = 2010;

select * from periodo_pago p
where extract(year from p.fecha_inicio) = 2010 ;

delete from devengado where id_periodo =1;
delete from descuento where id_periodo =1;
commit;

--Test Data
insert into periodo_pago(id, fecha_inicio , fecha_fin, estado_pago, orden) 
values(1, '2020-01-01', '2020-01-20', 'PENDIENTE', 1);

insert into empleado (id, nombres ,apellidos , riesgo_laboral, salario)
values(1,'Jonathan', 'Perez', 'RIESGO_LABORAL_NIVEL_1', 1000000);

insert into recargo (id_periodo, id_empleado, horas, concepto, orden)
values (1, 1, 80, 'DIURNO', 1);

insert into recargo (id_periodo, id_empleado, horas, concepto, orden)
values (1, 1, 15, 'FESTIVO_EXTRA_DIURNO', 7);
commit;

select * from empleado e;

