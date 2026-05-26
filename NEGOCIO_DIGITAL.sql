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
	(829, '2026-05-19', 529, 75000030, '900123456-10');

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
	('DIR-101', 'Calle 12', '#45-67', 'El Cable', 'Manizales', 'Caldas', 34567890),
	('DIR-102', 'Calle 78', '#23-89', 'La Enea', 'Manizales', 'Caldas', 45678901),
	('DIR-103', 'Calle 32', '#11-54', 'Palermo', 'Manizales', 'Caldas', 56789012),
	('DIR-104', 'Calle 65', '#89-12', 'Alta Suiza', 'Manizales', 'Caldas', 67890123),
	('DIR-105', 'Calle 19', '#44-23', 'Centro', 'Manizales', 'Caldas', 78901234),
	('DIR-106', 'Calle 54', '#10-32', 'Milan', 'Manizales', 'Caldas', 89012345),
	('DIR-107', 'Calle 22', '#15-60', 'San Jorge', 'Manizales', 'Caldas', 90123456),
	('DIR-108', 'Calle 60', '#33-12', 'Carola', 'Manizales', 'Caldas', 1075209378),
	('DIR-109', 'Calle 27', '#40-15', 'Villa Pilar', 'Manizales', 'Caldas', 1093765231),
	('DIR-110', 'Calle 34', '#82-12', 'El Cable', 'Manizales', 'Caldas', 1053800001),
	('DIR-111', 'Calle 15', '#41-55', 'Chipre', 'Manizales', 'Caldas', 1053800002),
	('DIR-112', 'Calle 52', '#18-92', 'Alta Suiza', 'Manizales', 'Caldas', 1053800003),
	('DIR-113', 'Calle 71', '#34-11', 'La Enea', 'Manizales', 'Caldas', 1053800004),
	('DIR-114', 'Calle 29', '#15-44', 'Centro', 'Manizales', 'Caldas', 1053800005),
	('DIR-115', 'Calle 63', '#72-19', 'Palermo', 'Manizales', 'Caldas', 1053800006),
	('DIR-116', 'Calle 11', '#22-83', 'San Jorge', 'Manizales', 'Caldas', 1053800007),
	('DIR-117', 'Calle 40', '#61-22', 'Carola', 'Manizales', 'Caldas', 1053800008),
	('DIR-118', 'Calle 73', '#14-55', 'Milan', 'Manizales', 'Caldas', 1053800009),
	('DIR-119', 'Calle 18', '#99-12', 'Villa Pilar', 'Manizales', 'Caldas', 1053800010),
	('DIR-120', 'Calle 55', '#43-21', 'El Cable', 'Manizales', 'Caldas', 1053800011),
	('DIR-121', 'Calle 31', '#12-88', 'Chipre', 'Manizales', 'Caldas', 1053800012),
	('DIR-122', 'Calle 67', '#25-34', 'Alta Suiza', 'Manizales', 'Caldas', 1053800013),
	('DIR-123', 'Calle 24', '#77-11', 'Palermo', 'Manizales', 'Caldas', 1053800014),
	('DIR-124', 'Calle 48', '#19-42', 'Centro', 'Manizales', 'Caldas', 1053800015),
	('DIR-125', 'Calle 13', '#55-16', 'La Enea', 'Manizales', 'Caldas', 1053800016),
	('DIR-126', 'Calle 79', '#31-10', 'San Jorge', 'Manizales', 'Caldas', 1053800017),
	('DIR-127', 'Calle 36', '#84-25', 'Carola', 'Manizales', 'Caldas', 1053800018),
	('DIR-128', 'Calle 50', '#12-49', 'Milan', 'Manizales', 'Caldas', 1053800019),
	('DIR-129', 'Calle 21', '#66-31', 'Villa Pilar', 'Manizales', 'Caldas', 1053800020);

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
	(75000001, 'Pedro Josúe Marín', '3157263541', 'pedro.josue.marin@tienda.com', '900123456-1'),
	(75000002, 'Martha Lucía Henao', '3151928374', 'martha.lucia.henao@tienda.com', '900123456-2'),
	(75000003, 'Guillermo León Valencia', '3155463728', 'guillermo.leon.valencia@tienda.com', '900123456-3'),
	(75000004, 'Clara Inés Londoño', '3159847362', 'clara.ines.londono@tienda.com', '900123456-4'),
	(75000005, 'Francisco Javier Buitrago', '3152374615', 'francisco.javier.buitrago@tienda.com', '900123456-5'),
	(75000006, 'Olga Nelly Aristizábal', '3158374625', 'olga.nelly.aristizabal@tienda.com', '900123456-6'),
	(75000007, 'Rodrigo de Jesús Chaves', '3153847261', 'rodrigo.de.jesus.chaves@tienda.com', '900123456-7'),
	(75000008, 'Luz Marina Botero', '3157463521', 'luz.marina.botero@tienda.com', '900123456-8'),
	(75000009, 'Álvaro de J. Restrepo', '3151924837', 'alvaro.de.j..restrepo@tienda.com', '900123456-9'),
	(75000010, 'Cecilia Elena Castaño', '3154837261', 'cecilia.elena.castano@tienda.com', '900123456-10'),
	(75000011, 'Gonzalo Alberto Duque', '3158374619', 'gonzalo.alberto.duque@tienda.com', '900123456-1'),
	(75000012, 'Dora Clemencia Pineda', '3152938471', 'dora.clemencia.pineda@tienda.com', '900123456-2'),
	(75000013, 'Hernán Darío Serna', '3157364528', 'hernan.dario.serna@tienda.com', '900123456-3'),
	(75000014, 'María Teresa Beltrán', '3154433221', 'maria.teresa.beltran@tienda.com', '900123456-4'),
	(75000015, 'Carlos Arturo Giraldo', '3155566778', 'carlos.arturo.giraldo@tienda.com', '900123456-5'),
	(75000016, 'Ligia Elena Cardona', '3159988776', 'ligia.elena.cardona@tienda.com', '900123456-6'),
	(75000017, 'Jorge Eliécer Agudelo', '3151122334', 'jorge.eliecer.agudelo@tienda.com', '900123456-7'),
	(75000018, 'Nohora Isabel Jiménez', '3154455667', 'nohora.isabel.jimenez@tienda.com', '900123456-8'),
	(75000019, 'Luis Alfonso Betancur', '3157788990', 'luis.alfonso.betancur@tienda.com', '900123456-9'),
	(75000020, 'Inés Elvira Salazar', '3152233445', 'ines.elvira.salazar@tienda.com', '900123456-10'),
	(75000021, 'José Omar Ocampo', '3156677889', 'jose.omar.ocampo@tienda.com', '900123456-1'),
	(75000022, 'Beatriz Eugenia Franco', '3153344556', 'beatriz.eugenia.franco@tienda.com', '900123456-2'),
	(75000023, 'Héctor Fabio Holguín', '3158899001', 'hector.fabio.holguin@tienda.com', '900123456-3'),
	(75000024, 'Silvia Rosa Montoya', '3154455112', 'silvia.rosa.montoya@tienda.com', '900123456-4'),
	(75000025, 'Jaime de los Ríos', '3155566223', 'jaime.de.los.rios@tienda.com', '900123456-5'),
	(75000026, 'Emma Julia Gutiérrez', '3159988334', 'emma.julia.gutierrez@tienda.com', '900123456-6'),
	(75000027, 'Oscar de Jesús Muñoz', '3151122445', 'oscar.de.jesus.munoz@tienda.com', '900123456-7'),
	(75000028, 'Aura María Peláez', '3154455223', 'aura.maria.pelaez@tienda.com', '900123456-8'),
	(75000029, 'William de J. Ángel', '3157788334', 'william.de.j..angel@tienda.com', '900123456-9'),
	(75000030, 'Blanca Nubia Vargas', '3152233556', 'blanca.nubia.vargas@tienda.com', '900123456-10');

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
	(500, '2026-05-12', 240000, 23456789),
	(501, '2026-05-04', 500000, 1053800005),
	(502, '2026-05-18', 750000, 1053800010),
	(503, '2026-05-09', 320000, 45678901),
	(504, '2026-05-22', 1300000, 1053800003),
	(505, '2026-05-15', 2450000, 56789012),
	(506, '2026-05-11', 560000, 1075209378),
	(507, '2026-05-03', 220000, 1053800014),
	(508, '2026-05-14', 195000, 1053800018),
	(509, '2026-05-25', 110000, 67890123),
	(510, '2026-05-07', 360000, 1053800009),
	(511, '2026-05-16', 240000, 78901234),
	(512, '2026-05-10', 390000, 1053800019),
	(513, '2026-05-22', 140000, 89012345),
	(514, '2026-05-13', 370000, 1053800002),
	(515, '2026-05-17', 420000, 90123456),
	(516, '2026-05-02', 420000, 1093765231),
	(517, '2026-05-10', 2700000, 1053800011),
	(518, '2026-05-21', 450000, 1053800007),
	(519, '2026-05-16', 640000, 1053800015),
	(520, '2026-05-13', 680000, 1053800016),
	(521, '2026-05-05', 190000, 1053800001),
	(522, '2026-05-11', 290000, 1053800020),
	(523, '2026-05-07', 135000, 1053800004),
	(524, '2026-05-22', 55000, 1053800012),
	(525, '2026-05-20', 350000, 1053800013),
	(526, '2026-05-21', 125000, 1053800006),
	(527, '2026-05-06', 180000, 1053800017),
	(528, '2026-05-16', 70000, 1053800008),
	(529, '2026-05-19', 50000, 23456789);

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

