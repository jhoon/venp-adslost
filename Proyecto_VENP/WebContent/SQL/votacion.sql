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
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO,MYSQL323' */;


--
-- Create schema votacion
--

CREATE DATABASE IF NOT EXISTS votacion;
USE votacion;

--
-- Definition of table `candidato`
--

DROP TABLE IF EXISTS `candidato`;
CREATE TABLE `candidato` (
  `id` int(10) unsigned NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `paterno` varchar(30) NOT NULL,
  `materno` varchar(30) NOT NULL,
  `dni` char(8) NOT NULL,
  `foto` varchar(36) NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY  (`id`)
) TYPE=InnoDB;

--
-- Dumping data for table `candidato`
--

/*!40000 ALTER TABLE `candidato` DISABLE KEYS */;
INSERT INTO `candidato` (`id`,`nombre`,`paterno`,`materno`,`dni`,`foto`,`estado`) VALUES 
  (0,'','','','','nothing.gif','A');
INSERT INTO `candidato` (`id`,`nombre`,`paterno`,`materno`,`dni`,`foto`,`estado`) VALUES 
  (1,'Juan','Perez','Pinto','41723412','candidato1.jpg','A');
INSERT INTO `candidato` (`id`,`nombre`,`paterno`,`materno`,`dni`,`foto`,`estado`) VALUES 
  (2,'Laura','Loca','Paliza','34679213','candidato2.jpg','A');
/*!40000 ALTER TABLE `candidato` ENABLE KEYS */;


--
-- Definition of table `candidato_partido_politico`
--

DROP TABLE IF EXISTS `candidato_partido_politico`;
CREATE TABLE `candidato_partido_politico` (
  `id` int(10) unsigned NOT NULL,
  `Partido_Politico_id` int(10) unsigned NOT NULL,
  `Candidato_id` int(10) unsigned NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_Candidato` (`Candidato_id`),
  KEY `fk_Partido_Politico` (`Partido_Politico_id`),
  CONSTRAINT `candidato_partido_politico_ibfk_1` FOREIGN KEY (`Candidato_id`) REFERENCES `candidato` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `candidato_partido_politico_ibfk_2` FOREIGN KEY (`Partido_Politico_id`) REFERENCES `partido_politico` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) TYPE=InnoDB;

--
-- Dumping data for table `candidato_partido_politico`
--

/*!40000 ALTER TABLE `candidato_partido_politico` DISABLE KEYS */;
INSERT INTO `candidato_partido_politico` (`id`,`Partido_Politico_id`,`Candidato_id`,`fecha_creacion`,`fecha_modificacion`,`estado`) VALUES 
  (0,0,0,'2009-01-07 00:01:33','2009-01-07 00:01:33','A');
INSERT INTO `candidato_partido_politico` (`id`,`Partido_Politico_id`,`Candidato_id`,`fecha_creacion`,`fecha_modificacion`,`estado`) VALUES 
  (1,1,1,'2009-01-07 00:01:33','2009-01-07 00:01:33','A');
INSERT INTO `candidato_partido_politico` (`id`,`Partido_Politico_id`,`Candidato_id`,`fecha_creacion`,`fecha_modificacion`,`estado`) VALUES 
  (2,2,2,'2009-01-07 00:01:33','2009-01-07 00:01:33','A');
/*!40000 ALTER TABLE `candidato_partido_politico` ENABLE KEYS */;


--
-- Definition of table `cedula`
--

DROP TABLE IF EXISTS `cedula`;
CREATE TABLE `cedula` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `Proceso_Electoral_id` int(10) unsigned NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `estado` char(1) NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_Proceso_Electoral` (`Proceso_Electoral_id`),
  CONSTRAINT `cedula_ibfk_1` FOREIGN KEY (`Proceso_Electoral_id`) REFERENCES `proceso_electoral` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) TYPE=InnoDB AUTO_INCREMENT=2;

--
-- Dumping data for table `cedula`
--

/*!40000 ALTER TABLE `cedula` DISABLE KEYS */;
INSERT INTO `cedula` (`id`,`Proceso_Electoral_id`,`tipo`,`estado`,`fecha_creacion`,`fecha_modificacion`) VALUES 
  (1,1,'P','A','2009-01-07 00:01:33','2009-01-07 00:01:33');
/*!40000 ALTER TABLE `cedula` ENABLE KEYS */;


--
-- Definition of table `centro_votacion`
--

DROP TABLE IF EXISTS `centro_votacion`;
CREATE TABLE `centro_votacion` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `Pais_id` int(10) unsigned NOT NULL,
  `Zona_Horaria_id` int(10) unsigned NOT NULL,
  `codigo_postal` varchar(10) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `region` varchar(50) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_Centro_Votacion` (`Zona_Horaria_id`),
  KEY `Centro_Votacion_FKIndex2` (`Pais_id`),
  CONSTRAINT `centro_votacion_ibfk_1` FOREIGN KEY (`Zona_Horaria_id`) REFERENCES `zona_horaria` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `centro_votacion_ibfk_2` FOREIGN KEY (`Pais_id`) REFERENCES `pais` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) TYPE=InnoDB AUTO_INCREMENT=14;

--
-- Dumping data for table `centro_votacion`
--

/*!40000 ALTER TABLE `centro_votacion` DISABLE KEYS */;
INSERT INTO `centro_votacion` (`id`,`Pais_id`,`Zona_Horaria_id`,`codigo_postal`,`nombre`,`region`,`direccion`,`estado`) VALUES 
  (1,1,13,'12314','Consulado de Argentina','abcd','asdfr','A');
INSERT INTO `centro_votacion` (`id`,`Pais_id`,`Zona_Horaria_id`,`codigo_postal`,`nombre`,`region`,`direccion`,`estado`) VALUES 
  (2,2,13,'','Consulado de Bolivia','','','A');
INSERT INTO `centro_votacion` (`id`,`Pais_id`,`Zona_Horaria_id`,`codigo_postal`,`nombre`,`region`,`direccion`,`estado`) VALUES 
  (3,3,13,'','Consulado de Brasil','','','A');
INSERT INTO `centro_votacion` (`id`,`Pais_id`,`Zona_Horaria_id`,`codigo_postal`,`nombre`,`region`,`direccion`,`estado`) VALUES 
  (4,4,13,'','Consulado de Chile','','','A');
INSERT INTO `centro_votacion` (`id`,`Pais_id`,`Zona_Horaria_id`,`codigo_postal`,`nombre`,`region`,`direccion`,`estado`) VALUES 
  (5,5,13,'','Consulado de Colombia','','','A');
INSERT INTO `centro_votacion` (`id`,`Pais_id`,`Zona_Horaria_id`,`codigo_postal`,`nombre`,`region`,`direccion`,`estado`) VALUES 
  (6,6,13,'','Consulado de Ecuador','','','A');
INSERT INTO `centro_votacion` (`id`,`Pais_id`,`Zona_Horaria_id`,`codigo_postal`,`nombre`,`region`,`direccion`,`estado`) VALUES 
  (7,7,13,'','Consulado de México','','','A');
INSERT INTO `centro_votacion` (`id`,`Pais_id`,`Zona_Horaria_id`,`codigo_postal`,`nombre`,`region`,`direccion`,`estado`) VALUES 
  (8,8,13,'','Consulado de Paraguay','','','A');
INSERT INTO `centro_votacion` (`id`,`Pais_id`,`Zona_Horaria_id`,`codigo_postal`,`nombre`,`region`,`direccion`,`estado`) VALUES 
  (9,13,13,'','Consulado de Japón','','','A');
INSERT INTO `centro_votacion` (`id`,`Pais_id`,`Zona_Horaria_id`,`codigo_postal`,`nombre`,`region`,`direccion`,`estado`) VALUES 
  (10,10,13,'','Consulado de Uruguay','','','A');
INSERT INTO `centro_votacion` (`id`,`Pais_id`,`Zona_Horaria_id`,`codigo_postal`,`nombre`,`region`,`direccion`,`estado`) VALUES 
  (11,11,13,'','Consulado de Venezuela','','','A');
INSERT INTO `centro_votacion` (`id`,`Pais_id`,`Zona_Horaria_id`,`codigo_postal`,`nombre`,`region`,`direccion`,`estado`) VALUES 
  (12,12,13,'','Consulado de New York','','','A');
INSERT INTO `centro_votacion` (`id`,`Pais_id`,`Zona_Horaria_id`,`codigo_postal`,`nombre`,`region`,`direccion`,`estado`) VALUES 
  (13,12,7,'qw','Consulado de Los Angeles','eqwe','qweqw','A');
/*!40000 ALTER TABLE `centro_votacion` ENABLE KEYS */;


--
-- Definition of table `diccionario_log`
--

DROP TABLE IF EXISTS `diccionario_log`;
CREATE TABLE `diccionario_log` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`)
) TYPE=InnoDB AUTO_INCREMENT=6;

--
-- Dumping data for table `diccionario_log`
--

/*!40000 ALTER TABLE `diccionario_log` DISABLE KEYS */;
INSERT INTO `diccionario_log` (`id`,`descripcion`) VALUES 
  (1,'LOG');
INSERT INTO `diccionario_log` (`id`,`descripcion`) VALUES 
  (2,'LOG');
INSERT INTO `diccionario_log` (`id`,`descripcion`) VALUES 
  (3,'LOG');
INSERT INTO `diccionario_log` (`id`,`descripcion`) VALUES 
  (4,'LOG');
INSERT INTO `diccionario_log` (`id`,`descripcion`) VALUES 
  (5,'LOG');
/*!40000 ALTER TABLE `diccionario_log` ENABLE KEYS */;


