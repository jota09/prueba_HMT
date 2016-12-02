-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-11-2016 a las 22:52:49
-- Versión del servidor: 10.1.9-MariaDB
-- Versión de PHP: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `examen_ingreso_2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `Estado` varchar(10) NOT NULL DEFAULT '',
  `Descr_Estado` varchar(70) NOT NULL DEFAULT '',
  `Etapa` varchar(20) NOT NULL DEFAULT '',
  `Cod_Etapa` varchar(10) NOT NULL DEFAULT '',
  `Nombre_Estado` varchar(50) NOT NULL,
  `Jerarquia` char(3) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Estados con sus descripciones y jerarquias';

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`Estado`, `Descr_Estado`, `Etapa`, `Cod_Etapa`, `Nombre_Estado`, `Jerarquia`) VALUES
('ACT', '', 'Telemercadeo', '', '', '2'),
('ALIS', 'Factura Alistada', 'Alistamiento', '25202', 'En Impresión', '3'),
('DEVCD', '', 'Telemercadeo', '', 'Devolución Cambio de Domicilio', '2'),
('DEVCD', '', 'Distribucion', '25204', 'Devoluci&#243;n Cambio de Domicilio', '3'),
('DEVCE', '', 'Telemercadeo', '', 'Devolución Predio Cerrado', '2'),
('DEVCE', '', 'Distribucion', '25204', 'Devolución Predio Cerrado', '3'),
('DEVDD', '', 'Telemercadeo', '', 'Devolución Destinatario Desconocido', '2'),
('DEVDD', '', 'Distribucion', '25204', 'Devoluci&#243;n Destinatario Desconocido', '3'),
('DEVDI', '', 'Distribucion', '25204', 'Devoluci&#243;n Direcci&#243;n Incompleta', '3'),
('DEVDI', '', 'Telemercadeo', '', 'Devolución Dirección Incompleta', '2'),
('DEVIN', '', 'Distribucion', '25204', 'Devolucion ola invernal', '3'),
('DEVNE', '', 'Distribucion', '25204', 'Devolución Direcci&#243;n No Existe', '3'),
('DEVNE', '', 'Telemercadeo', '', 'Devolución Dirección No Existe', '2'),
('DEVRB', '', 'Distribucion', '25204', 'Rebot&#243; Correo Electronico', '3'),
('DEVRH', '', 'Telemercadeo', '', 'Devolución RH', '2'),
('DEVRH', '', 'Distribucion', '25204', 'Devoluci&#243;n RH', '3'),
('DEVZR', '', 'Telemercadeo', '', 'Devolución ZR', '2'),
('DEVZR', '', 'NoDistribucionNo', '025204', 'Devoluci&#243;n ZR', '3'),
('DIROK', '', 'Telemercadeo', '', '', '2'),
('DMES', 'Llego hace dos meses', 'Auditoria Tiempo', '', '', '2'),
('ENT', 'Auditoria Entregada', 'Auditoria_prv', '', '', '4'),
('ENT', 'factura entregada', 'Auditoria', '', '', '2'),
('ENT', 'Factura Entregada', 'Distribucion', '25204', 'Entregada', '4'),
('ENV', 'Correo Enviado', 'Distribucion', '25204', '', '2'),
('FACOKTD', 'Factura llega tarde', 'Auditoria', '', '', '2'),
('FACTOK', 'Llego factura', 'Auditoria', '', '', '2'),
('FALTA', '', 'Distribucion', '25204', 'Faltante en Impresión', '2'),
('FALTI', 'Factura Faltante En Alistamiento', 'Alistamiento', '25202', 'En Impresión', '2'),
('ILO', '', 'Auditoria', '', '', '2'),
('ILO', '', 'Telemercadeo', '', '', '2'),
('Impr', 'Factura Impresa', 'Impresion', '25201', 'En Impresión', '3'),
('INTER', 'Intermitente', 'Auditoria Tiempo', '', '', '2'),
('NALIS', 'Factura No Alistada', 'Alistamiento', '25202', 'En Impresión', '1'),
('NENT', 'Factura no Entregada', 'Distribucion', '25204', 'En Distribucion', '1'),
('NENT', 'Auditoria NO Entregada', 'Auditoria_prv', '', '', '3'),
('NFDNOK', 'No llego factura direccion no ok', 'Auditoria', '', '', '2'),
('NFDOK', 'No llego factura dir ok', 'Auditoria', '', '', '2'),
('NoImp', 'Factura No Impresa', 'Impresion', '25201', 'No Impresa', '1'),
('NOINF', '', 'Telemercadeo', '', '', '2'),
('NOZON', 'Factura no ZONIFICADA', 'Zonificacion', '25203', 'No Zonificacion', '1'),
('PROD', 'Factura Generada', 'Produccion', '25200', 'En Impresion', '3'),
('RCZBL', 'Correo electronico no entregado buzon lleno', 'Distribucion', '25204', '', '4'),
('RCZMI', 'Correo no entregado direcccion electronica incorrecta', 'Distribucion', '25204', '', '4'),
('RCZSP', 'Correo electronico no entregado por bloqueo temporal del spam', 'Distribucion', '25204', '', '4'),
('RCZSR', 'Correo electronico no entregado buzon no disponible', 'Distribucion', '25204', '', '4'),
('REB', '', 'Distribucion', '65204', 'Rebotado', '2'),
('RETRD', '', 'Telemercadeo', '', '', '2'),
('SDTL', 'Correo Sin Detalle', 'Distribucion', '25204', '', '3'),
('TMES', 'Llego hace tres meses', 'Auditoria Tiempo', '', '', '2'),
('ZONIF', 'Factura ZONIFICADA', 'Zonificacion', '25203', 'Zonificacion', '3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `procesos`
--

CREATE TABLE `procesos` (
  `Cod_Proceso` varchar(10) NOT NULL,
  `Fecha_Ini` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `procesos`
--

INSERT INTO `procesos` (`Cod_Proceso`, `Fecha_Ini`) VALUES
('200331', '2016-03-06'),
('200332', '2016-03-24'),
('200333', '2016-03-20'),
('200334', '2016-03-27'),
('200335', '2016-04-06'),
('200336', '2016-04-22'),
('200337', '2016-04-21'),
('200338', '2016-04-26'),
('200339', '2016-05-06'),
('200340', '2016-05-13'),
('200341', '2016-05-23'),
('200342', '2016-05-28'),
('701249', '2016-03-01'),
('701250', '2016-03-05'),
('701251', '2016-03-05'),
('701252', '2016-03-12'),
('701253', '2016-03-16'),
('701254', '2016-03-20'),
('701255', '2016-04-02'),
('701256', '2016-03-26'),
('701257', '2016-04-01'),
('701258', '2016-04-28'),
('701259', '2016-04-09'),
('701260', '2016-05-08'),
('701261', '2016-04-16'),
('701262', '2016-04-20'),
('701263', '2016-04-23'),
('701264', '2016-04-26'),
('701265', '2016-05-01'),
('701266', '2016-05-05'),
('701267', '2016-05-09'),
('701268', '2016-05-12'),
('701269', '2016-05-16'),
('701270', '2016-05-20'),
('701271', '2016-05-23'),
('701272', '2016-05-26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporte_01_2016`
--

