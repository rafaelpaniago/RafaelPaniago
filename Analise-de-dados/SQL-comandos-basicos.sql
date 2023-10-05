-- COMANDOS SQL

-- Criar uma tabela para começar a realizar consultas 
-- Aqui utilizamos o CREATE TABLE e nossa tabela terá o nome FILMES
-- Vamos criar o campo de ID, TÍTULO e CATEGORIA

CREATE TABLE FILMES (
ID_VIDEO INTEGER,
TITULO VARCHAR(100),
CATEGORIA VARCHAR(100))


-- Depois de criada nossa tabela, vamos inserir registros
-- Pra isso vamos utilizar o INSERT INTO
-- Os valores estão separados por vírgula, cada valor pertence a um campo
-- Respeitando a ordem de cadastro: id, nome do filme, categoria

INSERT INTO FILMES VALUES (1, 'PULP FICTION', 'DRAMA')
INSERT INTO FILMES VALUES (2, 'JURASSIC PARK', 'AVENTURA')
INSERT INTO FILMES VALUES (3, 'INCEPTION', 'FICÇÃO CIENTIFICA')
INSERT INTO FILMES VALUES (4, 'MATRIX', 'FICÇÃO CIENTÍFICA')
INSERT INTO FILMES VALUES (5, 'SENHOR DOS ANEIS', 'AVENTURA')


-- Agora podemos começar as consultas em nossa tabela
-- Vamos utilizar o SELECT * 
-- Se executarmos apenas a primeira linha do código abaixo, toda a tabela seria exibida
-- Porém aqui eu listei algumas formas diferentes de consultas utilizando algumas condições
-- Ou seja, o WHERE serve como um filtro para nossas consultas

SELECT * FROM FILMES
SELECT ID_VIDEO, TITULO FROM FILMES WHERE CATEGORIA LIKE '%CIENTIFICA'
SELECT * FROM FILMES WHERE CATEGORIA = 'DRAMA'
SELECT TITULO FROM FILMES WHERE ID_VIDEO IN(2,4)


-- O UPDATE serve para "atualizarmos" valores de nossa tabela
-- No caso abaixo, atualizamos o TÍTULO e CATEGORIA do filme id 3

UPDATE FILMES SET TITULO = '1917' WHERE ID_VIDEO = 3
UPDATE FILMES SET CATEGORIA = 'AÇÃO' WHERE ID_VIDEO = 3
SELECT * FROM FILMES


-- Este comando abaixo serve para retornarmos a nossa tabela a condição anterior
-- Isso porque sempre que fazemos um update o BD atualiza com o novo registro
-- Se quisermos retornar aos valores anteriores podemos usar o BEGIN TRAN que deve estar atrelado ao ROLLBACK
-- O COMMIT de fato realiza as alterações de nosso update

BEGIN TRAN
	UPDATE FILMES SET TITULO = 'SENHOR DOS ANEIS 2' WHERE ID_VIDEO = 5
--COMMIT
--ROLLBACK

SELECT * FROM FILMES
