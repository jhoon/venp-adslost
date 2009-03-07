-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.45-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO,ANSI_QUOTES,MYSQL323' */;


--
-- Create schema votacion
--

CREATE DATABASE IF NOT EXISTS votacion;
USE votacion;

--
-- Definition of table "candidato"
--

DROP TABLE IF EXISTS "candidato";
CREATE TABLE "candidato" (
  "id" int(10) unsigned NOT NULL,
  "nombre" varchar(30) NOT NULL,
  "paterno" varchar(30) NOT NULL,
  "materno" varchar(30) NOT NULL,
  "dni" char(8) NOT NULL,
  "foto" varchar(36) NOT NULL,
  "estado" char(1) NOT NULL,
  PRIMARY KEY  ("id")
) TYPE=InnoDB; 

--
-- Dumping data for table "candidato"
--

/*!40000 ALTER TABLE "candidato" DISABLE KEYS */;
/*!40000 ALTER TABLE "candidato" ENABLE KEYS */;


--
-- Definition of table "candidato_partido_politico"
--

DROP TABLE IF EXISTS "candidato_partido_politico";
CREATE TABLE "candidato_partido_politico" (
  "id" int(10) unsigned NOT NULL,
  "Partido_Politico_id" int(10) unsigned NOT NULL,
  "Candidato_id" int(10) unsigned NOT NULL,
  "fecha_creacion" datetime NOT NULL,
  "fecha_modificacion" datetime NOT NULL,
  "estado" char(1) NOT NULL,
  PRIMARY KEY  ("id"),
  KEY "fk_Candidato" ("Candidato_id"),
  KEY "fk_Partido_Politico" ("Partido_Politico_id"),
  CONSTRAINT "candidato_partido_politico_ibfk_1" FOREIGN KEY ("Candidato_id") REFERENCES "candidato" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "candidato_partido_politico_ibfk_2" FOREIGN KEY ("Partido_Politico_id") REFERENCES "partido_politico" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
) TYPE=InnoDB;

--
-- Dumping data for table "candidato_partido_politico"
--

/*!40000 ALTER TABLE "candidato_partido_politico" DISABLE KEYS */;
/*!40000 ALTER TABLE "candidato_partido_politico" ENABLE KEYS */;


--
-- Definition of table "cedula"
--

DROP TABLE IF EXISTS "cedula";
CREATE TABLE "cedula" (
  "id" int(10) unsigned NOT NULL auto_increment,
  "Proceso_Electoral_id" int(10) unsigned NOT NULL,
  "tipo" varchar(50) NOT NULL,
  "estado" char(1) NOT NULL,
  "fecha_creacion" datetime NOT NULL,
  "fecha_modificacion" datetime NOT NULL,
  PRIMARY KEY  ("id"),
  KEY "fk_Proceso_Electoral" ("Proceso_Electoral_id"),
  CONSTRAINT "cedula_ibfk_1" FOREIGN KEY ("Proceso_Electoral_id") REFERENCES "proceso_electoral" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
) TYPE=InnoDB;

--
-- Dumping data for table "cedula"
--

/*!40000 ALTER TABLE "cedula" DISABLE KEYS */;
/*!40000 ALTER TABLE "cedula" ENABLE KEYS */;


--
-- Definition of table "centro_votacion"
--

DROP TABLE IF EXISTS "centro_votacion";
CREATE TABLE "centro_votacion" (
  "id" int(10) unsigned NOT NULL auto_increment,
  "Pais_id" int(10) unsigned NOT NULL,
  "Zona_Horaria_id" int(10) unsigned NOT NULL,
  "codigo_postal" varchar(10) NOT NULL,
  "nombre" varchar(50) NOT NULL,
  "region" varchar(50) NOT NULL,
  "direccion" varchar(100) NOT NULL,
  "estado" char(1) NOT NULL,
  PRIMARY KEY  ("id"),
  KEY "fk_Centro_Votacion" ("Zona_Horaria_id"),
  KEY "Centro_Votacion_FKIndex2" ("Pais_id"),
  CONSTRAINT "centro_votacion_ibfk_1" FOREIGN KEY ("Zona_Horaria_id") REFERENCES "zona_horaria" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "centro_votacion_ibfk_2" FOREIGN KEY ("Pais_id") REFERENCES "pais" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
) TYPE=InnoDB;

--
-- Dumping data for table "centro_votacion"
--

/*!40000 ALTER TABLE "centro_votacion" DISABLE KEYS */;
/*!40000 ALTER TABLE "centro_votacion" ENABLE KEYS */;


--
-- Definition of table "diccionario_log"
--

DROP TABLE IF EXISTS "diccionario_log";
CREATE TABLE "diccionario_log" (
  "id" int(10) unsigned NOT NULL auto_increment,
  "descripcion" varchar(100) NOT NULL,
  PRIMARY KEY  ("id")
) TYPE=InnoDB;

--
-- Dumping data for table "diccionario_log"
--

/*!40000 ALTER TABLE "diccionario_log" DISABLE KEYS */;
/*!40000 ALTER TABLE "diccionario_log" ENABLE KEYS */;


--
-- Definition of table "elector"
--

DROP TABLE IF EXISTS "elector";
CREATE TABLE "elector" (
  "id" bigint(20) NOT NULL auto_increment,
  "Locacion_id" int(10) unsigned NOT NULL,
  "nombre" varchar(20) NOT NULL,
  "paterno" varchar(20) NOT NULL,
  "materno" varchar(20) NOT NULL,
  "dni" char(8) NOT NULL,
  "email" varchar(50) NOT NULL,
  "estado" char(1) NOT NULL,
  PRIMARY KEY  ("id"),
  KEY "fk_Locacion" ("Locacion_id"),
  CONSTRAINT "elector_ibfk_1" FOREIGN KEY ("Locacion_id") REFERENCES "locacion" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
) TYPE=InnoDB;

--
-- Dumping data for table "elector"
--

/*!40000 ALTER TABLE "elector" DISABLE KEYS */;
/*!40000 ALTER TABLE "elector" ENABLE KEYS */;


--
-- Definition of table "escrutinio"
--

DROP TABLE IF EXISTS "escrutinio";
CREATE TABLE "escrutinio" (
  "id" int(10) unsigned NOT NULL auto_increment,
  "Locacion_id" int(10) unsigned NOT NULL,
  "Opcion_id" int(10) unsigned NOT NULL,
  "numero" int(10) unsigned NOT NULL,
  PRIMARY KEY  ("id"),
  KEY "Escrutinio_FKIndex2" ("Locacion_id"),
  CONSTRAINT "escrutinio_ibfk_2" FOREIGN KEY ("Locacion_id") REFERENCES "locacion" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
) TYPE=InnoDB;

--
-- Dumping data for table "escrutinio"
--

/*!40000 ALTER TABLE "escrutinio" DISABLE KEYS */;
/*!40000 ALTER TABLE "escrutinio" ENABLE KEYS */;


--
-- Definition of table "locacion"
--

DROP TABLE IF EXISTS "locacion";
CREATE TABLE "locacion" (
  "id" int(10) unsigned NOT NULL auto_increment,
  "Proceso_Electoral_id" int(10) unsigned NOT NULL,
  "Centro_Votacion_id" int(10) unsigned NOT NULL,
  "puesta_cero" char(1) NOT NULL default 'N',
  "estado" char(1) NOT NULL default 'N',
  "fecha_puesta_cero" datetime default NULL,
  "fecha_cierre" datetime default NULL,
  PRIMARY KEY  ("id"),
  UNIQUE KEY "idx_locacion" ("Proceso_Electoral_id","Centro_Votacion_id"),
  KEY "fk_Centro_Votacion" ("Centro_Votacion_id"),
  KEY "fk_Proceso_Electoral" ("Proceso_Electoral_id"),
  CONSTRAINT "locacion_ibfk_1" FOREIGN KEY ("Centro_Votacion_id") REFERENCES "centro_votacion" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "locacion_ibfk_2" FOREIGN KEY ("Proceso_Electoral_id") REFERENCES "proceso_electoral" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
) TYPE=InnoDB;

--
-- Dumping data for table "locacion"
--

/*!40000 ALTER TABLE "locacion" DISABLE KEYS */;
/*!40000 ALTER TABLE "locacion" ENABLE KEYS */;


--
-- Definition of table "log_elector"
--

DROP TABLE IF EXISTS "log_elector";
CREATE TABLE "log_elector" (
  "id" int(10) unsigned NOT NULL auto_increment,
  "Elector_id" bigint(20) NOT NULL,
  "Diccionario_Log_id" int(10) unsigned NOT NULL,
  "fecha" datetime NOT NULL,
  PRIMARY KEY  ("id"),
  KEY "fk_Diccionario_Log" ("Diccionario_Log_id"),
  KEY "fk_Elector" ("Elector_id"),
  CONSTRAINT "log_elector_ibfk_1" FOREIGN KEY ("Diccionario_Log_id") REFERENCES "diccionario_log" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "log_elector_ibfk_2" FOREIGN KEY ("Elector_id") REFERENCES "elector" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
) TYPE=InnoDB;

--
-- Dumping data for table "log_elector"
--

/*!40000 ALTER TABLE "log_elector" DISABLE KEYS */;
/*!40000 ALTER TABLE "log_elector" ENABLE KEYS */;


--
-- Definition of table "log_usuario"
--

DROP TABLE IF EXISTS "log_usuario";
CREATE TABLE "log_usuario" (
  "id" int(10) unsigned NOT NULL auto_increment,
  "Diccionario_Log_id" int(10) unsigned NOT NULL,
  "Usuario_id" int(10) unsigned NOT NULL,
  "fecha" datetime NOT NULL,
  PRIMARY KEY  ("id"),
  KEY "fk_Usuario" ("Usuario_id"),
  KEY "fk_Diccionario_Log" ("Diccionario_Log_id"),
  CONSTRAINT "log_usuario_ibfk_1" FOREIGN KEY ("Usuario_id") REFERENCES "usuario" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "log_usuario_ibfk_2" FOREIGN KEY ("Diccionario_Log_id") REFERENCES "diccionario_log" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
) TYPE=InnoDB;

--
-- Dumping data for table "log_usuario"
--

/*!40000 ALTER TABLE "log_usuario" DISABLE KEYS */;
/*!40000 ALTER TABLE "log_usuario" ENABLE KEYS */;


--
-- Definition of table "opcion"
--

DROP TABLE IF EXISTS "opcion";
CREATE TABLE "opcion" (
  "id" int(10) unsigned NOT NULL auto_increment,
  "Candidato_Partido_Politico_id" int(10) unsigned NOT NULL,
  "Cedula_id" int(10) unsigned NOT NULL,
  "orden" int(10) unsigned NOT NULL,
  "fecha_creacion" datetime NOT NULL,
  PRIMARY KEY  ("id"),
  KEY "fk_Cedula" ("Cedula_id"),
  KEY "fk_Candidato_Partido_Politico" ("Candidato_Partido_Politico_id"),
  CONSTRAINT "opcion_ibfk_1" FOREIGN KEY ("Cedula_id") REFERENCES "cedula" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "opcion_ibfk_2" FOREIGN KEY ("Candidato_Partido_Politico_id") REFERENCES "candidato_partido_politico" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
) TYPE=InnoDB;

--
-- Dumping data for table "opcion"
--

/*!40000 ALTER TABLE "opcion" DISABLE KEYS */;
/*!40000 ALTER TABLE "opcion" ENABLE KEYS */;


--
-- Definition of table "operador"
--

DROP TABLE IF EXISTS "operador";
CREATE TABLE "operador" (
  "Usuario_id" int(10) unsigned NOT NULL,
  "Locacion_id" int(10) unsigned NOT NULL,
  "estado" char(1) NOT NULL default 'A',
  PRIMARY KEY  ("Usuario_id","Locacion_id"),
  KEY "fk_Usuario" ("Usuario_id"),
  KEY "fk_Locacion" ("Locacion_id"),
  CONSTRAINT "operador_ibfk_1" FOREIGN KEY ("Usuario_id") REFERENCES "usuario" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "operador_ibfk_2" FOREIGN KEY ("Locacion_id") REFERENCES "locacion" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
) TYPE=InnoDB;

--
-- Dumping data for table "operador"
--

/*!40000 ALTER TABLE "operador" DISABLE KEYS */;
/*!40000 ALTER TABLE "operador" ENABLE KEYS */;


--
-- Definition of table "pais"
--

DROP TABLE IF EXISTS "pais";
CREATE TABLE "pais" (
  "id" int(10) unsigned NOT NULL auto_increment,
  "nombre" varchar(60) NOT NULL,
  "abreviatura" char(2) NOT NULL,
  "estado" char(1) NOT NULL default 'A',
  PRIMARY KEY  ("id")
) TYPE=InnoDB;

--
-- Dumping data for table "pais"
--

/*!40000 ALTER TABLE "pais" DISABLE KEYS */;
/*!40000 ALTER TABLE "pais" ENABLE KEYS */;


--
-- Definition of table "partido_politico"
--

DROP TABLE IF EXISTS "partido_politico";
CREATE TABLE "partido_politico" (
  "id" int(10) unsigned NOT NULL,
  "nombre" varchar(40) NOT NULL,
  "abreviatura" varchar(10) NOT NULL,
  "logo" varchar(36) NOT NULL,
  "estado" char(1) NOT NULL,
  PRIMARY KEY  ("id")
) TYPE=InnoDB;

--
-- Dumping data for table "partido_politico"
--

/*!40000 ALTER TABLE "partido_politico" DISABLE KEYS */;
/*!40000 ALTER TABLE "partido_politico" ENABLE KEYS */;


--
-- Definition of table "perfil"
--

DROP TABLE IF EXISTS "perfil";
CREATE TABLE "perfil" (
  "id" int(10) unsigned NOT NULL auto_increment,
  "nombre" varchar(50) NOT NULL,
  "descripcion" varchar(100) NOT NULL,
  "estado" char(1) NOT NULL default 'A',
  PRIMARY KEY  ("id")
) TYPE=InnoDB;

--
-- Dumping data for table "perfil"
--

/*!40000 ALTER TABLE "perfil" DISABLE KEYS */;
/*!40000 ALTER TABLE "perfil" ENABLE KEYS */;


--
-- Definition of table "pin"
--

DROP TABLE IF EXISTS "pin";
CREATE TABLE "pin" (
  "id" bigint(20) NOT NULL auto_increment,
  "Elector_id" bigint(20) NOT NULL,
  "numero" char(32) NOT NULL,
  "creacion" date NOT NULL,
  "estado" char(1) NOT NULL,
  PRIMARY KEY  ("id"),
  KEY "fk_Elector" ("Elector_id"),
  CONSTRAINT "pin_ibfk_1" FOREIGN KEY ("Elector_id") REFERENCES "elector" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
) TYPE=InnoDB;

