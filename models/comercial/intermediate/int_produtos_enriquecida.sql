with
    produtos as (
        select *
        from {{ ref('stg_erp__produtos') }}
    )

    , categorias as (
        select *
        from {{ ref('stg_erp__categorias') }}
    )

    , fornecedores as (
        select *
        from {{ ref('stg_erp__fornecedores') }}
    )

    , produtos_enriquecida as (
        select produtos.PK_PRODUTO
               --, cast(produtos.FK_FORNECEDOR
               --, cast(produtos.FK_CATEGORIA
               , produtos.NM_PRODUTO
               , produtos.QUANTIDADE_POR_UNIDADE
               , produtos.PRECO_POR_UNIDADE
               , produtos.UNIDADE_EM_ESTOQUE
               , produtos.UNIDADE_POR_PEDIDO
               , produtos.NIVEL_DE_PEDIDO
               , produtos.EH_DISCONTINUADO 
               , fornecedores.NOME_FORNECEDOR 
               , fornecedores.CIDADE_FORNECEDOR 
               , fornecedores.PAIS_FORNECEDOR 
        from produtos
        left join categorias on categorias.pk_categoria = produtos.fk_categoria
        left join fornecedores on fornecedores.pk_fornecedor = produtos.FK_FORNECEDOR
    )

    SELECT *
    FROM produtos_enriquecida