--
-- Definition of table `elector`
--

DROP TABLE IF EXISTS `elector`;
CREATE TABLE `elector` (
  `id` bigint(20) NOT NULL auto_increment,
  `Locacion_id` int(10) unsigned NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `paterno` varchar(20) NOT NULL,
  `materno` varchar(20) NOT NULL,
  `dni` char(8) NOT NULL,
  `email` varchar(50) NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_Locacion` (`Locacion_id`),
  CONSTRAINT `elector_ibfk_1` FOREIGN KEY (`Locacion_id`) REFERENCES `locacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) TYPE=InnoDB AUTO_INCREMENT=2;

--
-- Dumping data for table `elector`
--

/*!40000 ALTER TABLE `elector` DISABLE KEYS */;
INSERT INTO `elector` (`id`,`Locacion_id`,`nombre`,`paterno`,`materno`,`dni`,`email`,`estado`) VALUES 
  (1,5,'Renzo','Portocarrero','Heredia','41726972','i611065@cibertec.edu.pe','V');
/*!40000 ALTER TABLE `elector` ENABLE KEYS */;


--
-- Definition of table `escrutinio`
--

DROP TABLE IF EXISTS `escrutinio`;
CREATE TABLE `escrutinio` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `Locacion_id` int(10) unsigned NOT NULL,
  `Opcion_id` int(10) unsigned NOT NULL,
  `numero` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `Escrutinio_FKIndex1` (`Opcion_id`),
  KEY `Escrutinio_FKIndex2` (`Locacion_id`),
  CONSTRAINT `escrutinio_ibfk_1` FOREIGN KEY (`Opcion_id`) REFERENCES `opcion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `escrutinio_ibfk_2` FOREIGN KEY (`Locacion_id`) REFERENCES `locacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) TYPE=InnoDB AUTO_INCREMENT=43;

--
-- Dumping data for table `escrutinio`
--

/*!40000 ALTER TABLE `escrutinio` DISABLE KEYS */;
INSERT INTO `escrutinio` (`id`,`Locacion_id`,`Opcion_id`,`numero`) VALUES 
  (22,7,1,0);
INSERT INTO `escrutinio` (`id`,`Locacion_id`,`Opcion_id`,`numero`) VALUES 
  (23,7,2,0);
INSERT INTO `escrutinio` (`id`,`Locacion_id`,`Opcion_id`,`numero`) VALUES 
  (24,7,3,0);
INSERT INTO `escrutinio` (`id`,`Locacion_id`,`Opcion_id`,`numero`) VALUES 
  (25,8,1,0);
INSERT INTO `escrutinio` (`id`,`Locacion_id`,`Opcion_id`,`numero`) VALUES 
  (26,8,2,0);
INSERT INTO `escrutinio` (`id`,`Locacion_id`,`Opcion_id`,`numero`) VALUES 
  (27,8,3,0);
INSERT INTO `escrutinio` (`id`,`Locacion_id`,`Opcion_id`,`numero`) VALUES 
  (28,10,1,0);
INSERT INTO `escrutinio` (`id`,`Locacion_id`,`Opcion_id`,`numero`) VALUES 
  (29,10,2,0);
INSERT INTO `escrutinio` (`id`,`Locacion_id`,`Opcion_id`,`numero`) VALUES 
  (30,10,3,0);
INSERT INTO `escrutinio` (`id`,`Locacion_id`,`Opcion_id`,`numero`) VALUES 
  (31,11,1,0);
INSERT INTO `escrutinio` (`id`,`Locacion_id`,`Opcion_id`,`numero`) VALUES 
  (32,11,2,0);
INSERT INTO `escrutinio` (`id`,`Locacion_id`,`Opcion_id`,`numero`) VALUES 
  (33,11,3,0);
INSERT INTO `escrutinio` (`id`,`Locacion_id`,`Opcion_id`,`numero`) VALUES 
  (34,12,1,0);
INSERT INTO `escrutinio` (`id`,`Locacion_id`,`Opcion_id`,`numero`) VALUES 
  (35,12,2,0);
INSERT INTO `escrutinio` (`id`,`Locacion_id`,`Opcion_id`,`numero`) VALUES 
  (36,12,3,0);
INSERT INTO `escrutinio` (`id`,`Locacion_id`,`Opcion_id`,`numero`) VALUES 
  (37,13,1,0);
INSERT INTO `escrutinio` (`id`,`Locacion_id`,`Opcion_id`,`numero`) VALUES 
  (38,13,2,0);
INSERT INTO `escrutinio` (`id`,`Locacion_id`,`Opcion_id`,`numero`) VALUES 
  (39,13,3,0);
INSERT INTO `escrutinio` (`id`,`Locacion_id`,`Opcion_id`,`numero`) VALUES 
  (40,9,1,0);
INSERT INTO `escrutinio` (`id`,`Locacion_id`,`Opcion_id`,`numero`) VALUES 
  (41,9,2,0);
INSERT INTO `escrutinio` (`id`,`Locacion_id`,`Opcion_id`,`numero`) VALUES 
  (42,9,3,0);
/*!40000 ALTER TABLE `escrutinio` ENABLE KEYS */;


--
-- Definition of table `locacion`
--

DROP TABLE IF EXISTS `locacion`;
CREATE TABLE `locacion` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `Proceso_Electoral_id` int(10) unsigned NOT NULL,
  `Centro_Votacion_id` int(10) unsigned NOT NULL,
  `puesta_cero` char(1) NOT NULL default 'N',
  `estado` char(1) NOT NULL default 'N',
  `fecha_puesta_cero` datetime default NULL,
  `fecha_cierre` datetime default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `idx_locacion` (`Proceso_Electoral_id`,`Centro_Votacion_id`),
  KEY `fk_Centro_Votacion` (`Centro_Votacion_id`),
  KEY `fk_Proceso_Electoral` (`Proceso_Electoral_id`),
  CONSTRAINT `locacion_ibfk_1` FOREIGN KEY (`Centro_Votacion_id`) REFERENCES `centro_votacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `locacion_ibfk_2` FOREIGN KEY (`Proceso_Electoral_id`) REFERENCES `proceso_electoral` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) TYPE=InnoDB AUTO_INCREMENT=14;

--
-- Dumping data for table `locacion`
--

/*!40000 ALTER TABLE `locacion` DISABLE KEYS */;
INSERT INTO `locacion` (`id`,`Proceso_Electoral_id`,`Centro_Votacion_id`,`puesta_cero`,`estado`,`fecha_puesta_cero`,`fecha_cierre`) VALUES 
  (1,1,1,'N','A',NULL,NULL);
INSERT INTO `locacion` (`id`,`Proceso_Electoral_id`,`Centro_Votacion_id`,`puesta_cero`,`estado`,`fecha_puesta_cero`,`fecha_cierre`) VALUES 
  (2,1,2,'N','A',NULL,NULL);
INSERT INTO `locacion` (`id`,`Proceso_Electoral_id`,`Centro_Votacion_id`,`puesta_cero`,`estado`,`fecha_puesta_cero`,`fecha_cierre`) VALUES 
  (3,1,3,'N','A',NULL,NULL);
INSERT INTO `locacion` (`id`,`Proceso_Electoral_id`,`Centro_Votacion_id`,`puesta_cero`,`estado`,`fecha_puesta_cero`,`fecha_cierre`) VALUES 
  (4,1,4,'S','A','2009-01-07 00:02:03',NULL);
INSERT INTO `locacion` (`id`,`Proceso_Electoral_id`,`Centro_Votacion_id`,`puesta_cero`,`estado`,`fecha_puesta_cero`,`fecha_cierre`) VALUES 
  (5,1,5,'S','A','2009-01-07 00:02:00',NULL);
INSERT INTO `locacion` (`id`,`Proceso_Electoral_id`,`Centro_Votacion_id`,`puesta_cero`,`estado`,`fecha_puesta_cero`,`fecha_cierre`) VALUES 
  (6,1,6,'S','A','2009-01-07 00:02:05',NULL);
INSERT INTO `locacion` (`id`,`Proceso_Electoral_id`,`Centro_Votacion_id`,`puesta_cero`,`estado`,`fecha_puesta_cero`,`fecha_cierre`) VALUES 
  (7,1,7,'N','A',NULL,NULL);
INSERT INTO `locacion` (`id`,`Proceso_Electoral_id`,`Centro_Votacion_id`,`puesta_cero`,`estado`,`fecha_puesta_cero`,`fecha_cierre`) VALUES 
  (8,1,8,'N','A',NULL,NULL);
INSERT INTO `locacion` (`id`,`Proceso_Electoral_id`,`Centro_Votacion_id`,`puesta_cero`,`estado`,`fecha_puesta_cero`,`fecha_cierre`) VALUES 
  (9,1,9,'N','A',NULL,NULL);
INSERT INTO `locacion` (`id`,`Proceso_Electoral_id`,`Centro_Votacion_id`,`puesta_cero`,`estado`,`fecha_puesta_cero`,`fecha_cierre`) VALUES 
  (10,1,10,'N','A',NULL,NULL);
INSERT INTO `locacion` (`id`,`Proceso_Electoral_id`,`Centro_Votacion_id`,`puesta_cero`,`estado`,`fecha_puesta_cero`,`fecha_cierre`) VALUES 
  (11,1,11,'N','A',NULL,NULL);
INSERT INTO `locacion` (`id`,`Proceso_Electoral_id`,`Centro_Votacion_id`,`puesta_cero`,`estado`,`fecha_puesta_cero`,`fecha_cierre`) VALUES 
  (12,1,12,'N','A',NULL,NULL);
INSERT INTO `locacion` (`id`,`Proceso_Electoral_id`,`Centro_Votacion_id`,`puesta_cero`,`estado`,`fecha_puesta_cero`,`fecha_cierre`) VALUES 
  (13,1,13,'N','A',NULL,NULL);
/*!40000 ALTER TABLE `locacion` ENABLE KEYS */;


--
-- Definition of table `log_elector`
--

DROP TABLE IF EXISTS `log_elector`;
CREATE TABLE `log_elector` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `Elector_id` bigint(20) NOT NULL,
  `Diccionario_Log_id` int(10) unsigned NOT NULL,
  `fecha` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_Diccionario_Log` (`Diccionario_Log_id`),
  KEY `fk_Elector` (`Elector_id`),
  CONSTRAINT `log_elector_ibfk_1` FOREIGN KEY (`Diccionario_Log_id`) REFERENCES `diccionario_log` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `log_elector_ibfk_2` FOREIGN KEY (`Elector_id`) REFERENCES `elector` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) TYPE=InnoDB;

