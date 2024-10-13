with
    renomeacao_supplier as (
        select cast(ID as int) as pk_fornecedor
                , cast(COMPANYNAME as varchar) as nome_fornecedor
                , cast(CITY as varchar) as cidade_fornecedor
                , cast(COUNTRY as varchar) as pais_fornecedor
                --, cast(CONTACTNAME as varchar) as
                --, cast(CONTACTTITLE as varchar) as
                --, cast(ADDRESS as varchar) as
                --, cast(REGION as varchar) as
                --, cast(POSTALCODE as varchar) as
                --, cast(PHONE as varchar) as
                --, cast(FAX as varchar) as
                --, cast(HOMEPAGE as varchar) as
        from {{ source('erp_northwind', 'supplier') }}
    )

select *
from renomeacao_supplier

