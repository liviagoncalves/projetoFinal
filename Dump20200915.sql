CREATE DATABASE  IF NOT EXISTS `mbfashionfinal` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `mbfashionfinal`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mbfashionfinal
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.11-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `idcategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Blusas'),(3,'Vestido'),(4,'Shorts'),(5,'Calça');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `idcliente` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `rg` varchar(20) DEFAULT NULL,
  `data_nasc` date NOT NULL,
  `sexo` int(1) NOT NULL,
  `telefone` varchar(14) DEFAULT NULL,
  `cep` varchar(10) DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `complemento` varchar(45) DEFAULT NULL,
  `bairro` varchar(45) DEFAULT NULL,
  `cidade` varchar(45) DEFAULT NULL,
  `uf` varchar(45) DEFAULT NULL,
  `cliente_desde` date NOT NULL,
  `fidelidade` int(1) NOT NULL,
  `promocao` int(1) NOT NULL,
  PRIMARY KEY (`idcliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Livia Gonçalves Morais','livia@gmail.com','357.587.784-89','','1986-09-18',1,'','','',0,'','','','','2020-08-18',1,2),(2,'Paulo dos Santos Ribeiro','paulo@gmail.com','456.789.575-58','','1986-05-10',2,'','72.215-219','QNM 21 Conjunto I',18,'','Ceilândia Sul (Ceilândia)','Brasília','DF','2020-01-25',1,1),(5,'Maria Cecilia dos Santos','maria@gmail.com','123.456.324-85','','1975-08-10',1,'','71.995-320','SHA Conjunto 5 Chácara 89-3',18,'','Águas Claras','Brasília','DF','2012-04-05',1,1);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cor`
--

