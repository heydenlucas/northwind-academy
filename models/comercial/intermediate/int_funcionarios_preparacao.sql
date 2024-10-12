with
    funcionarios as (
        select *
        from {{ ref('stg_erp__funcionarios') }}
    )

    ,joined as (
        select funcionarios.PK_FUNCIONARIO
               , funcionarios.nome_funcionario
               , gerentes.NOME_FUNCIONARIO as NOME_GERENTE
               --, funcionarios.FK_GERENTE -- não será mais útil pois já foi usada no self join
               , funcionarios.DT_NASCIMENTO_FUNCIOANRIO
               , funcionarios.DT_CONTRATACAO
               , funcionarios.CARGO_FUNCIONARIO
               , funcionarios.CIDADE_FUNCIONARIO
               , funcionarios.REGIAO_FUNCIONARIO
               , funcionarios.PAIS_FUNCIONARIO
        from funcionarios
        left join funcionarios as gerentes
            on funcionarios.fk_gerente = gerentes.pk_funcionario
    )


select *
from joined




