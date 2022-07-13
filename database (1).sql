-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 12-Jul-2022 às 21:58
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `database`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `estoque`
--

CREATE TABLE `estoque` (
  `Cód_prod` int(8) NOT NULL,
  `loj_prod` int(8) NOT NULL,
  `qtd_prod` decimal(15,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `lojas`
--

CREATE TABLE `lojas` (
  `loj_prod` int(11) NOT NULL,
  `desc_loj` char(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `cod_prod` int(8) NOT NULL,
  `loj_prod` int(8) NOT NULL,
  `desc_prod` char(40) NOT NULL,
  `dt_inclu_prod` date NOT NULL,
  `preco_prod` decimal(8,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`cod_prod`, `loj_prod`, `desc_prod`, `dt_inclu_prod`, `preco_prod`) VALUES
(170, 2, 'LEITE CONDESADO MOCOCA', '2010-12-30', '95.400');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `estoque`
--
ALTER TABLE `estoque`
  ADD PRIMARY KEY (`Cód_prod`,`loj_prod`),
  ADD KEY `loj_prod` (`loj_prod`);

--
-- Índices para tabela `lojas`
--
ALTER TABLE `lojas`
  ADD PRIMARY KEY (`loj_prod`);

--
-- Índices para tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`cod_prod`,`loj_prod`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `lojas`
--
ALTER TABLE `lojas`
  MODIFY `loj_prod` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `estoque`
--
ALTER TABLE `estoque`
  ADD CONSTRAINT `estoque_ibfk_1` FOREIGN KEY (`loj_prod`) REFERENCES `lojas` (`loj_prod`),
  ADD CONSTRAINT `estoque_ibfk_2` FOREIGN KEY (`Cód_prod`) REFERENCES `produtos` (`cod_prod`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
