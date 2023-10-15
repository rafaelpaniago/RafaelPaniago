-- MER EM SQL

-- ETAPAS
-- 1. Definição
-- 2. Criação das tabelas
-- 3. Inserção de valores nas tabelas
-- 4. Criação de Diagrama de Banco de Dados
-- 5. Consultas em nossas tabelas que já estão relacionadas

-- 1. Definição
-- MER: Modelo Entidade Relacionamento
-- Nada mais é do que a relação entre as tabelas (entidades) do nosso BD.
-- Imagine que temos três tabelas: Produtos, Clientes, Vendas. 
-- A ideia é manter a integridade dos dados e performar melhor as consultas. 


-- 2. CRIAÇÃO DAS TABELAS

----------------------------
-- Criando a tabela CLIENTES
IF EXISTS (SELECT 1 FROM SYS.OBJECTS WHERE TYPE = 'U' AND NAME = 'CLIENTES')
	BEGIN
		DROP TABLE CLIENTES
	END
GO

CREATE TABLE CLIENTES(
ID_CLIENTE    INTEGER PRIMARY KEY,
NOME_CLIENTE  VARCHAR (100),
CIDADE        VARCHAR (100))   

----------------------------
-- Criando a tabela PRODUTOS
IF EXISTS (SELECT 1 FROM SYS.OBJECTS WHERE TYPE = 'U' AND NAME = 'PRODUTOS')
	BEGIN
		DROP TABLE PRODUTOS
	END
GO

CREATE TABLE PRODUTOS(
ID_PRODUTO    INTEGER PRIMARY KEY,
PRODUTO       VARCHAR (100),
FORNECEDOR    VARCHAR (100),
VALOR_PRODUTO DECIMAL(5,2))

----------------------------
-- Criando a tabela VENDEDORES
IF EXISTS (SELECT 1 FROM SYS.OBJECTS WHERE TYPE ='U' AND NAME = 'VENDEDORES')
	BEGIN
		DROP TABLE VENDEDORES	
	END
GO

CREATE TABLE VENDEDORES(
ID_VENDEDOR   INTEGER PRIMARY KEY,
NOME_VENDEDOR VARCHAR (100))

----------------------------
-- Criando a tabela VENDAS
IF EXISTS (SELECT 1 FROM SYS.OBJECTS WHERE TYPE = 'U' AND NAME = 'VENDAS')
	BEGIN
		DROP TABLE VENDAS
	END
GO

CREATE TABLE VENDAS(
ID_VENDA      INTEGER PRIMARY KEY,
ID_CLIENTE    INTEGER FOREIGN KEY REFERENCES CLIENTES(ID_CLIENTE),
ID_VENDEDOR   INTEGER FOREIGN KEY REFERENCES VENDEDORES(ID_VENDEDOR),
ID_PRODUTO    INTEGER FOREIGN KEY REFERENCES PRODUTOS(ID_PRODUTO),
QUANTIDADE    INTEGER,
DATA_VENDA    DATE)
