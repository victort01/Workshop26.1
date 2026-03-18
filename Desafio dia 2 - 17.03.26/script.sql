-- 1. Criando Schema

CREATE SCHEMA DESAFIO;
USE DESAFIO;

-- 2. Criando Tabelas

CREATE TABLE Filmes (
    id_filme INT PRIMARY KEY,
    titulo VARCHAR(100),
    genero VARCHAR(50),
    ano_lancamento INT,
    duracao_minutos INT
);

CREATE TABLE Avaliacoes (
    id_avaliacao INT PRIMARY KEY,
    id_filme INT,
    usuario VARCHAR(50),
    nota DECIMAL(2,1),
    comentario VARCHAR(255),
    FOREIGN KEY (id_filme) REFERENCES Filmes(id_filme)
);

-- 3. Inserindo Dados

INSERT INTO Filmes VALUES
(1, 'Matrix', 'Ficcao', 1999, 136),
(2, 'Vingadores', 'Acao', 2012, 143),
(3, 'Titanic', 'Romance', 1997, 195),
(4, 'Interestelar', 'Ficcao', 2014, 169),
(5, 'Coringa', 'Drama', 2019, 122),
(6, 'Avatar', 'Ficcao', 2009, 162),
(7, 'Batman', 'Acao', 2022, 176),
(8, 'Frozen', 'Animacao', 2013, 102),
(9, 'Gladiador', 'Acao', 2000, 155),
(10, 'Shrek', 'Animacao', 2001, 90);

INSERT INTO Avaliacoes VALUES
(1, 1, 'Ana', 9.0, 'Excelente'),
(2, 1, 'Carlos', 8.5, 'Muito bom'),
(3, 2, 'Maria', 9.5, 'Incrivel'),
(4, 3, 'Joao', 7.0, 'Triste'),
(5, 4, 'Pedro', 9.8, 'Obra prima'),
(6, 5, 'Lucas', 8.0, 'Bom'),
(7, 6, 'Julia', 9.2, 'Visual top'),
(8, 7, 'Bruno', 7.5, 'Legal'),
(9, 8, 'Clara', 8.7, 'Divertido'),
(10, 9, 'Rafa', 9.1, 'Muito bom');

-- 4. Executando

-- DML
UPDATE Avaliacoes
SET nota = 10.0
WHERE id_avaliacao = 5;

-- DQL
SELECT * FROM Filmes;

-- FUNÇÕES AGREGADAS
SELECT AVG(nota) AS media_notas FROM Avaliacoes;

SELECT MAX(nota) AS maior_nota FROM Avaliacoes;

SELECT COUNT(*) AS total_avaliacoes FROM Avaliacoes;

-- AGRUPAMENTOS

SELECT id_filme, AVG(nota) AS media
FROM Avaliacoes
GROUP BY id_filme;

SELECT genero, COUNT(*) AS total
FROM Filmes
GROUP BY genero;

-- JOIN

SELECT f.titulo, a.usuario, a.nota
FROM Filmes f
JOIN Avaliacoes a ON f.id_filme = a.id_filme;