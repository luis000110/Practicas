//base de datos de una veterinaria hecha en Oracle 
create table clientes(id_clientes varchar2(100) not null,PRIMARY KEY(id_clientes));

create table empleados(id_emp varchar2(100),PRIMARY KEY(id_emp));

create table datos_clientes(id_datos varchar2(100),nombre varchar2(100),apellidos varchar2(100),
email varchar2(100),telefono number(10),id_clientes varchar2(100),PRIMARY KEY(id_datos));

create table datos_emp(clave_datos varchar2(100) not null,nombre varchar2(100),apellidos varchar2(100),email varchar2(100),
fecha_ingreso date,id_emp varchar2(100),PRIMARY KEY(clave_datos));

alter table datos_clientes add constraint fk_datos_clientes_id_clientes foreign key(id_clientes) references clientes (id_clientes);
alter table datos_emp add constraint fk_datos_emp_id_emp foreign key(id_emp) references empleados(id_emp);


create table dir_clientes(id_dir int not null,calle varchar2(100),colonia varchar2(100),localidad varchar2(100),
municipio varchar2(100),estado varchar2(100),codigo_postal number(5),id_clientes varchar2(100),PRIMARY KEY(id_dir));


create table dir_emp(clave_dir varchar2(100) not null,calle varchar2(100),colonia varchar2(100),localidad varchar2(100),municipio varchar2(100),
estado varchar2(100),codigo_postal number(5),id_emp varchar2(100),PRIMARY KEY(clave_dir));


alter table dir_clientes add constraint fk_dir_clientes_id_clientes foreign key(id_clientes) references clientes(id_clientes);
alter table dir_emp add constraint fk_dir_emp_id_emp foreign key(id_emp) references empleados(id_emp);


create table puesto_trabajo(id_puesto varchar2(100) not null,ocupacion varchar2(100),sueldo float,horas_semanales int,
id_empl varchar2(100),PRIMARY KEY(id_puesto));

alter table puesto_trabajo add constraint fk_puesto_trabajo_id_emp foreign key(id_emp) references empleados(id_emp);


create table animales(id_animales varchar2(100) not null,nombre varchar2(100),id_especies varchar2(100),
id_mascotas varchar2(100),PRIMARY KEY(id_animales));


create table especies(id_especies varchar2(100) not null,nombre varchar2(100),tamaño varchar2(30),peso varchar2(30),
altura varchar2(30),otras_caracteristicas varchar2(250),PRIMARY KEY(id_especies));


create table mascotas(id_mascotas varchar2(100) not null,nombre varchar2(100),informacion varchar2(250),id_clientes varchar2(100),PRIMARY KEY(id_mascotas));


alter table animales add constraint fk_animales_id_especies foreign key(id_especies) references especies(id_especies);
alter table animales add constraint fk_animales_id_mascotas foreign key(id_mascotas) references mascotas(id_mascotas);
alter table mascotas add constraint fk_mascotas_id_clientes foreign key(id_clientes) references clientes(id_clientes);

create table raza(id_raza varchar2(100) not null,nombre varchar2(100),descripcion varchar2(250),id_mascotas varchar2(100),
PRIMARY KEY(id_raza));

alter table raza add constraint fk_raza_id_mascotas foreign key(id_mascotas) references mascotas(id_mascotas);


create table tipo(id_tipo varchar2(100) not null,nombre varchar2(100),descripcion varchar2(250),tamaño varchar2(30),
peso varchar2(30),altura varchar2(30),complexion varchar2(30),id_raza varchar2(100),PRIMARY KEY(id_tipo));

alter table tipo add constraint fk_tipo_id_raza foreign key(id_raza) references raza(id_raza);


create table consultas(id_consultas varchar2(100)not null,descripcion varchar2(250),id_puesto varchar2(100),
id_animales varchar2(100),PRIMARY KEY(id_consultas));

alter table consultas add constraint fk_consultas_id_puesto foreign key(id_puesto) references puesto_trabajo(id_puesto);
alter table consultas add constraint fk_consultas_id_animales foreign key(id_animales) references animales(id_animales);


create table proveedores(id_prov varchar2(100) not null,razon_social varchar2(100),cantidad int,precio_compra float,
id_prod varchar2(100),PRIMARY KEY(id_prov));

create table tipo_prov(clave_prov varchar2(100) not null,tipo varchar2(100),informacion varchar2(250),
id_prov varchar2(100),PRIMARY KEY(clave_prov));


create table productos(id_prod varchar2(100)not null,nombre varchar2(100),stock int,id_puesto varchar2(100),
PRIMARY KEY(id_prod));


create table categoria(id_categ varchar2(100),nombre varchar2(100),descripcion varchar2(250),precio float,
stock int,id_prod varchar2(100),PRIMARY KEY(id_categ));

alter table proveedores add constraint fk_proveedores_id_prod foreign key(id_prod) references productos(id_prod);
alter table tipo_prov add constraint fk_tipo_prov_id_prov foreign key(id_prov) references proveedores(id_prov);
alter table productos add constraint fk_productos_id_puesto foreign key(id_puesto) references puesto_trabajo(id_puesto);
alter table categoria add constraint fk_categoria_id_prod foreign key(id_prod) references productos(id_prod);


create table facturas(id_facturas varchar2(100) not null,descripcion varchar2(250),id_clientes varchar2(100),
id_pago varchar2(100),PRIMARY KEY(id_facturas));


create table forma_pago(id_pago varchar2(100) not null,pago varchar2(50),descripcion varchar2(250),PRIMARY KEY(id_pago));

create table detalles(id_detalles varchar2(100) not null,cantidad int,precio float,id_facturas varchar2(100),
id_prod varchar2(100),PRIMARY KEY(id_detalles));

alter table facturas add constraint fk_facturas_id_clientes foreign key(id_clientes) references clientes(id_clientes);
alter table facturas add constraint fk_facturas_id_pago foreign key(id_pago) references forma_pago(id_pago);
alter table detalles add constraint fk_detalles_id_facturas foreign key(id_facturas) references facturas(id_facturas);
alter table detalles add constraint fk_detalles_id_prod foreign key(id_prod) references productos(id_prod);

create table veterinaria(clave_veterinaria varchar2(100) not null,id_clientes varchar2(100),id_animales varchar2(100),id_mascotas varchar2(100),
id_emp varchar2(100),id_facturas varchar2(100),id_consultas varchar2(100),id_prod varchar2(100),id_prov varchar2(100),
PRIMARY KEY(clave_veterinaria));

alter table veterinaria add constraint fk_veterinaria_id_clientes foreign key(id_clientes) references clientes(id_clientes);
alter table veterinaria add constraint fk_veterinaria_id_animales foreign key(id_animales) references animales(id_animales);
alter table veterinaria add constraint fk_veterinaria_id_mascotas foreign key(id_mascotas) references mascotas(id_mascotas);
alter table veterinaria add constraint fk_veterinaria_id_emp foreign key(id_emp) references empleados(id_emp);
alter table veterinaria add constraint fk_veterinaria_id_facturas foreign key(id_facturas) references facturas(id_facturas);
alter table veterinaria add constraint fk_veterinaria_id_consultas foreign key(id_consultas) references consultas(id_consultas);
alter table veterinaria add constraint fk_veterinaria_id_prod foreign key(id_prod) references productos(id_prod);
alter table veterinaria add constraint fk_veterinaria_id_prov foreign key(id_prov) references proveedores(id_prov);













