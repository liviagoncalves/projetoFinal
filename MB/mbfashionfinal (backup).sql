-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 14-Set-2020 às 01:34
-- Versão do servidor: 10.4.11-MariaDB
-- versão do PHP: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `mbfashionfinal`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

CREATE TABLE `categoria` (
  `idcategoria` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `categoria`
--

INSERT INTO `categoria` (`idcategoria`, `nome`) VALUES
(1, 'Blusas'),
(3, 'Vestido'),
(4, 'Shorts'),
(5, 'Calça');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `idcliente` int(11) NOT NULL,
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
  `promocao` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`idcliente`, `nome`, `email`, `cpf`, `rg`, `data_nasc`, `sexo`, `telefone`, `cep`, `endereco`, `numero`, `complemento`, `bairro`, `cidade`, `uf`, `cliente_desde`, `fidelidade`, `promocao`) VALUES
(1, 'Livia Gonçalves Morais', 'livia@gmail.com', '357.587.784-89', '', '1986-09-18', 1, '', '', '', 0, '', '', '', '', '2020-08-18', 1, 2),
(2, 'Paulo dos Santos Ribeiro', 'paulo@gmail.com', '456.789.575-58', '', '1986-05-10', 2, '', '72.215-219', 'QNM 21 Conjunto I', 18, '', 'Ceilândia Sul (Ceilândia)', 'Brasília', 'DF', '2020-01-25', 1, 1),
(5, 'Maria Cecilia dos Santos', 'maria@gmail.com', '123.456.324-85', '', '1975-08-10', 1, '', '71.995-320', 'SHA Conjunto 5 Chácara 89-3', 18, '', 'Águas Claras', 'Brasília', 'DF', '2012-04-05', 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cor`
--

CREATE TABLE `cor` (
  `idcor` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cor`
--

INSERT INTO `cor` (`idcor`, `nome`) VALUES
(1, 'Preto'),
(2, 'Off-White');

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedor`
--

CREATE TABLE `fornecedor` (
  `idfornecedor` int(11) NOT NULL,
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
  `uf` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `fornecedor`
--

INSERT INTO `fornecedor` (`idfornecedor`, `razao_social`, `cnpj`, `inscricao_estadual`, `telefone`, `cep`, `endereco`, `numero`, `complemento`, `bairro`, `cidade`, `uf`) VALUES
(1, 'Vestidos Atadados LTDA', '12.518.587/0001-89', '', '(61)98747-8945', '71.951-780', 'Avenida Arniqueira QS 01', 565, '', 'Areal (Águas Claras)', 'Brasília', 'DF'),
(3, 'MS roupas', '11.212.520/0015-55', '', '(61)35258-5985', '71.995-305', 'SHA Conjunto 5 Chácara 49', 1, '', 'Setor Habitacional Arniqueira (Águas Claras)', 'Brasília', 'DF');

-- --------------------------------------------------------

--
-- Estrutura da tabela `itens_de_venda`
--

CREATE TABLE `itens_de_venda` (
  `idvendas` int(11) NOT NULL,
  `idproduto` int(11) NOT NULL,
  `vlr_venda` double NOT NULL,
  `qtde` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `itens_de_venda`
--

INSERT INTO `itens_de_venda` (`idvendas`, `idproduto`, `vlr_venda`, `qtde`) VALUES
(1, 2, 80, 2),
(1, 5, 100, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `marca`
--

CREATE TABLE `marca` (
  `idmarca` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `marca`
--

INSERT INTO `marca` (`idmarca`, `nome`) VALUES
(1, 'test');

-- --------------------------------------------------------

--
-- Estrutura da tabela `menu`
--

CREATE TABLE `menu` (
  `idmenu` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `link` varchar(100) NOT NULL,
  `icone` varchar(45) DEFAULT NULL,
  `exibir` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `menu`
--

INSERT INTO `menu` (`idmenu`, `nome`, `link`, `icone`, `exibir`) VALUES
(1, 'Home', 'index.jsp', NULL, 1),
(2, 'Perfil', 'listar_perfil.jsp', NULL, 1),
(3, 'Menu', 'listar_menu.jsp', NULL, 1),
(4, 'Cadastrar perfil', 'form_perfil.jsp', NULL, 2),
(5, 'Alterar Perfil', 'gerenciar_perfil.do?acao=alterar', NULL, 2),
(6, 'Excluir Perfil', 'gerenciar_perfil.do?acao=excluir', '', 2),
(7, 'Acessos', 'gerenciar_menu_perfil.do?acao=gerenciar', NULL, 2),
(8, 'Formulário Acessos', 'form_menu_perfil.jsp', NULL, 2),
(9, 'Desvincular Menu', 'gerenciar_menu_perfil.do?acao=desvincular', NULL, 2),
(10, 'Cadastrar Menu', 'form_menu.jsp', NULL, 2),
(11, 'Alterar Menu', 'gerenciar_menu.do?acao=alterar', NULL, 2),
(12, 'Excluir Menu', 'gerenciar_menu.do?acao=excluir', '', 2),
(13, 'Usuário', 'listar_usuario.jsp', '', 1),
(14, 'Cadastrar Usuário', 'form_usuario.jsp', '', 2),
(15, 'Alterar Usuário', 'gerenciar_usuario.do?acao=alterar', '', 2),
(16, 'Desativar Usuário', 'gerenciar_usuario.do?acao=excluir', '', 2),
(17, 'Cliente', 'listar_cliente.jsp', NULL, 1),
(18, 'Cadastrar Cliente', 'form_cliente.jsp', '', 2),
(19, 'Alterar Cliente', 'gerenciar_cliente.do?acao=alterar', '', 2),
(20, 'Excluir Cliente', 'gerenciar_cliente.do?acao=excluir', '', 2),
(21, 'Produto', 'listar_produto.jsp', '', 1),
(22, 'Cadastrar Produto', 'form_produto.jsp', '', 2),
(23, 'Alterar Produto', 'gerenciar_produto.do?acao=alterar', '', 2),
(24, 'Excluir Produto', 'gerenciar_produto.do?acao=excluir', '', 2),
(25, 'Fornecedor', 'listar_fornecedor.jsp', '', 1),
(26, 'Cadastrar Fornecedor', 'form_fornecedor.jsp', '', 2),
(27, 'Alterar Fornecedor', 'gerenciar_fornecedor.do?acao=alterar', '', 2),
(28, 'Excluir Fornecedor', 'gerenciar_fornecedor.do?acao=excluir', '', 2),
(29, 'Vendas', 'listar_vendas.jsp', '', 1),
(30, 'Cadastrar Vendas', 'form_vendas.jsp', '', 2),
(31, 'Alterar Vendas', 'gerenciar_vendas.do?acao=alterar', '', 2),
(32, 'Cancelar Venda', 'gerenciar_vendas.do?acao=excluir', '', 2),
(37, 'Categoria', 'listar_categoria.jsp', '', 1),
(38, 'Cadastrar Categoria', 'form_categoria.jsp', '', 2),
(39, 'Alterar Categoria', 'gerenciar_categoria.do?acao=alterar', '', 2),
(40, 'Excluir Categoria', 'gerenciar_categoria.do?acao=excluir', '', 2),
(41, 'Cor', 'listar_cor.jsp', '', 1),
(42, 'Cadastrar Cor', 'form_cor.jsp', '', 2),
(43, 'Alterar Cor', 'gerenciar_cor.do?acao=alterar', NULL, 2),
(44, 'Excluir Cor', 'gerenciar_cor.do?acao=excluir', NULL, 2),
(45, 'Tamanho', 'listar_tamanho.jsp', NULL, 1),
(46, 'Cadastrar Tamanho', 'form_tamanho.jsp', NULL, 2),
(47, 'Alterar Tamanho', 'gerenciar_tamanho.do?acao=alterar', NULL, 2),
(48, 'Excluir Tamanho', 'gerenciar_tamanho.do?acao=excluir', NULL, 2),
(49, 'Marca', 'listar_marca.jsp', NULL, 1),
(50, 'Cadastrar Marca', 'form_marca.jsp', NULL, 2),
(51, 'Alterar Marca', 'gerenciar_marca.do?acao=alterar', NULL, 2),
(52, 'Excluir Marca', 'gerenciar_marca.do?acao=excluir', NULL, 2),
(53, 'Realizar venda', 'form_vendas.jsp?acao=novo', '', 2),
(54, 'Continuar Vendendo jsp', 'form_vendas.jps?acao=c', '', 2),
(55, 'Finalizar Venda jsp', 'form_finalizar_venda.jsp', '', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `menu_perfil`
--

CREATE TABLE `menu_perfil` (
  `idmenu` int(11) NOT NULL,
  `idperfil` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `menu_perfil`
--

INSERT INTO `menu_perfil` (`idmenu`, `idperfil`) VALUES
(1, 1),
(1, 2),
(1, 4),
(2, 1),
(2, 4),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(18, 2),
(19, 1),
(19, 2),
(20, 1),
(20, 2),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(29, 2),
(30, 1),
(30, 2),
(31, 1),
(31, 2),
(32, 1),
(32, 2),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `perfil`
--

CREATE TABLE `perfil` (
  `idperfil` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `perfil`
--

INSERT INTO `perfil` (`idperfil`, `nome`) VALUES
(1, 'Administrador'),
(2, 'Vendedor'),
(4, 'Gerente'),
(7, 'Caixa');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `idproduto` int(11) NOT NULL,
  `descricao` varchar(45) NOT NULL,
  `vlr_compra` double NOT NULL,
  `vlr_venda` double NOT NULL,
  `qtde` int(11) NOT NULL,
  `idfornecedor` int(11) NOT NULL,
  `idcategoria` int(11) NOT NULL,
  `idcor` int(11) NOT NULL,
  `idtamanho` int(11) NOT NULL,
  `idmarca` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`idproduto`, `descricao`, `vlr_compra`, `vlr_venda`, `qtde`, `idfornecedor`, `idcategoria`, `idcor`, `idtamanho`, `idmarca`) VALUES
(1, 'Regata Renda', 2, 100, 5, 1, 1, 2, 1, 1),
(2, 'Blusa Podrinha Renda', 2, 80, 10, 1, 1, 1, 3, 1),
(5, 'Short Linho Bolso', 22.99, 100, 15, 1, 1, 1, 2, 1),
(7, 'Short Linho', 22.99, 112.5, 10, 3, 5, 2, 3, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tamanho`
--

CREATE TABLE `tamanho` (
  `idtamanho` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tamanho`
--

INSERT INTO `tamanho` (`idtamanho`, `nome`) VALUES
(1, 'P'),
(2, 'M'),
(3, 'G');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `login` varchar(45) NOT NULL,
  `senha` varchar(45) NOT NULL,
  `status` int(11) NOT NULL,
  `idperfil` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`idusuario`, `nome`, `login`, `senha`, `status`, `idperfil`) VALUES
(1, 'Lívia', 'livia', '1', 1, 1),
(2, 'teste', 'teste', '1', 1, 4),
(3, 'Paulo', 'paulo', '1', 1, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendas`
--

CREATE TABLE `vendas` (
  `idvendas` int(11) NOT NULL,
  `data_venda` date NOT NULL,
  `vlr_total` double NOT NULL,
  `idusuario` int(11) NOT NULL,
  `idcliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `vendas`
--

INSERT INTO `vendas` (`idvendas`, `data_venda`, `vlr_total`, `idusuario`, `idcliente`) VALUES
(1, '2020-09-13', 0, 1, 5);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idcategoria`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idcliente`);

--
-- Índices para tabela `cor`
--
ALTER TABLE `cor`
  ADD PRIMARY KEY (`idcor`);

--
-- Índices para tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD PRIMARY KEY (`idfornecedor`);

--
-- Índices para tabela `itens_de_venda`
--
ALTER TABLE `itens_de_venda`
  ADD PRIMARY KEY (`idvendas`,`idproduto`),
  ADD KEY `fk_vendas_has_produto_produto1_idx` (`idproduto`),
  ADD KEY `fk_vendas_has_produto_vendas1_idx` (`idvendas`);

--
-- Índices para tabela `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`idmarca`);

--
-- Índices para tabela `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`idmenu`);

--
-- Índices para tabela `menu_perfil`
--
ALTER TABLE `menu_perfil`
  ADD PRIMARY KEY (`idmenu`,`idperfil`),
  ADD KEY `fk_menu_has_perfil_perfil1_idx` (`idperfil`),
  ADD KEY `fk_menu_has_perfil_menu_idx` (`idmenu`);

--
-- Índices para tabela `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`idperfil`);

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`idproduto`),
  ADD KEY `fk_produto_fornecedor1_idx` (`idfornecedor`),
  ADD KEY `fk_produto_categoria1_idx` (`idcategoria`),
  ADD KEY `fk_produto_cor1_idx` (`idcor`),
  ADD KEY `fk_produto_tamanho1_idx` (`idtamanho`),
  ADD KEY `fk_produto_marca1_idx` (`idmarca`);