-- Volcando datos para la tabla negociodigital.pedido_producto: ~30 rows (aproximadamente)
INSERT INTO `pedido_producto` (`numPedido`, `ref`, `cantidadProdPedido`, `valorProdPedido`) VALUES
	(500, 'REF-200', 2, 120000),
	(501, 'REF-201', 2, 250000),
	(502, 'REF-202', 1, 750000),
	(503, 'REF-203', 1, 320000),
	(504, 'REF-204', 2, 650000),
	(505, 'REF-205', 1, 2450000),
	(506, 'REF-206', 2, 280000),
	(507, 'REF-207', 1, 220000),
	(508, 'REF-208', 3, 650000),
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

-- Volcando datos para la tabla negociodigital.producto: ~30 rows (aproximadamente)
INSERT INTO `producto` (`ref`, `descripcion`, `lineaProducto`, `detalles`, `precio`, `tiempoGarantia`, `costoCompra`, `nitTienda`) VALUES
	('REF-200', 'Mouse Gamer RGB', 'Tecnología', 'Alta resolución 16000 DPI', 120000, '1 Año', 75000, '900123456-1'),
	('REF-201', 'Teclado Mecánico', 'Tecnología', 'Switch azul, retroiluminado', 250000, '1 Año', 150000, '900123456-2'),
	('REF-202', 'Monitor 24 IPS', 'Tecnología', 'FHD 144Hz 1ms response', 750000, '2 Años', 520000, '900123456-3'),
	('REF-203', 'Auriculares Bluetooth', 'Tecnología', 'Cancelación de ruido activa', 320000, '1 Año', 210000, '900123456-4'),
	('REF-204', 'Impresora Multifuncional', 'Tecnología', 'Inyección de tinta continua', 650000, '1 Año', 480000, '900123456-5'),
	('REF-205', 'Portátil Core i5', 'Tecnología', '8GB RAM, 512GB SSD', 2450000, '1 Año', 1850000, '900123456-6'),
	('REF-206', 'Disco Duro Externo 1TB', 'Tecnología', 'USB 3.0 alta velocidad', 280000, '1 Año', 190000, '900123456-7'),
	('REF-207', 'Memoria RAM 16GB DDR4', 'Tecnología', '3200MHz con disipador', 220000, '3 Años', 140000, '900123456-8'),
	('REF-208', 'Camiseta Polo Hombre', 'Ropa', '100% Algodón, varios colores', 65000, '3 Meses', 30000, '900123456-9'),
	('REF-209', 'Jeans Slim Fit', 'Ropa', 'Denim elástico azul oscuro', 110000, '3 Meses', 55000, '900123456-10'),
	('REF-210', 'Chaqueta Impermeable', 'Ropa', 'Térmica ideal para moto', 180000, '6 Meses', 95000, '900123456-1'),
	('REF-211', 'Tenis Deportivos', 'Calzado', 'Suela running alta comodidad', 240000, '6 Meses', 130000, '900123456-2'),
	('REF-212', 'Zapatos de Cuero', 'Calzado', 'Formal elegante color café', 195000, '6 Meses', 110000, '900123456-3'),
	('REF-213', 'Cafetera de Goteo', 'Hogar', 'Capacidad 12 tazas programable', 140000, '1 Año', 85000, '900123456-4'),
	('REF-214', 'Licuadora Cromada', 'Hogar', '3 velocidades, vaso de vidrio', 185000, '1 Año', 120000, '900123456-5'),
	('REF-215', 'Horno Microondas', 'Hogar', '20 Litros con grill digital', 420000, '1 Año', 290000, '900123456-6'),
	('REF-216', 'Ventilador de Torre', 'Hogar', 'Con control remoto y temporizador', 210000, '1 Año', 145000, '900123456-7'),
	('REF-217', 'Smart TV 43 4K', 'Tecnología', 'Android TV con comandos de voz', 1350000, '2 Años', 980000, '900123456-8'),
	('REF-218', 'Barra de Sonido', 'Tecnología', 'Bluetooth con Subwoofer', 450000, '1 Año', 310000, '900123456-9'),
	('REF-219', 'Escritorio Ergonómico', 'Muebles', 'Madera y estructura metálica', 320000, '6 Meses', 200000, '900123456-10'),
	('REF-220', 'Silla Gamer Pro', 'Muebles', 'Reclinable con soporte lumbar', 680000, '1 Año', 440000, '900123456-1'),
	('REF-221', 'Morral Antirrobo', 'Accesorios', 'Puerto de carga USB integrado', 95000, '6 Meses', 45000, '900123456-2'),
	('REF-222', 'Reloj Inteligente', 'Tecnología', 'Sensor ritmo cardíaco y GPS', 290000, '1 Año', 180000, '900123456-3'),
	('REF-223', 'Gorra Deportiva', 'Accesorios', 'Protección UV ajustable', 45000, '3 Meses', 18000, '900123456-4'),
	('REF-224', 'Termo Inteligente', 'Hogar', 'Pantalla digital temperatura', 55000, '3 Meses', 25000, '900123456-5'),
	('REF-225', 'Taladro Percutor', 'Herramientas', '550W con kit de brocas', 175000, '1 Año', 115000, '900123456-6'),
	('REF-226', 'Caja de Herramientas', 'Herramientas', 'Organizador de 45 piezas', 125000, '1 Año', 80000, '900123456-7'),
	('REF-227', 'Cargador Carga Rápida', 'Tecnología', 'Tipo C de 25W homologado', 60000, '6 Meses', 22000, '900123456-8'),
	('REF-228', 'Cable HDMI 4K', 'Tecnología', 'Mallado alta resistencia 3mts', 35000, '6 Meses', 12000, '900123456-9'),
	('REF-229', 'Kit Limpieza Pantallas', 'Accesorios', 'Líquido especial + microfibra', 25000, '1 Mes', 8000, '900123456-10');

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

