use ecommerce

insert into cliente values 
	(1, "Thiago", "PF", "53155007", "149", "Rua Taquaritinga", "Casa Amarela", "Recife", "PE"),
	(2, "Eduarda", "PF", "53040150", "672", "Av Coronel Frederico Lundgren", "Rio Doce", "Olinda", "PE"),
	(3, "Severina", "PJ", "52141195", "560", "Linha do Tiro", "Beberibe", "Recife", "PE");


insert into cliente_PF values 
	(1, "11223344556"), 
	(2, "6554433221");

insert into cliente_PJ values 
	(3, "1234567891011");


insert into entrega values 
	(1,"A caminho", "PANELA244" ), 
	(2,"Solicitado", "CHAFARIZ987" ),
	(3,"Entregue", "PEDREGULHO765" );

insert into terceiro_vendedor values 
	(1, "Beleza na Web", "São Paulo"), 
	(2, "Juba Colorida", "Minas Gerais");

insert into produto values
	(1, "Maquiagem", "Lip Chilly By Francine", 22.99), 
	(2, "Capilar", "Shampoo Eudora Cres Acelerado", 44.45), 
	(3, "Capilar", "Condicionador Eudora Cresc Acelerado", 48.99), 
	(4, "Skin care", "Niacinamida Creamy", 90.00),
	(5, "Corporal","Desodorante Nivea Black White", 16.89),
	(6, "Corporal", "Hidratante Paixão Sedução", 14.99),
	(7, "Limpeza", "Depilmel Cera Fria em Papel", 20),
	(8, "Maquiagem", "Dior Backstage Cor 007", 309.80);


insert into venda_terceiro values 
	(1, 1, 20), 
	(1, 4, 20), 
	(1, 7, 20), 
	(1, 8, 20), 
	(2, 2, 40), 
	(2, 3, 40), 
	(2, 5, 40), 
	(2, 6, 40);


insert into estoque values 
	(100, "SP"), 
	(200, "MG"),
	(300, "PE"), 
	(400, "BA");


insert into armazena values 
	(100, 1, 100), (100, 4, 100), (100, 8, 100),
	(200, 2, 200), (200, 3, 200),
	(300, 5, 100), (300, 6, 100),
	(400, 7, 200), (400, 1, 60);



insert into compra (idCompra, idCliente, idEntrega, idProduto, status, frete, quantidade_produto) values 
	(1, 1, 1, 1, "Pago", 15.99, 3),  
	(2, 1, 1, 2, "Pago", 0, 2), 
	(3, 2, 2, 4, "Pago", 16.00, 1), 
	(4, 2, 2, 5, "Pago", 0, 1), 
	(5, 2, 2, 6, "Pago", 0, 2), 
	(6, 2, 2, 7, "Pago", 0, 1), 
	(7, 3, 3, 8, "Pago", 20.00, 1); 



insert into fornecedor (idFornecedor, razao, CNPJ) values 
	(1, "Distribuidora Makes", "99999999999999"),
	(2, "Comercial Cuidados", "88888888888888"),
	(3, "Fornecedora Alfa", "77777777777777");

insert into fornece (idFornecedor, idProduto, quantidade_fornecida) values 
	(1, 1, 300), 
	(1, 4, 300), 
	(2, 2, 100), 
	(2, 3, 300), 
	(3, 5, 200), 
	(3, 6, 150),
	(3, 7, 150),
	(3, 8, 150);

-- Inserir aqui a soma dos valores de acordo com os produtos comprados por cada pessoa
insert into pagamento (idPagamento, idCompra, valor, data) values 
	(1, 1, 0.00, '2024-06-10'),
	(2, 2, 0.00, '2024-11-11'),
	(3, 4, 0.00, '2024-09-11'),
	(4, 5, 0.00, '2024-01-09'),
	(5, 6, 0.00, '2024-05-07'),
	(6, 7, 0.00, '2024-01-20'), 
	(7, 7, 0.00, '2024-07-20'),










