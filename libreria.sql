-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-12-2024 a las 22:28:21
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
-- Base de datos: `libreria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `ID_Cliente` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Correo` varchar(100) NOT NULL,
  `Telefono` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`ID_Cliente`, `Nombre`, `Correo`, `Telefono`) VALUES
(1, 'Miguel', 'Miguel@gmail.com', '31245878'),
(2, 'Ana', 'ana@example.com', '31234567'),
(3, 'Carlos', 'carlos@example.com', '31245678'),
(4, 'Laura', 'laura@example.com', '31256789');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `ID_Libro` int(11) NOT NULL,
  `Titulo` varchar(100) NOT NULL,
  `Autor` varchar(100) NOT NULL,
  `Genero` varchar(100) NOT NULL,
  `Año_Publicacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`ID_Libro`, `Titulo`, `Autor`, `Genero`, `Año_Publicacion`) VALUES
(4, 'Cien Años de Soledad', 'Gabriel Garcia Marquez', 'Ficción', '1967-02-01'),
(5, 'Harry Potter', 'J.K. Rowling', 'Fantasía', '1997-02-01'),
(6, 'Libro de 1894', 'Autor Desconocido', 'Histórico', '1949-02-01'),
(7, 'Don Quijote de la Mancha', 'Miguel de Cervantes', 'Clásico', '1605-01-16'),
(8, 'El Principito', 'Antoine de Saint-Exupéry', 'Ficción', '1943-04-06'),
(9, '1984', 'George Orwell', 'Distopía', '1949-06-08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamos`
--

CREATE TABLE `prestamos` (
  `ID_Prestamos` int(11) NOT NULL,
  `ID_Cliente` int(11) NOT NULL,
  `ID_Libro` int(11) NOT NULL,
  `Fecha_Prestamo` date NOT NULL,
  `Fecha_Devolucion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `prestamos`
--

INSERT INTO `prestamos` (`ID_Prestamos`, `ID_Cliente`, `ID_Libro`, `Fecha_Prestamo`, `Fecha_Devolucion`) VALUES
(4, 1, 4, '2024-12-02', '2024-12-05'),
(5, 2, 5, '2024-12-03', '2024-12-10'),
(6, 3, 6, '2024-12-04', '2024-12-11'),
(7, 4, 6, '2024-12-10', '2024-12-15'),
(8, 3, 4, '2024-12-11', '2024-12-18'),
(9, 2, 5, '2024-12-12', '2024-12-19');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`ID_Cliente`);

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`ID_Libro`);

--
-- Indices de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD PRIMARY KEY (`ID_Prestamos`),
  ADD KEY `ID_Cliente` (`ID_Cliente`),
  ADD KEY `ID_Libro` (`ID_Libro`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `ID_Cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `libros`
--
ALTER TABLE `libros`
  MODIFY `ID_Libro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  MODIFY `ID_Prestamos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD CONSTRAINT `prestamos_ibfk_1` FOREIGN KEY (`ID_Cliente`) REFERENCES `clientes` (`ID_Cliente`),
  ADD CONSTRAINT `prestamos_ibfk_2` FOREIGN KEY (`ID_Libro`) REFERENCES `libros` (`ID_Libro`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
