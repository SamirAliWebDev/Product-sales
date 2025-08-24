SELECT 
    t.trackid,
    t.name AS Track_name,
    SUM(il.quantity) AS Total_sold,
    RANK() OVER (ORDER BY SUM(il.quantity) DESC) AS Sales_rank
FROM invoiceline il
JOIN Track t  ON il.trackid = t.trackid
GROUP BY t.trackid, t.name
ORDER BY Total_sold DESC
LIMIT 10;
