SELECT 
    i.billingcountry,
    SUM(i.total) AS revenue,
    RANK() OVER (ORDER BY SUM(i.total) DESC) AS Revenue_rank
FROM invoice  i
GROUP BY i.BillingCountry
ORDER BY Revenue DESC;