--
-- Dumping data for table `log_elector`
--

/*!40000 ALTER TABLE `log_elector` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_elector` ENABLE KEYS */;


--
-- Definition of table `log_usuario`
--

DROP TABLE IF EXISTS `log_usuario`;
CREATE TABLE `log_usuario` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `Diccionario_Log_id` int(10) unsigned NOT NULL,
  `Usuario_id` int(10) unsigned NOT NULL,
  `fecha` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_Usuario` (`Usuario_id`),
  KEY `fk_Diccionario_Log` (`Diccionario_Log_id`),
  CONSTRAINT `log_usuario_ibfk_1` FOREIGN KEY (`Usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `log_usuario_ibfk_2` FOREIGN KEY (`Diccionario_Log_id`) REFERENCES `diccionario_log` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) TYPE=InnoDB AUTO_INCREMENT=253;

--
-- Dumping data for table `log_usuario`
--

/*!40000 ALTER TABLE `log_usuario` DISABLE KEYS */;
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (1,1,5,'2008-11-01 11:58:56');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (2,1,1,'2008-11-04 14:12:10');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (3,1,1,'2008-11-04 14:14:36');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (4,1,1,'2008-11-04 14:20:52');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (5,1,2,'2008-11-04 14:21:28');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (6,1,2,'2008-11-04 14:23:17');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (7,1,2,'2008-11-04 14:23:20');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (8,1,2,'2008-11-04 14:26:12');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (9,1,2,'2008-11-04 14:26:15');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (10,1,2,'2008-11-04 14:27:15');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (11,1,2,'2008-11-04 14:27:23');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (12,1,2,'2008-11-04 14:28:27');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (13,1,2,'2008-11-04 14:28:31');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (14,1,2,'2008-11-04 14:28:36');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (15,1,2,'2008-11-04 14:30:34');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (16,1,2,'2008-11-04 14:30:38');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (17,1,1,'2008-11-05 00:15:11');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (18,1,1,'2008-11-05 00:15:17');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (19,1,1,'2008-11-05 00:15:22');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (20,1,1,'2008-11-05 00:15:24');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (21,1,1,'2008-11-05 00:20:19');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (22,1,1,'2008-11-05 00:25:12');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (23,1,1,'2008-11-05 00:26:36');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (24,1,1,'2008-11-05 00:32:18');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (25,1,1,'2008-11-05 00:33:05');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (26,1,1,'2008-11-05 00:35:28');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (27,1,1,'2008-11-05 00:36:01');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (28,1,1,'2008-11-05 00:36:36');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (29,1,1,'2008-11-05 00:37:42');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (30,1,1,'2008-11-05 00:40:56');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (31,1,1,'2008-11-05 00:49:34');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (32,1,1,'2008-11-05 00:55:56');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (33,1,1,'2008-11-05 01:15:17');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (34,1,1,'2008-11-05 01:16:32');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (35,1,1,'2008-11-05 01:21:15');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (36,1,1,'2008-11-05 10:10:56');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (37,1,1,'2008-11-05 10:17:19');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (38,1,1,'2008-11-05 10:32:19');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (39,1,1,'2008-11-16 11:28:11');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (40,1,5,'2008-11-16 11:28:42');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (41,1,5,'2008-11-16 11:42:39');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (42,1,1,'2008-11-16 12:03:12');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (43,1,5,'2008-11-16 12:10:43');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (44,1,5,'2008-11-16 12:12:10');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (45,1,5,'2008-11-16 12:13:26');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (46,1,5,'2008-11-16 12:27:05');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (47,1,5,'2008-11-16 12:33:04');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (48,1,5,'2008-11-16 12:36:33');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (49,1,5,'2008-11-16 12:38:19');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (50,1,5,'2008-11-16 12:50:30');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (51,1,5,'2008-11-16 12:55:34');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (52,1,5,'2008-11-16 13:01:42');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (53,1,1,'2008-11-16 13:09:29');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (54,1,1,'2008-11-16 14:10:51');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (55,1,2,'2008-11-16 13:11:52');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (56,1,2,'2008-11-16 13:11:58');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (57,1,2,'2008-11-16 13:11:58');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (58,1,1,'2008-11-16 14:12:54');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (59,1,2,'2008-11-16 14:13:09');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (60,1,2,'2008-11-16 14:13:13');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (61,1,5,'2008-11-16 14:13:30');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (62,1,5,'2008-11-16 14:15:19');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (63,1,5,'2008-11-16 16:05:49');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (64,1,5,'2008-11-16 16:22:17');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (65,1,5,'2008-11-18 00:21:31');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (66,1,5,'2008-11-18 02:25:51');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (67,1,5,'2008-11-18 02:26:41');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (68,1,5,'2008-11-18 02:28:12');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (69,1,5,'2008-11-18 02:29:24');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (70,1,5,'2008-11-18 02:39:29');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (71,1,1,'2008-11-23 15:14:17');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (72,1,1,'2008-11-23 15:14:26');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (73,1,1,'2008-11-23 15:16:02');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (74,1,1,'2008-11-23 15:23:23');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (75,1,1,'2008-11-23 15:25:09');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (76,1,2,'2008-11-23 15:28:48');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (77,1,2,'2008-11-23 15:29:12');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (78,1,2,'2008-11-24 15:40:37');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (79,1,2,'2008-11-23 17:45:40');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (80,1,2,'2008-11-23 17:49:05');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (81,1,2,'2008-11-23 15:53:08');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (82,1,2,'2008-11-23 15:53:14');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (83,1,2,'2008-11-23 15:58:14');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (84,1,2,'2008-11-23 15:58:25');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (85,1,2,'2008-11-23 16:16:40');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (86,1,2,'2008-11-23 16:16:43');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (87,1,2,'2008-11-23 16:16:43');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (88,1,2,'2008-11-23 18:17:13');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (89,1,2,'2008-11-23 18:21:53');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (90,1,5,'2008-11-23 18:11:54');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (91,1,6,'2008-11-23 18:58:53');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (92,1,6,'2008-11-23 19:06:20');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (93,1,6,'2008-11-23 19:14:19');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (94,1,6,'2008-11-23 19:20:11');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (95,1,6,'2008-11-23 19:22:51');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (96,1,2,'2008-11-23 19:28:34');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (97,1,2,'2008-11-23 19:28:39');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (98,1,2,'2008-11-23 19:28:39');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (99,1,2,'2008-11-23 19:32:57');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (100,1,6,'2008-11-23 19:44:33');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (101,1,6,'2008-11-23 20:40:02');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (102,1,2,'2008-11-23 20:40:17');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (103,1,2,'2008-11-23 20:40:43');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (104,1,2,'2008-11-23 20:40:43');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (105,1,2,'2008-11-23 20:41:55');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (106,1,6,'2008-11-23 20:42:15');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (107,1,5,'2008-11-29 17:58:05');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (108,1,1,'2008-12-06 15:23:07');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (109,1,2,'2008-12-06 15:42:08');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (110,1,2,'2008-12-06 15:42:11');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (111,1,2,'2008-12-06 15:42:11');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (112,1,5,'2008-12-06 15:47:46');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (113,1,1,'2008-12-11 01:47:02');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (114,1,1,'2008-12-11 01:53:25');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (115,1,1,'2008-12-11 01:53:25');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (116,1,1,'2008-12-11 01:53:27');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (117,1,1,'2008-12-11 01:53:27');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (118,1,1,'2008-12-11 02:04:21');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (119,1,1,'2008-12-11 02:04:21');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (120,1,2,'2008-12-11 02:04:34');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (121,1,2,'2008-12-11 02:04:37');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (122,1,2,'2008-12-11 02:04:37');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (123,1,2,'2008-12-11 02:04:38');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (124,1,2,'2008-12-11 02:04:38');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (125,1,2,'2008-12-11 02:04:40');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (126,1,2,'2008-12-11 02:04:40');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (127,1,2,'2008-12-11 02:54:39');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (128,1,2,'2008-12-11 08:08:15');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (129,1,2,'2008-12-11 08:09:12');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (130,1,2,'2008-12-11 08:09:17');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (131,1,2,'2008-12-11 08:09:18');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (132,1,1,'2008-12-11 08:09:31');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (133,1,1,'2008-12-11 08:09:34');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (134,1,1,'2008-12-11 08:09:36');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (135,1,1,'2008-12-11 08:09:37');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (136,1,3,'2008-12-11 08:09:52');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (137,1,5,'2008-12-11 08:10:09');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (138,1,2,'2008-12-26 12:27:57');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (139,1,2,'2008-12-26 12:28:08');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (140,1,2,'2008-12-26 12:28:08');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (141,1,2,'2008-12-26 12:28:12');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (142,1,2,'2008-12-26 12:28:12');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (143,1,2,'2008-12-26 12:28:13');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (144,1,2,'2008-12-26 12:28:13');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (145,1,2,'2008-12-27 11:12:36');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (146,1,2,'2008-12-27 11:12:42');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (147,1,2,'2008-12-27 11:12:42');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (148,1,2,'2008-12-27 11:13:14');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (149,1,2,'2008-12-27 11:13:17');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (150,1,2,'2008-12-27 11:13:17');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (151,1,2,'2008-12-27 11:13:19');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (152,1,2,'2008-12-27 11:13:19');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (153,1,2,'2008-12-27 12:58:53');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (154,1,2,'2008-12-27 12:59:20');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (155,1,2,'2008-12-27 12:59:20');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (156,1,2,'2008-12-27 12:59:21');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (157,1,2,'2008-12-27 12:59:21');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (158,1,2,'2008-12-27 12:59:22');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (159,1,2,'2008-12-27 12:59:22');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (160,1,2,'2008-12-27 18:01:42');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (161,1,2,'2008-12-27 18:01:48');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (162,1,2,'2008-12-27 18:01:48');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (163,1,2,'2008-12-27 18:01:49');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (164,1,2,'2008-12-27 18:01:49');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (165,1,2,'2008-12-27 18:01:50');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (166,1,2,'2008-12-27 18:01:50');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (167,1,5,'2008-12-27 18:25:39');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (168,1,5,'2008-12-27 18:27:58');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (169,1,5,'2008-12-30 15:37:54');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (170,1,5,'2008-12-30 15:39:13');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (171,1,5,'2008-12-30 15:44:20');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (172,1,5,'2008-12-30 15:55:10');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (173,1,5,'2008-12-30 16:21:54');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (174,1,5,'2009-01-02 23:59:56');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (175,1,5,'2009-01-03 00:11:40');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (176,1,5,'2009-01-03 11:53:33');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (177,1,5,'2009-01-03 12:46:32');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (178,1,5,'2009-01-03 14:35:25');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (179,1,5,'2009-01-03 19:45:41');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (180,1,5,'2009-01-03 23:23:07');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (181,1,5,'2009-01-03 23:35:11');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (182,1,5,'2009-01-03 23:54:04');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (183,1,5,'2009-01-04 12:59:23');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (184,1,5,'2009-01-04 14:07:58');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (185,1,5,'2009-01-04 15:22:39');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (186,1,5,'2009-01-04 17:52:30');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (187,1,5,'2009-01-04 17:56:25');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (188,1,5,'2009-01-04 18:14:22');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (189,1,5,'2009-01-04 18:19:10');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (190,1,5,'2009-01-04 20:48:42');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (191,1,5,'2009-01-04 22:08:40');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (192,1,5,'2009-01-04 22:32:22');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (193,1,5,'2009-01-05 00:41:07');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (194,1,1,'2009-01-05 00:42:02');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (195,1,2,'2009-01-05 01:02:43');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (196,1,2,'2009-01-05 01:02:48');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (197,1,2,'2009-01-05 01:02:48');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (198,1,2,'2009-01-05 01:02:56');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (199,1,2,'2009-01-05 01:02:56');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (200,1,2,'2009-01-05 01:02:59');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (201,1,2,'2009-01-05 01:02:59');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (202,1,2,'2009-01-05 01:42:59');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (203,1,2,'2009-01-05 01:52:27');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (204,1,2,'2009-01-05 01:52:29');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (205,1,2,'2009-01-05 01:52:30');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (206,1,5,'2009-01-05 01:53:59');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (207,1,5,'2009-01-05 02:04:21');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (208,1,1,'2009-01-05 02:04:47');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (209,1,1,'2009-01-05 02:05:17');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (210,1,1,'2009-01-05 02:05:17');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (211,1,1,'2009-01-05 02:05:19');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (212,1,1,'2009-01-05 02:05:19');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (213,1,1,'2009-01-05 02:05:20');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (214,1,1,'2009-01-05 02:05:20');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (215,1,5,'2009-01-05 02:42:02');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (216,1,5,'2009-01-05 02:45:15');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (217,1,5,'2009-01-05 02:59:21');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (218,1,5,'2009-01-05 03:05:10');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (219,1,5,'2009-01-05 03:05:33');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (220,1,5,'2009-01-05 03:12:13');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (221,1,5,'2009-01-05 03:12:45');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (222,1,5,'2009-01-05 03:19:32');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (223,1,5,'2009-01-05 03:21:38');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (224,1,5,'2009-01-05 12:28:22');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (225,1,5,'2009-01-05 14:36:43');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (226,1,5,'2009-01-05 14:39:54');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (227,1,5,'2009-01-05 14:41:30');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (228,1,5,'2009-01-05 14:41:39');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (229,1,5,'2009-01-05 14:50:21');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (230,1,5,'2009-01-05 14:59:27');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (231,1,5,'2009-01-05 15:00:33');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (232,1,5,'2009-01-05 15:01:58');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (233,1,5,'2009-01-05 15:03:11');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (234,1,5,'2009-01-05 15:05:45');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (235,1,5,'2009-01-05 23:55:50');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (236,1,5,'2009-01-06 00:11:26');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (237,1,5,'2009-01-06 00:15:34');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (238,1,5,'2009-01-06 00:36:26');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (239,1,5,'2009-01-06 01:25:36');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (240,1,5,'2009-01-06 01:50:32');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (241,1,5,'2009-01-06 02:11:24');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (242,1,5,'2009-01-06 02:12:58');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (243,1,2,'2009-01-06 23:58:50');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (244,1,2,'2009-01-07 00:02:00');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (245,1,2,'2009-01-07 00:02:00');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (246,1,2,'2009-01-07 00:02:03');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (247,1,2,'2009-01-07 00:02:03');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (248,1,2,'2009-01-07 00:02:05');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (249,1,2,'2009-01-07 00:02:05');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (250,1,5,'2009-01-07 00:13:09');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (251,1,5,'2009-01-07 00:35:48');
INSERT INTO `log_usuario` (`id`,`Diccionario_Log_id`,`Usuario_id`,`fecha`) VALUES 
  (252,1,5,'2009-01-07 00:36:07');
