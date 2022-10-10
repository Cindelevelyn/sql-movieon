create database locadora;
use locadora;

/*criando tabelas*/
create table fidelidade(id int, dia date, primary key(id));
create table filme(nome varchar(15), duracao varchar(5), primary key(nome));
create table sessao(id int, qtdCadeira int, dat date, valor double, horario varchar(5), nomeFilme varchar(15), primary key(id), foreign key(nomeFilme) references filme(nome));
create table ticket(cadeira varchar(4), id varchar(5), idSessao int, primary key(cadeira), foreign key(idSessao) references sessao(id));
create table cliente(cpf varchar(11), endereco varchar(30), nome varchar(30), numCartao varchar(8), telefone int, cadeiraTicket varchar(4), idFidelidade int, primary key(cpf), foreign key(cadeiraTicket) references ticket(cadeira), foreign key(idFidelidade) references fidelidade(id));
create table compra(cpfCliente varchar(11), cadeiraTicket varchar(4), primary key(cpfCliente, cadeiraTicket), foreign key(cpfCliente) references cliente(cpf), foreign key(cadeiraTicket) references ticket(cadeira));

show tables;

/*inserindo dados*/
insert into fidelidade(id, dia) values (1,'2022-04-09'), (2,'2022-05-15');
insert into filme(nome,duracao) values ("Rocky 3","1h39"), ("Noé","2h18");
insert into sessao(id,qtdCadeira,dat,valor,horario,nomeFilme) values (548,160,'2022-04-09',30.00,"20:00","Rocky 3"), (711,128,'2022-05-15',30.00,"19:00","Noé");
insert into ticket(cadeira,id,idSessao) values ("1H11", "111A", 548), ("3H8", "112B", 711);
insert into cliente(cpf,endereco,nome,numCartao, telefone, cadeiraTicket, idFidelidade) values ("123123", "Rua 5", "Claudio", "40028922", 3471, "1H11", 1), ("321123", "Rua 8", "Miguel", "12342234", 3144, "3H8", 2);
insert into compra(cpfCliente, cadeiraTicket) values ("123123", "1H11"), ("321123", "3H8");

/*descobrindo qual cliente assistiu a qual filme*/
