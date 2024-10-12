with
    fonte_funcionarios as (
        select *
        from {{ source('erp_northwind', 'employee') }}
    )
    , renomeacao as (
        select
            cast(ID as int) as pk_funcionario
            ,cast(REPORTSTO as varchar) as fk_gerente
            ,cast(BIRTHDATE as date) as dt_nascimento_funcioanrio
            ,cast(HIREDATE as date) as dt_contratacao
            ,FIRSTNAME || ' ' || LASTNAME as nome_funcionario
            ,cast(TITLE as varchar) as cargo_funcionario
            ,cast(CITY as varchar) as cidade_funcionario
            ,cast(REGION as varchar) as regiao_funcionario
            ,cast(COUNTRY as varchar) as pais_funcionario
            --,cast(POSTALCODE as varchar) as 
            --,cast(TITLEOFCOURTESY as varchar) as 
            --,cast(ADDRESS as varchar) as 
            --,cast(HOMEPHONE as varchar) as 
            --,cast(EXTENSION as varchar) as 
            --,cast(PHOTO as varchar) as 
            --,cast(NOTES as varchar) as 
            --,cast(PHOTOPATH as varchar) as
        FROM fonte_funcionarios 
    )

select *
from renomeacao

