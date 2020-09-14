SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `MbFashionFinal` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `MbFashionFinal` ;

-- -----------------------------------------------------
-- Table `MbFashionFinal`.`menu`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MbFashionFinal`.`menu` (
  `idmenu` INT NOT NULL AUTO_INCREMENT ,
  `nome` VARCHAR(45) NOT NULL ,
  `link` VARCHAR(100) NOT NULL ,
  `icone` VARCHAR(45) NULL ,
  `exibir` INT NOT NULL ,
  PRIMARY KEY (`idmenu`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MbFashionFinal`.`perfil`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MbFashionFinal`.`perfil` (
  `idperfil` INT NOT NULL AUTO_INCREMENT ,
  `nome` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idperfil`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MbFashionFinal`.`usuario`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MbFashionFinal`.`usuario` (
  `idusuario` INT NOT NULL AUTO_INCREMENT ,
  `nome` VARCHAR(100) NOT NULL ,
  `login` VARCHAR(45) NOT NULL ,
  `senha` VARCHAR(45) NOT NULL ,
  `status` INT NOT NULL ,
  `idperfil` INT NOT NULL ,
  PRIMARY KEY (`idusuario`) ,
  INDEX `fk_usuario_perfil1_idx` (`idperfil` ASC) ,
  CONSTRAINT `fk_usuario_perfil1`
    FOREIGN KEY (`idperfil` )
    REFERENCES `MbFashionFinal`.`perfil` (`idperfil` )
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MbFashionFinal`.`menu_perfil`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MbFashionFinal`.`menu_perfil` (
  `idmenu` INT NOT NULL ,
  `idperfil` INT NOT NULL ,
  PRIMARY KEY (`idmenu`, `idperfil`) ,
  INDEX `fk_menu_has_perfil_perfil1_idx` (`idperfil` ASC) ,
  INDEX `fk_menu_has_perfil_menu_idx` (`idmenu` ASC) ,
  CONSTRAINT `fk_menu_has_perfil_menu`
    FOREIGN KEY (`idmenu` )
    REFERENCES `MbFashionFinal`.`menu` (`idmenu` )
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_menu_has_perfil_perfil1`
    FOREIGN KEY (`idperfil` )
    REFERENCES `MbFashionFinal`.`perfil` (`idperfil` )
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MbFashionFinal`.`cliente`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MbFashionFinal`.`cliente` (
  `idcliente` INT NOT NULL AUTO_INCREMENT ,
  `nome` VARCHAR(100) NOT NULL ,
  `email` VARCHAR(100) NOT NULL ,
  `cpf` VARCHAR(14) NOT NULL ,
  `rg` VARCHAR(20) NULL ,
  `data_nasc` DATE NOT NULL ,
  `sexo` CHAR NOT NULL ,
  `telefone` VARCHAR(14) NULL ,
  `cep` VARCHAR(9) NULL ,
  `endereco` VARCHAR(100) NULL ,
  `numero` INT NULL ,
  `complemento` VARCHAR(45) NULL ,
  `bairro` VARCHAR(45) NULL ,
  `cidade` VARCHAR(45) NULL ,
  `uf` VARCHAR(45) NULL ,
  `cliente_desde` DATE NOT NULL ,
  `fidelidade` CHAR NOT NULL ,
  `promocao` CHAR NOT NULL ,
  PRIMARY KEY (`idcliente`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MbFashionFinal`.`fornecedor`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MbFashionFinal`.`fornecedor` (
  `idfornecedor` INT NOT NULL AUTO_INCREMENT ,
  `razao_social` VARCHAR(100) NOT NULL ,
  `cnpj` VARCHAR(18) NOT NULL ,
  `inscricao_estadual` VARCHAR(45) NULL ,
  `telefone` VARCHAR(14) NOT NULL ,
  `cep` VARCHAR(9) NULL ,
  `endereco` VARCHAR(100) NULL ,
  `numero` INT NULL ,
  `complemento` VARCHAR(45) NULL ,
  `bairro` VARCHAR(45) NULL ,
  `cidade` VARCHAR(45) NULL ,
  `uf` VARCHAR(45) NULL ,
  PRIMARY KEY (`idfornecedor`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MbFashionFinal`.`cor`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MbFashionFinal`.`cor` (
  `idcor` INT NOT NULL AUTO_INCREMENT ,
  `nome` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idcor`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MbFashionFinal`.`categoria`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MbFashionFinal`.`categoria` (
  `idcategoria` INT NOT NULL AUTO_INCREMENT ,
  `nome` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idcategoria`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MbFashionFinal`.`marca`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MbFashionFinal`.`marca` (
  `idmarca` INT NOT NULL AUTO_INCREMENT ,
  `nome` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idmarca`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MbFashionFinal`.`tamanho`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MbFashionFinal`.`tamanho` (
  `idtamanho` INT NOT NULL AUTO_INCREMENT ,
  `nome` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idtamanho`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MbFashionFinal`.`produto`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MbFashionFinal`.`produto` (
  `idproduto` INT NOT NULL AUTO_INCREMENT ,
  `descricao` VARCHAR(45) NOT NULL ,
  `vlr_compra` DOUBLE NOT NULL ,
  `vlr_venda` DOUBLE NOT NULL ,
  `qtde` INT NOT NULL ,
  `idfornecedor` INT NOT NULL ,
  `idcategoria` INT NOT NULL ,
  `idcor` INT NOT NULL ,
  `idtamanho` INT NOT NULL ,
  `idmarca` INT NOT NULL ,
  PRIMARY KEY (`idproduto`) ,
  INDEX `fk_produto_fornecedor1_idx` (`idfornecedor` ASC) ,
  INDEX `fk_produto_categoria1_idx` (`idcategoria` ASC) ,
  INDEX `fk_produto_cor1_idx` (`idcor` ASC) ,
  INDEX `fk_produto_tamanho1_idx` (`idtamanho` ASC) ,
  INDEX `fk_produto_marca1_idx` (`idmarca` ASC) ,
  CONSTRAINT `fk_produto_fornecedor1`
    FOREIGN KEY (`idfornecedor` )
    REFERENCES `MbFashionFinal`.`fornecedor` (`idfornecedor` )
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_produto_categoria1`
    FOREIGN KEY (`idcategoria` )
    REFERENCES `MbFashionFinal`.`categoria` (`idcategoria` )
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_produto_cor1`
    FOREIGN KEY (`idcor` )
    REFERENCES `MbFashionFinal`.`cor` (`idcor` )
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_produto_tamanho1`
    FOREIGN KEY (`idtamanho` )
    REFERENCES `MbFashionFinal`.`tamanho` (`idtamanho` )
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_produto_marca1`
    FOREIGN KEY (`idmarca` )
    REFERENCES `MbFashionFinal`.`marca` (`idmarca` )
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MbFashionFinal`.`vendas`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MbFashionFinal`.`vendas` (
  `idvendas` INT NOT NULL AUTO_INCREMENT ,
  `data_venda` DATE NOT NULL ,
  `vlr_total` DOUBLE NOT NULL ,
  `idusuario` INT NOT NULL ,
  `idcliente` INT NOT NULL ,
  PRIMARY KEY (`idvendas`) ,
  INDEX `fk_vendas_usuario1_idx` (`idusuario` ASC) ,
  INDEX `fk_vendas_cliente1_idx` (`idcliente` ASC) ,
  CONSTRAINT `fk_vendas_usuario1`
    FOREIGN KEY (`idusuario` )
    REFERENCES `MbFashionFinal`.`usuario` (`idusuario` )
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_vendas_cliente1`
    FOREIGN KEY (`idcliente` )
    REFERENCES `MbFashionFinal`.`cliente` (`idcliente` )
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MbFashionFinal`.`Itens_de_venda`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `MbFashionFinal`.`Itens_de_venda` (
  `idvendas` INT NOT NULL ,
  `idproduto` INT NOT NULL ,
  `vlr_venda` DOUBLE NOT NULL ,
  `qtde` INT NOT NULL ,
  `vlr_total` DOUBLE NOT NULL ,
  PRIMARY KEY (`idvendas`, `idproduto`) ,
  INDEX `fk_vendas_has_produto_produto1_idx` (`idproduto` ASC) ,
  INDEX `fk_vendas_has_produto_vendas1_idx` (`idvendas` ASC) ,
  CONSTRAINT `fk_vendas_has_produto_vendas1`
    FOREIGN KEY (`idvendas` )
    REFERENCES `MbFashionFinal`.`vendas` (`idvendas` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vendas_has_produto_produto1`
    FOREIGN KEY (`idproduto` )
    REFERENCES `MbFashionFinal`.`produto` (`idproduto` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
