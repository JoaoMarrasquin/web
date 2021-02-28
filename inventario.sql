-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-02-2021 a las 05:10:45
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `inventario`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `almacen`
--

CREATE TABLE `almacen` (
  `idAlmacen` int(10) UNSIGNED NOT NULL,
  `idSucursal` int(10) UNSIGNED NOT NULL,
  `idProducto` int(10) UNSIGNED NOT NULL,
  `cantidadAlmacen` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `cantidadConsumo` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `almacen`
--

INSERT INTO `almacen` (`idAlmacen`, `idSucursal`, `idProducto`, `cantidadAlmacen`, `cantidadConsumo`) VALUES
(2661, 1, 1331, 0, 0),
(2662, 1, 1332, 0, 0),
(2663, 1, 1334, 1000, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignacionbasicos`
--

CREATE TABLE `asignacionbasicos` (
  `idUsuario` int(10) UNSIGNED NOT NULL,
  `idTecnica` int(10) UNSIGNED NOT NULL,
  `idProducto` int(10) UNSIGNED NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bajas`
--

CREATE TABLE `bajas` (
  `idUsuario` int(10) UNSIGNED NOT NULL,
  `idProducto` int(10) UNSIGNED NOT NULL,
  `cantidad` int(10) UNSIGNED NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `bajas`
--

INSERT INTO `bajas` (`idUsuario`, `idProducto`, `cantidad`, `fecha`) VALUES
(8, 1334, 1, '2021-02-27 10:11:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bajasbasicos`
--

CREATE TABLE `bajasbasicos` (
  `idUsuario` int(10) UNSIGNED NOT NULL,
  `idTecnica` int(10) UNSIGNED NOT NULL,
  `idProducto` int(10) UNSIGNED NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `basicosenuso`
--

CREATE TABLE `basicosenuso` (
  `idTecnica` int(10) UNSIGNED NOT NULL,
  `idProducto` int(10) UNSIGNED NOT NULL,
  `enUso` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `idCategoria` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`idCategoria`, `nombre`, `descripcion`) VALUES
(9, 'Coca Cola', 'Empresa dedica a la venta de bebidas '),
(10, 'Nestle', 'Empresa dedica a la venta de leche, dulces y varie'),
(11, 'Pepsicon', 'Empresa dedicada a la venta de bebidas'),
(12, 'Supan', 'Venta de panes y variedad');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos`
--

CREATE TABLE `movimientos` (
  `idUsuario` int(10) UNSIGNED NOT NULL,
  `idProducto` int(10) UNSIGNED NOT NULL,
  `cantidad` int(10) UNSIGNED NOT NULL,
  `tipo` tinyint(1) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `movimientos`
--

INSERT INTO `movimientos` (`idUsuario`, `idProducto`, `cantidad`, `tipo`, `fecha`) VALUES
(8, 1334, 1001, 1, '2021-02-27 10:11:13'),
(8, 1334, 1, 0, '2021-02-27 10:11:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idProducto` int(10) UNSIGNED NOT NULL,
  `idCategoria` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `minimo` int(10) UNSIGNED NOT NULL,
  `esBasico` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idProducto`, `idCategoria`, `nombre`, `descripcion`, `codigo`, `minimo`, `esBasico`) VALUES
(1331, 11, 'Pepsi', 'Cola', '12414141', 1000, 0),
(1332, 12, 'Pan de molde', 'Pan', '1', 1000, 0),
(1334, 9, 'Sprite', 'Cola', '12', 1000, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursales`
--

CREATE TABLE `sucursales` (
  `idSucursal` int(10) UNSIGNED NOT NULL,
  `plaza` varchar(30) NOT NULL,
  `ciudad` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sucursales`
--

INSERT INTO `sucursales` (`idSucursal`, `plaza`, `ciudad`) VALUES
(1, 'Los Esteros', 'Manta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tecnicas`
--

CREATE TABLE `tecnicas` (
  `idTecnica` int(10) UNSIGNED NOT NULL,
  `idSucursal` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuario` int(10) UNSIGNED NOT NULL,
  `idSucursal` int(10) UNSIGNED NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `permisos` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `idSucursal`, `username`, `password`, `permisos`, `nombre`, `apellido`, `status`) VALUES
(1, 1, 'joao', '123', 2, 'joao', 'moreira', 1),
(7, 1, 'omar', '$2a$10$Vhst68orsc0WYBke9Ahmz.ZL/ImgoLt48jxmCPOXOD/kC4AkN5bDa', 1, 'Omar', 'Limon', 1),
(8, 1, 'pablo', '$2a$10$VyJHOfCniDDesGrn8OvkK.wIZg54maGjWkXUNOIll0Jt7sorp6jOq', 0, 'pablo', '121', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `almacen`
--
ALTER TABLE `almacen`
  ADD PRIMARY KEY (`idAlmacen`),
  ADD KEY `idSucursal` (`idSucursal`),
  ADD KEY `idProducto` (`idProducto`);

--
-- Indices de la tabla `asignacionbasicos`
--
ALTER TABLE `asignacionbasicos`
  ADD KEY `idUsuario` (`idUsuario`),
  ADD KEY `idTecnica` (`idTecnica`),
  ADD KEY `idProducto` (`idProducto`);

--
-- Indices de la tabla `bajas`
--
ALTER TABLE `bajas`
  ADD KEY `idUsuario` (`idUsuario`),
  ADD KEY `idProducto` (`idProducto`);

--
-- Indices de la tabla `bajasbasicos`
--
ALTER TABLE `bajasbasicos`
  ADD KEY `idUsuario` (`idUsuario`),
  ADD KEY `idTecnica` (`idTecnica`),
  ADD KEY `idProducto` (`idProducto`);

--
-- Indices de la tabla `basicosenuso`
--
ALTER TABLE `basicosenuso`
  ADD KEY `idProducto` (`idProducto`),
  ADD KEY `idTecnica` (`idTecnica`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`idCategoria`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD KEY `idUsuario` (`idUsuario`),
  ADD KEY `idProducto` (`idProducto`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idProducto`),
  ADD UNIQUE KEY `codigo` (`codigo`),
  ADD KEY `idCategoria` (`idCategoria`);

--
-- Indices de la tabla `sucursales`
--
ALTER TABLE `sucursales`
  ADD PRIMARY KEY (`idSucursal`),
  ADD UNIQUE KEY `plaza` (`plaza`);

--
-- Indices de la tabla `tecnicas`
--
ALTER TABLE `tecnicas`
  ADD PRIMARY KEY (`idTecnica`),
  ADD KEY `idSucursal` (`idSucursal`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuario`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `idSucursal` (`idSucursal`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `almacen`
--
ALTER TABLE `almacen`
  MODIFY `idAlmacen` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2664;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `idCategoria` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idProducto` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1335;

--
-- AUTO_INCREMENT de la tabla `sucursales`
--
ALTER TABLE `sucursales`
  MODIFY `idSucursal` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tecnicas`
--
ALTER TABLE `tecnicas`
  MODIFY `idTecnica` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuario` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `almacen`
--
ALTER TABLE `almacen`
  ADD CONSTRAINT `almacen_ibfk_1` FOREIGN KEY (`idSucursal`) REFERENCES `sucursales` (`idSucursal`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `almacen_ibfk_2` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `asignacionbasicos`
--
ALTER TABLE `asignacionbasicos`
  ADD CONSTRAINT `asignacionbasicos_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `asignacionbasicos_ibfk_2` FOREIGN KEY (`idTecnica`) REFERENCES `tecnicas` (`idTecnica`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `asignacionbasicos_ibfk_3` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `bajas`
--
ALTER TABLE `bajas`
  ADD CONSTRAINT `bajas_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `bajas_ibfk_2` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `bajasbasicos`
--
ALTER TABLE `bajasbasicos`
  ADD CONSTRAINT `bajasbasicos_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `bajasbasicos_ibfk_2` FOREIGN KEY (`idTecnica`) REFERENCES `tecnicas` (`idTecnica`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `bajasbasicos_ibfk_3` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `basicosenuso`
--
ALTER TABLE `basicosenuso`
  ADD CONSTRAINT `basicosenuso_ibfk_1` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `basicosenuso_ibfk_2` FOREIGN KEY (`idTecnica`) REFERENCES `tecnicas` (`idTecnica`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD CONSTRAINT `movimientos_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `movimientos_ibfk_2` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`idCategoria`) REFERENCES `categorias` (`idCategoria`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tecnicas`
--
ALTER TABLE `tecnicas`
  ADD CONSTRAINT `tecnicas_ibfk_1` FOREIGN KEY (`idSucursal`) REFERENCES `sucursales` (`idSucursal`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`idSucursal`) REFERENCES `sucursales` (`idSucursal`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
