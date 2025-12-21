WITH bronze_sales as
(
    select 
        sales_id,
        product_sk,
        customer_sk,
        gross_amount,
        payment_method,
        round({{multiply('unit_price','quantity')}},2) as calculated_gross_amount
    from    
        {{ref('bronze_sales')}}
),
bronze_product as 
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
        bs.*,
        bp.*,
        bc.*
from    
    bronze_sales bs 
inner join
    bronze_product bp
on 
    bs.product_sk=bp.product_sk
inner join
    bronze_customer bc
on
    bs.customer_sk=bc.customer_sk
)
select category,gender,sum(calculated_gross_amount) as total_amount
from join_query
group by 1,2
order by total_amount desc 