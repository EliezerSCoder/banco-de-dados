select * from livro 
Where data_publicacao >= '1990-01-01' '00:00:00'
AND data_publicacao <='1999-12-31' '23:59:59';

select * from livro
where data_publicacao between '1990-01-01' '00:00:00' and '1999-12-31';

select distinct(autor) from livro;

select autor from livro;

select sum(preco), avg(preco), max(preco), min(preco) from livro
Where autor = 'rafael sousa';

select count(id) from livro;