--
-- Índices para tabela `tamanho`
--
ALTER TABLE `tamanho`
  ADD PRIMARY KEY (`idtamanho`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`),
  ADD KEY `fk_usuario_perfil1_idx` (`idperfil`);

--
-- Índices para tabela `vendas`
--
ALTER TABLE `vendas`
  ADD PRIMARY KEY (`idvendas`),
  ADD KEY `fk_vendas_usuario1_idx` (`idusuario`),
  ADD KEY `fk_vendas_cliente1_idx` (`idcliente`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idcategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idcliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `cor`
--
ALTER TABLE `cor`
  MODIFY `idcor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  MODIFY `idfornecedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `marca`
--
ALTER TABLE `marca`
  MODIFY `idmarca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `menu`
--
ALTER TABLE `menu`
  MODIFY `idmenu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT de tabela `perfil`
--
ALTER TABLE `perfil`
  MODIFY `idperfil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `idproduto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `tamanho`
--
ALTER TABLE `tamanho`
  MODIFY `idtamanho` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `vendas`
--
ALTER TABLE `vendas`
  MODIFY `idvendas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `itens_de_venda`
--
ALTER TABLE `itens_de_venda`
  ADD CONSTRAINT `fk_vendas_has_produto_produto1` FOREIGN KEY (`idproduto`) REFERENCES `produto` (`idproduto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_vendas_has_produto_vendas1` FOREIGN KEY (`idvendas`) REFERENCES `vendas` (`idvendas`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `menu_perfil`
--
ALTER TABLE `menu_perfil`
  ADD CONSTRAINT `fk_menu_has_perfil_menu` FOREIGN KEY (`idmenu`) REFERENCES `menu` (`idmenu`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_menu_has_perfil_perfil1` FOREIGN KEY (`idperfil`) REFERENCES `perfil` (`idperfil`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `fk_produto_categoria1` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`idcategoria`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_produto_cor1` FOREIGN KEY (`idcor`) REFERENCES `cor` (`idcor`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_produto_fornecedor1` FOREIGN KEY (`idfornecedor`) REFERENCES `fornecedor` (`idfornecedor`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_produto_marca1` FOREIGN KEY (`idmarca`) REFERENCES `marca` (`idmarca`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_produto_tamanho1` FOREIGN KEY (`idtamanho`) REFERENCES `tamanho` (`idtamanho`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_perfil1` FOREIGN KEY (`idperfil`) REFERENCES `perfil` (`idperfil`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `vendas`
--
ALTER TABLE `vendas`
  ADD CONSTRAINT `fk_vendas_cliente1` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`idcliente`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_vendas_usuario1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
