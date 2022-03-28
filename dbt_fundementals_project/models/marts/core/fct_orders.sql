with successful_transactions as (
    select
        order_id
        , sum(amount_usd) amount_processed_usd
    from {{ ref('stg_payments') }}
    where payment_status = 'success'
    group by order_id
)

select
    order_id
    , customer_id
    , coalesce(amount_processed_usd, 0) amount_processed_usd
from {{ ref('stg_orders') }}
left join successful_transactions using (order_id)