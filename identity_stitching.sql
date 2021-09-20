#create a new table in database to store stitched identity data
CREATE TABLE identity_stitching
(hashed_customer_id string,
 hashed_session_id string,
 event_id string,
 event_type string,
 event_value string)

#inster into the new identity_stitching table
INSERT INTO identity_stitching
SELECT hashed_customer_sessions.HASHED_SESSION_ID, hashed_customer_sessions.hashed_customer_id, hashed_all_events.event_type, hashed_all_events.event_id, hashed_all_events.event_value
FROM hashed_customer_sessions
JOIN hashed_all_events on hashed_customer_sessions.hashed_session_id = hashed_all_events.hashed_session_id
ORDER BY hashed_customer_id
