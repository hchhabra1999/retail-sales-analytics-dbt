{% set ini_flag = 1 %}
{% set last_load = 3 %}

{% set colu_list = ["sales_id","date_sk","gross_amount"]%}

select 

{% for i in colu_list %}
  {{ i }}{% if not loop.last %},{% endif %}
{% endfor %}

from {{ ref("bronze_sales")}}
{% if ini_flag == 1 %}
  where date_sk > {{ last_load }}
{% endif %}