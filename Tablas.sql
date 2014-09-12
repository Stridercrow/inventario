* Creación de tablas sin llaves primarias / foráneas*

create table Equipo (
Serial_n varchar2(15),
ID_corp varchar2(10),
Usr_act varchar2(45),
ID_usr varchar2 (15),
Usr_ant1 varchar2(40),
Usr_ant2 varchar2(40),
Usr_ant3 varchar2(40),
Fec_camb date,
Observ varchar2(100),
ID_ubi smallint,
ID_tip smallint,
ID_ref smallint 
);

create table Ubicacion (
ID_ubi smallint,
Nombre varchar2(20),
Direccion varchar2(120)
);

create table Tipo (
ID_tip smallint,
Marca varchar2(10),
Modelo varchar2(25),
Part_num varchar2(15),
Etiqueta varchar2(11)
);

create table Referencia (
ID_ref smallint,
Nombre varchar2(20),
Ref varchar2(30)
);

'Llaves primarias'

alter table Equipo add primary key (Serial_n);
alter table Ubicacion add primary key (ID_ubi);
alter table Tipo add primary key (ID_tip);
alter table Referencia add primary key (ID_ref);

'Llaves foraneas'

alter table Equipo add constraint Equipo_ubi foreign key (ID_ubi) references Ubicacion(ID_ubi);
alter table Equipo add constraint Equipo_tip foreign key (ID_tip) references Tipo(ID_tip);
alter table Equipo add constraint Equipo_ref foreign key (ID_ref) references Referencia(ID_ref);

'Búsqueda por id corporativo o serial'

select t.marca, t.Modelo, e.Serial_n, e.ID_corp, e.Usr_act, e.Fec_camb, u.Nombre, r.nombre from Equipo e, Tipo t, Ubicacion u,
Referencia r
where e.ID_corp like '%'<texto>'%' or
e.Serial_n like '%'<texto>'%'
e.ID_tip = t.ID_tip and
e.ID_ubi = u.ID_ubi and
e.ID_ref = r.ID_ref

'Búsqueda por ubicación'

select t.marca, t.Modelo, e.Serial_n, e.ID_corp, e.Usr_act, e.Fec_camb, r.nombre from Equipo e, Tipo t, Ubicacion u,
Referencia r
where u.nombre = <texto> and
e.ID_tip = t.ID_tip and
e.ID_ubi = u.ID_ubi and
e.ID_ref = r.ID_ref

'Búsqueda por usuario'

select t.marca, t.Modelo, e.Serial_n, e.ID_corp, e.Usr_act, e.Fec_camb, u.Nombre, r.nombre from Equipo e, Tipo t, Ubicacion u,
Referencia r
where e.usr_act like '%'<texto>'%' and
e.ID_tip = t.ID_tip and
e.ID_ubi = u.ID_ubi and
e.ID_ref = r.ID_ref

'Agregar ubicaciones desde archivo csv'
sqlldr inv_adm@XE control='C:\Users\Omarcin\Dropbox\Inventario - Iberdrola\Base de datos\carga_ubicaciones.ctl' skip=1
sqlldr inv_adm@XE control='C:\Users\Omarcin\Dropbox\Inventario - Iberdrola\Base de datos\carga_tipo.ctl' skip=1
sqlldr inv_adm@XE control='C:\Users\Omarcin\Dropbox\Inventario - Iberdrola\Base de datos\carga_referencias.ctl' skip=1
sqlldr inv_adm@XE control='C:\Users\Omarcin\Dropbox\Inventario - Iberdrola\Base de datos\carga_equipo.ctl' skip=1