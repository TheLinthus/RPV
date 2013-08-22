DROP schema if exists `rpv`;
create schema `rpv`;
use `rpv`;
CREATE TABLE `arquivos` (
  `idarquivos` int(11) NOT NULL AUTO_INCREMENT,
  `dados` longblob,
  `nome` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idarquivos`)
) ENGINE=InnoDB AUTO_INCREMENT=0;
CREATE TABLE `campus` (
  `idcampus` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcampus`)
) ENGINE=InnoDB;
CREATE TABLE `eixo` (
  `ideixo` int(11) NOT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ideixo`)
) ENGINE=InnoDB;
CREATE TABLE `equipe` (
  `idequipe` int(11) NOT NULL AUTO_INCREMENT,
  `membro` varchar(45) NOT NULL,
  PRIMARY KEY (`idequipe`,`membro`)
) ENGINE=InnoDB;
CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(45) DEFAULT NULL,
  `senha` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=0;
CREATE TABLE `professor` (
  `idprofessor` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `cpf` varchar(11) DEFAULT NULL,
  `siap` varchar(45) DEFAULT NULL,
  `campus` int(11) DEFAULT NULL,
  `usuario_idusuario` int(11) NOT NULL,
  `email` VARCHAR(45) DEFAULT NULL,
  `proreitor` INT(1) NULL DEFAULT 0,
  PRIMARY KEY (`idprofessor`,`usuario_idusuario`),
  KEY `fk_professor_usuario1_idx` (`usuario_idusuario`),
  CONSTRAINT `fk_professor_usuario1` FOREIGN KEY (`usuario_idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=0;
CREATE TABLE `projeto` (
  `idprojeto` int(11) NOT NULL AUTO_INCREMENT,
  `p_execucao` varchar(45) DEFAULT NULL,
  `d_inicio` date DEFAULT NULL,
  `d_fim` date DEFAULT NULL,
  `titulo` varchar(45) DEFAULT NULL,
  `palavraschave` varchar(255) DEFAULT NULL,
  `arquivos_idarquivos` int(11) DEFAULT NULL,
  `professor_idprofessor` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT '1',
  `nome` varchar(45) DEFAULT NULL,
  `eixo_ideixo` int(11) DEFAULT NULL,
  `campus_idcampus` int(11) DEFAULT NULL,
  `ata1_idarquivos` int(11) DEFAULT NULL,
  `ata2_idarquivos` int(11) DEFAULT NULL,
  `equipe` int(11) DEFAULT NULL,
  PRIMARY KEY (`idprojeto`),
  KEY `arquivos_idarquivos_idx` (`arquivos_idarquivos`),
  KEY `professor_idprofessor_idx` (`professor_idprofessor`),
  KEY `eixo_ideixo_idx` (`eixo_ideixo`),
  KEY `campus_idcampus_idx` (`campus_idcampus`),
  KEY `ata1_idarquivo_idx` (`ata1_idarquivos`),
  KEY `ata2_idarquivo_idx` (`ata2_idarquivos`),
  KEY `equipe_idx` (`equipe`),
  CONSTRAINT `equipe` FOREIGN KEY (`equipe`) REFERENCES `equipe` (`idequipe`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `arquivos_idarquivos` FOREIGN KEY (`arquivos_idarquivos`) REFERENCES `arquivos` (`idarquivos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ata1_idarquivo` FOREIGN KEY (`ata1_idarquivos`) REFERENCES `arquivos` (`idarquivos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ata2_idarquivo` FOREIGN KEY (`ata2_idarquivos`) REFERENCES `arquivos` (`idarquivos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `campus_idcampus` FOREIGN KEY (`campus_idcampus`) REFERENCES `campus` (`idcampus`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `eixo_ideixo` FOREIGN KEY (`eixo_ideixo`) REFERENCES `eixo` (`ideixo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `professor_idprofessor` FOREIGN KEY (`professor_idprofessor`) REFERENCES `professor` (`idprofessor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=0;
CREATE TABLE `coordenador` (
  `campus_idcampus` int(11) NOT NULL,
  `professor_idprofessor` int(11) NOT NULL,
  `eixo_ideixo` int(11) NOT NULL,
  PRIMARY KEY (`campus_idcampus`,`professor_idprofessor`,`eixo_ideixo`),
  KEY `fk_campus_has_professor_professor1_idx` (`professor_idprofessor`),
  KEY `fk_campus_has_professor_campus_idx` (`campus_idcampus`),
  KEY `fk_coordenador_eixo1_idx` (`eixo_ideixo`),
  CONSTRAINT `fk_campus_has_professor_campus` FOREIGN KEY (`campus_idcampus`) REFERENCES `campus` (`idcampus`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_campus_has_professor_professor1` FOREIGN KEY (`professor_idprofessor`) REFERENCES `professor` (`idprofessor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_coordenador_eixo1` FOREIGN KEY (`eixo_ideixo`) REFERENCES `eixo` (`ideixo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB;
CREATE TABLE `rpv`.`edital` (
  `idedital` INT NOT NULL AUTO_INCREMENT,
  `nomeEdital` VARCHAR(45) NOT NULL,
  `dataInicioEdital` DATE NOT NULL,
  `dataFimEdital` DATE NOT NULL,
  `eixo_ideixo` INT NULL,
  `arquivos_idarquivos` INT NULL,
  PRIMARY KEY (`idedital`),
  INDEX `arquivo_idx` (`arquivos_idarquivos` ASC),
  INDEX `eixo_idx` (`eixo_ideixo` ASC),
  CONSTRAINT `eixo`
    FOREIGN KEY (`eixo_ideixo`)
    REFERENCES `rpv`.`eixo` (`ideixo`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `arquivo`
    FOREIGN KEY (`arquivos_idarquivos`)
    REFERENCES `rpv`.`arquivos` (`idarquivos`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;
INSERT INTO `rpv`.`campus` (`idcampus`, `nome`) VALUES ('1', 'Alegrete');
INSERT INTO `rpv`.`campus` (`idcampus`, `nome`) VALUES ('2', 'Bagé');
INSERT INTO `rpv`.`campus` (`idcampus`, `nome`) VALUES ('3', 'Caçapava do Sul');
INSERT INTO `rpv`.`campus` (`idcampus`, `nome`) VALUES ('4', 'Dom Pedrito');
INSERT INTO `rpv`.`campus` (`idcampus`, `nome`) VALUES ('5', 'Itaqui');
INSERT INTO `rpv`.`campus` (`idcampus`, `nome`) VALUES ('6', 'Jaguarão');
INSERT INTO `rpv`.`campus` (`idcampus`, `nome`) VALUES ('7', 'Santana do Livramento');
INSERT INTO `rpv`.`campus` (`idcampus`, `nome`) VALUES ('8', 'São Borja');
INSERT INTO `rpv`.`campus` (`idcampus`, `nome`) VALUES ('9', 'São Gabriel');
INSERT INTO `rpv`.`campus` (`idcampus`, `nome`) VALUES ('10', 'Uruguaiana');
INSERT INTO `rpv`.`eixo` (`ideixo`, `tipo`) VALUES ('1', 'Ensino');
INSERT INTO `rpv`.`eixo` (`ideixo`, `tipo`) VALUES ('2', 'Pesquisa');
INSERT INTO `rpv`.`eixo` (`ideixo`, `tipo`) VALUES ('3', 'Extensão');
INSERT INTO `rpv`.`usuario` (`idusuario`, `login`, `senha`) VALUES ('1', 'coordenador', 'coordenador');
INSERT INTO `rpv`.`usuario` (`idusuario`, `login`, `senha`) VALUES ('2', 'professor1', 'professor1');
INSERT INTO `rpv`.`usuario` (`idusuario`, `login`, `senha`) VALUES ('3', 'professor2', 'professor2');
INSERT INTO `rpv`.`usuario` (`idusuario`, `login`, `senha`) VALUES ('4', 'proreitor', 'proreitor');
INSERT INTO `rpv`.`professor` (`idprofessor`, `nome`, `campus`, `usuario_idusuario`, `proreitor`) VALUES ('1', 'Coordenador', '1', '1', '0');
INSERT INTO `rpv`.`professor` (`idprofessor`, `nome`, `campus`, `usuario_idusuario`, `proreitor`) VALUES ('2', 'Professor 1', '1', '2', '0');
INSERT INTO `rpv`.`professor` (`idprofessor`, `nome`, `campus`, `usuario_idusuario`, `proreitor`) VALUES ('3', 'Professor 2', '1', '3', '0');
INSERT INTO `rpv`.`professor` (`idprofessor`, `nome`, `campus`, `usuario_idusuario`, `proreitor`) VALUES ('4', 'ProReitor', '1', '4', '1');
INSERT INTO `rpv`.`coordenador` (`campus_idcampus`, `professor_idprofessor`, `eixo_ideixo`) VALUES ('1', '1', '1');