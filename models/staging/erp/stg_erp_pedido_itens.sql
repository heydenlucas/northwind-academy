with
    renomeado as (
        select 
        1 = 1
        , ORDERID::string || '-' || PRODUCTID::string as pk_pedido_item
        , cast(PRODUCTID as int) as fk_produto
        , cast(UNITPRICE as numeric(18,2)) as desconto_perc
        , cast(QUANTITY as numeric(18,2)) as preco_da_unidade
        , cast(DISCOUNT as int) as quantidade
        from {{ source('erp_northwind', 'orderdetail') }}
    )

select *
from renomeado