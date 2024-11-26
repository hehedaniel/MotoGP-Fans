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
