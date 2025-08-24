SELECT 
    TO_CHAR(i.InvoiceDate,'Month') AS Month,
    SUM(i.Total) AS MonthlyRevenue,
    ROW_NUMBER() OVER (ORDER BY SUM(i.Total) DESC) AS PerformanceRank
FROM Invoice i
GROUP BY TO_CHAR(i.InvoiceDate,'Month')
ORDER BY Month;
