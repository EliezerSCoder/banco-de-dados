use senac;
CREATE TABLE empregados (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    idade INT NULL,
    departamento VARCHAR(100) NOT NULL,
    salario DECIMAL(10 , 2 ) NULL
);

INSERT INTO empregados (
nome, idade, departamento, salario ) values 
('Joao', 30, 'RH', 50000),
('Sarah', 28, 'TI', 60000),
('Miguel', 35, 'Vendas', 60000), 
('Ana', 27, 'TI', 62000),
('Paulo', 59, 'Vendas', 75000);


SELECT
    *
FROM
    empregados
WHERE
    departamento = 'TI';
 
SELECT 
    *
FROM
    empregados
WHERE
    salario >= 50000;
 
SELECT 
    *
FROM
    empregados
ORDER BY idade DESC;
 
SELECT 
    *
FROM
    empregados
WHERE
    idade >= 28 AND idade <= 35;

SELECT 
    *
FROM
    empregados
WHERE
    nome LIKE 'M%';

SELECT 
    *
FROM
    empregados
WHERE
    departamento <> 'RH';


select avg(salario ) 
from 
empregado 
where
departamenro = 'TI';
 
 SELECT 
    SUM(salario)
FROM
    empregado
WHERE
    departamento = 'vendas';
    
  CREATE TABLE departamento(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE empregado (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    idade INT NULL,
    salario DECIMAL(10, 2) NOT NULL,
    id_departamento INT NOT NULL,
    FOREIGN KEY (id_departamento) REFERENCES departamento(id)
);

INSERT INTO departamento (nome) VALUES 
('RH'),
('TI'),
('Vendas'),
('compras');

inserT INTO empregado (nome, idade, salario, id_departamento) Values
('Joao', 30, 'RH', 50000),
('Sarah', 28, 'TI', 60000),
('Miguel', 35, 'Vendas', 60000), 
('Ana', 27, 'TI', 62000),
('Paulo', 59, 'Vendas', 75000);
    
SELECT 
    e.nome AS empregados, d.nome AS departamento
FROM
    empregados e
        INNER JOIN
    departamento d ON e.id_departamento - d.id;
    
    select d.nome as departamenro, e.nome as empregado
    from 
    departamento d 
    left join 
    empregado E ON d.id = e.departamento;

select 
*
from 
empregado
where 
salario > (select
avg(salario)
from
empregado);

select 
e.nome as empregado, e.id_departamento = d.id

from 
empregado e 
inner join 
departamento d on e.id_departamento = d.id
where 
id_deparamento = (select
e.id_departamento
where 
nome = 'Sarah');

insert into empregado (nome,idade, salario, id_departamento)
Values ('Tomás',38,5800,3);

SELECT d.nome AS departamento, COUNT(e.id) AS num_empregados
FROM departamento d 
LEFT JOIN empregado e ON d.id = e.id_departamento
GROUP BY d.id;

UPDATE empregado 
SET salario = salario * 1.05
WHERE id_departamento = (SELECT id FROM departamento WHERE nome = 'TI');


DELETE FROM empregado WHERE idade > 40;


SELECT * FROM empregado;


