# Write your MySQL query statement below

SELECT ROUND(
    CASE WHEN (SELECT COUNT(*) FROM FriendRequest) = 0 THEN 0 
         ELSE 
            (
                SELECT COUNT(DISTINCT CONCAT(requester_id, accepter_id)) 
                FROM RequestAccepted
                )/
            (
                SELECT COUNT(DISTINCT CONCAT(sender_id, send_to_id))
                FROM FriendRequest
                )
            
         END
            , 2) AS accept_rate