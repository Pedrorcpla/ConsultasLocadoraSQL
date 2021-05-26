use profro26_locadora;

insert into cliente values
(null, "Pedro Nascimento", "2004-08-06", "M", 988121415);

select*from cliente;

update cliente set telefone = 988121415 where cd = 4; 

-- Exercício 1 --
insert into filme values
(null, "Rota de Fuga", "2021-05-19", "2013-10-11", 11, 1),
(null, "Velozes e Furiosos", "2021-05-19", "2001-09-28", 5, 1),
(null, "Jogador Numero 1", "2021-05-19", "2018-03-29", 6, 2),
(null, "Homem-Formiga", "2021-05-19", "2015-07-16", 2, 2),
(null, "A Ilha do Medo", "2021-05-19", "2010-03-12", 3, 3),
(null, "Um Lugar Silencioso", "2021-05-19", "2018-04-05", 8, 3),
(null, "Titanic", "2021-05-19", "1998-01-16", 13, 4),
(null, "Creed", "2021-05-19", "2015-12-06", 6, 4),
(null, "Star Wars", "2021-05-19", "1977-11-18", 9, 5),
(null, "Jurassic Park", "2021-05-19", "1993-06-13", 3, 5),
(null, "It - A Coisa", "2021-05-19", "2017-11-07", 4, 6),
(null, "Alien", "2021-05-19", "1979-08-20", 14, 6),
(null, "Professor Peso Pesado", "2021-05-19", "2012-12-07", 9, 7),
(null, "Gente Grande", "2021-05-19", "2010-11-24", 5, 7),
(null, "A Culpa é das Estrelas", "2021-05-19", "2014-06-05", 4, 8),
(null, "Orgulho e Preconceito", "2021-05-19", "2006-02-10", 7, 8);

-- Exercício 2 --
insert into locacao (id, dt_locacao, id_cliente) values
(null, "2021-05-19", 4);

insert into itens values
(1, 26),
(1, 23);

-- Exercício 3 --
update locacao set dt_devolucao = "2021-05-26" where id = 1;

-- Exercício 4 --
select * from filme 
where
cd in
(select id_filme from itens);

-- Exercício 5 --
select * from cliente
where
cd in
(select id_cliente from locacao
where 
dt_devolucao = null);

-- Exercício 6 --
select * from filme
where
qt_exemplares > 2;

-- Exercício 7 --
select nome from filme
where
nome = "LAGOA AZUL" and
cd in
(select id_filme from itens
where
id_locacao in
(select id from locacao
where
dt_devolucao != null));

-- Exercício 8 --
select nome, telefone from cliente
where
nome = "Paulo Coppe";

-- Exercício 9 --
select nome from filme 
where
cd in
(select id_filme from itens
where 
id_locacao in
(select id from locacao
where
id_cliente in
(select cd from cliente
where 
nome = "Beatriz")));

-- Exercício 10 --
update cliente set telefone = 996840168
where 
nome = "Ayan"; 

-- Exercício 11 --
select cd from cliente
where
nome = "Abner";

insert into locacao(id, dt_locacao, id_cliente) values
(null, "2021-05-26", 5);

select * from locacao;
select * from filme;

insert into itens values
(17, 87),
(17, 86);

-- Exercício 12 --
update locacao set dt_devolucao = "2021-06-02"
where
id = 17;

-- Exercício 13 --
select * from filme
where
id_categoria in
(select cd from categoria
where
nome = "AÇÃO") order by nome;

-- Exercício 14 --
select * from cliente
where
nome like "João%";

-- Exercício 15 --
select * from filme
where
dt_lancamento between "2000-01-01" and "2000-12-31";

-- Exercício 16 --
select nome, cd from filme
where
dt_cadastro in
(select min(dt_cadastro) from filme);

-- Exercício 17 --
select cd, nome from filme
where 
cd in
(select id_filme from itens
where
id_locacao in
(select id from locacao
where
dt_devolucao = "2021-05-26"));

-- Exercício 18 --
select count(id) as Total from locacao
where 
dt_locacao = "2021-05-26";

-- Exercício 19 --
select sum(qt_exemplares) as Soma from filme;

-- Exercício 20 --
select count(cd) as Total from filme
where
cd in
(select id_filme from itens
where 
id_locacao in
(select id from locacao
where
dt_locacao = "2021-05-26"));

-- Exercício 21 --
select avg(qt_exemplares) as Media from filme;

-- Exercício 22 --
select nome from cliente
where
dt_nasc like "%-02-%";

-- Exercício 23 --
select nome from filme
where 
dt_cadastro in
(select max(dt_cadastro) from filme);

-- Exercício 24 --
select count(id) as Total from locacao
where
id in
(select id_locacao from itens
where
id_filme = 9);

-- Filme mais alugado do mês --
select nome from filme
where
cd in
(select id_filme from itens
where
id_locacao in
(select id from locacao
where
dt_locacao like "2021-05-%")
group by id_filme
having count(id_filme) > 2
order by count(id_filme) desc);
