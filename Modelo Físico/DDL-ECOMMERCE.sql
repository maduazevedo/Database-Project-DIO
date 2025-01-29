
create database ecommerce;

use ecommerce;

create table cliente(
	idCliente int primary key,
	nome varchar(45),
	identificacao enum ('PF', 'PJ'),
	cep char(8),
	numero char(5),
	rua varchar(45),
	bairro varchar(45),
	cidade varchar(45),
	estado char(2)
);

create table cliente_PJ(

	idCliente int,
	razao varchar(255),
	
	constraint fk_id_cliente_PJ foreign key (idCliente) references cliente(idCliente)

);

create table cliente_PF(
	idCliente int,
	cpf char(11),

	constraint fk_id_cliente_PF foreign key (idCliente) references cliente(idCliente)

);

create table entrega (
	 idEntrega int primary key,
	 status enum ('Postado','A caminho', 'Entregue'),
	 cod_rastreio varchar(255)
);


create table terceiro_vendedor (
	id3 int primary key,
	razao varchar(255),
	local varchar(255)
);

create table produto (
	idProduto int primary key,
	categoria varchar(45),
	descricao varchar(45),
	valor double

);

create table venda_terceiro(
	id3 int,
	idProduto int,
	quantidade_a_venda int,
	
	primary key(id3, idProduto),
	
	constraint fk_idProduto_venda foreign key (idProduto) references produto(idProduto),
	constraint fk_id3_venda foreign key (id3) references terceiro_vendedor(id3)

);

create table estoque (
	idEstoque int primary key,
	local varchar(255)
);

create table armazena(
	idEstoque int,
	idProduto int, 
	quantidade_produto int,
	
	primary key(idEstoque, idProduto),
	
	constraint fk_idEstoque_armazena foreign key (idEstoque) references estoque(idEstoque),
	constraint fk_idProduto_armazena foreign key (idProduto) references produto(idProduto)
	
);

create table compra(
	idCompra int,
	idCliente int, 
	idEntrega int,
	idProduto int, 
	status varchar(45) check( status ="Pago"),
	frete double,
	quantidade_produto int,
	
	primary key (idCompra),
	
	constraint fk_idCliente_compra foreign key (idCliente) references cliente(idCliente),
	constraint fk_idEntrega_compra foreign key (idEntrega) references entrega(idEntrega),
	constraint fk_idProduto_compra foreign key (idProduto) references produto(idProduto)
	

);

create table fornecedor(

	idFornecedor int primary key,
	razao varchar(45),
	CNPJ varchar(14)
);

create table fornece(
	idFornecedor int,
	idProduto int,
	quantidade_fornecida int,
	
	primary key (idFornecedor, idProduto),
	
	constraint fk_idProduto_fornece foreign key (idProduto) references produto(idProduto),
	constraint fk_idFornecedor_fornece foreign key (idFornecedor) references fornecedor(idFornecedor)

);

create table pagamento (
	idPagamento int primary key,
	idCompra int,
	valor float,
	data date,
	
	constraint fk_idCompra_pagamento foreign key(idCompra) references compra(idCompra)

);

create table pag_debito(
	idDebito int primary key,
	idPagamento int,
	nome_titular varchar(45),
	numero_cartao varchar(45),
	validade date,
	
	constraint fk_idPagamento_debito foreign key (idPagamento) references pagamento(idPagamento)

);

create table pag_credito(
	idCredito int primary key,
	idPagamento int,
	nome_titular varchar(45),
	numero_cartao varchar(45),
	validade date,
	
	constraint fk_idPagamento_credito foreign key (idPagamento) references pagamento(idPagamento)
);

create table pag_pix(
	idPix int primary key,
	idPagamento int,
	chave varchar(255),
	
	constraint fk_idPagamento_pix foreign key (idPagamento) references pagamento(idPagamento)
);

create table pag_boleto(
	idBoleto int primary key,
	idPagamento int,
	numeroBoleto varchar(255),
	vencimento date,
	
	constraint fk_idPagamento_boleto foreign key (idPagamento) references pagamento(idPagamento)
);


