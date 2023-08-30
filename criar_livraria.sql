create database Livraria;
use Livraria;

create table Genero (
	Genero_Literario varchar (200) not null primary key
);
create table pessoa_fisica(
    CPF char(11) primary key not null
);

create table pessoa_juridica(
    CNPJ char(15) primary key not null
);

create table Clientes(   
    id_Cliente int auto_increment primary key,
    Nome varchar (200),
	Data_nascimento date,
    Sexo ENUM ("M", "F", "O"),
    Telefone char(11),
    Endereco varchar(45),
    CPF char(11) not null,
    CNPJ char(15) not null,
    constraint fk_CPF foreign key (CPF) references  pessoa_fisica (CPF),
    constraint fk_CNPJ foreign key (CNPJ) references  pessoa_juridica (CNPJ)
);
alter table Clientes auto_increment = 1;

create table editora(
    id_Editora varchar (50) not null,
    Nome_Editora varchar (50) not null,
    Endereco varchar(255),
    Telefone varchar(11),
    Gerente varchar(45),
    primary key (id_editora)
);

create table livro(
    ISBN char(13)  not null,
    Titulo varchar (50) not null,
    Qtd_estoque int,
    Descricao varchar(255),
    Autor varchar(45),
    Genero_literario varchar (100),
    id_Editora varchar (50) ,
    Valor float NOT NULL,
    primary key (isbn),
    constraint fk_id_editora foreign key (id_editora) references  editora (id_editora),
    constraint fk_genero_literario foreign key (genero_literario) references  genero (genero_literario)
    );

CREATE TABLE vendedor(
	id_Vendedor int,
	Nome varchar (200),
	Data_contratação date,
	Data_nascimento date,
	Sexo ENUM ("M", "F"),
	Telefone char(13),
	Endereco varchar(255),
	CPF char(11) not null,
	primary key (id_Vendedor)
);

create table compras(
    id_compra int primary key auto_increment not null,
    Data_compra date,
    Valor_compra float,
    id_Cliente int not null,
    id_vendedor int,
	ISBN char (13) not null,
   -- primary key (id_Compra),
    constraint fk_id_Cliente foreign key (id_Cliente) references  Clientes (id_Cliente),
    constraint fk_id_vendedor foreign key (id_vendedor) references  vendedor (id_Vendedor),
    constraint fk_ISBN foreign key (ISBN) references  Livro(ISBN)
   );
desc compras;

-- Inserir dados livraria

use Livraria;
desc genero;
 
 -- Inserir Genero
insert into genero (Genero_Literario)
	values ("Romance"),
		("Ficção Cientifica"),
		("Fantasia"), 
		("Comedia"),
		("Poesia"), 
		("Biografia"),
		("Didaticos"), 
		("Infantil"), 
		("Receitas"), 
		("Viagens"),
		("Auto ajuda"), 
        ("desenvolvimento pessoal"),
		("Guerra"),
		("Terror"),
		("Financeira"), 
        ("literatura"),
		("Saude"),
		("Esporte"), 
		("Arte"), 
		("Musica"),
		("Cinema"), 
		("Fotografica"), 
		("Gibi"), 
		("Gastronomia"),
		("Arquitetura"),
		("Jardinagem"),
        ("Animais de estimaçao");


-- Inseir CPF
insert into pessoa_fisica (CPF)
	Values (111111111),
	(111111112),
    (111111113),
    (111111114),
    (111111115),
	 (0);

SELECT * FROM pessoa_fisica;

-- inserir CNPJ
insert into pessoa_juridica (CNPJ)
		Values (11111111111),
	(11111111112),
	(11111111113),
	(11111111114),
    (111111115),
    (0);    
    SELECT * FROM pessoa_juridica;

-- Inserir dados tabela clientes
desc clientes;
insert into Clientes (Nome, Data_nascimento, Sexo, Telefone, Endereco, CPF, CNPJ)
		Values ("Scooby Do", "2001/09/11", "M", "119555-9831", "Rua de Casa 100 - SP", 0, 11111111111),
	("Alejandra Camino", "1980/03/29", "F", "119555-9831", "Rua Obere Str. 57 - SP ", 111111111, 0),
	("Eduardo Saavedra", "2001/09/20", "M", "129555-2922", "Rua Alsace Lorraine - 57 - SC", 111111112, 0),	
	("Felipe Izquierdo", "2001/10/15", "M", "30-90074321", "Avenida	1900 Oak - St - 157 - USA  ", 0, 11111111112),
	("Daniel Tonini", "1967/07/19", "M", "38769857", "AV Garden House Crowther Way -  USA", 111111113, 0),	
	("Diego Roel", "1972/06/09", "M", "323763983", "Maubelstr 90 - St - Suite 7", 111111114, 0),	
	("Francisco Chang", "1979/06/21", "M", "555-3932", "AV Magazinweg - St -5", 0, 11111111113),
	("Frédérique Citeaux", "1978/04/13", "M", "555-7788",	"Av 87 Polk - St - Suite 5", 0,	11111111114);
   
   
    -- Dados editora