--
-- Dumping data for table "pin"
--

/*!40000 ALTER TABLE "pin" DISABLE KEYS */;
/*!40000 ALTER TABLE "pin" ENABLE KEYS */;


--
-- Definition of table "proceso_electoral"
--

DROP TABLE IF EXISTS "proceso_electoral";
CREATE TABLE "proceso_electoral" (
  "id" int(10) unsigned NOT NULL,
  "Usuario_id" int(10) unsigned NOT NULL,
  "descripcion" varchar(50) NOT NULL,
  "fecha_votacion" date NOT NULL,
  "hora_inicial" time NOT NULL,
  "hora_final" time NOT NULL,
  "fecha_padron_inicial" date NOT NULL,
  "fecha_padron_final" date NOT NULL,
  "tiempo_sesion" int(11) NOT NULL,
  "estado" char(1) NOT NULL default 'A',
  PRIMARY KEY  ("id"),
  KEY "fk_Usuario" ("Usuario_id"),
  CONSTRAINT "proceso_electoral_ibfk_1" FOREIGN KEY ("Usuario_id") REFERENCES "usuario" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
) TYPE=InnoDB;

--
-- Dumping data for table "proceso_electoral"
--

/*!40000 ALTER TABLE "proceso_electoral" DISABLE KEYS */;
/*!40000 ALTER TABLE "proceso_electoral" ENABLE KEYS */;


--
-- Definition of table "usuario"
--

DROP TABLE IF EXISTS "usuario";
CREATE TABLE "usuario" (
  "id" int(10) unsigned NOT NULL auto_increment,
  "Perfil_id" int(10) unsigned NOT NULL,
  "nombre" varchar(20) NOT NULL,
  "paterno" varchar(20) NOT NULL,
  "materno" varchar(20) NOT NULL,
  "dni" char(8) NOT NULL,
  "email" varchar(50) NOT NULL,
  "movil" varchar(15) NOT NULL,
  "username" varchar(10) NOT NULL,
  "passwd" varchar(32) NOT NULL,
  "estado" char(1) NOT NULL default 'A',
  PRIMARY KEY  ("id"),
  KEY "fk_Perfil" ("Perfil_id"),
  CONSTRAINT "usuario_ibfk_1" FOREIGN KEY ("Perfil_id") REFERENCES "perfil" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
) TYPE=InnoDB;

--
-- Dumping data for table "usuario"
--

/*!40000 ALTER TABLE "usuario" DISABLE KEYS */;
/*!40000 ALTER TABLE "usuario" ENABLE KEYS */;


--
-- Definition of table "voto"
--

DROP TABLE IF EXISTS "voto";
CREATE TABLE "voto" (
  "id" bigint(20) NOT NULL auto_increment,
  "Locacion_id" int(10) unsigned NOT NULL,
  "Opcion_id" blob NOT NULL,
  "fecha_creacion" datetime NOT NULL,
  PRIMARY KEY  ("id"),
  KEY "Voto_FKIndex1" ("Locacion_id"),
  CONSTRAINT "voto_ibfk_1" FOREIGN KEY ("Locacion_id") REFERENCES "locacion" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
) TYPE=InnoDB;

--
-- Dumping data for table "voto"
--

/*!40000 ALTER TABLE "voto" DISABLE KEYS */;
/*!40000 ALTER TABLE "voto" ENABLE KEYS */;


--
-- Definition of table "zona_horaria"
--

DROP TABLE IF EXISTS "zona_horaria";
CREATE TABLE "zona_horaria" (
  "id" int(10) unsigned NOT NULL auto_increment,
  "tiempo" int(11) NOT NULL,
  "nombre" varchar(50) NOT NULL,
  "estado" char(1) NOT NULL,
  PRIMARY KEY  ("id")
) TYPE=InnoDB;

--
-- Dumping data for table "zona_horaria"
--

/*!40000 ALTER TABLE "zona_horaria" DISABLE KEYS */;
/*!40000 ALTER TABLE "zona_horaria" ENABLE KEYS */;


--
-- Definition of function "fa_voto_getAESKey"
--

DROP FUNCTION IF EXISTS `fa_voto_getAESKey`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` FUNCTION `fa_voto_getAESKey`() 
RETURNS varchar(100) CHARSET latin1 
DETERMINISTIC
READS SQL DATA
BEGIN
	RETURN 'Sdf3GMnmyu87568xCsarwEFsfst3GdHfTYr3FsdfsgegdfgSDGDFWCXZCShth3248Hrdcx1SDF1S5D1SRWE2NFS5D1F';
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_actualiza_Puesta_Cero"
--

DROP PROCEDURE IF EXISTS `pa_actualiza_Puesta_Cero`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_actualiza_Puesta_Cero`(in codigo integer)
BEGIN
	update locacion 
        set puesta_cero='S',
            fecha_puesta_cero=CURRENT_TIMESTAMP
            where id=codigo;
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_ADMIN_abrirProcesoDemo"
--

DROP PROCEDURE IF EXISTS `pa_ADMIN_abrirProcesoDemo`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_ADMIN_abrirProcesoDemo`()
BEGIN
	declare v_usuario int(10);
	declare v_proceso int(10);
	truncate pin;
	truncate elector;
	truncate voto;
	truncate escrutinio;
	truncate operador;
	truncate locacion;
	truncate opcion;
	truncate candidato_partido_politico;
	truncate candidato;
	truncate partido_politico;
	truncate cedula;
	truncate proceso_electoral;
	select id into v_usuario from usuario where perfil_id = 1 and estado = 'A' limit 0, 1;
	call pa_proceso_electoral_insertar(v_usuario, 'Elecciones Presidenciales DEMO', 
		CURRENT_DATE, CURRENT_TIME, addtime(CURRENT_TIME, '00:20:00'), 
		adddate(CURRENT_DATE, -60), adddate(CURRENT_DATE, -10), 3);
	select id into v_proceso from proceso_electoral where descripcion = 'Elecciones Presidenciales DEMO';
	insert into locacion values (1, v_proceso, 1, 'N', 'A', null, null);
	insert into locacion values (2, v_proceso, 2, 'N', 'A', null, null);
	insert into locacion values (3, v_proceso, 3, 'N', 'A', null, null);
	insert into locacion values (4, v_proceso, 4, 'N', 'A', null, null);
	insert into locacion values (5, v_proceso, 5, 'N', 'A', null, null);
	/*insert into locacion values (6, v_proceso, 6, 'N', 'A', null, null);
	insert into locacion values (7, v_proceso, 7, 'N', 'A', null, null);
	insert into locacion values (8, v_proceso, 8, 'N', 'A', null, null);
	insert into locacion values (9, v_proceso, 9, 'N', 'A', null, null);
	insert into locacion values (10, v_proceso, 10, 'N', 'A', null, null);
	insert into locacion values (11, v_proceso, 11, 'N', 'A', null, null);
	insert into locacion values (12, v_proceso, 12, 'N', 'A', null, null);
	insert into locacion values (13, v_proceso, 13, 'N', 'A', null, null);*/
	insert into operador values (1, 1, 'A');
	insert into operador values (1, 2, 'A');
	insert into operador values (3, 3, 'A');
	insert into operador values (4, 4, 'A');
	insert into operador values (2, 5, 'A');
	/*insert into operador values (3, 6, 'A');
	insert into operador values (3, 7, 'A');
	insert into operador values (3, 8, 'A');
	insert into operador values (3, 9, 'A');
	insert into operador values (4, 10, 'A');
	insert into operador values (4, 11, 'A');
	insert into operador values (4, 12, 'A');
	insert into operador values (3, 13, 'A');*/
	insert into candidato (id, nombre, paterno, materno, dni, foto, estado) 
	values (1, 'Juan Pablo', 'Perez', 'Pinto', '41723412', 'candidato1.jpg', 'A'),
	       (2, 'Luis Eduardo', 'Loca', 'Paliza', '34679213', 'candidato2.jpg', 'A');
	insert into partido_politico (id, nombre, abreviatura, logo, estado) 
	values (1, 'Partido La Herradura', 'PLH', 'simbolo1.jpg', 'A'),
	       (2, 'Partido La Estafa', 'PLE', 'simbolo2.jpg', 'A');
	insert  into candidato_partido_politico (id, Partido_Politico_id, Candidato_id, fecha_creacion, fecha_modificacion, estado) 
	values (1, 1, 1, now(), now(), 'A'),
	       (2, 2, 2, now(), now(), 'A');
	insert  into cedula (id, Proceso_Electoral_id, tipo, estado, fecha_creacion, fecha_modificacion) 
	values (1, v_proceso, 'P', 'P', now(), now());
	insert into opcion (id, Candidato_Partido_Politico_id, Cedula_id, orden, fecha_creacion)
	values (1, 1, 1, 1, now()), (2, 2, 1, 2, now());
	call pa_proceso_electoral_activar(v_proceso);
	call pa_elector_registrar(0, 5, 'Renzo', 'Portocarrero', 'Heredia', '11111111', 'hacklucas@gmail.com');
	call pa_elector_registrar(0, 1, 'Rudy', 'Capatinta', 'Aucca', '22222222', 'hacklucas@gmail.com');
	call pa_elector_registrar(0, 1, 'Omar', 'Carpio', 'Carpio', '33333333', 'hacklucas@gmail.com');
	call pa_elector_registrar(0, 2, 'Jhoon', 'Saravia', 'Tasayco', '44444444', 'hacklucas@gmail.com');
	call pa_elector_registrar(0, 5, 'Marco', 'Cristobal', 'Salazar', '55555555', 'hacklucas@gmail.com');
	call pa_elector_registrar(0, 3, 'Aaron', 'Ramirez', 'Tafur', '66666666', 'hacklucas@gmail.com');
	call pa_elector_registrar(0, 5, 'Luis', 'Ruiz', 'Velez', '77777777', 'hacklucas@gmail.com');
	call pa_elector_registrar(0, 5, 'Rommel', 'Samanez', 'Carrillo', '88888888', 'hacklucas@gmail.com');
	call pa_elector_registrar(0, 4, 'David', 'Cama', 'Buleje', '99999999', 'hacklucas@gmail.com');
	call pa_elector_registrar(0, 5, 'Julius', 'Sanchez', 'Valdizabar', '10101010', 'hacklucas@gmail.com');
	call pa_elector_registrar(0, 3, 'Armando', 'Paredes', 'Inti', '20202020', 'hacklucas@gmail.com');
	call pa_elector_registrar(0, 4, 'Ronaldo', 'Campos', 'Gutierres', '30303030', 'hacklucas@gmail.com');
	call pa_elector_registrar(0, 5, 'Claudio', 'Pinasco', 'Chavez', '40404040', 'hacklucas@gmail.com');
	call pa_elector_registrar(0, 1, 'Sergio', 'Lopez', 'Figueroa', '50505050', 'hacklucas@gmail.com');
	call pa_elector_generaPIN(1);
	call pa_elector_generaPIN(2);
	call pa_elector_generaPIN(3);
	call pa_elector_generaPIN(4);
	call pa_elector_generaPIN(5);
	call pa_elector_generaPIN(6);
	call pa_elector_generaPIN(7);
	call pa_elector_generaPIN(8);
	call pa_elector_generaPIN(9);
	call pa_elector_generaPIN(10);
	call pa_elector_generaPIN(11);
	call pa_elector_generaPIN(12);
	call pa_elector_generaPIN(13);
	call pa_elector_generaPIN(14);
	update pin set numero = md5('123');
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_ADMIN_cerrarProcesoDemo"
--

DROP PROCEDURE IF EXISTS `pa_ADMIN_cerrarProcesoDemo`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_ADMIN_cerrarProcesoDemo`()
BEGIN
	-- cambia la hora de inicio y fin del Proceso Activo
	update  proceso_electoral set
		hora_inicial = addtime(CURRENT_TIME, '-00:20:00'),
		hora_final = CURRENT_TIME
	where estado = 'A';
	-- se fuerza la puesta a cero y el cierre de todas 
	-- las locaciones del Proceso Activo
	update locacion set 
		puesta_cero = 'S', 
		fecha_puesta_cero = now(),
		estado = 'C',
		fecha_cierre = now()
	where puesta_cero = 'N';	
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_ADMIN_crearVotos"
--