/*!40000 ALTER TABLE `log_usuario` ENABLE KEYS */;


--
-- Definition of table `opcion`
--

DROP TABLE IF EXISTS `opcion`;
CREATE TABLE `opcion` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `Candidato_Partido_Politico_id` int(10) unsigned NOT NULL,
  `Cedula_id` int(10) unsigned NOT NULL,
  `orden` int(10) unsigned NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_Cedula` (`Cedula_id`),
  KEY `fk_Candidato_Partido_Politico` (`Candidato_Partido_Politico_id`),
  CONSTRAINT `opcion_ibfk_1` FOREIGN KEY (`Cedula_id`) REFERENCES `cedula` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `opcion_ibfk_2` FOREIGN KEY (`Candidato_Partido_Politico_id`) REFERENCES `candidato_partido_politico` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) TYPE=InnoDB AUTO_INCREMENT=4;

--
-- Dumping data for table `opcion`
--

/*!40000 ALTER TABLE `opcion` DISABLE KEYS */;
INSERT INTO `opcion` (`id`,`Candidato_Partido_Politico_id`,`Cedula_id`,`orden`,`fecha_creacion`) VALUES 
  (1,0,1,3,'2009-01-07 00:01:33');
INSERT INTO `opcion` (`id`,`Candidato_Partido_Politico_id`,`Cedula_id`,`orden`,`fecha_creacion`) VALUES 
  (2,1,1,1,'2009-01-07 00:01:33');
INSERT INTO `opcion` (`id`,`Candidato_Partido_Politico_id`,`Cedula_id`,`orden`,`fecha_creacion`) VALUES 
  (3,2,1,2,'2009-01-07 00:01:33');
/*!40000 ALTER TABLE `opcion` ENABLE KEYS */;


--
-- Definition of table `operador`
--

DROP TABLE IF EXISTS `operador`;
CREATE TABLE `operador` (
  `Usuario_id` int(10) unsigned NOT NULL,
  `Locacion_id` int(10) unsigned NOT NULL,
  `estado` char(1) NOT NULL default 'A',
  PRIMARY KEY  (`Usuario_id`,`Locacion_id`),
  KEY `fk_Usuario` (`Usuario_id`),
  KEY `fk_Locacion` (`Locacion_id`),
  CONSTRAINT `operador_ibfk_1` FOREIGN KEY (`Usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `operador_ibfk_2` FOREIGN KEY (`Locacion_id`) REFERENCES `locacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) TYPE=InnoDB;

--
-- Dumping data for table `operador`
--

/*!40000 ALTER TABLE `operador` DISABLE KEYS */;
INSERT INTO `operador` (`Usuario_id`,`Locacion_id`,`estado`) VALUES 
  (1,1,'A');
INSERT INTO `operador` (`Usuario_id`,`Locacion_id`,`estado`) VALUES 
  (1,2,'A');
INSERT INTO `operador` (`Usuario_id`,`Locacion_id`,`estado`) VALUES 
  (1,3,'A');
INSERT INTO `operador` (`Usuario_id`,`Locacion_id`,`estado`) VALUES 
  (2,4,'A');
INSERT INTO `operador` (`Usuario_id`,`Locacion_id`,`estado`) VALUES 
  (2,5,'A');
INSERT INTO `operador` (`Usuario_id`,`Locacion_id`,`estado`) VALUES 
  (2,6,'A');
INSERT INTO `operador` (`Usuario_id`,`Locacion_id`,`estado`) VALUES 
  (3,7,'A');
INSERT INTO `operador` (`Usuario_id`,`Locacion_id`,`estado`) VALUES 
  (3,8,'A');
INSERT INTO `operador` (`Usuario_id`,`Locacion_id`,`estado`) VALUES 
  (3,9,'A');
INSERT INTO `operador` (`Usuario_id`,`Locacion_id`,`estado`) VALUES 
  (3,13,'A');
INSERT INTO `operador` (`Usuario_id`,`Locacion_id`,`estado`) VALUES 
  (4,10,'A');
INSERT INTO `operador` (`Usuario_id`,`Locacion_id`,`estado`) VALUES 
  (4,11,'A');
INSERT INTO `operador` (`Usuario_id`,`Locacion_id`,`estado`) VALUES 
  (4,12,'A');
/*!40000 ALTER TABLE `operador` ENABLE KEYS */;


--
-- Definition of table `pais`
--

DROP TABLE IF EXISTS `pais`;
CREATE TABLE `pais` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `nombre` varchar(60) NOT NULL,
  `abreviatura` char(2) NOT NULL,
  `estado` char(1) NOT NULL default 'A',
  PRIMARY KEY  (`id`)
) TYPE=InnoDB AUTO_INCREMENT=14;

--
-- Dumping data for table `pais`
--

/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
INSERT INTO `pais` (`id`,`nombre`,`abreviatura`,`estado`) VALUES 
  (1,'Argentina','AR','A');
INSERT INTO `pais` (`id`,`nombre`,`abreviatura`,`estado`) VALUES 
  (2,'Bolivia','BO','A');
INSERT INTO `pais` (`id`,`nombre`,`abreviatura`,`estado`) VALUES 
  (3,'Brasil','BR','A');
INSERT INTO `pais` (`id`,`nombre`,`abreviatura`,`estado`) VALUES 
  (4,'Chile','CL','A');
INSERT INTO `pais` (`id`,`nombre`,`abreviatura`,`estado`) VALUES 
  (5,'Colombia','CO','A');
INSERT INTO `pais` (`id`,`nombre`,`abreviatura`,`estado`) VALUES 
  (6,'Ecuador','EC','A');
INSERT INTO `pais` (`id`,`nombre`,`abreviatura`,`estado`) VALUES 
  (7,'México','MX','A');
INSERT INTO `pais` (`id`,`nombre`,`abreviatura`,`estado`) VALUES 
  (8,'Paraguay','PY','A');
INSERT INTO `pais` (`id`,`nombre`,`abreviatura`,`estado`) VALUES 
  (9,'Perú','PE','A');
INSERT INTO `pais` (`id`,`nombre`,`abreviatura`,`estado`) VALUES 
  (10,'Uruguay','UY','A');
INSERT INTO `pais` (`id`,`nombre`,`abreviatura`,`estado`) VALUES 
  (11,'Venezuela','VE','A');
INSERT INTO `pais` (`id`,`nombre`,`abreviatura`,`estado`) VALUES 
  (12,'Estados Unidos de América','EU','A');
INSERT INTO `pais` (`id`,`nombre`,`abreviatura`,`estado`) VALUES 
  (13,'Japón','JP','A');
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;


--
-- Definition of table `partido_politico`
--

DROP TABLE IF EXISTS `partido_politico`;
CREATE TABLE `partido_politico` (
  `id` int(10) unsigned NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `abreviatura` varchar(10) NOT NULL,
  `logo` varchar(36) NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY  (`id`)
) TYPE=InnoDB;

--
-- Dumping data for table `partido_politico`
--

/*!40000 ALTER TABLE `partido_politico` DISABLE KEYS */;
INSERT INTO `partido_politico` (`id`,`nombre`,`abreviatura`,`logo`,`estado`) VALUES 
  (0,'VACIO','','nothing.gif','A');
INSERT INTO `partido_politico` (`id`,`nombre`,`abreviatura`,`logo`,`estado`) VALUES 
  (1,'Partido La Herradura','PLH','simbolo1.jpg','A');
INSERT INTO `partido_politico` (`id`,`nombre`,`abreviatura`,`logo`,`estado`) VALUES 
  (2,'Partido La Estrella','PLE','simbolo2.jpg','A');
/*!40000 ALTER TABLE `partido_politico` ENABLE KEYS */;


--
-- Definition of table `perfil`
--

DROP TABLE IF EXISTS `perfil`;
CREATE TABLE `perfil` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `estado` char(1) NOT NULL default 'A',
  PRIMARY KEY  (`id`)
) TYPE=InnoDB AUTO_INCREMENT=4;

--
-- Dumping data for table `perfil`
--

/*!40000 ALTER TABLE `perfil` DISABLE KEYS */;
INSERT INTO `perfil` (`id`,`nombre`,`descripcion`,`estado`) VALUES 
  (1,'OPERADOR CENTRAL','OPERADOR CENTRAL','A');
INSERT INTO `perfil` (`id`,`nombre`,`descripcion`,`estado`) VALUES 
  (2,'OPERADOR DE CONSULADO','OPERADOR DE CONSULADO','A');
INSERT INTO `perfil` (`id`,`nombre`,`descripcion`,`estado`) VALUES 
  (3,'OPERADOR DE MODULO','OPERADOR DE MODULO','A');
/*!40000 ALTER TABLE `perfil` ENABLE KEYS */;


--
-- Definition of table `pin`
--

DROP TABLE IF EXISTS `pin`;
CREATE TABLE `pin` (
  `id` bigint(20) NOT NULL auto_increment,
  `Elector_id` bigint(20) NOT NULL,
  `numero` char(32) NOT NULL,
  `creacion` date NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_Elector` (`Elector_id`),
  CONSTRAINT `pin_ibfk_1` FOREIGN KEY (`Elector_id`) REFERENCES `elector` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) TYPE=InnoDB AUTO_INCREMENT=16;

