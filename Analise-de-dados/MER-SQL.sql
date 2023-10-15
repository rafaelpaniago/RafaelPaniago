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
-- Aqui vou trazer o exemplo da criação das tabelas: Clientes, Produtos e Vendedores
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


-- 3. INSERINDO VALORES NAS TABELAS
-- Aqui vou trazer o exemplo de inserção de valores nas tabelas: CLIENTES, PRODUTOS e VENDEDORES

-- Inserindo valores na tabela CLIENTES
INSERT INTO CLIENTES VALUES (1045,'Cardon One','Star City')
INSERT INTO CLIENTES VALUES (3206,'Lefbronx','WS City')
INSERT INTO CLIENTES VALUES (4788,'Chauri Moon','Star City')
INSERT INTO CLIENTES VALUES (1154,'Seven T.','WS City')

-- Inserindo valores na tabela PRODUTOS
INSERT INTO PRODUTOS VALUES (8850,'Shirt Pac 10','Pac Tren',108)
INSERT INTO PRODUTOS VALUES (7751,'Clow N VV2','Brand New Clow',154)
INSERT INTO PRODUTOS VALUES (8851,'Basic Pac X','Pac Tren',139)
INSERT INTO PRODUTOS VALUES (7750,'New C. Balac','Brand New Clow',89)

-- Inserindo valores na tabela VENDEDORES
INSERT INTO VENDEDORES VALUES (1,'Isfim')
INSERT INTO VENDEDORES VALUES (2,'Duain')
INSERT INTO VENDEDORES VALUES (3,'Nekie')
INSERT INTO VENDEDORES VALUES (4,'Xuano')
INSERT INTO VENDEDORES VALUES (5,'Mufi')
INSERT INTO VENDEDORES VALUES (6,'Faldek')
INSERT INTO VENDEDORES VALUES (7,'Agron')
INSERT INTO VENDEDORES VALUES (8,'Firon')



-- 4. Criação de Diagrama de Banco de Dados
-- Antes de fazer as consultas, vamos criar o relacionamento entre as tabelas. 
-- No Management Studio, clicamos com o botão direito em “Diagramas de Banco de Dados”.
-- Podemos ver que o SQL já monta o modelo de entidade e relacionamento.
-- Basicamente, isso é o nosso MER.
-- Agora podemos realizar consultas utilizando esse vínculo existente entre as tabelas.



-- 5. Consultas em nossas tabelas que já estão relacionadas

SELECT * FROM VENDAS A(NOLOCK) -- O A É um alias (apelido) pra não digitar o nome da tabela
INNER JOIN CLIENTES B(NOLOCK) ON (B.ID_CLIENTE=A.ID_CLIENTE)
INNER JOIN VENDEDORES C(NOLOCK) ON (C.ID_VENDEDOR=A.ID_VENDEDOR)
INNER JOIN PRODUTOS D(NOLOCK) ON (D.ID_PRODUTO=A.ID_PRODUTO)

-- AGORA VAMOS CONSIDERAR QUE QUEREMOS ALGUMAS INFORMAÇÕES ESPECÍFICAS

SELECT
B.ID_CLIENTE,
B.NOME_CLIENTE,
C.NOME_VENDEDOR,
D.PRODUTO,
A.QUANTIDADE
FROM VENDAS A(NOLOCK)
INNER JOIN CLIENTES B(NOLOCK) ON (B.ID_CLIENTE=A.ID_CLIENTE)
INNER JOIN VENDEDORES C(NOLOCK) ON (C.ID_VENDEDOR=A.ID_VENDEDOR)
INNER JOIN PRODUTOS D(NOLOCK) ON (D.ID_PRODUTO=A.ID_PRODUTO)


SELECT
B.NOME_CLIENTE,
C.NOME_VENDEDOR,
D.PRODUTO,
A.QUANTIDADE
FROM VENDAS A(NOLOCK)
INNER JOIN CLIENTES B(NOLOCK) ON (B.ID_CLIENTE=A.ID_CLIENTE)
INNER JOIN VENDEDORES C(NOLOCK) ON (C.ID_VENDEDOR=A.ID_VENDEDOR)
INNER JOIN PRODUTOS D(NOLOCK) ON (D.ID_PRODUTO=A.ID_PRODUTO)
