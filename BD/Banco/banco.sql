-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 10/03/2026 às 00:05
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `loja_pdv`
--
DROP DATABASE IF EXISTS `modelo_db3`;
CREATE DATABASE IF NOT EXISTS `modelo_db3` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `modelo_db3`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE `cliente` (
  `cod_cli` smallint(6) NOT NULL,
  `nome_cli` varchar(40) NOT NULL,
  `endereco` varchar(40) DEFAULT NULL,
  `cidade` varchar(20) DEFAULT NULL,
  `cep` char(8) DEFAULT NULL,
  `uf` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`cod_cli`, `nome_cli`, `endereco`, `cidade`, `cep`, `uf`) VALUES
(1000, 'Supermercado Carrefour', 'Av. das Americas', 'rio de janeiro', '20000001', 'rj'),
(2000, 'Supermercado Baratao', 'Rua 7 de setembro', 'rio de janeiro', '20000002', 'rj'),
(3000, 'Supermercado Arariboia', 'Rua Itaoca', 'niteroi', '20000003', 'rj'),
(4000, 'Mercado São João', 'Cidade Univers.', 'niteroi', '20000004', 'rj'),
(5000, 'CSN', 'Rua das Nações', 'volta redonda', '20000005', 'rj'),
(6000, 'Pegeout', 'Rodovia Pres. Dutra', 'resende', '20000006', 'rj'),
(7000, 'Lojas Pague Pouco', 'Rua Tuiuti', 'sao paulo', '11000001', 'sp'),
(8000, 'Ford Caminhoes', 'Rua Henry Ford', 'sao paulo', '11000002', 'sp'),
(9000, 'Célula Celulose', 'Rua Gen. Arouca', 'guaiba', '30000001', 'rs'),
(10000, 'Elevadores RioSul', 'Rua Planejada', 'guaiba', '30000001', 'rs');

-- --------------------------------------------------------

--
-- Estrutura para tabela `item_pedido`
--

DROP TABLE IF EXISTS `item_pedido`;
CREATE TABLE `item_pedido` (
  `no_ped` smallint(6) NOT NULL,
  `cd_prod` smallint(6) NOT NULL,
  `qtd_ped` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `item_pedido`
--

INSERT INTO `item_pedido` (`no_ped`, `cd_prod`, `qtd_ped`) VALUES
(1111, 100, 100),
(1111, 200, 100),
(1111, 300, 200),
(1112, 400, 100),
(1112, 500, 1000),
(1113, 100, 300),
(2111, 100, 500),
(2111, 500, 400),
(2112, 200, 100),
(2112, 300, 200),
(2113, 500, 500),
(3111, 400, 300),
(3112, 100, 400),
(3112, 200, 600),
(4111, 300, 700),
(4112, 500, 1000),
(4112, 200, 500),
(5111, 200, 100),
(5111, 300, 500),
(6111, 400, 100),
(6112, 300, 400),
(6112, 400, 200),
(7111, 100, 500);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedido`
--

DROP TABLE IF EXISTS `pedido`;
CREATE TABLE `pedido` (
  `num_ped` smallint(6) NOT NULL,
  `prazo_entr` smallint(6) NOT NULL,
  `cd_cli` smallint(6) NOT NULL,
  `cd_vend` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `pedido`
--

INSERT INTO `pedido` (`num_ped`, `prazo_entr`, `cd_cli`, `cd_vend`) VALUES
(1111, 10, 1000, 11),
(1112, 5, 1000, 11),
(1113, 30, 1000, 15),
(2111, 15, 3000, 14),
(2112, 18, 3000, 15),
(2113, 3, 3000, 12),
(3111, 13, 4000, 12),
(3112, 7, 4000, 11),
(4111, 7, 6000, 11),
(4112, 7, 6000, 14),
(5111, 10, 8000, 14),
(6111, 30, 9000, 14),
(6112, 60, 9000, 12),
(7111, 20, 10000, 15);

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto`
--

DROP TABLE IF EXISTS `produto`;
CREATE TABLE `produto` (
  `cod_prod` smallint(6) NOT NULL,
  `unid_prod` char(3) NOT NULL,
  `desc_prod` varchar(20) NOT NULL,
  `val_unit` double(9,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `produto`
--

INSERT INTO `produto` (`cod_prod`, `unid_prod`, `desc_prod`, `val_unit`) VALUES
(100, 'kg', 'Chapa de Aco', 2.50),
(200, 'kg', 'Cimento', 4.50),
(300, 'kg', 'parafuso 3.0X10.5 mm', 2.00),
(400, 'm', 'Fio plastico', 2.00),
(500, 'l', 'Solvente PRW', 5.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `vendedor`
--

DROP TABLE IF EXISTS `vendedor`;
CREATE TABLE `vendedor` (
  `cod_vend` smallint(6) NOT NULL,
  `nome_vend` varchar(40) NOT NULL,
  `sal_fixo` double(9,2) NOT NULL,
  `faixa_comiss` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `vendedor`
--

INSERT INTO `vendedor` (`cod_vend`, `nome_vend`, `sal_fixo`, `faixa_comiss`) VALUES
(11, 'Paulo Alberto', 1500.00, 'b'),
(12, 'Ana Cristina', 2100.00, 'a'),
(13, 'Cassia Andrade', 900.00, 'c'),
(14, 'João Roberto', 2500.00, 'a'),
(15, 'Maria Paula', 900.00, 'c');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cod_cli`);

--
-- Índices de tabela `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`num_ped`);

--
-- Índices de tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`cod_prod`);

--
-- Índices de tabela `vendedor`
--
ALTER TABLE `vendedor`
  ADD PRIMARY KEY (`cod_vend`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;