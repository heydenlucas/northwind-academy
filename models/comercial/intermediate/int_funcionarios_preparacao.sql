with
    funcionarios as (
        select *
        from {{ ref('stg_erp__funcionarios') }}
    )

    ,joined as (
        select *
        from funcionarios as gerentes
        left join gerentes.
    )





