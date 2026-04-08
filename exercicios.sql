-- Parte 1: Criando o Banco de Dados

--Tabela de Clientes
CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(100),
    sobrenome VARCHAR(100),
    email VARCHAR(150),
    data_nascimento DATE,
    cidade VARCHAR(50),
    estado CHAR(2),
    data_cadastro DATE,
    vip BOOLEAN, -- Se o cliente é do programa fidelidade
    limite_credito DECIMAL(10,2)
);

--Tabela de Produtoz
CREATE TABLE Produtoz (
    id_produto INT PRIMARY KEY,
    nome_produto VARCHAR(100),
    categoria VARCHAR(50),
    fornecedor VARCHAR(100),
    preco_custo DECIMAL(10,2),
    preco_venda DECIMAL(10,2),
    estoque_atual INT,
    estoque_minimo INT,
    data_inclusao DATE,
    ativo BOOLEAN
);

--Parte 2: Inserindo os Dados (Conteúdo)
-- Inserindo Clientes
INSERT INTO Clientes VALUES 
(1, 'Ana', 'Silva', 'ana.silva@email.com', '1990-05-15', 'São Paulo', 'SP', '2023-01-10', TRUE, 5000.00),
(2, 'Bruno', 'Oliveira', 'bruno.o@email.com', '1985-08-22', 'Rio de Janeiro', 'RJ', '2023-02-15', FALSE, 1500.00),
(3, 'Carla', 'Santos', 'carla.santos@email.com', '1992-12-01', 'Curitiba', 'PR', '2023-03-20', TRUE, 8000.00),
(4, 'Diego', 'Souza', 'diego.s@email.com', '1988-03-10', 'Belo Horizonte', 'MG', '2023-01-05', FALSE, 2000.00),
(5, 'Elena', 'Costa', 'elena.c@email.com', '1995-07-30', 'Porto Alegre', 'RS', '2023-05-12', TRUE, 10000.00),
(6, 'Fabio', 'Lima', 'fabio.l@email.com', '1982-11-14', 'São Paulo', 'SP', '2023-04-02', FALSE, 1200.00),
(7, 'Gisele', 'Rocha', 'gisele.r@email.com', '1998-01-25', 'Salvador', 'BA', '2023-06-18', TRUE, 4500.00),
(8, 'Hugo', 'Mendes', 'hugo.m@email.com', '1979-09-05', 'Manaus', 'AM', '2023-02-28', FALSE, 3000.00),
(9, 'Iara', 'Farias', 'iara.f@email.com', '1991-04-12', 'Fortaleza', 'CE', '2023-07-01', TRUE, 6000.00),
(10, 'João', 'Pinto', 'joao.p@email.com', '1987-10-20', 'São Paulo', 'SP', '2023-03-15', FALSE, 2500.00);

-- Inserindo Produtos
INSERT INTO Produtoz VALUES 
(1, 'Smartphone X', 'Eletrônicos', 'TechCorp', 800.00, 1500.00, 50, 10, '2023-01-01', TRUE),
(2, 'Notebook Pro', 'Eletrônicos', 'LapTop Co', 2500.00, 4500.00, 20, 5, '2023-01-15', TRUE),
(3, 'Cadeira Gamer', 'Móveis', 'Conforto S/A', 300.00, 850.00, 15, 5, '2023-02-10', TRUE),
(4, 'Monitor 27', 'Eletrônicos', 'Vision', 400.00, 1200.00, 30, 8, '2023-02-20', TRUE),
(5, 'Teclado Mecânico', 'Acessórios', 'ClickKeys', 150.00, 450.00, 100, 20, '2023-03-05', TRUE),
(6, 'Mouse Sem Fio', 'Acessórios', 'ClickKeys', 50.00, 150.00, 200, 30, '2023-03-05', TRUE),
(7, 'Mesa de Escritório', 'Móveis', 'Conforto S/A', 200.00, 600.00, 10, 3, '2023-04-12', TRUE),
(8, 'Fone Bluetooth', 'Áudio', 'SoundMax', 120.00, 350.00, 80, 15, '2023-05-01', TRUE),
(9, 'Caixa de Som', 'Áudio', 'SoundMax', 250.00, 700.00, 40, 10, '2023-05-15', TRUE),
(10, 'Webcam HD', 'Acessórios', 'Vision', 100.00, 280.00, 60, 10, '2023-06-01', FALSE);


--Parte 3: A Maratona de 50 Exercícios
--Nível 1: SELECT e Filtros Básicos (WHERE, ORDER BY, LIMIT) 

--1) Selecione todos os nomes e e-mails da tabela Clientes.
SELECT nome, email FROM Clientes;

--2) Liste os produtos da categoria 'Eletrônicos'.
SELECT nome_produto
FROM Produtos
where categoria = 'Eletrônicos';


--3) Mostre o nome e o preço de venda dos produtos que custam mais de 1000 reais.
SELECT nome_produto, preco_venda
FROM Produtos
WHERE preco_venda > 1000;

