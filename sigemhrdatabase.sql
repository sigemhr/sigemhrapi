-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 09-11-2025 a las 01:10:29
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
-- Base de datos: `sigemhrdatabase`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `codigo` varchar(10) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `jefe_id` bigint(20) UNSIGNED DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`id`, `nombre`, `codigo`, `descripcion`, `jefe_id`, `activo`, `created_at`, `updated_at`) VALUES
(1, 'Recursos Humanos', 'RH', 'Gestión de personal y nómina', 1, 1, '2025-11-01 23:18:49', '2025-11-01 23:18:59'),
(2, 'Finanzas', 'FIN', 'Control financiero y contabilidad', 2, 1, NULL, NULL),
(3, 'Tecnología', 'IT', 'Infraestructura y desarrollo de software', 3, 1, NULL, NULL),
(4, 'Ventas', 'VEN', 'Ventas y atención a clientes', 4, 1, NULL, NULL),
(5, 'Marketing', 'MKT', 'Promoción y campañas publicitarias', 5, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_10_22_040829_create_personal_access_tokens_table', 1),
(5, '2025_10_22_051520_modules', 1),
(6, '2025_10_22_051835_sub_modules', 1),
(7, '2025_10_22_053555_user_module_access', 1),
(8, '2025_10_25_053350_departamentos', 1),
(9, '2025_10_25_053617_puestos', 1),
(10, '2025_10_25_053811_personal', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modules`
--

CREATE TABLE `modules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `modules`
--

INSERT INTO `modules` (`id`, `name`, `slug`, `description`, `icon`, `route`, `order`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Empleados', 'empleados', 'Gestión completa de empleados', 'Users', '/empleados', 1, 1, '2025-10-25 10:54:51', '2025-10-25 10:54:51', NULL),
(2, 'Tiempo y Asistencia', 'tiempo-asistencia', 'Control de horarios, asistencia y ausencias', 'Clock', '/tiempo', 2, 1, '2025-10-25 10:54:51', '2025-10-25 10:54:51', NULL),
(3, 'Nómina', 'nomina', 'Gestión de pagos y nómina', 'Wallet', '/nomina', 3, 1, '2025-10-25 10:54:52', '2025-10-25 10:54:52', NULL),
(4, 'Desempeño', 'desempeno', 'Evaluaciones y gestión del desempeño', 'Target', '/desempeno', 4, 1, '2025-10-25 10:54:52', '2025-10-25 10:54:52', NULL),
(5, 'Reclutamiento', 'reclutamiento', 'Gestión de vacantes y candidatos', 'UserSearch', '/reclutamiento', 5, 1, '2025-10-25 10:54:52', '2025-10-25 10:54:52', NULL),
(6, 'Capacitación', 'capacitacion', 'Formación y desarrollo de empleados', 'GraduationCap', '/capacitacion', 6, 1, '2025-10-25 10:54:52', '2025-10-25 10:54:52', NULL),
(7, 'Beneficios', 'beneficios', 'Gestión de beneficios y prestaciones', 'Gift', '/beneficios', 7, 1, '2025-10-25 10:54:52', '2025-10-25 10:54:52', NULL),
(8, 'Reportes y Analítica', 'reportes', 'Reportes e indicadores de RRHH', 'ChartBar', '/reportes', 8, 1, '2025-10-25 10:54:52', '2025-10-25 10:54:52', NULL),
(9, 'Configuración', 'configuracion', 'Configuración del sistema', 'Settings', '/configuracion', 9, 1, '2025-10-25 10:54:53', '2025-10-25 10:54:53', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

CREATE TABLE `personal` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido_paterno` varchar(255) NOT NULL,
  `apellido_materno` varchar(255) DEFAULT NULL,
  `correo_electronico` varchar(255) NOT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `telefono_emergencia` varchar(255) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `sexo` enum('masculino','femenino','otro') DEFAULT NULL,
  `estado_civil` varchar(255) DEFAULT NULL,
  `nacionalidad` varchar(255) NOT NULL DEFAULT 'Mexicana',
  `direccion` varchar(255) DEFAULT NULL,
  `colonia` varchar(255) DEFAULT NULL,
  `ciudad` varchar(255) DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  `pais` varchar(255) DEFAULT 'México',
  `codigo_postal` varchar(10) DEFAULT NULL,
  `departamento_id` bigint(20) UNSIGNED DEFAULT NULL,
  `puesto_id` bigint(20) UNSIGNED DEFAULT NULL,
  `fecha_contratacion` date DEFAULT NULL,
  `fecha_baja` date DEFAULT NULL,
  `salario` decimal(12,2) DEFAULT NULL,
  `bono` decimal(12,2) DEFAULT NULL,
  `tipo_contrato` enum('tiempo completo','medio tiempo','temporal','prácticas','honorarios') NOT NULL DEFAULT 'tiempo completo',
  `turno` enum('matutino','vespertino','nocturno','mixto') DEFAULT NULL,
  `estatus` enum('activo','inactivo','baja') NOT NULL DEFAULT 'activo',
  `dias_vacaciones` int(11) NOT NULL DEFAULT 0,
  `dias_restantes_vacaciones` int(11) NOT NULL DEFAULT 0,
  `nss` varchar(255) DEFAULT NULL,
  `rfc` varchar(255) DEFAULT NULL,
  `curp` varchar(255) DEFAULT NULL,
  `infonavit` varchar(255) DEFAULT NULL,
  `numero_empleado` varchar(255) NOT NULL,
  `banco` varchar(255) DEFAULT NULL,
  `numero_cuenta` varchar(255) DEFAULT NULL,
  `clabe_interbancaria` varchar(18) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `observaciones` text DEFAULT NULL,
  `es_supervisor` tinyint(1) NOT NULL DEFAULT 0,
  `tiene_acceso_sistema` tinyint(1) NOT NULL DEFAULT 0,
  `usuario_id` bigint(20) UNSIGNED DEFAULT NULL,
  `creado_por` bigint(20) UNSIGNED DEFAULT NULL,
  `actualizado_por` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `personal`
--

INSERT INTO `personal` (`id`, `nombre`, `apellido_paterno`, `apellido_materno`, `correo_electronico`, `telefono`, `telefono_emergencia`, `fecha_nacimiento`, `sexo`, `estado_civil`, `nacionalidad`, `direccion`, `colonia`, `ciudad`, `estado`, `pais`, `codigo_postal`, `departamento_id`, `puesto_id`, `fecha_contratacion`, `fecha_baja`, `salario`, `bono`, `tipo_contrato`, `turno`, `estatus`, `dias_vacaciones`, `dias_restantes_vacaciones`, `nss`, `rfc`, `curp`, `infonavit`, `numero_empleado`, `banco`, `numero_cuenta`, `clabe_interbancaria`, `foto`, `observaciones`, `es_supervisor`, `tiene_acceso_sistema`, `usuario_id`, `creado_por`, `actualizado_por`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Juan', 'Pérez', 'Gómez', 'juan.perez@example.com', '9981234567', '9987654321', '1990-03-15', 'masculino', 'soltero', 'Mexicana', 'Av. Tulum 123', 'Centro', 'Cancún', 'Quintana Roo', 'México', '77500', 1, 2, '2020-01-10', NULL, 15000.00, 1000.00, 'tiempo completo', 'matutino', 'activo', 10, 5, '12345678901', 'PEPJ900315AB1', 'PEPJ900315HQRXYZ01', 'INF1234567', 'EMP001', 'BBVA', '1234567890', '012345678901234567', NULL, NULL, 0, 1, NULL, 1, 1, '2025-10-25 21:20:19', '2025-10-25 21:20:19', NULL),
(2, 'María', 'López', 'Sánchez', 'maria.lopez@example.com', '9982345678', '9988765432', '1992-06-21', 'femenino', 'casado', 'Mexicana', 'Calle Rosas 45', 'SM 20', 'Cancún', 'Quintana Roo', 'México', '77515', 2, 3, '2019-05-01', NULL, 18000.00, 1500.00, 'tiempo completo', 'vespertino', 'activo', 12, 6, '22345678901', 'LOSM920621AB2', 'LOSM920621MQRXYZ02', 'INF2234567', 'EMP002', 'Santander', '2345678901', '123456789012345678', NULL, NULL, 1, 1, NULL, 1, 1, '2025-10-25 21:20:19', '2025-10-25 21:20:19', NULL),
(3, 'Carlos', 'Ramírez', 'Torres', 'carlos.ramirez@example.com', '9983456789', NULL, '1988-11-03', 'masculino', 'soltero', 'Mexicana', 'Av. Kabah 321', 'Región 94', 'Cancún', 'Quintana Roo', 'México', '77536', 1, 1, '2018-03-20', NULL, 20000.00, 2000.00, 'tiempo completo', 'matutino', 'activo', 15, 10, '32345678901', 'RATC881103AB3', 'RATC881103HQRXYZ03', 'INF3234567', 'EMP003', 'Banamex', '3456789012', '234567890123456789', NULL, 'Empleado destacado', 1, 1, NULL, 1, 1, '2025-10-25 21:20:19', '2025-10-25 21:20:19', NULL),
(4, 'Ana', 'Hernández', 'Vega', 'ana.hernandez@example.com', '9984567890', '9985678901', '1995-09-09', 'femenino', 'soltero', 'Mexicana', 'Av. Nichupté 90', 'SM 17', 'Cancún', 'Quintana Roo', 'México', '77505', 3, 4, '2021-07-12', NULL, 12000.00, 800.00, 'medio tiempo', 'mixto', 'activo', 8, 4, '42345678901', 'HEVA950909AB4', 'HEVA950909MQRXYZ04', 'INF4234567', 'EMP004', 'BanCoppel', '4567890123', '345678901234567890', NULL, NULL, 0, 0, NULL, 1, 1, '2025-10-25 21:20:19', '2025-10-25 21:20:19', NULL),
(5, 'Luis', 'Martínez', 'Domínguez', 'luis.martinez@example.com', '9985678901', '9986789012', '1985-04-10', 'masculino', 'casado', 'Mexicana', 'Calle Sol 50', 'La Luna', 'Cancún', 'Quintana Roo', 'México', '77510', 4, 5, '2017-09-15', NULL, 25000.00, 3000.00, 'tiempo completo', 'matutino', 'activo', 20, 15, '52345678901', 'MARD850410AB5', 'MARD850410HQRXYZ05', 'INF5234567', 'EMP005', 'HSBC', '5678901234', '456789012345678901', NULL, 'Encargado de mantenimiento', 1, 1, NULL, 1, 1, '2025-10-25 21:20:19', '2025-10-25 21:20:19', NULL),
(6, 'Paola', 'Reyes', 'Morales', 'paola.reyes@example.com', '9986789012', NULL, '1998-01-25', 'femenino', 'soltero', 'Mexicana', 'Calle Luna 12', 'SM 22', 'Cancún', 'Quintana Roo', 'México', '77518', 2, 6, '2022-11-10', NULL, 11000.00, 500.00, 'temporal', 'vespertino', 'activo', 5, 3, '62345678901', 'REMP980125AB6', 'REMP980125MQRXYZ06', 'INF6234567', 'EMP006', 'Banorte', '6789012345', '567890123456789012', NULL, NULL, 0, 0, NULL, 1, 1, '2025-10-25 21:20:19', '2025-10-25 21:20:19', NULL),
(7, 'Jorge', 'Flores', 'Aguilar', 'jorge.flores@example.com', '9987890123', '9988901234', '1989-08-05', 'masculino', 'casado', 'Mexicana', 'Av. Chac Mool 150', 'Región 100', 'Cancún', 'Quintana Roo', 'México', '77516', 3, 7, '2016-02-01', NULL, 22000.00, 2500.00, 'tiempo completo', 'mixto', 'activo', 18, 12, '72345678901', 'FLOJ890805AB7', 'FLOJ890805HQRXYZ07', 'INF7234567', 'EMP007', 'BBVA', '7890123456', '678901234567890123', NULL, NULL, 1, 1, NULL, 1, 1, '2025-10-25 21:20:19', '2025-10-25 21:20:19', NULL),
(8, 'Lucía', 'García', 'Núñez', 'lucia.garcia@example.com', '9988901234', NULL, '1994-02-17', 'femenino', 'soltero', 'Mexicana', 'Calle Palma 33', 'SM 45', 'Cancún', 'Quintana Roo', 'México', '77533', 1, 8, '2020-10-20', NULL, 14000.00, 1000.00, 'tiempo completo', 'matutino', 'activo', 10, 8, '82345678901', 'GANL940217AB8', 'GANL940217MQRXYZ08', 'INF8234567', 'EMP008', 'Santander', '8901234567', '789012345678901234', NULL, 'Buena actitud laboral', 0, 0, NULL, 1, 1, '2025-10-25 21:20:19', '2025-10-25 21:20:19', NULL),
(9, 'Miguel', 'Castro', 'Jiménez', 'miguel.castro@example.com', '9989012345', '9989123456', '1991-12-30', 'masculino', 'casado', 'Mexicana', 'Av. Yaxchilán 80', 'Centro', 'Cancún', 'Quintana Roo', 'México', '77500', 4, 9, '2015-06-10', NULL, 27000.00, 3500.00, 'tiempo completo', 'matutino', 'activo', 25, 20, '92345678901', 'CAJM911230AB9', 'CAJM911230HQRXYZ09', 'INF9234567', 'EMP009', 'HSBC', '9012345678', '890123456789012345', NULL, 'Jefe de área', 1, 1, NULL, 1, 1, '2025-10-25 21:20:19', '2025-10-25 21:20:19', NULL),
(10, 'Elena', 'Suárez', 'Delgado', 'elena.suarez@example.com', '9989123456', NULL, '1996-05-14', 'femenino', 'soltero', 'Mexicana', 'Calle Violeta 9', 'SM 25', 'Cancún', 'Quintana Roo', 'México', '77525', 2, 10, '2023-04-18', NULL, 10000.00, 700.00, 'prácticas', 'vespertino', 'activo', 3, 2, '10345678901', 'SUDE960514AB0', 'SUDE960514MQRXYZ10', 'INF1034567', 'EMP010', 'BanCoppel', '9123456789', '901234567890123456', NULL, 'Practicante en formación', 0, 0, NULL, 1, 1, '2025-10-25 21:20:19', '2025-10-25 21:20:19', NULL),
(26, 'Carlos', 'Ramírez', 'González', 'carlos.ramirez@empresa.com', '5551234567', '5559876543', '1975-03-15', 'masculino', 'casado', 'Mexicana', 'Av. Reforma 123', 'Juárez', 'Ciudad de México', 'CDMX', 'México', '06600', 1, 1, '2015-01-10', NULL, 85000.00, 15000.00, 'tiempo completo', 'matutino', 'activo', 20, 15, '12345678901', 'RAGC750315HDF', 'RAGC750315HDFRRL01', NULL, 'EMP011', 'BBVA', '1234567890', '012345678901234567', NULL, NULL, 1, 1, NULL, NULL, NULL, '2025-10-27 03:13:00', '2025-10-27 03:13:00', NULL),
(27, 'María', 'López', 'Fernández', 'maria.lopez@empresa.com', '5552345678', '5558765432', '1982-07-22', 'femenino', 'soltera', 'Mexicana', 'Calle Insurgentes 456', 'Roma Norte', 'Ciudad de México', 'CDMX', 'México', '06700', 2, 2, '2016-03-15', NULL, 55000.00, 8000.00, 'tiempo completo', 'matutino', 'activo', 18, 12, '23456789012', 'LOFM820722MDF', 'LOFM820722MDFLPR02', NULL, 'EMP012', 'Santander', '2345678901', '123456789012345678', NULL, NULL, 1, 1, NULL, NULL, NULL, '2025-10-27 03:13:00', '2025-10-27 03:13:00', NULL),
(28, 'Juan', 'Martínez', 'Sánchez', 'juan.martinez@empresa.com', '5553456789', '5557654321', '1988-11-05', 'masculino', 'casado', 'Mexicana', 'Av. Patriotismo 789', 'Mixcoac', 'Ciudad de México', 'CDMX', 'México', '03910', 3, 3, '2017-05-20', NULL, 48000.00, 5000.00, 'tiempo completo', 'matutino', 'activo', 15, 10, '34567890123', 'MASJ881105HDF', 'MASJ881105HDFRHN03', NULL, 'EMP013', 'HSBC', '3456789012', '234567890123456789', NULL, NULL, 0, 1, NULL, NULL, NULL, '2025-10-27 03:13:00', '2025-10-27 03:13:00', NULL),
(29, 'Ana', 'García', 'Rodríguez', 'ana.garcia@empresa.com', '5554567890', '5556543210', '1990-04-18', 'femenino', 'soltera', 'Mexicana', 'Calle Ámsterdam 234', 'Condesa', 'Ciudad de México', 'CDMX', 'México', '06100', 4, 4, '2018-08-12', NULL, 52000.00, 6000.00, 'tiempo completo', 'matutino', 'activo', 12, 8, '45678901234', 'GARA900418MDF', 'GARA900418MDFRCN04', NULL, 'EMP014', 'Banamex', '4567890123', '345678901234567890', NULL, NULL, 0, 1, NULL, NULL, NULL, '2025-10-27 03:13:00', '2025-10-27 03:13:00', NULL),
(30, 'Pedro', 'Hernández', 'Torres', 'pedro.hernandez@empresa.com', '5555678901', '5555432109', '1985-09-30', 'masculino', 'divorciado', 'Mexicana', 'Av. Universidad 567', 'Del Valle', 'Ciudad de México', 'CDMX', 'México', '03100', 5, 5, '2016-11-08', NULL, 38000.00, 12000.00, 'tiempo completo', 'mixto', 'activo', 15, 5, '56789012345', 'HETP850930HDF', 'HETP850930HDFRRP05', NULL, 'EMP015', 'BBVA', '5678901234', '456789012345678901', NULL, NULL, 0, 1, NULL, NULL, NULL, '2025-10-27 03:13:00', '2025-10-27 03:13:00', NULL),
(31, 'Laura', 'Morales', 'Jiménez', 'laura.morales@empresa.com', '5556789012', '5554321098', '1995-02-14', 'femenino', 'soltera', 'Mexicana', 'Calle Durango 890', 'Roma Sur', 'Ciudad de México', 'CDMX', 'México', '06760', 2, 6, '2019-02-25', NULL, 25000.00, 2000.00, 'tiempo completo', 'matutino', 'activo', 12, 12, '67890123456', 'MOJL950214MDF', 'MOJL950214MDFRJR06', NULL, 'EMP016', 'Santander', '6789012345', '567890123456789012', NULL, NULL, 0, 1, NULL, NULL, NULL, '2025-10-27 03:13:00', '2025-10-27 03:13:00', NULL),
(32, 'Roberto', 'Cruz', 'Mendoza', 'roberto.cruz@empresa.com', '5557890123', '5553210987', '1992-06-08', 'masculino', 'soltero', 'Mexicana', 'Av. Cuauhtémoc 345', 'Doctores', 'Ciudad de México', 'CDMX', 'México', '06720', 3, 7, '2020-07-15', NULL, 28000.00, 1500.00, 'tiempo completo', 'matutino', 'activo', 10, 10, '78901234567', 'CURM920608HDF', 'CURM920608HDFRZN07', NULL, 'EMP017', 'HSBC', '7890123456', '678901234567890123', NULL, NULL, 0, 0, NULL, NULL, NULL, '2025-10-27 03:13:00', '2025-10-27 03:13:00', NULL),
(33, 'Diana', 'Flores', 'Reyes', 'diana.flores@empresa.com', '5558901234', '5552109876', '1998-12-20', 'femenino', 'soltera', 'Mexicana', 'Calle Michoacán 678', 'Condesa', 'Ciudad de México', 'CDMX', 'México', '06140', 4, 8, '2021-03-01', NULL, 32000.00, 3000.00, 'tiempo completo', 'matutino', 'activo', 8, 8, '89012345678', 'FORD981220MDF', 'FORD981220MDFLRY08', NULL, 'EMP018', 'Banamex', '8901234567', '789012345678901234', NULL, NULL, 0, 1, NULL, NULL, NULL, '2025-10-27 03:13:00', '2025-10-27 03:13:00', NULL),
(34, 'Miguel', 'Castillo', 'Vargas', 'miguel.castillo@empresa.com', '5559012345', '5551098765', '1980-05-25', 'masculino', 'casado', 'Mexicana', 'Av. Revolución 901', 'San Ángel', 'Ciudad de México', 'CDMX', 'México', '01000', 5, 2, '2015-09-18', NULL, 58000.00, 10000.00, 'tiempo completo', 'mixto', 'activo', 18, 8, '90123456789', 'CAVM800525HDF', 'CAVM800525HDFRRG09', NULL, 'EMP019', 'BBVA', '9012345678', '890123456789012345', NULL, NULL, 1, 1, NULL, NULL, NULL, '2025-10-27 03:13:00', '2025-10-27 03:13:00', NULL),
(35, 'Sofía', 'Domínguez', 'Ortiz', 'sofia.dominguez@empresa.com', '5550123456', '5559876540', '1996-08-12', 'femenino', 'soltera', 'Mexicana', 'Calle Orizaba 123', 'Roma Norte', 'Ciudad de México', 'CDMX', 'México', '06700', 2, 6, '2020-01-20', NULL, 22000.00, 1000.00, 'tiempo completo', 'matutino', 'activo', 10, 7, '01234567890', 'DOOS960812MDF', 'DOOS960812MDFMRF10', NULL, 'EMP020', 'Santander', '0123456789', '901234567890123456', NULL, NULL, 0, 0, NULL, NULL, NULL, '2025-10-27 03:13:00', '2025-10-27 03:13:00', NULL),
(36, 'Fernando', 'Ruiz', 'Gutiérrez', 'fernando.ruiz@empresa.com', '5551234560', '5558765430', '1987-10-03', 'masculino', 'casado', 'Mexicana', 'Av. División del Norte 456', 'Portales', 'Ciudad de México', 'CDMX', 'México', '03300', 4, 4, '2017-06-10', NULL, 50000.00, 5500.00, 'tiempo completo', 'matutino', 'activo', 15, 12, '12340567891', 'RUGF871003HDF', 'RUGF871003HDFZTN11', NULL, 'EMP021', 'HSBC', '1234056789', '012345678901234560', NULL, NULL, 0, 1, NULL, NULL, NULL, '2025-10-27 03:13:00', '2025-10-27 03:13:00', NULL),
(37, 'Gabriela', 'Torres', 'Ramírez', 'gabriela.torres@empresa.com', '5552345670', '5557654320', '2002-01-28', 'femenino', 'soltera', 'Mexicana', 'Calle Monterrey 789', 'Roma Sur', 'Ciudad de México', 'CDMX', 'México', '06760', 5, 8, '2023-08-15', NULL, 15000.00, 500.00, 'prácticas', 'matutino', 'activo', 6, 6, '23450678902', 'TORG020128MDF', 'TORG020128MDFRBL12', NULL, 'EMP022', 'Banamex', '2345067890', '123456789012345670', NULL, NULL, 0, 0, NULL, NULL, NULL, '2025-10-27 03:13:00', '2025-10-27 03:13:00', NULL),
(38, 'Alejandro', 'Vega', 'Moreno', 'alejandro.vega@empresa.com', '5553456780', '5556543200', '1983-07-17', 'masculino', 'casado', 'Mexicana', 'Av. Tlalpan 234', 'Portales', 'Ciudad de México', 'CDMX', 'México', '03300', 1, 3, '2016-04-22', NULL, 45000.00, 6000.00, 'tiempo completo', 'vespertino', 'activo', 15, 9, '34560789013', 'VEMA830717HDF', 'VEMA830717HDFGRL13', NULL, 'EMP023', 'BBVA', '3456078901', '234567890123456780', NULL, NULL, 1, 1, NULL, NULL, NULL, '2025-10-27 03:13:00', '2025-10-27 03:13:00', NULL),
(39, 'Paola', 'Núñez', 'Santos', 'paola.nunez@empresa.com', '5554567800', '5555432100', '1994-11-09', 'femenino', 'soltera', 'Mexicana', 'Calle Puebla 567', 'Roma Norte', 'Ciudad de México', 'CDMX', 'México', '06700', 5, 8, '2021-10-05', NULL, 26000.00, 4000.00, 'tiempo completo', 'mixto', 'activo', 10, 6, '45670890124', 'NUSP941109MDF', 'NUSP941109MDFXNT14', NULL, 'EMP024', 'Santander', '4567089012', '345678901234567800', NULL, NULL, 0, 1, NULL, NULL, NULL, '2025-10-27 03:13:00', '2025-10-27 03:13:00', NULL),
(40, 'Ricardo', 'Medina', 'Salazar', 'ricardo.medina@empresa.com', '5555678910', '5554321090', '1991-03-22', 'masculino', 'soltero', 'Mexicana', 'Av. Coyoacán 890', 'Del Valle', 'Ciudad de México', 'CDMX', 'México', '03100', 3, 7, '2019-12-01', NULL, 35000.00, 3500.00, 'tiempo completo', 'matutino', 'activo', 12, 10, '56780901235', 'MESR910322HDF', 'MESR910322HDFDZL15', NULL, 'EMP025', 'HSBC', '5678090123', '456789012345678910', NULL, NULL, 0, 1, NULL, NULL, NULL, '2025-10-27 03:13:00', '2025-10-27 03:13:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'auth_token', 'af3394eb7b020b69c8722b748a498832b0c8df789124a28c35c45d8cd6d1274c', '[\"*\"]', NULL, NULL, '2025-10-25 11:12:02', '2025-10-25 11:12:02'),
(2, 'App\\Models\\User', 1, 'auth_token', '46b8eea2b4fff1e71c8d1fa354489351e83e67818d2d4e3efa42872ba6278a51', '[\"*\"]', NULL, NULL, '2025-10-25 11:14:59', '2025-10-25 11:14:59'),
(3, 'App\\Models\\User', 1, 'auth_token', 'b359ea0089276650867f10c55878999e49ff386474f08b2eb68b81fe85b1eeee', '[\"*\"]', NULL, NULL, '2025-10-25 11:15:53', '2025-10-25 11:15:53'),
(4, 'App\\Models\\User', 1, 'auth_token', '0cbaf167999e2f25d5a31fc3be79f55e0d0013712459b5f566c2e42eac8bec4d', '[\"*\"]', NULL, NULL, '2025-10-26 02:12:20', '2025-10-26 02:12:20'),
(5, 'App\\Models\\User', 1, 'auth_token', '603ee06582ade98f1906282ebc823eebaf41726a3b3b905905c17b3a57e9ffdb', '[\"*\"]', NULL, NULL, '2025-10-26 06:29:41', '2025-10-26 06:29:41'),
(6, 'App\\Models\\User', 1, 'auth_token', 'e0057c02f019eb39ed446e3bf8175a1fcc529cd967f46c61cd0e1f89014e7136', '[\"*\"]', '2025-10-27 10:38:55', NULL, '2025-10-27 07:41:51', '2025-10-27 10:38:55'),
(7, 'App\\Models\\User', 1, 'auth_token', '170bf887462e7e58a6519038d7d13132ef2a434712c1a38c33e5d32d0b650482', '[\"*\"]', '2025-10-30 04:44:03', NULL, '2025-10-29 05:28:19', '2025-10-30 04:44:03'),
(8, 'App\\Models\\User', 1, 'auth_token', 'b998c9ca2c407fde35368234b2ba8810ab2fc0921ace831fa580640ff5a6c219', '[\"*\"]', '2025-11-02 03:07:28', NULL, '2025-11-02 02:28:12', '2025-11-02 03:07:28'),
(9, 'App\\Models\\User', 1, 'auth_token', '6ea71aacd7fe9a081f5c897a6f3112a5c51434a21d975e4aa9760a441d72e9cc', '[\"*\"]', '2025-11-02 09:39:52', NULL, '2025-11-02 03:17:33', '2025-11-02 09:39:52'),
(10, 'App\\Models\\User', 1, 'auth_token', '260689c5f9ed9228161fa9f2113175c3344741cb0f7f6f81bbe78f88200bb133', '[\"*\"]', '2025-11-07 09:58:29', NULL, '2025-11-07 07:19:47', '2025-11-07 09:58:29'),
(11, 'App\\Models\\User', 1, 'auth_token', '5b8c163c0e46065f18073c5aba40f434d77ec20bebf529c1db9e6d131c8c313e', '[\"*\"]', '2025-11-09 04:34:38', NULL, '2025-11-09 01:53:11', '2025-11-09 04:34:38'),
(12, 'App\\Models\\User', 1, 'auth_token', 'baf9a0dddd18bc79d5273b8d8892b90ef3a833ad3019c8ecef13ad92b35d8ac7', '[\"*\"]', '2025-11-09 04:40:57', NULL, '2025-11-09 04:35:03', '2025-11-09 04:40:57');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puestos`
--

CREATE TABLE `puestos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `departamento_id` bigint(20) UNSIGNED DEFAULT NULL,
  `nombre` varchar(255) NOT NULL,
  `codigo` varchar(10) NOT NULL,
  `nivel` varchar(255) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `salario_min` decimal(12,2) DEFAULT NULL,
  `salario_max` decimal(12,2) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `puestos`
--

INSERT INTO `puestos` (`id`, `departamento_id`, `nombre`, `codigo`, `nivel`, `descripcion`, `salario_min`, `salario_max`, `activo`, `created_at`, `updated_at`) VALUES
(1, 1, 'Analista de Recursos Humanos', 'RH-001', 'Junior', 'Apoyo en procesos de reclutamiento, selección y capacitación', 15000.00, 20000.00, 1, NULL, NULL),
(2, 1, 'Jefe de Recursos Humanos', 'RH-002', 'Senior', 'Supervisa las operaciones de RRHH', 25000.00, 35000.00, 1, NULL, NULL),
(3, 2, 'Contador General', 'FIN-001', 'Senior', 'Responsable de la contabilidad general y estados financieros', 22000.00, 30000.00, 1, NULL, NULL),
(4, 2, 'Auxiliar Contable', 'FIN-002', 'Junior', 'Apoyo en registros contables y facturación', 12000.00, 18000.00, 1, NULL, NULL),
(5, 3, 'Desarrollador Backend', 'IT-001', 'Mid', 'Desarrollo y mantenimiento de APIs y servicios', 25000.00, 40000.00, 1, NULL, NULL),
(6, 3, 'Administrador de Sistemas', 'IT-002', 'Senior', 'Mantenimiento de servidores y redes', 28000.00, 42000.00, 1, NULL, NULL),
(7, 4, 'Ejecutivo de Ventas', 'VEN-001', 'Mid', 'Gestión de cuentas y cierre de ventas', 15000.00, 30000.00, 1, NULL, NULL),
(8, 4, 'Gerente de Ventas', 'VEN-002', 'Senior', 'Supervisa el equipo comercial', 28000.00, 45000.00, 1, NULL, NULL),
(9, 5, 'Community Manager', 'MKT-001', 'Junior', 'Gestión de redes sociales y contenido digital', 14000.00, 20000.00, 1, NULL, NULL),
(10, 5, 'Director de Marketing', 'MKT-002', 'Senior', 'Diseño de estrategias de marketing y supervisión del área', 30000.00, 50000.00, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('XFLI2IGTm53qW3PzttIGM2peCt8zeKwrk9iwff4t', NULL, '192.168.101.104', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV1RtOWpTbkgyRXpTVUJVdXBDU2w4bTVzTlltU09Hdklucms2R3J6QyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xOTIuMTY4LjEwMS4xMDQvaHJfc3lzdGVtL3B1YmxpYyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1762647009);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `submodules`
--

CREATE TABLE `submodules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `parent_submodule_id` bigint(20) UNSIGNED DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `submodules`
--

INSERT INTO `submodules` (`id`, `module_id`, `name`, `slug`, `description`, `icon`, `route`, `order`, `is_active`, `parent_submodule_id`, `level`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Directorio', 'empleados-directorio', NULL, 'BookUser', '/empleados/directorio', 1, 1, NULL, 1, '2025-10-25 10:54:51', '2025-10-25 10:54:51', NULL),
(2, 1, 'Organigrama', 'empleados-organigrama', NULL, 'Network', '/empleados/organigrama', 2, 1, NULL, 1, '2025-10-25 10:54:51', '2025-10-25 10:54:51', NULL),
(3, 1, 'Expedientes', 'empleados-expedientes', NULL, 'Folder', '/empleados/expedientes', 3, 1, NULL, 1, '2025-10-25 10:54:51', '2025-10-25 10:54:51', NULL),
(4, 1, 'Datos Personales', 'expedientes-datos-personales', NULL, NULL, '/empleados/expedientes/datos-personales', 1, 1, 3, 2, '2025-10-25 10:54:51', '2025-10-25 10:54:51', NULL),
(5, 1, 'Documentos', 'expedientes-documentos', NULL, NULL, '/empleados/expedientes/documentos', 2, 1, 3, 2, '2025-10-25 10:54:51', '2025-10-25 10:54:51', NULL),
(6, 1, 'Historial Laboral', 'expedientes-historial', NULL, NULL, '/empleados/expedientes/historial', 3, 1, 3, 2, '2025-10-25 10:54:51', '2025-10-25 10:54:51', NULL),
(7, 1, 'Onboarding', 'empleados-onboarding', NULL, 'UserPlus', '/empleados/onboarding', 4, 1, NULL, 1, '2025-10-25 10:54:51', '2025-10-25 10:54:51', NULL),
(8, 1, 'Offboarding', 'empleados-offboarding', NULL, 'UserMinus', '/empleados/offboarding', 5, 1, NULL, 1, '2025-10-25 10:54:51', '2025-10-25 10:54:51', NULL),
(9, 2, 'Registro de Tiempo', 'tiempo-registro', NULL, 'ClockCheck', '/tiempo/registro', 1, 1, NULL, 1, '2025-10-25 10:54:52', '2025-10-25 10:54:52', NULL),
(10, 2, 'Checadas', 'tiempo-checadas', NULL, NULL, '/tiempo/registro/checadas', 1, 1, 9, 2, '2025-10-25 10:54:52', '2025-10-25 10:54:52', NULL),
(11, 2, 'Horas Extras', 'tiempo-horas-extras', NULL, NULL, '/tiempo/registro/horas-extras', 2, 1, 9, 2, '2025-10-25 10:54:52', '2025-10-25 10:54:52', NULL),
(12, 2, 'Ausencias', 'tiempo-ausencias', NULL, 'CalendarX', '/tiempo/ausencias', 2, 1, NULL, 1, '2025-10-25 10:54:52', '2025-10-25 10:54:52', NULL),
(13, 2, 'Solicitudes', 'ausencias-solicitudes', NULL, NULL, '/tiempo/ausencias/solicitudes', 1, 1, 12, 2, '2025-10-25 10:54:52', '2025-10-25 10:54:52', NULL),
(14, 2, 'Balance de Días', 'ausencias-balance', NULL, NULL, '/tiempo/ausencias/balance', 2, 1, 12, 2, '2025-10-25 10:54:52', '2025-10-25 10:54:52', NULL),
(15, 2, 'Calendario', 'tiempo-calendario', NULL, 'Calendar', '/tiempo/calendario', 3, 1, NULL, 1, '2025-10-25 10:54:52', '2025-10-25 10:54:52', NULL),
(16, 2, 'Turnos', 'tiempo-turnos', NULL, 'RotateCw', '/tiempo/turnos', 4, 1, NULL, 1, '2025-10-25 10:54:52', '2025-10-25 10:54:52', NULL),
(17, 3, 'Proceso de Nómina', 'nomina-proceso', NULL, 'Calculator', '/nomina/proceso', 1, 1, NULL, 1, '2025-10-25 10:54:52', '2025-10-25 10:54:52', NULL),
(18, 3, 'Cálculo', 'nomina-calculo', NULL, NULL, '/nomina/proceso/calculo', 1, 1, 17, 2, '2025-10-25 10:54:52', '2025-10-25 10:54:52', NULL),
(19, 3, 'Validación', 'nomina-validacion', NULL, NULL, '/nomina/proceso/validacion', 2, 1, 17, 2, '2025-10-25 10:54:52', '2025-10-25 10:54:52', NULL),
(20, 3, 'Dispersión', 'nomina-dispersion', NULL, NULL, '/nomina/proceso/dispersion', 3, 1, 17, 2, '2025-10-25 10:54:52', '2025-10-25 10:54:52', NULL),
(21, 3, 'Recibos de Nómina', 'nomina-recibos', NULL, 'FileText', '/nomina/recibos', 2, 1, NULL, 1, '2025-10-25 10:54:52', '2025-10-25 10:54:52', NULL),
(22, 3, 'Percepciones y Deducciones', 'nomina-percepciones-deducciones', NULL, 'Percent', '/nomina/percepciones-deducciones', 3, 1, NULL, 1, '2025-10-25 10:54:52', '2025-10-25 10:54:52', NULL),
(23, 3, 'Finiquitos', 'nomina-finiquitos', NULL, 'FileCheck', '/nomina/finiquitos', 4, 1, NULL, 1, '2025-10-25 10:54:52', '2025-10-25 10:54:52', NULL),
(24, 4, 'Evaluaciones', 'desempeno-evaluaciones', NULL, 'ClipboardCheck', '/desempeno/evaluaciones', 1, 1, NULL, 1, '2025-10-25 10:54:52', '2025-10-25 10:54:52', NULL),
(25, 4, 'Evaluación 360°', 'evaluaciones-360', NULL, NULL, '/desempeno/evaluaciones/360', 1, 1, 24, 2, '2025-10-25 10:54:52', '2025-10-25 10:54:52', NULL),
(26, 4, 'Evaluación por Objetivos', 'evaluaciones-objetivos', NULL, NULL, '/desempeno/evaluaciones/objetivos', 2, 1, 24, 2, '2025-10-25 10:54:52', '2025-10-25 10:54:52', NULL),
(27, 4, 'Evaluación Continua', 'evaluaciones-continua', NULL, NULL, '/desempeno/evaluaciones/continua', 3, 1, 24, 2, '2025-10-25 10:54:52', '2025-10-25 10:54:52', NULL),
(28, 4, 'Objetivos (OKRs)', 'desempeno-okrs', NULL, 'Target', '/desempeno/okrs', 2, 1, NULL, 1, '2025-10-25 10:54:52', '2025-10-25 10:54:52', NULL),
(29, 4, 'One-on-Ones', 'desempeno-one-on-ones', NULL, 'MessageCircle', '/desempeno/one-on-ones', 3, 1, NULL, 1, '2025-10-25 10:54:52', '2025-10-25 10:54:52', NULL),
(30, 4, 'Feedback', 'desempeno-feedback', NULL, 'MessageSquare', '/desempeno/feedback', 4, 1, NULL, 1, '2025-10-25 10:54:52', '2025-10-25 10:54:52', NULL),
(31, 5, 'Vacantes', 'reclutamiento-vacantes', NULL, 'Briefcase', '/reclutamiento/vacantes', 1, 1, NULL, 1, '2025-10-25 10:54:52', '2025-10-25 10:54:52', NULL),
(32, 5, 'Crear Vacante', 'vacantes-crear', NULL, NULL, '/reclutamiento/vacantes/crear', 1, 1, 31, 2, '2025-10-25 10:54:52', '2025-10-25 10:54:52', NULL),
(33, 5, 'Publicar Vacante', 'vacantes-publicar', NULL, NULL, '/reclutamiento/vacantes/publicar', 2, 1, 31, 2, '2025-10-25 10:54:52', '2025-10-25 10:54:52', NULL),
(34, 5, 'Candidatos', 'reclutamiento-candidatos', NULL, 'Users', '/reclutamiento/candidatos', 2, 1, NULL, 1, '2025-10-25 10:54:52', '2025-10-25 10:54:52', NULL),
(35, 5, 'Pipeline', 'reclutamiento-pipeline', NULL, 'GitBranch', '/reclutamiento/pipeline', 3, 1, NULL, 1, '2025-10-25 10:54:52', '2025-10-25 10:54:52', NULL),
(36, 5, 'Entrevistas', 'reclutamiento-entrevistas', NULL, 'CalendarDays', '/reclutamiento/entrevistas', 4, 1, NULL, 1, '2025-10-25 10:54:52', '2025-10-25 10:54:52', NULL),
(37, 6, 'Cursos', 'capacitacion-cursos', NULL, 'Book', '/capacitacion/cursos', 1, 1, NULL, 1, '2025-10-25 10:54:52', '2025-10-25 10:54:52', NULL),
(38, 6, 'Catálogo', 'cursos-catalogo', NULL, NULL, '/capacitacion/cursos/catalogo', 1, 1, 37, 2, '2025-10-25 10:54:52', '2025-10-25 10:54:52', NULL),
(39, 6, 'Mis Cursos', 'cursos-mis-cursos', NULL, NULL, '/capacitacion/cursos/mis-cursos', 2, 1, 37, 2, '2025-10-25 10:54:52', '2025-10-25 10:54:52', NULL),
(40, 6, 'Planes de Desarrollo', 'capacitacion-planes', NULL, 'Map', '/capacitacion/planes', 2, 1, NULL, 1, '2025-10-25 10:54:52', '2025-10-25 10:54:52', NULL),
(41, 6, 'Certificaciones', 'capacitacion-certificaciones', NULL, 'Award', '/capacitacion/certificaciones', 3, 1, NULL, 1, '2025-10-25 10:54:52', '2025-10-25 10:54:52', NULL),
(42, 6, 'Proveedores', 'capacitacion-proveedores', NULL, 'Building', '/capacitacion/proveedores', 4, 1, NULL, 1, '2025-10-25 10:54:52', '2025-10-25 10:54:52', NULL),
(43, 7, 'Seguro Médico', 'beneficios-seguro-medico', NULL, 'HeartPulse', '/beneficios/seguro-medico', 1, 1, NULL, 1, '2025-10-25 10:54:52', '2025-10-25 10:54:52', NULL),
(44, 7, 'Vales de Despensa', 'beneficios-vales', NULL, 'ShoppingCart', '/beneficios/vales', 2, 1, NULL, 1, '2025-10-25 10:54:52', '2025-10-25 10:54:52', NULL),
(45, 7, 'Plan de Pensiones', 'beneficios-pensiones', NULL, 'PiggyBank', '/beneficios/pensiones', 3, 1, NULL, 1, '2025-10-25 10:54:52', '2025-10-25 10:54:52', NULL),
(46, 7, 'Otros Beneficios', 'beneficios-otros', NULL, 'Sparkles', '/beneficios/otros', 4, 1, NULL, 1, '2025-10-25 10:54:52', '2025-10-25 10:54:52', NULL),
(47, 8, 'Dashboards', 'reportes-dashboards', NULL, 'LayoutDashboard', '/reportes/dashboards', 1, 1, NULL, 1, '2025-10-25 10:54:52', '2025-10-25 10:54:52', NULL),
(48, 8, 'Dashboard General', 'dashboards-general', NULL, NULL, '/reportes/dashboards/general', 1, 1, 47, 2, '2025-10-25 10:54:53', '2025-10-25 10:54:53', NULL),
(49, 8, 'Dashboard Ejecutivo', 'dashboards-ejecutivo', NULL, NULL, '/reportes/dashboards/ejecutivo', 2, 1, 47, 2, '2025-10-25 10:54:53', '2025-10-25 10:54:53', NULL),
(50, 8, 'Rotación de Personal', 'reportes-rotacion', NULL, 'RefreshCw', '/reportes/rotacion', 2, 1, NULL, 1, '2025-10-25 10:54:53', '2025-10-25 10:54:53', NULL),
(51, 8, 'Ausentismo', 'reportes-ausentismo', NULL, 'CalendarX', '/reportes/ausentismo', 3, 1, NULL, 1, '2025-10-25 10:54:53', '2025-10-25 10:54:53', NULL),
(52, 8, 'Costos de Nómina', 'reportes-costos', NULL, 'DollarSign', '/reportes/costos', 4, 1, NULL, 1, '2025-10-25 10:54:53', '2025-10-25 10:54:53', NULL),
(53, 8, 'Exportar Datos', 'reportes-exportar', NULL, 'Download', '/reportes/exportar', 5, 1, NULL, 1, '2025-10-25 10:54:53', '2025-10-25 10:54:53', NULL),
(54, 9, 'Empresa', 'config-empresa', NULL, 'Building', '/configuracion/empresa', 1, 1, NULL, 1, '2025-10-25 10:54:53', '2025-10-25 10:54:53', NULL),
(55, 9, 'Información General', 'empresa-info', NULL, NULL, '/configuracion/empresa/info', 1, 1, 54, 2, '2025-10-25 10:54:53', '2025-10-25 10:54:53', NULL),
(56, 9, 'Sucursales', 'empresa-sucursales', NULL, NULL, '/configuracion/empresa/sucursales', 2, 1, 54, 2, '2025-10-25 10:54:53', '2025-10-25 10:54:53', NULL),
(57, 9, 'Departamentos', 'empresa-departamentos', NULL, NULL, '/configuracion/empresa/departamentos', 3, 1, 54, 2, '2025-10-25 10:54:53', '2025-10-25 10:54:53', NULL),
(58, 9, 'Puestos', 'empresa-puestos', NULL, NULL, '/configuracion/empresa/puestos', 4, 1, 54, 2, '2025-10-25 10:54:53', '2025-10-25 10:54:53', NULL),
(59, 9, 'Usuarios y Permisos', 'config-usuarios', NULL, 'Shield', '/configuracion/usuarios', 2, 1, NULL, 1, '2025-10-25 10:54:53', '2025-10-25 10:54:53', NULL),
(60, 9, 'Políticas', 'config-politicas', NULL, 'FileText', '/configuracion/politicas', 3, 1, NULL, 1, '2025-10-25 10:54:53', '2025-10-25 10:54:53', NULL),
(61, 9, 'Integraciones', 'config-integraciones', NULL, 'Plug', '/configuracion/integraciones', 4, 1, NULL, 1, '2025-10-25 10:54:53', '2025-10-25 10:54:53', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Test User', 'soporte@sigemhr.com', '2025-10-25 10:48:02', '$2y$12$qNha7JPe1O1FFGaCeo9wreVEw87ipc0y285rqVa41UiszyvskXg0C', 'CimuE7Mydu', '2025-10-25 10:48:02', '2025-10-25 11:10:56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_module_access`
--

CREATE TABLE `user_module_access` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `module_id` bigint(20) UNSIGNED DEFAULT NULL,
  `submodule_id` bigint(20) UNSIGNED DEFAULT NULL,
  `subsubmodule_id` bigint(20) UNSIGNED DEFAULT NULL,
  `can_view` tinyint(1) NOT NULL DEFAULT 0,
  `can_create` tinyint(1) NOT NULL DEFAULT 0,
  `can_edit` tinyint(1) NOT NULL DEFAULT 0,
  `can_delete` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `user_module_access`
--

INSERT INTO `user_module_access` (`id`, `user_id`, `module_id`, `submodule_id`, `subsubmodule_id`, `can_view`, `can_create`, `can_edit`, `can_delete`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(2, 1, 2, NULL, NULL, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(3, 1, 3, NULL, NULL, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(4, 1, 4, NULL, NULL, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(5, 1, 5, NULL, NULL, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(6, 1, 6, NULL, NULL, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(7, 1, 7, NULL, NULL, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(8, 1, 8, NULL, NULL, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(9, 1, 9, NULL, NULL, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(16, 1, 1, 1, NULL, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(17, 1, 1, 2, NULL, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(18, 1, 1, 3, NULL, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(19, 1, 1, 7, NULL, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(20, 1, 1, 8, NULL, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(21, 1, 2, 9, NULL, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(22, 1, 2, 12, NULL, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(23, 1, 2, 15, NULL, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(24, 1, 2, 16, NULL, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(25, 1, 3, 17, NULL, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(26, 1, 3, 21, NULL, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(27, 1, 3, 22, NULL, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(28, 1, 3, 23, NULL, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(29, 1, 4, 24, NULL, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(30, 1, 4, 28, NULL, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(31, 1, 4, 29, NULL, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(32, 1, 4, 30, NULL, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(33, 1, 5, 31, NULL, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(34, 1, 5, 34, NULL, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(35, 1, 5, 35, NULL, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(36, 1, 5, 36, NULL, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(37, 1, 6, 37, NULL, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(38, 1, 6, 40, NULL, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(39, 1, 6, 41, NULL, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(40, 1, 6, 42, NULL, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(41, 1, 7, 43, NULL, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(42, 1, 7, 44, NULL, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(43, 1, 7, 45, NULL, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(44, 1, 7, 46, NULL, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(45, 1, 8, 47, NULL, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(46, 1, 8, 50, NULL, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(47, 1, 8, 51, NULL, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(48, 1, 8, 52, NULL, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(49, 1, 8, 53, NULL, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(50, 1, 9, 54, NULL, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(51, 1, 9, 59, NULL, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(52, 1, 9, 60, NULL, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(53, 1, 9, 61, NULL, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(79, 1, 1, 3, 4, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(80, 1, 1, 3, 5, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(81, 1, 1, 3, 6, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(82, 1, 2, 9, 10, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(83, 1, 2, 9, 11, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(84, 1, 2, 12, 13, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(85, 1, 2, 12, 14, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(86, 1, 3, 17, 18, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(87, 1, 3, 17, 19, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(88, 1, 3, 17, 20, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(89, 1, 4, 24, 25, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(90, 1, 4, 24, 26, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(91, 1, 4, 24, 27, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(92, 1, 5, 31, 32, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(93, 1, 5, 31, 33, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(94, 1, 6, 37, 38, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(95, 1, 6, 37, 39, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(96, 1, 8, 47, 48, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(97, 1, 8, 47, 49, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(98, 1, 9, 54, 55, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(99, 1, 9, 54, 56, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(100, 1, 9, 54, 57, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51'),
(101, 1, 9, 54, 58, 1, 1, 1, 1, '2025-10-25 05:58:51', '2025-10-25 05:58:51');

--
-- Índices para tablas volcadas
--

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
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `departamentos_nombre_unique` (`nombre`),
  ADD UNIQUE KEY `departamentos_codigo_unique` (`codigo`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

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
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `modules_slug_unique` (`slug`),
  ADD KEY `modules_order_index` (`order`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_correo_electronico_unique` (`correo_electronico`),
  ADD UNIQUE KEY `personal_numero_empleado_unique` (`numero_empleado`),
  ADD KEY `personal_departamento_id_foreign` (`departamento_id`),
  ADD KEY `personal_puesto_id_foreign` (`puesto_id`),
  ADD KEY `personal_usuario_id_foreign` (`usuario_id`),
  ADD KEY `personal_creado_por_foreign` (`creado_por`),
  ADD KEY `personal_actualizado_por_foreign` (`actualizado_por`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indices de la tabla `puestos`
--
ALTER TABLE `puestos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `puestos_codigo_unique` (`codigo`),
  ADD KEY `puestos_departamento_id_foreign` (`departamento_id`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indices de la tabla `submodules`
--
ALTER TABLE `submodules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `submodules_slug_unique` (`slug`),
  ADD KEY `submodules_module_id_index` (`module_id`),
  ADD KEY `submodules_parent_submodule_id_index` (`parent_submodule_id`),
  ADD KEY `submodules_order_index` (`order`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indices de la tabla `user_module_access`
--
ALTER TABLE `user_module_access`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_user_module_access` (`user_id`,`module_id`,`submodule_id`,`subsubmodule_id`),
  ADD KEY `user_module_access_module_id_foreign` (`module_id`),
  ADD KEY `user_module_access_submodule_id_foreign` (`submodule_id`),
  ADD KEY `user_module_access_user_id_module_id_index` (`user_id`,`module_id`),
  ADD KEY `user_module_access_user_id_submodule_id_index` (`user_id`,`submodule_id`),
  ADD KEY `user_module_access_user_id_subsubmodule_id_index` (`user_id`,`subsubmodule_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `modules`
--
ALTER TABLE `modules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `personal`
--
ALTER TABLE `personal`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `puestos`
--
ALTER TABLE `puestos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `submodules`
--
ALTER TABLE `submodules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `user_module_access`
--
ALTER TABLE `user_module_access`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `personal`
--
ALTER TABLE `personal`
  ADD CONSTRAINT `personal_actualizado_por_foreign` FOREIGN KEY (`actualizado_por`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `personal_creado_por_foreign` FOREIGN KEY (`creado_por`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `personal_departamento_id_foreign` FOREIGN KEY (`departamento_id`) REFERENCES `departamentos` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `personal_puesto_id_foreign` FOREIGN KEY (`puesto_id`) REFERENCES `puestos` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `personal_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `puestos`
--
ALTER TABLE `puestos`
  ADD CONSTRAINT `puestos_departamento_id_foreign` FOREIGN KEY (`departamento_id`) REFERENCES `departamentos` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `submodules`
--
ALTER TABLE `submodules`
  ADD CONSTRAINT `submodules_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `submodules_parent_submodule_id_foreign` FOREIGN KEY (`parent_submodule_id`) REFERENCES `submodules` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `user_module_access`
--
ALTER TABLE `user_module_access`
  ADD CONSTRAINT `user_module_access_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_module_access_submodule_id_foreign` FOREIGN KEY (`submodule_id`) REFERENCES `submodules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_module_access_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