DROP PROCEDURE IF EXISTS `pa_ADMIN_crearVotos`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_ADMIN_crearVotos`()
BEGIN
	DECLARE v1 INT DEFAULT 2000;
	DECLARE vLocacion INT DEFAULT 1;
	DECLARE vOpcion INT DEFAULT 1;
	DECLARE vLocacionR INT DEFAULT 1;
	DECLARE vOpcionR INT DEFAULT 1;
	select max(id) into vLocacion from locacion;
	select max(id) into vOpcion from opcion;
	WHILE v1 > 0 DO
		SET vLocacionR = rand() * vLocacion;
		if vLocacionR = 0 then
			SET vLocacionR = 1;
		end if;
		SET vOpcionR = rand() * vOpcion;
		insert into voto (locacion_id, opcion_id, fecha_creacion) values (vLocacionR, AES_ENCRYPT(vOpcionR, fa_voto_getAESKey()), now());
		SET v1 = v1 - 1;
	END WHILE;
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_ADMIN_setDefaultData"
--

DROP PROCEDURE IF EXISTS `pa_ADMIN_setDefaultData`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_ADMIN_setDefaultData`()
BEGIN
	truncate pin;
	truncate elector;
	truncate voto;
	truncate escrutinio;
	truncate operador;
	truncate locacion;
	truncate centro_votacion;
	truncate opcion;
	truncate candidato_partido_politico;
	truncate candidato;
	truncate partido_politico;
	truncate cedula;
	truncate proceso_electoral;
	truncate zona_horaria;
	truncate pais;
	truncate log_usuario;
	truncate usuario;
	truncate perfil;
	truncate diccionario_log;
	insert into pais values (1, 'Argentina', 'AR', 'A');
	insert into pais values (2, 'Bolivia', 'BO', 'A');
	insert into pais values (3, 'Brasil', 'BR', 'A');
	insert into pais values (4, 'Chile', 'CL', 'A');
	insert into pais values (5, 'Colombia', 'CO', 'A');
	insert into pais values (6, 'Ecuador', 'EC', 'A');
	insert into pais values (7, 'México', 'MX', 'A');
	insert into pais values (8, 'Paraguay', 'PY', 'A');
	insert into pais values (9, 'Perú', 'PE', 'A');
	insert into pais values (10, 'Uruguay', 'UY', 'A');
	insert into pais values (11, 'Venezuela', 'VE', 'A');
	insert into pais values (12, 'Estados Unidos de América', 'EU', 'A');
	insert into pais values (13, 'Japón', 'JP', 'A');
	insert into zona_horaria values (1, -12, 'GMT -12:00', 'A');
	insert into zona_horaria values (2, -11, 'GMT -11:00', 'A');
	insert into zona_horaria values (3, -10, 'GMT -10:00', 'A');
	insert into zona_horaria values (4, -9, 'GMT -09:00', 'A');
	insert into zona_horaria values (5, -8, 'GMT -08:00', 'A');
	insert into zona_horaria values (6, -7, 'GMT -07:00', 'A');
	insert into zona_horaria values (7, -6, 'GMT -06:00', 'A');
	insert into zona_horaria values (8, -5, 'GMT -05:00', 'A');
	insert into zona_horaria values (9, -4, 'GMT -04:00', 'A');
	insert into zona_horaria values (10, -3, 'GMT -03:00', 'A');
	insert into zona_horaria values (11, -2, 'GMT -02:00', 'A');
	insert into zona_horaria values (12, -1, 'GMT -01:00', 'A');
	insert into zona_horaria values (13, 0, 'GMT +00:00', 'A');
	insert into zona_horaria values (14, 1, 'GMT +01:00', 'A');
	insert into zona_horaria values (15, 2, 'GMT +02:00', 'A');
	insert into zona_horaria values (16, 3, 'GMT +03:00', 'A');
	insert into zona_horaria values (17, 4, 'GMT +04:00', 'A');
	insert into zona_horaria values (18, 5, 'GMT +05:00', 'A');
	insert into zona_horaria values (19, 6, 'GMT +06:00', 'A');
	insert into zona_horaria values (20, 7, 'GMT +07:00', 'A');
	insert into zona_horaria values (21, 8, 'GMT +08:00', 'A');
	insert into zona_horaria values (22, 9, 'GMT +09:00', 'A');
	insert into zona_horaria values (23, 10, 'GMT +10:00', 'A');
	insert into zona_horaria values (24, 11, 'GMT +11:00', 'A');
	insert into zona_horaria values (25, 12, 'GMT +12:00', 'A');
	insert into centro_votacion values (1, 5, 13, '', 'Consulado de Bogota', '', '', 'A');
	insert into centro_votacion values (2, 5, 13, '', 'Consulado de Medellin', '', '', 'A');
	insert into centro_votacion values (3, 5, 13, '', 'Consulado de Tolima', '', '', 'A');
	insert into centro_votacion values (4, 5, 13, '', 'Consulado de Santa Marta', '', '', 'A');
	insert into centro_votacion values (5, 5, 13, '', 'Consulado de Cartagena', '', '', 'A');
	insert into centro_votacion values (6, 6, 8, '', 'Consulado de Ecuador', '', '', 'A');
	insert into centro_votacion values (7, 7, 7, '', 'Consulado de México', '', '', 'A');
	insert into centro_votacion values (8, 8, 9, '', 'Consulado de Paraguay', '', '', 'A');
	insert into centro_votacion values (9, 13, 22, '', 'Consulado de Japón', '', '', 'A');
	insert into centro_votacion values (10, 10, 10, '', 'Consulado de Uruguay', '', '', 'A');
	insert into centro_votacion values (11, 11, 9, '', 'Consulado de Venezuela', '', '', 'A');
	insert into centro_votacion values (12, 12, 9, '', 'Consulado de New York', '', '', 'A');
	insert into centro_votacion values (13, 12, 5, '', 'Consulado de Los Angeles', '', '', 'A');
	insert into perfil (id, nombre, descripcion, estado) values 
	(1, 'OPERADOR CENTRAL', 'Operador Central', 'A'),
	(2, 'OPERADOR DE CONSULADO', 'Operador de Consulado para Impresion de Credenciales', 'A'),
	(3, 'OPERADOR DE MODULO', 'Operador de Centro de Votacion', 'A');
	insert into usuario values (1, 3, 'Luis', 'Aldana', 'Perez', '', '', '', 'modulo1', '123', 'A');
	insert into usuario values (2, 3, 'Alfredo', 'Benavides', 'Orantia', '', '', '', 'modulo2', '123', 'A');
	insert into usuario values (3, 3, 'Albelardo', 'Quiñones', 'Salazar', '', '', '', 'modulo3', '123', 'A');
	insert into usuario values (4, 3, 'Francisco', 'Bolognesi', 'Alcantara', '', '', '', 'modulo4', '123', 'A');
	insert into usuario values (5, 1, 'Roberto', 'Solano', 'Paz', '', '', '', 'central1', '123', 'A');
	insert into usuario values (6, 2, 'Alejandro', 'Espinoza', 'Guillen', '', '', '', 'consul1', '123', 'A');
	insert into diccionario_log values (1, 'LOCACION CERRADA');
	insert into diccionario_log values (2, 'ELIMINACION de VOTOS');
	insert into diccionario_log values (3, 'PUESTA a CERO');
	insert into diccionario_log values (4, 'DNI VALIDO');
	insert into diccionario_log values (5, 'DNI NO VALIDO');
	insert into diccionario_log values (6, 'REINTENTO de VOTO');
	insert into diccionario_log values (7, 'PIN NO VALIDO');
	insert into diccionario_log values (8, 'PIN VALIDO');
	insert into diccionario_log values (9, 'PIN NO VALIDO');
	insert into diccionario_log values (10, 'VOTO COMPLETADO');
	insert into diccionario_log values (11, 'ENVIO de CONSTANCIA');
	insert into diccionario_log values (12, 'IMPRESION de CONSTANCIA');
	insert into diccionario_log values (13, 'DESCARGA de CONSTANCIA');
	insert into diccionario_log values (14, 'INGRESO VALIDO A CENTRAL');
	insert into diccionario_log values (15, 'INGRESO VALIDO A LOCACION');
	insert into diccionario_log values (16, 'INGRESO VALIDO A CENTRO DE EMPADRONAMIENTO');
	insert into partido_politico values (0, 'VACIO', '', 'nothing.gif', 'A');
	insert into candidato values (0, '', '', '', '', 'nothing.gif', 'A');
	insert into candidato_partido_politico values (0, 0, 0, now(), now(), 'A');
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_ADMIN_setEmpadronamiento"
--

DROP PROCEDURE IF EXISTS `pa_ADMIN_setEmpadronamiento`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_ADMIN_setEmpadronamiento`()
BEGIN
	declare v_id int(10);
	select id into v_id from proceso_electoral where estado = 'A';
	if isnull(v_id) then
	  SELECT 'No hay Proceso Activo' as mensaje;
	else
	  update proceso_electoral set 
	    fecha_padron_inicial = adddate(CURRENT_DATE, -3), 
	    fecha_padron_final = CURRENT_DATE, 
	    fecha_votacion = adddate(CURRENT_DATE, 1) 
	  where id = v_id;
	  SELECT 'Proceso Activo Modificado' as mensaje;
	end if;
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_ADMIN_verUsuarioLog"
--

DROP PROCEDURE IF EXISTS `pa_ADMIN_verUsuarioLog`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_ADMIN_verUsuarioLog`()
BEGIN
	select u.username, d.descripcion as evento, l.fecha 
	from usuario u inner join log_usuario l on l.usuario_id = u.id 
	inner join diccionario_log d on l.diccionario_log_id = d.id;
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_candidato_asignar"
--

DROP PROCEDURE IF EXISTS `pa_candidato_asignar`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_candidato_asignar`(IN v_partidopolitico INTEGER, IN v_candidato INTEGER)
BEGIN
    declare v_codigo integer;
    
    select ifnull(max(id), 0) into v_codigo from candidato_partido_politico;
    set v_codigo = v_codigo + 1;
    # se retiran todos los demas asignaciones del candidato
    update candidato_partido_politico set estado = 'R', fecha_modificacion = now() 
    where candidato_id = v_candidato and estado = 'A';
    # se asigna el candidato a un partido politico
    insert into candidato_partido_politico 
	(id, partido_politico_id, candidato_id, fecha_creacion, fecha_modificacion, estado)
    values 
	(v_codigo, v_partidopolitico, v_candidato, now(), now(), 'A');
  END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_candidato_delete"
--

DROP PROCEDURE IF EXISTS `pa_candidato_delete`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_candidato_delete`(IN codigo INTEGER)
BEGIN
      UPDATE candidato
      SET estado = 'I'
      WHERE id = codigo;
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_candidato_edit"
--

DROP PROCEDURE IF EXISTS `pa_candidato_edit`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_candidato_edit`(IN codigo INTEGER, IN v_nombre VARCHAR(40), IN v_paterno VARCHAR(30), IN v_materno VARCHAR(30), IN v_dni VARCHAR(8), IN v_foto VARCHAR(36))
BEGIN
      #declare nombr varchar(30);
      if v_foto = '' then 
	UPDATE candidato
	SET nombre = v_nombre, paterno = v_paterno , materno = v_materno , dni = v_dni
	WHERE id = codigo;
        #select concat('') as nombr;
      else
        #select concat('candidato',codigo,'.',v_foto) into nombr;
	UPDATE candidato
	SET nombre = v_nombre, paterno = v_paterno , materno = v_materno , dni = v_dni , foto = v_foto
	WHERE id = codigo;
        #select nombr as nombr;
      end if;
      select v_foto as nombr;
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_candidato_findAll"
--

DROP PROCEDURE IF EXISTS `pa_candidato_findAll`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_candidato_findAll`()
BEGIN
      SELECT id,
             nombre,
             paterno,
	     materno,	
             dni,
	     foto,
	     estado
      FROM candidato
      WHERE estado = 'A'
      and id<>0 ;
       
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_candidato_findByPrimaryKey"
--

DROP PROCEDURE IF EXISTS `pa_candidato_findByPrimaryKey`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_candidato_findByPrimaryKey`(IN codigo integer)
BEGIN
      SELECT id, nombre, paterno,materno,dni,foto,estado
      FROM candidato
      WHERE id = codigo;
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_candidato_insert"
--

DROP PROCEDURE IF EXISTS `pa_candidato_insert`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_candidato_insert`(IN v_nombre VARCHAR(30), IN v_paterno VARCHAR(30), IN v_materno VARCHAR(30), IN v_dni VARCHAR(8), IN v_foto VARCHAR(36))
BEGIN
      DECLARE codigo INTEGER;
      #DECLARE nombre VARCHAR(30);
      SELECT IFNULL(MAX(id), 0) into codigo from candidato;
      SET codigo = codigo + 1;
      #select concat('candidato',codigo,'.',v_foto) into nombre;
      INSERT INTO candidato (id, nombre, paterno, materno, dni, foto, estado)
      VALUES (codigo, v_nombre, v_paterno, v_materno, v_dni, v_foto, 'A');
      
      #select nombre;
      select v_foto as nombre;
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_candidato_retirar"
--

DROP PROCEDURE IF EXISTS `pa_candidato_retirar`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_candidato_retirar`(IN v_partidopolitico INTEGER, IN v_candidato INTEGER)
BEGIN
    update candidato_partido_politico 
	set estado = 'R', fecha_modificacion = now() 
    where partido_politico_id = v_partidopolitico and
	candidato_id = v_candidato and estado = 'A';
  END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_cedula_cargarProcesosElectorales"
--

DROP PROCEDURE IF EXISTS `pa_cedula_cargarProcesosElectorales`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_cedula_cargarProcesosElectorales`()
BEGIN
	select id, descripcion as nombre from proceso_electoral where estado = 'C';
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_cedula_listar"
--

DROP PROCEDURE IF EXISTS `pa_cedula_listar`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_cedula_listar`()
BEGIN
	SELECT 
		c.id, p.descripcion, c.tipo, c.estado 
	from 
		proceso_electoral p inner join cedula c 
	on c.Proceso_Electoral_id = p.id 
	order by p.id desc;
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_centrovotacion_asignar"
--

DROP PROCEDURE IF EXISTS `pa_centrovotacion_asignar`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_centrovotacion_asignar`(IN v_procesoelectoral INTEGER, IN v_centrovotacion INTEGER)
BEGIN
    declare v_existe INTEGER;
    select count(1) into v_existe
    from locacion
    where Proceso_Electoral_id = v_procesoelectoral and
          Centro_Votacion_id = v_centrovotacion;
    if v_existe = 0 then
      insert into locacion (id, proceso_electoral_id, centro_votacion_id, puesta_cero, estado, fecha_puesta_cero, fecha_cierre)
      values (null, v_procesoelectoral, v_centrovotacion, 'N', 'A', null, null);
    else
      update locacion
      set estado = 'A'
      where proceso_electoral_id = v_procesoelectoral and
            centro_votacion_id = v_centrovotacion;
    end if;
  END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_centrovotacion_conLocacion"
--

DROP PROCEDURE IF EXISTS `pa_centrovotacion_conLocacion`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_centrovotacion_conLocacion`(IN v_pe INTEGER, IN v_pais INTEGER)
BEGIN
    SELECT p.id as paisID,
           p.nombre as paisNombre,
           p.abreviatura as paisAbreviatura,
           p.estado as paisEstado,
           zh.id as zhID,
           zh.tiempo as zhTiempo,
           zh.nombre as zhNombre,
           zh.estado as zhEstado,
           cv.id as cvID,
           cv.pais_id as cvPaisID,
           cv.zona_horaria_id as cvZHID,
           cv.codigo_postal as cvCP,
           cv.nombre as cvNombre,
           cv.region as cvRegion,
           cv.direccion as cvDireccion,
           cv.estado as cvEstado
    FROM centro_votacion cv 
    INNER JOIN zona_horaria zh ON zh.id = cv.zona_horaria_id
    INNER JOIN pais p ON p.id = cv.pais_id
    WHERE cv.estado = 'A' AND
          p.id = v_pais AND
          cv.id IN (SELECT centro_votacion_id from locacion where proceso_electoral_id = v_pe and estado = 'A')
    ORDER BY p.nombre, zh.tiempo, cv.nombre;
  END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_centrovotacion_conUsuario"
--

DROP PROCEDURE IF EXISTS `pa_centrovotacion_conUsuario`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_centrovotacion_conUsuario`(IN v_pe INTEGER, IN v_user INTEGER, IN v_pais INTEGER)
BEGIN
    SELECT p.id as paisID,
           p.nombre as paisNombre,
           p.abreviatura as paisAbreviatura,
           p.estado as paisEstado,
           zh.id as zhID,
           zh.tiempo as zhTiempo,
           zh.nombre as zhNombre,
           zh.estado as zhEstado,
           cv.id as cvID,
           cv.pais_id as cvPaisID,
           cv.zona_horaria_id as cvZHID,
           cv.codigo_postal as cvCP,
           cv.nombre as cvNombre,
           cv.region as cvRegion,
           cv.direccion as cvDireccion,
           cv.estado as cvEstado
    FROM centro_votacion cv 
    INNER JOIN zona_horaria zh ON zh.id = cv.zona_horaria_id
    INNER JOIN pais p ON p.id = cv.pais_id
    WHERE cv.estado = 'A' AND
          p.id = v_pais AND
          cv.id IN (select centro_votacion_id
                    from locacion
                    where proceso_electoral_id = v_pe and
                          estado = 'A' and
                          id in (select locacion_id 
                                 from operador 
                                 where estado = 'A' and 
                                       usuario_id = v_user
                                )
                   )
    ORDER BY p.nombre, zh.tiempo, cv.nombre;
  END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_centrovotacion_delete"
