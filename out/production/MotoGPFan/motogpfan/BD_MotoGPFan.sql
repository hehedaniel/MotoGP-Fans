CREATE SCHEMA IF NOT EXISTS `MotoGPFan`;
USE `MotoGPFan`;

CREATE TABLE IF NOT EXISTS `MotoGPFan`.`Equipo` (
                                                    `idEquipo` INT NOT NULL AUTO_INCREMENT,
                                                    `nombre` VARCHAR(100) NOT NULL,
    `descripcion` VARCHAR(100) NOT NULL,
    PRIMARY KEY (`idEquipo`),
    UNIQUE INDEX `idMotos_UNIQUE` (`idEquipo` ASC) VISIBLE
    ) ENGINE = InnoDB;
CREATE TABLE IF NOT EXISTS `MotoGPFan`.`Piloto` (
                                                    `idPiloto` INT NOT NULL AUTO_INCREMENT,
                                                    `foto` LONGTEXT NOT NULL,
                                                    `nombre` VARCHAR(100) NOT NULL,
    `apellido` VARCHAR(100) NOT NULL,
    `peso` DOUBLE NOT NULL,
    `altura` INT NOT NULL,
    `pais` LONGTEXT NOT NULL,
    `idEquipo` INT NOT NULL,
    PRIMARY KEY (`idPiloto`, `idEquipo`),
    UNIQUE INDEX `idPiloto_UNIQUE` (`idPiloto` ASC) VISIBLE,
    INDEX `fk_Piloto_Equipo1_idx` (`idEquipo` ASC) VISIBLE,
    CONSTRAINT `fk_Piloto_Equipo1` FOREIGN KEY (`idEquipo`) REFERENCES `MotoGPFan`.`Equipo` (`idEquipo`) ON DELETE NO ACTION ON UPDATE NO ACTION
    ) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `MotoGPFan`.`Patrocinador` (
                                                          `idPatrocinador` INT NOT NULL AUTO_INCREMENT,
                                                          `nombre` VARCHAR(100) NOT NULL,
    `descripcion` LONGTEXT NOT NULL,
    PRIMARY KEY (`idPatrocinador`),
    UNIQUE INDEX `idPatrocinador_UNIQUE` (`idPatrocinador` ASC) VISIBLE
    ) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `MotoGPFan`.`Piloto_has_Patrocinador` (
                                                                     `idPiloto` INT NOT NULL,
                                                                     `idPatrocinador` INT NOT NULL,
                                                                     `fecha_inicio` DATE NOT NULL,
                                                                     `fecha_fin` DATE NOT NULL,
                                                                     PRIMARY KEY (`idPiloto`, `idPatrocinador`),
    INDEX `fk_Piloto_has_Patrocinador_Patrocinador1_idx` (`idPatrocinador` ASC) VISIBLE,
    INDEX `fk_Piloto_has_Patrocinador_Piloto_idx` (`idPiloto` ASC) VISIBLE,
    CONSTRAINT `fk_Piloto_has_Patrocinador_Piloto` FOREIGN KEY (`idPiloto`) REFERENCES `MotoGPFan`.`Piloto` (`idPiloto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `fk_Piloto_has_Patrocinador_Patrocinador1` FOREIGN KEY (`idPatrocinador`) REFERENCES `MotoGPFan`.`Patrocinador` (`idPatrocinador`) ON DELETE NO ACTION ON UPDATE NO ACTION
    ) ENGINE = InnoDB;
-- Logo

INSERT INTO Patrocinador (idPatrocinador, nombre, descripcion)
VALUES (
           1,
           'Repsol',
           'Compañía española líder en el sector de energía y lubricantes'
       ),
       (
           2,
           'Red Bull',
           'Marca austriaca de bebidas energéticas y patrocinador de deportes extremos'
       ),
       (
           3,
           'Monster Energy',
           'Marca de bebidas energéticas conocida por su apoyo a deportes extremos'
       ),
       (
           4,
           'Lenovo',
           'Empresa tecnológica líder en computadoras y patrocinadora de Ducati'
       ),
       (
           5,
           'Prima',
           'Patrocinador principal de Pramac Racing en MotoGP'
       ),
       (
           6,
           'Pertamina',
           'Empresa indonesia de energía y lubricantes'
       ),
       (
           7,
           'Michelin',
           'Fabricante oficial de neumáticos para MotoGP'
       ),
       (
           8,
           'Petronas',
           'Compañía petrolera malaya con presencia en deportes de motor'
       ),
       (
           9,
           'Alpinestars',
           'Fabricante de ropa y accesorios de motociclismo'
       ),
       (
           10,
           'Dainese',
           'Empresa italiana especializada en equipamiento de seguridad para motociclistas'
       );
-- Logo
INSERT INTO Equipo (idEquipo, nombre, descripcion)
VALUES (
           1,
           'LCR Honda',
           'Equipo oficial respaldado por Honda en MotoGP'
       ),
       (
           2,
           'Repsol Honda',
           'Equipo principal de Honda con patrocinio de Repsol'
       ),
       (
           3,
           'Red Bull KTM Factory Racing',
           'Equipo de KTM con patrocinio de Red Bull'
       ),
       (
           4,
           'Monster Energy Yamaha',
           'Equipo oficial de Yamaha patrocinado por Monster Energy'
       ),
       (
           5,
           'Pertamina Enduro VR46',
           'Equipo vinculado a Valentino Rossi y Pertamina Enduro'
       ),
       (
           6,
           'Trackhouse Racing',
           'Equipo joven debutante en MotoGP'
       ),
       (
           7,
           'Prima Pramac Racing',
           'Equipo satélite de Ducati respaldado por Prima Pramac'
       ),
       (
           8,
           'Gresini Racing',
           'Equipo histórico independiente en MotoGP'
       ),
       (
           9,
           'Ducati Lenovo',
           'Equipo principal de Ducati con Lenovo como patrocinador'
       ),
       (
           10,
           'Aprilia Racing',
           'Equipo oficial de Aprilia en MotoGP'
       ),
       (
           11,
           'Red Bull KTM Tech3',
           'Equipo de KTM con patrocinio de Red Bull'
       );
INSERT INTO Piloto (
    idPiloto,
    nombre,
    apellido,
    pais,
    idEquipo,
    altura,
    peso,
    foto
)
VALUES (
           5,
           'Johann',
           'Zarco',
           'https://upload.wikimedia.org/wikipedia/commons/thumb/6/62/Flag_of_France.png/1280px-Flag_of_France.png',
           1,
           171,
           66,
           'https://resources.motogp.pulselive.com/photo-resources/2024/02/19/804f0106-d53b-4052-bbd4-23e41f093ae6/rider-bio_johannzarco.png?height=377&width=227'
       ),
       (
           10,
           'Luca',
           'Marini',
           'https://img.freepik.com/vector-gratis/ilustracion-bandera-italia_53876-27098.jpg',
           2,
           184,
           69,
           'https://resources.motogp.pulselive.com/photo-resources/2024/02/19/3a49cbe4-f2a9-4eb5-8e75-08b5387e6dea/rider-bio_lucamarini.png?height=377&width=227'
       ),
       (
           12,
           'Maverick',
           'Viñales',
           'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Bandera_de_España_%28nuevo_diseño%29.svg/640px-Bandera_de_España_%28nuevo_diseño%29.svg.png',
           11,
           171,
           64,
           'https://resources.motogp.pulselive.com/photo-resources/2024/11/19/a7cfa270-f62a-49e9-b93b-f5c0cfa4a154/12_Maverick_Vinales.png?height=377&width=227'
       ),
       (
           20,
           'Fabio',
           'Quartararo',
           'https://upload.wikimedia.org/wikipedia/commons/thumb/6/62/Flag_of_France.png/1280px-Flag_of_France.png',
           4,
           177,
           69,
           'https://resources.motogp.pulselive.com/photo-resources/2024/02/19/80de8d72-d1b8-4b41-90b0-928467018ced/rider-bio_fabioquartararo.png?height=377&width=227'
       ),
       (
           21,
           'Franco',
           'Morbidelli',
           'https://img.freepik.com/vector-gratis/ilustracion-bandera-italia_53876-27098.jpg',
           5,
           176,
           68,
           'https://resources.motogp.pulselive.com/photo-resources/2024/11/19/49428293-9d8b-4230-98a3-c1b78737bcdd/21-Franco-Morbidelli.png?height=377&width=227'
       ),
       (
           23,
           'Enea',
           'Bastianini',
           'https://img.freepik.com/vector-gratis/ilustracion-bandera-italia_53876-27098.jpg',
           11,
           168,
           64,
           'https://resources.motogp.pulselive.com/photo-resources/2024/11/19/ab7f94d4-f82d-434f-8ecf-5c22953a4e00/23-Enea-Bastianini.png?height=377&width=227'
       ),
       (
           25,
           'Raul',
           'Fernandez',
           'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Bandera_de_España_%28nuevo_diseño%29.svg/640px-Bandera_de_España_%28nuevo_diseño%29.svg.png',
           6,
           178,
           65,
           'https://resources.motogp.pulselive.com/photo-resources/2024/08/02/e1d21120-21e6-43c8-83f0-2707634800a7/25-Raul-Fernandez-MotoGPrider.png?height=377&width=227'
       ),
       (
           33,
           'Brad',
           'Binder',
           'https://upload.wikimedia.org/wikipedia/commons/thumb/a/af/Flag_of_South_Africa.svg/2560px-Flag_of_South_Africa.svg.png',
           3,
           170,
           63,
           'https://resources.motogp.pulselive.com/photo-resources/2024/02/19/664d8e67-65b0-4196-9cc0-47fb5f64efa3/rider-bio_bradbinder.png?height=377&width=227'
       ),
       (
           35,
           'Somkiat',
           'Chantra',
           'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Flag_of_Thailand.svg/2560px-Flag_of_Thailand.svg.png',
           1,
           172,
           63,
           'https://resources.motogp.pulselive.com/photo-resources/2024/11/19/3a67fbfa-67c0-4b6a-8aa0-5166fb33a5ec/35-Somkiat-Chantra.png?height=377&width=227'
       ),
       (
           36,
           'Joan',
           'Mir',
           'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Bandera_de_España_%28nuevo_diseño%29.svg/640px-Bandera_de_España_%28nuevo_diseño%29.svg.png',
           2,
           181,
           69,
           'https://resources.motogp.pulselive.com/photo-resources/2024/02/19/c745a780-c0bc-46a0-9d6e-81a45ca2fde4/rider-bio_joanmir.png?height=377&width=227'
       ),
       (
           37,
           'Pedro',
           'Acosta',
           'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Bandera_de_España_%28nuevo_diseño%29.svg/640px-Bandera_de_España_%28nuevo_diseño%29.svg.png',
           3,
           171,
           63,
           'https://resources.motogp.pulselive.com/photo-resources/2024/11/19/aced6ac0-55e3-42d3-ad77-1ff6259cb0cf/31-Pedro-Acosta.png?height=377&width=227'
       ),
       (
           42,
           'Alex',
           'Rins',
           'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Bandera_de_España_%28nuevo_diseño%29.svg/640px-Bandera_de_España_%28nuevo_diseño%29.svg.png',
           4,
           176,
           68,
           'https://resources.motogp.pulselive.com/photo-resources/2024/02/20/1d8c150c-b9dc-4db7-b70e-37b0f28949bd/rider-bio_alexrins.png?height=377&width=227'
       ),
       (
           43,
           'Jack',
           'Miller',
           'https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Flag_of_Australia_%28converted%29.svg/1280px-Flag_of_Australia_%28converted%29.svg.png',
           7,
           173,
           64,
           'https://resources.motogp.pulselive.com/photo-resources/2024/11/21/055a5335-ce43-4637-84a1-f605500f1e0c/43-Jack-Miller.png?height=377&width=227'
       ),
       (
           49,
           'Fabio',
           'Di Giannantonio',
           'https://img.freepik.com/vector-gratis/ilustracion-bandera-italia_53876-27098.jpg',
           5,
           177,
           62,
           'https://resources.motogp.pulselive.com/photo-resources/2024/02/19/4088be73-b443-4648-b1e9-cf184b3bc7a3/rider-bio_fabiodigiannantonio.png?height=377&width=227'
       ),
       (
           54,
           'Fermín',
           'Aldeguer',
           'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Bandera_de_España_%28nuevo_diseño%29.svg/640px-Bandera_de_España_%28nuevo_diseño%29.svg.png',
           8,
           181,
           69,
           'https://resources.motogp.pulselive.com/photo-resources/2024/11/21/abc5cf44-3b50-486f-86dd-05ec3c2e22e3/54-Fermin-Aldeguer.png?height=377&width=227'
       ),
       (
           63,
           'Francesco',
           'Bagnaia',
           'https://img.freepik.com/vector-gratis/ilustracion-bandera-italia_53876-27098.jpg',
           9,
           176,
           64,
           'https://resources.motogp.pulselive.com/photo-resources/2024/02/19/3a568eee-1e12-4091-b120-f53c71cbe8f6/rider-bio_francescobagnaia.png?height=377&width=227'
       ),
       (
           72,
           'Marco',
           'Bezzecchi',
           'https://img.freepik.com/vector-gratis/ilustracion-bandera-italia_53876-27098.jpg',
           10,
           176,
           64,
           'https://resources.motogp.pulselive.com/photo-resources/2024/11/19/be661691-558f-41d7-9196-815d473181e2/72-Marco-Bezzecchi.png?height=377&width=227'
       ),
       (
           73,
           'Alex',
           'Márquez',
           'https://img.freepik.com/vector-gratis/ilustracion-bandera-italia_53876-27098.jpg',
           8,
           180,
           65,
           'https://resources.motogp.pulselive.com/photo-resources/2024/02/19/2c1e0ebb-a3b6-4add-9378-8d5797e593c8/rider-bio_alexmarquez.png?height=377&width=227'
       ),
       (
           79,
           'Ai',
           'Ogura',
           'https://img.freepik.com/vector-gratis/ilustracion-bandera-japon_53876-27128.jpg',
           6,
           169,
           60,
           'https://resources.motogp.pulselive.com/photo-resources/2024/11/19/ec63c848-e77a-4aac-9fc3-0a43c0fad5e1/79-Ai-Ogura.png?height=377&width=227'
       ),
       (
           88,
           'Miguel',
           'Oliveira',
           'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Flag_of_Portugal.svg/1280px-Flag_of_Portugal.svg.png',
           7,
           170,
           64,
           'https://resources.motogp.pulselive.com/photo-resources/2024/08/02/667c8748-1e0e-492f-a659-ac404321141d/88-Miguel-Oliveira-MotoGP_rider.png?height=377&width=227'
       ),
       (
           1,
           'Jorge',
           'Martín',
           'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Bandera_de_España_%28nuevo_diseño%29.svg/640px-Bandera_de_España_%28nuevo_diseño%29.svg.png',
           10,
           168,
           63,
           'https://resources.motogp.pulselive.com/photo-resources/2024/11/19/24001b82-1348-4f36-adc4-4701d07ea673/89-Jorge-Martin.png?height=377&width=227'
       ),
       (
           93,
           'Marc',
           'Márquez',
           'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Bandera_de_España_%28nuevo_diseño%29.svg/640px-Bandera_de_España_%28nuevo_diseño%29.svg.png',
           9,
           169,
           64,
           'https://resources.motogp.pulselive.com/photo-resources/2024/11/19/a4f43356-42bc-4c85-a659-682d9c68cfc6/93-Marc-Marquez.png?height=377&width=227'
       );
-- SI
INSERT INTO Piloto_has_Patrocinador (
    idPiloto,
    idPatrocinador,
    fecha_inicio,
    fecha_fin
)
VALUES (5, 1, '2022-01-01', '2024-12-31'),
       -- Johann Zarco -> Repsol
       (10, 2, '2022-03-01', '2024-12-31'),
       -- Luca Marini -> Red Bull
       (12, 2, '2022-03-01', '2024-12-31'),
       -- Maverick Viñales -> Red Bull
       (20, 3, '2022-02-01', '2024-12-31'),
       -- Fabio Quartararo -> Monster Energy
       (21, 6, '2022-05-01', '2024-12-31'),
       -- Franco Morbidelli -> Pertamina
       (23, 2, '2022-06-01', '2024-12-31'),
       -- Enea Bastianini -> Red Bull
       (25, 7, '2022-03-01', '2024-12-31'),
       -- Raul Fernandez -> Michelin
       (33, 2, '2022-01-01', '2024-12-31'),
       -- Brad Binder -> Red Bull
       (35, 7, '2022-03-01', '2024-12-31'),
       -- Somkiat Chantra -> Michelin
       (36, 1, '2022-01-01', '2024-12-31'),
       -- Joan Mir -> Repsol
       (37, 2, '2022-01-01', '2024-12-31'),
       -- Pedro Acosta -> Red Bull
       (42, 3, '2022-01-01', '2024-12-31'),
       -- Alex Rins -> Monster Energy
       (43, 5, '2022-03-01', '2024-12-31'),
       -- Jack Miller -> Prima
       (49, 6, '2022-05-01', '2024-12-31'),
       -- Fabio Di Giannantonio -> Pertamina
       (54, 8, '2022-03-01', '2024-12-31'),
       -- Fermín Aldeguer -> Petronas
       (63, 4, '2022-01-01', '2024-12-31'),
       -- Francesco Bagnaia -> Lenovo
       (72, 10, '2022-01-01', '2024-12-31'),
       -- Marco Bezzecchi -> Dainese
       (73, 8, '2022-01-01', '2024-12-31'),
       -- Alex Márquez -> Petronas
       (79, 9, '2022-03-01', '2024-12-31'),
       -- Ai Ogura -> Alpinestars
       (88, 5, '2022-01-01', '2024-12-31'),
       -- Miguel Oliveira -> Prima
       (1, 10, '2022-01-01', '2024-12-31'),
       -- Jorge Martín -> Dainese
       (93, 4, '2022-01-01', '2024-12-31');
-- Marc Márquez -> Lenovo


UPDATE Equipo SET descripcion = 'LCR Honda es un equipo oficial de MotoGP respaldado por el gigante japonés Honda. Fundado en 2006 por el ex piloto Lucio Cecchinello, el equipo ha sido un competidor constante en la categoría, contando con la participación de destacados pilotos como Cal Crutchlow y Takaaki Nakagami. Su relación con Honda ha sido clave para el desarrollo y desempeño de la moto, convirtiéndolo en uno de los equipos más respetados en la parrilla de MotoGP.' WHERE idEquipo = 1;

UPDATE Equipo SET descripcion = 'Repsol Honda es el equipo oficial más importante de Honda en MotoGP, conocido por su asociación con el gigante energético Repsol. Desde su creación en 1995, ha sido un equipo dominante, con leyendas del motociclismo como Mick Doohan, Valentino Rossi, y más recientemente, Marc Márquez. Con múltiples campeonatos mundiales en su haber, el equipo se caracteriza por su competitividad y su vínculo con la marca japonesa, siendo uno de los equipos más exitosos en la historia de MotoGP.' WHERE idEquipo = 2;

UPDATE Equipo SET descripcion = 'Red Bull KTM Factory Racing es el equipo oficial de KTM en MotoGP, respaldado por el patrocinio de Red Bull. Fundado en 2017, el equipo rápidamente se ha establecido como un competidor fuerte, con pilotos como Brad Binder y Miguel Oliveira. La moto de KTM se caracteriza por su agilidad y rendimiento en diversas condiciones, lo que le ha permitido obtener victorias y podios en las temporadas recientes. El apoyo de Red Bull aporta una gran visibilidad y recursos para su desarrollo.' WHERE idEquipo = 3;

UPDATE Equipo SET descripcion = 'Monster Energy Yamaha es el equipo oficial de Yamaha en MotoGP, patrocinado por Monster Energy. Con una rica historia en el motociclismo, el equipo ha tenido éxito en múltiples campeonatos mundiales, con figuras icónicas como Valentino Rossi y Jorge Lorenzo. Actualmente, se enfoca en el desarrollo de la M1, la moto que lleva a sus pilotos, entre ellos Maverick Viñales y Fabio Quartararo, a luchar por el título de campeones. El apoyo de Monster Energy refuerza la imagen dinámica y competitiva del equipo.' WHERE idEquipo = 4;

UPDATE Equipo SET descripcion = 'Pertamina Enduro VR46 es un equipo en MotoGP estrechamente vinculado a la leyenda Valentino Rossi, quien fundó la Academia VR46. Con el patrocinio de Pertamina, el equipo se ha centrado en el desarrollo de pilotos jóvenes y prometedores. A lo largo de los años, ha sido un equipo satélite de Yamaha, y su misión es formar nuevos talentos para llevarlos al nivel más alto del motociclismo. El equipo combina la experiencia de Rossi con la energía de los jóvenes pilotos para obtener buenos resultados.' WHERE idEquipo = 5;

UPDATE Equipo SET descripcion = 'Trackhouse Racing es un equipo relativamente nuevo en MotoGP, debutando con una estructura que busca dejar una huella en la competición. A pesar de su corta existencia, ha logrado destacarse por su ambición y enfoque en el desarrollo de motocicletas y pilotos de calidad. Con el respaldo de patrocinadores clave, el equipo se ha convertido en una plataforma de lanzamiento para pilotos jóvenes con aspiraciones de competir al más alto nivel del motociclismo, buscando siempre mejorar cada temporada.' WHERE idEquipo = 6;

UPDATE Equipo SET descripcion = 'Prima Pramac Racing es un equipo satélite de Ducati en MotoGP, respaldado por el patrocinador Prima. El equipo ha sido crucial en el desarrollo de las motos Ducati, proporcionando una plataforma para que los pilotos puedan ganar experiencia antes de unirse al equipo principal. Con pilotos como Jack Miller y Johann Zarco, el equipo ha mostrado un rendimiento impresionante en las últimas temporadas, destacándose en la parrilla de MotoGP por su competitividad y su conexión con Ducati.' WHERE idEquipo = 7;

UPDATE Equipo SET descripcion = 'Gresini Racing es un equipo histórico e independiente en MotoGP, fundado por Fausto Gresini, quien fue piloto y posteriormente se convirtió en uno de los gestores más exitosos en la historia de la competición. A lo largo de los años, el equipo ha tenido diversas asociaciones con fabricantes como Honda y Aprilia. Gresini Racing ha sido reconocido por su capacidad para desarrollar motocicletas competitivas y su capacidad para ofrecer una plataforma para pilotos de talento, logrando varias victorias y podios en su carrera.' WHERE idEquipo = 8;

UPDATE Equipo SET descripcion = 'Ducati Lenovo Team es el equipo oficial de Ducati en MotoGP, patrocinado por Lenovo. Desde su regreso al más alto nivel de la competición en 2003, Ducati ha sido uno de los equipos más consistentes, con varias victorias en grandes premios y un enfoque implacable en la innovación tecnológica. Bajo el patrocinio de Lenovo, el equipo ha aprovechado los recursos tecnológicos para mejorar el rendimiento de sus motos, contando con pilotos de renombre como Francesco Bagnaia y Enea Bastianini, que continúan impulsando el equipo hacia el éxito.' WHERE idEquipo = 9;

UPDATE Equipo SET descripcion = 'Aprilia Racing es el equipo oficial de Aprilia en MotoGP, con una historia de innovación y determinación. Después de varios años luchando por mejorar su rendimiento, Aprilia ha encontrado un camino hacia el éxito bajo la dirección de su equipo oficial. La RS-GP, su moto en MotoGP, ha mostrado un rendimiento competitivo, especialmente en las últimas temporadas. Con pilotos como Aleix Espargaró y Maverick Viñales, el equipo busca consolidarse entre los mejores de la parrilla, con el respaldo de una de las marcas más innovadoras del motociclismo.' WHERE idEquipo = 10;

UPDATE Equipo SET descripcion = 'Red Bull KTM Tech3 es el equipo satélite de KTM en MotoGP, con el respaldo de Red Bull. Fundado en 2001, Tech3 ha sido conocido por su capacidad para desarrollar pilotos jóvenes y ofrecerles la oportunidad de competir al más alto nivel. Bajo el patrocinio de Red Bull, el equipo ha alcanzado nuevos horizontes, mejorando año tras año su rendimiento en la pista. Con pilotos como Augusto Fernández y otros jóvenes talentos, Tech3 continúa su misión de representar a KTM con orgullo y determinación en la parrilla de MotoGP.' WHERE idEquipo = 11;


UPDATE Patrocinador SET descripcion = 'Repsol es una multinacional española de energía, conocida principalmente por su actividad en el sector de los hidrocarburos y la electricidad. A lo largo de los años, ha sido un patrocinador clave en el mundo del deporte, especialmente en MotoGP, donde su asociación con Honda ha sido una de las más emblemáticas. Además de su presencia en las motos, Repsol está involucrada en múltiples iniciativas de sostenibilidad y energías renovables, lo que la convierte en un referente global en el sector energético.' WHERE idPatrocinador = 1;

UPDATE Patrocinador SET descripcion = 'Red Bull es una marca austriaca de bebidas energéticas que se ha destacado por su involucramiento en el patrocinio de deportes extremos y la aventura. A través de su marca, Red Bull se asocia con una amplia variedad de disciplinas deportivas, incluyendo MotoGP, Fórmula 1, motocross, y deportes de nieve, apoyando a atletas de élite y equipos como el Red Bull KTM Factory Racing en MotoGP. Su presencia en el deporte está ligada a la innovación, el rendimiento extremo y la pasión por el desafío.' WHERE idPatrocinador = 2;

UPDATE Patrocinador SET descripcion = 'Monster Energy es una de las marcas más reconocidas en el sector de las bebidas energéticas, especialmente en el ámbito de los deportes extremos. Con su característico logo verde y negro, Monster ha patrocinado a una gran cantidad de atletas y eventos de motocross, rally y MotoGP, convirtiéndose en un nombre sinónimo de adrenalina y energía. La marca está comprometida con el apoyo a los deportes de acción y su influencia en la cultura juvenil alrededor del mundo.' WHERE idPatrocinador = 3;

UPDATE Patrocinador SET descripcion = 'Lenovo es una empresa global de tecnología con sede en China, especializada en la fabricación de computadoras personales, servidores, y dispositivos inteligentes. Como patrocinador de Ducati en MotoGP, Lenovo aporta su experiencia en tecnología de vanguardia, ayudando a mejorar el rendimiento y la conectividad en las motos. La colaboración entre Lenovo y Ducati representa la integración de la innovación tecnológica y el deporte de élite, con Lenovo brindando soluciones que permiten a los equipos y pilotos mantenerse al frente de la competencia.' WHERE idPatrocinador = 4;

UPDATE Patrocinador SET descripcion = 'Prima es una empresa patrocinadora clave del equipo Pramac Racing en MotoGP. A través de su apoyo al equipo, Prima se ha asociado con Ducati, lo que les ha permitido estar presentes en el mundo de las competiciones de motociclismo de más alto nivel. La relación con Pramac Racing es un ejemplo de cómo las marcas emergentes pueden aprovechar el poder del deporte para aumentar su visibilidad global y asociarse con un equipo que ha demostrado su capacidad para desafiar a los grandes de MotoGP.' WHERE idPatrocinador = 5;

UPDATE Patrocinador SET descripcion = 'Pertamina es una empresa estatal indonesia que se dedica a la extracción y distribución de energía, especialmente en el sector del petróleo y gas. Con una presencia destacada en el ámbito de los deportes de motor, Pertamina es conocida por su patrocinio en MotoGP, donde apoya a equipos como el Pertamina Enduro VR46. La empresa también juega un papel importante en la innovación tecnológica dentro del sector energético, promoviendo un futuro más sostenible a nivel global.' WHERE idPatrocinador = 6;

UPDATE Patrocinador SET descripcion = 'Michelin es un fabricante francés de neumáticos, conocido mundialmente por su excelencia en el desarrollo de productos de alta calidad para diversos tipos de vehículos, desde autos hasta motocicletas. En MotoGP, Michelin es el proveedor oficial de neumáticos desde 2016, garantizando a los equipos el mejor rendimiento posible en cada carrera. La marca es un pilar fundamental en el motociclismo, ya que sus neumáticos son esenciales para el rendimiento de los pilotos y la seguridad en las pistas.' WHERE idPatrocinador = 7;

UPDATE Patrocinador SET descripcion = 'Petronas es una empresa energética malaya con una sólida presencia en la industria de los combustibles y la petroquímica. En el ámbito deportivo, la compañía ha sido un patrocinador activo de MotoGP, colaborando con equipos como Petronas Yamaha SRT. Además de su actividad en los deportes de motor, Petronas es un actor clave en el suministro de energía a nivel global, respaldando iniciativas relacionadas con la sostenibilidad y la innovación tecnológica en la industria energética y de lubricantes.' WHERE idPatrocinador = 8;

UPDATE Patrocinador SET descripcion = 'Alpinestars es una marca de ropa y accesorios de motociclismo, reconocida mundialmente por la calidad y seguridad de sus productos. Fundada en 1963 en Italia, Alpinestars ha sido un líder en el diseño de trajes de protección, botas y guantes para motociclistas, siendo el proveedor oficial de equipos de protección de muchos pilotos de MotoGP. Su compromiso con la innovación y la seguridad ha convertido a Alpinestars en una de las marcas más confiables en el motociclismo profesional y en deportes de motor en general.' WHERE idPatrocinador = 9;

UPDATE Patrocinador SET descripcion = 'Dainese es una empresa italiana de renombre en el diseño y fabricación de equipamiento de seguridad para motociclistas. Fundada en 1972, Dainese ha sido pionera en la creación de trajes, botas, guantes y otros accesorios diseñados para proteger a los pilotos en las pistas de motociclismo. Su colaboración con equipos de MotoGP, como Ducati y Yamaha, ha sido fundamental para garantizar que los pilotos puedan competir al más alto nivel con la máxima seguridad. Dainese es sinónimo de calidad, innovación y protección en el mundo del motociclismo.' WHERE idPatrocinador = 10;