--
-- Dumping data for table `pin`
--

/*!40000 ALTER TABLE `pin` DISABLE KEYS */;
INSERT INTO `pin` (`id`,`Elector_id`,`numero`,`creacion`,`estado`) VALUES 
  (1,1,'7a07b875012845e93fb574a1b2688a50','2008-11-23','I');
INSERT INTO `pin` (`id`,`Elector_id`,`numero`,`creacion`,`estado`) VALUES 
  (2,1,'35705a2db353d7b601a0aee5b8a8cf23','2008-11-23','I');
INSERT INTO `pin` (`id`,`Elector_id`,`numero`,`creacion`,`estado`) VALUES 
  (3,1,'2452a1944641edb28621ef89962441c0','2008-11-23','I');
INSERT INTO `pin` (`id`,`Elector_id`,`numero`,`creacion`,`estado`) VALUES 
  (4,1,'ed7a2a046c961e9904082680864e16d0','2008-12-06','I');
INSERT INTO `pin` (`id`,`Elector_id`,`numero`,`creacion`,`estado`) VALUES 
  (5,1,'376b1d307ce339514461b666b8924e14','2008-12-11','I');
INSERT INTO `pin` (`id`,`Elector_id`,`numero`,`creacion`,`estado`) VALUES 
  (6,1,'daba3c3d9942a32cfac02341e0ea3831','2008-12-26','I');
INSERT INTO `pin` (`id`,`Elector_id`,`numero`,`creacion`,`estado`) VALUES 
  (7,1,'017c7bf8a9b7c0d7946f58d1259a59b2','2008-12-27','I');
INSERT INTO `pin` (`id`,`Elector_id`,`numero`,`creacion`,`estado`) VALUES 
  (8,1,'eeb89a4cca71d181edb7af8f0bc7da98','2008-12-27','I');
INSERT INTO `pin` (`id`,`Elector_id`,`numero`,`creacion`,`estado`) VALUES 
  (9,1,'d49cef543fb7d8a739df7d8b72c3b5da','2008-12-27','I');
INSERT INTO `pin` (`id`,`Elector_id`,`numero`,`creacion`,`estado`) VALUES 
  (10,1,'86be56fc99c7cdd478665f21f7fcc86b','2008-12-27','I');
INSERT INTO `pin` (`id`,`Elector_id`,`numero`,`creacion`,`estado`) VALUES 
  (11,1,'a8be8b1d24a67fb97c02f330e6edbca2','2009-01-05','I');
INSERT INTO `pin` (`id`,`Elector_id`,`numero`,`creacion`,`estado`) VALUES 
  (12,1,'9405198d61f603dc01d658b27d9e45c1','2009-01-06','I');
INSERT INTO `pin` (`id`,`Elector_id`,`numero`,`creacion`,`estado`) VALUES 
  (13,1,'f7ec56be2989fc0939cc92e431837a99','2009-01-07','I');
INSERT INTO `pin` (`id`,`Elector_id`,`numero`,`creacion`,`estado`) VALUES 
  (14,1,'e574e8aa60cbf1b0a3698c4f0a8867f1','2009-01-07','I');
INSERT INTO `pin` (`id`,`Elector_id`,`numero`,`creacion`,`estado`) VALUES 
  (15,1,'1f66515294d94baa73ef22a44496760b','2009-01-07','A');
/*!40000 ALTER TABLE `pin` ENABLE KEYS */;


--
-- Definition of table `proceso_electoral`
--

