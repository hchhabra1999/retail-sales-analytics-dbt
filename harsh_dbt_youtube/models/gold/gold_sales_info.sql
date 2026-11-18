select 
t1.*,
t2.refund_amount
from {{ ref('silver_sales_info')}} as t1
left join {{ ref('silver_sales_returns')}} as t2 on t1.sales_id = t2.sales_id