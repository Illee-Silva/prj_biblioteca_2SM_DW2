
-- -----------------------------------------------------
-- Schema prj_biblioteca
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `prj_biblioteca` DEFAULT CHARACTER SET utf8 ;
USE `prj_biblioteca` ;

-- -----------------------------------------------------
-- Table `prj_biblioteca`.`Categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prj_biblioteca`.`Categoria` (
  `ID_Categoria` INT NOT NULL,
  `Nome` VARCHAR(45) NULL,
  PRIMARY KEY (`ID_Categoria`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `prj_biblioteca`.`Autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prj_biblioteca`.`Autor` (
  `ID_Autor` INT NOT NULL AUTO_INCREMENT,
  `Nome_Completo` VARCHAR(60) NOT NULL,
  `DT_Nascimento` DATE NOT NULL,
  `Nacionalidade` VARCHAR(45) NULL,
  `Principal_Obra` VARCHAR(45) NULL,
  `Estilo_literario` VARCHAR(45) NULL,
  PRIMARY KEY (`ID_Autor`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `prj_biblioteca`.`Editora`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prj_biblioteca`.`Editora` (
  `ID_Editora` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NULL,
  `Ano_Fundacao` INT(4) NULL,
  `Principal_Publicacao` VARCHAR(45) NULL,
  PRIMARY KEY (`ID_Editora`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `prj_biblioteca`.`Livro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prj_biblioteca`.`Livro` (
  `ID_Livro` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  `Quantidade` INT NOT NULL,
  `Categoria` INT NOT NULL,
  `Ano_Publicação` INT(4) NULL,
  `qtd_Paginas` INT NULL,
  `Idioma` VARCHAR(15) NULL,
  `Autor` INT NOT NULL,
  `Editora` INT NOT NULL,
  PRIMARY KEY (`ID_Livro`, `Categoria`, `Autor`, `Editora`),
  CONSTRAINT `fk_Livro_Categoria`
    FOREIGN KEY (`Categoria`)
    REFERENCES `prj_biblioteca`.`Categoria` (`ID_Categoria`),
  CONSTRAINT `fk_Livro_Autor1`
    FOREIGN KEY (`Autor`)
    REFERENCES `prj_biblioteca`.`Autor` (`ID_Autor`),
  CONSTRAINT `fk_Livro_Editora1`
    FOREIGN KEY (`Editora`)
    REFERENCES `prj_biblioteca`.`Editora` (`ID_Editora`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `prj_biblioteca`.`Estante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prj_biblioteca`.`Estante` (
  `ID_Estante` INT NOT NULL AUTO_INCREMENT,
  `Categoria` INT NOT NULL,
  PRIMARY KEY (`ID_Estante`, `Categoria`),
  CONSTRAINT `fk_Estante_Categoria1`
    FOREIGN KEY (`Categoria`)
    REFERENCES `prj_biblioteca`.`Categoria` (`ID_Categoria`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `prj_biblioteca`.`Funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prj_biblioteca`.`Funcionario` (
  `ID_Funcionario` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  `Estagiario` INT NULL,
  `Grupo_Estantes` VARCHAR(45) NOT NULL,
  `Funcionario_Responsavel` INT NULL,
  `Instituicao` VARCHAR(45) NULL,
  PRIMARY KEY (`ID_Funcionario`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `prj_biblioteca`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prj_biblioteca`.`Cliente` (
  `ID_Cliente` INT NOT NULL AUTO_INCREMENT,
  `CPF` VARCHAR(15) NOT NULL,
  `Telefone` VARCHAR(45) NOT NULL,
  `Endereco` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID_Cliente`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `prj_biblioteca`.`Emprestimos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prj_biblioteca`.`Emprestimos` (
  `ID_Emprestimo` INT NOT NULL AUTO_INCREMENT,
  `Livro` INT NOT NULL,
  `DT_Emprestimo` DATE NOT NULL,
  `DT_Devolucao` DATE NOT NULL,
  `Multa_Diaria` DOUBLE NOT NULL,
  `Funcionario_Emprestimo` INT NOT NULL,
  `Cliente_Emprestimo` INT NOT NULL,
  PRIMARY KEY (`ID_Emprestimo`, `Funcionario_Emprestimo`, `Cliente_Emprestimo`),
  CONSTRAINT `fk_Emprestimos_Funcionario1`
    FOREIGN KEY (`Funcionario_Emprestimo`)
    REFERENCES `prj_biblioteca`.`Funcionario` (`ID_Funcionario`),
  CONSTRAINT `fk_Emprestimos_Cliente1`
    FOREIGN KEY (`Cliente_Emprestimo`)
    REFERENCES `prj_biblioteca`.`Cliente` (`ID_Cliente`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `prj_biblioteca`.`Emprestimos_has_Livro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prj_biblioteca`.`Emprestimos_has_Livro`(
  `Emprestimos_ID_Emprestimo` INT NOT NULL,
  `Livro_ID_Livro` INT NOT NULL,
  `Livro_Categoria` INT NOT NULL,
  `Livro_Autor` INT NOT NULL,
  `Livro_Editora` INT NOT NULL,
  PRIMARY KEY (`Emprestimos_ID_Emprestimo`, `Livro_ID_Livro`, `Livro_Categoria`, `Livro_Autor`, `Livro_Editora`))
ENGINE = InnoDB;
