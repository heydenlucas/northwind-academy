with
    renomeado as (
        select 
        1 = 1
        , ORDERID::string || '-' || PRODUCTID::string as pk_pedido_item
        , cast(orderid as int) as fk_pedido
        , cast(productid as int) as fk_produto
        , cast(discount as numeric(18,2)) as desconto_perc
        , cast(unitprice as numeric(18,2)) as preco_da_unidade
        , cast(quantity as int) as quantidade
        --select *
        from {{ source('erp_northwind', 'orderdetail') }}
    )

select *
from renomeado
