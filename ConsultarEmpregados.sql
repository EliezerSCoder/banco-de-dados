USE exercicios_sql;
CREATE TABLE ConsultaClientes(
id INT primary KEY AUTO_INCREMENT, 
nome VARCHAR (100) NOT NULL, 
idade int null, 
departamento varchar (100) not null,  
salario decimal (10, 2) null 
);
INSERT INTO cliente (nome, idade, cidade, saldo) VALUES
('Carlos', 45, 'São Paulo', 2500.00),
('Mariana', 32, 'Rio de Janeiro', 3200.50),
('Pedro', 27, 'Belo Horizonte', 1500.75),
('Fernanda', 38, 'Curitiba', 4200.00);