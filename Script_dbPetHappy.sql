USE master;
GO

DROP DATABASE IF EXISTS dbPETHAPPY;
GO

CREATE DATABASE dbPETHAPPY;
GO

USE dbPETHAPPY;
GO

-- TABLA CLIENTE
CREATE TABLE CLIENTE (
    IDCLI int IDENTITY(1,1),
    DNICLI char(8)  ,
    NOMCLI varchar(50)  ,
    APECLI varchar(50)  ,
    DIRCLI varchar(80)  ,
    TELFCLI char(9)  ,
    ESTCLI varchar(1)  ,
    CUT_CODCUT varchar(5)
    CONSTRAINT CLIENTE_pk PRIMARY KEY (IDCLI)
);
GO

-- TABLA: PRODUCTO
CREATE TABLE PRODUCTO (
    CODPRO char(8),
    NOMPRO varchar(80),
    MARCPRO varchar(80) ,
    PREPRO decimal(8,3) ,
    DESPRO varchar(300) ,
    TIPPRO varchar(40) ,
    TIPMASPRO varchar(40) ,
    FECHCADPRO date,
    CONSTRAINT PRODUCTO_pk PRIMARY KEY (CODPRO)
);
GO


-- TABLA: VENTA
CREATE TABLE VENTA (
    IDVENT varchar(5)  ,
    TIPPAGVENT varchar(1)  ,
    CLIENTE_IDCLI int ,
    CONSTRAINT VENTA_pk PRIMARY KEY (IDVENT)
);
GO


-- TABLA: VENTADETALLE
CREATE TABLE VENTADETALLE (
    IDVENTDET char(5)  ,
    CANTVENTDET int ,
    PRETOTVENTDET decimal(8,3) ,
    FECHVENTDET DATETIME DEFAULT GETDATE() NOT NULL,
    PRODUCTO_CODPRO char(8) ,
    VENTA_IDVENT varchar(5)  ,
    CONSTRAINT VENTADETALLE_pk PRIMARY KEY (IDVENTDET)
);
GO

-- TABLA: CUT 
CREATE TABLE CUT (
    CODCUT varchar(5),
    COMUCUT varchar(80),
    PROVCUT varchar(80) ,
    REGCUT varchar(80) ,
    CONSTRAINT CUT_pk PRIMARY KEY (CODCUT)
);

-- RELACIONES

-- RELACION: CLIENTE_CUT (TABLA: CLIENTE)
ALTER TABLE CLIENTE ADD CONSTRAINT CLIENTE_CUT
    FOREIGN KEY (CUT_CODCUT)
    REFERENCES CUT (CODCUT)  
;

-- RELACION: VENTA_DETALLE_PRODUCTO (TABLA: VENTADETALLE)
ALTER TABLE VENTADETALLE ADD CONSTRAINT VENTA_DETALLE_PRODUCTO
    FOREIGN KEY (PRODUCTO_CODPRO)
    REFERENCES PRODUCTO (CODPRO)  
;
-- RELACION: VENTA_CLIENTE (TABLA: VENTA)
ALTER TABLE VENTA ADD CONSTRAINT VENTA_CLIENTE
    FOREIGN KEY (CLIENTE_IDCLI)
    REFERENCES CLIENTE (IDCLI)  
;



-- RELACION: VENTA_DETALLE_VENTA (TABLA: VENTADETALLE)
ALTER TABLE VENTADETALLE ADD CONSTRAINT VENTADETALLE_VENTA
    FOREIGN KEY (VENTA_IDVENT)
    REFERENCES VENTA (IDVENT)  
;



--INSERTAR DATOS

-- INSERTAR DATOS EN LA TABLA CUT ('','','','')
INSERT INTO CUT
           (CODCUT
           ,COMUCUT
           ,PROVCUT
           ,REGCUT)
     VALUES
           ('16305','San Nicolás','Punilla','Ñuble'),
		   ('16304','San Fabián','Punilla','Ñuble'),
		   ('16303','Ñiquén','Punilla','Ñuble'),
		   ('16302','Coihueco','Punilla','Ñuble'),
		   ('16301','San Carlos','Punilla','Ñuble'),
		   ('16207','Treguaco','Itata','Ñuble'),
		   ('16206','Ránquil','Itata','Ñuble'),
		   ('16205','Portezuelo','Itata','Ñuble'),
		   ('16204','Ninhue','Itata','Ñuble'),
		   ('16203','Coelemu','Itata','Ñuble'),
		   ('16202','Quirihue','Itata','Ñuble'),
		   ('16201','Yungay','Itata','Ñuble')
		   ;
GO






