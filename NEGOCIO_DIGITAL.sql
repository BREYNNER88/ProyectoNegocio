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

-- Volcando estructura para tabla negociodigital.despacho
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

-- Volcando datos para la tabla negociodigital.despacho: ~0 rows (aproximadamente)

-- Volcando estructura para tabla negociodigital.direccion_usuario
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

-- Volcando datos para la tabla negociodigital.direccion_usuario: ~0 rows (aproximadamente)

-- Volcando estructura para tabla negociodigital.empleado
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

-- Volcando datos para la tabla negociodigital.empleado: ~0 rows (aproximadamente)

-- Volcando estructura para tabla negociodigital.pedido
CREATE TABLE IF NOT EXISTS `pedido` (
  `numPedido` int NOT NULL,
  `fechaPedido` date NOT NULL,
  `totalPedido` float NOT NULL,
  `cedulaUsu` int NOT NULL,
  PRIMARY KEY (`numPedido`),
  KEY `cedulaUsu` (`cedulaUsu`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`cedulaUsu`) REFERENCES `usuario` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla negociodigital.pedido: ~0 rows (aproximadamente)

-- Volcando estructura para tabla negociodigital.pedido_producto
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

-- Volcando estructura para tabla negociodigital.producto
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

-- Volcando estructura para tabla negociodigital.tienda_proveedor
CREATE TABLE IF NOT EXISTS `tienda_proveedor` (
  `nitTienda` varchar(20) NOT NULL,
  `nombreTienda` varchar(60) NOT NULL,
  `direccionTienda` varchar(60) NOT NULL,
  `telTienda` varchar(20) NOT NULL,
  `emailTienda` varchar(60) NOT NULL,
  PRIMARY KEY (`nitTienda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla negociodigital.tienda_proveedor: ~0 rows (aproximadamente)

-- Volcando estructura para tabla negociodigital.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `cedula` int NOT NULL,
  `nombreUsu` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `telefonoFijo` varchar(20) DEFAULT NULL,
  `celularUsuario` varchar(20) NOT NULL,
  `emailUsuario` varchar(60) NOT NULL,
  PRIMARY KEY (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla negociodigital.usuario: ~10 rows (aproximadamente)
INSERT INTO `usuario` (`cedula`, `nombreUsu`, `telefonoFijo`, `celularUsuario`, `emailUsuario`) VALUES
	(23456789, 'María López', '2100-2222', '3123334455', 'mlopez@email.com'),
	(34567890, 'Juan Martínez', '2100-3333', '3134445566', 'jmartinez@email.com'),
	(45678901, 'Ana Rodríguez', NULL, '3145556677', 'arodriguez@email.com'),
	(56789012, 'Luis Fernández', '2100-5555', '3156667788', 'lfernandez@email.com'),
	(67890123, 'Laura Gómez', NULL, '3167778899', 'lgomez@email.com'),
	(78901234, 'Diego Sánchez', '2100-7777', '3178889900', 'dsanchez@email.com'),
	(89012345, 'Sofía Díaz', '2100-8888', '3189990011', 'sdiaz@email.com'),
	(90123456, 'Javier Ruiz', '2100-9999', '3190001122', 'jruiz@email.com'),
	(1075209378, 'Jhon Pérez', NULL, '3333928910', 'jhon.pe@email.com'),
	(1093765231, 'Valentina Herrera', '2100-1010', '3201112233', 'vherrera@email.com');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
