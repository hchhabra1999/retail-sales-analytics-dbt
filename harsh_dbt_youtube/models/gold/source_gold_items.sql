with t1 as (
    select *, 
    row_number() over (partition by id order by updateDate desc) as dedup
    from {{ source('source', 'items') }}
)
select 
id,
name,
category,
updateDate
 from t1 where dedup = 1