insert into Editora (id_Editora, Nome_Editora, Endereco, Telefone, Gerente)
	Values(1, "Scobby", "Rua teste da rua de traz – SP", "1199999999", "Scooby Carl Sagan"),
	(2, "Reis", "Rua de Frente 100 – SP", "1199999999", "Fábio dos Reis"),
	(3, "Eco", "Rua de Lado 1000 – SP", "1199999999","Umberto Eco"),
	(4, "Desenvolvimento", "Rua de Cima 1 – SP", "1199999999", "Michael Crichton"),
	(5, "Valor", "Rua de Baixo 2 – SP", "1199999999", "Stephen,Hawking John Emsley");


     
    -- dados livro
insert into livro (ISBN, TITULO, Qtd_estoque, Descricao, Autor, Genero_literario, id_Editora, Valor )
	Values (1, "Dom Casmurro", 10, "ebook", "Machado de Assis", "literatura", 1, 100),
	(2, "Mindset", 26, "simples", "Carol S. Dweck", "desenvolvimento pessoal", 1, 90),
	(3, "Hábitos atômicos", 34, "Capa dura", "James Clear", "desenvolvimento pessoal", 2, 180),
	(4, "Senhora", 33, "Capa dura", "José de Alencar", "literatura", 1, 190),
	(5, "A garota do lago", 8, "Especial", "Charlie Donlea", "Ficção Cientifica", 2, 100);

  
    
    -- vendedor
INSERT INTO vendedor (id_Vendedor,Nome , Data_contratação, Data_nascimento, Sexo, Telefone, Endereco, CPF )
	VALUES (1, "João", "2020-01-02", "1999-02-04", "M", "1199816488", "Rua Orós, 92 - Vila Anastacio - São Paulo - SP","11111111-11"),
	(2, "Joana", "2021-03-05", "1989-10-25", "F", "1199999999", "Av. Brasil, 442 - São Paulo - SP", "22222222-12" ),
	(3, "Adriana", "2019-04-15", "1979-05-17", "F","1199999999", "Estrada da saúde . 58 - São Paulo - SP", "11122211-33");
	
   
-- compras

insert into compras(Data_compra, Valor_compra, id_Cliente, id_Vendedor,  ISBN)
	values ("2022/10/15", 100, 1,2,1),
    ("2023/03/15", 100, 2,2,1),
    ("2023/03/15", 100, 2,1,1),
    ("2023/03/15", 100, 2,1,1),
    ("2023/03/15", 100, 2,1,1),
    ("2023/03/15", 100, 2,3,1),
    ("2023/03/15", 100, 2,1,1),
    ("2023/03/15", 100, 1,2,3),
    ("2023/03/15", 100, 2,1,1),
    ("2023/03/15", 100, 1,1,2),
    ("2022/04/15", 100, 1,2,1),
    ("2022/04/15", 100, 1,3,2),
    ("2022/04/15", 100, 1,3,1),
    ("2022/04/15", 100, 1,2,1),
    ("2022/04/15", 100, 1,2,3),
    ("2022/04/15", 100, 1,2,3),
    ("2022/04/15", 100, 2,2,3),
	("2022/04/15", 100, 2,3,3),
    ("2022/04/15", 100, 2,3,4),
	("2022/04/15", 100, 2,3,4);



-- Dados das tabelas
desc pessoa_fisica;
desc pessoa_juridica;
desc Clientes;
desc genero;
desc editora;
desc livro;
desc vendedor;
desc compras;

-- Selecionar dados 
select * from pessoa_fisica;
select * from pessoa_juridica;
SELECT * FROM Clientes; 
select * from compras;
SELECT * FROM genero;
select * from livro;
select * from vendedor;

select * from compras where data_compra = "2023/03/15";
select sum(valor_compra) from compras where data_compra = "2023/03/15";
select * from compras order by data_compra;
select sum(valor_compra) from compras where id_Vendedor = "3";
select sum(valor_compra) from compras where id_Vendedor = "2";
select sum(valor_compra) from compras where id_Vendedor = "1";
select sum(Sexo) from Clientes where sexo = "F";
select sum(Sexo) from Clientes where sexo = "M";
