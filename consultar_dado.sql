--Exemplo de consulta de dados
SELECT * FROM Cliente;

                                   
--|01|----------------------------------------------------| 
--Construa duas consultas SQL e faça o join de acordo com o modelo acima. 
--O primeiro SQL deve apresentar o resultado de todos os alunos independente de ter ou não cidade e signo preenchido. 
--O segundo SQL deve trazer apenas alunos com cidade e signo preenchidos. Trate colunas duplicadas se  houver.

SELECT 
    a.id AS aluno_id, 
    a.nome AS aluno_nome, 
    a.cpf, 
    a.rg, 
    a.data_nascimento, 
    a.sexo, 
    a.mae, 
    a.celular, 
    a.tipo_sanguineo, 
    a.altura, 
    a.peso, 
    c.cidade, 
    c.estado, 
    s.nome AS signo
FROM aluno a
LEFT JOIN cidade c ON a.id_cidade = c.id
LEFT JOIN signo s ON a.id_signo = s.id;


SELECT 
    a.id AS aluno_id, 
    a.nome AS aluno_nome, 
    a.cpf, 
    a.rg, 
    a.data_nascimento, 
    a.sexo, 
    a.mae, 
    a.celular, 
    a.tipo_sanguineo, 
    a.altura, 
    a.peso, 
    c.cidade, 
    c.estado, 
    s.nome AS signo
FROM  aluno a
INNER JOIN cidade c ON a.id_cidade = c.id
INNER JOIN signo s ON a.id_signo = s.id
WHERE a.id_cidade IS NOT NULL 
AND a.id_signo IS NOT NULL; 
  
--|02|----------------------------------------------------| 
--Selecione os dados do aluno, cidade e signo aplicando os seguintes filtros. 
--Aluno com altura maior que 1.90 que tenha o tipo sanguíneo “o” que possua signo e que tenha peso maior ou igual a 70.

SELECT 
    a.id AS aluno_id, 
    a.nome AS aluno_nome, 
    a.cpf, 
    a.rg, 
    a.data_nascimento, 
    a.sexo, 
    a.mae, 
    a.celular, 
    a.tipo_sanguineo, 
    a.altura, 
    a.peso, 
    c.cidade, 
    c.estado, 
    s.nome AS signo
FROM 
    aluno a
INNER JOIN 
    cidade c ON a.id_cidade = c.id
LEFT JOIN 
    signo s ON a.id_signo = s.id
WHERE 
    a.altura > 1.90
    AND a.tipo_sanguineo ILIKE '%O%'
    AND a.peso >= 70;
    
--|03|----------------------------------------------------| 
--Selecione os dados do aluno e cidade aplicando os seguintes filtros. 
--Alunos que não sejam do estado de SC, do sexo feminino e que nasceram entre 01/01/1990 e 01/01/2000.

SELECT 
    a.id AS aluno_id, 
    a.nome AS aluno_nome, 
    a.cpf, 
    a.rg, 
    a.data_nascimento, 
    a.sexo, 
    a.mae, 
    a.celular, 
    c.cidade, 
    c.estado
FROM 
    aluno a
INNER JOIN 
    cidade c ON a.id_cidade = c.id
WHERE 
    c.estado <> 'SC'
    AND a.sexo = 'M'
    AND a.data_nascimento BETWEEN '1990-01-01' AND '2000-01-01';
    
--|04|----------------------------------------------------|
--Selecione os dados do aluno, cidade e signo aplicando os seguintes filtros: 
--Alunos do signo de “Virgem” que tenham peso entre 80 e 90 quilos e que morem na cidade de Blumenau/SC.

SELECT 
    a.id AS aluno_id, 
    a.nome AS aluno_nome, 
    a.cpf, 
    a.rg, 
    a.data_nascimento, 
    a.sexo, 
    a.mae, 
    a.celular, 
    a.tipo_sanguineo, 
    a.altura, 
    a.peso, 
    c.cidade, 
    c.estado, 
    s.nome AS signo
FROM 
    aluno a
INNER JOIN 
    cidade c ON a.id_cidade = c.id
LEFT JOIN signo s ON a.id_signo = s.id
WHERE 
    c.cidade = 'Blumenau'
    AND a.peso BETWEEN 80 AND 90
    AND s.nome ILIKE '%Virgem%';
   
--|05|----------------------------------------------------|
--Selecione os dados do aluno e cidade aplicando os seguintes filtros:
--Alunos da cidade de “Tubarão” que tenham peso acima de 100 e que tenham tipo sanguíneo negativo.

SELECT 
    a.id AS aluno_id, 
    a.nome AS aluno_nome, 
    a.cpf, 
    a.rg, 
    a.data_nascimento, 
    a.sexo, 
    a.mae, 
    a.peso,
    a.celular, 
    c.cidade, 
    a.tipo_sanguineo, 
    c.estado
FROM 
    aluno a
INNER JOIN 
    cidade c ON a.id_cidade = c.id
WHERE 
    c.cidade = 'Tubarão'
    AND a.peso > 100
    AND a.tipo_sanguineo ILIKE '%-%';