-- INSERTAR DATOS EN LA TABLA PRODUCTO ('','','','','','','','')
INSERT INTO PRODUCTO
           (CODPRO
           ,NOMPRO
           ,MARCPRO
           ,PREPRO
           ,DESPRO
           ,TIPPRO
           ,TIPMASPRO
           ,FECHCADPRO)
     VALUES
	 ('36430016','PACK DIECIOCHERO PERRO','BRIT CARE','65.990','PACK DIECIOCHERO PERRO PUPPY ES EL REGALO PERFECTO EN ESTAS FECHAS PATRIAS.','PACK','PERRO','02/02/2023'),
	 ('34712820','CANNAVET RELAX','TERRAVET','14.980','CANNAVET RELAX es una formulación en gotas que contiene aceite de semilla de cannabis, Lavanda y Manzanilla, para afecciones del sistema nervioso, para gatos, en formato de 30 ml.','SPRAY','PERROS Y GATOS','03/02/2023'),
	 ('31330476','PACK DIECIOCHERO PERRO PUPPY','BRIT CARE','65.990','NUESTRO PACK DIECIOCHERO PERRO PUPPY ES EL REGALO PERFECTO PARA QUE TU PELUDIT@ CELEBRE EN ESTAS FECHAS PATRIAS.','PACK','PERRO','04/02/2023'),
	 ('33313076','NATURALISTIC DUCK STRIPS 100 GR','NATURALISTIC','3.050','Formulados con pechuga de pato, proteína indicada para perros','ALIMENTO','PERRO','05/02/2023'),
	 ('52605172','PACK PERRO PUPPY','ROYAL CANIN','34.990','PACK PERRO PUPPY','PACK','PERRO','06/02/2023'),
	 ('38711044','ORAL PET','TERRAVET','10.980','ORAL PET es un elixir de higiene dental 100% natural para perros y gatos','SALUD','PERROS Y GATOS','04/02/2023'),
	 ('34712024','MAMISTOP PERRO','DRAG PHARMA','11.750','Mami Stop Perro es una fuente de alimento para cachorros huerfános, rechazados o lactantes que necesitan sustituto lácteo.','ALIMENTO','PERRO','05/02/2023'),
	 ('34713041','BRIT CARE ADULT LARGE BREED SALMON & POTATO 12 KG','BRIT CARE','61.990','Fórmula libre de granos para perros adultos (2 a 7 años)','ALIMENTO','PERRO','07/02/2023'),
	 ('14143066','CATIT RASCADOR BANCA ROJA','HAGEN | SKU','22.990','La combinación de formas contemporáeas con motivos de diseño, diferencia estas tablas de rascar de las tablas convencionales.','RASCADORES','GATO','09/02/2023'),
	 ('34712798','ZEEDOG ZEE.MAT CORAL','zeedog','12.860','El Zee.Mat es una nueva categoría de Zee.Dog. Hecho de caucho natural no tóxico, el tapete tiene una cavidad de barrera para hormigas alrededor que protege la comida de su perro.','BEBEDERO','PERRO','07/02/2023');
GO

-- INSERTAR DATOS EN LA TABLA CLIENTE ('','','','','','')
INSERT INTO CLIENTE
           (DNICLI
           ,NOMCLI
           ,APECLI
           ,DIRCLI
           ,TELFCLI
           ,ESTCLI
		   ,CUT_CODCUT)
     VALUES
	 ('96585215','Pepe','Pizarro Martinez','Calle Esmeralda','965874412','A','16304'),
	  ('96214142','Henar','Herrera Herraiz','Pasaje Mar Mediterráneo','915864146','A','16305'),
	  ('45688741','Crystal','Hernandez Larson','Barrio Paipote','995844100','A','16302'),
	  ('12358966','Steven','Moreno Long','San Javier','905844194','A','16301'),
	  ('22541668','Scott Max','Smith Gutierrez','Región Metropolitana de Santiago','965844144','A','16207'),
	  ('77754126','Hena Sara','Larson Hernandez','Calle Nuestra Señora De Los Angeles','915844111','A','16304'),
	  ('58996587','Darren','Walsh Bartlett','Avenida Libertad','984512354','A','16206'),
	  ('12474135','Zoe','Perdomo Herrera','Calle Esmeralda','947142587','A','16205'),
	  ('88521456','Elizabeth','Freeman Long','Barrio Paipote','996685885','A','16301'),
	  ('12354774','Dawn','Koch Herraiz','Avenida Vitacura','999845121','A','16302'),
	  ('98774521','Elvis','Nieto Lozano','San Javier','946311174','I','16305')
;
GO

-- INSERTAR DATOS EN EN LA TABLA VENTA ('','','')
INSERT INTO VENTA
           (IDVENT
           ,TIPPAGVENT
           ,CLIENTE_IDCLI)
     VALUES
	 ('F0001','W','1'),
	 ('F0002','W','2'),
	 ('F0003','M','3'),
	 ('F0004','M','4'),
	 ('F0005','W','5'),
	 ('F0006','T','10'),
	 ('F0007','T','7'),
	 ('F0008','T','8'),
	 ('F0009','T','1'),
	 ('F0010','W','9');
	 
GO

-- INSERTAR DATOS EN LA TABLA VENTA_DETALLE ('','','','','','')
INSERT INTO VENTADETALLE
           (IDVENTDET
           ,CANTVENTDET
           ,PRETOTVENTDET
           ,PRODUCTO_CODPRO
           ,VENTA_IDVENT)
     VALUES
	 ('VT001','1','65.990','14143066','F0001'),
	 ('VT002','1','12.860','31330476','F0002'),
	 ('VT003','1','61.990','33313076','F0003'),
	 ('VT004','1','11.750','34712024','F0004'),
	 ('VT005','1','65.990','34712798','F0005'),
	 ('VT006','1','10.980','34712820','F0006'),
	 ('VT007','1','3.050','34713041','F0007'),
	 ('VT008','1','22.990','36430016','F0008'),
	 ('VT009','1','61.990','38711044','F0009'),
	 ('VT010','1','65.990','52605172','F0010')
	 ;
GO

--Descomentar para listar los datos de la tabla correspondiente
/*		
SELECT * FROM PRODUCTO;
GO
select * from VENTADETALLE;
go
select * from venta;
go
select * from CLIENTE;
go
*/

--sp_help