--4) Liste os clientes que moram em 'São Paulo'.
SELECT nome, cidade
FROM Clientes
WHERE cidade = 'São Paulo';

--5) Selecione os 3 primeiros clientes cadastrados na tabela.
SELECT nome, data_cadastro
FROM Clientes
ORDER BY data_cadastro ASC
LIMIT 3;

--6) Liste os produtos que não estão ativos (campo ativo).
SELECT nome_produto, ativo
FROM Produtos
WHERE ativo = 0;

--7) Nome e sobrenome ordenados pelo sobrenome: (Dica: ORDER BY sobrenome).
SELECT nome, sobrenome
FROM Clientes
ORDER BY sobrenome;

--8) Liste produtos com estoque atual entre 10 e 50 unidades.
SELECT nome_produto, estoque_atual
FROM Produtos
WHERE estoque_atual BETWEEN 10 AND 50;

--9) Encontre clientes que tenham 'Silva' no sobrenome.
SELECT nome, sobrenome
FROM Clientes
WHERE sobrenome LIKE '%Silva%';

--10) Liste produtos das categorias 'Móveis' ou 'Áudio'.
SELECT nome_produto, categoria
from Produtos
where categoria IN ('Móveis','Áudio');


--Bloco 2: Matemática e Agregações (11-20) 
--Foco: SUM, AVG, MAX, MIN, COUNT e Operadores Matemáticos.

--11. Calcule o valor total do estoque (preço de venda × estoque).
SELECT SUM(preco_venda * estoque_atual) AS Total_estoque
FROM Produtos
Total_estoque;


--12. Calcule o lucro unitário de cada produto (venda - custo).
SELECT nome_produto, (preco_venda - preco_custo) AS Lucro_Unitario
FROM Produtos
Lucro_Unitario;

--13. Qual a média de limite de crédito dos clientes?
SELECT AVG(limite_credito) AS Media_limite
FROM Clientes;


--14. Qual o maior preço de venda da loja?
SELECT MAX(preco_venda) as Maior_preco
FROM Produtos;


--15. Quantos produtos existem na categoria 'Acessórios'?
SELECT COUNT(*) AS Quantidade
FROM Produtos
where categoria = 'Acessórios';


--16. Qual a média de preço dos produtos ativos?
SELECT AVG(preco_venda) AS Media_preco
FROM Produtos
where ativo = 1;

--17. Quantos clientes nasceram antes de 1990?
SELECT COUNT(id_cliente) AS Nascidos_antes
FROM Clientes
WHERE data_nascimento < '1990-01-01';

--18. Qual o menor preço de custo da tabela?
SELECT MIN(preco_custo) AS Menor_custo
FROM Produtos;

--19. Somar o limite de crédito apenas dos clientes VIP.
select SUM(limite_credito) as Clientes_VIP
FROM Clientes
WHERE vip = 1;

--20. Contar quantos fornecedores diferentes existem (usando DISTINCT).
SELECT COUNT(DISTINCT fornecedor) as Quantidade_Fornecedores
FROM Produtos;

--Bloco 3: Agrupamentos e Filtros de Grupo (21-30) 
--Foco: GROUP BY e HAVING.

--21. Conte quantos produtos existem por categoria.
SELECT categoria, COUNT(*) as Quantidade
FROM Produtos
GROUP BY categoria;

--22. Calcule a média de preço de venda por categoria.
SELECT categoria, AVG(preco_venda) AS Media_preco 
from Produtos
group by categoria;

--23. Mostre o faturamento potencial por fornecedor.
select fornecedor, SUM(preco_venda * estoque_atual) AS Potencial_Faturamento
FROM Produtos
GROUP BY fornecedor;

--24. Liste categorias que têm mais de 2 produtos.
SELECT categoria
from Produtos
group by categoria
HAVING COUNT(*) > 2;

--25. Qual a média de limite de crédito por estado?
SELECT estado, AVG(limite_credito) as Media_Estado
FROM Clientes
GROUP BY estado;

--26. Mostre o total de estoque por fornecedor, mas só para quem tem mais de 50 itens.
SELECT fornecedor, SUM(estoque_atual) AS Total_estoque_fornecedor
FROM Produtos
GROUP BY fornecedor
HAVING Total_estoque_fornecedor > 50;

--27. Quantos clientes VIP existem em cada cidade?
SELECT cidade, COUNT(vip) AS Clientes_VIP
FROM Clientes
WHERE vip = 1
group by cidade;

--28. Qual o lucro total esperado por categoria?
SELECT categoria, SUM(preco_venda - preco_custo * estoque_atual) as Lucro_total
FROM Produtos
GROUP BY categoria;

--29. Liste fornecedores que possuem média de preço de custo acima de R$ 200.
SELECT fornecedor, AVG(preco_custo) AS Media_custo
FROM Produtos
group by fornecedor
having Media_custo > 200;

