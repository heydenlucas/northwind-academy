select 
    cast(ID as varchar) as PK_TRANSPORTADORA
    , cast(COMPANYNAME as varchar) as NOME_TRANSPORTADORA
    , cast(PHONE as varchar) as TELEFONE_TRANSPORTADORA
from {{ source('erp_northwind', 'shipper') }}