--

DROP PROCEDURE IF EXISTS `pa_centrovotacion_delete`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_centrovotacion_delete`(IN v_Codigo INTEGER)
BEGIN
    UPDATE centro_votacion
    SET estado = 'I'
    WHERE id = v_Codigo;
  END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_centrovotacion_edit"
--

DROP PROCEDURE IF EXISTS `pa_centrovotacion_edit`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_centrovotacion_edit`(IN v_codigo INTEGER, IN v_pais INTEGER, IN v_zonahoraria INTEGER, IN v_codigopostal VARCHAR(10), IN v_nombre VARCHAR(50), IN v_region VARCHAR(50), IN v_direccion VARCHAR(100))
BEGIN
    UPDATE centro_votacion
    SET pais_id = v_pais,
        zona_horaria_id = v_zonahoraria,
        codigo_postal = v_codigopostal,
        nombre = v_nombre,
        region = v_region,
        direccion = v_direccion
    WHERE id = v_codigo;
  END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_centrovotacion_findAll"
--

DROP PROCEDURE IF EXISTS `pa_centrovotacion_findAll`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_centrovotacion_findAll`()
BEGIN
    SELECT p.id as paisID,
           p.nombre as paisNombre,
           p.abreviatura as paisAbreviatura,
           p.estado as paisEstado,
           zh.id as zhID,
           zh.tiempo as zhTiempo,
           zh.nombre as zhNombre,
           zh.estado as zhEstado,
           cv.id as cvID,
           cv.pais_id as cvPaisID,
           cv.zona_horaria_id as cvZHID,
           cv.codigo_postal as cvCP,
           cv.nombre as cvNombre,
           cv.region as cvRegion,
           cv.direccion as cvDireccion,
           cv.estado as cvEstado
    FROM centro_votacion cv 
    INNER JOIN zona_horaria zh ON zh.id = cv.zona_horaria_id
    INNER JOIN pais p ON p.id = cv.pais_id
    WHERE cv.estado = 'A'
    ORDER BY p.nombre, zh.tiempo, cv.nombre;
  END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_centrovotacion_findByName"
--

DROP PROCEDURE IF EXISTS `pa_centrovotacion_findByName`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_centrovotacion_findByName`(IN v_Nombre VARCHAR(50), IN v_Pais INTEGER, OUT v_Total INTEGER)
BEGIN
    select count(nombre) into v_Total 
    from centro_votacion 
    where nombre = v_Nombre and
          pais_id = v_Pais and
          estado = 'A';
  END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_centrovotacion_findByName_ID"
--

DROP PROCEDURE IF EXISTS `pa_centrovotacion_findByName_ID`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_centrovotacion_findByName_ID`(IN v_Nombre VARCHAR(50), IN v_Pais INTEGER, IN v_Codigo INTEGER, OUT v_Total INTEGER)
BEGIN
    select count(nombre) into v_Total 
    from centro_votacion 
    where nombre = v_Nombre and
          pais_id = v_Pais and
          estado = 'A' and
          id <> v_Codigo;
  END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_centrovotacion_findByPrimaryKey"
--

DROP PROCEDURE IF EXISTS `pa_centrovotacion_findByPrimaryKey`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_centrovotacion_findByPrimaryKey`(IN v_codigo INTEGER)
BEGIN
    SELECT p.id as paisID,
           p.nombre as paisNombre,
           p.abreviatura as paisAbreviatura,
           p.estado as paisEstado,
           zh.id as zhID,
           zh.tiempo as zhTiempo,
           zh.nombre as zhNombre,
           zh.estado as zhEstado,
           cv.id as cvID,
           cv.pais_id as cvPaisID,
           cv.zona_horaria_id as cvZHID,
           cv.codigo_postal as cvCP,
           cv.nombre as cvNombre,
           cv.region as cvRegion,
           cv.direccion as cvDireccion,
           cv.estado as cvEstado
    FROM centro_votacion cv 
    INNER JOIN zona_horaria zh ON zh.id = cv.zona_horaria_id
    INNER JOIN pais p ON p.id = cv.pais_id
    WHERE cv.estado = 'A' and
          cv.id = v_codigo;
  END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_centrovotacion_insert"
--

DROP PROCEDURE IF EXISTS `pa_centrovotacion_insert`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_centrovotacion_insert`(IN v_pais INTEGER, IN v_zonahoraria INTEGER, IN v_codigopostal VARCHAR(10), IN v_nombre VARCHAR(50), IN v_region VARCHAR(50), IN v_direccion VARCHAR(100))
BEGIN
    DECLARE v_codigo INTEGER;
    SELECT IFNULL(MAX(id), 0) into v_codigo from centro_votacion;
    SET v_codigo = v_codigo + 1;
    INSERT INTO centro_votacion (id, pais_id, zona_horaria_id, codigo_postal, nombre, region, direccion, estado)
    VALUES (v_codigo, v_pais, v_zonahoraria, v_codigopostal, v_nombre, v_region, v_direccion, 'A');
  END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_centrovotacion_retirar"
--

DROP PROCEDURE IF EXISTS `pa_centrovotacion_retirar`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_centrovotacion_retirar`(IN v_procesoelectoral INTEGER, IN v_centrovotacion INTEGER)
BEGIN
    update locacion
    set estado = 'I'
    where proceso_electoral_id = v_procesoelectoral and
          centro_votacion_id = v_centrovotacion;
  END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_centrovotacion_sinLocacion"
--

DROP PROCEDURE IF EXISTS `pa_centrovotacion_sinLocacion`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_centrovotacion_sinLocacion`(IN v_pe INTEGER, IN v_pais INTEGER)
BEGIN
    SELECT p.id as paisID,
           p.nombre as paisNombre,
           p.abreviatura as paisAbreviatura,
           p.estado as paisEstado,
           zh.id as zhID,
           zh.tiempo as zhTiempo,
           zh.nombre as zhNombre,
           zh.estado as zhEstado,
           cv.id as cvID,
           cv.pais_id as cvPaisID,
           cv.zona_horaria_id as cvZHID,
           cv.codigo_postal as cvCP,
           cv.nombre as cvNombre,
           cv.region as cvRegion,
           cv.direccion as cvDireccion,
           cv.estado as cvEstado
    FROM centro_votacion cv 
    INNER JOIN zona_horaria zh ON zh.id = cv.zona_horaria_id
    INNER JOIN pais p ON p.id = cv.pais_id
    WHERE cv.estado = 'A' AND
          p.id = v_pais AND
          cv.id NOT IN (SELECT centro_votacion_id from locacion where proceso_electoral_id = v_pe and estado = 'A')
    ORDER BY p.nombre, zh.tiempo, cv.nombre;
  END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_centrovotacion_sinUsuario"
--

DROP PROCEDURE IF EXISTS `pa_centrovotacion_sinUsuario`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_centrovotacion_sinUsuario`(IN v_pe INTEGER, IN v_user INTEGER, IN v_pais INTEGER)
BEGIN
    SELECT p.id as paisID,
           p.nombre as paisNombre,
           p.abreviatura as paisAbreviatura,
           p.estado as paisEstado,
           zh.id as zhID,
           zh.tiempo as zhTiempo,
           zh.nombre as zhNombre,
           zh.estado as zhEstado,
           cv.id as cvID,
           cv.pais_id as cvPaisID,
           cv.zona_horaria_id as cvZHID,
           cv.codigo_postal as cvCP,
           cv.nombre as cvNombre,
           cv.region as cvRegion,
           cv.direccion as cvDireccion,
           cv.estado as cvEstado
    FROM centro_votacion cv 
    INNER JOIN zona_horaria zh ON zh.id = cv.zona_horaria_id
    INNER JOIN pais p ON p.id = cv.pais_id
    WHERE cv.estado = 'A' AND
          p.id = v_pais AND
          cv.id IN (select centro_votacion_id
                    from locacion
                    where proceso_electoral_id = v_pe and
                          estado = 'A' and
                          id not in (select locacion_id 
                                     from operador 
                                     where estado = 'A' and 
                                           usuario_id = v_user
                                    )
                   )
    ORDER BY p.nombre, zh.tiempo, cv.nombre;
  END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_cierraProcesoElectoral"
--

DROP PROCEDURE IF EXISTS `pa_cierraProcesoElectoral`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_cierraProcesoElectoral`()
BEGIN
	
	update proceso_electoral set estado='C' where estado='A'; 
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_Consolidacion_Cierra_Proceso_Electoral"
--

DROP PROCEDURE IF EXISTS `pa_Consolidacion_Cierra_Proceso_Electoral`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_Consolidacion_Cierra_Proceso_Electoral`()
BEGIN
	
	update proceso_electoral set estado='F' where estado='A'; 
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_Consolidacion_Consolida_Voto"
--

DROP PROCEDURE IF EXISTS `pa_Consolidacion_Consolida_Voto`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_Consolidacion_Consolida_Voto`()
BEGIN
	select concat(c.nombre,' ',c.paterno,' ',c.materno) as nombre,
	       foto,pp.nombre as partido,logo,sum(numero) as resultado,
	       date_format(now(), "%d/%m/%y") as fecha
	from candidato_partido_politico cpp
	inner join candidato c
	on cpp.candidato_id=c.id
	inner join partido_politico pp
	on cpp.partido_politico_id = pp.id
	inner join opcion o
	on o.candidato_partido_politico_id=cpp.id
	inner join escrutinio e
	on e.opcion_id=o.id
	inner join locacion l
	on e.locacion_id=l.id
	inner join proceso_electoral pe
	on l.proceso_electoral_id= pe.id
	where pp.estado='A'
	and c.estado='A'
	and pe.estado='A'
	group by nombre,foto,pp.nombre,logo,fecha
	union
	select 
		"Voto en Blanco" as nombre,
		"nothing.gif" as foto,
		"" as partido, 
		"nothing.gif" as logo, 
		sum(numero) as resultado, 
		date_format(now(), "%d/%m/%y") as fecha_cierre 
	from escrutinio e
	inner join locacion l
	on e.locacion_id = l.id
	inner join proceso_electoral pe
	on l.proceso_electoral_id = pe.id
	and e.opcion_id = 0 
	and pe.estado='A' 
	order by resultado desc;
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_Consolidacion_Contar_Locaciones_Abiertas"
--

DROP PROCEDURE IF EXISTS `pa_Consolidacion_Contar_Locaciones_Abiertas`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_Consolidacion_Contar_Locaciones_Abiertas`()
BEGIN
	select count(id) as total from locacion where estado='A';
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_Consolidacion_Proceso_Electoral_Cerrado"
--

DROP PROCEDURE IF EXISTS `pa_Consolidacion_Proceso_Electoral_Cerrado`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_Consolidacion_Proceso_Electoral_Cerrado`()
BEGIN
	select * from proceso_electoral where estado='F';
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_Consolidacion_Resultado_Final"
--

DROP PROCEDURE IF EXISTS `pa_Consolidacion_Resultado_Final`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_Consolidacion_Resultado_Final`()
BEGIN
	select concat(c.nombre,' ',c.paterno,' ',c.materno) as nombre,
	       foto,pp.nombre as partido,logo,sum(numero) as resultado,
	       date_format(now(), "%d/%m/%y") as fecha
	from candidato_partido_politico cpp
	inner join candidato c
	on cpp.candidato_id=c.id
	inner join partido_politico pp
	on cpp.partido_politico_id = pp.id
	inner join opcion o
	on o.candidato_partido_politico_id=cpp.id
	inner join escrutinio e
	on e.opcion_id=o.id
	inner join locacion l
	on e.locacion_id=l.id
	inner join proceso_electoral pe
	on l.proceso_electoral_id= pe.id
	where pp.estado='A'
	and c.estado='A'
	and pe.estado='F' 
	group by nombre,foto,pp.nombre,logo,fecha
	union
	select 
		"Voto en Blanco" as nombre,
		"nothing.gif" as foto,
		"" as partido, 
		"nothing.gif" as logo, 
		sum(numero) as resultado, 
		date_format(now(), "%d/%m/%y") as fecha_cierre 
	from escrutinio e
	inner join locacion l
	on e.locacion_id = l.id
	inner join proceso_electoral pe
	on l.proceso_electoral_id = pe.id
	and e.opcion_id = 0 
	and pe.estado='F' 
	order by resultado desc;
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_consolida_voto"
--

DROP PROCEDURE IF EXISTS `pa_consolida_voto`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_consolida_voto`()
BEGIN
	select concat(c.nombre,' ',c.paterno,' ',c.materno) as nombre,
	       foto,pp.nombre as partido,logo,sum(numero) as resultado,
	       date_format(now(), "%d/%m/%y") as fecha
	from candidato_partido_politico cpp
	inner join candidato c
	on cpp.candidato_id=c.id
	inner join partido_politico pp
	on cpp.partido_politico_id = pp.id
	inner join opcion o
	on o.candidato_partido_politico_id=cpp.id
	inner join escrutinio e
	on e.opcion_id=o.id
	inner join locacion l
	on e.locacion_id=l.id
	inner join proceso_electoral pe
	on l.proceso_electoral_id= pe.id
	where pp.estado='A' 
	and c.estado='A'
	and pe.estado='C'
	group by nombre,foto,pp.nombre,logo,fecha
	order by resultado desc;
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_contarLocacionesAbiertas"
--

DROP PROCEDURE IF EXISTS `pa_contarLocacionesAbiertas`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_contarLocacionesAbiertas`()
BEGIN
	select count(id) as total from locacion where estado='A';
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_elector_consulados"
--

DROP PROCEDURE IF EXISTS `pa_elector_consulados`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_elector_consulados`(IN v_idProceso int(10))
BEGIN
	select l.id, c.nombre, c.Pais_id as pais  
	from locacion l inner join centro_votacion c 
	on l.Centro_Votacion_id = c.id 
	and l.Proceso_Electoral_id = v_idProceso;
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_elector_empadronamientoActivo"
--

DROP PROCEDURE IF EXISTS `pa_elector_empadronamientoActivo`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_elector_empadronamientoActivo`()
BEGIN
	
	declare v_procesoId int(10);
	set v_procesoId = 0;
	select id into v_procesoId from proceso_electoral 
	where estado = 'A' and fecha_padron_inicial <= CURRENT_DATE and fecha_padron_final >= CURRENT_DATE    
	order by fecha_votacion desc;
	select v_procesoId as resultado;
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_elector_findByDNI"
--

