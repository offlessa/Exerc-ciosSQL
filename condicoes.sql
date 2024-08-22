SELECT *
FROM item pedido
WHERE valor unitário > 30
AND valor unitário < 40;

SELECT *
FROM item pedido
WHERE NOT (valor unitário > 30
AND valor unitário < 40);

SELECT *
FROM item pedido
WHERE valor unitário >= 50 OR valor unitário <= 10;

SELECT *
FROM item pedido
WHERE (valor unitário >= 50 OR valor unitário <= 10)
AND quantidade = 1;

SELECT *
FROM item pedido
WHERE (valor unitário >= 50 OR valor unitário <= 10)
AND quantidade <> 1;

SELECT *
FROM cliente_pf
WHERE id >= 4
AND id <= 6;

SELECT *
FROM cliente_pf
WHERE id BETWEEN 4 AND 6;

SELECT *
FROM cliente_pf
WHERE id IN (4,6);

SELECT *
FROM cliente_pf
WHERE nome LIKE = 'Guilherme%';

SELECT *
FROM cliente_pf
WHERE nome LIKE = '%Mota';

SELECT *
FROM cliente_pf
WHERE nome LIKE = '%Edson%';

SELECT *
FROM cliente_pf
WHERE nome LIKE = '%Ed_on%';

SELECT *
FROM cliente_pf
WHERE nome LIKE = '_a%';

SELECT *
FROM cliente_pf
WHERE ativo is TRUE
ORDER BY data_nascimento DESC, nome;

--------------AGRUPAMENTO--------------

SELECT DISTINCT sexo
FROM cliente_pf;

SELECT id, nome
FROM cliente_pf
UNION ALL
SELECT id, razao_social
FROM cliente_pj;

SELECT id, nome, 'FÍSICA' :: VARCHAR AS tipo
FROM cliente_pf
UNION ALL
SELECT id, razao_social, 'JURÍDICA' :: VARCHAR AS tipo
FROM cliente_pj;

SELECT COUNT(*) AS contador
FROM cliente_pf;

SELECT COUNT(DISTINCT sexo) AS contador_sexo
FROM cliente_pf;

SELECT SUN(valor_unitario) AS soma_valor_unitario
FROM item pedido;

SELECT SUN(quantidade * valor_unitario) AS total_compra
FROM item pedido;

SELECT AVG(quantidade * valor_unitario) AS ticket_media
FROM item pedido;

SELECT ROUND (AVG(quantidade * valor_unitario), 2) AS ticket_media
FROM item pedido;

SELECT MAX(valor unitario)
FROM item pedido;

SELECT MIN(valor unitario)
FROM item pedido;

SELECT MAX(id) + 1 AS proximo_valor
FROM cliente;

SELECT COALESCE (MAX(id),0) + 1 AS proximo_valor
FROM cliente;

SELECT 
    id_pedido AS pedido,
    COUNT(*) AS quantidade_itens, 
    SUM(quantidade * valor_unitario) AS valor_compra 
FROM item pedido
INNER JOIN pedido ON (pedido.id = item_pedido.id_pedido)
INNER JOIN cliente ON (cliente.id = pedido.id_cliente)
GROUP BY id_pedido;

SELECT *
FROM item_pedido
