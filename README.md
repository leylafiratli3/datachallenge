# Data Challenge

**Identity stitching**

Created a table joining hashed_all_events and hashed_customer_sessions on hashed_session_id. Saved the results in new table ‘identity_stitching’.

![alt text](https://github.com/leylafiratli3/datachallenge/blob/main/identity_stitching.PNG)

**Funnel reporting**

Created a script to gather number of records per event type and calculate the delta between each level. Used Excel to create a simple visualization for the report.

![alt text](https://github.com/leylafiratli3/datachallenge/blob/main/Purchase%20Funnel.PNG)

**Additional Insights from available data**
  1. What other products did the customer view in the same session? What were the prices? 
  2. What product sells best in each region? How does the traffic source, event type and price vary by region?
  3. What devices do the users use? Is there a relationship between user device and event type?
  4. How does overall traffic and event type vary by time of the day, month, year?
  5. Which customers added to cart or started the checkout of which products? Save these customers into a new table as data for possible marketing (ex. if the price of a product that was almost purchased drops, send notification to that user)
  6. How does price, product and event type vary by traffic source?
  7. Which pages in the website did the user go through to land at the interacted product?
  8. (As visualized below) Where is the traffic coming from? Which sources are the most effective?

![alt text](https://github.com/leylafiratli3/datachallenge/blob/main/Traffic%20Sources.PNG)


**Shortcomings of Raw Data**

Hashed_all_events:
  1. Uses double quotes for some fields, which creates errors in csv parsing. Solved by adding an additional identifier
  2. Hashed_customer_id is a string even though the data type is stated as int in the documentation
  3. Has empty hashed_customer_ids for multiple hashed_customer_session values
  4. Column with NULL only values called 'event value'
  5. NULL values in most columns
 
 Hashed_customer_sessions:
  1. Has duplicate hashed_session_ids tied to different hashed_customer_ids
  
**Additional data collection ideas**

  1. Has this customer id ever viewed this product before? How many times? What was the price of the item at those times? What was the timestamp?
    (view_count: integer, latest_view_time: timestamp, latest_view_price: integer)
