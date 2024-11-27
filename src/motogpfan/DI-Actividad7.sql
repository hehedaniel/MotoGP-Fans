CREATE SCHEMA IF NOT EXISTS `PruebaMotoGPFan` ;
USE `PruebaMotoGPFan` ;


CREATE TABLE IF NOT EXISTS `PruebaMotoGPFan`.`Equipo` (
  `idEquipo` INT NOT NULL AUTO_INCREMENT,
  `logo` LONGTEXT NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `descripcion` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idEquipo`),
  UNIQUE INDEX `idMotos_UNIQUE` (`idEquipo` ASC) VISIBLE)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `PruebaMotoGPFan`.`Piloto` (
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
  CONSTRAINT `fk_Piloto_Equipo1`
    FOREIGN KEY (`idEquipo`)
    REFERENCES `PruebaMotoGPFan`.`Equipo` (`idEquipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



CREATE TABLE IF NOT EXISTS `PruebaMotoGPFan`.`Patrocinador` (
  `idPatrocinador` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `sector` VARCHAR(100) NOT NULL,
  `pais` LONGTEXT NOT NULL,
  PRIMARY KEY (`idPatrocinador`),
  UNIQUE INDEX `idPatrocinador_UNIQUE` (`idPatrocinador` ASC) VISIBLE)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `PruebaMotoGPFan`.`` (
)
ENGINE = InnoDB;



CREATE TABLE IF NOT EXISTS `PruebaMotoGPFan`.`Piloto_has_Patrocinador` (
  `idPiloto` INT NOT NULL,
  `idPatrocinador` INT NOT NULL,
  `fecha_inicio` DATE NOT NULL,
  `fecha_fin` DATE NOT NULL,
  PRIMARY KEY (`idPiloto`, `idPatrocinador`),
  INDEX `fk_Piloto_has_Patrocinador_Patrocinador1_idx` (`idPatrocinador` ASC) VISIBLE,
  INDEX `fk_Piloto_has_Patrocinador_Piloto_idx` (`idPiloto` ASC) VISIBLE,
  CONSTRAINT `fk_Piloto_has_Patrocinador_Piloto`
    FOREIGN KEY (`idPiloto`)
    REFERENCES `PruebaMotoGPFan`.`Piloto` (`idPiloto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Piloto_has_Patrocinador_Patrocinador1`
    FOREIGN KEY (`idPatrocinador`)
    REFERENCES `PruebaMotoGPFan`.`Patrocinador` (`idPatrocinador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- Logo
INSERT INTO Patrocinador (idPatrocinador, nombre, descripcion, logo) VALUES
                                                                         (1, 'Repsol', 'Compañía española líder en el sector de energía y lubricantes', 'url imagen'),
                                                                         (2, 'Red Bull', 'Marca austriaca de bebidas energéticas y patrocinador de deportes extremos', 'url imagen'),
                                                                         (3, 'Monster Energy', 'Marca de bebidas energéticas conocida por su apoyo a deportes extremos', 'url imagen'),
                                                                         (4, 'Lenovo', 'Empresa tecnológica líder en computadoras y patrocinadora de Ducati', 'url imagen'),
                                                                         (5, 'Prima', 'Patrocinador principal de Pramac Racing en MotoGP', 'url imagen'),
                                                                         (6, 'Pertamina', 'Empresa indonesia de energía y lubricantes', 'url imagen'),
                                                                         (7, 'Michelin', 'Fabricante oficial de neumáticos para MotoGP', 'url imagen'),
                                                                         (8, 'Petronas', 'Compañía petrolera malaya con presencia en deportes de motor', 'url imagen'),
                                                                         (9, 'Alpinestars', 'Fabricante de ropa y accesorios de motociclismo', 'url imagen'),
                                                                         (10, 'Dainese', 'Empresa italiana especializada en equipamiento de seguridad para motociclistas', 'url imagen');



-- Logo
INSERT INTO Equipo (idEquipo, nombre, descripcion, logo) VALUES
                                                             (1, 'LCR Honda', 'Equipo oficial respaldado por Honda en MotoGP', 'url imagen'),
                                                             (2, 'Repsol Honda', 'Equipo principal de Honda con patrocinio de Repsol', 'url imagen'),
                                                             (3, 'Red Bull KTM Fatory Racing', 'Equipo de KTM con patrocinio de Red Bull', 'url imagen'),
                                                             (4, 'Monster Energy Yamaha', 'Equipo oficial de Yamaha patrocinado por Monster Energy', 'url imagen'),
                                                             (5, 'Pertamina Enduro VR46', 'Equipo vinculado a Valentino Rossi y Pertamina Enduro', 'url imagen'),
                                                             (6, 'Trackhouse Racing', 'Equipo joven debutante en MotoGP', 'url imagen'),
                                                             (7, 'Prima Pramac Racing', 'Equipo satélite de Ducati respaldado por Prima Pramac', 'url imagen'),
                                                             (8, 'Gresini Racing', 'Equipo histórico independiente en MotoGP', 'url imagen'),
                                                             (9, 'Ducati Lenovo', 'Equipo principal de Ducati con Lenovo como patrocinador', 'url imagen'),
                                                             (10, 'Aprilia Racing', 'Equipo oficial de Aprilia en MotoGP', 'url imagen'),
                                                             (11, 'Red Bull KTM Tech3', 'Equipo de KTM con patrocinio de Red Bull', 'url imagen');

-- Tamaños a 377 alto y 227 ancho
INSERT INTO Piloto (idPiloto, nombre, apellido, pais, idEquipo, altura, peso, foto) VALUES
                                                                                        (25, 'Johann', 'Zarco', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/62/Flag_of_France.png/1280px-Flag_of_France.png', 1, 171, 66, 'https://resources.motogp.pulselive.com/photo-resources/2024/02/19/804f0106-d53b-4052-bbd4-23e41f093ae6/rider-bio_johannzarco.png?height=700&width=900'),
                                                                                        (10, 'Luca', 'Marini', 'https://img.freepik.com/vector-gratis/ilustracion-bandera-italia_53876-27098.jpg', 2, 184, 69, 'https://resources.motogp.pulselive.com/photo-resources/2024/02/19/3a49cbe4-f2a9-4eb5-8e75-08b5387e6dea/rider-bio_lucamarini.png?height=700&width=900'),
                                                                                        (12, 'Maverick', 'Viñales', 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Bandera_de_España_%28nuevo_diseño%29.svg/640px-Bandera_de_España_%28nuevo_diseño%29.svg.png', 11, 171, 64, 'https://resources.motogp.pulselive.com/photo-resources/2024/11/19/a7cfa270-f62a-49e9-b93b-f5c0cfa4a154/12_Maverick_Vinales.png?height=700&width=900'),
                                                                                        (20, 'Fabio', 'Quartararo', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/62/Flag_of_France.png/1280px-Flag_of_France.png', 4, 177, 69 , 'https://resources.motogp.pulselive.com/photo-resources/2024/02/19/80de8d72-d1b8-4b41-90b0-928467018ced/rider-bio_fabioquartararo.png?height=700&width=900'),
                                                                                        (21, 'Franco', 'Morbidelli', 'https://img.freepik.com/vector-gratis/ilustracion-bandera-italia_53876-27098.jpg', 5, 176 , 68 , 'https://resources.motogp.pulselive.com/photo-resources/2024/11/19/49428293-9d8b-4230-98a3-c1b78737bcdd/21-Franco-Morbidelli.png?height=700&width=900'),
                                                                                        (23, 'Enea', 'Bastianini', 'https://img.freepik.com/vector-gratis/ilustracion-bandera-italia_53876-27098.jpg', 11, 168 , 64 , 'https://resources.motogp.pulselive.com/photo-resources/2024/11/19/ab7f94d4-f82d-434f-8ecf-5c22953a4e00/23-Enea-Bastianini.png?height=700&width=900'),
                                                                                        (25, 'Raul', 'Fernandez', 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Bandera_de_España_%28nuevo_diseño%29.svg/640px-Bandera_de_España_%28nuevo_diseño%29.svg.png', 6, 178 , 65 , 'https://resources.motogp.pulselive.com/photo-resources/2024/08/02/e1d21120-21e6-43c8-83f0-2707634800a7/25-Raul-Fernandez-MotoGPrider.png?height=700&width=900'),
                                                                                        (33, 'Brad', 'Binder', 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/af/Flag_of_South_Africa.svg/2560px-Flag_of_South_Africa.svg.png', 3, 170 , 63 , 'https://resources.motogp.pulselive.com/photo-resources/2024/02/19/664d8e67-65b0-4196-9cc0-47fb5f64efa3/rider-bio_bradbinder.png?height=700&width=900'),
                                                                                        (35, 'Somkiat', 'Chantra', 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Flag_of_Thailand.svg/2560px-Flag_of_Thailand.svg.png', 1, 172 , 63 , 'https://resources.motogp.pulselive.com/photo-resources/2024/11/19/3a67fbfa-67c0-4b6a-8aa0-5166fb33a5ec/35-Somkiat-Chantra.png?height=700&width=900'),
                                                                                        (36, 'Joan', 'Mir', 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Bandera_de_España_%28nuevo_diseño%29.svg/640px-Bandera_de_España_%28nuevo_diseño%29.svg.png', 2, 181 , 69 , 'https://resources.motogp.pulselive.com/photo-resources/2024/02/19/c745a780-c0bc-46a0-9d6e-81a45ca2fde4/rider-bio_joanmir.png?height=700&width=900'),
                                                                                        (37, 'Pedro', 'Acosta', 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Bandera_de_España_%28nuevo_diseño%29.svg/640px-Bandera_de_España_%28nuevo_diseño%29.svg.png', 3, 171 , 63 , 'https://resources.motogp.pulselive.com/photo-resources/2024/11/19/aced6ac0-55e3-42d3-ad77-1ff6259cb0cf/31-Pedro-Acosta.png?height=700&width=900'),
                                                                                        (42, 'Alex', 'Rins', 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Bandera_de_España_%28nuevo_diseño%29.svg/640px-Bandera_de_España_%28nuevo_diseño%29.svg.png', 4, 176 , 68 , 'https://resources.motogp.pulselive.com/photo-resources/2024/02/20/1d8c150c-b9dc-4db7-b70e-37b0f28949bd/rider-bio_alexrins.png?height=700&width=900'),
                                                                                        (43, 'Jack', 'Miller', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Flag_of_Australia_%28converted%29.svg/1280px-Flag_of_Australia_%28converted%29.svg.png', 7, 173 , 64 , 'https://resources.motogp.pulselive.com/photo-resources/2024/11/21/055a5335-ce43-4637-84a1-f605500f1e0c/43-Jack-Miller.png?height=700&width=900'),
                                                                                        (49, 'Fabio', 'Di Giannantonio', 'https://img.freepik.com/vector-gratis/ilustracion-bandera-italia_53876-27098.jpg', 5, 177 , 62 , 'https://resources.motogp.pulselive.com/photo-resources/2024/02/19/4088be73-b443-4648-b1e9-cf184b3bc7a3/rider-bio_fabiodigiannantonio.png?height=700&width=900'),
                                                                                        (54, 'Fermín', 'Aldeguer', 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Bandera_de_España_%28nuevo_diseño%29.svg/640px-Bandera_de_España_%28nuevo_diseño%29.svg.png', 8, 181 , 69 , 'https://resources.motogp.pulselive.com/photo-resources/2024/11/21/abc5cf44-3b50-486f-86dd-05ec3c2e22e3/54-Fermin-Aldeguer.png?height=700&width=900'),
                                                                                        (63, 'Francesco', 'Bagnaia', 'https://img.freepik.com/vector-gratis/ilustracion-bandera-italia_53876-27098.jpg', 9, 176 , 64 , 'https://resources.motogp.pulselive.com/photo-resources/2024/02/19/3a568eee-1e12-4091-b120-f53c71cbe8f6/rider-bio_francescobagnaia.png?height=700&width=900'),
                                                                                        (72, 'Marco', 'Bezzecchi', 'https://img.freepik.com/vector-gratis/ilustracion-bandera-italia_53876-27098.jpg', 10, 176 , 64 , 'https://resources.motogp.pulselive.com/photo-resources/2024/11/19/be661691-558f-41d7-9196-815d473181e2/72-Marco-Bezzecchi.png?height=700&width=900'),
                                                                                        (73, 'Alex', 'Márquez', 'https://img.freepik.com/vector-gratis/ilustracion-bandera-italia_53876-27098.jpg', 8, 180 , 65 , 'https://resources.motogp.pulselive.com/photo-resources/2024/02/19/2c1e0ebb-a3b6-4add-9378-8d5797e593c8/rider-bio_alexmarquez.png?height=700&width=900'),
                                                                                        (79, 'Ai', 'Ogura', 'https://img.freepik.com/vector-gratis/ilustracion-bandera-japon_53876-27128.jpg', 6, 169 , 60 , 'https://resources.motogp.pulselive.com/photo-resources/2024/11/19/ec63c848-e77a-4aac-9fc3-0a43c0fad5e1/79-Ai-Ogura.png?height=700&width=900'),
                                                                                        (88, 'Miguel', 'Oliveira', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Flag_of_Portugal.svg/1280px-Flag_of_Portugal.svg.png', 7, 170 , 64 , 'https://resources.motogp.pulselive.com/photo-resources/2024/08/02/667c8748-1e0e-492f-a659-ac404321141d/88-Miguel-Oliveira-MotoGP_rider.png?height=700&width=900'),
                                                                                        (1, 'Jorge', 'Martín', 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Bandera_de_España_%28nuevo_diseño%29.svg/640px-Bandera_de_España_%28nuevo_diseño%29.svg.png', 10, 168 , 63 , 'https://resources.motogp.pulselive.com/photo-resources/2024/11/19/24001b82-1348-4f36-adc4-4701d07ea673/89-Jorge-Martin.png?height=700&width=900'),
                                                                                        (93, 'Marc', 'Márquez', 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Bandera_de_España_%28nuevo_diseño%29.svg/640px-Bandera_de_España_%28nuevo_diseño%29.svg.png', 9, 169 , 64 , 'https://resources.motogp.pulselive.com/photo-resources/2024/11/19/a4f43356-42bc-4c85-a659-682d9c68cfc6/93-Marc-Marquez.png?height=700&width=900');

-- SI
INSERT INTO Piloto_has_Patrocinador (idPiloto, idPatrocinador, fecha_inicio, fecha_fin) VALUES
                                                                                            (5, 1, '2022-01-01', '2024-12-31'), -- Johann Zarco -> Repsol
                                                                                            (10, 2, '2022-03-01', '2024-12-31'), -- Luca Marini -> Red Bull
                                                                                            (12, 2, '2022-03-01', '2024-12-31'), -- Maverick Viñales -> Red Bull
                                                                                            (20, 3, '2022-02-01', '2024-12-31'), -- Fabio Quartararo -> Monster Energy
                                                                                            (21, 6, '2022-05-01', '2024-12-31'), -- Franco Morbidelli -> Pertamina
                                                                                            (23, 2, '2022-06-01', '2024-12-31'), -- Enea Bastianini -> Red Bull
                                                                                            (5, 7, '2022-03-01', '2024-12-31'), -- Raul Fernandez -> Michelin
                                                                                            (33, 2, '2022-01-01', '2024-12-31'), -- Brad Binder -> Red Bull
                                                                                            (35, 7, '2022-03-01', '2024-12-31'), -- Somkiat Chantra -> Michelin
                                                                                            (36, 1, '2022-01-01', '2024-12-31'), -- Joan Mir -> Repsol
                                                                                            (37, 2, '2022-01-01', '2024-12-31'), -- Pedro Acosta -> Red Bull
                                                                                            (42, 3, '2022-01-01', '2024-12-31'), -- Alex Rins -> Monster Energy
                                                                                            (43, 5, '2022-03-01', '2024-12-31'), -- Jack Miller -> Prima
                                                                                            (49, 6, '2022-05-01', '2024-12-31'), -- Fabio Di Giannantonio -> Pertamina
                                                                                            (54, 8, '2022-03-01', '2024-12-31'), -- Fermín Aldeguer -> Petronas
                                                                                            (63, 4, '2022-01-01', '2024-12-31'), -- Francesco Bagnaia -> Lenovo
                                                                                            (72, 10, '2022-01-01', '2024-12-31'), -- Marco Bezzecchi -> Dainese
                                                                                            (73, 8, '2022-01-01', '2024-12-31'), -- Alex Márquez -> Petronas
                                                                                            (79, 9, '2022-03-01', '2024-12-31'), -- Ai Ogura -> Alpinestars
                                                                                            (88, 5, '2022-01-01', '2024-12-31'), -- Miguel Oliveira -> Prima
                                                                                            (1, 10, '2022-01-01', '2024-12-31'), -- Jorge Martín -> Dainese
                                                                                            (93, 4, '2022-01-01', '2024-12-31'); -- Marc Márquez -> Lenovo