select
    id
    , orderid as order_id
    , paymentmethod as payment_method
    , status as payment_status
    , amount / 100 as amount_usd
    , created as created_date
from stripe.payment