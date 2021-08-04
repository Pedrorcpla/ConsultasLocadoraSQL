create database db_Mercado;
use db_Mercado;

create table tb_Categorias(
	cd_categoria int not null auto_increment,
	nm_categoria varchar(45) not null,
    foto varchar(100),
    primary key (cd_categoria)
);

create table tb_Itens(
	cd_item int not null auto_increment,
    nm_item varchar(50) not null,
    preco decimal(10,2),
    qt_estoque int,
    id_categoria int,
    foto varchar(100),
    primary key (cd_item),
    foreign key (id_categoria) references tb_Categorias(cd_categoria)
);

create table tb_Cliente(
	cd_cliente int not null auto_increment,
    nm_nome varchar(50) not null,
    email varchar(100) not null,
    senha varchar(50) not null,
    nm_login varchar(50) not null,
    primary key (cd_cliente)
);

create table tb_Saida(
	cd_controle int not null auto_increment,
    dt_modificacao date not null,
    qt_produto int not null,
    vl_item decimal(10,2) not null,
    vl_total decimal(10,2) not null,
    id_item int not null,
    id_cliente int not null,
    primary key(cd_controle),
    foreign key(id_item) references tb_Itens(cd_item),
    foreign key(id_cliente) references tb_Cliente(cd_cliente)
);

insert into tb_Categorias (cd_categoria, nm_categoria) values
('1', 'Carnes'),
(null, 'Congelados'),
(null, 'Doces'),
(null, 'Enlatados'),
(null, 'Frios'),
(null, 'Frutas'),
(null, 'Legumes e Verduras'),
(null, 'Padaria e Confeitaria'),
(null, 'Peixaria'),
(null, 'Laticinios'), 
(null, 'Hortifruti'), 
(null, 'Não_Pereciveis');

insert into tb_Cliente (cd_cliente, nm_nome, email, senha, nm_login) values
(1, "Pedro", "pedro.nascimento79@etec.sp.gov.br", "senha123", "Pedrorcpla"),
(null, "Ayan", "ayan.ribeiro@etec.sp.gov.br", "senhaforte", "AyanPlugger");

insert into tb_Itens (cd_item, nm_item, preco, qt_estoque, id_categoria) values 
(1, 'Arroz',"10.99", 20, 4), 
(null, 'Carne Seca',"32.50", 50, 1), 
(null, 'Saco de Batata',"5.99", 35, 7),
(null, 'Robalo',"29.99", 14, 9),
(null, 'Maçã',"1.99", 22, 6),
(null, 'Bolo',"9.99", 6, 8),
(null, 'Queijo',"12.99", 18, 10);

insert into tb_Saida (dt_modificacao, qt_produto, vl_item, vl_total, id_item, id_cliente) values 
('2021-06-20', 5, '5.99', '17.57', 3, 1), 
('2021-06-21', 10, '32.50', '65.00', 2, 2), 
('2021-06-23', 30, '10.99', '10.99', 1, 1),
('2021-06-10', 8, '1.99', '9.95', 5, 1),
('2021-06-12', 22, '29.99', '119.94', 4, 2),
('2021-06-16', 5, '12.99', '77.94', 6, 2);