CREATE TABLE `reporte_01_2016` (
  `No_Cuenta` varchar(20) NOT NULL,
  `Fecha_Reporte` datetime NOT NULL,
  `Estado` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporte_02_2016`
--

CREATE TABLE `reporte_02_2016` (
  `No_Cuenta` varchar(20) NOT NULL,
  `Fecha_Reporte` datetime NOT NULL,
  `Estado` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporte_03_2016`
--

CREATE TABLE `reporte_03_2016` (
  `No_Cuenta` varchar(20) NOT NULL,
  `Fecha_Reporte` datetime NOT NULL,
  `Estado` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporte_04_2016`
--

CREATE TABLE `reporte_04_2016` (
  `No_Cuenta` varchar(20) NOT NULL,
  `Fecha_Reporte` datetime NOT NULL,
  `Estado` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporte_05_2016`
--

CREATE TABLE `reporte_05_2016` (
  `No_Cuenta` varchar(20) NOT NULL,
  `Fecha_Reporte` datetime NOT NULL,
  `Estado` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporte_06_2016`
--

CREATE TABLE `reporte_06_2016` (
  `No_Cuenta` varchar(20) NOT NULL,
  `Fecha_Reporte` datetime NOT NULL,
  `Estado` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporte_07_2016`
--

CREATE TABLE `reporte_07_2016` (
  `No_Cuenta` varchar(20) NOT NULL,
  `Fecha_Reporte` datetime NOT NULL,
  `Estado` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporte_08_2016`
--

CREATE TABLE `reporte_08_2016` (
  `No_Cuenta` varchar(20) NOT NULL,
  `Fecha_Reporte` datetime NOT NULL,
  `Estado` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporte_09_2016`
--

CREATE TABLE `reporte_09_2016` (
  `No_Cuenta` varchar(20) NOT NULL,
  `Fecha_Reporte` datetime NOT NULL,
  `Estado` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporte_10_2016`
--

CREATE TABLE `reporte_10_2016` (
  `No_Cuenta` varchar(20) NOT NULL,
  `Fecha_Reporte` datetime NOT NULL,
  `Estado` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporte_11_2016`
--

CREATE TABLE `reporte_11_2016` (
  `No_Cuenta` varchar(20) NOT NULL,
  `Fecha_Reporte` datetime NOT NULL,
  `Estado` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporte_12_2016`
--

CREATE TABLE `reporte_12_2016` (
  `No_Cuenta` varchar(20) NOT NULL,
  `Fecha_Reporte` datetime NOT NULL,
  `Estado` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `procesos`
--
ALTER TABLE `procesos`
  ADD PRIMARY KEY (`Cod_Proceso`);

--
-- Indices de la tabla `reporte_01_2016`
--
ALTER TABLE `reporte_01_2016`
  ADD PRIMARY KEY (`No_Cuenta`);

--
-- Indices de la tabla `reporte_02_2016`
--
ALTER TABLE `reporte_02_2016`
  ADD PRIMARY KEY (`No_Cuenta`);

--
-- Indices de la tabla `reporte_03_2016`
--
ALTER TABLE `reporte_03_2016`
  ADD PRIMARY KEY (`No_Cuenta`);

--
-- Indices de la tabla `reporte_04_2016`
--
ALTER TABLE `reporte_04_2016`
  ADD PRIMARY KEY (`No_Cuenta`);

--
-- Indices de la tabla `reporte_05_2016`
--
ALTER TABLE `reporte_05_2016`
  ADD PRIMARY KEY (`No_Cuenta`);

--
-- Indices de la tabla `reporte_06_2016`
--
ALTER TABLE `reporte_06_2016`
  ADD PRIMARY KEY (`No_Cuenta`);

--
-- Indices de la tabla `reporte_07_2016`
--
ALTER TABLE `reporte_07_2016`
  ADD PRIMARY KEY (`No_Cuenta`);

--
-- Indices de la tabla `reporte_08_2016`
--
ALTER TABLE `reporte_08_2016`
  ADD PRIMARY KEY (`No_Cuenta`);

--
-- Indices de la tabla `reporte_09_2016`
--
ALTER TABLE `reporte_09_2016`
  ADD PRIMARY KEY (`No_Cuenta`);

--
-- Indices de la tabla `reporte_10_2016`
--
ALTER TABLE `reporte_10_2016`
  ADD PRIMARY KEY (`No_Cuenta`);

--
-- Indices de la tabla `reporte_11_2016`
--
ALTER TABLE `reporte_11_2016`
  ADD PRIMARY KEY (`No_Cuenta`);

--
-- Indices de la tabla `reporte_12_2016`
--
ALTER TABLE `reporte_12_2016`
  ADD PRIMARY KEY (`No_Cuenta`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
