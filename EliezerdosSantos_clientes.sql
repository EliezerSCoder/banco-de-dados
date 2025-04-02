USE senac;
 
DROP TABLE IF EXISTS pedido;
DROP TABLE IF EXISTS cliente;
DROP TABLE IF EXISTS ConsultaCliente;

CREATE TABLE cliente (
    id INT PRIMARY KEY AUTO_INCREMENT, 
    nome VARCHAR(100) NOT NULL, 
    idade INT NULL, 
    cidade VARCHAR(100) NOT NULL,  
    saldo DECIMAL(10,2) NULL
);


INSERT INTO cliente (nome, idade, cidade, saldo) VALUES
('Carlos', 45, 'São Paulo', 2500.00),
('Mariana', 32, 'Rio de Janeiro', 3200.50),
('Pedro', 27, 'Belo Horizonte', 1500.75),
('Fernanda', 38, 'Curitiba', 4200.00);


CREATE TABLE pedido (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    valor DECIMAL(10,2),
    data_pedido DATE,
    FOREIGN KEY (cliente_id) REFERENCES cliente(id)
);


INSERT INTO pedido (cliente_id, valor, data_pedido) VALUES
(1, 500.00, '2024-03-10'),
(2, 1200.00, '2024-03-12'),
(3, 300.50, '2024-03-15'),
(1, 800.00, '2024-03-18');


SELECT * FROM cliente 
WHERE cidade = 'Rio de Janeiro';
SELECT * FROM cliente
 
WHERE saldo > 2000 
ORDER BY saldo DESC;

SELECT 
    nome, idade
FROM
    cliente
WHERE
    idade > 30;
    
    SELECT * FROM cliente 
WHERE nome LIKE 'F%';

SELECT 
    *
FROM
    cliente
WHERE
    cidade NOT IN ('São Paulo' , 'Curitiba');
    
    SELECT COUNT(*) AS total_pedidos FROM pedido;
    
    SELECT AVG(valor) AS media_valor FROM pedido;
    
    SELECT cliente_id, SUM(valor) AS total_gasto 
FROM pedido 
GROUP BY cliente_id;

SELECT pedido.*, cliente.nome 
FROM pedido 
INNER JOIN cliente ON pedido.cliente_id = cliente.id;

SELECT cliente.*, pedido.id AS pedido_id, pedido.valor 
FROM cliente 
LEFT JOIN pedido ON cliente.id = pedido.cliente_id;

SELECT DISTINCT cliente.* 
FROM cliente 
INNER JOIN pedido ON cliente.id = pedido.cliente_id 
WHERE pedido.valor > (SELECT AVG(valor) FROM pedido);

SELECT DISTINCT cliente.* 
FROM cliente 
INNER JOIN pedido ON cliente.id = pedido.cliente_id 
WHERE pedido.valor > 1000;

INSERT INTO cliente (nome, cidade) 
VALUES ('Rafael', 'Porto Alegre');

UPDATE cliente 
SET saldo = saldo * 1.10;

DELETE FROM pedido 
WHERE valor < 500;