--|06|----------------------------------------------------|
--Selecione os dados do aluno aplicando os seguintes filtros:
--Alunos que tenham no nome a palavra “pedro” e que o CPF termine com “77”.

SELECT 
    a.id AS aluno_id, 
    a.nome AS aluno_nome, 
    a.cpf, 
    a.rg, 
    a.data_nascimento, 
    a.sexo, 
    a.mae, 
    a.peso,
    a.celular, 
    a.tipo_sanguineo

FROM 
    aluno a
WHERE 
    a.nome ILIKE '%Pedro%'
    AND a.cpf ILIKE '%77';

--|07|----------------------------------------------------|
--Selecione os dados do aluno, cidade e signo aplicando os seguintes filtros:
--Alunos com nome iniciando com “La” que o DDD do celular seja “48” com signo diferente de “Libra” e que tenha tipo sanguíneo “B”;

SELECT 
    a.id AS aluno_id, 
    a.nome AS aluno_nome, 
    a.cpf, 
    a.rg, 
    a.data_nascimento, 
    a.sexo, 
    a.mae, 
    a.celular, 
    a.tipo_sanguineo, 
    a.altura, 
    a.peso, 
    c.cidade, 
    c.estado, 
    s.nome AS signo
FROM aluno a
INNER JOIN cidade c ON a.id_cidade = c.id
LEFT JOIN signo s ON a.id_signo = s.id
WHERE a.nome ILIKE 'La%'
AND a.celular ILIKE '(48)%'
AND s.nome <> 'Libra'
AND a.tipo_sanguineo ILIKE '%B%';

--|08|----------------------------------------------------|
--Conte os alunos aplicando os seguintes filtros: 
--Alunos das cidades de “Florianópolis”, “Tubarão” e “Lages” que não tenham signo que tenham no tipo sanguíneo a letra “B”;

SELECT 
    COUNT(*) AS total_alunos
FROM aluno a
INNER JOIN cidade c ON a.id_cidade = c.id
WHERE c.cidade IN ('Florianópolis', 'Tubarão', 'Lages')
AND a.id_signo IS NULL
AND a.tipo_sanguineo iLIKE '%B%';

--|09|----------------------------------------------------|
--Some o peso e gere a média da altura e peso dos aluno de tubarão;
SELECT 
    SUM(peso) AS soma_peso, 
    AVG(altura) AS media_altura, 
    AVG(peso) AS media_peso
FROM aluno a
INNER JOIN cidade c ON a.id_cidade = c.id
WHERE c.cidade = 'Tubarão';

--|10|----------------------------------------------------|
--Agrupe os alunos da cidade de “Tubarão” por tipo sanguíneo e:
--conte a quantidade de alunos por tipo;
--gere e média de altura por tipo;
--gere a média de peso por tipo;
--arredonde os dados quando necessário.

SELECT a.tipo_sanguineo,
COUNT (*) AS quantidade_aluno,
ROUND(AVG(a.altura),2) as media_altura,
ROUND(AVG(a.peso),2) as media_peso
FROM aluno a
INNER JOIN cidade c ON a.id_cidade = c.id
WHERE c.cidade = 'Tubarão'
GROUP BY a.tipo_sanguineo;

--|11|----------------------------------------------------|
--Agupe os dados por sexo e tipo sanguineo e:
--conte a quantidade de alunos;
--conta de maneira distinta as cidades encontradas no agrupamento;
--ordene o resultado por sexo decrecente e tipo sanguineo;

SELECT 
    a.sexo,
    a.tipo_sanguineo,
    COUNT(*) AS quantidade_alunos,
    COUNT(DISTINCT c.cidade) AS quantidade_cidades
FROM aluno a
INNER JOIN cidade c ON a.id_cidade = c.id
GROUP BY a.sexo, a.tipo_sanguineo
ORDER BY a.sexo DESC, a.tipo_sanguineo;

--|12|----------------------------------------------------|
--Agrupe os dados por cidade e:
--conte a quantidade de alunos;
--conte de maneira distinta o tipo sanguíneo;
--selecione a maior altura de um aluno na cidade;
--selecione o menor peso de um aluno na cidade;

SELECT 
    c.cidade,
    COUNT(a.id) AS quantidade_alunos,
    COUNT(DISTINCT a.tipo_sanguineo) AS quantidade_tipo_sanguineo,
    MAX(a.altura) AS maior_altura,
    MIN(a.peso) AS menor_peso
FROM aluno a
INNER JOIN cidade c ON a.id_cidade = c.id
GROUP BY c.cidade;

--|13|----------------------------------------------------|
--Agrupe os dados por signo e sexo e:
--conte os alunos em cada grupo;
--calcule a média de altura de cada grupo
--arredonde os dados quando necessário.
--ordene o resultado por sexo decrecente e pelo contador de alunos decrecente;

SELECT 
    s.nome AS signo,
    a.sexo,
    COUNT(*) AS quantidade_alunos,
    ROUND(AVG(a.altura), 2) AS media_altura
FROM aluno a
INNER JOIN signo s ON a.id_signo = s.id
GROUP BY s.nome, a.sexo
ORDER BY a.sexo DESC, quantidade_alunos DESC;

----------------------------------------------------------|


