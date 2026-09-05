CREATE TABLE `cientifico` (
  `id_cientifico` int PRIMARY KEY,
  `nombre_cientifico` varchar(255),
  `fecha_nacimiento` date,
  `area_trabajo` varchar(255),
  `correo_cientifico` varchar(255) UNIQUE
);

CREATE TABLE `proyecto` (
  `id_proyecto` int PRIMARY KEY,
  `nombre_proyecto` varchar(255),
  `presupuesto` decimal,
  `area_proyecto` varchar(255),
  `problema_negocio` varchar(255),
  `num_cientificos` int
);

CREATE TABLE `cientifico_proyecto` (
  `id_cientifico` int,
  `id_proyecto` int,
  `fecha_inicio` date,
  `fecha_fin` date
);

CREATE TABLE `dataset` (
  `id_dataset` int PRIMARY KEY,
  `id_proyecto` int,
  `nombre_dataset` varchar(255),
  `fuente` varchar(255),
  `fecha_carga` date,
  `tamano_filas` int
);

CREATE TABLE `experimento` (
  `id_experimento` int PRIMARY KEY,
  `id_proyecto` int,
  `id_cientifico` int,
  `fecha_ejecucion` date,
  `configuracion` text,
  `resultado_exitoso` bool
);

CREATE TABLE `experimento_dataset` (
  `id_experimento` int,
  `id_dataset` int
);

CREATE TABLE `modelo` (
  `id_modelo` int PRIMARY KEY,
  `id_experimento` int,
  `nombre_modelo` varchar(255),
  `version_modelo` varchar(255),
  `algoritmo` varchar(255)
);

CREATE TABLE `metrica` (
  `id_metrica` int PRIMARY KEY,
  `id_modelo` int,
  `valor` float,
  `precision_modelo` float,
  `fecha_metrica` date
);

ALTER TABLE `cientifico_proyecto` ADD FOREIGN KEY (`id_cientifico`) REFERENCES `cientifico` (`id_cientifico`);

ALTER TABLE `cientifico_proyecto` ADD FOREIGN KEY (`id_proyecto`) REFERENCES `proyecto` (`id_proyecto`);

ALTER TABLE `dataset` ADD FOREIGN KEY (`id_proyecto`) REFERENCES `proyecto` (`id_proyecto`);

ALTER TABLE `experimento` ADD FOREIGN KEY (`id_proyecto`) REFERENCES `proyecto` (`id_proyecto`);

ALTER TABLE `experimento` ADD FOREIGN KEY (`id_cientifico`) REFERENCES `cientifico` (`id_cientifico`);

ALTER TABLE `experimento_dataset` ADD FOREIGN KEY (`id_experimento`) REFERENCES `experimento` (`id_experimento`);

ALTER TABLE `experimento_dataset` ADD FOREIGN KEY (`id_dataset`) REFERENCES `dataset` (`id_dataset`);

ALTER TABLE `modelo` ADD FOREIGN KEY (`id_experimento`) REFERENCES `experimento` (`id_experimento`);

ALTER TABLE `metrica` ADD FOREIGN KEY (`id_modelo`) REFERENCES `modelo` (`id_modelo`);
