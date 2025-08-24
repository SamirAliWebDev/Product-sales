SELECT 
    ar.Name AS Artist,
    al.Title AS Album,
    SUM(il.Quantity * il.UnitPrice) AS AlbumRevenue,
    RANK() OVER (PARTITION BY ar.ArtistId ORDER BY SUM(il.Quantity * il.UnitPrice) DESC) AS AlbumRank
FROM InvoiceLine il

JOIN Track t ON il.TrackId = t.TrackId
JOIN Album al ON t.AlbumId = al.AlbumId
JOIN Artist ar ON al.ArtistId = ar.ArtistId

GROUP BY ar.ArtistId, ar.Name, al.AlbumId, al.Title
ORDER BY ar.Name, AlbumRevenue DESC;
