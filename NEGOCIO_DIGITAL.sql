-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.4.3 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para negociodigital
CREATE DATABASE IF NOT EXISTS `negociodigital` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `negociodigital`;

-- Volcando estructura para vista negociodigital.catalogo_productos
DROP VIEW IF EXISTS `catalogo_productos`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `catalogo_productos` (
	`Proveedor` VARCHAR(1) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`Linea` VARCHAR(1) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`Referencia` VARCHAR(1) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`Producto` VARCHAR(1) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`Detalles` VARCHAR(1) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`Precio` FLOAT NOT NULL,
	`Garantia` VARCHAR(1) NOT NULL COLLATE 'utf8mb4_0900_ai_ci'
) ENGINE=MyISAM;

-- Volcando estructura para vista negociodigital.clientes_mas_gastos
DROP VIEW IF EXISTS `clientes_mas_gastos`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `clientes_mas_gastos` (
	`nombreUsu` VARCHAR(1) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`total_gastado` DOUBLE NULL
) ENGINE=MyISAM;

-- Volcando estructura para vista negociodigital.clientes_mayor_al_promedio
DROP VIEW IF EXISTS `clientes_mayor_al_promedio`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `clientes_mayor_al_promedio` (
	`cliente` VARCHAR(1) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`total_pedidos` BIGINT NOT NULL,
	`gasto_promedio_por_pedido` DOUBLE NULL,
	`pedido_mas_alto` FLOAT NULL,
	`gasto_total` DOUBLE NULL
) ENGINE=MyISAM;

