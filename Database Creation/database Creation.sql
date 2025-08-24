-- Employee (create this first because Customer depends on it)
CREATE TABLE Employee (
    EmployeeId INT PRIMARY KEY,
    LastName VARCHAR(20),
    FirstName VARCHAR(20),
    Title VARCHAR(30),
    ReportsTo INT,
    BirthDate TIMESTAMP,
    HireDate TIMESTAMP,
    Address VARCHAR(70),
    City VARCHAR(40),
    State VARCHAR(40),
    Country VARCHAR(40),
    PostalCode VARCHAR(10),
    Phone VARCHAR(24),
    Fax VARCHAR(24),
    Email VARCHAR(60),
    FOREIGN KEY (ReportsTo) REFERENCES Employee(EmployeeId)
);

-- Customer (depends on Employee)
CREATE TABLE Customer (
    CustomerId INT PRIMARY KEY,
    FirstName VARCHAR(40),
    LastName VARCHAR(20),
    Company VARCHAR(80),
    Address VARCHAR(70),
    City VARCHAR(40),
    State VARCHAR(40),
    Country VARCHAR(40),
    PostalCode VARCHAR(10),
    Phone VARCHAR(24),
    Fax VARCHAR(24),
    Email VARCHAR(60),
    SupportRepId INT REFERENCES Employee(EmployeeId)
);

-- Artist
CREATE TABLE Artist (
    ArtistId INT PRIMARY KEY,
    Name VARCHAR(120)
);

-- Album
CREATE TABLE Album (
    AlbumId INT PRIMARY KEY,
    Title VARCHAR(160),
    ArtistId INT REFERENCES Artist(ArtistId)
);

-- Genre
CREATE TABLE Genre (
    GenreId INT PRIMARY KEY,
    Name VARCHAR(120)
);

-- MediaType
CREATE TABLE MediaType (
    MediaTypeId INT PRIMARY KEY,
    Name VARCHAR(120)
);

-- Track (depends on Album, MediaType, Genre)
CREATE TABLE Track (
    TrackId INT PRIMARY KEY,
    Name VARCHAR(200),
    AlbumId INT REFERENCES Album(AlbumId),
    MediaTypeId INT REFERENCES MediaType(MediaTypeId),
    GenreId INT REFERENCES Genre(GenreId),
    Composer VARCHAR(220),
    Milliseconds INT,
    Bytes INT,
    UnitPrice NUMERIC(10,2)
);

-- Invoice (depends on Customer)
CREATE TABLE Invoice (
    InvoiceId INT PRIMARY KEY,
    CustomerId INT REFERENCES Customer(CustomerId),
    InvoiceDate TIMESTAMP,
    BillingAddress VARCHAR(70),
    BillingCity VARCHAR(40),
    BillingState VARCHAR(40),
    BillingCountry VARCHAR(40),
    BillingPostalCode VARCHAR(10),
    Total NUMERIC(10,2)
);

-- InvoiceLine (depends on Invoice, Track)
CREATE TABLE InvoiceLine (
    InvoiceLineId INT PRIMARY KEY,
    InvoiceId INT REFERENCES Invoice(InvoiceId),
    TrackId INT REFERENCES Track(TrackId),
    UnitPrice NUMERIC(10,2),
    Quantity INT
);

-- Playlist
CREATE TABLE Playlist (
    PlaylistId INT PRIMARY KEY,
    Name VARCHAR(120)
);

-- PlaylistTrack (many-to-many between Playlist and Track)
CREATE TABLE PlaylistTrack (
    PlaylistId INT REFERENCES Playlist(PlaylistId),
    TrackId INT REFERENCES Track(TrackId),
    PRIMARY KEY (PlaylistId, TrackId)
);




-- Employee
COPY Employee(EmployeeId, LastName, FirstName, Title, ReportsTo, BirthDate, HireDate, Address, City, State, Country, PostalCode, Phone, Fax, Email)
FROM 'D:\.MY PERSONAL DATA\programming Practice\Data Analytics\Elevvo Pathways Projects\level2 project 3\Employee.csv'
DELIMITER ','
CSV HEADER

-- Customer
COPY Customer(CustomerId, FirstName, LastName, Company, Address, City, State, Country, PostalCode, Phone, Fax, Email, SupportRepId)
FROM 'D:\.MY PERSONAL DATA\programming Practice\Data Analytics\Elevvo Pathways Projects\level2 project 3\Customer.csv'
DELIMITER ','
CSV HEADER

-- Artist
COPY Artist(ArtistId, Name)
FROM 'D:\.MY PERSONAL DATA\programming Practice\Data Analytics\Elevvo Pathways Projects\level2 project 3\Artist.csv'
DELIMITER ','
CSV HEADER

-- Album
COPY Album(AlbumId, Title, ArtistId)
FROM 'D:\.MY PERSONAL DATA\programming Practice\Data Analytics\Elevvo Pathways Projects\level2 project 3\Album.csv'
DELIMITER ','
CSV HEADER

-- Genre
COPY Genre(GenreId, Name)
FROM 'D:\.MY PERSONAL DATA\programming Practice\Data Analytics\Elevvo Pathways Projects\level2 project 3\Genre.csv'
DELIMITER ','
CSV HEADER

-- MediaType
COPY MediaType(MediaTypeId, Name)
FROM 'D:\.MY PERSONAL DATA\programming Practice\Data Analytics\Elevvo Pathways Projects\level2 project 3\MediaType.csv'
DELIMITER ','
CSV HEADER

-- Track
COPY Track(TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice)
FROM 'D:\.MY PERSONAL DATA\programming Practice\Data Analytics\Elevvo Pathways Projects\level2 project 3\Track.csv'
DELIMITER ','
CSV HEADER;

-- Invoice
COPY Invoice(InvoiceId, CustomerId, InvoiceDate, BillingAddress, BillingCity, BillingState, BillingCountry, BillingPostalCode, Total)
FROM 'D:\.MY PERSONAL DATA\programming Practice\Data Analytics\Elevvo Pathways Projects\level2 project 3\Invoice.csv'
DELIMITER ','
CSV HEADER

-- InvoiceLine
COPY InvoiceLine(InvoiceLineId, InvoiceId, TrackId, UnitPrice, Quantity)
FROM 'D:\.MY PERSONAL DATA\programming Practice\Data Analytics\Elevvo Pathways Projects\level2 project 3\InvoiceLine.csv'
DELIMITER ','
CSV HEADER

-- Playlist
COPY Playlist(PlaylistId, Name)
FROM 'D:\.MY PERSONAL DATA\programming Practice\Data Analytics\Elevvo Pathways Projects\level2 project 3\Playlist.csv'
DELIMITER ','
CSV HEADER

-- PlaylistTrack
COPY PlaylistTrack(PlaylistId, TrackId)
FROM 'D:\.MY PERSONAL DATA\programming Practice\Data Analytics\Elevvo Pathways Projects\level2 project 3\PlaylistTrack.csv'
DELIMITER ','
CSV HEADER;
