# Parachute Data Challenge

##**Identity stitching**

Deleted NULL hashed_session_ids and hashed_customer_ids from hashed_all_events and hashed_customer_sessions. Created a table joining hashed_all_events and hashed_customer_sessions on hashed_session_id since it’s the most unique identifier and should be the primary key. Saved the results in new table ‘identity_stitching’.

##**Funnel reporting**




Additional Insights from data

What other products did the customer view in the same session? What were the prices? 

Where is the traffic coming from? Which sources are most effective, potentially compare ad spend on the sources

Which types of products sell best in each region? Traffic per region? Price per region?

Devices of users, device of users per region

Time breakdowns, time of the month, seasonality

Almost checked out customers, promotions




Shortcomings of Raw Data

Hashed_all_events:
Uses double quotes for some fields, which creates errors in csv parsing. Solved by adding an additional identifier
Has empty hashed_customer_ids for multiple hashed_customer_session values
NULL column event value
NULL values in most columns
Invalid context page paths


Hashed_customer_sessions:
Has duplicate values for hashed_session_id and these duplicate values are tied with different hashed_customer_ids which should not be occurring if data is collected properly


Additional issues resolved

Hashed_customer id is a string even though it is identified as a integer in the document. Changed type using ALTER TABLE … ALTER COLUMN.

Additional data collection ideas

Has this customer id ever viewed this product before? How many times? What was the price of the item at those times? Viewed timestamp?

What other items did customers look at during the session?
