
--1. Retorna todos os registros da tabela item_pedido onde o valor_unitario está entre 30 e 40.
SELECT *
FROM item pedido
WHERE valor unitário > 30
AND valor unitário < 40;

--2. Retorna todos os registros onde o valor_unitario não está entre 30 e 40.
SELECT *
FROM item pedido
WHERE NOT (valor unitário > 30
AND valor unitário < 40);

--3. Retorna todos os registros onde o valor_unitario é menor ou igual a 10, ou maior ou igual a 50.
SELECT *
FROM item pedido
WHERE valor unitário >= 50 OR valor unitário <= 10;

--4. Retorna registros onde o valor_unitario é menor ou igual a 10 ou maior ou igual a 50, e a quantidade é exatamente 1.
SELECT *
FROM item pedido
WHERE (valor unitário >= 50 OR valor unitário <= 10)
AND quantidade = 1;

--5. Retorna registros onde o valor_unitario está fora do intervalo de 10 a 50 e a quantidade não é 1.
SELECT *
FROM item pedido
WHERE (valor unitário >= 50 OR valor unitário <= 10)
AND quantidade <> 1;

--6. Retorna clientes cujo id está entre 4 e 6
SELECT *
FROM cliente_pf
WHERE id >= 4
AND id <= 6;

--7. Retorna clientes cujo id está entre 4 e 6, usando a sintaxe BETWEEN.
SELECT *
FROM cliente_pf
WHERE id BETWEEN 4 AND 6;

--8. Retorna clientes com IDs 4 ou 6.
SELECT *
FROM cliente_pf
WHERE id IN (4,6);

--9. Retorna clientes cujo nome começa com 'Guilherme'.
SELECT *
FROM cliente_pf
WHERE nome LIKE = 'Guilherme%';

--10. Retorna clientes cujo nome termina com 'Mota'.
SELECT *
FROM cliente_pf
WHERE nome LIKE = '%Mota';

--11. Retorna clientes cujo nome contém 'Edson' em qualquer posição.
SELECT *
FROM cliente_pf
WHERE nome LIKE = '%Edson%';

--12. Retorna clientes cujo nome contém 'Ed_on', com um caractere desconhecido no lugar do '_'.
SELECT *
FROM cliente_pf
WHERE nome LIKE = '%Ed_on%';

--13. Retorna clientes cujo nome contém qualquer caractere seguido de 'a' e mais caracteres após isso.
SELECT *
FROM cliente_pf
WHERE nome LIKE = '_a%';

--14. Retorna clientes ativos e ordena os resultados pela data de nascimento em ordem decrescente e, em seguida, pelo nome.
SELECT *
FROM cliente_pf
WHERE ativo is TRUE
ORDER BY data_nascimento DESC, nome;

--------------AGRUPAMENTO--------------

--1. Retorna uma lista de valores únicos para a coluna sexo.
SELECT DISTINCT sexo
FROM cliente_pf;

--2. Retorna a lista de IDs e nomes de clientes, combinando dados de clientes físicos e jurídicos sem remover duplicações.
SELECT id, nome
FROM cliente_pf
UNION ALL
SELECT id, razao_social
FROM cliente_pj;

--3. Retorna uma lista de IDs, nomes e tipos de cliente (FÍSICO ou JURÍDICO) combinando dados de clientes físicos e jurídicos.
SELECT id, nome, 'FÍSICA' :: VARCHAR AS tipo
FROM cliente_pf
UNION ALL
SELECT id, razao_social, 'JURÍDICA' :: VARCHAR AS tipo
FROM cliente_pj;

--4. Retorna o número total de registros na tabela cliente_pf.
SELECT COUNT(*) AS contador
FROM cliente_pf;

--5. Retorna o número de valores distintos na coluna sexo da tabela cliente_pf.
SELECT COUNT(DISTINCT sexo) AS contador_sexo
FROM cliente_pf;

--6. Retorna a soma total dos valores unitários dos itens na tabela item_pedido.
SELECT SUN(valor_unitario) AS soma_valor_unitario
FROM item pedido;

--7. Retorna a soma do valor total de compra.
SELECT SUN(quantidade * valor_unitario) AS total_compra
FROM item pedido;

--8. Retorna a média do valor total de compra.
SELECT AVG(quantidade * valor_unitario) AS ticket_media
FROM item pedido;

--9. Retorna a média dos valores de compra arredondada para duas casas decimais.
SELECT ROUND (AVG(quantidade * valor_unitario), 2) AS ticket_media
FROM item pedido;

--10. Retorna o valor máximo encontrado na coluna valor_unitario.
SELECT MAX(valor unitario)
FROM item pedido;

--11. Retorna o valor mínimo encontrado na coluna valor_unitario. 
SELECT MIN(valor unitario)
FROM item pedido;

--12. Retorna o próximo valor possível para a coluna id, com base no valor máximo atual. 
SELECT MAX(id) + 1 AS proximo_valor
FROM cliente;

--13. Retorna o próximo valor possível para a coluna id, considerando a possibilidade de tabela vazia (usando COALESCE para lidar com valores nulos).
SELECT COALESCE (MAX(id),0) + 1 AS proximo_valor
FROM cliente;

--14. A consulta tem como objetivo gerar um resumo para cada pedido, incluindo a quantidade total de itens e o valor total de cada pedido.
SELECT 
    id_pedido AS pedido,
    COUNT(*) AS quantidade_itens, 
    SUM(quantidade * valor_unitario) AS valor_compra 
FROM item pedido
INNER JOIN pedido ON (pedido.id = item_pedido.id_pedido)
INNER JOIN cliente ON (cliente.id = pedido.id_cliente)
GROUP BY id_pedido;

