CREATE SCHEMA IF NOT EXISTS `MisterLanches` DEFAULT CHARACTER SET utf8 ;
USE `MisterLanches` ;

CREATE TABLE IF NOT EXISTS `MisterLanches`.`lanche` (
  `cd_lanche` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nm_lanche` VARCHAR(255) NOT NULL,
  `ds_lanche` VARCHAR(255) NULL,
  `ds_acompanhamento` VARCHAR(255) NULL,
  `vl_lanche` DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (`cd_lanche`),
  UNIQUE INDEX `cd_lanche_UNIQUE` (`cd_lanche` ASC) ,
  UNIQUE INDEX `nm_lanche_UNIQUE` (`nm_lanche` ASC) )
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `MisterLanches`.`cliente` (
  `cd_cliente` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `cd_cpf` VARCHAR(45) NOT NULL,
  `nm_cliente` VARCHAR(45) NOT NULL,
  `dt_nascimento` DATE NULL,
  `ds_endereco` VARCHAR(255) NULL,
  PRIMARY KEY (`cd_cliente`),
  UNIQUE INDEX `cd_cliente_UNIQUE` (`cd_cliente` ASC) ,
  UNIQUE INDEX `cd_cpf_UNIQUE` (`cd_cpf` ASC) )
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `MisterLanches`.`pedido` (
  `cd_pedido` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `cd_cliente` INT UNSIGNED NOT NULL,
  `ds_observacao` VARCHAR(45) NULL,
  `dt_pedido` DATETIME NOT NULL,
  PRIMARY KEY (`cd_pedido`),
  UNIQUE INDEX `cd_pedido_UNIQUE` (`cd_pedido` ASC) ,
  INDEX `fk_pedido_cliente_idx` (`cd_cliente` ASC) ,
  CONSTRAINT `fk_pedido_cliente`
    FOREIGN KEY (`cd_cliente`)
    REFERENCES `MisterLanches`.`cliente` (`cd_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `MisterLanches`.`pedido_lanche` (
  `cd_pedido_lanche` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `cd_lanche` INT UNSIGNED NOT NULL,
  `cd_pedido` INT UNSIGNED NOT NULL,
  `qt_lanches` INT NULL,
  PRIMARY KEY (`cd_pedido_lanche`),
  INDEX `fk_pedido_lanche_lanche1_idx` (`cd_lanche` ASC) ,
  INDEX `fk_pedido_lanche_pedido1_idx` (`cd_pedido` ASC) ,
  CONSTRAINT `fk_pedido_lanche_lanche1`
    FOREIGN KEY (`cd_lanche`)
    REFERENCES `MisterLanches`.`lanche` (`cd_lanche`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_lanche_pedido1`
    FOREIGN KEY (`cd_pedido`)
    REFERENCES `MisterLanches`.`pedido` (`cd_pedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `MisterLanches`.`bebida` (
  `cd_bebida` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nm_bebida` VARCHAR(45) NOT NULL,
  `ds_bebida` VARCHAR(45) NULL,
  `ds_tipo` VARCHAR(45) NULL,
  `vl_bebida` DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (`cd_bebida`),
  UNIQUE INDEX `cd_bebida_UNIQUE` (`cd_bebida` ASC))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `MisterLanches`.`pedido_bebida` (
  `cd_pedido_bebida` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `cd_pedido` INT UNSIGNED NOT NULL,
  `cd_bebida` INT UNSIGNED NOT NULL,
  `qt_bebida` INT NOT NULL,
  PRIMARY KEY (`cd_pedido_bebida`),
  UNIQUE INDEX `cd_pedido_bebida_UNIQUE` (`cd_pedido_bebida` ASC) ,
  INDEX `fk_pedido_bebida_bebida1_idx` (`cd_bebida` ASC) ,
  INDEX `fk_pedido_bebida_pedido1_idx` (`cd_pedido` ASC) ,
  CONSTRAINT `fk_pedido_bebida_bebida1`
    FOREIGN KEY (`cd_bebida`)
    REFERENCES `MisterLanches`.`bebida` (`cd_bebida`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_bebida_pedido1`
    FOREIGN KEY (`cd_pedido`)
    REFERENCES `MisterLanches`.`pedido` (`cd_pedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
