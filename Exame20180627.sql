create database controleEstoque
use controleEstoque

create table Fornecedor (
codforn int primary key auto_increment, 
nome varchar(50), 
municipio varchar(30), 
provincia varchar(30))
create table Produto (
codprod int primary key auto_increment, 
nome varchar(50), 
descricao varchar(80), 
precovenda float, 
precocompra float)
create table Estoque (
codforn int, 
codprod int, 
quantidade int, 
origemprod varchar(30),
primary key(codforn,codprod),
foreign key(codprod) references Produto(codprod),
foreign key(codforn) references Fornecedor(codforn))
create table Pedido (
codpedido int primary key auto_increment,  
codforn int, 
codprod int, 
quantidade int, 
datapedido date,
foreign key(codprod) references Produto(codprod),
foreign key(codforn) references Fornecedor(codforn))

insert into fornecedor(nome,municipio,provincia) values
('NCR','Luanda','Luanda'),
('SISTEC','Ndalatando','Kwanza Norte'),
('ANGLOBAL','Libolo','Kwanza Sul'),
('NET ONE','Nzeto','Uige'),
('INFORNET','Cabinda','Cabinda')

insert into Produto(nome,precovenda,precocompra) values
('Projetor',54000,47500),
('PC Hp',130000,93294),
('Impresora LG',45300,39250),
('Pinteiro',12000,10500),
('Mouse',1000,850)

insert into Estoque(codForn,codProd,quantidade,origemProd) values
(1,3,50,'China'),
(3,1,100,'India'),
(2,2,15,'Dubai'),
(1,4,50,'Japão'),
(2,5,50,'Africa do Sul'),
(5,3,26,'Portugal')

insert into Pedido(codForn,codProd,quantidade,dataPedido) values
(1,3,7,'2018-05-15'),
(3,1,10,'2018-01-21'),
(2,2,3,'2018-02-07'),
(1,4,11,'2018-05-15'),
(2,5,7,'2018-04-29'),
(5,3,4,'2018-03-13')

select * from Fornecedor
select * from Produto
select * from Estoque
select * from Pedido

update Estoque set quantidade=14,origemProd='Angola' where codForn=1

select max(precovenda), min(precovenda), avg(precocompra) from produto

select * from fornecedor order by nome asc

select produto.nome,produto.precovenda,pedido.quantidade,pedido.datapedido from
produto inner join pedido on produto.codProd = pedido.codProd

select a.nome, b.nome, c.quantidade from produto as a, fornecedor as b,
pedido as c where a.codProd=c.codProd and b.codForn=c.codForn and
dataPedido='2018-01-21'
