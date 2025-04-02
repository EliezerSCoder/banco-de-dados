use senac;
create table empregados (
id INT primary KEY AUTO_INCREMENT, 
nome VARCHAR (100) NOT NULL, 
idade int null, 
departamento varchar (100) not null,  
salario decimal (10, 2) null 
);



INSERT INTO empregados (
nome, idade, departamento, salario ) values 
('Joao', 30, 'RH', 50000),
('Sarah', 28, 'TI', 60000),
('Miguel', 35, 'Vendas', 60000), 
('Ana', 27, 'TI', 62000);

select * from empregados
 where 
 departamento = 'TI';
 
 select * from empregados 
 where 
 salario >= 50000;
 
 select * from empregados
 ORDER BY idade DESC;
 
select * from empregados 
where 
idade >= 28 and idade <= 35;

select * from empregados 
where 
nome like 'M%';

select * from empregados 
where 
departamento != 'RH';

select departamento, count(*) from empregados group by departamento;



 

 
 