DROP TABLE IF EXISTS `proceso_electoral`;
CREATE TABLE `proceso_electoral` (
  `id` int(10) unsigned NOT NULL,
  `Usuario_id` int(10) unsigned NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `fecha_votacion` date NOT NULL,
  `hora_inicial` time NOT NULL,
  `hora_final` time NOT NULL,
  `fecha_padron_inicial` date NOT NULL,
  `fecha_padron_final` date NOT NULL,
  `tiempo_sesion` int(11) NOT NULL,
  `estado` char(1) NOT NULL default 'A',
  PRIMARY KEY  (`id`),
  KEY `fk_Usuario` (`Usuario_id`),
  CONSTRAINT `proceso_electoral_ibfk_1` FOREIGN KEY (`Usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) TYPE=InnoDB;

--
-- Dumping data for table `proceso_electoral`
--

/*!40000 ALTER TABLE `proceso_electoral` DISABLE KEYS */;
INSERT INTO `proceso_electoral` (`id`,`Usuario_id`,`descripcion`,`fecha_votacion`,`hora_inicial`,`hora_final`,`fecha_padron_inicial`,`fecha_padron_final`,`tiempo_sesion`,`estado`) VALUES 
  (1,5,'Elecciones Presidenciales DEMO','2009-01-07','00:01:31','00:51:31','2008-11-08','2008-12-28',3,'A');
/*!40000 ALTER TABLE `proceso_electoral` ENABLE KEYS */;


--
-- Definition of table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `Perfil_id` int(10) unsigned NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `paterno` varchar(20) NOT NULL,
  `materno` varchar(20) NOT NULL,
  `dni` char(8) NOT NULL,
  `email` varchar(50) NOT NULL,
  `movil` varchar(15) NOT NULL,
  `username` varchar(10) NOT NULL,
  `passwd` varchar(32) NOT NULL,
  `estado` char(1) NOT NULL default 'A',
  PRIMARY KEY  (`id`),
  KEY `fk_Perfil` (`Perfil_id`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`Perfil_id`) REFERENCES `perfil` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) TYPE=InnoDB AUTO_INCREMENT=7;

--
-- Dumping data for table `usuario`
--

/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`id`,`Perfil_id`,`nombre`,`paterno`,`materno`,`dni`,`email`,`movil`,`username`,`passwd`,`estado`) VALUES 
  (1,3,'Operador','de Modulo','1','','','','modulo1','123','A');
INSERT INTO `usuario` (`id`,`Perfil_id`,`nombre`,`paterno`,`materno`,`dni`,`email`,`movil`,`username`,`passwd`,`estado`) VALUES 
  (2,3,'Operador','de Modulo','2','','','','modulo2','123','A');
INSERT INTO `usuario` (`id`,`Perfil_id`,`nombre`,`paterno`,`materno`,`dni`,`email`,`movil`,`username`,`passwd`,`estado`) VALUES 
  (3,3,'Operador','de Modulo','3','','','','modulo3','123','A');
INSERT INTO `usuario` (`id`,`Perfil_id`,`nombre`,`paterno`,`materno`,`dni`,`email`,`movil`,`username`,`passwd`,`estado`) VALUES 
  (4,3,'Operador','de Modulo','4','','','','modulo4','123','A');
INSERT INTO `usuario` (`id`,`Perfil_id`,`nombre`,`paterno`,`materno`,`dni`,`email`,`movil`,`username`,`passwd`,`estado`) VALUES 
  (5,1,'Renzo','Portocarrero','Heredia','41726972','renzo@mayopi.com','1993478235','central1','123','A');
INSERT INTO `usuario` (`id`,`Perfil_id`,`nombre`,`paterno`,`materno`,`dni`,`email`,`movil`,`username`,`passwd`,`estado`) VALUES 
  (6,2,'Operador','Consulado','1','','','','consul1','123','A');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;


--
-- Definition of table `voto`
--

DROP TABLE IF EXISTS `voto`;
CREATE TABLE `voto` (
  `id` bigint(20) NOT NULL auto_increment,
  `Locacion_id` int(10) unsigned NOT NULL,
  `Opcion_id` blob NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `Voto_FKIndex1` (`Locacion_id`),
  CONSTRAINT `voto_ibfk_1` FOREIGN KEY (`Locacion_id`) REFERENCES `locacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) TYPE=InnoDB AUTO_INCREMENT=4;

--
-- Dumping data for table `voto`
--

/*!40000 ALTER TABLE `voto` DISABLE KEYS */;
INSERT INTO `voto` (`id`,`Locacion_id`,`Opcion_id`) VALUES 
  (1,5,0x825880BE31996EB6CA06CCEB43B1781B);
INSERT INTO `voto` (`id`,`Locacion_id`,`Opcion_id`) VALUES 
  (2,5,0x637D3CE4DBF64D065405784FE2163A3E);
INSERT INTO `voto` (`id`,`Locacion_id`,`Opcion_id`) VALUES 
  (3,5,0x825880BE31996EB6CA06CCEB43B1781B);
/*!40000 ALTER TABLE `voto` ENABLE KEYS */;


--
-- Definition of table `zona_horaria`
--

DROP TABLE IF EXISTS `zona_horaria`;
CREATE TABLE `zona_horaria` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `tiempo` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY  (`id`)
) TYPE=InnoDB AUTO_INCREMENT=26;

--
-- Dumping data for table `zona_horaria`
--

/*!40000 ALTER TABLE `zona_horaria` DISABLE KEYS */;
INSERT INTO `zona_horaria` (`id`,`tiempo`,`nombre`,`estado`) VALUES 
  (1,-12,'GMT -12:00','A');
INSERT INTO `zona_horaria` (`id`,`tiempo`,`nombre`,`estado`) VALUES 
  (2,-11,'GMT -11:00','A');
INSERT INTO `zona_horaria` (`id`,`tiempo`,`nombre`,`estado`) VALUES 
  (3,-10,'GMT -10:00','A');
INSERT INTO `zona_horaria` (`id`,`tiempo`,`nombre`,`estado`) VALUES 
  (4,-9,'GMT -09:00','A');
INSERT INTO `zona_horaria` (`id`,`tiempo`,`nombre`,`estado`) VALUES 
  (5,-8,'GMT -08:00','A');
INSERT INTO `zona_horaria` (`id`,`tiempo`,`nombre`,`estado`) VALUES 
  (6,-7,'GMT -07:00','A');
INSERT INTO `zona_horaria` (`id`,`tiempo`,`nombre`,`estado`) VALUES 
  (7,-6,'GMT -06:00','A');
INSERT INTO `zona_horaria` (`id`,`tiempo`,`nombre`,`estado`) VALUES 
  (8,-5,'GMT -05:00','A');
INSERT INTO `zona_horaria` (`id`,`tiempo`,`nombre`,`estado`) VALUES 
  (9,-4,'GMT -04:00','A');
INSERT INTO `zona_horaria` (`id`,`tiempo`,`nombre`,`estado`) VALUES 
  (10,-3,'GMT -03:00','A');
INSERT INTO `zona_horaria` (`id`,`tiempo`,`nombre`,`estado`) VALUES 
  (11,-2,'GMT -02:00','A');
INSERT INTO `zona_horaria` (`id`,`tiempo`,`nombre`,`estado`) VALUES 
  (12,-1,'GMT -01:00','A');
INSERT INTO `zona_horaria` (`id`,`tiempo`,`nombre`,`estado`) VALUES 
  (13,0,'GMT +00:00','A');
INSERT INTO `zona_horaria` (`id`,`tiempo`,`nombre`,`estado`) VALUES 
  (14,1,'GMT +01:00','A');
INSERT INTO `zona_horaria` (`id`,`tiempo`,`nombre`,`estado`) VALUES 
  (15,2,'GMT +02:00','A');
INSERT INTO `zona_horaria` (`id`,`tiempo`,`nombre`,`estado`) VALUES 
  (16,3,'GMT +03:00','A');
INSERT INTO `zona_horaria` (`id`,`tiempo`,`nombre`,`estado`) VALUES 
  (17,4,'GMT +04:00','A');
INSERT INTO `zona_horaria` (`id`,`tiempo`,`nombre`,`estado`) VALUES 
  (18,5,'GMT +05:00','A');
INSERT INTO `zona_horaria` (`id`,`tiempo`,`nombre`,`estado`) VALUES 
  (19,6,'GMT +06:00','A');
INSERT INTO `zona_horaria` (`id`,`tiempo`,`nombre`,`estado`) VALUES 
  (20,7,'GMT +07:00','A');
INSERT INTO `zona_horaria` (`id`,`tiempo`,`nombre`,`estado`) VALUES 
  (21,8,'GMT +08:00','A');
INSERT INTO `zona_horaria` (`id`,`tiempo`,`nombre`,`estado`) VALUES 
  (22,9,'GMT +09:00','A');
INSERT INTO `zona_horaria` (`id`,`tiempo`,`nombre`,`estado`) VALUES 
  (23,10,'GMT +10:00','A');
INSERT INTO `zona_horaria` (`id`,`tiempo`,`nombre`,`estado`) VALUES 
  (24,11,'GMT +11:00','A');
INSERT INTO `zona_horaria` (`id`,`tiempo`,`nombre`,`estado`) VALUES 
  (25,12,'GMT +12:00','A');
/*!40000 ALTER TABLE `zona_horaria` ENABLE KEYS */;


--
-- Definition of function `fa_voto_getAESKey`
--

