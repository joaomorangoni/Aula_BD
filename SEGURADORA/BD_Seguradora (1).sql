-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 02-Maio-2024 às 17:33
-- Versão do servidor: 10.4.27-MariaDB
-- versão do PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `seguradora`
--
CREATE DATABASE IF NOT EXISTS `seguradora` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `seguradora`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `carro`
--

CREATE TABLE `carro` (
  `codCarro` int(11) NOT NULL,
  `marca` varchar(30) NOT NULL,
  `modelo` varchar(30) NOT NULL,
  `chassi` varchar(10) DEFAULT NULL,
  `placa` varchar(10) NOT NULL,
  `cor` varchar(30) DEFAULT NULL,
  `porte` varchar(20) DEFAULT NULL,
  `codCliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `carro`
--

INSERT INTO `carro` (`codCarro`, `marca`, `modelo`, `chassi`, `placa`, `cor`, `porte`, `codCliente`) VALUES
(1, 'BMW', 'M2', NULL, '920SP01', 'preta', NULL, 1),
(2, 'Chevrolet', 'Onix', NULL, '104PF09', 'prata', NULL, 2),
(3, 'BMW', 'M5', NULL, '482QP09', 'prata', NULL, 3),
(4, 'Chevrolet', 'Cruze', NULL, 'SHJ0948', 'branca', NULL, 4),
(5, 'BMW', 'M3', NULL, 'JAQ0719', 'azul', NULL, 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `codCliente` int(11) NOT NULL,
  `nome` varchar(108) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `cpf` varchar(15) NOT NULL,
  `rg` varchar(15) NOT NULL,
  `email` varchar(168) NOT NULL,
  `rua` varchar(58) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `compl` varchar(36) DEFAULT NULL,
  `bairro` varchar(30) DEFAULT NULL,
  `cidade` varchar(58) DEFAULT NULL,
  `estado` char(2) DEFAULT NULL,
  `cep` varchar(15) DEFAULT NULL,
  `dataNasc` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`codCliente`, `nome`, `telefone`, `cpf`, `rg`, `email`, `rua`, `num`, `compl`, `bairro`, `cidade`, `estado`, `cep`, `dataNasc`) VALUES
(1, 'Brayan Almeida', '12345-1234', '867.960.504-45', '32.253.864-1', 'Brayan.gay@gmail.com.br', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-04-06'),
(2, 'Flavin do pneu', '23456-6925', '469.067.584-65', '62.293.864-2', 'Flavin_top@gmail.com.br', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2000-09-16'),
(3, 'nayarB adiemlA', '54321-4321', '454.050.696-78', '14.683.523-3', 'nayarB.hetero@gmail.com.br', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2008-04-06'),
(4, 'Adolf', '19455-4444', '887.194.504-45', '64.244.864-4', 'Adolf@gmail.com.br', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1923-08-09'),
(5, 'bernardo pereira', '82034-7391', '185.076.222-03', '05.395.049-5', 'bernardo@gmail.com.br', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1984-12-08');

-- --------------------------------------------------------

--
-- Estrutura da tabela `ocorrencia`
--

CREATE TABLE `ocorrencia` (
  `codOcorrencia` int(11) NOT NULL,
  `data` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `codTipo` varchar(10) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `bairro` varchar(30) DEFAULT NULL,
  `rua` varchar(100) DEFAULT NULL,
  `cidade` varchar(30) DEFAULT NULL,
  `codCarro` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `ocorrencia`
--

INSERT INTO `ocorrencia` (`codOcorrencia`, `data`, `hora`, `codTipo`, `descricao`, `bairro`, `rua`, `cidade`, `codCarro`) VALUES
(58, '2019-08-26', '11:00:00', 'B124', 'Descarregou bateria do carro, pois cliente esqueceu luz interna acesa', 'Bairro A', 'Rua B', 'Mauá', 1),
(59, '2019-08-26', '12:30:10', 'C111', 'Cliente trancou chaves no Porta Malas', 'Bairro C', 'Rua H', 'Santo André', 2),
(60, '2019-08-26', '11:30:10', 'R888', 'Cliente teve carro furtado da garagem de sua Residência', 'Bairro 3º', 'Rua M', 'São Bernardo', 3),
(61, '2019-08-26', '11:10:00', 'B859', 'Cliente bateu carro em cruzamento com perca Total, aberto sinistro', 'Bairro DD', 'Rua AMA', 'São Paulo', 4),
(62, '2019-08-26', '17:30:10', 'C111', 'Cliente trancou chaves no Porta Malas', 'Bairro CCDD', 'Rua RRED', 'Santo André', 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo`
--

CREATE TABLE `tipo` (
  `codTipo` varchar(10) NOT NULL,
  `tipo` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `tipo`
--

INSERT INTO `tipo` (`codTipo`, `tipo`) VALUES
('B123', 'Batida Simples'),
('B124', 'Bateria Descarregada'),
('B859', 'Batida Perca Total'),
('C111', 'Chace Trancada'),
('R888', 'Furto');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `carro`
--
ALTER TABLE `carro`
  ADD PRIMARY KEY (`codCarro`),
  ADD KEY `codCliente` (`codCliente`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`codCliente`),
  ADD UNIQUE KEY `cpf` (`cpf`),
  ADD UNIQUE KEY `rg` (`rg`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Índices para tabela `ocorrencia`
--
ALTER TABLE `ocorrencia`
  ADD PRIMARY KEY (`codOcorrencia`),
  ADD KEY `codCarro` (`codCarro`),
  ADD KEY `codTipo` (`codTipo`);

--
-- Índices para tabela `tipo`
--
ALTER TABLE `tipo`
  ADD PRIMARY KEY (`codTipo`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `carro`
--
ALTER TABLE `carro`
  MODIFY `codCarro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `codCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `ocorrencia`
--
ALTER TABLE `ocorrencia`
  MODIFY `codOcorrencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `carro`
--
ALTER TABLE `carro`
  ADD CONSTRAINT `carro_ibfk_1` FOREIGN KEY (`codCliente`) REFERENCES `cliente` (`codCliente`);

--
-- Limitadores para a tabela `ocorrencia`
--
ALTER TABLE `ocorrencia`
  ADD CONSTRAINT `ocorrencia_ibfk_1` FOREIGN KEY (`codCarro`) REFERENCES `carro` (`codCarro`),
  ADD CONSTRAINT `ocorrencia_ibfk_2` FOREIGN KEY (`codTipo`) REFERENCES `tipo` (`codTipo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
