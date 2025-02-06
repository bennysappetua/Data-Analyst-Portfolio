-- 1. Basic Selection
SELECT email, phone
FROM Customer c 

-- 2. Menggunakan Filter
SELECT FirstName, LastName, Email 
FROM Customer c 
WHERE Country = 'Brazil'

-- Tanda seru ! sama dengan "select all, except"
SELECT FirstName, LastName, Email 
FROM Customer c 
WHERE Country != 'Brazil'

-- 3. Mengurutkan Data Ascending
SELECT FirstName, LastName, BirthDate 
FROM Employee e 
ORDER BY FirstName

-- 3. Mengurutkan Data Descending
SELECT FirstName, LastName, BirthDate 
FROM Employee e 
ORDER BY FirstName DESC

-- 3. Mengurutkan Data by BirthDate
SELECT FirstName, LastName, BirthDate 
FROM Employee e 
ORDER BY BirthDate 

-- 4. Limit
SELECT *
FROM Employee e 
Limit 2
-- tanda bintang maksudnya all

-- 5. Alias
SELECT FirstName as NamaDepan
FROM Employee e 

-- Challenge
-- 1. buat query untuk mengambil nama depan dan nama belakang customer
-- 2. buat query untuk mengambil seluruh informasi karyawan yang WHERE Titlenya IT Staff

-- Challenge 1. buat query untuk mengambil nama depan dan nama belakang customer
SELECT FirstName, LastName 
FROM Customer c 

-- Challenge 2. buat query untuk mengambil seluruh informasi karyawan yang WHERE Titlenya IT Staff
SELECT *
FROM Employee e 
WHERE Title = 'IT Staff'


-- Function
SELECT MAX(UnitPrice)
FROM Track t 

SELECT MIN(UnitPrice)
FROM Track t 

-- Aggregation 
-- Berapa harga rata-rata harga track yg dijual per komposer
SELECT Composer, AVG(UnitPrice) as HargaRataan
FROM Track t 
GROUP BY Composer 
ORDER BY HargaRataan

-- Case When > mau grouping customer as 'Domestic' dan 'Foreign' dari tabel Customer
SELECT CustomerId, FirstName, LastName, Country,
-- Case
CASE Country
WHEN 'USA' THEN	'Domestic' ELSE 'Foreign'
END as CustomerGroup
-- End
FROM Customer c 

-- Challenge: buat query yang menunjukkan banyaknya invoice berdasarkan BillingCountry
SELECT BillingCountry, COUNT(InvoiceId) as JumlahInvoice
FROM Invoice i 
GROUP BY BillingCountry 

-- HAVING dipakai untuk query aggregasi (fungsingnya sama seperti WHERE)
-- Perbedaan WHERE vs HAVING sering ditanyakan saat interview kerja
SELECT InvoiceId , SUM(Quantity) as JumlahInvoice 
FROM InvoiceLine il 
GROUP BY InvoiceID 
HAVING JumlahInvoice > 10

-- Gabungin 2 tabel
SELECT *
FROM Album albm INNER JOIN Artist art 
ON albm.ArtistId = art.ArtistId 

SELECT albm.Title as AlbumTitle, art.Name as ArtistName
FROM Album albm INNER JOIN Artist art 
ON albm.ArtistId = art.ArtistId 

-- Gabungin 3 tabel
SELECT *
FROM Track trk 
LEFT JOIN Album as albm ON trk.AlbumId = albm.AlbumId 
LEFT JOIN Artist as art ON albm.ArtistId = art.ArtistId 

-- Practice Question
-- Query yang menunjukkan InvoiceId + Sales Agentnya (employee)
-- Terurut berdasarkan nama agent(employee)
SELECT inv.InvoiceId, emp.FirstName, emp.LastName 
FROM Invoice inv
LEFT JOIN Customer as cst ON inv.CustomerId = cst.CustomerId 
LEFT JOIN Employee as emp ON cst.SupportRepId = emp.EmployeeId 
ORDER BY emp.FirstName ASC

-- Row Wise Table Combination: menggabungkan data berdasarkan baris
-- contoh kasus: Artist mengandung nama John
-- Tracknya mengandung nama hop
SELECT Name, "Artist" as Entity
FROM Artist a 
WHERE Name LIKE "%john%"
UNION 
SELECT Name, "Track" as Entity
FROM Track t 
WHERE Name LIKE "%hop%"
-- menggunakan UNION / INTERSECT / EXCEPT -> kolomnya harus sama

-- Challenge: tampilkan nama depan customer yang bukan nama depan employee
-- hint: gunakan except
SELECT FirstName FROM Customer c 
EXCEPT
SELECT FirstName FROM Employee e 

-- 5.4.7 CTE Subquery
-- Ambil semua track dengan genre rock
SELECT * FROM Track WHERE GenreID in
(SELECT GenreID
FROM Genre
WHERE Name = 'Rock'
)

-- Cari agent yang pernah melayani top 5 customer dengan total spending paling banyak

-- Pendekatan 1, Sub query
-- agen yang melayani top 5 customer di bawah
SELECT SupportRepId, top_spender.CustomerId
FROM Customer c 
RIGHT JOIN
-- Subquery = top 5 customer dengan spending terbanyak-- 
	(SELECT CustomerId, SUM(Total) as total_spending
	FROM Invoice i 
	GROUP BY CustomerId
	ORDER BY total_spending DESC 
	LIMIT 5) as top_spender
ON c.CustomerId = top_spender.CustomerId

-- Pendekatan 2, CTE
WITH top_spender as(
	SELECT i.CustomerId, SUM(Total) as total_spending
	FROM Invoice i 
	GROUP BY i.CustomerId 
	ORDER BY total_spending DESC 
	LIMIT 5
	)
SELECT SupportRepId, top_spender.CustomerId
FROM Customer c 
RIGHT JOIN top_spender ON c.CustomerId = top_spender.CustomerId


-- WHERE = filter ke kolom asli
-- HAVING = filter hasil agregasi (sum, avg, min, max, etc..)


-- latihan live session 24 Oct 2024
SELECT name, composer
FROM Track t 
WHERE composer IS NOT NULL
AND name LIKE 'g%' OR composer LIKE '%a'
ORDER BY composer DESC

SELECT 
CustomerId, 
BillingCountry, 
SUM(Total) as total_pembelian,
AVG(Total) as rata_pembelian
FROM Invoice i 
WHERE InvoiceDate <= '2011-12-31' AND InvoiceDate >= '2011-01-01'
GROUP BY 1,2
HAVING AVG(Total) > 5

-- buat belajar SQL = hackerrank.com


SELECT *
FROM Album a 
LIMIT 5