DROP PROCEDURE IF EXISTS `pa_elector_findByDNI`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_elector_findByDNI`(IN v_dni char(8))
BEGIN
	select * from elector where dni = v_dni;
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_elector_generaPIN"
--

DROP PROCEDURE IF EXISTS `pa_elector_generaPIN`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_elector_generaPIN`(IN v_id bigint(20))
BEGIN
	DECLARE v_pin varchar(32);
	select substring(md5(crc32(concat(nombre,dni,paterno,materno)) + UNIX_TIMESTAMP() * RAND()), 3, 7) 
		into v_pin from elector where id = v_id;
	update pin set estado = 'I' where Elector_id = v_id;
	insert into pin (id, Elector_id, numero, creacion, estado) 
		values (NULL, v_id, md5(v_pin), now(), 'A');
	update elector set estado = 'A' where id = v_id;
	select v_pin as pin;
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_elector_getCedula"
--

DROP PROCEDURE IF EXISTS `pa_elector_getCedula`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_elector_getCedula`(IN v_peid int(10))
BEGIN
	select 
	  o.id, p.nombre, p.abreviatura, p.logo, CONCAT_WS(' ', c.nombre, c.paterno, c.materno) as politico, c.foto 
	from 
	  partido_politico p inner join candidato_partido_politico d 
	    on p.id = d.Partido_Politico_id inner join candidato c 
	      on d.Candidato_id = c.id inner join opcion o 
	        on d.id = o.Candidato_Partido_Politico_id inner join cedula k 
		  on o.cedula_id = k.id 
	and k.Proceso_Electoral_id = v_peid 
	order by o.orden asc;
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_elector_getProcesoActivo"
--

DROP PROCEDURE IF EXISTS `pa_elector_getProcesoActivo`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_elector_getProcesoActivo`()
BEGIN
	declare v_procesoId int(10);
	set v_procesoId = 0;
	select id into v_procesoId from proceso_electoral 
	where estado = 'A' 
	order by fecha_votacion desc;
	select v_procesoId as resultado;
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_elector_isVotoEnRango"
--

DROP PROCEDURE IF EXISTS `pa_elector_isVotoEnRango`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_elector_isVotoEnRango`(IN v_idProceso int(10), IN v_idElector bigint(20))
BEGIN
	declare v_fi, v_ff, v_fr datetime;
	declare v_puesta_cero, v_estado char(1);
	# se verifica que la locacion del elector haya hecho la puesta a cero
	select l.puesta_cero, l.estado into v_puesta_cero, v_estado 
	from locacion l inner join elector e on l.id = e.locacion_id and e.id = v_idElector;
	if v_puesta_cero = 'S' and v_estado = 'A' then
	  # se obtiene el rango de votacion
	  select 
  	    STR_TO_DATE(concat(fecha_votacion,' ',hora_inicial),'%Y-%m-%d %H:%i:%s'), 
  	    STR_TO_DATE(concat(fecha_votacion,' ',hora_final),'%Y-%m-%d %H:%i:%s') 
	    into v_fi, v_ff 
	  from proceso_electoral where id = v_idProceso;
	  # se obtiene la hora real del centro de votacion al que se desea ingresar
	  select 
	    adddate(now(), INTERVAL zh.tiempo HOUR) 
	    into v_fr
	  from elector e inner join locacion l on e.Locacion_id = l.id 
	    inner join centro_votacion cv on l.Centro_Votacion_id = cv.id 
	    inner join zona_horaria zh on cv.Zona_Horaria_id = zh.id 
	  and e.id = v_idElector;
	  # se valida
	  IF v_fr > v_fi AND v_fr < v_ff  THEN
	    select 1 as res;
	  ELSE
	    select 0 as res;
	  END IF;
	else
	  select 0 as res;
	end if;
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_elector_paises"
--

DROP PROCEDURE IF EXISTS `pa_elector_paises`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_elector_paises`(IN v_idProceso int(10))
BEGIN
	
	select distinct p.id, p.nombre  
	from locacion l inner join centro_votacion c 
	on l.Centro_Votacion_id = c.id
	inner join pais p on c.Pais_id = p.id 
	and l.Proceso_Electoral_id = v_idProceso
	order by p.nombre asc;
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_elector_registrar"
--

DROP PROCEDURE IF EXISTS `pa_elector_registrar`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_elector_registrar`(
	IN pid bigint(20), 
	IN plid int(10), 
	IN pnombre varchar(20), 
	IN ppaterno varchar(20), 
	IN pmaterno varchar(20), 
	IN pdni VARCHAR(8),
	IN pemail VARCHAR(50)
)
BEGIN
	if pid = 0 then
	  INSERT INTO elector (id, Locacion_id, nombre, paterno, materno, dni, email, estado)
	  VALUES (NULL, plid, pnombre, ppaterno, pmaterno, pdni, pemail, 'E');
	else
	  update elector set Locacion_id = plid, nombre = pnombre, paterno = ppaterno, 
	  materno = pmaterno, dni = pdni, email = pemail where id = pid;
	end if;
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_elector_validaPIN"
--

DROP PROCEDURE IF EXISTS `pa_elector_validaPIN`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_elector_validaPIN`(IN v_id bigint(20), IN v_pin varchar(32))
BEGIN
	DECLARE v_cuenta int(2);
	SELECT count(1) into v_cuenta from pin where numero = md5(v_pin) and Elector_id = v_id and estado = 'A';
	IF v_cuenta = 1 THEN
		update elector set estado = 'L' where id = v_id;
	END IF;
	select v_cuenta as isvalid;
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_elector_validarDNI"
--

DROP PROCEDURE IF EXISTS `pa_elector_validarDNI`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_elector_validarDNI`(IN v_dni char(8))
BEGIN
	select e.*, cv.pais_id 
	from elector e left join locacion l on l.id = e.locacion_id and e.dni = v_dni  
	inner join centro_votacion cv on cv.id = l.centro_votacion_id;
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_elector_votar"
--

DROP PROCEDURE IF EXISTS `pa_elector_votar`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_elector_votar`(IN v_voto int(10), IN v_id bigint(20), IN v_lid int(10))
BEGIN
	declare v_estado char(1);
	-- generamos transaccion por si ocurre algun error durante el proceso de registro del voto
	START TRANSACTION;
	
	-- verificamos si ya ha votado...
	select estado into v_estado from elector where id = v_id;
	if v_estado = 'V' then
		ROLLBACK;
	else
		-- se inserta el voto de forma encriptada
		INSERT into voto (id, Locacion_id, Opcion_id, fecha_creacion) 
		values (NULL, v_lid, AES_ENCRYPT(v_voto, fa_voto_getAESKey()), now());
		-- se actualiza el estado del elector
		update elector set estado = 'V' where id = v_id;
		-- se leen los datos a mostrar en pantalla
		select 
		  date_format(adddate(now(), INTERVAL zh.tiempo HOUR), "%d / %m / %Y") as fecha, 
		  date_format(adddate(now(), INTERVAL zh.tiempo HOUR), "%H : %i : %s") as hora, 
		  zh.nombre as gmt 
		from elector e inner join locacion l on e.Locacion_id = l.id 
		  inner join centro_votacion cv on l.Centro_Votacion_id = cv.id 
		  inner join zona_horaria zh on cv.Zona_Horaria_id = zh.id 
		and e.id = v_id;
		COMMIT;
	end if;
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_eliminar_voto"
--

DROP PROCEDURE IF EXISTS `pa_eliminar_voto`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_eliminar_voto`(IN codigo INTEGER)
BEGIN
     delete
     from historia_votos 
     where locacion_id=codigo;
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_Escrutinio_Insertar_Voto_Escrutinio"
--

DROP PROCEDURE IF EXISTS `pa_Escrutinio_Insertar_Voto_Escrutinio`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_Escrutinio_Insertar_Voto_Escrutinio`(IN opcion INTEGER,IN locacion INTEGER,IN voto INTEGER)
BEGIN
  declare v_cuantos int(5);
  declare v_cantidad_opciones int(5);
  declare v_locacion_cerrada int(1);

    select count(o.id) into v_cantidad_opciones from proceso_electoral pe
    inner join cedula c on    pe.id=c.proceso_electoral_id
    inner join opcion o on    o.cedula_id=c.id
    where pe.estado='A';

    set v_cantidad_opciones = v_cantidad_opciones + 1;
   
   select count(locacion_id) into v_cuantos from escrutinio where locacion_id=locacion;

   select count(id) into v_locacion_cerrada  from locacion where puesta_cero='S' and id=locacion;

  if (v_locacion_cerrada=1) then
      if v_cuantos < v_cantidad_opciones then
  	    insert into escrutinio
    	    (id,opcion_id,locacion_id,numero)
        	values (null,opcion,locacion,voto);
    	end if;
  end if;
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_Escrutinio_Listar_Escrutinio_Pais_Locacion"
--

DROP PROCEDURE IF EXISTS `pa_Escrutinio_Listar_Escrutinio_Pais_Locacion`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_Escrutinio_Listar_Escrutinio_Pais_Locacion`(IN v_pais INTEGER,IN v_locacion INTEGER)
BEGIN
    
    select p.nombre as pais, cv.nombre, l.id as locacion_id, '0' as opcion_id, e.numero as votos, '0' as blanco
    from pais p
    inner join centro_votacion cv on p.id = cv.pais_id
    inner join locacion l on cv.id = l.centro_votacion_id
    inner join escrutinio e on e.locacion_id = l.id
    inner join proceso_electoral pe on l.proceso_electoral_id = pe.id	
    where p.id = v_pais and 
          e.locacion_id = v_locacion and 
          pe.estado = 'A' and
          opcion_id = 0
    union 
    select p.nombre as pais,cv.nombre,l.id as locacion_id,e.opcion_id
           ,e.numero as votos ,o.candidato_partido_politico_id as blanco
    from pais p
    inner join centro_votacion cv
    on p.id=cv.pais_id
    inner join locacion l
    on cv.id=l.centro_votacion_id
    inner join escrutinio e
    on e.locacion_id=l.id
    inner join opcion o
    on o.id= e.opcion_id
    inner join proceso_electoral pe
    on l.proceso_electoral_id = pe.id	
    where p.id=v_pais
    and e.locacion_id=v_locacion
    and pe.estado='A'
    group by p.nombre,cv.nombre,l.id,e.opcion_id;
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_Escrutinio_Listar_Locaciones"
--

DROP PROCEDURE IF EXISTS `pa_Escrutinio_Listar_Locaciones`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_Escrutinio_Listar_Locaciones`()
BEGIN
	select p.id,p.nombre, count(l.id) as locaciones_aperturadas
	from pais p 
	inner join centro_votacion cv on p.id=cv.pais_id
	inner join locacion l on cv.id=l.centro_votacion_id 
	inner join proceso_electoral pe on pe.id = l.Proceso_Electoral_id 
	where pe.estado = 'A' 
	group by p.id,p.nombre;
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_Escrutinio_Listar_Locaciones_Cerradas"
--

DROP PROCEDURE IF EXISTS `pa_Escrutinio_Listar_Locaciones_Cerradas`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_Escrutinio_Listar_Locaciones_Cerradas`(IN pais INTEGER)
BEGIN
	select  count(distinct(l.id)) as locaciones_cerradas from pais p
	inner join centro_votacion cv
	on p.id=cv.pais_id
	inner join locacion l
	on cv.id=l.centro_votacion_id
	where pais_id=pais
	and l.estado='C'
	and l.puesta_cero='S';
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_Escrutinio_Listar_Locaciones_Escrutinio"
--

DROP PROCEDURE IF EXISTS `pa_Escrutinio_Listar_Locaciones_Escrutinio`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_Escrutinio_Listar_Locaciones_Escrutinio`(IN pais INTEGER)
BEGIN
		select count(*) as conEscrutinio
		from escrutinio es
		inner join locacion lo
		on es.locacion_id = lo.id
		inner join centro_votacion cv
		on lo.centro_votacion_id = cv.id
		inner join pais pa 
		on cv.pais_id = pa.id
		where pa.id=pais;
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_Escrutinio_Listar_Voto_Pais"
--

DROP PROCEDURE IF EXISTS `pa_Escrutinio_Listar_Voto_Pais`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_Escrutinio_Listar_Voto_Pais`(IN v_codigo INTEGER)
BEGIN
   
	select p.nombre as pais, cv.nombre as nombre, l.id as locacion_id
	from pais p inner join centro_votacion cv on p.id = cv.Pais_id and p.id = v_codigo
	inner join locacion l on l.Centro_Votacion_id = cv.id 
	inner join proceso_electoral pe on l.Proceso_Electoral_id = pe.id and pe.estado = 'A';
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_Escrutinio_Listar_Voto_Pais_Locacion"
--

DROP PROCEDURE IF EXISTS `pa_Escrutinio_Listar_Voto_Pais_Locacion`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_Escrutinio_Listar_Voto_Pais_Locacion`(IN v_pais INTEGER, IN v_locacion INTEGER)
BEGIN
	DECLARE v_nombre_pais varchar(60);
	DECLARE v_nombre_cv varchar(50);
	select nombre into v_nombre_pais from pais where id = v_pais;
	select cv.nombre into v_nombre_cv  
	from centro_votacion cv inner join locacion l on cv.id = l.centro_votacion_id 
	and l.id = v_locacion;
	select 
	v_nombre_pais as pais, 
	v_nombre_cv as nombre, 
	v_locacion as locacion_id,
	'0' as opcion_id, 
	0 as blanco, 
	(select count(v.id) from voto v where v.locacion_id = v_locacion 
	and v.opcion_id = AES_ENCRYPT(0, fa_voto_getAESKey())) as votos
	from opcion o limit 0,1
	union
	select 
	v_nombre_pais as pais, 
	v_nombre_cv as nombre, 
	v_locacion as locacion_id,
	o.id as opcion_id, 
	o.candidato_partido_politico_id as blanco, 
	(select count(v.id) from voto v where v.locacion_id = v_locacion 
	and v.opcion_id = AES_ENCRYPT(o.id, fa_voto_getAESKey())) as votos
	from opcion o where o.candidato_partido_politico_id <> 0;
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_fecha_actual"
--

DROP PROCEDURE IF EXISTS `pa_fecha_actual`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_fecha_actual`()
BEGIN
		select  CURRENT_TIMESTAMP;
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_insertar_Voto_Escrutinio"
--

DROP PROCEDURE IF EXISTS `pa_insertar_Voto_Escrutinio`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_insertar_Voto_Escrutinio`(IN opcion INTEGER,IN locacion INTEGER,IN voto INTEGER)
BEGIN
	insert into escrutinio
	(id,opcion_id,locacion_id,numero)
	values (null,opcion,locacion,voto);
	
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_listarLocaciones"
--

