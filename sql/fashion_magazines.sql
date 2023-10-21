-- Add your sql here
-- SELECT
-- c.customer_name, o.order_status, s.price_per_month, s.subscription_length
-- FROM
-- orders o
-- INNER JOIN customers c ON o.customer_id = c.customer_id
-- INNER JOIN subscriptions s ON o.subscription_id = s.subscription_id
-- WHERE
-- o.order_status = 'unpaid'


select 
    c.customer_name as "Customer",
    (PRINTF("$%.2f", SUM((s.subscription_length * s.price_per_month)))) as "Amount Due"
from orders o
INNER join customers c 
    on (o.customer_id = c.customer_id)
INNER join subscriptions s
    on (o.subscription_id = s.subscription_id)
where o.order_status = 'unpaid' and s.description = 'Fashion Magazine'
group by c.customer_id