-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-02-2022 a las 12:33:22
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tiendaarqsoft`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `idcarrito` int(11) NOT NULL,
  `precio` float DEFAULT NULL,
  `Articulo` char(50) DEFAULT NULL,
  `cantidad` int(3) DEFAULT NULL,
  `imagen` text DEFAULT NULL,
  `Usuario` char(100) DEFAULT NULL,
  `idproducto` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `idcategorias` int(11) NOT NULL,
  `nombrecategoria` char(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`idcategorias`, `nombrecategoria`) VALUES
(1, 'equipos'),
(2, 'perifericos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `documento` int(12) NOT NULL,
  `nombre` varchar(60) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`documento`, `nombre`, `direccion`, `telefono`, `correo`) VALUES
(9774679, 'oscar alexander', 'calle12#15a02 edf los girasoles', '3113414361', 'oscarhenao3600@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_carrito`
--

CREATE TABLE `detalles_carrito` (
  `carrito` int(11) NOT NULL,
  `producto` char(80) DEFAULT NULL,
  `usuario` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detalles_carrito`
--

INSERT INTO `detalles_carrito` (`carrito`, `producto`, `usuario`) VALUES
(1, 'Casa de 2 habitaciones sector barrio Granada', 'oscarhenao3600@gmail.com'),
(2, 'Casa de 2 habitaciones sector barrio Granada', 'oscarhenao3600@gmail.com'),
(3, 'Casa sector la Alhambra', 'oscarhenao3600@gmail.com'),
(4, 'Casa sector la Alhambra', 'oscarhenao3600@gmail.com'),
(5, 'Casa de 2 habitaciones sector barrio Granada', 'oscarhenao3600@gmail.com'),
(6, 'Casa sector la Alhambra', 'oscarhenao3600@gmail.com'),
(7, 'Casa de 2 habitaciones sector barrio Granada', 'oscarhenao3600@gmail.com'),
(8, 'Casa tipo campestre zona San Juan', 'oscarhenao3600@gmail.com'),
(9, 'Casa de 2 habitaciones sector barrio Granada', 'oscarhenao3600@gmail.com'),
(10, 'Casa sector la Alhambra', 'oscarhenao3600@gmail.com'),
(11, 'Casa sector la Alhambra', 'oscarhenao3600@gmail.com'),
(12, 'Casa sector la Alhambra', 'oscarhenao3600@gmail.com'),
(13, 'Casa de 2 habitaciones sector barrio Granada', 'oscarhenao3600@gmail.com'),
(14, 'Casa sector la Alhambra', 'oscarhenao3600@gmail.com'),
(15, 'Casa sector la Alhambra', 'oscarhenao3600@gmail.com'),
(16, 'Casa de 2 habitaciones sector barrio Granada', 'oscarhenao3600@gmail.com'),
(17, 'Casa sector la Alhambra', 'oscarhenao3600@gmail.com'),
(18, 'Casa tipo campestre zona San Juan', 'oscarhenao3600@gmail.com'),
(19, 'Casa tipo campestre zona San Juan', 'oscarhenao3600@gmail.com'),
(20, 'Casa de 2 habitaciones sector barrio Granada', 'oscarhenao3600@gmail.com'),
(21, 'Casa tipo campestre zona San Juan', 'oscarhenao3600@gmail.com'),
(22, 'Casa sector la Alhambra', 'oscarhenao3600@gmail.com'),
(23, 'Casa sector La Aurora', 'oscarhenao3600@gmail.com'),
(24, 'Casa de 2 habitaciones sector barrio Granada', 'oscarhenao3600@gmail.com'),
(25, 'Casa sector La clarita', 'oscarhenao3600@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_factura`
--

CREATE TABLE `detalles_factura` (
  `idfactura` int(11) DEFAULT NULL,
  `idusuario` int(11) DEFAULT NULL,
  `idproducto` int(11) DEFAULT NULL,
  `cantidad` int(3) DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `vlr_unitario` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `idfactura` int(11) NOT NULL,
  `nit` char(20) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `rlegal` char(100) DEFAULT NULL,
  `documento` int(11) DEFAULT NULL,
  `nombrecompleto` varchar(150) DEFAULT NULL,
  `direccion` char(100) DEFAULT NULL,
  `telefono` char(12) DEFAULT NULL,
  `ciudad` char(100) DEFAULT NULL,
  `departamento` char(100) DEFAULT NULL,
  `pais` char(50) DEFAULT NULL,
  `email` char(100) DEFAULT NULL,
  `cantidad` int(3) DEFAULT NULL,
  `producto` char(50) DEFAULT NULL,
  `marca` char(30) DEFAULT NULL,
  `color` char(30) DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `disponible` char(1) DEFAULT NULL,
  `vendedor` int(11) DEFAULT NULL,
  `vlr_unitario` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lista_articulo`
--

CREATE TABLE `lista_articulo` (
  `idproducto` int(10) NOT NULL,
  `cantidad` int(3) DEFAULT NULL,
  `nombre` char(50) DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `categoria` int(11) DEFAULT NULL,
  `imagen` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `lista_articulo`
--

INSERT INTO `lista_articulo` (`idproducto`, `cantidad`, `nombre`, `precio`, `categoria`, `imagen`) VALUES
(100, 1, 'Casa de 2 habitaciones sector barrio Granada', 750000, 1, 'equipo1.jpg'),
(101, 1, 'Casa tipo campestre zona San Juan', 1250000, 1, 'equipo2.jpg'),
(102, 1, 'casa 2 plantas zona Los Rosales', 600000, 1, 'equipo3.jpg'),
(103, 1, 'Casa duplex sector Norte', 800000, 1, 'equipo4.jpg'),
(104, 1, 'casa sector la virgiinia', 650000, 1, 'equipo5.jpg'),
(105, 1, 'casa sector la patria', 350000, 1, 'equipo6.jpg'),
(106, 1, 'Casa sector los alamos', 750000, 1, 'equipo7.jpg'),
(200, 1, 'Casa sector la Alhambra', 95000000, 2, 'periferico1.jpg'),
(201, 1, 'Casas sector La Isabela', 250000000, 2, 'periferico2.jpg'),
(202, 1, 'casa sector Maraveles', 115000000, 2, 'periferico3.jpg'),
(203, 1, 'Casa sector La clarita', 350000000, 2, 'periferico4.jpg'),
(204, 1, 'Casa sector Los Naranjos', 150000000, 2, 'periferico5.jpg'),
(205, 1, 'Casa sector La germania', 175000000, 2, 'periferico6.jpg'),
(206, 1, 'Casa sector La Aurora', 185000000, 2, 'periferico7.jpg'),
(207, 1, 'casa sector Mercedes del norte', 280000000, 2, 'periferico8.jpg'),
(208, 1, 'Casa sector Puerto Espejo', 250000000, 2, 'periferico9.jpg'),
(209, 1, 'Casa sector Aeropuerto', 450000000, 2, 'periferico10.jpg'),
(213, 1, 'oscar', 4000000, NULL, 'periferico3.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idproducto` int(11) NOT NULL,
  `nombreproducto` char(80) DEFAULT NULL,
  `tipoproducto` char(30) DEFAULT NULL,
  `idcantidad` int(11) DEFAULT NULL,
  `marca` char(30) DEFAULT NULL,
  `color` char(30) DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `disponible` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_usuario`
--

CREATE TABLE `registro_usuario` (
  `correo` char(50) NOT NULL,
  `nombre` char(100) DEFAULT NULL,
  `clave` char(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `registro_usuario`
--

INSERT INTO `registro_usuario` (`correo`, `nombre`, `clave`) VALUES
('andrelugolopez@gmail.com', 'Andrea', '456'),
('jhonfaber@gmail.com', 'jhon_faber', '$2b$12$9y9cYkh7wQE8sODzh34Aju9QstGeIIEMHgd7jV4/lGojQg6oGtZ5y'),
('oscarhenao3600@gmail.com', 'oscar', '123'),
('vikycruz@gmail.com', 'Viky', '$2b$12$OpUhKh8BPP6skZdQzbIKremU58sEKdpOCAXDfoaEbC2mupDEf3iei');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`idcarrito`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`idcategorias`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`documento`);

--
-- Indices de la tabla `detalles_carrito`
--
ALTER TABLE `detalles_carrito`
  ADD PRIMARY KEY (`carrito`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`idfactura`);

--
-- Indices de la tabla `lista_articulo`
--
ALTER TABLE `lista_articulo`
  ADD PRIMARY KEY (`idproducto`),
  ADD KEY `idcat` (`categoria`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idproducto`);

--
-- Indices de la tabla `registro_usuario`
--
ALTER TABLE `registro_usuario`
  ADD PRIMARY KEY (`correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `idcarrito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `idcategorias` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `detalles_carrito`
--
ALTER TABLE `detalles_carrito`
  MODIFY `carrito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `idfactura` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `lista_articulo`
--
ALTER TABLE `lista_articulo`
  MODIFY `idproducto` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=214;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idproducto` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `lista_articulo`
--
ALTER TABLE `lista_articulo`
  ADD CONSTRAINT `idcat` FOREIGN KEY (`categoria`) REFERENCES `categorias` (`idcategorias`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