DROP FUNCTION IF EXISTS `fa_voto_getAESKey`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` FUNCTION `fa_voto_getAESKey`() RETURNS varchar(100) CHARSET latin1
BEGIN
	RETURN 'Sdf3GMnmyu87568xCsarwEFsfst3GdHfTYr3FsdfsgegdfgSDGDFWCXZCShth3248Hrdcx1SDF1S5D1SRWE2NFS5D1F';
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `pa_actualiza_Puesta_Cero`
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
-- Definition of procedure `pa_ADMIN_crearProcesoDemo`
--

DROP PROCEDURE IF EXISTS `pa_ADMIN_crearProcesoDemo`;

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_ADMIN_crearProcesoDemo`()
BEGIN
	declare v_usuario int(10);
	declare v_proceso int(10);
	-- eliminacion de tablas
	truncate proceso_electoral;
	truncate locacion;
	truncate operador;
	truncate candidato;
	truncate partido_politico;
	truncate candidato_partido_politico;
	truncate cedula;
	truncate opcion;
	truncate elector;
	-- creacion de proceso
	select id into v_usuario from usuario where perfil_id = 1 and estado = 'A' limit 0, 1;
	call pa_proceso_electoral_insertar(v_usuario, 'Elecciones Presidenciales DEMO',
		CURRENT_DATE, CURRENT_TIME, addtime(CURRENT_TIME, '00:50:00'),
		adddate(CURRENT_DATE, -60), adddate(CURRENT_DATE, -10), 3);
	select id into v_proceso from proceso_electoral where descripcion = 'Elecciones Presidenciales DEMO';
	-- datos pre-electorales
	insert into locacion values (1, v_proceso, 1, 'N', 'A', null, null);
	insert into locacion values (2, v_proceso, 2, 'N', 'A', null, null);
	insert into locacion values (3, v_proceso, 3, 'N', 'A', null, null);
	insert into locacion values (4, v_proceso, 4, 'N', 'A', null, null);
	insert into locacion values (5, v_proceso, 5, 'N', 'A', null, null);
	insert into locacion values (6, v_proceso, 6, 'N', 'A', null, null);
	insert into locacion values (7, v_proceso, 7, 'N', 'A', null, null);
	insert into locacion values (8, v_proceso, 8, 'N', 'A', null, null);
	insert into locacion values (9, v_proceso, 9, 'N', 'A', null, null);
	insert into locacion values (10, v_proceso, 10, 'N', 'A', null, null);
	insert into locacion values (11, v_proceso, 11, 'N', 'A', null, null);
	insert into locacion values (12, v_proceso, 12, 'N', 'A', null, null);
	insert into locacion values (13, v_proceso, 13, 'N', 'A', null, null);
	insert into operador values (1, 1, 'A');
	insert into operador values (1, 2, 'A');
	insert into operador values (1, 3, 'A');
	insert into operador values (2, 4, 'A');
	insert into operador values (2, 5, 'A');
	insert into operador values (2, 6, 'A');
	insert into operador values (3, 7, 'A');
	insert into operador values (3, 8, 'A');
	insert into operador values (3, 9, 'A');
	insert into operador values (4, 10, 'A');
	insert into operador values (4, 11, 'A');
	insert into operador values (4, 12, 'A');
	insert into operador values (3, 13, 'A');
	insert into candidato (id, nombre, paterno, materno, dni, foto, estado)
	values (0, '', '', '', '', 'nothing.gif', 'A'),
	       (1, 'Juan', 'Perez', 'Pinto', '41723412', 'candidato1.jpg', 'A'),
	       (2, 'Laura', 'Loca', 'Paliza', '34679213', 'candidato2.jpg', 'A');
	insert into partido_politico (id, nombre, abreviatura, logo, estado)
	values (0, 'VACIO', '', 'nothing.gif', 'A'),
	       (1, 'Partido La Herradura', 'PLH', 'simbolo1.jpg', 'A'),
	       (2, 'Partido La Estrella', 'PLE', 'simbolo2.jpg', 'A');
	insert  into candidato_partido_politico (id, Partido_Politico_id, Candidato_id, fecha_creacion, fecha_modificacion, estado)
	values (0, 0, 0, now(), now(), 'A'),
	       (1, 1, 1, now(), now(), 'A'),
	       (2, 2, 2, now(), now(), 'A');
	insert  into cedula (id, Proceso_Electoral_id, tipo, estado, fecha_creacion, fecha_modificacion)
	values (1, v_proceso, 'P', 'A', now(), now());
	insert into opcion (id, Candidato_Partido_Politico_id, Cedula_id, orden, fecha_creacion)
	values (1, 0, 1, 3, now()), (2, 1, 1, 1, now()), (3, 2, 1, 2, now());
	-- activamos el proceso electoral
	call pa_proceso_electoral_activar(v_proceso);
	-- creamos un usuario empadronado
	call pa_elector_registrar(0, 5, 'Renzo', 'Portocarrero', 'Heredia', '41726972', 'i611065@cibertec.edu.pe');
    END $$

DELIMITER ;

--
-- Definition of procedure `pa_ADMIN_setDefaultData`
--

DROP PROCEDURE IF EXISTS `pa_ADMIN_setDefaultData`;

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_ADMIN_setDefaultData`()
BEGIN
	-- data inicial para la tabla pais
	truncate pais;
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
	-- data inicial para la tabla zona_horaria
	truncate zona_horaria;
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
	-- data inicial para la tabla centro_votacion
	truncate centro_votacion;
	insert into centro_votacion values (1, 1, 10, '', 'Consulado de Argentina', '', '', 'A');
	insert into centro_votacion values (2, 2, 9, '', 'Consulado de Bolivia', '', '', 'A');
	insert into centro_votacion values (3, 3, 10, '', 'Consulado de Brasil', '', '', 'A');
	insert into centro_votacion values (4, 4, 9, '', 'Consulado de Chile', '', '', 'A');
	insert into centro_votacion values (5, 5, 13, '', 'Consulado de Colombia', '', '', 'A');
	insert into centro_votacion values (6, 6, 8, '', 'Consulado de Ecuador', '', '', 'A');
	insert into centro_votacion values (7, 7, 7, '', 'Consulado de México', '', '', 'A');
	insert into centro_votacion values (8, 8, 9, '', 'Consulado de Paraguay', '', '', 'A');
	insert into centro_votacion values (9, 13, 22, '', 'Consulado de Japón', '', '', 'A');
	insert into centro_votacion values (10, 10, 10, '', 'Consulado de Uruguay', '', '', 'A');
	insert into centro_votacion values (11, 11, 9, '', 'Consulado de Venezuela', '', '', 'A');
	insert into centro_votacion values (12, 12, 9, '', 'Consulado de New York', '', '', 'A');
	insert into centro_votacion values (13, 12, 5, '', 'Consulado de Los Angeles', '', '', 'A');
	-- data inicial para la tabla perfil
	truncate perfil;
	insert into perfil (id, nombre, descripcion, estado) values
	(1, 'OPERADOR CENTRAL', 'OPERADOR CENTRAL', 'A'),
	(2, 'OPERADOR DE CONSULADO', 'OPERADOR DE CONSULADO', 'A'),
	(3, 'OPERADOR DE MODULO', 'OPERADOR DE MODULO', 'A');
	-- data inicial para la tabla usuario
	truncate usuario;
	insert into usuario values (1, 3, 'Operador', 'de Modulo', '1', '', '', '', 'modulo1', '123', 'A');
	insert into usuario values (2, 3, 'Operador', 'de Modulo', '2', '', '', '', 'modulo2', '123', 'A');
	insert into usuario values (3, 3, 'Operador', 'de Modulo', '3', '', '', '', 'modulo3', '123', 'A');
	insert into usuario values (4, 3, 'Operador', 'de Modulo', '4', '', '', '', 'modulo4', '123', 'A');
	insert into usuario values (5, 1, 'Operador', 'Central', '1', '', '', '', 'central1', '123', 'A');
	-- data inicial para la tabla diccionario_log
	truncate diccionario_log;
	insert into diccionario_log values (1, 'LOG');
	insert into diccionario_log values (2, 'LOG');
	insert into diccionario_log values (3, 'LOG');
	insert into diccionario_log values (4, 'LOG');
	insert into diccionario_log values (5, 'LOG');
	-- data inicial para la tabla partido_politico
	truncate partido_politico;
	insert into partido_politico values (0, 'VACIO', '', 'nothing.gif', 'A');
	-- data inicial para la tabla candidato
	truncate candidato;
	insert into candidato values (0, '', '', '', '', 'nothing.gif', 'A');
	-- data inicial para la tabla candidato_partido_politico
	truncate candidato_partido_politico;
	insert into candidato_partido_politico values (0, 0, 0, now(), now(), 'A');
    END $$

DELIMITER ;

--
-- Definition of procedure `pa_ADMIN_setEmpadronamiento`
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
-- Definition of procedure `pa_candidato_asignar`
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
-- Definition of procedure `pa_candidato_delete`
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
-- Definition of procedure `pa_candidato_edit`
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
-- Definition of procedure `pa_candidato_findAll`
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
-- Definition of procedure `pa_candidato_findByPrimaryKey`
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
-- Definition of procedure `pa_candidato_insert`
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
-- Definition of procedure `pa_candidato_retirar`
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
-- Definition of procedure `pa_cedula_listar`
--

DROP PROCEDURE IF EXISTS `pa_cedula_listar`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_cedula_listar`()
BEGIN
	SELECT 
		c.id, p.descripcion, c.tipo, c.estado 
	from 
		proceso_electoral p left join cedula c 
	on c.Proceso_Electoral_id = p.id 
	order by p.id desc;
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `pa_centrovotacion_asignar`
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
-- Definition of procedure `pa_centrovotacion_conLocacion`
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
-- Definition of procedure `pa_centrovotacion_conUsuario`
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
-- Definition of procedure `pa_centrovotacion_delete`
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
-- Definition of procedure `pa_centrovotacion_edit`
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
-- Definition of procedure `pa_centrovotacion_findAll`
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
-- Definition of procedure `pa_centrovotacion_findByName`
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
-- Definition of procedure `pa_centrovotacion_findByName_ID`
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
-- Definition of procedure `pa_centrovotacion_findByPrimaryKey`
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
-- Definition of procedure `pa_centrovotacion_insert`
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
-- Definition of procedure `pa_centrovotacion_retirar`
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
-- Definition of procedure `pa_centrovotacion_sinLocacion`
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
-- Definition of procedure `pa_centrovotacion_sinUsuario`
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
-- Definition of procedure `pa_cierraProcesoElectoral`
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
-- Definition of procedure `pa_Consolidacion_Cierra_Proceso_Electoral`
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
-- Definition of procedure `pa_Consolidacion_Consolida_Voto`
--

