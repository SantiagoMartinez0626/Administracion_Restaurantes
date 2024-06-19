-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-06-2024 a las 04:39:25
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `adminrestaurant`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `id` int(11) NOT NULL,
  `producto` varchar(100) NOT NULL,
  `marca` varchar(100) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `fecha_pedido` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`id`, `producto`, `marca`, `precio`, `fecha_pedido`) VALUES
(1, 'Pan de perro', 'Bimbo', 4.00, '2024-06-18'),
(2, 'Salchicha', 'Oscar Mayer', 5.50, '2024-06-18'),
(3, 'Mostaza', 'Heinz', 2.00, '2024-06-18'),
(4, 'Pan de hamburguesa', 'Wonder', 3.00, '2024-06-18'),
(5, 'Carne de hamburguesa', 'Angus Beef', 8.00, '2024-06-18'),
(6, 'Queso cheddar', 'Kraft', 4.50, '2024-06-18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `fecha_pedido` datetime NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `estado` enum('activo','finalizado') NOT NULL,
  `metodo_pago` varchar(50) NOT NULL,
  `comentarios` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `fecha_pedido`, `total`, `estado`, `metodo_pago`, `comentarios`) VALUES
(1, '2024-06-18 12:34:56', 45.99, 'finalizado', 'tarjeta', 'Pedido especial sin cebolla'),
(5, '2024-06-19 03:42:33', 5.50, 'activo', 'Efectivo', 'Pedido automático desde inventarios.php'),
(6, '2024-06-19 03:43:53', 5.50, 'activo', 'Efectivo', 'Pedido automático desde inventarios.php');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos_finalizados`
--

CREATE TABLE `pedidos_finalizados` (
  `id` int(11) NOT NULL,
  `fecha_pedido` datetime NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `estado` enum('activo','finalizado') NOT NULL,
  `metodo_pago` varchar(50) NOT NULL,
  `comentarios` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos_finalizados`
--

INSERT INTO `pedidos_finalizados` (`id`, `fecha_pedido`, `total`, `estado`, `metodo_pago`, `comentarios`) VALUES
(1, '2024-06-19 02:36:12', 55.00, 'finalizado', 'efectivo', 'Ninguno.'),
(2, '2024-06-19 03:41:25', 64.00, 'finalizado', 'efectivo', 'Ninguno'),
(3, '2024-06-19 03:41:25', 45.00, 'finalizado', 'Nequi', 'Ninguno');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas`
--

CREATE TABLE `reservas` (
  `id` int(11) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `fecha_de_reserva` date NOT NULL,
  `numero_de_personas` int(11) NOT NULL,
  `comentarios` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reservas`
--

INSERT INTO `reservas` (`id`, `nombres`, `apellidos`, `telefono`, `fecha_de_reserva`, `numero_de_personas`, `comentarios`) VALUES
(1, 'Wilmer', 'Contreras Delgado', '3104552156', '2024-06-20', 3, 'Ninguno.'),
(2, 'Sebastian Felipe', 'Rocha Leal', '3222585465', '2024-06-19', 10, 'Mesa familiar.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `clave` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `usuario`, `clave`) VALUES
(1, 'santiago', '123456');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedidos_finalizados`
--
ALTER TABLE `pedidos_finalizados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario` (`usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `pedidos_finalizados`
--
ALTER TABLE `pedidos_finalizados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `reservas`
--
ALTER TABLE `reservas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