-- Volcando datos para la tabla negociodigital.tienda_proveedor: ~10 rows (aproximadamente)
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
  `nombreUsu` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `telefonoFijo` varchar(20) DEFAULT NULL,
  `celularUsuario` varchar(20) NOT NULL,
  `emailUsuario` varchar(60) NOT NULL,
  PRIMARY KEY (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla negociodigital.usuario: ~30 rows (aproximadamente)
INSERT INTO `usuario` (`cedula`, `nombreUsu`, `telefonoFijo`, `celularUsuario`, `emailUsuario`) VALUES
	(23456789, 'María López', '2100-2222', '3123334455', 'mlopez@email.com'),
	(34567890, 'Juan Martínez', '2100-3333', '3134445566', 'jmartinez@email.com'),
	(45678901, 'Ana Rodríguez', NULL, '3145556677', 'arodriguez@email.com'),
	(56789012, 'Luis Fernández', '2100-5555', '3156667788', 'lfernandez@email.com'),
	(67890123, 'Laura Gómez', NULL, '3167778899', 'lgomez@email.com'),
	(78901234, 'Diego Sánchez', '2100-7777', '3178889900', 'dsanchez@email.com'),
	(89012345, 'Sofía Díaz', '2100-8888', '3189990011', 'sdiaz@email.com'),
	(90123456, 'Javier Ruiz', '2100-9999', '3190001122', 'jruiz@email.com'),
	(1053800001, 'Carlos Mario Restrepo', NULL, '3105647281', 'carlos.mario.restrepo@email.com'),
	(1053800002, 'Andres Felipe Zuleta', NULL, '3102938475', 'andres.felipe.zuleta@email.com'),
	(1053800003, 'Diana Marcela Osorio', NULL, '3109283746', 'diana.marcela.osorio@email.com'),
	(1053800004, 'Luisa Fernanda Hoyos', NULL, '3104756392', 'luisa.fernanda.hoyos@email.com'),
	(1053800005, 'Juan Camilo Cardona', NULL, '3101827364', 'juan.camilo.cardona@email.com'),
	(1053800006, 'Santiago Sebastian Marín', NULL, '3108473625', 'santiago.sebastian.marin@email.com'),
	(1053800007, 'Camila Andrea Toro', NULL, '3103645271', 'camila.andrea.toro@email.com'),
	(1053800008, 'Mateo Alejandro Arias', NULL, '3107263541', 'mateo.alejandro.arias@email.com'),
	(1053800009, 'Daniela Estefania Gomez', NULL, '3101928374', 'daniela.estefaniagomez@email.com'),
	(1053800010, 'Jorge Ivan Ramirez', NULL, '3105463728', 'jorge.ivan.ramirez@email.com'),
	(1053800011, 'Gloria Ines Castro', NULL, '3109847362', 'gloria.ines.castro@email.com'),
	(1053800012, 'Mauricio Alberto Ortiz', NULL, '3102374615', 'mauricio.alberto.ortiz@email.com'),
	(1053800013, 'Paula Valentina Rios', NULL, '3108374625', 'paula.valentina.rios@email.com'),
	(1053800014, 'Nicolas Eduardo Jaramillo', NULL, '3103847261', 'nicolas.eduardo.jaramillo@email.com'),
	(1053800015, 'Angela Maria Gutierrez', NULL, '3107463521', 'angela.maria.gutierrez@email.com'),
	(1053800016, 'Kevin Alexis Patiño', NULL, '3101924837', 'kevin.alexis.patiño@email.com'),
	(1053800017, 'Sandra Milena Muñoz', NULL, '3104837261', 'sandra.milena.muñoz@email.com'),
	(1053800018, 'Julian David Salazar', NULL, '3108374619', 'julian.david.salazar@email.com'),
	(1053800019, 'Tatiana Alexandra Villegas', NULL, '3102938471', 'tatiana.alexandra.villegas@email.com'),
	(1053800020, 'Brayan Stiven Franco', NULL, '3107364528', 'brayan.stiven.franco@email.com'),
	(1075209378, 'Jhon Pérez', NULL, '3333928910', 'jhon.pe@email.com'),
	(1093765231, 'Valentina Herrera', '2100-1010', '3201112233', 'vherrera@email.com');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