DROP PROCEDURE IF EXISTS `pa_Consolidacion_Consolida_Voto`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
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
	and pe.estado='F'
	group by nombre,foto,pp.nombre,logo,fecha
	order by resultado desc;
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `pa_Consolidacion_Contar_Locaciones_Abiertas`
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
-- Definition of procedure `pa_Consolidacion_Proceso_Electoral_Cerrado`
--

DROP PROCEDURE IF EXISTS `pa_Consolidacion_Proceso_Electoral_Cerrado`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_Consolidacion_Proceso_Electoral_Cerrado`()
BEGIN
	select * from proceso_electoral where estado='A';
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `pa_consolida_voto`
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
-- Definition of procedure `pa_contarLocacionesAbiertas`
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
-- Definition of procedure `pa_elector_consulados`
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
-- Definition of procedure `pa_elector_empadronamientoActivo`
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
-- Definition of procedure `pa_elector_findByDNI`
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
-- Definition of procedure `pa_elector_generaPIN`
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
-- Definition of procedure `pa_elector_getCedula`
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
-- Definition of procedure `pa_elector_getProcesoActivo`
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
-- Definition of procedure `pa_elector_isVotoEnRango`
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
-- Definition of procedure `pa_elector_paises`
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
-- Definition of procedure `pa_elector_registrar`
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
-- Definition of procedure `pa_elector_validaPIN`
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
-- Definition of procedure `pa_elector_validarDNI`
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
-- Definition of procedure `pa_elector_votar`
--

DROP PROCEDURE IF EXISTS `pa_elector_votar`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_elector_votar`(IN v_voto int(10), IN v_id bigint(20), IN v_lid int(10))
BEGIN
	-- se inserta el voto de forma encriptada
	INSERT into voto (id, Locacion_id, Opcion_id) 
	values (NULL, v_lid, AES_ENCRYPT(v_voto, fa_voto_getAESKey()));
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
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `pa_eliminar_voto`
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
-- Definition of procedure `pa_Escrutinio_Insertar_Voto_Escrutinio`
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
    inner join cedula c on
    pe.id=c.proceso_electoral_id
    inner join opcion o on
    o.cedula_id=c.id
    where pe.estado='A';
   --  select count(id) into v_cantidad_opciones from opcion;
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
-- Definition of procedure `pa_Escrutinio_Listar_Escrutinio_Pais_Locacion`
--

DROP PROCEDURE IF EXISTS `pa_Escrutinio_Listar_Escrutinio_Pais_Locacion`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_Escrutinio_Listar_Escrutinio_Pais_Locacion`(IN v_pais INTEGER,IN v_locacion INTEGER)
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
-- Definition of procedure `pa_Escrutinio_Listar_Locaciones`
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
-- Definition of procedure `pa_Escrutinio_Listar_Locaciones_Cerradas`
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
	and l.estado='C';
    END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `pa_Escrutinio_Listar_Locaciones_Escrutinio`
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
-- Definition of procedure `pa_Escrutinio_Listar_Voto_Pais`
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
-- Definition of procedure `pa_Escrutinio_Listar_Voto_Pais_Locacion`
--

DROP PROCEDURE IF EXISTS `pa_Escrutinio_Listar_Voto_Pais_Locacion`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_Escrutinio_Listar_Voto_Pais_Locacion`(IN v_pais INTEGER, IN v_locacion INTEGER)
BEGIN
	DECLARE v_nombre_pais varchar(60);
	DECLARE v_nombre_cv varchar(50);
	select nombre into v_nombre_pais from pais where id = v_pais;
	select cv.nombre into v_nombre_cv  
	from centro_votacion cv inner join locacion l on cv.id = l.centro_votacion_id 
	and l.id = v_locacion;
	select v_nombre_pais as pais, v_nombre_cv as nombre, v_locacion as locacion_id, o.id as opcion_id, count(v.opcion_id) as votos, o.candidato_partido_politico_id as blanco 
	from opcion o left join voto v on o.id = AES_DECRYPT(v.opcion_id, fa_voto_getAESKey()) and v.locacion_id = v_locacion 
	group by o.id, o.candidato_partido_politico_id;
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `pa_fecha_actual`
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
-- Definition of procedure `pa_insertar_Voto_Escrutinio`
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
-- Definition of procedure `pa_listarLocaciones`
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
-- Definition of procedure `pa_listarLocacionesCerradas`
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
-- Definition of procedure `pa_listarLocacionesEscrutinio`
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
-- Definition of procedure `pa_Listar_Escrutinio_Pais_Locacion`
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
-- Definition of procedure `pa_Listar_VotoPais`
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
-- Definition of procedure `pa_Listar_Voto_Pais_Locacion`
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
-- Definition of procedure `pa_LocacionActivaPor_Usuario_PuestaCero_Locacion`
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
-- Definition of procedure `pa_LocacionesActivasPor_Usuario_PuestaCero`
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
-- Definition of procedure `pa_Locaciones_Por_Usuario_CerrarVotacion`
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
-- Definition of procedure `pa_Locaciones_Por_Usuario_Monitoreo`
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
-- Definition of procedure `pa_Locaciones_Por_Usuario_PuestaCero`
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
-- Definition of procedure `pa_Locacion_Cerrar`
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
-- Definition of procedure `pa_Locacion_CerrarVotacion`
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
-- Definition of procedure `pa_Locacion_Eliminar_Votos`
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
    call pa_log_insert(1, v_Usuario);
    commit;
    select count(*) into nro_Votos from voto where locacion_id = v_Locacion;
    SET v_Votos = nro_Votos;
    
    select count(*) into v_Votos from escrutinio where locacion_id = v_Locacion;
    SET v_Votos = v_Votos + nro_Votos;
  END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `pa_Locacion_Monitoreo`
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
-- Definition of procedure `pa_Locacion_Por_Usuario_CerrarVotacion`
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
-- Definition of procedure `pa_Locacion_Por_Usuario_PuestaCero`
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
-- Definition of procedure `pa_Locacion_PuestaCero`
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
    call pa_log_insert(1, v_Usuario);
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
-- Definition of procedure `pa_locacion_select`
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
-- Definition of procedure `pa_log_insert`
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
-- Definition of procedure `pa_pais_delete`
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
-- Definition of procedure `pa_pais_edit`
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
-- Definition of procedure `pa_pais_findAll`
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
-- Definition of procedure `pa_pais_findAll_Locacion`
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
-- Definition of procedure `pa_pais_findByAbreviatura`
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
-- Definition of procedure `pa_pais_findByAbreviatura_ID`
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
-- Definition of procedure `pa_pais_findByName`
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
-- Definition of procedure `pa_pais_findByName_ID`
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
-- Definition of procedure `pa_pais_findByPrimaryKey`
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
-- Definition of procedure `pa_pais_insert`
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
-- Definition of procedure `pa_partidoPolitico_conCandidato`
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
-- Definition of procedure `pa_partidoPolitico_delete`
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
-- Definition of procedure `pa_partidoPolitico_edit`
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
-- Definition of procedure `pa_partidoPolitico_findAll`
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
-- Definition of procedure `pa_partidoPolitico_findByPrimaryKey`
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
-- Definition of procedure `pa_partidoPolitico_insert`
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
-- Definition of procedure `pa_partidoPolitico_sinCandidato`
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
-- Definition of procedure `pa_perfil_delete`
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
-- Definition of procedure `pa_perfil_edit`
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
-- Definition of procedure `pa_perfil_findAll`
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
-- Definition of procedure `pa_perfil_findByName`
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
-- Definition of procedure `pa_perfil_findByName_ID`
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
-- Definition of procedure `pa_perfil_findByPrimaryKey`
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
-- Definition of procedure `pa_perfil_insert`
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
-- Definition of procedure `pa_procesoElectoralCerrado`
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
-- Definition of procedure `pa_proceso_electoral_activar`
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
-- Definition of procedure `pa_proceso_electoral_anular`
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
-- Definition of procedure `pa_proceso_electoral_editar`
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
-- Definition of procedure `pa_proceso_electoral_findAll_Creado`
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
-- Definition of procedure `pa_proceso_electoral_findByKey`
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
-- Definition of procedure `pa_proceso_electoral_insertar`
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
-- Definition of procedure `pa_proceso_electoral_select`
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
-- Definition of procedure `pa_usuario_asignar`
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
-- Definition of procedure `pa_usuario_delete`
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
-- Definition of procedure `pa_usuario_edit`
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
-- Definition of procedure `pa_usuario_findAll`
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
-- Definition of procedure `pa_usuario_findAll_Locacion`
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
-- Definition of procedure `pa_usuario_findByDNI`
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
-- Definition of procedure `pa_usuario_findByDNI_ID`
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
-- Definition of procedure `pa_usuario_findByPrimaryKey`
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
-- Definition of procedure `pa_usuario_findByUser`
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
-- Definition of procedure `pa_usuario_findByUserName`
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
-- Definition of procedure `pa_usuario_findByUserName_ID`
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
-- Definition of procedure `pa_usuario_insert`
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
-- Definition of procedure `pa_usuario_retirar`
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
-- Definition of procedure `pa_zonahoraria_findAll`
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