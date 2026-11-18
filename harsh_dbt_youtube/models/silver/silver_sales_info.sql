with bronze_sales as (
    select sales_id, product_sk, customer_sk, gross_amount, payment_method from {{ ref("bronze_sales") }}
),
bronze_product as (
    select product_sk, product_name, product_name from {{ ref("bronze_product") }}
),
customer as (
    select customer_sk, gender, email as customer_email from {{ ref("bronze_customer") }}
),
joined_query as (

select 
    bs.sales_id,
    bs.product_sk,
    bp.product_name,
    bs.customer_sk,
    c.gender,
    c.customer_email,
    bs.gross_amount,
    bs.payment_method
from bronze_sales bs
left join bronze_product bp on bs.product_sk = bp.product_sk
left join customer c on bs.customer_sk = c.customer_sk
)
select
*
from joined_query