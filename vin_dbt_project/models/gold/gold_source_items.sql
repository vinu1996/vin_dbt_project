
WITH dedup_query as
(select 
    *,
    row_number()over(PARTITION by id order by updateddate desc) as deduplication_id
from 
    {{ source('source', 'items') }}
)
select 
    id,
    name,
    category,
    updateddate
from dedup_query
where deduplication_id=1