DROP PROCEDURE IF EXISTS `pa_listarLocaciones`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_listarLocaciones`()
BEGIN
	select p.id,p.nombre, count(p.id) as locaciones_aperturadas
	from pais p 
	inner join centro_votacion cv on p.id=cv.pais_id
	inner join locacion l on cv.id=l.centro_votacion_id 
	inner join proceso_electoral pe on pe.id = l.Proceso_Electoral_id 
	and pe.estado = 'A' 
	group by p.id,p.nombre;
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_listarLocacionesCerradas"
--

DROP PROCEDURE IF EXISTS `pa_listarLocacionesCerradas`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_listarLocacionesCerradas`(IN pais INTEGER)
BEGIN
	select count(l.id) as locaciones_cerradas from pais p 
	inner join centro_votacion cv
	on p.id=cv.pais_id
	inner join locacion l
	on cv.id=l.centro_votacion_id
	where pais_id=pais
	and l.estado='C';
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_listarLocacionesEscrutinio"
--

DROP PROCEDURE IF EXISTS `pa_listarLocacionesEscrutinio`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_listarLocacionesEscrutinio`(IN pais INTEGER)
BEGIN
		select count(*) as conEscrutinio
		from escrutinio es
		inner join locacion lo
		on es.locacion_id = lo.id
		inner join centro_votacion cv
		on lo.centro_votacion_id = cv.id
		inner join pais pa 
		on cv.pais_id = pa.id
		where pa.id=pais;
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_Listar_Escrutinio_Pais_Locacion"
--

DROP PROCEDURE IF EXISTS `pa_Listar_Escrutinio_Pais_Locacion`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_Listar_Escrutinio_Pais_Locacion`(IN v_pais INTEGER,IN v_locacion INTEGER)
BEGIN
    
select p.nombre as pais,cv.nombre,l.id as locacion_id,e.opcion_id
           ,e.numero as votos ,o.candidato_partido_politico_id as blanco
    from pais p
    inner join centro_votacion cv
    on p.id=cv.pais_id
    inner join locacion l
    on cv.id=l.centro_votacion_id
    inner join escrutinio e
    on e.locacion_id=l.id
    inner join opcion o
    on o.id= e.opcion_id
    where p.id=v_pais
    and e.locacion_id=v_locacion
    group by p.nombre,cv.nombre,l.id,e.opcion_id;
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_Listar_VotoPais"
--

DROP PROCEDURE IF EXISTS `pa_Listar_VotoPais`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_Listar_VotoPais`(IN v_codigo INTEGER)
BEGIN
    select p.nombre as pais,cv.nombre,v.locacion_id
    from pais p
    inner join centro_votacion cv
    on p.id=cv.pais_id
    inner join locacion l
    on cv.id=l.centro_votacion_id
    inner join voto v
    on v.locacion_id=l.id
    inner join opcion o
    on o.id= v.opcion_id
    where p.id=v_codigo
    group by v.locacion_id;
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_Listar_Voto_Pais_Locacion"
--

DROP PROCEDURE IF EXISTS `pa_Listar_Voto_Pais_Locacion`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_Listar_Voto_Pais_Locacion`(IN v_pais INTEGER,IN v_locacion INTEGER)
BEGIN
select p.nombre as pais,cv.nombre,v.locacion_id,v.opcion_id,count(v.opcion_id) as votos
           ,o.candidato_partido_politico_id as blanco
    from pais p
    inner join centro_votacion cv
    on p.id=cv.pais_id
    inner join locacion l
    on cv.id=l.centro_votacion_id
    inner join voto v
    on v.locacion_id=l.id
    inner join opcion o
    on o.id= v.opcion_id
    where p.id=v_pais
    and v.locacion_id=v_locacion
    group by p.nombre,cv.nombre,v.locacion_id,v.opcion_id;
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_LocacionActivaPor_Usuario_PuestaCero_Locacion"
--

DROP PROCEDURE IF EXISTS `pa_LocacionActivaPor_Usuario_PuestaCero_Locacion`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_LocacionActivaPor_Usuario_PuestaCero_Locacion`(IN v_Usuario INTEGER, IN v_PuestaCero CHAR(1), IN 
v_LocID INTEGER)
BEGIN
      select loc.id as codigoLocacion, loc.puesta_cero, loc.fecha_puesta_cero, loc.fecha_cierre,
             pe.descripcion, pe.fecha_votacion, pe.hora_inicial, pe.hora_final,
             cv.nombre as CentroVotacion, pa.nombre as nombrePais, zh.tiempo,
             date_add(date_add(date_add(pe.fecha_votacion, interval hour(pe.hora_inicial) hour), interval minute(pe.hora_inicial) minute), interval zh.tiempo 
hour) as inicioVotacion,
             date_add(date_add(date_add(pe.fecha_votacion, interval hour(pe.hora_final) hour), interval minute(pe.hora_final) minute), interval zh.tiempo 
hour) as finVotacion,
             date_add(current_timestamp, interval zh.tiempo hour) as fechaActual,
             timestampdiff(second, date_add(date_add(date_add(pe.fecha_votacion, interval hour(pe.hora_final) hour), interval minute(pe.hora_final) minute), 
interval zh.tiempo hour), date_add(current_timestamp, interval zh.tiempo hour)) as diferencia
      from operador ope
      inner join locacion loc on loc.id = ope.locacion_id
      inner join proceso_electoral pe on pe.id = loc.proceso_electoral_id
      inner join centro_votacion cv on cv.id = loc.centro_votacion_id
      inner join pais pa on pa.id = cv.pais_id
      inner join zona_horaria zh on zh.id = cv.zona_horaria_id
      where ope.usuario_id = v_Usuario and
            loc.estado = 'A' and
            pe.estado = 'A' and
            loc.puesta_cero = v_PuestaCero and
            loc.id = v_LocID;
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_LocacionesActivasPor_Usuario_PuestaCero"
--

DROP PROCEDURE IF EXISTS `pa_LocacionesActivasPor_Usuario_PuestaCero`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_LocacionesActivasPor_Usuario_PuestaCero`(IN v_Usuario INTEGER, IN v_PuestaCero CHAR(1))
BEGIN
      select loc.id as codigoLocacion, loc.puesta_cero, loc.fecha_puesta_cero, loc.fecha_cierre,
             pe.descripcion, pe.fecha_votacion, pe.hora_inicial, pe.hora_final,
             cv.nombre as CentroVotacion, pa.nombre as nombrePais, zh.tiempo,
             date_add(date_add(date_add(pe.fecha_votacion, interval hour(pe.hora_inicial) hour), interval minute(pe.hora_inicial) minute), interval zh.tiempo 
hour) as inicioVotacion,
             date_add(date_add(date_add(pe.fecha_votacion, interval hour(pe.hora_final) hour), interval minute(pe.hora_final) minute), interval zh.tiempo 
hour) as finVotacion,
             date_add(current_timestamp, interval zh.tiempo hour) as fechaActual,
             timestampdiff(second, date_add(date_add(date_add(pe.fecha_votacion, interval hour(pe.hora_final) hour), interval minute(pe.hora_final) minute), 
interval zh.tiempo hour), date_add(current_timestamp, interval zh.tiempo hour)) as diferencia
      from operador ope
      inner join locacion loc on loc.id = ope.locacion_id
      inner join proceso_electoral pe on pe.id = loc.proceso_electoral_id
      inner join centro_votacion cv on cv.id = loc.centro_votacion_id
      inner join pais pa on pa.id = cv.pais_id
      inner join zona_horaria zh on zh.id = cv.zona_horaria_id
      where ope.usuario_id = v_Usuario and
            loc.estado = 'A' and
            pe.estado = 'A' and
            loc.puesta_cero = v_PuestaCero;
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_Locaciones_Por_Usuario_CerrarVotacion"
--

DROP PROCEDURE IF EXISTS `pa_Locaciones_Por_Usuario_CerrarVotacion`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_Locaciones_Por_Usuario_CerrarVotacion`(IN v_Usuario INTEGER)
BEGIN
    select o.locacion_id as codigo,
           p.nombre as pais,
           cv.nombre as centroVotacion,
           z.tiempo as tiempoGMT,
           convert_tz(now(), '+00:00', concat(if(z.tiempo >= 0, '+', ''), z.tiempo, ':00')) as fechaLocal,
           concat(pe.fecha_votacion, ' ', pe.hora_final) as fechaVotacion,
           (unix_timestamp(concat(pe.fecha_votacion, ' ', pe.hora_final)) -
            unix_timestamp(convert_tz(now(), '+00:00', concat(if(z.tiempo >= 0, '+', ''), z.tiempo, ':00')))) / 60 as diferenciaFin
    from operador o
    inner join locacion l on o.locacion_id = l.id
    inner join centro_votacion cv on l.centro_votacion_id = cv.id
    inner join pais p on p.id = cv.pais_id
    inner join zona_horaria z on cv.zona_horaria_id = z.id
    inner join proceso_electoral pe on pe.id = l.proceso_electoral_id
    where o.usuario_id = v_Usuario and #locaciones por usuario
          pe.estado = 'A' and #proceso electoral activo
          l.estado = 'A' and #locacion activa
          l.puesta_cero = 'S' #puesta a cero si realizado
    order by p.nombre, z.tiempo, cv.nombre; 
  END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_Locaciones_Por_Usuario_Monitoreo"
--

DROP PROCEDURE IF EXISTS `pa_Locaciones_Por_Usuario_Monitoreo`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_Locaciones_Por_Usuario_Monitoreo`(IN v_Usuario INTEGER)
BEGIN
    select o.locacion_id as codigo,
           p.nombre as pais,
           cv.nombre as centroVotacion,
           z.tiempo as tiempoGMT,
           convert_tz(now(), '+00:00', concat(if(z.tiempo >= 0, '+', ''), z.tiempo, ':00')) as fechaLocal,
           concat(pe.fecha_votacion, ' ', pe.hora_inicial) as inicioVotacion,
           concat(pe.fecha_votacion, ' ', pe.hora_final) as finVotacion,
           convert_tz(l.fecha_puesta_cero, '+00:00', concat(if(z.tiempo >= 0, '+', ''), z.tiempo, ':00')) as puestaCero,
           convert_tz(l.fecha_cierre, '+00:00', concat(if(z.tiempo >= 0, '+', ''), z.tiempo, ':00')) as cierre
    from operador o
    inner join locacion l on o.locacion_id = l.id
    inner join centro_votacion cv on l.centro_votacion_id = cv.id
    inner join pais p on p.id = cv.pais_id
    inner join zona_horaria z on cv.zona_horaria_id = z.id
    inner join proceso_electoral pe on pe.id = l.proceso_electoral_id
    where o.usuario_id = v_Usuario and #locaciones por usuario
          pe.estado = 'A' #proceso electoral activo
    order by p.nombre, z.tiempo, cv.nombre; 
  END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_Locaciones_Por_Usuario_PuestaCero"
--

DROP PROCEDURE IF EXISTS `pa_Locaciones_Por_Usuario_PuestaCero`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_Locaciones_Por_Usuario_PuestaCero`(IN v_Usuario INTEGER)
BEGIN
    select o.locacion_id as codigo,
           p.nombre as pais,
           cv.nombre as centroVotacion,
           z.tiempo as tiempoGMT,
           convert_tz(now(), '+00:00', concat(if(z.tiempo >= 0, '+', ''), z.tiempo, ':00')) as fechaLocal,
           concat(pe.fecha_votacion, ' ', pe.hora_inicial) as fechaVotacion,
           (unix_timestamp(concat(pe.fecha_votacion, ' ', pe.hora_inicial)) -
            unix_timestamp(convert_tz(now(), '+00:00', concat(if(z.tiempo >= 0, '+', ''), z.tiempo, ':00')))) / 60 as diferenciaInicio,
           (unix_timestamp(concat(pe.fecha_votacion, ' ', pe.hora_final)) -
            unix_timestamp(convert_tz(now(), '+00:00', concat(if(z.tiempo >= 0, '+', ''), z.tiempo, ':00')))) / 60 as diferenciaInicioFin
    from operador o
    inner join locacion l on o.locacion_id = l.id
    inner join centro_votacion cv on l.centro_votacion_id = cv.id
    inner join pais p on p.id = cv.pais_id
    inner join zona_horaria z on cv.zona_horaria_id = z.id
    inner join proceso_electoral pe on pe.id = l.proceso_electoral_id
    where o.usuario_id = v_Usuario and #locaciones por usuario
          pe.estado = 'A' and #proceso electoral activo
          l.estado = 'A' and #locacion activa
          l.puesta_cero = 'N' #puesta a cero no realizado
    order by p.nombre, z.tiempo, cv.nombre; 
  END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_Locacion_Cerrar"
--

DROP PROCEDURE IF EXISTS `pa_Locacion_Cerrar`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_Locacion_Cerrar`(IN v_Usuario INTEGER, IN v_Locacion INTEGER)
BEGIN
      update locacion
      set estado = 'C',
          fecha_cierre = current_timestamp
      where id = v_Locacion;
      call pa_log_insert(1, v_Usuario);
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_Locacion_CerrarVotacion"
--

DROP PROCEDURE IF EXISTS `pa_Locacion_CerrarVotacion`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_Locacion_CerrarVotacion`(IN v_Usuario INTEGER, IN v_Locacion INTEGER, OUT v_LocacionOK INTEGER)
BEGIN
    update locacion
    set estado = 'C',
        fecha_cierre = current_timestamp
    where id = v_Locacion;
    call pa_log_insert(1, v_Usuario);
    commit;
    select count(*) into v_LocacionOK from locacion where id = v_Locacion and estado = 'C';
  END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_Locacion_Eliminar_Votos"
--

DROP PROCEDURE IF EXISTS `pa_Locacion_Eliminar_Votos`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_Locacion_Eliminar_Votos`(IN v_Usuario INTEGER, IN v_Locacion INTEGER, OUT v_Votos INTEGER)
BEGIN
    DECLARE nro_Votos INTEGER;
    delete 
    from voto
    where locacion_id = v_Locacion;
    delete 
    from escrutinio
    where locacion_id = v_Locacion;
    call pa_log_insert(2, v_Usuario);
    commit;
    select count(*) into nro_Votos from voto where locacion_id = v_Locacion;
    SET v_Votos = nro_Votos;
    
    select count(*) into v_Votos from escrutinio where locacion_id = v_Locacion;
    SET v_Votos = v_Votos + nro_Votos;
  END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_Locacion_Monitoreo"
--

