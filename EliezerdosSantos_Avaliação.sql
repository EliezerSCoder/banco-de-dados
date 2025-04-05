USE senac;

DROP TABLE IF EXISTS pedido;
DROP TABLE IF EXISTS produto;
DROP TABLE IF EXISTS fornecedor;
DROP TABLE IF EXISTS cliente;


CREATE TABLE fornecedor (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL,
    cidade VARCHAR(60) NULL
);


CREATE TABLE produto (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL,
    categoria VARCHAR(100) NOT NULL,
    estoque INT NULL,
    preco DECIMAL(10, 2) NULL,
    fornecedor_id INT,
    FOREIGN KEY (fornecedor_id) REFERENCES fornecedor(id)
);


CREATE TABLE cliente (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL,
    cidade VARCHAR(60) NULL,
    idade INT NULL
);


CREATE TABLE pedido (
    id INT PRIMARY KEY AUTO_INCREMENT,
    produto_id INT,
    quantidade INT,
    data_pedido DATE,
    cliente_id INT,
    FOREIGN KEY (produto_id) REFERENCES produto(id),
    FOREIGN KEY (cliente_id) REFERENCES cliente(id)
);


INSERT INTO fornecedor (nome, cidade) VALUES 
('TechBrasil', 'São Paulo'),
('Computech', 'Rio de Janeiro'),
('Moveis&Co', 'Curitiba');


INSERT INTO produto (nome, categoria, estoque, preco, fornecedor_id) VALUES 
('Celular X', 'Eletrônicos', 30, 2500.00, 1),
('Notebook Y', 'Eletrônicos', 15, 4800.00, 2),
('Mesa de Madeira', 'Móveis', 10, 750.00, 3),
('Cadeira Z', 'Móveis', 25, 300.00, 3),
('TV 50"', 'Eletrônicos', 8, 3500.00, 1);


INSERT INTO cliente (nome, cidade, idade) VALUES 
('João Silva', 'São Paulo', 35),
('Maria Santos', 'Belo Horizonte', 28),
('Carlos Lima', 'Rio de Janeiro', 42),
('Fernanda Rocha', 'Curitiba', 30);

INSERT INTO pedido (produto_id, quantidade, data_pedido, cliente_id) VALUES 
(1, 2, '2024-03-10', 1),
(3, 1, '2024-03-11', 2),
(2, 1, '2024-03-15', 3),
(5, 3, '2024-03-18', 1),
(4, 4, '2024-03-20', 4);

SELECT * 
FROM produto
WHERE categoria = 'Eletrônicos' AND preco > 3000.00
ORDER BY preco DESC;

select *
from cliente 
where cidade <> 'São Paulo';

SELECT *
FROM produto
WHERE estoque < 10
ORDER BY estoque;

SELECT 
    *
FROM
    fornecedor
WHERE
    nome LIKE 'T%'
        AND cidade != 'Rio de Janeiro';
        
        SELECT categoria, AVG(preco) AS preco_medio
FROM produto
GROUP BY categoria;

SELECT cliente_id, COUNT(*) AS total_pedidos
FROM pedido
GROUP BY cliente_id;


SELECT categoria, SUM(estoque) AS total_estoque
FROM produto
GROUP BY categoria;

SELECT id, produto_id, quantidade
FROM pedido
ORDER BY quantidade ASC
LIMIT 1;

SELECT cidade, COUNT(*) AS total_clientes
FROM cliente
GROUP BY cidade
ORDER BY total_clientes DESC;

SELECT p.*, f.nome AS nome_fornecedor
FROM produto p
INNER JOIN fornecedor f ON p.fornecedor_id = f.id
ORDER BY f.nome;


SELECT ped.*, c.nome AS nome_cliente, p.nome AS nome_produto
FROM pedido ped
INNER JOIN cliente c ON ped.cliente_id = c.id
INNER JOIN produto p ON ped.produto_id = p.id
ORDER BY ped.data_pedido;


SELECT ped.*, c.nome AS cliente, p.nome AS produto, f.nome AS fornecedor
FROM pedido ped
INNER JOIN cliente c ON ped.cliente_id = c.id
INNER JOIN produto p ON ped.produto_id = p.id
INNER JOIN fornecedor f ON p.fornecedor_id = f.id;

SELECT c.nome, SUM(ped.quantidade) AS total_produtos
FROM pedido ped
INNER JOIN cliente c ON ped.cliente_id = c.id
GROUP BY c.nome;

SELECT p1.*
FROM produto p1
WHERE p1.preco > (
    SELECT AVG(p2.preco)
    FROM produto p2
    WHERE p2.categoria = p1.categoria
);

UPDATE produto 
SET preco = preco * 1.10 
WHERE categoria = 'Eletrônicos' AND id > 0;

DELETE FROM pedido
WHERE cliente_id IN (
    SELECT id FROM cliente WHERE cidade = 'Curitiba'
)
AND id > 0;

INSERT INTO cliente (nome, cidade, idade)
VALUES ('Ricardo Lopes', 'Porto Alegre', 38);

INSERT INTO pedido (produto_id, quantidade, data_pedido, cliente_id)
VALUES (
    (SELECT id FROM produto WHERE nome = 'Notebook Y'),
    2,
    '2024-03-25',
    (SELECT id FROM cliente WHERE nome = 'João Silva')
);

SELECT DISTINCT c.nome
FROM cliente c
JOIN pedido pe ON c.id = pe.cliente_id
JOIN produto pr ON pe.produto_id = pr.id
WHERE pr.categoria = 'Móveis';


