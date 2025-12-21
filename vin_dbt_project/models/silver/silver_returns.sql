WITH bronze_returns as
(
    select 
        sales_id,
        product_sk,
        returned_qty
        return_reason,
        refund_amount,
        round({{multiply('returned_qty','refund_amount')}},2) as calculated_returned_amount
    from    
        {{ref('bronze_returns')}}
),
bronze_products as 
(
    select 
        product_sk,
        category
    from 
        {{ref('bronze_product')}}
),
bronze_customer as 
(
    select 
        customer_sk,
        gender
    from
        {{ref('bronze_customers')}}   

),
join_query as (
select 
        br.*,
        bp.*,
        bc.*
from    
    bronze_returns br 
inner join
    bronze_product bp
on 
    br.product_sk=bp.product_sk
inner join
    {{(ref('bronze_sales'))}} bs
on
    br.sales_id=bs.sales_id
inner join
    bronze_customer bc 
on 
    bs.customer_sk=bc.customer_sk
)
select category,gender,round(sum(calculated_returned_amount),2) as total_return_amount
from join_query
group by 1,2
order by total_return_amount desc 