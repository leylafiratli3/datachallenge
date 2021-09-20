#create table viewed to store all sessions with the viewed variant
with viewed as (
SELECT DISTINCT hashed_session_id, event_type
FROM hashed_all_events
WHERE event_type = 'viewed-variant'
),
#create table addedcart to store all sessions with the added to cart variant
addedcart as(
SELECT DISTINCT hashed_session_id, event_type
FROM hashed_all_events
WHERE event_type = 'added-to-cart-variant'
),
#create table startedcheckout to store all sessions with the started checkout variant
startedcheckout as (
SELECT DISTINCT hashed_session_id, event_type
FROM hashed_all_events
WHERE event_type = 'started-checkout-variant'
),
#create table purchased to store all sessions with the purchased variant
purchased as (
SELECT DISTINCT hashed_session_id, event_type
FROM hashed_all_events
WHERE event_type = 'purchased-variant'
),
#create table funnel from a union of the event type tables and add count column
funnel as (
select 'Viewed' as event_type, COUNT(*) as count from viewed
  union
select 'Added to Cart' as event_type, COUNT(*) as count from addedcart
  union
select 'Started Checkout' as event_type, COUNT(*) as count from startedcheckout
  union
select 'Purchased' as step, COUNT(*) as count from purchased
)
#select columns from the final event type table and create the delta column
SELECT event_type, count, COALESCE(count-lag(count,1) over (ORDER BY count desc),0) as delta FROM funnel
