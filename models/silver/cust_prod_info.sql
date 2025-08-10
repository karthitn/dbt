select c.customer_id,c.name,c.email,p.PRODUCT_ID,p.PRODUCT_NAME,p.CATEGORY,
p.PRICE,p.PURCHASE_DATE
from {{ ref("customer_info") }} c
join {{ ref("prod_info") }} p on c.customer_id = p.customer_id
