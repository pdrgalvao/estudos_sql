# Repositório de Estudos em SQL (MySQL)

Este repositório foi criado para documentar o meu progresso no aprendizado de banco de dados relacionais utilizando o **MySQL**. Aqui realizo a modelagem de tabelas, relacionamentos e consultas avançadas para simular cenários do mundo real.

##  Estrutura do Projeto

 **`01_shop_db/`**: Um modelo de e-commerce focado em controle de clientes e histórico de pedidos (Relacionamento One-to-Many / Um-para-Muitos).
 **`02_tv_db/`**: Um modelo de plataforma de streaming/crítica de TV focado na relação entre séries e avaliações dos usuários (Relacionamento Many-to-Many / Muitos-para-Muitos usando tabela pivô).

##  Conceitos Praticados
 **DDL / DML:** Criação de tabelas, chaves estrangeiras (`FOREIGN KEY`) e deleção em cascata (`ON DELETE CASCADE`).
 **Consultas Avançadas:** Uso de `INNER JOIN`, `LEFT JOIN`, funções de agregação (`SUM`, `AVG`, `COUNT`, `MIN`, `MAX`) e agrupamentos (`GROUP BY`).
 **Tratamento de Dados:** Lógicas condicionais com `CASE WHEN`, formatação com `ROUND` e tratamento de valores nulos com `IFNULL`.

##  Exemplo de Query Avançada (Análise de Críticos de TV)

```sql
SELECT
    first_name,
    last_name,
    COUNT(rating) AS COUNT,
    IFNULL(MIN(rating), 0) AS MIN,
    IFNULL(MAX(rating), 0) AS MAX,
    ROUND(IFNULL(AVG(rating), 0), 1) AS AVG,
    CASE
        WHEN COUNT(rating) > 0 THEN 'ACTIVE'
        ELSE 'INACTIVE'
    END AS status
FROM reviewers
LEFT JOIN reviews ON reviewers.id = reviews.reviewer_id
GROUP BY first_name, last_name;