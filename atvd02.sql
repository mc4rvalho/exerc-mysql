# Criando banco de dados.
CREATE DATABASE db_karvalhum;

# Selecionando o banco de dados.
USE db_karvalhum;

# Criando tabela de categorias.
CREATE TABLE tb_categorias (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    departamento VARCHAR(255) NOT NULL
);

# Criando tabela de produtos.
CREATE TABLE tb_produtos (
	id BIGINT AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    quantidade INT,
    marca VARCHAR(255) NOT NULL,
    preco DECIMAL(8,2),
    categoria_id BIGINT,
    PRIMARY KEY (id),
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

# Fazendo a inserção na tabela categorias.
INSERT INTO tb_categorias (departamento) VALUES
("Notebook"),
("Celular"),
("Monitor"),
("Placa de Vídeo"),
("Periféricos"),
("PC Gamer");

# Fazendo a inserção na tabela produtos e categorias.
INSERT INTO tb_produtos (nome, quantidade, marca, preco, categoria_id) VALUES
("Macbook Air", 100, "Apple", 9499.00, 1),
("Macbook Pro", 200, "Apple", 14199.00, 1),
("iPhone 15", 500, "Apple", 4199.00, 2),
("iPhone 16", 600, "Apple", 4699.00, 2),
("Notebook Gamer", 1000, "ASUS", 5549.00, 1),
("Monitor Gamer", 1200, "LG", 480.00, 3),
("Placa de Vídeo RTX 5060", 900, "Nvidia", 2199.99, 4),
("Computador Gamer AMD Ryzen-5", 300, "Concórdia", 2899.99, 6),
("Teclado Gamer", 1500, "Redragon", 159.99, 5),
("Mouse Gamer", 1500, "Redragon", 79.99, 5);

# Retornando todos os produtos com o valor maior do que 500.
SELECT
	p.nome,
    p.marca,
    p.preco,
    c.departamento
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.categoria_id = c.id
WHERE preco > 500
ORDER BY p.preco DESC;

# Retornando todos os produtos com o valor menor do que 500.
SELECT
	p.nome,
    p.marca,
    p.preco,
    c.departamento
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.categoria_id = c.id
WHERE preco < 500
ORDER BY p.preco DESC;

# Atualizando preço do Notebook Gamer ASUS.
UPDATE tb_produtos SET preco = 5500.99 WHERE id = 5;

# Consulta final.
SELECT 
    p.id,
    p.nome,
    p.quantidade,
    p.marca,
    p.preco,
    c.departamento
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.categoria_id = c.id
ORDER BY p.id ASC;