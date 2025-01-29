use ecommerce

-- Cliente, compra e valores pagos
select c.idCliente idCliente, cli.nome nome, c.idCompra, p.descricao nome_produto, p.valor , c.quantidade_produto, c.frete, p2.valor valor_total from compra c 
inner join produto p 
inner join pagamento p2 
inner join cliente cli
on c.idProduto = p.idProduto and c.idCompra = p2.idCompra and cli.idCliente = c.idCliente 
order by c.idCliente 

-- Selecionar nome, descricao, status da entrega e codigo de rastreio do pedido
select c.idCliente id_cliente, cli.nome nome_cliente, p.descricao nome_produto, e.status status_entrega, e.cod_rastreio codigo_rastreio from compra c
inner join cliente cli
inner join produto p
inner join entrega e
on c.idCliente = cli.idCliente and c.idProduto = p.idProduto and c.idEntrega = e.idEntrega 

-- Selecionar categoria, preço e a quantidade de produtos vendidos pelas lojas de SP
select t.razao loja, p.categoria tipo, p.valor, vt.quantidade_a_venda from venda_terceiro vt
inner join terceiro_vendedor t
inner join produto p
on t.id3  = vt.id3 and p.idProduto = vt.idProduto 
where t.local = 'São Paulo'
GROUP BY t.razao, p.categoria, p.valor, vt.quantidade_a_venda;

-- Gastos por produtos comprados de fornecedores
select f.razao fornecedor, p.descricao produto, p.valor valor_produto, forn.quantidade_fornecida quantidade_fornecida, p.valor* forn.quantidade_fornecida gasto_total from fornece forn 
inner join fornecedor f
inner join produto p
on forn.idFornecedor = f.idFornecedor and forn.idProduto = p.idProduto 

-- Ordenar a quantidade de produtos por compra trazendo a categoria
select c.idCompra compra, p.categoria tipo_produto, c.quantidade_produto quantidade from compra c
inner join produto p 
on c.idProduto=p.idProduto 
order by c.quantidade_produto 


-- Ordenar a quantidade de compras por estado
select p.descricao, sum(c.quantidade_produto) total , cli.estado estado_compra from compra c
inner join cliente cli 
inner join produto p 
on c.idCliente = cli.idCliente and c.idProduto = p.idProduto 
group by p.descricao, c.quantidade_produto, cli.estado 


-- Quantidade de clientes que ja tiveram o pedido entregue
select count(c.idCliente) quantidade_clientes, e.status from compra c
inner join entrega e 
on c.idEntrega = e.idEntrega 
where e.status = 'Entregue';
