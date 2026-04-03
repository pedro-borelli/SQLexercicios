-- Criando as tabelas produtos e vendas:
CREATE TABLE Produtos(
  id_produto INT PRIMARY KEY,
  nome VARCHAR(100),
  preco DECIMAL(10, 2),
  categoria VARCHAR(50));

CREATE TABLE Vendas(
  id_venda INT PRIMARY KEY,
  id_produto INT,
  quantidade INT,
  data_venda DATE,
  FOREIGN KEY (id_produto) REFERENCES Produtos(id_produto));
  
  
 -- Inserindo dados na tabela produtos:
INSERT INTO  Produtos(id_produto, nome, preco, categoria) VALUES
(1, 'Smartphone Samsung', 1500.00, 'Eletrônicos'),
(2, 'Notebook Dell', 3500.00, 'Eletrônicos'),
(3, 'Fone de Ouvido', 80.00, 'Acessórios'),
(4, 'Mouse sem Fio', 120.00, 'Acessórios'),
(5, 'Monitor 24 Polegadas', 900.00, 'Eletrônicos');
 
  
-- Inserindo dados na tabela de Vendas
INSERT INTO Vendas(id_venda, id_produto, quantidade, data_venda) VALUES
(101, 1, 2, '01-03-2026'),
(102, 3, 5, '2026-03-02'),
(103, 2, 1, '2026-03-05'),
(104, 4, 10, '2026-03-10');


--Consultando apenas a categoria 'ACESSORIOS'
SELECT nome, preco
FROM Produtos
WHERE categoria = 'Acessórios';


--A soma dos preços de todos os produtos agrupados por categoria
SELECT categoria, SUM(preco)
FROM Produtos
GROUP BY categoria;


--A soma dos preços de todos os produtos agrupados por categoria com o uso do WHERE
SELECT categoria, SUM(preco)
FROM Produtos
WHERE preco > 100
GROUP BY categoria;

--A soma dos preços de todos os produtos agrupados por categoria com o uso do HAVING
SELECT categoria, SUM(preco)
FROM Produtos
GROUP BY categoria
HAVING SUM(preco) > 1000;

--Desafio final
SELECT categoria, SUM(preco)
FROM Produtos
WHERE preco > 50
GROUP BY categoria
HAVING SUM(preco) > 500
ORDER BY SUM(preco) desc;

-- Unir duas tabelas vendas com produtos
SELECT Produtos.nome, Vendas.quantidade 
FROM Produtos
INNER JOIN Vendas
ON Produtos.id_produto = Vendas.id_produto;


--Unir duas tebalas usando GROUP BY
SELECT Produtos.nome, SUM(Vendas.quantidade) 
FROM Produtos
INNER JOIN Vendas
on Produtos.id_produto = Vendas.id_produto
group by Produtos.nome;


--Dar nome a coluna de soma
SELECT Produtos.nome, SUM(Vendas.quantidade) as Total_Vendido
FROM Produtos
INNER JOIN Vendas
ON Produtos.id_produto = Vendas.id_produto
GROUP BY Produtos.nome
HAVING Total_Vendido > 5;


--Exercicio faturamento
SELECT Produtos.nome, SUM(Vendas.quantidade * Produtos.preco) as Faturamento_Total
FROM Produtos
INNER JOIN Vendas
ON Produtos.id_produto = Vendas.id_produto
GROUP BY Produtos.nome
HAVING Faturamento_Total > 500;


--Desafio Final de Revisão
SELECT Produtos.categoria, SUM(Vendas.quantidade * Produtos.preco) AS Faturamento_Total
FROM Produtos
INNER JOIN Vendas
ON Produtos.id_produto = Vendas.id_produto
where Vendas.data_venda > '2026-03-01'
GROUP BY Produtos.categoria
ORDER BY Faturamento_Total DESC;


-- Usando LEFT JOIN
SELECT Produtos.id_produto, nome , COALESCE(SUM(Vendas.quantidade * Produtos.preco), 0) AS Total
FROM Produtos
LEFT JOIN Vendas
ON Produtos.id_produto = Vendas.id_produto
GROUP BY Produtos.id_produto, Produtos.nome
ORDER BY Total DESC;

-- SUBqueries desafios
SELECT nome, preco
FROM Produtos
WHERE preco > (SELECT AVG (preco) FROM Produtos WHERE categoria = 'Eletrônicos');



-- Exercicio Inner Join
SELECT nome as Produto , quantidade AS Total
FROM Produtos
INNER JOIN Vendas
ON Produtos.id_produto = Vendas.id_produto
GROUP BY Produtos.nome, Vendas.quantidade
ORDER BY Produto, Total DESC;


-- Listagem Simples com Join: Liste o nome do produto e a quantidade de cada venda realizada. (Sem somar, apenas para conferir os dados).
SELECT nome, quantidade
FROM Produtos
INNER JOIN Vendas
ON Produtos.id_produto = Vendas.id_produto;


-- Soma por Produto: Mostre o nome do produto e o total de unidades vendidas de cada um (Use SUM e GROUP BY).
SELECT nome, SUM(Vendas.quantidade) AS Total_vendido
FROM Produtos
INNER JOIN Vendas
on Produtos.id_produto = Vendas.id_produto
GROUP BY Produtos.nome
ORDER BY Total_vendido;


--Filtro de Quantidade: Mostre o nome do produto e o total de unidades vendidas, mas apenas para produtos que venderam mais de 2 unidades no total.
SELECT nome, SUM(Vendas.quantidade) as Total_Vendido
FROM Produtos
INNER JOIN Vendas
ON Produtos.id_produto = Vendas.id_produto
GROUP by Produtos.nome
HAVING Total_Vendido > 2;


--Cálculo de Faturamento: Mostre o nome do produto e o valor total arrecadado (quantidade * preço). Chame essa coluna de Faturamento.
SELECT nome, SUM(Vendas.quantidade * preco) AS Faturamento
FROM Produtos
INNER JOIN Vendas
ON Produtos.id_produto = Vendas.id_produto
GROUP BY Produtos.nome
ORDER BY Faturamento DESC;

--Relatório de Categorias: Mostre o nome da categoria e o faturamento total de cada categoria, ordenando do maior faturamento para o menor.
SELECT categoria, SUM(Vendas.quantidade * preco) AS Faturamento
FROM Produtos
INNER JOIN Vendas
ON Produtos.id_produto = Vendas.id_produto
GROUP BY Produtos.categoria
ORDER BY Faturamento DESC;