--30. Agrupe os clientes por ano de nascimento.
SELECT strftime('%Y', data_nascimento) AS Ano, COUNT(*) AS Total_Clientes
FROM Clientes
GROUP BY strftime('%Y', data_nascimento);


--Bloco 4: Datas e Tipos de Dados (31-40) 
--Foco: Funções de data e manipulação de strings.


--31. Liste clientes cadastrados no ano de 2023.
SELECT nome, data_cadastro
FROM Clientes
WHERE strftime('%Y', data_cadastro) = '2023';

--32. Mostre o nome do cliente e apenas o ano de nascimento.
SELECT nome, strftime('%Y', data_nascimento) AS ANO_NASC
FROM Clientes;

--33. Quantos dias fazem que cada produto foi incluído no sistema?
SELECT nome_produto, CAST(julianday('now') - julianday(data_inclusao) AS INT) AS Dias_No_Sistema
FROM Produtos;


--34. Liste clientes que fazem aniversário no mês atual.
SELECT nome, data_nascimento
FROM Clientes
WHERE strftime('%m', data_nascimento) = strftime('%m', 'now');

--35. Transforme todos os nomes de produtos para letras maiúsculas.
SELECT UPPER(nome_produto) AS Nome_grande 
FROM Produtos;

--36. Concatene Nome e Sobrenome dos clientes em uma única coluna.
SELECT nome || ' ' || sobrenome AS Nome_Completo 
FROM Clientes;

--37. Liste produtos incluídos na primeira quinzena de qualquer mês.
select nome_produto, strftime('%d', data_inclusao)
from Produtos
where strftime('%d', data_inclusao) <= '15';

--38. Filtre clientes com e-mail do domínio '@email.com'.
select email
from Clientes
where email LIKE '%@email.com';


--39. Mostre o preço de venda arredondado para cima.
SELECT ROUND(preco_venda + 0.5) AS Preco_arredonda
from Produtos;

--40. Verifique quais clientes têm limite de crédito par.
SELECT nome, limite_credito
FROM Clientes
WHERE limite_credito % 2 = 0;

--Bloco 5: Subqueries e Lógica Avançada (41-50) 
--Foco: Consultas aninhadas e correlações.

--41. Liste produtos com preço acima da média geral.
SELECT nome_produto, preco_venda
FROM Produtos
WHERE preco_venda > (SELECT AVG(preco_venda)FROM Produtos);

--42. Encontre o cliente com o maior limite de crédito usando uma subquery.
SELECT nome, limite_credito
from Clientes
WHERE limite_credito = (SELECT MAX(limite_credito) FROM Clientes);


--43. Liste produtos que pertencem à categoria com mais itens no estoque.
SELECT nome_produto, preco_venda, categoria  -- 1. O que queremos mostrar no final.
FROM Produtos                               -- 2. De onde vêm esses dados.
WHERE categoria = (                         -- 3. O "filtro" que espera uma resposta.
  SELECT categoria                          -- 4. O que a subquery vai nos "responder".
  FROM Produtos                             -- 5. Onde a subquery vai procurar.
  GROUP BY categoria                        -- 6. Como ela vai organizar os dados.
  ORDER BY SUM(estoque_atual) DESC          -- 7. Como ela vai decidir quem é o melhor.
  LIMIT 1                                   -- 8. Pega só o primeiro da lista.
);

--44. Mostre o nome do produto e quanto ele representa (em %) do estoque total.
SELECT nome_produto, (estoque_atual * 100.0 / (SELECT SUM(estoque_atual) FROM Produtos)) AS Porcentagem
FROM Produtos;

--45. Liste o nome do cliente e o nome do produto que ele comprou.
SELECT Clientes.nome, Produtos.nome_produto
FROM Clientes
INNER JOIN Produtos ON Clientes.id_cliente = Produtos.id_produto;

--46. Liste o nome do cliente e o valor total dos produtos que estão vinculados a ele.
SELECT Clientes.nome, SUM(Produtos.preco_venda) AS Total_Gasto
FROM Clientes
INNER JOIN Produtos ON Clientes.id_cliente = Produtos.id_produto
GROUP BY Clientes.nome;

-- 47. Liste o nome do cliente e o nome do produto, mas apenas para produtos que o cliente teria saldo para comprar à vista usando todo o seu limite_credito.
SELECT Clientes.nome, Produtos.nome_produto, Clientes.limite_credito, Produtos.preco_venda
FROM Clientes
INNER JOIN Produtos ON Clientes.limite_credito >= Produtos.preco_venda;

-- 48. Gere uma lista que mostre o nome de todos os clientes que moram em 'São Paulo' e, ao lado, todos os produtos da categoria 'Acessórios'.
SELECT Clientes.nome, Produtos.nome_produto
FROM Clientes, Produtos
WHERE Clientes.estado = 'SP' 
  AND Produtos.categoria = 'Acessórios';

