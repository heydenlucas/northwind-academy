with
    int_produtos_enriquecida as (
        select *
        from {{ ref('int_produtos_enriquecida') }}
    )


select *
from int_produtos_enriquecida