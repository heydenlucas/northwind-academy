with
    ordens as (
        select *
        from {{ ref('stg_erp__ordens') }}
    )

    , pedido_itens  as (
        select *
        from {{ ref('stg_erp__pedido_itens') }}
    )

    , joined as (
        select 1=1
            , ordens.PK_PEDIDO
            , pedido_itens.PK_PEDIDO_ITEM
            --, pedido_itens.PK_PEDIDO
            , ordens.FK_FUNCIONARIO
            , pedido_itens.FK_PRODUTO
            , ordens.FK_CLIENTE
            , ordens.FK_TRANSPORTADORA

            , ordens.DATA_DO_PEDIDO
            , ordens.DATA_DO_ENVIO
            , ordens.DATA_REQUERIDA_ENTREGA

            , pedido_itens.DESCONTO_PERC
            , pedido_itens.PRECO_DA_UNIDADE
            , pedido_itens.QUANTIDADE
            , ordens.FRETE
            , ordens.numero_pedido 


            , ordens.NM_DESTINATARIO
            , ordens.CIDADE_DESTINATARIO
            , ordens.REGIAO_DESTINATARIO
            , ordens.PAIS_DESTINATARIO

        from pedido_itens
        inner join ordens on ordens.pk_pedido = pedido_itens.fk_pedido
    )

    , metricas as (
        select 
            *
            , QUANTIDADE * PRECO_DA_UNIDADE as valor_bruto
            , QUANTIDADE * PRECO_DA_UNIDADE *(1 - desconto_perc) as valor_liquido
            , cast(frete / (count(*) over(partition by numero_pedido)) as numeric(18,2)) as frete_rateado
            , case
                when desconto_perc > 0 then true
                else false
            end as teve_desconto
        from joined
    )

    , final_select as (
        select 1=1
            , PK_PEDIDO
            , PK_PEDIDO_ITEM
            , FK_FUNCIONARIO
            , FK_PRODUTO
            , FK_CLIENTE
            , FK_TRANSPORTADORA
            , DATA_DO_PEDIDO
            , DATA_DO_ENVIO
            , DATA_REQUERIDA_ENTREGA
            , DESCONTO_PERC
            , PRECO_DA_UNIDADE
            , QUANTIDADE
            , VALOR_BRUTO
            , VALOR_LIQUIDO
            , FRETE_RATEADO
            , NUMERO_PEDIDO
            , NM_DESTINATARIO
            , CIDADE_DESTINATARIO
            , REGIAO_DESTINATARIO
            , PAIS_DESTINATARIO
            , TEVE_DESCONTO
        from metricas

    )

select *
from final_select

