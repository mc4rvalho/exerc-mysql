# Criar banco de dados.
CREATE DATABASE db_rh_crtlz_reparos;

# Comando para utilizar o banco de dados.
USE db_rh_crtlz_reparos;

# Criar tabela de colaboradores.
CREATE TABLE tb_colaboradores(
	id BIGINT AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    sobrenome VARCHAR(255) NOT NULL,
    data_admissao DATE,
    salario DECIMAL(6,2),
    PRIMARY KEY(id)
);

# Inserção de dados dos colaboradores.
INSERT INTO tb_colaboradores (nome, sobrenome, data_admissao, salario) VALUES
("Julia", "Souto", "2026-01-01", 5000),
("Gustavo", "Isayas", "2026-01-02", 2000),
("Flavio", "Rogerio", "2026-01-03", 2000),
("Tereza", "Neta", "2026-01-04", 1500),
("Danillo", "Gabriel", "2026-01-05", 1500);

# Retornando todos os colaboradores com o salário maior do que 2000.
SELECT * FROM tb_colaboradores WHERE salario > 2000 ORDER BY nome;

# Retornando todos os colaboradores com o salário menor do que 2000.
SELECT * FROM tb_colaboradores WHERE salario < 2000 ORDER BY nome;

# Atualizando salário de 2 colaboradores.
UPDATE tb_colaboradores SET salario = 2500 WHERE id IN (2, 3);

# Consulta final.
SELECT * FROM tb_colaboradores;