DROP PROCEDURE IF EXISTS `pa_Locacion_Monitoreo`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_Locacion_Monitoreo`(IN v_Locacion INTEGER, OUT v_Electores INTEGER, OUT v_Voto INTEGER)
BEGIN
    # Total de Electores Virtuales
    select count(*) into v_Voto 
    from voto 
    where locacion_id = v_Locacion;
    # Total de Electores Virtuales
    select count(*) into v_Electores 
    from elector 
    where locacion_id = v_Locacion and 
          estado <> 'E';
  END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_Locacion_Por_Usuario_CerrarVotacion"
--

DROP PROCEDURE IF EXISTS `pa_Locacion_Por_Usuario_CerrarVotacion`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_Locacion_Por_Usuario_CerrarVotacion`(IN v_Usuario INTEGER, IN v_Locacion INTEGER)
BEGIN
    select o.locacion_id as codigo,
           p.nombre as pais,
           cv.nombre as centroVotacion,
           z.tiempo as tiempoGMT,
           convert_tz(now(), '+00:00', concat(if(z.tiempo >= 0, '+', ''), z.tiempo, ':00')) as fechaLocal,
           concat(pe.fecha_votacion, ' ', pe.hora_final) as fechaVotacion,
           (unix_timestamp(concat(pe.fecha_votacion, ' ', pe.hora_final)) -
            unix_timestamp(convert_tz(now(), '+00:00', concat(if(z.tiempo >= 0, '+', ''), z.tiempo, ':00')))) / 60 as diferenciaFin
    from operador o
    inner join locacion l on o.locacion_id = l.id
    inner join centro_votacion cv on l.centro_votacion_id = cv.id
    inner join pais p on p.id = cv.pais_id
    inner join zona_horaria z on cv.zona_horaria_id = z.id
    inner join proceso_electoral pe on pe.id = l.proceso_electoral_id
    where o.locacion_id = v_Locacion and #locacion
          o.usuario_id = v_Usuario and #locacion por usuario
          pe.estado = 'A' and #proceso electoral activo
          l.estado = 'A' and #locacion activa
          l.puesta_cero = 'S' #puesta a cero si realizado
    order by p.nombre, z.tiempo, cv.nombre; 
  END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_Locacion_Por_Usuario_PuestaCero"
--

DROP PROCEDURE IF EXISTS `pa_Locacion_Por_Usuario_PuestaCero`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_Locacion_Por_Usuario_PuestaCero`(IN v_Usuario INTEGER, IN v_Locacion INTEGER)
BEGIN
    select o.locacion_id as codigo,
           p.nombre as pais,
           cv.nombre as centroVotacion,
           z.tiempo as tiempoGMT,
           convert_tz(now(), '+00:00', concat(if(z.tiempo >= 0, '+', ''), z.tiempo, ':00')) as fechaLocal,
           concat(pe.fecha_votacion, ' ', pe.hora_inicial) as fechaVotacion,
           (unix_timestamp(concat(pe.fecha_votacion, ' ', pe.hora_inicial)) -
            unix_timestamp(convert_tz(now(), '+00:00', concat(if(z.tiempo >= 0, '+', ''), z.tiempo, ':00')))) / 60 as diferenciaInicio,
           (unix_timestamp(concat(pe.fecha_votacion, ' ', pe.hora_final)) -
            unix_timestamp(convert_tz(now(), '+00:00', concat(if(z.tiempo >= 0, '+', ''), z.tiempo, ':00')))) / 60 as diferenciaInicioFin
    from operador o
    inner join locacion l on o.locacion_id = l.id
    inner join centro_votacion cv on l.centro_votacion_id = cv.id
    inner join pais p on p.id = cv.pais_id
    inner join zona_horaria z on cv.zona_horaria_id = z.id
    inner join proceso_electoral pe on pe.id = l.proceso_electoral_id
    where o.locacion_id = v_Locacion and #locacion
          o.usuario_id = v_Usuario and #locacion por usuario
          pe.estado = 'A' and #proceso electoral activo
          l.estado = 'A' and #locacion activa
          l.puesta_cero = 'N' #puesta a cero no realizado
    order by p.nombre, z.tiempo, cv.nombre; 
  END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_Locacion_PuestaCero"
--

DROP PROCEDURE IF EXISTS `pa_Locacion_PuestaCero`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_Locacion_PuestaCero`(IN v_Usuario INTEGER, IN v_Locacion INTEGER, OUT v_LocacionOK INTEGER)
BEGIN
    DECLARE nro_Votos INTEGER;
    update locacion 
    set puesta_cero = 'S',
        fecha_puesta_cero = CURRENT_TIMESTAMP
    where id = v_Locacion and
          estado = 'A';
    call pa_log_insert(3, v_Usuario);
    commit;
    select count(*) into v_LocacionOK 
    from locacion 
    where id = v_Locacion and
          puesta_cero = 'S' and
          estado = 'A';
  END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_locacion_select"
--

DROP PROCEDURE IF EXISTS `pa_locacion_select`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_locacion_select`(IN v_codigo INT)
BEGIN
    select o.locacion_id,
           cv.nombre,
           z.tiempo,
           convert_tz(now(), '+00:00', concat(z.tiempo, ':00')) as fechaLocal,
           concat(pe.fecha_votacion, ' ', pe.hora_inicial) as fechaVotacion,
           (unix_timestamp(concat(pe.fecha_votacion, ' ', pe.hora_inicial)) - unix_timestamp(convert_tz(now(), '+00:00', concat(z.tiempo, ':00')))) / 60 as diferencia
    from operador o
    inner join locacion l on o.locacion_id = l.id
    inner join centro_votacion cv on l.centro_votacion_id = cv.id
    inner join zona_horaria z on cv.zona_horaria_id = z.id
    inner join proceso_electoral pe on pe.id = l.proceso_electoral_id
    where o.usuario_id = v_codigo and #locaciones por usuario
          pe.estado = 'A' and #proceso electoral activo
          l.estado = 'A' and #locacion activa
          l.puesta_cero = 'N'; #puesta a cero no realizado
    #select o.usuario_id, o.locacion_id, l.centro_votacion_id, l.puesta_cero,     l.estado,
    #       l.fecha_puesta_cero,         l.fecha_cierre,       cv.nombre,         z.tiempo,
    #       z.nombre,                    pe.estado,            pe.fecha_votacion, pe.hora_inicial,
    #       pe.hora_final
    #from operador o
    #inner join locacion l on o.locacion_id = l.id
    #inner join centro_votacion cv on l.centro_votacion_id = cv.id
    #inner join zona_horaria z on cv.zona_horaria_id = z.id
    #inner join proceso_electoral pe on pe.id = l.proceso_electoral_id
    #where o.usuario_id = v_codigo and #locaciones por usuario
    #      pe.estado = 'A' #proceso electoral activo
    #      l.estado = 'A' #locacion activa
  END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_log_insert"
--

DROP PROCEDURE IF EXISTS `pa_log_insert`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_log_insert`(IN v_diccionario integer, IN v_usuario integer)
BEGIN
      DECLARE codigo INTEGER;
      SELECT IFNULL(MAX(id), 0) into codigo from log_usuario;
      SET codigo = codigo + 1;
      INSERT INTO log_usuario (id, diccionario_log_id, usuario_id, fecha)
      VALUES (codigo, v_diccionario, v_usuario, CURRENT_TIMESTAMP );
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_pais_delete"
--

DROP PROCEDURE IF EXISTS `pa_pais_delete`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_pais_delete`(IN v_Codigo INTEGER)
BEGIN
    UPDATE pais
    SET estado = 'I'
    WHERE id = v_Codigo;
  END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_pais_edit"
--

DROP PROCEDURE IF EXISTS `pa_pais_edit`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_pais_edit`(IN v_codigo INTEGER, IN v_nombre VARCHAR(60), IN v_abreviatura CHAR(2))
BEGIN
    UPDATE pais
    SET nombre = v_nombre, 
        abreviatura = v_abreviatura
    WHERE id = v_codigo;
  END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_pais_findAll"
--

DROP PROCEDURE IF EXISTS `pa_pais_findAll`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_pais_findAll`()
BEGIN
    SELECT id,
           nombre,
           abreviatura,
           estado
    FROM pais
    WHERE estado = 'A'
    ORDER BY nombre;
  END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_pais_findAll_Locacion"
--

DROP PROCEDURE IF EXISTS `pa_pais_findAll_Locacion`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_pais_findAll_Locacion`(IN v_ProcesoElectoral INTEGER)
BEGIN
    SELECT id,
           nombre,
           abreviatura,
           estado
    FROM pais
    WHERE estado = 'A' AND
          id IN (SELECT pais_id
                 FROM centro_votacion 
                 WHERE estado = 'A' AND
                       id IN (SELECT centro_votacion_id 
                              FROM locacion 
                              WHERE proceso_electoral_id = v_ProcesoElectoral AND
                                    estado = 'A'
                             )
                )
    ORDER BY nombre;
  END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_pais_findByAbreviatura"
--

DROP PROCEDURE IF EXISTS `pa_pais_findByAbreviatura`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_pais_findByAbreviatura`(IN v_abreviatura VARCHAR(50), OUT v_Total INTEGER)
BEGIN
    select count(abreviatura) into v_Total 
    from pais 
    where abreviatura = v_abreviatura and
          estado = 'A';
  END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_pais_findByAbreviatura_ID"
--

DROP PROCEDURE IF EXISTS `pa_pais_findByAbreviatura_ID`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_pais_findByAbreviatura_ID`(IN v_abreviatura VARCHAR(50), IN v_Codigo INTEGER, OUT v_Total INTEGER)
BEGIN
    select count(abreviatura) into v_Total 
    from pais 
    where abreviatura = v_abreviatura and
          estado = 'A' and
          id <> v_Codigo;
  END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_pais_findByName"
--

DROP PROCEDURE IF EXISTS `pa_pais_findByName`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_pais_findByName`(IN v_Nombre VARCHAR(50), OUT v_Total INTEGER)
BEGIN
    select count(nombre) into v_Total 
    from pais 
    where nombre = v_Nombre and
          estado = 'A';
  END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_pais_findByName_ID"
--

DROP PROCEDURE IF EXISTS `pa_pais_findByName_ID`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_pais_findByName_ID`(IN v_Nombre VARCHAR(50), IN v_Codigo INTEGER, OUT v_Total INTEGER)
BEGIN
    select count(nombre) into v_Total 
    from pais 
    where nombre = v_Nombre and
          estado = 'A' and
          id <> v_Codigo;
  END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_pais_findByPrimaryKey"
--

DROP PROCEDURE IF EXISTS `pa_pais_findByPrimaryKey`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_pais_findByPrimaryKey`(IN v_codigo INTEGER)
BEGIN
    SELECT id, nombre, abreviatura, estado
    FROM pais
    WHERE id = v_codigo;
  END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_pais_insert"
--

DROP PROCEDURE IF EXISTS `pa_pais_insert`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_pais_insert`(IN v_nombre VARCHAR(60), IN v_abreviatura CHAR(2))
BEGIN
    DECLARE v_codigo INTEGER;
    SELECT IFNULL(MAX(id), 0) into v_codigo from pais;
    SET v_codigo = v_codigo + 1;
    INSERT INTO pais (id, nombre, abreviatura, estado)
    VALUES (v_codigo, v_nombre, v_abreviatura, 'A');
  END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_partidoPolitico_CandidatosAsignados"
--

DROP PROCEDURE IF EXISTS `pa_partidoPolitico_CandidatosAsignados`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_partidoPolitico_CandidatosAsignados`(IN v_PartidoPoliticoID INTEGER)
BEGIN
	select ifnull(Candidato_id, 0) as Candidato
        from candidato_partido_politico 
        where Partido_Politico_id = v_PartidoPoliticoID and
              estado = 'A';
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_partidoPolitico_conCandidato"
--

DROP PROCEDURE IF EXISTS `pa_partidoPolitico_conCandidato`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_partidoPolitico_conCandidato`(IN v_codigo integer)
BEGIN
      SELECT id, nombre, paterno, materno, dni, foto, estado
      FROM candidato
      WHERE id in (select candidato_id 
                   from candidato_partido_politico cpp
                   where cpp.partido_politico_id = v_codigo 
		   and cpp.estado = 'A'
                  ) and
            id <> 0 and
            estado = 'A';
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_partidoPolitico_delete"
--

DROP PROCEDURE IF EXISTS `pa_partidoPolitico_delete`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_partidoPolitico_delete`(IN codigo INTEGER)
BEGIN
      UPDATE partido_politico
      SET estado = 'I'
      WHERE id = codigo;
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_partidoPolitico_edit"
--

DROP PROCEDURE IF EXISTS `pa_partidoPolitico_edit`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_partidoPolitico_edit`(IN codigo INTEGER, IN v_nombre VARCHAR(40), IN v_abreviatura VARCHAR(10), IN v_logo VARCHAR(36))
BEGIN
      declare nombr varchar(30);
      if v_logo ='' then 
	select '' into nombr;
	UPDATE PARTIDO_POLITICO
	SET nombre = v_nombre, abreviatura = v_abreviatura
	WHERE id = codigo;
      else
        select concat('partido',codigo,'.',v_logo) into nombr;
	UPDATE PARTIDO_POLITICO
	SET nombre = v_nombre, abreviatura = v_abreviatura, logo=nombr
	WHERE id = codigo;
      end if;
      select nombr;
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_partidoPolitico_findAll"
--

DROP PROCEDURE IF EXISTS `pa_partidoPolitico_findAll`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_partidoPolitico_findAll`()
BEGIN
      SELECT id,
             nombre,
             abreviatura,
	     logo,	
             estado
      FROM partido_politico
      WHERE estado = 'A'
      and id<>0;
       
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_partidoPolitico_findByPrimaryKey"
--

DROP PROCEDURE IF EXISTS `pa_partidoPolitico_findByPrimaryKey`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_partidoPolitico_findByPrimaryKey`(IN codigo integer)
BEGIN
      SELECT id, nombre, abreviatura, logo,estado
      FROM partido_politico
      WHERE id = codigo;
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_partidoPolitico_insert"
--

DROP PROCEDURE IF EXISTS `pa_partidoPolitico_insert`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_partidoPolitico_insert`(IN v_nombre VARCHAR(40), IN v_abreviatura VARCHAR(10), IN v_logo VARCHAR(36))
BEGIN
      DECLARE codigo INTEGER;
      DECLARE nombre VARCHAR(30);
      SELECT IFNULL(MAX(id), 0) into codigo from partido_politico;
      SET codigo = codigo + 1;
      select concat('partido',codigo,'.',v_logo) into nombre;
      INSERT INTO partido_politico (id, nombre, abreviatura, logo, estado)
      VALUES (codigo, v_nombre, v_abreviatura,	nombre, 'A');
      select nombre;
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_partidoPolitico_sinCandidato"
--

DROP PROCEDURE IF EXISTS `pa_partidoPolitico_sinCandidato`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_partidoPolitico_sinCandidato`(IN v_codigo integer)
BEGIN
      SELECT id, nombre, paterno, materno, dni, foto, estado
      FROM candidato
      WHERE id not in (select candidato_id 
                       from candidato_partido_politico cpp
                       where cpp.estado = 'A'
                      ) and
            id <> 0 and
            estado = 'A';
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_perfil_delete"
--