DROP TABLE IF EXISTS `cor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cor` (
  `idcor` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`idcor`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cor`
--

LOCK TABLES `cor` WRITE;
/*!40000 ALTER TABLE `cor` DISABLE KEYS */;
INSERT INTO `cor` VALUES (1,'Preto'),(2,'Off-White');
/*!40000 ALTER TABLE `cor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fornecedor` (
  `idfornecedor` int(11) NOT NULL AUTO_INCREMENT,
  `razao_social` varchar(100) NOT NULL,
  `cnpj` varchar(18) NOT NULL,
  `inscricao_estadual` varchar(45) DEFAULT NULL,
  `telefone` varchar(14) NOT NULL,
  `cep` varchar(10) DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `complemento` varchar(45) DEFAULT NULL,
  `bairro` varchar(45) DEFAULT NULL,
  `cidade` varchar(45) DEFAULT NULL,
  `uf` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idfornecedor`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
INSERT INTO `fornecedor` VALUES (1,'Vestidos Atadados LTDA','12.518.587/0001-89','','(61)98747-8945','71.951-780','Avenida Arniqueira QS 01',565,'','Areal (Águas Claras)','Brasília','DF'),(3,'MS roupas','11.212.520/0015-55','','(61)35258-5985','71.995-305','SHA Conjunto 5 Chácara 49',1,'','Setor Habitacional Arniqueira (Águas Claras)','Brasília','DF');
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itens_de_venda`
--

DROP TABLE IF EXISTS `itens_de_venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itens_de_venda` (
  `idvendas` int(11) NOT NULL,
  `idproduto` int(11) NOT NULL,
  `vlr_venda` double NOT NULL,
  `qtde` int(11) NOT NULL,
  PRIMARY KEY (`idvendas`,`idproduto`),
  KEY `fk_vendas_has_produto_produto1_idx` (`idproduto`),
  KEY `fk_vendas_has_produto_vendas1_idx` (`idvendas`),
  CONSTRAINT `fk_vendas_has_produto_produto1` FOREIGN KEY (`idproduto`) REFERENCES `produto` (`idproduto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_vendas_has_produto_vendas1` FOREIGN KEY (`idvendas`) REFERENCES `vendas` (`idvendas`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itens_de_venda`
--

LOCK TABLES `itens_de_venda` WRITE;
/*!40000 ALTER TABLE `itens_de_venda` DISABLE KEYS */;
INSERT INTO `itens_de_venda` VALUES (1,2,80,2),(1,5,100,2);
/*!40000 ALTER TABLE `itens_de_venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marca` (
  `idmarca` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`idmarca`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (1,'test');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `idmenu` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `link` varchar(100) NOT NULL,
  `icone` varchar(45) DEFAULT NULL,
  `exibir` int(11) NOT NULL,
  PRIMARY KEY (`idmenu`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'Home','index.jsp',NULL,1),(2,'Perfil','listar_perfil.jsp',NULL,1),(3,'Menu','listar_menu.jsp',NULL,1),(4,'Cadastrar perfil','form_perfil.jsp',NULL,2),(5,'Alterar Perfil','gerenciar_perfil.do?acao=alterar',NULL,2),(6,'Excluir Perfil','gerenciar_perfil.do?acao=excluir','',2),(7,'Acessos','gerenciar_menu_perfil.do?acao=gerenciar',NULL,2),(8,'Formulário Acessos','form_menu_perfil.jsp',NULL,2),(9,'Desvincular Menu','gerenciar_menu_perfil.do?acao=desvincular',NULL,2),(10,'Cadastrar Menu','form_menu.jsp',NULL,2),(11,'Alterar Menu','gerenciar_menu.do?acao=alterar',NULL,2),(12,'Excluir Menu','gerenciar_menu.do?acao=excluir','',2),(13,'Usuário','listar_usuario.jsp','',1),(14,'Cadastrar Usuário','form_usuario.jsp','',2),(15,'Alterar Usuário','gerenciar_usuario.do?acao=alterar','',2),(16,'Desativar Usuário','gerenciar_usuario.do?acao=excluir','',2),(17,'Cliente','listar_cliente.jsp',NULL,1),(18,'Cadastrar Cliente','form_cliente.jsp','',2),(19,'Alterar Cliente','gerenciar_cliente.do?acao=alterar','',2),(20,'Excluir Cliente','gerenciar_cliente.do?acao=excluir','',2),(21,'Produto','listar_produto.jsp','',1),(22,'Cadastrar Produto','form_produto.jsp','',2),(23,'Alterar Produto','gerenciar_produto.do?acao=alterar','',2),(24,'Excluir Produto','gerenciar_produto.do?acao=excluir','',2),(25,'Fornecedor','listar_fornecedor.jsp','',1),(26,'Cadastrar Fornecedor','form_fornecedor.jsp','',2),(27,'Alterar Fornecedor','gerenciar_fornecedor.do?acao=alterar','',2),(28,'Excluir Fornecedor','gerenciar_fornecedor.do?acao=excluir','',2),(29,'Vendas','listar_vendas.jsp','',1),(30,'Cadastrar Vendas','form_vendas.jsp','',2),(31,'Alterar Vendas','gerenciar_vendas.do?acao=alterar','',2),(32,'Cancelar Venda','gerenciar_vendas.do?acao=excluir','',2),(37,'Categoria','listar_categoria.jsp','',1),(38,'Cadastrar Categoria','form_categoria.jsp','',2),(39,'Alterar Categoria','gerenciar_categoria.do?acao=alterar','',2),(40,'Excluir Categoria','gerenciar_categoria.do?acao=excluir','',2),(41,'Cor','listar_cor.jsp','',1),(42,'Cadastrar Cor','form_cor.jsp','',2),(43,'Alterar Cor','gerenciar_cor.do?acao=alterar',NULL,2),(44,'Excluir Cor','gerenciar_cor.do?acao=excluir',NULL,2),(45,'Tamanho','listar_tamanho.jsp',NULL,1),(46,'Cadastrar Tamanho','form_tamanho.jsp',NULL,2),(47,'Alterar Tamanho','gerenciar_tamanho.do?acao=alterar',NULL,2),(48,'Excluir Tamanho','gerenciar_tamanho.do?acao=excluir',NULL,2),(49,'Marca','listar_marca.jsp',NULL,1),(50,'Cadastrar Marca','form_marca.jsp',NULL,2),(51,'Alterar Marca','gerenciar_marca.do?acao=alterar',NULL,2),(52,'Excluir Marca','gerenciar_marca.do?acao=excluir',NULL,2),(53,'Realizar venda','form_vendas.jsp?acao=novo','',2),(54,'Continuar Vendendo jsp','form_vendas.jps?acao=c','',2),(55,'Finalizar Venda jsp','form_finalizar_venda.jsp','',2);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_perfil`
--

DROP TABLE IF EXISTS `menu_perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_perfil` (
  `idmenu` int(11) NOT NULL,
  `idperfil` int(11) NOT NULL,
  PRIMARY KEY (`idmenu`,`idperfil`),
  KEY `fk_menu_has_perfil_perfil1_idx` (`idperfil`),
  KEY `fk_menu_has_perfil_menu_idx` (`idmenu`),
  CONSTRAINT `fk_menu_has_perfil_menu` FOREIGN KEY (`idmenu`) REFERENCES `menu` (`idmenu`) ON UPDATE CASCADE,
  CONSTRAINT `fk_menu_has_perfil_perfil1` FOREIGN KEY (`idperfil`) REFERENCES `perfil` (`idperfil`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_perfil`
--

LOCK TABLES `menu_perfil` WRITE;
/*!40000 ALTER TABLE `menu_perfil` DISABLE KEYS */;
INSERT INTO `menu_perfil` VALUES (1,1),(1,2),(1,4),(2,1),(2,4),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(18,2),(19,1),(19,2),(20,1),(20,2),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(29,2),(30,1),(30,2),(31,1),(31,2),(32,1),(32,2),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(40,1),(41,1),(42,1),(43,1),(44,1),(45,1),(46,1),(47,1),(48,1),(49,1),(50,1),(51,1),(52,1),(53,1),(54,1),(55,1);
/*!40000 ALTER TABLE `menu_perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfil`
--

DROP TABLE IF EXISTS `perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perfil` (
  `idperfil` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`idperfil`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil`
--

LOCK TABLES `perfil` WRITE;
/*!40000 ALTER TABLE `perfil` DISABLE KEYS */;
INSERT INTO `perfil` VALUES (1,'Administrador'),(2,'Vendedor'),(4,'Gerente'),(7,'Caixa');
/*!40000 ALTER TABLE `perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto` (
  `idproduto` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) NOT NULL,
  `vlr_compra` double NOT NULL,
  `vlr_venda` double NOT NULL,
  `qtde` int(11) NOT NULL,
  `idfornecedor` int(11) NOT NULL,
  `idcategoria` int(11) NOT NULL,
  `idcor` int(11) NOT NULL,
  `idtamanho` int(11) NOT NULL,
  `idmarca` int(11) DEFAULT NULL,
  PRIMARY KEY (`idproduto`),
  KEY `fk_produto_fornecedor1_idx` (`idfornecedor`),
  KEY `fk_produto_categoria1_idx` (`idcategoria`),
  KEY `fk_produto_cor1_idx` (`idcor`),
  KEY `fk_produto_tamanho1_idx` (`idtamanho`),
  KEY `fk_produto_marca1_idx` (`idmarca`),
  CONSTRAINT `fk_produto_categoria1` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`idcategoria`) ON UPDATE CASCADE,
  CONSTRAINT `fk_produto_cor1` FOREIGN KEY (`idcor`) REFERENCES `cor` (`idcor`) ON UPDATE CASCADE,
  CONSTRAINT `fk_produto_fornecedor1` FOREIGN KEY (`idfornecedor`) REFERENCES `fornecedor` (`idfornecedor`) ON UPDATE CASCADE,
  CONSTRAINT `fk_produto_marca1` FOREIGN KEY (`idmarca`) REFERENCES `marca` (`idmarca`) ON UPDATE CASCADE,
  CONSTRAINT `fk_produto_tamanho1` FOREIGN KEY (`idtamanho`) REFERENCES `tamanho` (`idtamanho`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'Regata Renda',2,100,5,1,1,2,1,1),(2,'Blusa Podrinha Renda',2,80,10,1,1,1,3,1),(5,'Short Linho Bolso',22.99,100,15,1,1,1,2,1),(7,'Short Linho',22.99,112.5,10,3,5,2,3,1);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tamanho`
--

DROP TABLE IF EXISTS `tamanho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tamanho` (
  `idtamanho` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`idtamanho`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tamanho`
--

LOCK TABLES `tamanho` WRITE;
/*!40000 ALTER TABLE `tamanho` DISABLE KEYS */;
INSERT INTO `tamanho` VALUES (1,'P'),(2,'M'),(3,'G');
/*!40000 ALTER TABLE `tamanho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `login` varchar(45) NOT NULL,
  `senha` varchar(45) NOT NULL,
  `status` int(11) NOT NULL,
  `idperfil` int(11) NOT NULL,
  PRIMARY KEY (`idusuario`),
  KEY `fk_usuario_perfil1_idx` (`idperfil`),
  CONSTRAINT `fk_usuario_perfil1` FOREIGN KEY (`idperfil`) REFERENCES `perfil` (`idperfil`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Lívia','livia','1',1,1),(2,'teste','teste','1',1,4),(3,'Paulo','paulo','1',1,2);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendas`
--

DROP TABLE IF EXISTS `vendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendas` (
  `idvendas` int(11) NOT NULL AUTO_INCREMENT,
  `data_venda` date NOT NULL,
  `vlr_total` double NOT NULL,
  `idusuario` int(11) NOT NULL,
  `idcliente` int(11) NOT NULL,
  PRIMARY KEY (`idvendas`),
  KEY `fk_vendas_usuario1_idx` (`idusuario`),
  KEY `fk_vendas_cliente1_idx` (`idcliente`),
  CONSTRAINT `fk_vendas_cliente1` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`idcliente`) ON UPDATE CASCADE,
  CONSTRAINT `fk_vendas_usuario1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendas`
--

LOCK TABLES `vendas` WRITE;
/*!40000 ALTER TABLE `vendas` DISABLE KEYS */;
INSERT INTO `vendas` VALUES (1,'2020-09-13',0,1,5);
/*!40000 ALTER TABLE `vendas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-15  8:56:14