-- Volcando estructura para tabla negociodigital.despacho
DROP TABLE IF EXISTS `despacho`;
CREATE TABLE IF NOT EXISTS `despacho` (
  `idDespacho` int NOT NULL,
  `fechaDespacho` date DEFAULT NULL,
  `numPedido` int NOT NULL,
  `cedulaEmpleado` int DEFAULT NULL,
  `nitTienda` varchar(20) NOT NULL,
  PRIMARY KEY (`idDespacho`),
  KEY `numPedido` (`numPedido`),
  KEY `cedulaEmpleado` (`cedulaEmpleado`),
  KEY `nitTienda` (`nitTienda`),
  CONSTRAINT `despacho_ibfk_1` FOREIGN KEY (`numPedido`) REFERENCES `pedido` (`numPedido`),
  CONSTRAINT `despacho_ibfk_2` FOREIGN KEY (`cedulaEmpleado`) REFERENCES `empleado` (`cedulaEmpleado`),
  CONSTRAINT `despacho_ibfk_3` FOREIGN KEY (`nitTienda`) REFERENCES `tienda_proveedor` (`nitTienda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla negociodigital.despacho: ~30 rows (aproximadamente)
INSERT INTO `despacho` (`idDespacho`, `fechaDespacho`, `numPedido`, `cedulaEmpleado`, `nitTienda`) VALUES
	(800, '2026-05-12', 500, 75000001, '900123456-1'),
	(801, '2026-05-04', 501, 75000012, '900123456-2'),
	(802, '2026-05-18', 502, 75000023, '900123456-3'),
	(803, '2026-05-09', 503, 75000004, '900123456-4'),
	(804, '2026-05-22', 504, 75000015, '900123456-5'),
	(805, '2026-05-15', 505, 75000026, '900123456-6'),
	(806, '2026-05-11', 506, 75000007, '900123456-7'),
	(807, '2026-05-03', 507, 75000018, '900123456-8'),
	(808, '2026-05-14', 508, 75000029, '900123456-9'),
	(809, '2026-05-25', 509, 75000010, '900123456-10'),
	(810, '2026-05-07', 510, 75000011, '900123456-1'),
	(811, '2026-05-16', 511, 75000022, '900123456-2'),
	(812, '2026-05-10', 512, 75000003, '900123456-3'),
	(813, '2026-05-22', 513, 75000014, '900123456-4'),
	(814, '2026-05-13', 514, 75000025, '900123456-5'),
	(815, '2026-05-17', 515, 75000006, '900123456-6'),
	(816, '2026-05-02', 516, 75000017, '900123456-7'),
	(817, '2026-05-10', 517, 75000028, '900123456-8'),
	(818, '2026-05-21', 518, 75000009, '900123456-9'),
	(819, '2026-05-16', 519, 75000020, '900123456-10'),
	(820, '2026-05-13', 520, 75000021, '900123456-1'),
	(821, '2026-05-05', 521, 75000002, '900123456-2'),
	(822, '2026-05-11', 522, 75000013, '900123456-3'),
	(823, '2026-05-07', 523, 75000024, '900123456-4'),
	(824, '2026-05-22', 524, 75000005, '900123456-5'),
	(825, '2026-05-20', 525, 75000016, '900123456-6'),
	(826, '2026-05-21', 526, 75000027, '900123456-7'),
	(827, '2026-05-06', 527, 75000008, '900123456-8'),
	(828, '2026-05-16', 528, 75000019, '900123456-9'),
	(829, '2026-05-19', 529, 75000030, '900123456-10'),
	(850, NULL, 990, NULL, '900123456-2'),
	(852, NULL, 991, NULL, '900123456-4'),
	(853, NULL, 992, NULL, '900123456-6'),
	(854, NULL, 999, NULL, '900123456-9');

-- Volcando estructura para tabla negociodigital.direccion_usuario
DROP TABLE IF EXISTS `direccion_usuario`;
CREATE TABLE IF NOT EXISTS `direccion_usuario` (
  `idDireccion` varchar(20) NOT NULL,
  `nomenclatura` varchar(40) NOT NULL,
  `numDirecc` varchar(40) NOT NULL,
  `barrioDirecc` varchar(40) NOT NULL,
  `ciudadDirecc` varchar(40) NOT NULL,
  `departamentoDirecc` varchar(40) NOT NULL,
  `cedulaUsu` int NOT NULL,
  PRIMARY KEY (`idDireccion`),
  KEY `cedulaUsu` (`cedulaUsu`),
  CONSTRAINT `direccion_usuario_ibfk_1` FOREIGN KEY (`cedulaUsu`) REFERENCES `usuario` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla negociodigital.direccion_usuario: ~30 rows (aproximadamente)
INSERT INTO `direccion_usuario` (`idDireccion`, `nomenclatura`, `numDirecc`, `barrioDirecc`, `ciudadDirecc`, `departamentoDirecc`, `cedulaUsu`) VALUES
	('DIR-100', 'Calle 45', '#12-34', 'Chipre', 'Manizales', 'Caldas', 23456789),
	('DIR-101', 'Carrera 7', '#72-10', 'Rosales', 'Bogotá', 'Bogotá D.C.', 34567890),
	('DIR-102', 'Calle 10', '#43E-20', 'El Poblado', 'Medellín', 'Antioquia', 45678901),
	('DIR-103', 'Avenida 6N', '#15N-30', 'Granada', 'Cali', 'Valle del Cauca', 56789012),
	('DIR-104', 'Calle 65', '#89-12', 'Alta Suiza', 'Manizales', 'Caldas', 67890123),
	('DIR-105', 'Carrera 15', '#93-40', 'Chicó Norte', 'Bogotá', 'Bogotá D.C.', 78901234),
	('DIR-106', 'Circular 4', '#73-15', 'Laureles', 'Medellín', 'Antioquia', 89012345),
	('DIR-107', 'Calle 18', '#105-40', 'Ciudad Jardín', 'Cali', 'Valle del Cauca', 90123456),
	('DIR-108', 'Calle 60', '#33-12', 'La Carola', 'Manizales', 'Caldas', 1075209378),
	('DIR-109', 'Calle 26', '#4A-15', 'La Macarena', 'Bogotá', 'Bogotá D.C.', 1093765231),
	('DIR-110', 'Carrera 70', '#45-12', 'Estadio', 'Medellín', 'Antioquia', 1053800001),
	('DIR-111', 'Calle 5', '#24-80', 'San Fernando', 'Cali', 'Valle del Cauca', 1053800002),
	('DIR-112', 'Calle 52', '#18-92', 'Alta Suiza', 'Manizales', 'Caldas', 1053800003),
	('DIR-113', 'Calle 100', '#19-55', 'Chicó', 'Bogotá', 'Bogotá D.C.', 1053800004),
	('DIR-114', 'Carrera 35', '#7-12', 'El Poblado', 'Medellín', 'Antioquia', 1053800005),
	('DIR-115', 'Avenida 3N', '#23N-45', 'Versalles', 'Cali', 'Valle del Cauca', 1053800006),
	('DIR-116', 'Calle 11', '#22-83', 'San Jorge', 'Manizales', 'Caldas', 1053800007),
	('DIR-117', 'Carrera 11', '#85-32', 'Andino', 'Bogotá', 'Bogotá D.C.', 1053800008),
	('DIR-118', 'Calle 50', '#40-25', 'Centro', 'Medellín', 'Antioquia', 1053800009),
	('DIR-119', 'Carrera 66', '#10-22', 'El Limonar', 'Cali', 'Valle del Cauca', 1053800010),
	('DIR-120', 'Calle 55', '#43-21', 'El Cable', 'Manizales', 'Caldas', 1053800011),
	('DIR-121', 'Calle 140', '#12-88', 'Cedritos', 'Bogotá', 'Bogotá D.C.', 1053800012),
	('DIR-122', 'Carrera 80', '#32-34', 'Belén', 'Medellín', 'Antioquia', 1053800013),
	('DIR-123', 'Calle 9', '#38-11', 'Los Cámbulos', 'Cali', 'Valle del Cauca', 1053800014),
	('DIR-124', 'Calle 24', '#77-11', 'Palermo', 'Manizales', 'Caldas', 1053800015),
	('DIR-125', 'Carrera 13', '#45-16', 'Chapinero', 'Bogotá', 'Bogotá D.C.', 1053800016),
	('DIR-126', 'Calle 33', '#65-10', 'Conquistadores', 'Medellín', 'Antioquia', 1053800017),
	('DIR-127', 'Avenida 4N', '#10-25', 'Centenario', 'Cali', 'Valle del Cauca', 1053800018),
	('DIR-128', 'Calle 50', '#12-49', 'Milán', 'Manizales', 'Caldas', 1053800019),
	('DIR-129', 'Carrera 15', '#72-31', 'Unilago', 'Bogotá', 'Bogotá D.C.', 1053800020);

-- Volcando estructura para tabla negociodigital.empleado
DROP TABLE IF EXISTS `empleado`;
CREATE TABLE IF NOT EXISTS `empleado` (
  `cedulaEmpleado` int NOT NULL,
  `nombreEmpleado` varchar(60) NOT NULL,
  `celularEmpleado` varchar(20) NOT NULL,
  `emailEmpleado` varchar(60) NOT NULL,
  `nitTienda` varchar(20) NOT NULL,
  PRIMARY KEY (`cedulaEmpleado`),
  KEY `nitTienda` (`nitTienda`),
  CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`nitTienda`) REFERENCES `tienda_proveedor` (`nitTienda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla negociodigital.empleado: ~30 rows (aproximadamente)
INSERT INTO `empleado` (`cedulaEmpleado`, `nombreEmpleado`, `celularEmpleado`, `emailEmpleado`, `nitTienda`) VALUES
	(75000001, 'Pedro Josúe Marín', '3157263541', 'pedromarin@gmail.com', '900123456-1'),
	(75000002, 'Martha Lucía Henao', '3151928374', 'marthahenao@gmail.com', '900123456-2'),
	(75000003, 'Guillermo León Valencia', '3155463728', 'guillermovalencia@gmail.com', '900123456-3'),
	(75000004, 'Clara Inés Londoño', '3159847362', 'claralondono@gmail.com', '900123456-4'),
	(75000005, 'Francisco Javier Buitrago', '3152374615', 'franciscobuitrago@gmail.com', '900123456-5'),
	(75000006, 'Olga Nelly Aristizábal', '3158374625', 'olgaaristizabal@gmail.com', '900123456-6'),
	(75000007, 'Rodrigo de Jesús Chaves', '3153847261', 'rodrigochaves@gmail.com', '900123456-7'),
	(75000008, 'Luz Marina Botero', '3157463521', 'luzbotero@gmail.com', '900123456-8'),
	(75000009, 'Álvaro de J. Restrepo', '3151924837', 'alvarorestrepo@gmail.com', '900123456-9'),
	(75000010, 'Cecilia Elena Castaño', '3154837261', 'ceciliacastano@gmail.com', '900123456-10'),
	(75000011, 'Gonzalo Alberto Duque', '3158374619', 'gonzaloduque@gmail.com', '900123456-1'),
	(75000012, 'Dora Clemencia Pineda', '3152938471', 'dorapineda@gmail.com', '900123456-2'),
	(75000013, 'Hernán Darío Serna', '3157364528', 'hernanserna@gmail.com', '900123456-3'),
	(75000014, 'María Teresa Beltrán', '3154433221', 'mariabeltran@gmail.com', '900123456-4'),
	(75000015, 'Carlos Arturo Giraldo', '3155566778', 'carlosgiraldo@gmail.com', '900123456-5'),
	(75000016, 'Ligia Elena Cardona', '3159988776', 'ligiacardona@gmail.com', '900123456-6'),
	(75000017, 'Jorge Eliécer Agudelo', '3151122334', 'jorgeagudelo@gmail.com', '900123456-7'),
	(75000018, 'Nohora Isabel Jiménez', '3154455667', 'nohorajimenez@gmail.com', '900123456-8'),
	(75000019, 'Luis Alfonso Betancur', '3157788990', 'luisbetancur@gmail.com', '900123456-9'),
	(75000020, 'Inés Elvira Salazar', '3152233445', 'inessalazar@gmail.com', '900123456-10'),
	(75000021, 'José Omar Ocampo', '3156677889', 'joseocampo@gmail.com', '900123456-1'),
	(75000022, 'Beatriz Eugenia Franco', '3153344556', 'beatrizfranco@gmail.com', '900123456-2'),
	(75000023, 'Héctor Fabio Holguín', '3158899001', 'hectorholguin@gmail.com', '900123456-3'),
	(75000024, 'Silvia Rosa Montoya', '3154455112', 'silviamontoya@gmail.com', '900123456-4'),
	(75000025, 'Jaime de los Ríos', '3155566223', 'jaimerios@gmail.com', '900123456-5'),
	(75000026, 'Emma Julia Gutiérrez', '3159988334', 'emmagutierrez@gmail.com', '900123456-6'),
	(75000027, 'Oscar de Jesús Muñoz', '3151122445', 'oscarmunoz@gmail.com', '900123456-7'),
	(75000028, 'Aura María Peláez', '3154455223', 'aurapelaez@gmail.com', '900123456-8'),
	(75000029, 'William de J. Ángel', '3157788334', 'williamangel@gmail.com', '900123456-9'),
	(75000030, 'Blanca Nubia Vargas', '3152233556', 'blancavargas@gmail.com', '900123456-10');

-- Volcando estructura para vista negociodigital.ganancias_acumuladas_ciudades
DROP VIEW IF EXISTS `ganancias_acumuladas_ciudades`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `ganancias_acumuladas_ciudades` (
	`Ciudad` VARCHAR(1) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`Ganancia` DOUBLE NULL
) ENGINE=MyISAM;

-- Volcando estructura para vista negociodigital.ganancias_acumuladas_cliente
DROP VIEW IF EXISTS `ganancias_acumuladas_cliente`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `ganancias_acumuladas_cliente` (
	`Cliente` VARCHAR(1) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`Pedidos` BIGINT NOT NULL,
	`Ganancia` DOUBLE NULL,
	`Promedio` DOUBLE NULL
) ENGINE=MyISAM;

-- Volcando estructura para vista negociodigital.informe_por_periodo
DROP VIEW IF EXISTS `informe_por_periodo`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `informe_por_periodo` (
	`año` YEAR NULL,
	`mes` INT NULL,
	`total_mes` DOUBLE NULL
) ENGINE=MyISAM;

-- Volcando estructura para vista negociodigital.info_tienda_ventas
DROP VIEW IF EXISTS `info_tienda_ventas`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `info_tienda_ventas` (
	`Tienda` VARCHAR(1) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`totalVendido` DOUBLE NULL
) ENGINE=MyISAM;

-- Volcando estructura para vista negociodigital.info_tienda_ventas_produs
DROP VIEW IF EXISTS `info_tienda_ventas_produs`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `info_tienda_ventas_produs` (
	`ref` VARCHAR(1) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`Producto` VARCHAR(1) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`unidades_vendidas` DECIMAL(32,0) NULL,
	`ingresos_totales` DOUBLE NULL
) ENGINE=MyISAM;

-- Volcando estructura para vista negociodigital.lineas_con_ingreso_mayor_al_promedio
DROP VIEW IF EXISTS `lineas_con_ingreso_mayor_al_promedio`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `lineas_con_ingreso_mayor_al_promedio` (
	`lineaProducto` VARCHAR(1) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`cantidad_productos` BIGINT NOT NULL,
	`unidades_totales_vendidas` DECIMAL(32,0) NULL,
	`precio_promedio_venta` DOUBLE NULL,
	`pedido_mas_alto` FLOAT NULL,
	`ingresos_totales` DOUBLE NULL
) ENGINE=MyISAM;

-- Volcando estructura para vista negociodigital.mas_despachos
DROP VIEW IF EXISTS `mas_despachos`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `mas_despachos` (
	`nombreEmpleado` VARCHAR(1) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`nombreTienda` VARCHAR(1) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`total_despachos` BIGINT NOT NULL
) ENGINE=MyISAM;

-- Volcando estructura para vista negociodigital.mes_mas_ventas
DROP VIEW IF EXISTS `mes_mas_ventas`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `mes_mas_ventas` (
	`anno` YEAR NULL,
	`mes` INT NULL,
	`total_ventas` DOUBLE NULL
) ENGINE=MyISAM;

-- Volcando estructura para tabla negociodigital.pedido
DROP TABLE IF EXISTS `pedido`;
CREATE TABLE IF NOT EXISTS `pedido` (
  `numPedido` int NOT NULL,
  `fechaPedido` date NOT NULL,
  `totalPedido` float NOT NULL,
  `cedulaUsu` int NOT NULL,
  PRIMARY KEY (`numPedido`),
  KEY `cedulaUsu` (`cedulaUsu`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`cedulaUsu`) REFERENCES `usuario` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla negociodigital.pedido: ~30 rows (aproximadamente)
INSERT INTO `pedido` (`numPedido`, `fechaPedido`, `totalPedido`, `cedulaUsu`) VALUES
	(500, '2025-12-15', 240000, 23456789),
	(501, '2025-12-15', 500000, 1053800005),
	(502, '2025-12-15', 750000, 1053800010),
	(503, '2025-12-15', 320000, 45678901),
	(504, '2025-12-15', 1300000, 1053800003),
	(505, '2025-12-15', 2450000, 56789012),
	(506, '2026-01-23', 560000, 1075209378),
	(507, '2026-01-23', 220000, 1053800014),
	(508, '2026-01-23', 195000, 1053800018),
	(509, '2026-01-23', 110000, 67890123),
	(510, '2026-01-23', 360000, 1053800009),
	(511, '2026-01-23', 240000, 78901234),
	(512, '2026-02-09', 390000, 1053800019),
	(513, '2026-02-09', 140000, 89012345),
	(514, '2026-02-09', 370000, 1053800002),
	(515, '2026-02-09', 420000, 90123456),
	(516, '2026-02-09', 420000, 1093765231),
	(517, '2026-02-09', 2700000, 1053800011),
	(518, '2026-03-20', 450000, 1053800007),
	(519, '2026-03-20', 640000, 1053800015),
	(520, '2026-03-20', 680000, 1053800016),
	(521, '2026-03-20', 190000, 1053800001),
	(522, '2026-03-20', 290000, 1053800020),
	(523, '2026-03-20', 135000, 1053800004),
	(524, '2026-03-20', 55000, 1053800012),
	(525, '2026-03-20', 350000, 1053800013),
	(526, '2026-04-02', 125000, 1053800006),
	(527, '2026-04-02', 180000, 1053800017),
	(528, '2026-04-02', 70000, 1053800008),
	(529, '2026-04-02', 50000, 23456789),
	(990, '2026-05-26', 85000, 23456789),
	(991, '2026-05-26', 120000, 34567890),
	(992, '2026-05-26', 450000, 45678901),
	(999, '2026-05-26', 150000, 23456789);

-- Volcando estructura para vista negociodigital.pedidos_pendientes
DROP VIEW IF EXISTS `pedidos_pendientes`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `pedidos_pendientes` (
	`numPedido` INT NOT NULL,
	`fechaPedido` DATE NOT NULL,
	`totalPedido` FLOAT NOT NULL,
	`cedulaUsu` INT NOT NULL
) ENGINE=MyISAM;

-- Volcando estructura para tabla negociodigital.pedido_producto
DROP TABLE IF EXISTS `pedido_producto`;
CREATE TABLE IF NOT EXISTS `pedido_producto` (
  `numPedido` int NOT NULL,
  `ref` varchar(20) NOT NULL,
  `cantidadProdPedido` int NOT NULL,
  `valorProdPedido` float NOT NULL,
  PRIMARY KEY (`numPedido`,`ref`),
  KEY `ref` (`ref`),
  CONSTRAINT `pedido_producto_ibfk_1` FOREIGN KEY (`numPedido`) REFERENCES `pedido` (`numPedido`),
  CONSTRAINT `pedido_producto_ibfk_2` FOREIGN KEY (`ref`) REFERENCES `producto` (`ref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla negociodigital.pedido_producto: ~0 rows (aproximadamente)
INSERT INTO `pedido_producto` (`numPedido`, `ref`, `cantidadProdPedido`, `valorProdPedido`) VALUES
	(500, 'REF-200', 2, 120000),
	(501, 'REF-201', 2, 250000),
	(502, 'REF-202', 1, 750000),
	(503, 'REF-203', 1, 320000),
	(504, 'REF-204', 2, 650000),
	(505, 'REF-205', 1, 2450000),
	(506, 'REF-206', 2, 280000),
	(507, 'REF-207', 1, 220000),
	(508, 'REF-208', 3, 65000),
	(509, 'REF-209', 1, 110000),
	(510, 'REF-210', 2, 180000),
	(511, 'REF-211', 1, 240000),
	(512, 'REF-212', 2, 195000),
	(513, 'REF-213', 1, 140000),
	(514, 'REF-214', 2, 185000),
	(515, 'REF-215', 1, 420000),
	(516, 'REF-216', 2, 210000),
	(517, 'REF-217', 2, 1350000),
	(518, 'REF-218', 1, 450000),
	(519, 'REF-219', 2, 320000),
	(520, 'REF-220', 1, 680000),
	(521, 'REF-221', 2, 95000),
	(522, 'REF-222', 1, 290000),
	(523, 'REF-223', 3, 45000),
	(524, 'REF-224', 1, 55000),
	(525, 'REF-225', 2, 175000),
	(526, 'REF-226', 1, 125000),
	(527, 'REF-227', 3, 60000),
	(528, 'REF-228', 2, 35000),
	(529, 'REF-229', 2, 25000);

-- Volcando estructura para tabla negociodigital.producto
DROP TABLE IF EXISTS `producto`;
CREATE TABLE IF NOT EXISTS `producto` (
  `ref` varchar(20) NOT NULL,
  `descripcion` varchar(60) NOT NULL,
  `lineaProducto` varchar(60) NOT NULL,
  `detalles` varchar(60) NOT NULL,
  `precio` float NOT NULL,
  `tiempoGarantia` varchar(20) NOT NULL,
  `costoCompra` float NOT NULL,
  `nitTienda` varchar(20) NOT NULL,
  PRIMARY KEY (`ref`),
  KEY `nitTienda` (`nitTienda`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`nitTienda`) REFERENCES `tienda_proveedor` (`nitTienda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla negociodigital.producto: ~0 rows (aproximadamente)
INSERT INTO `producto` (`ref`, `descripcion`, `lineaProducto`, `detalles`, `precio`, `tiempoGarantia`, `costoCompra`, `nitTienda`) VALUES
	('REF-200', 'Mouse Gamer RGB Pro', 'Tecnología', 'Alta resolución 16000 DPI, Ergonómico', 120000, '1 Año', 75000, '900123456-1'),
	('REF-201', 'Teclado Mecánico Retroiluminado', 'Tecnología', 'Switch azul, Anti-ghosting completo', 250000, '1 Año', 150000, '900123456-2'),
	('REF-202', 'Monitor Gamer 24 IPS', 'Tecnología', 'FHD 144Hz 1ms, Bordes ultra delgados', 750000, '2 Años', 520000, '900123456-3'),
	('REF-203', 'Audífonos Bluetooth Over-Ear', 'Tecnología', 'Cancelación de ruido activa, Graves profundos', 320000, '1 Año', 210000, '900123456-4'),
	('REF-204', 'Impresora Multifuncional WiFi', 'Tecnología', 'Sistema de tanque continuo de tinta', 650000, '1 Año', 480000, '900123456-5'),
	('REF-205', 'Celular Xiaomi Redmi Note 13', 'Celulares', '256GB Almacenamiento, 8GB RAM', 2450000, '1 Año', 1850000, '900123456-6'),
	('REF-206', 'Disco Duro Externo 1TB', 'Tecnología', 'Conexión USB 3.0 alta velocidad portátil', 280000, '1 Año', 190000, '900123456-7'),
	('REF-207', 'Memoria RAM 16GB DDR4', 'Tecnología', 'Velocidad 3200MHz con disipador térmico', 220000, '3 Años', 140000, '900123456-8'),
	('REF-208', 'Estuche Antichoque para Celular', 'Accesorios', 'Silicona de alta resistencia con bordes elevados', 65000, '3 Meses', 30000, '900123456-9'),
	('REF-209', 'Audífonos Inalámbricos Deportivos', 'Tecnología', 'Resistentes al agua IPX5, Bluetooth 5.3', 110000, '3 Meses', 55000, '900123456-10'),
	('REF-210', 'Casco Moto Certificado DOT', 'Accesorios Moto', 'Casco integral con visor avanzado anti-rayones', 180000, '6 Meses', 95000, '900123456-1'),
	('REF-211', 'Celular Samsung Galaxy A55', 'Celulares', '128GB Almacenamiento, Cámara de 50MP', 240000, '6 Meses', 130000, '900123456-2'),
	('REF-212', 'Estuche de Cuero para Smartphone', 'Accesorios', 'Diseño tipo billetera con tarjetero integrado', 195000, '6 Meses', 110000, '900123456-3'),
	('REF-213', 'Soporte Celular para Motocicleta', 'Accesorios Moto', 'Base de aluminio con amortiguador de vibración', 140000, '1 Año', 85000, '900123456-4'),
	('REF-214', 'Cargador Carga Rápida 45W', 'Accesorios', 'Adaptador de pared con doble puerto USB-C', 185000, '1 Año', 120000, '900123456-5'),
	('REF-215', 'Audífonos In-Ear con Micrófono', 'Tecnología', 'Cable mallado de alta fidelidad, conector Jack', 420000, '1 Año', 290000, '900123456-6'),
	('REF-216', 'Batería Portátil Power Bank 20k', 'Accesorios', 'Capacidad 20000mAh, Carga rápida inalámbrica', 210000, '1 Año', 145000, '900123456-7'),
	('REF-217', 'Smart TV 43 Pulgadas 4K', 'Tecnología', 'Pantalla LED UHD, Android TV incorporado', 1350000, '2 Años', 980000, '900123456-8'),
	('REF-218', 'Barra de Sonido Bluetooth', 'Tecnología', 'Sistema de audio 2.1 canales con subwoofer', 450000, '1 Año', 310000, '900123456-9'),
	('REF-219', 'Estuche Magnético de Lujo', 'Accesorios', 'Compatible con carga magnética inalámbrica', 320000, '6 Meses', 200000, '900123456-10'),
	('REF-220', 'Casco de Moto Shaft Pro', 'Accesorios Moto', 'Certificación europea ECE, Acolchado removible', 680000, '1 Año', 440000, '900123456-1'),
	('REF-221', 'Morral Porta Computador Impermeable', 'Accesorios', 'Compartimento acolchado de 15.6 pulgadas', 95000, '6 Meses', 45000, '900123456-2'),
	('REF-222', 'Smartwatch Deportivo Inteligente', 'Tecnología', 'Monitoreo de ritmo cardíaco y GPS integrado', 290000, '1 Año', 180000, '900123456-3'),
	('REF-223', 'Protector Pantalla Vidrio Cerámico', 'Accesorios', 'Alta resistencia a impactos, cobertura completa', 45000, '3 Meses', 18000, '900123456-4'),
	('REF-224', 'Cable USB-C de Alta Resistencia 2m', 'Accesorios', 'Transferencia de datos a alta velocidad 10Gbps', 55000, '3 Meses', 25000, '900123456-5'),
	('REF-225', 'Combo Teclado y Mouse Inalámbrico', 'Tecnología', 'Conexión 2.4GHz batería de larga duración', 175000, '1 Año', 115000, '900123456-6'),
	('REF-226', 'Hub USB-C de 6 Puertos', 'Tecnología', 'Adaptador con HDMI, ranura SD y puertos USB 3.0', 125000, '1 Año', 80000, '900123456-7'),
	('REF-227', 'Audífonos Gamer con Micrófono', 'Tecnología', 'Sonido envolvente 7.1, Iluminación RGB', 60000, '6 Meses', 22000, '900123456-8'),
	('REF-228', 'Cable HDMI de Alta Velocidad 4K', 'Accesorios', 'Soporta resolución 4K a 60Hz, longitud 3m', 35000, '6 Meses', 12000, '900123456-9'),
	('REF-229', 'Kit Limpieza Pantallas Celular', 'Accesorios', 'Líquido antiestático y paño de microfibra', 25000, '1 Mes', 8000, '900123456-10');

-- Volcando estructura para vista negociodigital.productos_vendidos_mayor_al_promedio
DROP VIEW IF EXISTS `productos_vendidos_mayor_al_promedio`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `productos_vendidos_mayor_al_promedio` (
	`producto` VARCHAR(1) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`lineaProducto` VARCHAR(1) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`nombreTienda` VARCHAR(1) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`unidades_vendidas` DECIMAL(32,0) NULL,
	`precio_promedio_venta` DOUBLE NULL,
	`mayor_cantidad_en_un_pedido` INT NULL
) ENGINE=MyISAM;

-- Volcando estructura para vista negociodigital.tiendas_superior_al_promedio
DROP VIEW IF EXISTS `tiendas_superior_al_promedio`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `tiendas_superior_al_promedio` (
	`nombreTienda` VARCHAR(1) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`total_pedidos` BIGINT NOT NULL,
	`promedio_pedido` DOUBLE NULL,
	`pedido_mas_alto` FLOAT NULL,
	`total_recaudado` DOUBLE NULL
) ENGINE=MyISAM;

-- Volcando estructura para tabla negociodigital.tienda_proveedor
DROP TABLE IF EXISTS `tienda_proveedor`;
CREATE TABLE IF NOT EXISTS `tienda_proveedor` (
  `nitTienda` varchar(20) NOT NULL,
  `nombreTienda` varchar(60) NOT NULL,
  `direccionTienda` varchar(60) NOT NULL,
  `telTienda` varchar(20) NOT NULL,
  `emailTienda` varchar(60) NOT NULL,
  PRIMARY KEY (`nitTienda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla negociodigital.tienda_proveedor: ~6 rows (aproximadamente)
INSERT INTO `tienda_proveedor` (`nitTienda`, `nombreTienda`, `direccionTienda`, `telTienda`, `emailTienda`) VALUES
	('900123456-1', 'TecnoManizales SAS', 'Av. Santander #55-12', '6068851010', 'contacto@tecnomanizales.com'),
	('900123456-10', 'Suministros del Ruiz', 'Cra 20 #18-22', '6068810011', 'compras@suministrosruiz.com'),
	('900123456-2', 'Almacén El Imperio', 'Cra 23 #22-45', '6068842020', 'ventas@elimperio.com'),
	('900123456-3', 'Mundo Digital Caldas', 'Centro Comercial Fundadores Local 204', '6068873030', 'info@mundodigital.com'),
	('900123456-4', 'Distribuidora del Café', 'Zona Industrial Juanchito', '6068914040', 'gerencia@distribuidoracafe.com'),
	('900123456-5', 'Moda y Estilo Urbano', 'Cra 22 #19-10', '6068825050', 'soporte@modaurbano.com'),
	('900123456-6', 'ElectroHogar Manizales', 'Av. Kevin Ángel #45-30', '6068756060', 'servicio@electrohogar.com'),
	('900123456-7', 'Variedades La 23', 'Cra 23 #25-05', '6068837070', 'contacto@variedades23.com'),
	('900123456-8', 'MegaTecnología', 'Av. Lindsay #65-12', '6068868080', 'ventas@megatec.com'),
	('900123456-9', 'Boutique Dynamic', 'C.C. Cable Plaza Local 105', '6068749090', 'info@dynamicboutique.com');

-- Volcando estructura para tabla negociodigital.usuario
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `cedula` int NOT NULL,
  `nombreUsu` varchar(60) NOT NULL,
  `telefonoFijo` varchar(20) DEFAULT NULL,
  `celularUsuario` varchar(20) NOT NULL,
  `emailUsuario` varchar(60) NOT NULL,
  PRIMARY KEY (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla negociodigital.usuario: ~30 rows (aproximadamente)
INSERT INTO `usuario` (`cedula`, `nombreUsu`, `telefonoFijo`, `celularUsuario`, `emailUsuario`) VALUES
	(23456789, 'María López', '2100-2222', '3123334455', 'marialopez@gmail.com'),
	(34567890, 'Juan Martínez', '2100-3333', '3134445566', 'juanmartinez@gmail.com'),
	(45678901, 'Ana Rodríguez', NULL, '3145556677', 'anarodriguez@gmail.com'),
	(56789012, 'Luis Fernández', '2100-5555', '3156667788', 'luisfernandez@gmail.com'),
	(67890123, 'Laura Gómez', NULL, '3167778899', 'lauragomez@gmail.com'),
	(78901234, 'Diego Sánchez', '2100-7777', '3178889900', 'diegosanchez@gmail.com'),
	(89012345, 'Sofía Díaz', '2100-8888', '3189990011', 'sofiadiaz@gmail.com'),
	(90123456, 'Javier Ruiz', '2100-9999', '3190001122', 'javierruiz@gmail.com'),
	(1053800001, 'Carlos Mario Restrepo', NULL, '3105647281', 'carlosrestrepo@gmail.com'),
	(1053800002, 'Andres Felipe Zuleta', NULL, '3102938475', 'andreszuleta@gmail.com'),
	(1053800003, 'Diana Marcela Osorio', NULL, '3109283746', 'dianaosorio@gmail.com'),
	(1053800004, 'Luisa Fernanda Hoyos', NULL, '3104756392', 'luisahoyos@gmail.com'),
	(1053800005, 'Juan Camilo Cardona', NULL, '3101827364', 'juancardona@gmail.com'),
	(1053800006, 'Santiago Sebastian Marín', NULL, '3108473625', 'santiagomarin@gmail.com'),
	(1053800007, 'Camila Andrea Toro', NULL, '3103645271', 'camilatoro@gmail.com'),
	(1053800008, 'Mateo Alejandro Arias', NULL, '3107263541', 'mateoarias@gmail.com'),
	(1053800009, 'Daniela Estefania Gomez', NULL, '3101928374', 'danielagomez@gmail.com'),
	(1053800010, 'Jorge Ivan Ramirez', NULL, '3105463728', 'jorgeramirez@gmail.com'),
	(1053800011, 'Gloria Ines Castro', NULL, '3109847362', 'gloriacastro@gmail.com'),
	(1053800012, 'Mauricio Alberto Ortiz', NULL, '3102374615', 'mauricioortiz@gmail.com'),
	(1053800013, 'Paula Valentina Rios', NULL, '3108374625', 'paularios@gmail.com'),
	(1053800014, 'Nicolas Eduardo Jaramillo', NULL, '3103847261', 'nicolasjaramillo@gmail.com'),
	(1053800015, 'Angela Maria Gutierrez', NULL, '3107463521', 'angelagutierrez@gmail.com'),
	(1053800016, 'Kevin Alexis Patiño', NULL, '3101924837', 'kevinpatino@gmail.com'),
	(1053800017, 'Sandra Milena Muñoz', NULL, '3104837261', 'sandramunoz@gmail.com'),
	(1053800018, 'Julian David Salazar', NULL, '3108374619', 'juliansalazar@gmail.com'),
	(1053800019, 'Tatiana Alexandra Villegas', NULL, '3102938471', 'tatianavillegas@gmail.com'),
	(1053800020, 'Brayan Stiven Franco', NULL, '3107364528', 'brayanfranco@gmail.com'),
	(1075209378, 'Jhon Pérez', NULL, '3333928910', 'jhon.perez@gmail.com'),
	(1093765231, 'Valentina Herrera', '2100-1010', '3201112233', 'valentinaherrera@gmail.com');

-- Volcando estructura para vista negociodigital.utilidades_pedidos
DROP VIEW IF EXISTS `utilidades_pedidos`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `utilidades_pedidos` (
	`numPedido` INT NOT NULL,
	`ingresos` FLOAT NOT NULL,
	`costos` DOUBLE NULL,
	`utilidad` DOUBLE NULL
) ENGINE=MyISAM;

-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `catalogo_productos`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `catalogo_productos` AS select `t`.`nombreTienda` AS `Proveedor`,`p`.`lineaProducto` AS `Linea`,`p`.`ref` AS `Referencia`,`p`.`descripcion` AS `Producto`,`p`.`detalles` AS `Detalles`,`p`.`precio` AS `Precio`,`p`.`tiempoGarantia` AS `Garantia` from (`tienda_proveedor` `t` join `producto` `p` on((`t`.`nitTienda` = `p`.`nitTienda`))) order by `t`.`nombreTienda`,`p`.`lineaProducto`;

-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `clientes_mas_gastos`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `clientes_mas_gastos` AS select `u`.`nombreUsu` AS `nombreUsu`,sum(`p`.`totalPedido`) AS `total_gastado` from (`usuario` `u` join `pedido` `p` on((`u`.`cedula` = `p`.`cedulaUsu`))) group by `u`.`cedula` order by `total_gastado` desc limit 5;

-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `clientes_mayor_al_promedio`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `clientes_mayor_al_promedio` AS select `u`.`nombreUsu` AS `cliente`,count(distinct `ped`.`numPedido`) AS `total_pedidos`,avg(`ped`.`totalPedido`) AS `gasto_promedio_por_pedido`,max(`ped`.`totalPedido`) AS `pedido_mas_alto`,sum(`ped`.`totalPedido`) AS `gasto_total` from (`usuario` `u` join `pedido` `ped` on((`u`.`cedula` = `ped`.`cedulaUsu`))) group by `u`.`cedula` having (sum(`ped`.`totalPedido`) > (select avg(`promedios`.`gasto_por_usuario`) from (select sum(`ped2`.`totalPedido`) AS `gasto_por_usuario` from `pedido` `ped2` group by `ped2`.`cedulaUsu`) `promedios`)) order by `gasto_total` desc;

-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `ganancias_acumuladas_ciudades`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `ganancias_acumuladas_ciudades` AS select `d`.`ciudadDirecc` AS `Ciudad`,sum((`pp`.`cantidadProdPedido` * (`pp`.`valorProdPedido` - `prod`.`costoCompra`))) AS `Ganancia` from (((`direccion_usuario` `d` left join `pedido` `p` on((`d`.`cedulaUsu` = `p`.`cedulaUsu`))) left join `pedido_producto` `pp` on((`p`.`numPedido` = `pp`.`numPedido`))) left join `producto` `prod` on((`pp`.`ref` = `prod`.`ref`))) group by `d`.`ciudadDirecc`;

-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `ganancias_acumuladas_cliente`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `ganancias_acumuladas_cliente` AS select `u`.`nombreUsu` AS `Cliente`,count(distinct `p`.`numPedido`) AS `Pedidos`,sum((`pp`.`cantidadProdPedido` * (`pp`.`valorProdPedido` - `prod`.`costoCompra`))) AS `Ganancia`,(sum((`pp`.`cantidadProdPedido` * (`pp`.`valorProdPedido` - `prod`.`costoCompra`))) / count(distinct `p`.`numPedido`)) AS `Promedio` from (((`usuario` `u` join `pedido` `p` on((`u`.`cedula` = `p`.`cedulaUsu`))) join `pedido_producto` `pp` on((`p`.`numPedido` = `pp`.`numPedido`))) join `producto` `prod` on((`pp`.`ref` = `prod`.`ref`))) group by `u`.`cedula`;

-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `informe_por_periodo`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `informe_por_periodo` AS select year(`p`.`fechaPedido`) AS `año`,month(`p`.`fechaPedido`) AS `mes`,sum(`p`.`totalPedido`) AS `total_mes` from `pedido` `p` group by year(`p`.`fechaPedido`),month(`p`.`fechaPedido`) order by `año` desc,`mes` desc;

-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `info_tienda_ventas`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `info_tienda_ventas` AS select `t`.`nombreTienda` AS `Tienda`,sum(`p`.`totalPedido`) AS `totalVendido` from ((`tienda_proveedor` `t` join `despacho` `d` on((`t`.`nitTienda` = `d`.`nitTienda`))) join `pedido` `p` on((`d`.`numPedido` = `p`.`numPedido`))) group by `t`.`nitTienda` order by `totalVendido` desc;

-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `info_tienda_ventas_produs`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `info_tienda_ventas_produs` AS select `p`.`ref` AS `ref`,`p`.`descripcion` AS `Producto`,sum(`pp`.`cantidadProdPedido`) AS `unidades_vendidas`,sum((`pp`.`cantidadProdPedido` * `pp`.`valorProdPedido`)) AS `ingresos_totales` from (`producto` `p` join `pedido_producto` `pp` on((`p`.`ref` = `pp`.`ref`))) group by `p`.`ref` order by `ingresos_totales` desc;

-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `lineas_con_ingreso_mayor_al_promedio`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `lineas_con_ingreso_mayor_al_promedio` AS select `pr`.`lineaProducto` AS `lineaProducto`,count(distinct `pr`.`ref`) AS `cantidad_productos`,sum(`pp`.`cantidadProdPedido`) AS `unidades_totales_vendidas`,round(avg(`pp`.`valorProdPedido`),2) AS `precio_promedio_venta`,max(`ped`.`totalPedido`) AS `pedido_mas_alto`,sum((`pp`.`cantidadProdPedido` * `pp`.`valorProdPedido`)) AS `ingresos_totales` from ((`producto` `pr` join `pedido_producto` `pp` on((`pr`.`ref` = `pp`.`ref`))) join `pedido` `ped` on((`pp`.`numPedido` = `ped`.`numPedido`))) group by `pr`.`lineaProducto` having (sum((`pp`.`cantidadProdPedido` * `pp`.`valorProdPedido`)) > (select avg(`promedios`.`ingresos_linea`) from (select sum((`pp2`.`cantidadProdPedido` * `pp2`.`valorProdPedido`)) AS `ingresos_linea` from (`producto` `pr2` join `pedido_producto` `pp2` on((`pr2`.`ref` = `pp2`.`ref`))) group by `pr2`.`lineaProducto`) `promedios`)) order by `ingresos_totales` desc;

-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `mas_despachos`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `mas_despachos` AS select `e`.`nombreEmpleado` AS `nombreEmpleado`,`t`.`nombreTienda` AS `nombreTienda`,count(0) AS `total_despachos` from ((`empleado` `e` join `despacho` `d` on((`e`.`cedulaEmpleado` = `d`.`cedulaEmpleado`))) join `tienda_proveedor` `t` on((`e`.`nitTienda` = `t`.`nitTienda`))) group by `e`.`cedulaEmpleado` order by `total_despachos` desc limit 5;

-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `mes_mas_ventas`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `mes_mas_ventas` AS select year(`pedido`.`fechaPedido`) AS `anno`,month(`pedido`.`fechaPedido`) AS `mes`,sum(`pedido`.`totalPedido`) AS `total_ventas` from `pedido` group by year(`pedido`.`fechaPedido`),month(`pedido`.`fechaPedido`) order by `total_ventas` desc limit 1;

-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `pedidos_pendientes`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `pedidos_pendientes` AS select `p`.`numPedido` AS `numPedido`,`p`.`fechaPedido` AS `fechaPedido`,`p`.`totalPedido` AS `totalPedido`,`p`.`cedulaUsu` AS `cedulaUsu` from (`pedido` `p` left join `despacho` `d` on((`p`.`numPedido` = `d`.`numPedido`))) where (`d`.`fechaDespacho` is null);

-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `productos_vendidos_mayor_al_promedio`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `productos_vendidos_mayor_al_promedio` AS select `pr`.`descripcion` AS `producto`,`pr`.`lineaProducto` AS `lineaProducto`,`t`.`nombreTienda` AS `nombreTienda`,sum(`pp`.`cantidadProdPedido`) AS `unidades_vendidas`,avg(`pp`.`valorProdPedido`) AS `precio_promedio_venta`,max(`pp`.`cantidadProdPedido`) AS `mayor_cantidad_en_un_pedido` from ((`producto` `pr` join `pedido_producto` `pp` on((`pr`.`ref` = `pp`.`ref`))) join `tienda_proveedor` `t` on((`pr`.`nitTienda` = `t`.`nitTienda`))) group by `pr`.`ref` having (sum(`pp`.`cantidadProdPedido`) > (select avg(`promedios`.`total_unidades`) from (select sum(`pp2`.`cantidadProdPedido`) AS `total_unidades` from `pedido_producto` `pp2` group by `pp2`.`ref`) `promedios`)) order by `unidades_vendidas` desc;

-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `tiendas_superior_al_promedio`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `tiendas_superior_al_promedio` AS select `t`.`nombreTienda` AS `nombreTienda`,count(distinct `ped`.`numPedido`) AS `total_pedidos`,round(avg(`ped`.`totalPedido`),2) AS `promedio_pedido`,max(`ped`.`totalPedido`) AS `pedido_mas_alto`,sum(`ped`.`totalPedido`) AS `total_recaudado` from ((`tienda_proveedor` `t` join `despacho` `d` on((`t`.`nitTienda` = `d`.`nitTienda`))) join `pedido` `ped` on((`d`.`numPedido` = `ped`.`numPedido`))) group by `t`.`nitTienda` having (sum(`ped`.`totalPedido`) > (select avg(`promedios`.`total_por_tienda`) from (select sum(`ped2`.`totalPedido`) AS `total_por_tienda` from (`despacho` `d2` join `pedido` `ped2` on((`d2`.`numPedido` = `ped2`.`numPedido`))) group by `d2`.`nitTienda`) `promedios`)) order by `total_recaudado` desc;

-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `utilidades_pedidos`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `utilidades_pedidos` AS select `p`.`numPedido` AS `numPedido`,`p`.`totalPedido` AS `ingresos`,sum((`pp`.`cantidadProdPedido` * `prod`.`costoCompra`)) AS `costos`,(`p`.`totalPedido` - sum((`pp`.`cantidadProdPedido` * `prod`.`costoCompra`))) AS `utilidad` from ((`pedido` `p` join `pedido_producto` `pp` on((`p`.`numPedido` = `pp`.`numPedido`))) join `producto` `prod` on((`pp`.`ref` = `prod`.`ref`))) group by `p`.`numPedido`;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