DROP PROCEDURE IF EXISTS `pa_perfil_delete`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_perfil_delete`(IN v_Codigo INTEGER)
BEGIN
      UPDATE perfil
      SET estado = 'I'
      WHERE id = v_Codigo;
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_perfil_edit"
--

DROP PROCEDURE IF EXISTS `pa_perfil_edit`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_perfil_edit`(IN codigo INTEGER, IN v_nombre VARCHAR(50), IN v_descripcion VARCHAR(100))
BEGIN
      UPDATE perfil
      SET nombre = v_nombre, descripcion = v_descripcion
      WHERE id = codigo;
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_perfil_findAll"
--

DROP PROCEDURE IF EXISTS `pa_perfil_findAll`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_perfil_findAll`()
BEGIN
    SELECT id,
           nombre,
           descripcion,
           estado
    FROM perfil
    WHERE estado = 'A';
  END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_perfil_findByName"
--

DROP PROCEDURE IF EXISTS `pa_perfil_findByName`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_perfil_findByName`(IN v_Nombre VARCHAR(50), OUT v_Total INTEGER)
BEGIN
    select count(nombre) into v_Total 
    from perfil 
    where nombre = v_Nombre and
          estado = 'A';
  END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_perfil_findByName_ID"
--

DROP PROCEDURE IF EXISTS `pa_perfil_findByName_ID`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_perfil_findByName_ID`(IN v_Nombre VARCHAR(50), IN v_Codigo INTEGER, OUT v_Total INTEGER)
BEGIN
    select count(nombre) into v_Total 
    from perfil 
    where nombre = v_Nombre and
          estado = 'A' and
          id <> v_Codigo;
  END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_perfil_findByPrimaryKey"
--

DROP PROCEDURE IF EXISTS `pa_perfil_findByPrimaryKey`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_perfil_findByPrimaryKey`(IN v_codigo INTEGER)
BEGIN
    SELECT id, nombre, descripcion, estado
    FROM perfil
    WHERE id = v_codigo;
  END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_perfil_insert"
--

DROP PROCEDURE IF EXISTS `pa_perfil_insert`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_perfil_insert`(IN v_nombre VARCHAR(50), IN v_descripcion VARCHAR(100))
BEGIN
      DECLARE codigo INTEGER;
      SELECT IFNULL(MAX(id), 0) into codigo from perfil;
      SET codigo = codigo + 1;
      INSERT INTO perfil (id, nombre, descripcion, estado)
      VALUES (codigo, v_nombre, v_descripcion, 'A');
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_procesoElectoralCerrado"
--

DROP PROCEDURE IF EXISTS `pa_procesoElectoralCerrado`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_procesoElectoralCerrado`()
BEGIN
	select * from proceso_electoral where estado='A';
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_proceso_electoral_activar"
--

DROP PROCEDURE IF EXISTS `pa_proceso_electoral_activar`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_proceso_electoral_activar`(IN CODIGO INTEGER)
BEGIN
update proceso_electoral set estado='A'
where id = CODIGO and estado <> 'A';
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_proceso_electoral_anular"
--

DROP PROCEDURE IF EXISTS `pa_proceso_electoral_anular`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_proceso_electoral_anular`(IN CODIGO INTEGER)
BEGIN
update proceso_electoral set estado='X'
where id=CODIGO and estado<>'X';
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_proceso_electoral_editar"
--

DROP PROCEDURE IF EXISTS `pa_proceso_electoral_editar`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_proceso_electoral_editar`(in codigo integer,in vusuario_id integer,in vdescripcion varchar(50),in vfecha_votacion varchar
(10),in vhora_inicial varchar(8),in vhora_final varchar(8),in vfecha_padron_inicial varchar(10),in vfecha_padron_final varchar(10),in vtiempo_sesion integer)
BEGIN
	update  proceso_electoral set
		Usuario_id=vusuario_id,
	        descripcion=vdescripcion,
		fecha_votacion=vfecha_votacion,
		hora_inicial=vhora_inicial,
		hora_final=vhora_final,
		fecha_padron_inicial=vfecha_padron_inicial,
		fecha_padron_final=vfecha_padron_final,
		tiempo_sesion=vtiempo_sesion
	where id=codigo;
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_proceso_electoral_findAll_Creado"
--

DROP PROCEDURE IF EXISTS `pa_proceso_electoral_findAll_Creado`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_proceso_electoral_findAll_Creado`()
BEGIN
    select p.id,
           concat(u.paterno,' ',u.materno,', ',u.nombre) as usuario_id,
           p.descripcion,
           p.fecha_votacion,
           p.hora_inicial,
           p.hora_final,
           p.fecha_padron_inicial,
           p.fecha_padron_final,
           p.estado,
           p.tiempo_sesion,
           hour(p.hora_inicial) as h_i,
           minute(p.hora_inicial) as m_i,
           hour(p.hora_final) as h_f,
           minute(p.hora_final) as m_f 
    from proceso_electoral p 
    inner join usuario u on p.usuario_id = u.id
    where p.estado = 'C'
    order by p.id desc;
  END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_proceso_electoral_findByKey"
--

DROP PROCEDURE IF EXISTS `pa_proceso_electoral_findByKey`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_proceso_electoral_findByKey`(IN CODIGO INTEGER)
BEGIN
	select *,hour(hora_inicial) as h_i,minute(hora_inicial) as m_i,hour(hora_final) as h_f,minute(hora_final) as m_f from proceso_electoral where id=CODIGO;
   END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_proceso_electoral_insertar"
--

DROP PROCEDURE IF EXISTS `pa_proceso_electoral_insertar`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_proceso_electoral_insertar`(in usuario integer,in descripcion varchar(50),in fecha_votacion varchar
(10),in hora_inicial varchar(8),in hora_final varchar(8),in fecha_padron_inicial varchar(10),fecha_padron_final varchar(10),in tiempo_sesion INTEGER)
BEGIN
DECLARE codigo INTEGER;
      SELECT IFNULL(MAX(id), 0) into codigo from proceso_electoral;
      SET codigo = codigo + 1;
insert into proceso_electoral 
(id,Usuario_id,descripcion,fecha_votacion,hora_inicial,hora_final,
fecha_padron_inicial,fecha_padron_final,estado,tiempo_sesion)
values(codigo,usuario,descripcion,fecha_votacion,hora_inicial,hora_final,fecha_padron_inicial,fecha_padron_final,'C',tiempo_sesion);
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_proceso_electoral_select"
--

DROP PROCEDURE IF EXISTS `pa_proceso_electoral_select`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_proceso_electoral_select`()
BEGIN
select p.id,concat(u.paterno,' ',u.materno,', ',u.nombre) as usuario_id,p.descripcion,p.fecha_votacion,p.hora_inicial,p.hora_final,
p.fecha_padron_inicial,p.fecha_padron_final,p.estado,p.tiempo_sesion,hour(p.hora_inicial) as h_i,minute(p.hora_inicial) as m_i,hour(p.hora_final) as h_f,minute(p.hora_final) as m_f 
from proceso_electoral p 
inner join usuario u
on p.usuario_id=u.id
order by p.id desc;
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_usuario_asignar"
--

DROP PROCEDURE IF EXISTS `pa_usuario_asignar`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_usuario_asignar`(IN v_procesoelectoral INTEGER, IN v_user INTEGER, IN v_centrovotacion INTEGER)
BEGIN
    declare v_existe INTEGER;
    DECLARE v_Locacion INTEGER;
    select id into v_Locacion
    from locacion
    where proceso_electoral_id = v_procesoelectoral and
          centro_votacion_id = v_centrovotacion;
    select count(1) into v_existe
    from operador
    where locacion_id = v_Locacion and
          usuario_id = v_user;
    if v_existe = 0 then
      insert into operador (usuario_id, locacion_id, estado)
      values (v_user, v_Locacion, 'A');
    else
      update operador
      set estado = 'A'
      where locacion_id = v_Locacion and
            usuario_id = v_user;
    end if;
  END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_usuario_delete"
--

DROP PROCEDURE IF EXISTS `pa_usuario_delete`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_usuario_delete`(IN v_Codigo INTEGER)
BEGIN
    UPDATE usuario
    SET estado = 'I'
    WHERE id = v_Codigo;
  END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_usuario_edit"
--

DROP PROCEDURE IF EXISTS `pa_usuario_edit`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_usuario_edit`(IN v_codigo INTEGER, IN v_perfil INTEGER, IN v_nombre VARCHAR(20), IN v_paterno VARCHAR(20), IN v_materno VARCHAR(20), IN v_dni CHAR(8), IN v_email VARCHAR(50), IN v_movil VARCHAR(15), IN v_username VARCHAR(10), IN v_password VARCHAR(32))
BEGIN
    UPDATE usuario
    SET perfil_id = v_perfil,
        nombre = v_nombre, 
        paterno = v_paterno, 
        materno = v_materno, 
        dni = v_dni, 
        email = v_email, 
        movil = v_movil, 
        username = v_username, 
        passwd = v_password
    WHERE id = v_codigo;
  END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_usuario_findAll"
--

DROP PROCEDURE IF EXISTS `pa_usuario_findAll`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_usuario_findAll`()
BEGIN
      select u.id as usuarioID, u.perfil_id, u.nombre as usuarioNombre, u.paterno, u.materno, 
             u.dni, u.email, u.movil, u.username, u.passwd, u. estado as usuarioEstado,
             p.id as perfilID, p.nombre as perfilNombre, p.descripcion, p.estado as perfilEstado
      from usuario u
      inner join perfil p on p.id = u.perfil_id
      where u.estado = 'A';
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_usuario_findAll_Locacion"
--

DROP PROCEDURE IF EXISTS `pa_usuario_findAll_Locacion`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_usuario_findAll_Locacion`()
BEGIN
      select u.id as usuarioID, u.perfil_id, u.nombre as usuarioNombre, u.paterno, u.materno, 
             u.dni, u.email, u.movil, u.username, u.passwd, u. estado as usuarioEstado,
             p.id as perfilID, p.nombre as perfilNombre, p.descripcion, p.estado as perfilEstado
      from usuario u
      inner join perfil p on p.id = u.perfil_id
      where u.estado = 'A' and
            p.id = 3;
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_usuario_findByDNI"
--

DROP PROCEDURE IF EXISTS `pa_usuario_findByDNI`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_usuario_findByDNI`(IN v_DNI CHAR(8), OUT v_Total INTEGER)
BEGIN
    select count(dni) into v_Total 
    from usuario 
    where dni = v_DNI and
          estado = 'A';
  END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_usuario_findByDNI_ID"
--

DROP PROCEDURE IF EXISTS `pa_usuario_findByDNI_ID`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_usuario_findByDNI_ID`(IN v_DNI CHAR(8), IN v_Codigo INTEGER, OUT v_Total INTEGER)
BEGIN
    select count(dni) into v_Total 
    from usuario 
    where dni = v_DNI and
          estado = 'A' and
          id <> v_Codigo;
  END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_usuario_findByPrimaryKey"
--

DROP PROCEDURE IF EXISTS `pa_usuario_findByPrimaryKey`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_usuario_findByPrimaryKey`(IN v_codigo INTEGER)
BEGIN
    select u.id as usuarioID, u.perfil_id, u.nombre as usuarioNombre, u.paterno, u.materno, 
             u.dni, u.email, u.movil, u.username, u.passwd, u. estado as usuarioEstado,
             p.id as perfilID, p.nombre as perfilNombre, p.descripcion, p.estado as perfilEstado
      from usuario u
      inner join perfil p on p.id = u.perfil_id
      where u.id = v_codigo;
  END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_usuario_findByUser"
--

DROP PROCEDURE IF EXISTS `pa_usuario_findByUser`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_usuario_findByUser`(IN usuario VARCHAR(20))
BEGIN
      select u.id as usuarioID, u.perfil_id, u.nombre as usuarioNombre, u.paterno, u.materno, 
             u.dni, u.email, u.movil, u.username, u.passwd, u.estado as usuarioEstado,
             p.id as perfilID, p.nombre as perfilNombre, p.descripcion, p.estado as perfilEstado
      from usuario u
      inner join perfil p on p.id = u.perfil_id
      where u.estado = 'A' and
            u.username = usuario;
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_usuario_findByUserName"
--

DROP PROCEDURE IF EXISTS `pa_usuario_findByUserName`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_usuario_findByUserName`(IN v_UserName CHAR(8), OUT v_Total INTEGER)
BEGIN
    select count(username) into v_Total 
    from usuario 
    where username = v_UserName and
          estado = 'A';
  END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_usuario_findByUserName_ID"
--

DROP PROCEDURE IF EXISTS `pa_usuario_findByUserName_ID`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_usuario_findByUserName_ID`(IN v_UserName CHAR(8), IN v_Codigo INTEGER, OUT v_Total INTEGER)
BEGIN
    select count(username) into v_Total 
    from usuario 
    where username = v_UserName and
          estado = 'A' and
          id <> v_Codigo;
  END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_usuario_insert"
--

DROP PROCEDURE IF EXISTS `pa_usuario_insert`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_usuario_insert`(IN v_perfil INTEGER, IN v_nombre VARCHAR(20), IN v_paterno VARCHAR(20), IN v_materno VARCHAR(20), IN v_dni CHAR(8), IN v_email VARCHAR(50), IN v_movil VARCHAR(15), IN v_username VARCHAR(10), IN v_password VARCHAR(32))
BEGIN
      DECLARE v_codigo INTEGER;
      SELECT IFNULL(MAX(id), 0) into v_codigo from usuario;
      SET v_codigo = v_codigo + 1;
      INSERT INTO usuario (id, perfil_id, nombre, paterno, materno, dni, email, movil, username, passwd, estado)
      VALUES (v_codigo, v_perfil, v_nombre, v_paterno, v_materno, v_dni, v_email, v_movil, v_username, v_password, 'A');
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_usuario_retirar"
--

DROP PROCEDURE IF EXISTS `pa_usuario_retirar`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_usuario_retirar`(IN v_procesoelectoral INTEGER, IN v_user INTEGER, IN v_centrovotacion INTEGER)
BEGIN
    DECLARE v_Locacion INTEGER;
    select id into v_Locacion
    from locacion
    where proceso_electoral_id = v_procesoelectoral and
          centro_votacion_id = v_centrovotacion;
    update operador
    set estado = 'I'
    where locacion_id = v_Locacion and
          usuario_id = v_user;
  END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "pa_zonahoraria_findAll"
--

DROP PROCEDURE IF EXISTS `pa_zonahoraria_findAll`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_zonahoraria_findAll`()
BEGIN
    SELECT id,
           tiempo,
           nombre,
           estado
    FROM zona_horaria
    WHERE estado = 'A'
    ORDER BY tiempo;
  END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
