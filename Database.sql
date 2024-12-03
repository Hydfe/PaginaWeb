CREATE TABLE `DOCENTE` (
  `dni` VARCHAR(20) PRIMARY KEY,
  `nombre` VARCHAR(100),
  `direccion` VARCHAR(255)
);

CREATE TABLE `DOCENTE_TELEFONO` (
  `docenteDni` INT PRIMARY KEY,
  `telefono` VARCHAR(15)
);

CREATE TABLE `MODULO` (
  `codigo` VARCHAR(20),
  `docenteDni` varchar(20),
  `nombre` VARCHAR(100),
  PRIMARY KEY (`codigo`, `docenteDni`)
);

CREATE TABLE `ESTUDIANTE` (
  `codigoMatricula` INT PRIMARY KEY,
  `nombres` VARCHAR(100),
  `apellidoPat` VARCHAR(100),
  `apellidoMat` VARCHAR(100),
  `fechaNacimiento` DATE
);

CREATE TABLE `ESTUDIANTE_TELEFONO` (
  `estudianteCodigoMatricula` INT PRIMARY KEY,
  `telefono` VARCHAR(15)
);

CREATE TABLE `ESTUDIANTE_MODULO` (
  `estudianteCodigoMatricula` INT,
  `moduloCodigo` VARCHAR(20),
  PRIMARY KEY (`estudianteCodigoMatricula`, `moduloCodigo`)
);

CREATE TABLE `ESTUDIANTE_DELEGADO` (
  `codigoModulo` VARCHAR(20),
  `estudianteCodigoMatricula` INT,
  PRIMARY KEY (`codigoModulo`, `estudianteCodigoMatricula`)
);

ALTER TABLE `ESTUDIANTE_MODULO` ADD FOREIGN KEY (`estudianteCodigoMatricula`) REFERENCES `ESTUDIANTE` (`codigoMatricula`);

ALTER TABLE `ESTUDIANTE_MODULO` ADD FOREIGN KEY (`moduloCodigo`) REFERENCES `MODULO` (`codigo`);

ALTER TABLE `ESTUDIANTE_DELEGADO` ADD FOREIGN KEY (`estudianteCodigoMatricula`) REFERENCES `ESTUDIANTE` (`codigoMatricula`);

ALTER TABLE `ESTUDIANTE_TELEFONO` ADD FOREIGN KEY (`estudianteCodigoMatricula`) REFERENCES `ESTUDIANTE` (`codigoMatricula`);

ALTER TABLE `DOCENTE_TELEFONO` ADD FOREIGN KEY (`docenteDni`) REFERENCES `DOCENTE` (`dni`);

ALTER TABLE `MODULO` ADD FOREIGN KEY (`docenteDni`) REFERENCES `DOCENTE` (`dni`);

ALTER TABLE `ESTUDIANTE_DELEGADO` ADD FOREIGN KEY (`codigoModulo`) REFERENCES `MODULO` (`codigo`);
