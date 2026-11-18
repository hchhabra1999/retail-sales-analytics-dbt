with t1 as (
select
sales_id,
payment_method,
unit_price,
quantity,
gross_amount,
net_amount
from {{ ref("bronze_sales")}}
),
t2 as(
select
sales_id,
return_reason,
refund_amount
from {{ ref("bronze_returns")}}
)
select
t1.sales_id,
t1.payment_method,
t1.unit_price,
t2.return_reason,
t2.refund_amount
from t1 
left join t2 on t1.sales_id = t2.sales_id