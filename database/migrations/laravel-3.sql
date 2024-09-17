-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: mysql
-- Tiempo de generación: 17-09-2024 a las 15:03:54
-- Versión del servidor: 8.0.32
-- Versión de PHP: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `laravel`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `areas`
--

CREATE TABLE `areas` (
  `idArea` int NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `areas`
--

INSERT INTO `areas` (`idArea`, `nombre`) VALUES
(1, 'Sistemas'),
(2, 'Gestión Ingenieril'),
(3, 'Programación'),
(4, 'Computación'),
(5, 'Modelos'),
(6, 'Apoyo ISI'),
(7, 'Desarrollo de Software'),
(8, 'Computación Y Comunicación de Datos'),
(9, 'Sistemas Inteligentes'),
(10, 'Sistemas de Información');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignaturas`
--

CREATE TABLE `asignaturas` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigo` int NOT NULL,
  `activo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aulas`
--

CREATE TABLE `aulas` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direccion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `aulas`
--

INSERT INTO `aulas` (`id`, `name`, `codigo`, `direccion`, `activo`, `created_at`, `updated_at`) VALUES
(1, '101', 'dsf', 'Zeballo 1432', 'Si', '2024-06-11 23:36:05', '2024-06-12 15:58:50'),
(2, '102', 'cdvd', 'Zeballo 1342', 'Si', '2024-06-12 00:54:13', '2024-06-12 15:58:36'),
(3, '103', '103', 'Zeballo 1341', 'Si', '2024-06-12 15:59:20', '2024-06-12 15:59:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auxiliares`
--

CREATE TABLE `auxiliares` (
  `id` bigint UNSIGNED NOT NULL,
  `Descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('juanpablo.dure@hgtsa.com.ar|172.18.0.1', 'i:2;', 1724013227),
('juanpablo.dure@hgtsa.com.ar|172.18.0.1:timer', 'i:1724013227;', 1724013227),
('juanpablo.dure@test.com|172.18.0.1', 'i:4;', 1724876248),
('juanpablo.dure@test.com|172.18.0.1:timer', 'i:1724876248;', 1724876248),
('juanpabo.dure@gmail.com|172.18.0.1', 'i:1;', 1723930557),
('juanpabo.dure@gmail.com|172.18.0.1:timer', 'i:1723930557;', 1723930557),
('juanpabo.dure@hgtsa.com.ar|172.18.0.1', 'i:1;', 1723914803),
('juanpabo.dure@hgtsa.com.ar|172.18.0.1:timer', 'i:1723914803;', 1723914803),
('uanpablo.dure@gmail.com|172.18.0.1', 'i:1;', 1723915378),
('uanpablo.dure@gmail.com|172.18.0.1:timer', 'i:1723915378;', 1723915378);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargos`
--

CREATE TABLE `cargos` (
  `idCargo` int NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cargos`
--

INSERT INTO `cargos` (`idCargo`, `nombre`) VALUES
(1, 'Prof. Adjunto'),
(2, 'Prof. Asociado'),
(3, 'Prof. Titular'),
(4, 'Jefe T. P.'),
(5, 'Ayte. T. P. 1ra'),
(6, 'Ayte. T. P. 2da');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carreras`
--

CREATE TABLE `carreras` (
  `id` bigint UNSIGNED NOT NULL,
  `carrera` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comisiones`
--

CREATE TABLE `comisiones` (
  `idComision` int NOT NULL,
  `idTurno` int DEFAULT NULL,
  `comisionNro` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigo` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activo` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `comisiones`
--

INSERT INTO `comisiones` (`idComision`, `idTurno`, `comisionNro`, `name`, `codigo`, `tipo`, `activo`) VALUES
(1, 1, '101', '', '', '', ''),
(2, 1, '102', '', '', '', ''),
(3, 1, '103', '', '', '', ''),
(4, 1, '104', '', '', '', ''),
(5, 1, '105', '', '', '', ''),
(6, 1, '106', '', '', '', ''),
(7, 1, '107', '', '', '', ''),
(8, 1, '108', '', '', '', ''),
(9, 1, '109', '', '', '', ''),
(10, 2, '110', '', '', '', ''),
(11, 2, '111', '', '', '', ''),
(12, 3, '113', '', '', '', ''),
(13, 3, '114', '', '', '', ''),
(14, 1, '201', '', '', '', ''),
(15, 1, '202', '', '', '', ''),
(16, 1, '203', '', '', '', ''),
(17, 1, '204', '', '', '', ''),
(18, 1, '206', '', '', '', ''),
(19, 2, '207', '', '', '', ''),
(20, 3, '208', '', '', '', ''),
(21, 3, '209', '', '', '', ''),
(22, 1, '302', '', '', '', ''),
(23, 1, '304', '', '', '', ''),
(24, 3, '401', '', '', '', ''),
(25, 1, '402', '', '', '', ''),
(26, 1, '404', '', '', '', ''),
(27, 3, '501', '', '', '', ''),
(28, 2, '502', '', '', '', ''),
(29, 1, '503', '', '', '', ''),
(30, 2, '2E01', '', '', '', ''),
(31, 2, '2E02', '', '', '', ''),
(32, 3, '301', '', '', '', ''),
(33, 2, '303', '', '', '', ''),
(34, 1, '305', '', '', '', ''),
(35, 1, '3A01', '', '', '', ''),
(36, 1, '3E01', '', '', '', ''),
(37, 2, '3E02', '', '', '', ''),
(38, 3, '3E03', '', '', '', ''),
(39, 3, '3E05', '', '', '', ''),
(40, 3, '3E06', '', '', '', ''),
(41, 2, '3E07', '', '', '', ''),
(42, 1, '3E08', '', '', '', ''),
(43, 2, '403', '', '', '', ''),
(44, 2, '4A01', '', '', '', ''),
(45, 2, '4A02', '', '', '', ''),
(46, 2, '4E01', '', '', '', ''),
(47, 2, '4E02', '', '', '', ''),
(48, 3, '4E03', '', '', '', ''),
(49, 3, '4E04', '', '', '', ''),
(50, 3, '5E01', '', '', '', ''),
(51, 2, '5E02', '', '', '', ''),
(52, 1, '5E03', '', '', '', ''),
(53, 2, '5E04', '', '', '', ''),
(54, 1, '5E05', '', '', '', ''),
(55, 1, '5E06', '', '', '', ''),
(56, 3, '5E07', '', '', '', ''),
(57, NULL, 'Todas', '', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docentes`
--

CREATE TABLE `docentes` (
  `idDocente` int UNSIGNED NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `apellido` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `legajo` int DEFAULT NULL,
  `tipoDoc` enum('DNI','LC','LE','CI') CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `nroDoc` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `direccion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `idPais` int DEFAULT NULL,
  `idProvincia` int DEFAULT NULL,
  `idLocalidad` int DEFAULT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  `edad` int DEFAULT NULL,
  `telCelular` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `telFijo` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `emailSistemas` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `emailDocente` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `userName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `imagen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  `fechaActivo` datetime DEFAULT NULL,
  `verificado` tinyint(1) DEFAULT NULL,
  `fechaVerificado` datetime DEFAULT NULL,
  `add_user` int DEFAULT NULL,
  `add_date` datetime DEFAULT NULL,
  `edit_user` int DEFAULT NULL,
  `edit_date` datetime DEFAULT NULL,
  `kill_user` int DEFAULT NULL,
  `kill_date` datetime DEFAULT NULL,
  `eliminado` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `docentes`
--

INSERT INTO `docentes` (`idDocente`, `nombre`, `apellido`, `legajo`, `tipoDoc`, `nroDoc`, `direccion`, `idPais`, `idProvincia`, `idLocalidad`, `fechaNacimiento`, `edad`, `telCelular`, `telFijo`, `emailSistemas`, `emailDocente`, `userName`, `password`, `imagen`, `activo`, `fechaActivo`, `verificado`, `fechaVerificado`, `add_user`, `add_date`, `edit_user`, `edit_date`, `kill_user`, `kill_date`, `eliminado`) VALUES
(11, 'Germán G', 'MUDRY', 41446, 'DNI', '21008745', 'Viamonte 94 A', 13, 23, 2232, '1969-11-15', 52, '3416647383', '4571693', 'svega0@gmail.com', 'svega0@gmail.com', NULL, '382936e4ec980de1c8c573414b1004faaa7ec29c', NULL, 1, NULL, 1, NULL, NULL, NULL, 0, '2022-05-24 16:05:12', NULL, NULL, 0),
(15, 'Manu', 'CERRO', 88888, 'DNI', '20202020', 'cordoba  7700', 13, 22, 2104, '1995-12-10', 26, '341565265', '341564559', 'manuc@gmail.com', 'manuc@gmail.com', NULL, '9eab102e8f9431bb23016851d11e658e0b20b730', NULL, 0, NULL, 0, NULL, 1, '2022-05-26 11:05:25', 1, NULL, 1, '2022-05-31 16:05:23', 1),
(16, 'Valeria Andrea', 'AGUZZI', 38821, 'DNI', '23785770', 'Santa Fe 2398 - Funes', 13, 22, 2104, '1974-01-29', 48, '3416429494', '3414937702', 'valeria_aguzzi@yahoo.com.ar', 'valeria_aguzzi@yahoo.com.ar', NULL, 'b96a876fedbbc68c67ea7b205266126c94c32b4f', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-30 11:06:40', NULL, NULL, 0),
(17, 'Roberto Domingo', 'ALBANESE', 28354, NULL, '10066535', NULL, 13, 22, 2104, NULL, NULL, '', NULL, '', NULL, NULL, 'c9f7b6d458bd497ff6e89869a42493548b172458', NULL, 1, NULL, 0, NULL, 1, '2022-05-31 16:05:05', NULL, NULL, NULL, NULL, 0),
(18, 'Eduardo Hector', 'AMAR', 33126, 'DNI', '20298818', 'Constitución 465 - Dto. 2', 13, 22, 2104, '1969-07-13', 52, '3413520516', NULL, 'eduardoamar000@gmail.com', 'eduardoamar000@gmail.com', NULL, '853d81fd8a726a39442cc1c7166b8432d8afdf18', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-08 17:06:24', NULL, NULL, 0),
(19, 'Laura Marcela', 'AQUILI', 40493, 'DNI', '25840332', 'Laprida 1925 9 B', 13, 22, 2104, '1977-05-03', 45, '3416967359', NULL, 'lauaquili@hotmail.com', 'laquili@frro.utn.edu.ar', NULL, 'edfc1b47561dd3e570afc34b3505ef2af867070f', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-13 16:06:03', NULL, NULL, 0),
(20, 'Jose Carlos', 'ARAMBURU', 55897, 'DNI', '23317055', 'jose eusebio colombres 390 Bis', 13, 22, 2104, '1973-03-07', 49, '3413417533', NULL, 'jcaramburu@frro.utn.edu.ar', 'jcaramburu@frro.utn.edu.ar', NULL, '4667f89cdf0846b443440a20bc1295fdce9b02cf', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-29 16:06:09', NULL, NULL, 0),
(21, 'Jorge Alberto', 'ARIAS', 59231, 'DNI', '17869888', '1 de Mayo 1536 Piso 11 depto 01', 13, 22, 2104, '1966-08-14', 55, '3415999913', NULL, 'ariasjorge66@gmail.com', 'ariasjorge66@gmail.com', NULL, '11ffbf8d95b570996e0313ff8532be4ca8369daa', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-07-01 19:07:17', NULL, NULL, 0),
(22, 'Joel', 'ARNOLD', 91331, 'DNI', '33720429', 'José C. Paz 1044', 13, 22, 2104, '1988-04-17', 34, '3415325530', '3412977230', 'joel.arnold.ar@gmail.com', 'jarnold@frro.utn.edu.ar', NULL, 'b5081afac8a001ca820a07160d610f4b018877fe', NULL, 0, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-29 14:06:42', NULL, NULL, 0),
(23, 'Leonardo Matias', 'ARRIGONI', 52519, 'DNI', '28914373', 'Cullen 1626', 13, 22, 2104, '1981-10-01', 40, '3413461811', NULL, 'leonardo.m.arrigoni@gmail.com', 'leonardo.m.arrigoni@gmail.com', NULL, '242d1fd1126cc18c77449779e85341fa93489e5f', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-22 08:06:04', NULL, NULL, 0),
(24, 'Mariano Javier', 'BADOGLIO', 56908, 'DNI', '27320714', 'Castagnino 954 Dto. 3', 13, 22, 2104, '1979-06-06', 43, '3413443681', NULL, 'marianobadoglio@gmail.com', 'marianobadoglio@gmail.com', NULL, '36a5371cac66a032e982bc2924dd3deb458a9554', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-29 17:06:03', NULL, NULL, 0),
(25, 'Germán Bernardo', 'BARÓ', 34211, 'DNI', '16269896', 'Catamarca 1932 2 A', 13, 22, 2104, '1963-02-11', 59, '03415856555', '03414257809', 'gbaro@unr.edu.ar', 'gbaro@unr.edu.ar', NULL, '45f6ac6a18a7d0bca6725dff6a2d62701ebc0c36', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-14 10:06:02', NULL, NULL, 0),
(26, 'Eva Lorena', 'BELLINI', 45679, 'DNI', '23501289', 'Liniers 618', 13, 22, 2104, '1973-10-31', 50, '3413234724', NULL, 'evabellini@gmail.com', 'evabellini@gmail.com', NULL, 'c2f52023148a96b7eedfee224498c7f07e0a2ea2', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', 39, '2024-03-08 10:03:03', NULL, NULL, 0),
(27, 'Juan Pablo', 'BELTRAMONE', 35955, 'DNI', '20948484', 'Av. Fuerza Aerea 3102 - Funes', 13, 22, 2104, '1969-11-29', 52, '3415638520', NULL, 'beltrajp@hotmail.com', 'beltrajp@gmail.com', NULL, '085869315488a55a8603f9a935341a0fd4669061', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-07-25 18:07:31', NULL, NULL, 0),
(28, 'Milena Alejandra', 'BERTINETTI', 45681, 'DNI', '27442392', 'Paraguay 2348 4 B', 13, 22, 2104, '1979-06-22', 42, '3415469529', NULL, 'mbertinetti2003@yahoo.com.ar', 'mbertinetti2003@yahoo.com.ar', NULL, '804fa576c28ebaec446a4a0e783c37693f50d9f9', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-13 10:06:38', NULL, NULL, 0),
(29, 'Cristian Germán', 'BIGATTI', 37128, 'DNI', '23007092', 'Bv. Oroño 3655', 13, 22, 2104, '1973-01-24', 49, '3664066', '341', 'cristianbigatti@gmail.com', 'cristianbigatti@gmail.com', NULL, 'e71d34f307f3a2c6dc2822c1e7c3eb910debe81b', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-10 19:06:58', NULL, NULL, 0),
(30, 'Mario Osvaldo', 'BRESSANO', 26795, 'DNI', '16265664', 'Laprida 4854', 13, 22, 2104, '1963-03-27', 59, '3415400549', NULL, 'mbressano@frro.utn.edu.ar', 'mbressano@frro.utn.edu.ar', NULL, 'de40578247ecc3137df8e6fc773c727b26c5be93', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-11 12:06:03', NULL, NULL, 0),
(31, 'Aldo Alberto', 'BROZZO', 41750, 'DNI', '23928953', 'Sarmiento 1844', 13, 22, 2104, '1974-11-23', 47, '3413595115', NULL, 'aldo.brozzo.utn@gmail.com', 'aldo.brozzo.utn@gmail.com', NULL, '6d35b1ca3cc14cee58caadff0952c4e2689665a1', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-14 19:06:27', NULL, NULL, 0),
(32, 'Emelin', 'BUSCAGLIA', 90929, 'DNI', '37715098', 'Psj. Angeloni 4630 PB', 13, 22, 2104, '1994-04-03', 28, '3412778879', NULL, 'emelinbus@gmail.com', 'ebuscaglia@frro.utn.edu.ar', NULL, '7b44ebcc59099eeb54d6a4c69fc8c77c20a58906', NULL, 0, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-11 18:06:18', NULL, NULL, 0),
(33, 'Julian Gabriel', 'BUTTI', 88293, 'DNI', '32957554', 'san juan 2552', 13, 22, 2087, '1987-06-08', 35, '314229993', NULL, 'julianbutti@gmail.com', 'jbutti@frro.utn.edu.ar', NULL, 'c7f9004b07bd9ee4e55c14350b8f4ac2998c9a00', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-10 15:06:31', NULL, NULL, 0),
(34, 'Milton', 'BUZEY', 40756, 'DNI', '24598539', 'Zuloaga 1789', 13, 22, 1968, '1975-08-23', 46, '3415882199', NULL, 'milton.buzey@gmail.com', 'milton.buzey.utn@gmail.com', NULL, 'f4200b3cbe76699e65838582a37d18ec56fc75e2', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-13 16:06:36', NULL, NULL, 0),
(35, 'Jorge Alberto', 'CAMPANARO', 21356, 'DNI', '12110224', 'JUAN B. JUSTO 1025', 13, 22, 2104, '1956-02-08', 66, '3416402060', '3415255922', 'jorge.a.campanaro@gmail.com', 'jorge.a.campanaro@gmail.com', NULL, '0facb9f2bc839d7d2561108c28003bf357869b08', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-12 19:06:06', NULL, NULL, 0),
(36, 'Stella Maris Lucia', 'CARBONE', 26858, 'DNI', '16982231', 'COLON 3099', 13, 22, 2104, '1964-11-09', 57, '3416920867', '4815165', 'smcarbone@hotmail.com', 'scarbone@frro.utn.edu.ar', NULL, '696f41d4dc25fd45031c3ffc50485a03ffad231d', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-22 13:06:08', NULL, NULL, 0),
(37, 'Mario Alejandro', 'CASTAGNINO', 31327, 'DNI', '18455030', 'Newbery 9041 - Lote 110', 13, 22, 2104, '1967-11-29', 54, '3416910570', '3414223220', 'marioalejandro3@gmail.com', 'marioalejandro3@gmail.com', NULL, '9250dd96550c0cbb221cf19251d0096644676cd6', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-16 12:06:46', NULL, NULL, 0),
(38, 'Ruben', 'CICCARELLI', 18033, NULL, '11655179', NULL, 13, 22, 2104, NULL, NULL, '', NULL, '', NULL, NULL, '7e55006f91f58725463e5ad19000cb081ff29316', NULL, 1, NULL, 0, NULL, 1, '2022-05-31 16:05:05', NULL, NULL, NULL, NULL, 0),
(39, 'Gustavo', 'CITARELLO', 28356, 'DNI', '18437220', 'España 326', 13, 22, 2104, '1968-10-05', 53, '3416028261', NULL, 'gcitarello@frro.utn.edu.ar', 'gcitarello@frro.utn.edu.ar', NULL, '8eb5c62ba1fd2050e920ce46843183442cf38676', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-15 14:06:42', NULL, NULL, 0),
(40, 'Hernan', 'CORNEJO', 45872, 'DNI', '14729159', 'Salta 1677', 13, 22, 2104, '1962-04-18', 60, '3415897727', '3415897727', 'hcornejo@frro.utn.edu.ar', 'gerencialrosutn@gmail.com', NULL, '60d44af15b8b769a370b08117056f9817a1d744b', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-11 20:06:46', NULL, NULL, 0),
(41, 'Ariana Erica', 'CUCCHIARA', 32388, 'DNI', '20854021', 'Alem 2356 3ero 2', 13, 22, 2104, '1969-09-23', 52, '3416183522', '03414237888', 'AECucchiara@teco.com.ar', 'AECucchiara@teco.com.ar', NULL, '41ea0d40fa94a5db51e8b228c6839d9c8bcad441', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-01 15:06:06', NULL, NULL, 0),
(42, 'Patricio Luis', 'CULLEN', 50433, 'DNI', '30170661', '9 de julio 3223 8vo 1', 13, 22, 2104, '1983-04-18', 40, '3416160227', NULL, 'cullenpatricio@gmail.com', 'cullenpatricio@gmail.com', NULL, 'd0dc6005278e8921cd02f16c5c4efcb3b81ed7fc', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2023-08-09 10:08:43', NULL, NULL, 0),
(43, 'Claudia Estela', 'DANIA', 18988, 'DNI', '16306758', 'sánchez de loria 258 bis', 13, 22, 2104, '1963-05-15', 59, '3416178733', '03414511076', 'claudiadania@gmail.com', 'claudiadania@gmail.com', NULL, '9de350c21265d45fdd453a14481f7ef4d5a3d642', NULL, 0, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-12 17:06:10', NULL, NULL, 0),
(44, 'Florencia', 'D ARRIGO', 36913, 'DNI', '21946502', 'Mitre 1008', 13, 22, 1968, '1970-11-27', 51, '3416949276', '4936619', 'florenciadarrigo@gmail.com', 'florenciadarrigo@gmail.com', NULL, '2c1db4e2f8f0bf61fbc1842b19aba3308bfe6529', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-28 17:06:14', NULL, NULL, 0),
(45, 'Monica', 'DEL SASTRE', 36735, 'DNI', '18599060', 'Montevideo 2467', 13, 22, 2104, '1967-11-07', 54, '3415098040', NULL, 'delsas@fceia.unr.edu.ar', 'delsas@fceia.unr.edu.ar', NULL, '0e3bd989a6dce8db0055e8acfd50e63842658125', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-28 18:06:51', NULL, NULL, 0),
(46, 'Fernando Esteba Luis', 'DELMONTE', 74103, 'DNI', '16935175', 'Av 1 De Junio 690, 00', 13, 22, 2104, '1964-06-21', 57, '3413710344', '03414909030', 'fdelmonte@frro.utn.edu.ar', 'fdelmonte@frro.utn.edu.ar', NULL, 'de49b3a4a865a4c0b3d56a56e43d98ef4fe6f98c', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-13 10:06:20', NULL, NULL, 0),
(47, 'Martina', 'DI CARLO', 91680, 'DNI', '38900585', 'Jujuy 2773 3E', 13, 22, 2104, '1995-06-14', 27, '3416273207', NULL, 'martinadicarloo@gmail.com', 'martinadicarloo@gmail.com', NULL, '0660ddccafcee906f1f8ec5979ab473c9fb86a38', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-29 18:06:33', NULL, NULL, 0),
(48, 'Luciano Daniel', 'DIAMAND', 87308, 'DNI', '23761971', 'Pellegrini 1858 9', 13, 22, 2104, '1975-02-23', 47, '3415191480', NULL, 'ldiamand@frro.utn.edu.ar', 'ldiamand@frro.utn.edu.ar', NULL, 'f539b687aebcd0cc01f21858ff4adaa46e484d80', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-29 19:06:20', NULL, NULL, 0),
(49, 'Daniela Elisabet', 'DIAZ', 37953, 'DNI', '24492260', '3 de Febrero 665', 13, 22, 2104, '1975-05-16', 47, '3413654507', '4212231', 'danyelisabet@gmail.com', 'danyelisabet@gmail.com', NULL, '555377ae35d3810523cdd68787aaf4dbec10e808', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-11 10:06:02', NULL, NULL, 0),
(50, 'Juan Pablo', 'DURE', 91603, 'DNI', '30392455', 'ituzaingo 21 bis 8d', 13, 22, 2104, '1983-09-26', 38, '3412516354', NULL, 'juanpablo.dure@gmail.com', 'juanpablo.dure@gmail.com', NULL, '7a830010122d184e594e9d543504a61a45b9a091', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-29 19:06:23', NULL, NULL, 0),
(51, 'Maria Elena', 'FARIAS', 26857, 'DNI', '18570825', 'EVA PERON 4467', 13, 22, 2104, '1967-08-29', 54, '3413418041', NULL, 'mefarias@frro.utn.edu.ar', 'mefarias@frro.utn.edu.ar', NULL, '5e703c16510b692d4c224155e5e7cf0ffdd295f2', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-13 16:06:03', NULL, NULL, 0),
(52, 'Renzo', 'FASCENDINI', 89790, 'DNI', '39948162', 'Chassaing 7736', 13, 22, 2104, '1996-08-28', 27, '3413092900', NULL, 'renzo.jrr10@gmail.com', 'renzo.jrr10@gmail.com', NULL, '601f1889667efaebb33b8c12572835da3f027f78', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', 0, '2024-03-27 03:03:10', NULL, NULL, 0),
(53, 'Luis Raul', 'FERABOLI', 18991, 'DNI', '12113678', 'Rueda 863', 13, 22, 2104, '1958-02-09', 65, '3416439710', '3414492540', 'lferaboli@gmail.com', 'lferaboli@gmail.com', NULL, '8c7a20d1e1177f348995209bf89c5118569d1419', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2023-03-19 18:03:30', NULL, NULL, 0),
(54, 'Pablo Nicolás', 'FERNÁNDEZ', 89392, 'DNI', '33281024', 'Laprida 2046 4 c', 13, 22, 2104, '1987-12-03', 34, '3415608119', NULL, 'mailpablofernandez@gmail.com', 'mailpablofernandez@gmail.com', NULL, '2e6fed012f69322647b29b20a11a9ff7373e741e', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-28 18:06:44', NULL, NULL, 0),
(55, 'Maira', 'FIORENZA', 88952, 'DNI', '28929173', 'DIAZ VELEZ 45', 13, 22, 2104, '1981-07-04', 40, '3413295900', NULL, 'mairagfiorenza@gmail.com', 'mairagfiorenza@gmail.com', NULL, 'f308e12e3273415b5da604ce9997d2847c0e390c', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-28 19:06:10', NULL, NULL, 0),
(56, 'Jorge Alberto', 'FLAMINI', 42494, 'DNI', '14328252', 'Urquiza 990 Piso 6', 13, 22, 2104, '1961-02-18', 61, '3413899626', NULL, 'flamini@fceia.unr.edu.ar', 'flamini@fceia.unr.edu.ar', NULL, '4de9c806dd76a8b5b7056647e9cc1a540111cf70', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-13 03:06:23', NULL, NULL, 0),
(57, 'Gabriela Mariel', 'FONT', 32212, 'DNI', '20182418', 'Tucumán 548', 13, 1, 7, '1968-09-04', 53, '1156465265', NULL, 'gfont@frro.utn.edu.ar', 'gabriela.m.font@gmail.com', NULL, 'd89d416bb8b93099781be1f0af928af7786ece2b', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-12 20:06:44', NULL, NULL, 0),
(58, 'Patricia Sofía', 'FRACCHIA', 19895, 'DNI', '14510669', 'Italia 754 piso 7 ', 13, 22, 2104, '1962-05-04', 60, '3413423717', '4899731', 'psfracchia@yahoo.com.ar', 'pfracchia@frro.utn.edu.ar', NULL, 'e1ffd59e54e69ab37fdad31d570dcb0a1be5a001', NULL, 0, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-07-04 16:07:55', NULL, NULL, 0),
(59, 'Sergio Julian', 'GASPARRONI', 28486, 'DNI', '12356709', 'Gaboto 761', 13, 22, 2104, '1958-09-19', 63, '3416580989', '03402426417', 'sjgasparroni@gmail.com', 'sgasparroni@yahoo.com.ar', NULL, '4c28817d53a2dd3233461c80d998abb5b7a2f51b', NULL, 0, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-07-04 18:07:50', NULL, NULL, 0),
(60, 'Carlos Angel', 'GEREMIA', 16967, NULL, '12381917', NULL, 13, 22, 2104, NULL, NULL, '3415500404', NULL, '', NULL, NULL, 'b52da86975d02e72950b703aa7f6a0271cf1b082', NULL, 0, NULL, 0, NULL, 1, '2022-05-31 16:05:05', NULL, NULL, NULL, NULL, 0),
(61, 'Daniela Nora', 'GOMEZ', 25430, 'DNI', '17758172', 'Corrientes 949', 13, 22, 1981, '1966-07-27', 55, '3416356169', NULL, 'da40gomez@yahoo.com.ar', 'da40gomez@yahoo.com.ar', NULL, '124b35fe97748eecaed702b86a98e5e791420c60', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-10 15:06:45', NULL, NULL, 0),
(62, 'Sabrina Belen', 'GROSSI SANCHEZ', 90639, 'DNI', '34426319', 'Alem 1946 3C', 13, 22, 2104, '1989-06-08', 33, '3413812704', NULL, 'sgrossi@frro.utn.edu.ar', 'sgrossi@frro.utn.edu.ar', NULL, '1d22729e3a9a45843509094fbb2d991eda94ac6d', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-07-04 16:07:10', NULL, NULL, 0),
(63, 'Luciano Ismael', 'GUADAGNOLI', 43438, 'DNI', '28392435', 'PASCO 540 - P. 2 D. 4', 13, 22, 2104, '1980-10-14', 41, '3412728544', '3412728544', 'lguadagnoli@frro.utn.edu.ar', 'lguadagnoli@frro.utn.edu.ar', NULL, '3c47c7a69c52faadd499b85672cd1b734d3e7fcb', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-22 15:06:56', 39, '2022-06-22 15:06:57', 1),
(64, 'Jorge Raul', 'GURMENDI', 8237, 'DNI', '5077947', 'Sarmiento 1464', 13, 22, 1968, '1948-07-22', 73, '3413032111', '3414931239', 'jgurmendi@hotmail.com', 'jgurmendi@hotmail.com', NULL, '49636026ab99ddef1f87c01898ddb58b3492feaa', NULL, 0, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-07-04 17:07:56', NULL, NULL, 0),
(65, 'Sandra Karina', 'HEIDENREICH', 28070, 'DNI', '21426310', 'Entre Ríos 2082  - 0301', 13, 22, 2104, '1970-04-17', 52, '3413723212', '3414825619', 'sandrakh2001@gmail.com', 'sandrakh2001@gmail.com', NULL, '87b2e0a7d8a0b3249fae1cf69e289b03c9a9ecdd', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-28 16:06:35', NULL, NULL, 0),
(66, 'Alvaro', 'HERGENREDER', 35328, 'DNI', '23485773', 'Milstein 6331', 13, 22, 1968, '1973-10-05', 48, '3416605833', '3412230683', 'alvaroherg@gmail.com', 'alvaroherg@gmail.com', NULL, 'b1c37fa118a0bada4adcafc5ad614e77cc815361', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-10 19:06:51', NULL, NULL, 0),
(67, 'Raul Salvador', 'IUDICA', 79366, 'DNI', '20176654', 'Italia 3732', 13, 22, 2104, '1968-03-29', 54, '3415524307', NULL, 'riudica@gmail.com', 'riudica@gmail.com', NULL, '9389424c5138315f557110a1eefb5b48864864b7', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-28 21:06:52', NULL, NULL, 0),
(68, 'Alan', 'IZAGUIRRE', 88292, 'DNI', '35080208', 'sarmiento 657 9c', 13, 22, 2104, '1990-01-17', 32, '3412586993', NULL, 'izaguirrea17@gmail.com', 'izaguirrea17@gmail.com', NULL, '4c8597c469b1bd815536266e79397eb407497243', NULL, 0, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-28 19:06:31', NULL, NULL, 0),
(69, 'Monica Ruth', 'JÄGER', 21365, 'DNI', '13509382', 'Maza 3754', 13, 22, 2104, '1959-08-15', 62, '3415212815', '4545129', 'monicarjager@gmail.com', 'mrjager05@yahoo.com.ar', NULL, '15d41d7858e1e7e541b7b2682109ff5b1f2b8fa4', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-10 18:06:32', NULL, NULL, 0),
(70, 'Andres Cesar', 'JOAQUIN', 41430, 'DNI', '26730382', 'Oroño 480 12C', 13, 22, 2104, '1978-09-29', 43, '3413741448', NULL, 'andresjoaquin@gmail.com', 'andresjoaquin@gmail.com', NULL, 'bb18323ddb341def9338dd77bb96206da747c553', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-11 19:06:05', NULL, NULL, 0),
(71, 'GUILLERMO', 'LEALE', 53789, 'DNI', '28859879', 'Los girasoles 3132, Casa 1', 13, 22, 1968, '1981-07-15', 40, '3413192730', NULL, 'guillermoleale@gmail.com', 'guillermoleale+utn@gmail.com', NULL, 'ca91753ac202334131394d6080b85358d654adad', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-16 09:06:02', NULL, NULL, 0),
(72, 'Victor Hugo', 'LOMBARDO', 35952, 'DNI', '23338716', 'Santa Fe 7982 ', 13, 22, 2104, '1973-08-11', 48, '3415896915', NULL, 'victorlombardo@hotmail.com', 'victorlombardo@hotmail.com', NULL, 'c1a9fda61665e690b63a76b595c381e84cbf1358', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-15 08:06:12', NULL, NULL, 0),
(73, 'ROSA RITA', 'MAENZA', 22721, 'DNI', '17079606', 'SAN NICOLAS 2474', 13, 22, 2104, '1965-07-18', 56, '3415028706', '7767357', 'r_maenza@yahoo.com', 'utnmatematicadiscreta@gmail.com', NULL, 'fd44a6119a1e647ca06960a0c5d4576564b03010', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-07-04 14:07:36', NULL, NULL, 0),
(74, 'Rita Guadalupe', 'MALANO', 36734, 'DNI', '23983707', 'Urquiza 1429', 13, 22, 2104, '1974-06-01', 48, '3413742300', NULL, 'ritamalano@gmail.com', 'ritamalano@gmail.com', NULL, '56c6a400844f3de38cc3f1bb2978909196e5c108', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-11 08:06:53', NULL, NULL, 0),
(75, 'Susana Nidia', 'MARTIN', 20365, 'DNI', '12524810', 'NAplica', 13, 22, 2104, '2022-06-13', 0, '3415219991', NULL, 'susanamartin@aaa.com', 'aaa@aaa.com', NULL, '61bbf565b8ddc4429a00cf7a5bdf7817770904cb', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', 37, '2022-06-14 10:06:22', 37, '2022-06-15 12:06:16', 1),
(76, 'Vilma Alicia', 'MARTIN', 32290, 'DNI', '18491107', 'Viamonte 2837  Dto \"D\"', 13, 22, 2104, '1967-12-04', 54, '3413136308', NULL, 'vmartin@frro.utn.edu.ar', 'vilmalicia0@gmail.com', NULL, 'a19a3df9d4201b09becb92ca477da63e2c600519', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-13 07:06:01', NULL, NULL, 0),
(77, 'Sergio Fabian', 'MATTIONI', 30039, 'DNI', '20812280', 'Alem', 13, 22, 2104, '1969-04-04', 53, '156535724', NULL, 'sergio_mattioni@yahoo.com.ar', 'sergio_mattioni@yahoo.com.ar', NULL, '86fc5668a706eec46ad94a3bf19c57d6d3538fc9', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-07-05 01:07:17', NULL, NULL, 0),
(78, 'Gabriel', 'MAURINO', 88966, 'DNI', '34300215', 'Alvear 699', 13, 22, 2063, '1989-07-01', 32, '3364630483', NULL, 'gabrielmaurino@hotmail.com', 'gabrielmaurino@hotmail.com', NULL, 'ad0a55acce031b52bf4436b4e64ce6ae31082623', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-28 22:06:19', NULL, NULL, 0),
(79, 'Adrian Ezequiel', 'MECA', 55986, 'DNI', '30890528', 'Lugones 832', 13, 22, 1980, '1984-04-01', 38, '3412114623', NULL, 'adrianmeca@gmail.com', 'adrianmeca@gmail.com', NULL, '43cfad7a17b45aa0fee4d7fcba77d9996d9718fe', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-29 14:06:06', NULL, NULL, 0),
(80, 'Cristian Fernando', 'MEDIN', 88291, 'DNI', '30324148', 'Reconquista 1015', 13, 22, 2104, '1983-06-29', 40, '3413848854', NULL, 'cmedin@gmail.com', 'cmedin@gmail.com', NULL, 'fac3826f82cf9b5ca1bbc6b9ba5518b19d02616d', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2024-04-17 07:04:43', NULL, NULL, 0),
(81, 'Sergio', 'MILARDOVICH', 90834, 'DNI', '36490592', 'Zeballos 607 4A', 13, 22, 2104, '1992-12-07', 29, '3465443605', NULL, 'sergio.milardovich@gmail.com', 'sergio.milardovich@gmail.com', NULL, '4edae4dae268cfaf50b6dfb032865bc3146bb057', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-16 15:06:30', NULL, NULL, 0),
(82, 'Juan Miguel', 'MOINE', 63206, 'DNI', '30457544', 'Houssay 2908', 13, 22, 2102, '1984-05-05', 38, '3416561772', NULL, 'juanmiguelmoine@gmail.com', 'juanmiguelmoine@gmail.com', NULL, 'acd6b7e3a940e5c39fb68d4703fa513cccdbf744', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-28 17:06:10', NULL, NULL, 0),
(83, 'Claudia Patricia', 'MOYANO', 28668, 'DNI', '17692839', 'Del Valle Iberlucea 1318 1 A', 13, 22, 2104, '1965-12-04', 56, '3413027400', '4382273', 'moyanoclau@gmail.com', 'moyano_claudia@yahoo.es', NULL, '6a0c94d889505f6174e26ad33da8bdaf0f932e01', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-12 04:06:44', NULL, NULL, 0),
(84, 'Germán Gregorio', 'MUDRY', 41446, 'DNI', '21008745', 'Viamonte 94', 13, 22, 2104, '1969-11-15', 52, '3416647384', NULL, 'gmudry@frro.utn.edu.ar', 'gmudry@frro.utn.edu.ar', NULL, '7632e81dcb85d8aad162ae63984fd11d6287fe41', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-07-04 17:07:47', NULL, NULL, 0),
(85, 'María yanina', 'NALLI', 41748, 'DNI', '22283578', 'Dr. Ghio 999', 13, 22, 2104, '1972-04-28', 50, '3476372947', NULL, 'nalliyani@gmail.com', 'nalliyani@gmail.com', NULL, '95c4518640d72e8acea220d6d10da822e49ca781', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', 40, '2023-03-15 17:03:57', NULL, NULL, 0),
(86, 'DAMIAN PEDRO', 'NOVELLO', 35155, 'DNI', '22555479', 'OV. LAGOS 3987', 13, 22, 1896, '1972-02-23', 51, '3416823855', NULL, 'villajallalla@gmail.com', 'villajallalla@gmail.com', NULL, '024ccccc8f658a7b2f9d37a61c314b3fd4bc5c65', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2023-03-29 12:03:22', NULL, NULL, 0),
(87, 'Maria Alejandra', 'OLMOS', 71940, 'DNI', '16770123', '24 de Septiembre 1125', 13, 22, 2104, '1963-10-21', 58, '3415017888', NULL, 'mariaalejandraolmos@gmail.com', 'mariaalejandraolmos@gmail.com', NULL, 'a2a140d95efce16761b8644336fee00101bc903d', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-10 19:06:39', NULL, NULL, 0),
(88, 'Andres', 'OTADUY', 42858, 'DNI', '27055438', 'almafuerte 772', 13, 22, 2104, '1978-12-04', 43, '3413056168', '0', 'andreseninternet@hotmail.com', 'notengousotelegram@mail.com', NULL, '00337b7dd82d1a20ce73bacd5afb0881dda56eff', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-07-25 11:07:56', NULL, NULL, 0),
(89, 'Erica Cristina', 'PANELLA', 33387, 'DNI', '21825872', 'Salta 2843', 13, 22, 2104, '1971-03-12', 51, '3416371590', '2970148', 'ericacpanella@gmail.com', 'epanella@frro.utn.edu.ar', NULL, '54e2bc5fd63929e8d009d15263c7a634888b35a4', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2023-03-04 17:03:02', NULL, NULL, 0),
(90, 'Miguel Angel', 'PATTI', 89473, 'DNI', '25007855', 'Ocampo 1128', 13, 22, 2104, '1976-03-23', 46, '3413945228', '3414823266', 'mpatti@gmail.com', 'mpatti@gmail.com', NULL, 'e92b92d58403aae9e9720abfb742ca492e23a6be', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-10 15:06:07', NULL, NULL, 0),
(91, 'Gabriela Patricia', 'PEDREROL', 26607, 'DNI', '14645150', '3 de Febrero 470 - VGG', 13, 22, 2104, '1961-06-19', 60, '3413123122', NULL, 'profepedrerol@gmail.com', 'profepedrerol@gmail.com', NULL, '211b4d702e0dca33e94594841d8d3f4543ea5c88', NULL, 0, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-13 08:06:10', NULL, NULL, 0),
(92, 'Nicolas  David', 'PEREIRA', 89250, 'DNI', '37330312', 'Diagonal Berardo 1082', 13, 22, 2135, '1993-06-17', 29, '3476650333', NULL, 'npereira@frro.utn.edu.ar', 'npereira@frro.utn.edu.ar', NULL, 'dd22a38180874904d6c1d8ce72dc2a2ecca3a508', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-28 18:06:43', NULL, NULL, 0),
(93, 'Claudia Silvana', 'PEREZ', 19004, 'DNI', '16265778', 'Cerrito 22', 13, 22, 2104, '1963-05-14', 59, '3416610612', '4823921', 'ingclaudiap@hotmail.com', 'prof.claudiaperez@gmail.com', NULL, 'b7a04502b7b3063d49a9843d95952cb2ba01f92b', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2023-03-03 12:03:25', NULL, NULL, 0),
(94, 'Victor', 'PEZZETTI', 39757, 'DNI', '18382896', 'Buenos Aires 1655 Dto.7', 13, 22, 1896, '1967-10-09', 54, '3416436187', NULL, 'vpezzetti@gmail.com', 'vpezzetti@gmail.com', NULL, '3bd6ccb575e83bbdc03bdae0b6438969bf3fed45', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-28 11:06:07', NULL, NULL, 0),
(95, 'Pablo Ezequiel', 'PISTILLI', 86057, 'DNI', '32749132', 'Pueyrredon 3547', 13, 22, 2197, '1987-02-13', 35, '3413077291', '', 'pablopistilli@hotmail.com', 'ppistilli@frro.utn.edu.ar', NULL, '0e48b0d6840012e07fe82623889d13a63272d82c', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-12 18:06:28', NULL, NULL, 0),
(96, 'Enrique', 'PORTA', 19981, 'DNI', '12179690', 'Zeballos 1341', 13, 22, 2104, '1956-12-18', 65, '3416449498', NULL, 'portaenrique@gmail.com', 'enrique.juan.porta@gmail.com', NULL, 'e5caeb0706d050efeffc20f8c92915752defada9', NULL, 0, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-10 17:06:09', NULL, NULL, 0),
(97, 'Ezequiel Alejandro', 'PORTA', 44075, 'DNI', '26304872', 'Juan Manuel de Rosas 1324, Depto. 1 C', 13, 22, 2104, '1977-12-01', 44, '3416616191', '3414291140', 'eporta@educ.ar', 'eporta@educ.ar', NULL, 'ce84ed2d7594530e98b6e39e9c6f648d1acdd44f', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-13 00:06:02', NULL, NULL, 0),
(98, 'Sergio Antonio', 'QUARONI', 38136, 'DNI', '23674139', 'ALVEAR 12', 13, 22, 2104, '1973-12-03', 49, '3416953386', '3414395507', 'squaroni@gmail.com', 'squaroni@gmail.com', NULL, '900200000f685b8120dbd96a0e07cb3f8649d7e6', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2023-03-06 09:03:46', NULL, NULL, 0),
(99, 'Pablo Nicolás', 'RAVERA', 29220, 'DNI', '16861146', 'Jujuy 1403, 8 A', 13, 22, 2104, '1964-05-12', 58, '3416658184', '4495974', 'pnravera@yahoo.com.ar', 'pnravera@yahoo.com.ar', NULL, '52725910b11fe4fb407326dafb0cf6c9c272ec4e', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-07-04 17:07:52', NULL, NULL, 0),
(100, 'Claudia Beatriz', 'REYNARES', 27265, 'DNI', '17817613', 'Pellegrini126', 13, 22, 2104, '1966-10-29', 55, '3416357779', NULL, 'reynares48@gmail.com', 'reynares48@gmail.com', NULL, 'b420dab5d2ae4f1fb9438fdff1ff34155f7e19e8', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-19 17:06:41', NULL, NULL, 0),
(101, 'Andres Aureliano', 'RICAGNO', 40809, 'DNI', '25475286', 'Mendoza 2546 9 A', 13, 22, 2104, '1976-10-13', 45, '3413595114', NULL, 'andresricagno.utn@gmail.com', 'andresricagno.utn@gmail.com', NULL, '4edf3f76c7e2c317389dc2ebe9c13f97ecd1dbaa', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-12 23:06:25', NULL, NULL, 0),
(102, 'Luciano Ernesto', 'RIPANI', 32292, 'DNI', '21414428', 'Carballo 230', 13, 22, 2104, '1969-12-22', 52, '3416705018', NULL, 'lripani@gmail.com', 'lripani@gmail.com', NULL, '4a87ddfcb06e1deb9c6f2ef578cdc9ce61051ebb', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-15 13:06:43', NULL, NULL, 0),
(103, 'Fabiana María', 'RIVA', 19691, 'DNI', '16994682', 'Agrelo 829', 13, 22, 2104, '1964-09-08', 57, '3413408595', '03414558095', 'fabiana_riva@hotmail.com', 'fabiana_riva@hotmail.com', NULL, 'dade30264aca8fff8e7b2654833294580e8feb8c', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-11 18:06:19', NULL, NULL, 0),
(104, 'Marcelo Ariel', 'ROCA', 26840, 'DNI', '21521613', 'Riobamba 573', 13, 22, 2104, '1970-07-04', 52, '3413693191', NULL, 'marcelo.roca@bmros.com.ar', 'marcelo.roca@bmros.com.ar', NULL, 'c9d13a83399b2df9c26651a1432a9cb85065c78c', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-07-27 15:07:13', NULL, NULL, 0),
(105, 'Karina', 'RODRIGUEZ', 33973, 'DNI', '18550101', '1 de mayo 2277', 13, 22, 2104, '1967-11-17', 54, '3415922801', NULL, 'karina_rgz@hotmail.com', 'karinargz67@gmail.com', NULL, '948d5bcadd3b61d381d437e6d5053d38d9db27bc', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-13 13:06:45', NULL, NULL, 0),
(106, 'Malvina Angelica', 'Rossi', 53072, 'DNI', '27442484', 'Bv Villada 2164', 13, 22, 1896, '1979-10-05', 43, '3464445176', NULL, 'malvinarossi@hotmail.com', 'malvina.rossi@gmail.com', NULL, '2fed61ca07627be5eac85bcc173d012781b89382', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2023-08-28 19:08:32', NULL, NULL, 0),
(107, 'Alejandro Alberto', 'ROZAS', 31607, 'DNI', '20853815', 'Sin Especificar ', 13, 22, 2104, '1969-08-03', 52, '3415467983', NULL, 'alejandro.a.rozas@gmail.com', 'alejandro.a.rozas@gmail.com', NULL, '21373f1934921af396ee588bf79da254798f50fe', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-07-28 07:07:57', NULL, NULL, 0),
(108, 'Patricia Viviana', 'RUIZ', 22288, 'DNI', '12520579', 'Riobamba 1864', 13, 22, 2104, '1958-11-30', 63, '3416129656', '4814983', 'ingpatriciaruiz@hotmail.com', 'ingpatriciaruiz@hotmail.com', NULL, '83db9e0c7c86fe9e68b055f11fe451661d6836bb', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-11 11:06:22', NULL, NULL, 0),
(109, 'Maximiliano Andres', 'SANTECCHIA', 89791, 'DNI', '31566376', 'Viamonte 1979', 13, 22, 2087, '1985-06-20', 36, '3415827171', NULL, 'maximilianosantecchia@gmail.com', 'maximilianosantecchia@gmail.com', NULL, 'b41805fd94e7efc681a92f6a58007ede928f2e6f', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-11 19:06:13', NULL, NULL, 0),
(110, 'Silvia Beatriz', 'SCIME', 46577, 'DNI', '18520174', 'Colón 1229 1 A', 13, 22, 2104, '1967-11-24', 56, '3415070787', NULL, 'scimesilvia@gmail.com', 'scimesilvia@gmail.com', NULL, '45fb750c797902ee6fa4e755ef838967af3dca6d', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2024-04-19 15:04:40', NULL, NULL, 0),
(111, 'María Inés', 'SEGUENZIA', 38999, 'DNI', '22209263', 'Castellanos 930 2do C', 13, 22, 2104, '1971-09-13', 50, '3413509492', NULL, 'miseguenzia@hotmail.com', 'miseguenzia@hotmail.com', NULL, 'c6a1bb2edcc16ecfcb63c32a159750f3e9928bf9', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-28 19:06:33', NULL, NULL, 0),
(112, 'Federico', 'SEVERINO GUIMPEL', 55183, 'DNI', '24282727', 'Corrientes 1307', 13, 22, 2104, '1975-04-18', 47, '3415791176', NULL, 'federico.severinoguimpel@gmail.com', 'federico.severinoguimpel@gmail.com', NULL, '4b6b48a8416067ef815ff0ef102ae9786e9f5c56', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-28 18:06:33', NULL, NULL, 0),
(113, 'Esteban Oscar', 'SIRI', 80348, 'DNI', '31757811', 'Santiago 22', 13, 22, 2104, '1985-07-27', 36, '3415093275', NULL, 'ingestebansiri@gmail.com', 'ingestebansiri@gmail.com', NULL, '71a567510dc36552cd47cf173c3e8e30445dcd7e', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-27 11:06:10', NULL, NULL, 0),
(114, 'Ariel', 'SOLOVEY', 41460, 'DNI', '26884474', 'Guemes 2019 Piso 5 Dpto A', 13, 22, 2104, '1978-11-25', 44, '3415007454', NULL, 'ariel.solovey@gmail.com', 'ariel.solovey@gmail.com', NULL, 'c8e5acce694de6ddadc7d9414332319af012219e', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2023-03-03 11:03:04', NULL, NULL, 0),
(115, 'Silvia', 'STORTONI', 26774, 'DNI', '20536153', 'Maipu 1090 1A', 13, 22, 2104, '1968-11-15', 53, '3416911877', '3416911877', 'stortoni@fibertel.com.ar', 'stortoni@fibertel.com.ar', NULL, '02fd77b06e8c96b8ffe34fe8ee7606f247985e1c', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-13 18:06:17', NULL, NULL, 0),
(116, 'Maia Emeli', 'SUTKOWSKI', 88951, 'DNI', '33720466', 'Zeballos 2017 2A', 13, 22, 2104, '1988-05-25', 34, '3416220385', NULL, 'maiasutkowski@gmail.com', 'maiasutkowski@gmail.com', NULL, '623d1266ac209695a8742202e80eb2a963848be7', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-12 20:06:13', NULL, NULL, 0),
(117, 'Ricardo David', 'TABACMAN', 19988, 'DNI', '13958543', 'Guemes 2514', 13, 22, 2104, '1960-09-14', 61, '3415808989', NULL, 'ricardo@tabacman.com.ar', 'ricardo@tabacman.com.ar', NULL, '2752d6565ec750f67d364fddd43ab6f11f0f3d87', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-11 18:06:33', NULL, NULL, 0),
(118, 'Ligia', 'TANTUCCI', 89270, 'DNI', '38135952', 'Primero de Mayo 1836', 13, 22, 2104, '1994-07-22', 27, '3416285694', NULL, 'ligia.tantucci@outlook.com', 'ligia.tantucci@outlook.com', NULL, 'a31a2ae1efffcbe37feacdb95fcda67211b5a59a', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-13 10:06:40', NULL, NULL, 0),
(119, 'Irina', 'TARDITTI', 89737, 'DNI', '31980318', 'viamonte 1103', 13, 22, 2104, '1985-11-22', 36, '3415207961', NULL, 'irinatarditi@gmail.com', 'irinatarditi@gmail.com', NULL, '6d7709cde06369c33901ffacf12c9123f6d78fd6', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-22 09:06:53', NULL, NULL, 0),
(120, 'David Marcelo', 'TEMPERINI', 39336, 'DNI', '18591490', '3 de febrero 222 3A', 13, 22, 2104, '1967-11-09', 54, '3415070794', NULL, 'davidtemperini@yahoo.com.ar', 'dmtutn@gmail.com', NULL, '46e042d3e312f97afa582bbfa23b36a9be93bb6e', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-07-07 16:07:39', NULL, NULL, 0),
(121, 'Lucila', 'TENEB', 19053, 'DNI', '12461301', 'Av América 5561', 13, 22, 2104, '1958-03-11', 64, '3415638445', '4932596', 'lucilateneb@hotmail.com', 'lucilateneb10@gmail.com', NULL, '4e3553213a6228d8c5ce42e1972f93fdbdac17dc', NULL, 0, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-07-04 17:07:24', NULL, NULL, 0),
(122, 'HERNAN', 'TOME', 44187, 'DNI', '25750154', 'BALCARCE 1594', 13, 22, 2104, '1977-02-08', 45, '3416184423', NULL, 'h_tome@hotmail.com', 'hernantome@yahoo.com.ar', NULL, '0ebf22738e2c4df027acb3a4c94c7ce4c67f1fad', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', 39, '2022-09-05 16:09:23', NULL, NULL, 0),
(123, 'SILVINA MARISA', 'TÓRBOLI', 54966, 'DNI', '17818802', 'Laprida 518 piso 4', 13, 22, 2104, '1966-09-09', 55, '3416157275', NULL, 'estudiotm@hotmail.com.ar', 'estudiotm@hotmail.com.ar', NULL, '5d4ddbdbc43515599bef37552fac790be97bb034', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-29 12:06:58', NULL, NULL, 0),
(124, 'Juan Ignacio', 'TORRES', 86056, 'DNI', '29311022', 'Mendoza 1531 3B', 13, 22, 2104, '1982-01-21', 40, '3413499600', NULL, 'orkuan@gmail.com', 'orkuan@gmail.com', NULL, '5f985ed2860d694a1b37ad6f59811b3f293077ec', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-07-04 17:07:43', NULL, NULL, 0),
(125, 'Esteban Carlos Bernardo', 'TRAVAGLINO', 87307, 'DNI', '18485074', 'Gabriel Carrasco 715', 13, 22, 2104, '1967-08-20', 55, '3415467527', NULL, 'etravaglino@frro.utn.edu.ar', 'etravaglino@frro.utn.edu.ar', NULL, 'da95e1f07c8ab712c2a9bbaf43979710c7ae1fa2', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2023-03-03 09:03:38', NULL, NULL, 0),
(126, 'Maria Elisa', 'UGARTE', 60158, 'DNI', '24784721', 'Laprida 1178 7 D', 13, 22, 2104, '1976-02-09', 46, '3415500566', NULL, 'mariel_ugarte@yahoo.com', 'mariel_ugarte@yahoo.com', NULL, '9013f8ed567288f71fb652363e19e022c30ea34e', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-11 18:06:46', NULL, NULL, 0),
(127, 'Sofia', 'UNDINER', 91375, 'DNI', '41733173', 'Santa fe 1026', 13, 22, 1904, '1999-09-19', 22, '3464620005', NULL, 'sofiundiner@gmail.com', 'sofiundiner@gmail.com', NULL, '0470dccbddc5b554d6d5f14c661480657367d9bb', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-07-05 08:07:23', NULL, NULL, 0),
(128, 'Hernan Marcelo', 'VITRI', 28485, 'DNI', '12522007', 'Pasaje Goytia 3745', 13, 22, 2104, '1956-07-27', 66, '3415027136', '4656537', 'hvitri@frro.utn.edu.ar', 'hvitri@frro.utn.edu.ar', NULL, '05f8c841d41361fa411ec5251abed5d977fd9c47', NULL, 0, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-08-01 18:08:56', NULL, NULL, 0),
(129, 'Héctor Osvaldo', 'ZAMARGUILEA', 33130, 'DNI', '11273242', 'Sarmiento 1824', 13, 22, 2104, '1954-08-08', 67, '3413499683', '3413499683', 'hzamarguilea@gmail.com', 'hzamarguilea@gmail.com', NULL, '7ee9def1b0192f3eccea499122c40b5ff4d1eca1', NULL, 1, NULL, 1, NULL, 1, '2022-05-31 16:05:05', NULL, '2022-06-29 10:06:30', NULL, NULL, 0),
(137, 'Maria Cecilia', 'CARLETTI', 92097, 'DNI', '32735384', 'Juan José Paso 983', 13, 22, 2104, '1987-01-31', 35, '3412781694', '', 'ma.ceciliacarletti@gmail.com', 'ma.ceciliacarletti@gmail.com', NULL, 'c4fd2c9f99b92fc5f9ceb150772167d2c6d6f2c9', NULL, 1, NULL, 1, NULL, 39, '2022-06-13 16:06:44', 0, '2022-06-13 23:06:20', NULL, NULL, 0),
(138, 'Luciano', 'GUADAGNOLI', 43438, 'DNI', '28392435', 'PASCO 540, 2/4', 13, 22, 2104, '1980-10-14', 41, '3412728544', '3412728544', 'luciano.guadagnoli@gmail.com', 'lguadagnoli@frro.utn.edu.ar', NULL, '3c47c7a69c52faadd499b85672cd1b734d3e7fcb', NULL, 1, NULL, 1, NULL, 39, '2022-06-22 15:06:13', 0, '2022-06-22 17:06:06', NULL, NULL, 0),
(139, 'MARIANO', ' LA SPINA', 28927, 'DNI', '20182247', 'Juan Manuel de Rosas 929', 13, 22, 2104, '1968-04-18', 54, '3416176336', '4566104', 'marianolaspina@gmail.com', 'marianolaspina@gmail.com', NULL, 'c7bfdfce8dfdbc809441e11b48f387236248903f', NULL, 1, NULL, 1, NULL, 39, '2023-02-23 14:02:48', 39, '2023-03-01 12:03:45', NULL, NULL, 0),
(140, 'Juan Cruz', 'Durán', 90716, 'DNI', '42481227', '9 de Julio 1275, 6B', 13, 22, 2104, '2000-05-18', 22, '3412284020', '', 'juancruzduran1@gmail.com', 'juancruzduran1@gmail.com', NULL, 'd79dba746c4018d86d0fe97042d88f5053f8caaf', NULL, 1, NULL, 1, NULL, 39, '2023-03-01 13:03:18', 0, '2023-03-01 13:03:58', NULL, NULL, 0),
(141, 'Facundo', 'DURAN', 92361, 'DNI', '44064436', '9 de Julio 1275 6B', 13, 22, 2104, '2003-01-31', 20, '3416096222', '', 'facundoduran31@gmail.com', 'facundoduran31@gmail.com', NULL, '5d012743313ffda65a08dde4c8b87083925bb475', NULL, 1, NULL, 1, NULL, 39, '2023-03-01 13:03:13', 0, '2023-03-01 14:03:19', NULL, NULL, 0),
(142, 'Walter', 'Casella', 91934, 'DNI', '28762494', 'Saavedra Lamas 2616', 13, 22, 2102, '1981-06-09', 41, '3416116144', '', 'wocasella@gmail.com', 'wcasella@frro.utn.edu.ar', NULL, '115bb2e4372371810f1b9bc34dfd37bf9fc238d1', NULL, 1, NULL, 1, NULL, 39, '2023-03-01 13:03:32', 0, '2023-03-16 17:03:02', NULL, NULL, 0),
(143, 'Lucas', 'LUNA', 92473, 'DNI', '29768849', 'Suipacha 1473 1° A', 13, 22, 2104, '1983-11-04', 39, '3415444756', '', 'lucasjaviluna@gmail.com', 'lucasluna@frro.utn.edu.ar', NULL, 'e4fbbae3188885809aa2b560f4c3c79817d87266', NULL, 1, NULL, 1, NULL, 39, '2023-03-01 13:03:58', 0, '2023-03-15 18:03:23', NULL, NULL, 0),
(144, 'Guillermo', 'VACCARO', 88243, 'DNI', '21889201', 'Laprida 874', 13, 22, 2104, '1970-10-04', 52, '3415595497', '', 'guillermovaccaro@yahoo.com.ar', 'guillermovaccaro@yahoo.com.ar', NULL, '9c287922862e53dcb06e7ea610a9701a68cb00ab', NULL, 1, NULL, 1, NULL, 39, '2023-03-01 13:03:12', 0, '2023-08-30 15:08:42', NULL, NULL, 0),
(145, 'Silvina', 'TORBOLI', 54966, 'DNI', '', '', 13, 22, 2104, NULL, 0, '', '', 'silvinarosario@hotmail.com', '', NULL, '59f7cf713e1a0212ef08a0dcaf1f17d5a9a35336', NULL, 1, NULL, 0, NULL, 39, '2023-03-01 13:03:17', 39, NULL, NULL, NULL, 0),
(146, 'Miguel Fernando', 'DEL BRIO', 61773, 'DNI', '', '', 13, 22, 2104, NULL, 0, '', '', 'arqdelbrio@gmail.com', '', NULL, '0eb3e3af508017c50a929d75f4974fba8f7bc6ce', NULL, 1, NULL, 0, NULL, 39, '2023-03-01 17:03:49', 39, NULL, NULL, NULL, 0),
(147, 'MATIAS', 'ARAUJO', 92202, 'DNI', '27978627', 'Mendoza 5753', 13, 22, 2104, '1980-05-10', 43, '3415009035', '3417938198', 'matiaraujo@hotmail.com', 'matiaraujo@hotmail.com', NULL, 'c0b357065476937805b42896e36817a1962250b2', NULL, 1, NULL, 1, NULL, 39, '2023-03-01 18:03:43', 0, '2023-05-20 13:05:18', NULL, NULL, 0),
(148, 'Julia', 'MERLO', 92787, 'DNI', '', '', 13, 22, 2104, NULL, 0, '', '', 'juliamerlodania@gmail.com', '', NULL, '0a9219ba6a29cf4c25c6a80d7bdf629bd7ec1b23', NULL, 1, NULL, 0, NULL, 39, '2023-03-01 18:03:49', 39, NULL, NULL, NULL, 0),
(149, 'Sabrina ', 'PALAZOLO', 93325, 'DNI', '30685989', '9 de Julio 1432', 13, 22, 2104, '1984-10-02', 38, '3416064364', '', 'sabrinapalazolo@hotmail.com', 'sabrinapalazolo@hotmail.com', NULL, 'cc463c7ef53c35053e4e60eca313c0847fc1cf3e', NULL, 1, NULL, 1, NULL, 39, '2023-05-10 17:05:48', 0, '2023-05-11 16:05:37', NULL, NULL, 0),
(150, 'Bruno', 'COCITTO LOPEZ', 93469, 'DNI', '41085835', 'Ovidio Lagos 739 1 14', 13, 22, 2104, '1998-06-20', 25, '3465657036', '', 'bcocitto@gmail.com', 'bcocittolopez@frro.utn.edu.ar', NULL, '70b1ab7d213c5861e0bb2ae8c512b0e9dee357ac', NULL, 1, NULL, 1, NULL, 39, '2023-06-14 17:06:04', 0, '2023-08-30 14:08:00', NULL, NULL, 0),
(151, 'Mariano', 'CROSETTI', 94248, 'DNI', '37153994', '2615 SAN LORENZO', 13, 22, 2104, '1993-04-23', 30, '3416774722', '', 'marianocrosetti1993@gmail.com', 'marianocrosetti1993@gmail.com', NULL, 'd0fb3099554f758ed9322ca61fd13e4cbda70d3f', NULL, 1, NULL, 1, NULL, 39, '2023-11-22 16:11:28', 0, '2024-04-06 18:04:06', NULL, NULL, 0),
(152, 'eva', 'bellini', 18888, 'DNI', '12345678', 'Rosario liniers', 13, 22, 2104, '1999-09-23', 24, '3413234234', '', 'AECucchiara@teco.com.ar', 'AECucchiara@teco.com.ar', NULL, '35ce175e4bb8a114e6dfa3446925772642f0f8a3', NULL, 1, NULL, 1, NULL, 37, '2024-03-13 16:03:53', 0, '2024-03-27 15:03:26', NULL, NULL, 0),
(153, 'Guillermina', 'GASPARELLO', 94307, 'DNI', '37336175', 'OVIDIO LAGOS 184', 13, 22, 2104, '1993-07-01', 30, '341696574', '', 'guillermina.gasparello@gmail.com', 'guillermina.gasparello@gmail.com', NULL, '993f23f82a4834743d883e56693ec452786023c5', NULL, 1, NULL, 1, NULL, 39, '2024-03-27 17:03:41', 0, '2024-04-09 09:04:54', NULL, NULL, 0),
(154, 'Maria Pia', 'ZELAYETA', 32773, 'DNI', '22418492', 'La República 8531', 13, 22, 2104, '1972-02-11', 52, '3413130107', '', 'mzelayeta@gmail.com', 'mzelayeta@gmail.com', NULL, 'afc1d0cd7524d671ef74480e78b1ca5556bd38c8', NULL, 1, NULL, 1, NULL, 39, '2024-03-27 17:03:33', 0, '2024-03-27 17:03:06', NULL, NULL, 0),
(155, 'Sebastian', 'ROCCO', 94495, 'DNI', '28025457', 'Ocampo 355', 13, 22, 2104, '1980-12-25', 43, '3416454722', '', 'smrocco@gmail.com', 'smrocco@gmail.com', NULL, '5d9bb7118b43d00a53f28b148bb864b957efe163', NULL, 1, NULL, 1, NULL, 39, '2024-04-17 16:04:09', 0, '2024-04-17 17:04:35', NULL, NULL, 0),
(156, 'Hernán', 'Garnica', 94496, 'DNI', '25637456', 'ECUADOR 1490', 13, 22, 2104, '1977-02-06', 47, '3416761778', '03416761778', 'hgarni@gmail.com', 'hgarni@frro.utn.edu.ar', NULL, 'b07663b966b350b76bd0728eaf8c7869c4012c9b', NULL, 1, NULL, 1, NULL, 39, '2024-04-17 16:04:04', 0, '2024-04-18 08:04:41', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventos`
--

CREATE TABLE `eventos` (
  `id` bigint UNSIGNED NOT NULL,
  `aula_id` bigint UNSIGNED NOT NULL,
  `idDocente` int UNSIGNED DEFAULT NULL,
  `idHorario` int UNSIGNED DEFAULT NULL,
  `nota` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `tipo` enum('anual','primer','segundo') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'anual',
  `dia_semana` enum('Lunes','Martes','Miércoles','Jueves','Viernes','Sábado','Domingo') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Lunes',
  `idMateria` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `eventos`
--

INSERT INTO `eventos` (`id`, `aula_id`, `idDocente`, `idHorario`, `nota`, `fecha`, `tipo`, `dia_semana`, `idMateria`) VALUES
(5, 2, 22, 8, 'Prueba', '2024-06-13', 'primer', 'Viernes', 12),
(6, 3, 106, 19, 'Prueba', '2024-06-12', 'primer', 'Lunes', 8),
(7, 1, 24, 17, NULL, '2024-06-21', 'segundo', 'Martes', 24),
(8, 2, 60, 19, NULL, '2024-06-14', 'anual', 'Lunes', 3),
(9, 3, 22, 23, NULL, NULL, 'segundo', 'Jueves', 16);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios`
--

CREATE TABLE `horarios` (
  `idHorario` int UNSIGNED NOT NULL,
  `idTurno` int NOT NULL,
  `rangoHorario` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hora` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `horarioInicio` time NOT NULL,
  `horarioFin` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `horarios`
--

INSERT INTO `horarios` (`idHorario`, `idTurno`, `rangoHorario`, `hora`, `horarioInicio`, `horarioFin`) VALUES
(1, 1, '07:15 a 8:00', 'PH', '07:15:00', '00:00:00'),
(2, 1, '8:00 a 8:45', '1', '08:00:00', '08:45:00'),
(3, 1, '8:45 a 9:30', '2', '08:45:00', '09:30:00'),
(4, 1, '9:45 a 10:30', '3', '09:45:00', '10:30:00'),
(5, 1, '10:30 a 11:15', '4', '10:30:00', '11:20:00'),
(6, 1, '11:20 a 12:05', '5', '11:20:00', '12:05:00'),
(7, 1, '12:05 a 12:50', '6', '12:05:00', '12:50:00'),
(8, 1, '12:50 a 13:35', '7', '12:50:00', '13:35:00'),
(9, 2, '12:50 a 13:35', 'PH', '12:50:00', '13:35:00'),
(10, 2, '13:35 a 14:10', '1', '13:35:00', '14:10:00'),
(11, 2, '14:15 a 15:00', '2', '14:15:00', '15:00:00'),
(12, 2, '15:00 a 15:45', '3', '15:00:00', '15:45:00'),
(13, 2, '16:05 a 16:50', '4', '16:05:00', '16:50:00'),
(14, 2, '16:50 a 17:35', '5', '16:50:00', '17:35:00'),
(15, 2, '17:40 a 18:25', '6', '17:40:00', '18:25:00'),
(16, 2, '18:35 a 19:15', '7', '18:35:00', '19:15:00'),
(17, 3, '17:40 a 18:25', 'PPH', '17:40:00', '18:25:00'),
(18, 3, '18:35 a 19:15', 'PH', '17:35:00', '19:15:00'),
(19, 3, '19:15 a 20:00', '1', '19:15:00', '20:00:00'),
(20, 3, '20:00 a 20:45', '2', '20:00:00', '21:05:00'),
(21, 3, '21:05 a 21:50', '3', '21:05:00', '21:50:00'),
(22, 3, '21:50 a 22:35', '4', '21:50:00', '22:35:00'),
(23, 3, '22:40 a 23:25', '5', '22:40:00', '23:25:00'),
(24, 3, '23:25 a 00:10', '6', '23:25:00', '00:10:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias`
--

CREATE TABLE `materias` (
  `idMateria` int NOT NULL,
  `idArea` int DEFAULT NULL,
  `nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `anio` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `materias`
--

INSERT INTO `materias` (`idMateria`, `idArea`, `nombre`, `anio`) VALUES
(1, 10, 'Administración de Sistemas de Información', 4),
(2, 2, 'Gestión Gerencial', 5),
(3, 7, 'Algoritmos Genéticos', 3),
(4, 7, 'Algoritmos y Estructuras de Datos', 1),
(5, 1, 'Análisis de Sistemas', 2),
(6, 10, 'Análisis y Diseño de Datos e Información', 2),
(7, 8, 'Arquitectura de Computadoras', 1),
(8, 4, 'Comunicaciones', 3),
(9, 4, 'Comunicaciones y Redes', 3),
(10, 2, 'Dirección de Recursos Humanos', 5),
(11, 1, 'Diseño de Sistemas', 3),
(12, 7, 'Entornos Gráficos', 3),
(13, 3, 'Gestión de Datos', 3),
(14, 2, 'Gestión Ingenieril', 3),
(15, 1, 'Habilitación Profesional', 3),
(16, 2, 'Informática en la Administración Pública', 5),
(17, 8, 'Infraestructura Tecnológica', 4),
(18, 10, 'Ingeniería y Calidad de Software', 4),
(19, 9, 'Inteligencia Artificial', 4),
(20, 10, 'Introducción a la Práctica Profesional', 3),
(21, 9, 'Investigación Operativa', 4),
(22, 3, 'Lenguaje de Programación JAVA', 3),
(23, 7, 'Lenguaje Orientado a la Administración Comercial (COBOL)', 3),
(24, 3, 'Lógica y Estructuras Discretas', 1),
(25, 5, 'Matemática Superior', 3),
(26, 2, 'Metodología de Investigación', 4),
(27, 10, 'Metodologías Ágiles de Desarrollo de Software', 5),
(28, 2, 'Minería de Datos', 5),
(29, 7, 'Paradigmas de Programación', 2),
(30, 10, 'Proyecto Final', 5),
(31, 8, 'Redes de Datos', 4),
(32, 9, 'Simulación', 4),
(33, 7, 'Sintaxis y Semántica de los Lenguajes', 2),
(34, 2, 'Sistemas de Gestión', 5),
(35, 2, 'Sistemas de Información Integrados para la Industria', 5),
(36, 8, 'Sistemas Operativos', 2),
(37, 1, 'Sistemas y Procesos de Negocio', 1),
(38, 3, 'Soporte a la Gestión de Datos con Programación Visual', 4),
(39, 1, 'Técnicas y Tecnologías Avanzadas de Desarrollo de Software', 4),
(40, 7, 'Tecnologías de Desarrollo de Software IDE', 3),
(41, 9, 'Tecnologías para la automatización', 4),
(42, 2, 'Seguridad en los Sistemas de Información', 5),
(43, 6, 'Adscripciones', NULL),
(44, 6, 'Administración Departamento', 0),
(45, NULL, 'Competencias', NULL),
(46, 6, 'Coordinación de Investigación', NULL),
(47, 6, 'Desarrollo', NULL),
(48, 6, 'Director de Área Computación', NULL),
(49, 6, 'Director de Área Gestión Ingenieril', NULL),
(50, 6, 'Director de Área Modelos', NULL),
(51, 6, 'Director de Área Programación', NULL),
(52, 6, 'Director de Área Sistemas', NULL),
(53, NULL, 'Gestión de PPS', NULL),
(54, NULL, 'Ingreso y Difusión', NULL),
(55, 6, 'Sala de Encargados', NULL),
(56, 6, 'Unidad de Gestión de PPS', NULL),
(57, 6, 'Vinculación Tecnológica y Convenios', NULL),
(61, 9, 'Análisis Numérico', 3),
(64, 6, 'Secretario Departamento', 0),
(65, 10, 'Sistemas y Procesos de Negocio', 1),
(66, 7, 'Base de Datos', 3),
(67, 7, 'Desarrollo de Software', 3),
(68, 7, 'Lógica y Estructuras Discretas', 1),
(69, 10, 'Diseño de Sistemas de Información', 3),
(70, 8, 'Comunicación de Datos', 3),
(71, 10, 'Análisis de Sistemas de Información', 2),
(72, 7, 'Informática Jurídica', 3),
(73, 10, 'Seminario Integrador', 4),
(74, 8, 'Fabricación Aditiva', 5),
(75, 7, 'Soporte a la Base de Datos con Programación Visual', 4),
(76, 10, 'Sistemas de Informacion Geográfica', 2),
(77, 6, 'Área de TICS', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(4, '2024_04_28_145714_add_two_factor_columns_to_users_table', 1),
(5, '2024_04_28_145741_create_personal_access_tokens_table', 1),
(53, '0001_01_01_000000_create_users_table', 2),
(54, '0001_01_01_000001_create_cache_table', 2),
(55, '0001_01_01_000002_create_jobs_table', 2),
(56, '2024_05_03_151101_aulas', 2),
(57, '2024_05_09_161817_comision', 2),
(58, '2024_05_09_165227_docentes', 3),
(59, '2024_05_09_173422_carreras', 3),
(60, '2024_05_09_174817_asignaturas', 3),
(61, '2024_05_09_180341_horarios', 3),
(62, '2024_05_10_133340_relaciones', 3),
(63, '2024_05_10_144213_roles', 3),
(64, '2024_06_07_181333_auxiliares', 4),
(65, '2024_06_10_141419_cargos', 5),
(66, '2024_06_10_152712_rename_primary_key_in_docentes_table', 6),
(67, '2024_06_10_164805_turnos', 7),
(68, '2024_06_10_174716_materias', 8),
(69, '2024_06_11_230619_eventos', 9),
(70, '2024_08_18_154042_add_tipo_to_eventos_table', 10),
(71, '2024_08_18_155645_add_tipo_to_dias_table', 11),
(72, '2024_08_18_174155_add_id_materia_to_eventos_table', 12),
(75, '2024_09_17_144936_add_nombre_apellido_nivel_permisos_to_users_table', 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('juanpablo.dure@gmail.com', '$2y$12$iG1endl7wwGcO0kxtPOyzOWR6rI7ZNjv/lS46/PlC21CkIB79sAQu', '2024-08-17 17:11:33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `relaciones`
--

CREATE TABLE `relaciones` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desde` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hasta` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `Descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('7XtLWotqL1eDN2roAYceP9LfRbm7sICvP6BLdaMX', 2, '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiRlpUV01vOXhYMTUxc2hJOG5OSWdoZkhxOXAwZk5wNFhOWEpiREVYNyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly90ZXN0LmhndC5jb20uYXIvaG9tZSI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjI7fQ==', 1726582082),
('LiQRPwGWYSLB7WShAcZHgjfAroTzNwjr0a3SLgHm', NULL, '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.0 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWUhaNGluRVZ5dUpwRzVGQlRBdTFabEdBd3BKRUJJTExHZW52eWUwaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHA6Ly94YnVudHUteDIzMC5sb2NhbCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1726576169);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turnos`
--

CREATE TABLE `turnos` (
  `idTurno` int NOT NULL,
  `descripcion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rangoHorario` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `turnos`
--

INSERT INTO `turnos` (`idTurno`, `descripcion`, `rangoHorario`) VALUES
(1, 'Mañana', '07:15 a 13:35 hs'),
(2, 'Tarde', '12:50 a 19:15 hs'),
(3, 'Noche', '18:35 a 00:10 hs');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apellido` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nivelPermisos` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `nombre`, `apellido`, `nivelPermisos`) VALUES
(1, 'Juan', 'juanpablo.dure@gmail.com', NULL, '$2y$12$3fWe1iEaqSDmI3lE0j1iRezIBvmfipR4n2p6CwtS.UvxMnJjrlKly', 'o5k6ohhFISBeRDuMZw2w0BD8gNEVuL0iAGx5vmqH1Tkne1ivhZmeKABKveeL', '2024-05-12 16:00:07', '2024-08-17 17:20:15', NULL, NULL, 0),
(2, 'Juan Pablo Dure TESTING', 'juanpablo.dure@hgtsa.com.ar', NULL, '$2y$12$BRcERUmnIi03RNIzDVdkAuA9D3MHKOnxKpRi7ZNhtEz1jxvByzH7O', NULL, '2024-05-30 15:28:59', '2024-05-30 15:28:59', NULL, NULL, 0),
(3, 'Renzo Fascendini', 'renzo.jrr10@gmail.com', NULL, '$2y$12$3P8MjuMycrCEP0SKNfifcu0oNLqtm2ZnX/3p.ouHbHIfbXsMF/yZm', NULL, '2024-06-07 17:45:43', '2024-06-07 17:45:43', NULL, NULL, 0),
(4, 'Hernán Gueraglia', 'hgueraglia@frro.utn.edu.ar', NULL, '$2y$12$YDNyuXoc3F3.Q8eKUTOd8.jm3b2Yhx6jhPixOm7/zZ.95mVCOLmDG', NULL, '2024-06-13 19:10:54', '2024-06-13 19:10:54', NULL, NULL, 0),
(5, 'Eugenia', 'msaz@frro.utn.edu.ar', NULL, '$2y$12$xDyPR0w0nvP5ttgEvWwzXOnPqVHIg7YupE.DaJ8J6FSMGx9qA79.C', NULL, '2024-08-21 13:45:07', '2024-08-21 13:45:07', NULL, NULL, 0),
(6, 'Germán Mudry', 'gmudry@gmail.com', NULL, '$2y$12$thZCZDEyiSisWuW7gWNvr.X1KL6OMZjtvx2Ki0W81PEOK4/BhXLpC', NULL, '2024-08-27 18:59:38', '2024-08-27 18:59:38', NULL, NULL, 0),
(7, 'Prueba Incercion', 'Sin_MAil', NULL, '', NULL, NULL, NULL, NULL, NULL, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`idArea`);

--
-- Indices de la tabla `asignaturas`
--
ALTER TABLE `asignaturas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `asignaturas_codigo_unique` (`codigo`);

--
-- Indices de la tabla `aulas`
--
ALTER TABLE `aulas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `aulas_codigo_unique` (`codigo`);

--
-- Indices de la tabla `auxiliares`
--
ALTER TABLE `auxiliares`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auxiliares_descripcion_unique` (`Descripcion`);

--
-- Indices de la tabla `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`idCargo`);

--
-- Indices de la tabla `carreras`
--
ALTER TABLE `carreras`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `comisiones`
--
ALTER TABLE `comisiones`
  ADD PRIMARY KEY (`idComision`),
  ADD KEY `idTurno_idx` (`idTurno`);

--
-- Indices de la tabla `docentes`
--
ALTER TABLE `docentes`
  ADD PRIMARY KEY (`idDocente`);

--
-- Indices de la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `evento.aula` (`aula_id`),
  ADD KEY `evento.docente` (`idDocente`),
  ADD KEY `evento.horario` (`idHorario`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD PRIMARY KEY (`idHorario`),
  ADD KEY `idTurno_horarios_idx` (`idTurno`);

--
-- Indices de la tabla `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indices de la tabla `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `materias`
--
ALTER TABLE `materias`
  ADD PRIMARY KEY (`idMateria`),
  ADD KEY `idArea_materias_idx` (`idArea`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `relaciones`
--
ALTER TABLE `relaciones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `relaciones_nombre_unique` (`nombre`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_descripcion_unique` (`Descripcion`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indices de la tabla `turnos`
--
ALTER TABLE `turnos`
  ADD PRIMARY KEY (`idTurno`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `areas`
--
ALTER TABLE `areas`
  MODIFY `idArea` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `asignaturas`
--
ALTER TABLE `asignaturas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `aulas`
--
ALTER TABLE `aulas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `auxiliares`
--
ALTER TABLE `auxiliares`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cargos`
--
ALTER TABLE `cargos`
  MODIFY `idCargo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `carreras`
--
ALTER TABLE `carreras`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `comisiones`
--
ALTER TABLE `comisiones`
  MODIFY `idComision` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT de la tabla `eventos`
--
ALTER TABLE `eventos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `materias`
--
ALTER TABLE `materias`
  MODIFY `idMateria` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `relaciones`
--
ALTER TABLE `relaciones`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `turnos`
--
ALTER TABLE `turnos`
  MODIFY `idTurno` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD CONSTRAINT `evento.docente` FOREIGN KEY (`idDocente`) REFERENCES `docentes` (`idDocente`) ON DELETE SET NULL ON UPDATE RESTRICT,
  ADD CONSTRAINT `evento.horario` FOREIGN KEY (`idHorario`) REFERENCES `horarios` (`idHorario`) ON DELETE SET NULL ON UPDATE RESTRICT;

--
-- Filtros para la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD CONSTRAINT `idTurno_horarios` FOREIGN KEY (`idTurno`) REFERENCES `turnos` (`idTurno`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
