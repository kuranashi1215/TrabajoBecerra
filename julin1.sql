-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-06-2022 a las 23:53:13
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `julin1`
--

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `spConsultAprendiz`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultAprendiz` (IN `_codigo` INT(3))  BEGIN

SELECT codigo,nombre,fechaNacimiento,sexo,ciudad FROM `aprendiz` WHERE codigo = _codigo;

END$$

DROP PROCEDURE IF EXISTS `spConsultMatricula`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultMatricula` (IN `_codigoMatricula` INT(3))  BEGIN

SELECT codigoMatricula,fechaMatricula,nombreCentro,costo,estado,codigoPrograma,codigoAprendiz
FROM `matricula` WHERE codigoMatricula = _codigoMatricula;
END$$

DROP PROCEDURE IF EXISTS `spConsultUser`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultUser` (IN `_code` INT(5))  BEGIN

SELECT code,name,lastName,password FROM `user` WHERE code = _code;


END$$

DROP PROCEDURE IF EXISTS `spDeleteAprendiz`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spDeleteAprendiz` (IN `_codigo` INT(3))  NO SQL
BEGIN

DELETE FROM `aprendiz` WHERE codigo = _codigo;

END$$

DROP PROCEDURE IF EXISTS `spDeleteMatricula`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spDeleteMatricula` (IN `_code` INT(3))  BEGIN

DELETE FROM `matricula` WHERE codigoMatricula = _code;

END$$

DROP PROCEDURE IF EXISTS `spDeleteUser`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spDeleteUser` (IN `_code` INT(5))  BEGIN

DELETE FROM `user` WHERE CODE = _code;

END$$

DROP PROCEDURE IF EXISTS `spInsertAprendiz`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsertAprendiz` (IN `_name` VARCHAR(50), IN `_fechaNacimiento` DATE, IN `_sexo` VARCHAR(50), IN `_ciudad` VARCHAR(50))  BEGIN

INSERT INTO aprendiz(NOMBRE, FECHANACIMIENTO, SEXO, CIUDAD) VALUES (_name, _fechaNacimiento, _sexo, _ciudad);

END$$

DROP PROCEDURE IF EXISTS `spInsertMatricula`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsertMatricula` (IN `_fechaMatricula` DATE, IN `_nombreCentro` VARCHAR(150), IN `_costo` VARCHAR(50), IN `_estado` VARCHAR(50), IN `_codigoPrograma` INT(3), IN `_codigoAprendiz` INT(3))  BEGIN

INSERT INTO matricula(fechaMatricula, nombreCentro, costo, estado, codigoPrograma, codigoAprendiz) VALUES(_fechaMatricula, _nombreCentro, _costo, _estado, _codigoPrograma, _codigoAprendiz);

END$$

DROP PROCEDURE IF EXISTS `spInsertUser`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsertUser` (IN `_name` VARCHAR(25), IN `_lastName` VARCHAR(25), IN `_user` VARCHAR(25), IN `_password` VARCHAR(25))  BEGIN

INSERT INTO user(NAME, LASTNAME, USERP, PASSWORD) VALUES (_name, _lastName, _user, _password);

END$$

DROP PROCEDURE IF EXISTS `spSearchAllAprendiz`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spSearchAllAprendiz` ()  NO SQL
BEGIN

SELECT codigo , nombre, fechaNacimiento, sexo, ciudad FROM aprendiz;

END$$

DROP PROCEDURE IF EXISTS `spSearchAllMatricula`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spSearchAllMatricula` ()  BEGIN

SELECT codigoMatricula, fechaMatricula, nombreCentro, costo, estado, codigoPrograma, codigoAprendiz FROM matricula;

END$$

DROP PROCEDURE IF EXISTS `spSearchAllUser`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spSearchAllUser` ()  BEGIN

SELECT CODE, NAME, LASTNAME, USERP, PASSWORD FROM user;

END$$

DROP PROCEDURE IF EXISTS `spUpdateAprendiz`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spUpdateAprendiz` (IN `_codigo` INT(3), IN `_name` VARCHAR(50), IN `_fechaNacimiento` DATE, IN `_sexo` VARCHAR(50), IN `_ciudad` VARCHAR(50))  NO SQL
BEGIN

UPDATE aprendiz SET nombre = _name,
fechaNacimiento = _fechaNacimiento,
sexo = _sexo,
ciudad = _ciudad
WHERE codigo  =  _codigo;	

END$$

DROP PROCEDURE IF EXISTS `spUpdateMatricula`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spUpdateMatricula` (IN `_codigoMatricula` INT(3), IN `_fechaMatricula` DATE, IN `_nombreCentro` VARCHAR(150), IN `_costo` VARCHAR(50), IN `_estado` VARCHAR(50), IN `_codigoPrograma` INT(3), IN `_codigoAprendiz` INT(3))  BEGIN

UPDATE matricula SET fechaMatricula = _fechaMatricula,
nombreCentro = _nombreCentro,
costo = _costo,
estado = _estado,
codigoPrograma = _codigoPrograma,
codigoAprendiz = _codigoAprendiz
WHERE codigoMatricula = _codigoMatricula ;	

END$$

DROP PROCEDURE IF EXISTS `spUpdateUser`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spUpdateUser` (IN `_code` INT(5), IN `_name` VARCHAR(25), IN `_lastName` VARCHAR(25), IN `_userp` VARCHAR(25), IN `_password` VARCHAR(25))  BEGIN

UPDATE user SET NAME = _name,
LASTNAME = _lastName,
USERP = _userp,
PASSWORD = _password
WHERE CODE = _code ;	

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aprendiz`
--

DROP TABLE IF EXISTS `aprendiz`;
CREATE TABLE `aprendiz` (
  `codigo` int(3) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `sexo` varchar(50) NOT NULL,
  `ciudad` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `aprendiz`
--

INSERT INTO `aprendiz` (`codigo`, `nombre`, `fechaNacimiento`, `sexo`, `ciudad`) VALUES
(7, '11', '0021-03-31', '2', '123123'),
(8, '3132123132', '0000-00-00', '3', '1312313'),
(9, 'hola', '1111-11-11', '1', '11111');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `matricula`
--

DROP TABLE IF EXISTS `matricula`;
CREATE TABLE `matricula` (
  `codigoMatricula` int(3) NOT NULL,
  `fechaMatricula` date NOT NULL,
  `nombreCentro` varchar(150) NOT NULL,
  `costo` varchar(50) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `codigoPrograma` int(3) NOT NULL,
  `codigoAprendiz` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `matricula`
--

INSERT INTO `matricula` (`codigoMatricula`, `fechaMatricula`, `nombreCentro`, `costo`, `estado`, `codigoPrograma`, `codigoAprendiz`) VALUES
(3, '0012-12-12', '12', '12', '1', 12, 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `code` int(5) NOT NULL,
  `name` varchar(25) NOT NULL,
  `lastName` varchar(25) NOT NULL,
  `userP` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`code`, `name`, `lastName`, `userP`, `password`) VALUES
(66, 'miguel', 'castilla', 'miguel1', '1234'),
(68, 'buenos', 'dias', 'o', 'la'),
(69, 'carlls', 'mairoc', 'oa ', 'buenosas');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aprendiz`
--
ALTER TABLE `aprendiz`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `matricula`
--
ALTER TABLE `matricula`
  ADD PRIMARY KEY (`codigoMatricula`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`code`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `aprendiz`
--
ALTER TABLE `aprendiz`
  MODIFY `codigo` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `matricula`
--
ALTER TABLE `matricula`
  MODIFY `codigoMatricula` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `code` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
