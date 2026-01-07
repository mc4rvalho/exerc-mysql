# Criando o banco de dados.
DROP DATABASE IF EXISTS db_school_carvalheira;
CREATE DATABASE db_school_carvalheira;

# Selecionando o banco de dados.
USE db_school_carvalheira;

# Criando a tabela turmas
CREATE TABLE tb_turmas(
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_turma VARCHAR(255) NOT NULL,
    horario VARCHAR(255) NOT NULL
);

# Criando tabela estudantes.
CREATE TABLE tb_estudantes(
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    sobrenome VARCHAR(255) NOT NULL,
    data_admissao DATE,
    nota DECIMAL(4,2) NOT NULL,
    turma_id BIGINT,
    FOREIGN KEY (turma_id) REFERENCES tb_turmas(id)
);

# Inserção de dados na tabela turmas
INSERT INTO tb_turmas(nome_turma, horario) VALUES
("JavaScript 12", "Integral"),
("Java 12", "Manhã"),
("Python 12", "Tarde");

# Inserção de dados na tabela estudantes.
INSERT INTO tb_estudantes (nome, sobrenome, data_admissao, nota, turma_id) VALUES
("Alberto", "Filho", "2025-11-18", 8.9, 1),
("Alesson", "Carlos", "2025-11-19", 8.5, 1),
("Débora", "Campos", "2025-11-20", 8.4, 1),
("Larissa", "Pinto", "2025-11-21", 6.3, 1),
("Matheus", "Carvalho", "2025-11-17", 9.5, 1),
("Matheus", "Vieira", "2025-11-25", 6.2, 2),
("Milena", "Guerra", "2025-11-22", 6.7, 3),
("Raylander", "Ribeiro", "2025-11-23", 9.2, 3),
("Renato", "Sales", "2025-11-24", 9.1, 2);

# Retorne todos(as) estudantes com a nota maior do que 7.0.
SELECT 
e.nome,
e.sobrenome,
e.nota,
t.nome_turma, 
t.horario 
FROM tb_estudantes e
INNER JOIN tb_turmas t ON e.turma_id = t.id
WHERE nota > 7
ORDER BY nota, nome;

# Retorne todos(as) estudantes com a nota menor do que 7.0.
SELECT 
e.nome,
e.sobrenome,
e.nota,
t.nome_turma, 
t.horario 
FROM tb_estudantes e
INNER JOIN tb_turmas t ON e.turma_id = t.id
WHERE nota < 7
ORDER BY nota, nome;

# Atualizando notas dos alunos que passaram na prova final.
UPDATE tb_estudantes SET nota = 8 WHERE id IN (4, 6, 7); 

# Demonstrando os alunos que passaram na prova final
SELECT 
e.nome, 
e.sobrenome, 
e.nota, 
t.nome_turma, 
t.horario 
FROM tb_estudantes e
INNER JOIN tb_turmas t ON e.turma_id = t.id
WHERE e.id IN (4, 6, 7);

# Fazendo média da turma JS 12, Python 12 e Java 12.
SELECT AVG(nota) AS "Média da Turma JS 12" FROM tb_estudantes WHERE turma_id = 1;
SELECT AVG(nota) AS "Média da Turma Py 12" FROM tb_estudantes WHERE turma_id = 2;
SELECT AVG(nota) AS "Média da Turma Jv 12" FROM tb_estudantes WHERE turma_id = 3;

# Consulta final com todos os aprovados.
SELECT 
e.nome, 
e.sobrenome, 
e.nota, 
t.nome_turma, 
t.horario 
FROM tb_estudantes e
INNER JOIN tb_turmas t ON e.turma_id = t.id;