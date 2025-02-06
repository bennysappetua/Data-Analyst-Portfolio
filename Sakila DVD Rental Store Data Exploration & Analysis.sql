-- SQL Practice

-- 1. Tampilkan first_name dan last_name dari tabel actor
SELECT first_name, last_name 
FROM actor a 


-- 2. Tampilkan gabungan first_name dan last_name dengan huruf kecil dan nama kolom
-- actor_name, (Hint: gunakan || untuk menggabungkan 2 kolom. contoh: select a||b)
SELECT LOWER (first_name||last_name) as actor_name
FROM actor a 


-- 3. Mengingat aktor dengan nama depan 'JOE'
-- Tampilkan actor_id, first_name dan last_name orang tersebut
SELECT actor_id, first_name, last_name 
FROM actor a 
WHERE first_name LIKE "%joe%"


-- 4. Mengingat aktor dengan nama belakang mengandung 'Li'
-- Tampilkan actor_id, first_name dan last_name orang tersebut
-- Urutkan berdasarkan nama belakang
-- Jika nama belakang sama, prioritaskan urutkan pake nama depan
SELECT actor_id, first_name, last_name 
FROM actor a 
WHERE last_name LIKE "%li%"
ORDER BY last_name ASC, first_name ASC 


-- 5. Dengan fungsi IN di SQL, tampilkan ID negara Afghanistas, Bangladesh dan China
SELECT country_id, country 
FROM country c 
WHERE country IN ('Afghanistan', 'Bangladesh', 'China')


-- 6. Tampilkan semua nama belakang aktor dan juga hitung ada berapa banyak aktor
-- dengan nama belakang tersebut
SELECT last_name, COUNT(last_name)
FROM actor a 
GROUP BY last_name 


-- 7. Sama seperti nomor 6, tapi sekarang buang nama belakang aktor yang dimiliki 1 orang
SELECT last_name , COUNT(last_name) as count_actor
FROM actor a 
GROUP BY last_name 
HAVING count_actor>1

-- 8. Cari nama depan, nama belakang dan alamat dari setiap staff member
-- gunakan staff dan address
SELECT stf.first_name, stf.last_name, adrs.address 
FROM staff stf
LEFT JOIN address AS adrs ON stf.address_id = adrs.address_id 

-- 9. Cari berapa banyak penjualan(amount) yang berhasil dibuat setiap staff_member
-- pada bulan Agustus 2005
-- Gunakan tabel staff dan payment
SELECT stf.staff_id, SUM(amount) as total_penjualan
FROM staff stf
LEFT JOIN payment AS pay ON stf.staff_id = pay.staff_id 
WHERE payment_date >='2005-08-01' and payment_date <'2005-09-01'
GROUP BY stf.staff_id 



-- 10. Tampilkan nama film dan berapa banyak aktor di setiap film
SELECT f.title, COUNT(actor_id) as jumlah_actor
FROM film f
INNER JOIN film_actor flact ON f.film_id = flact.film_id 
GROUP BY f.title


-- 11. Cari informasi customer dan berapa banyak biaya yang dikeluarkan oleh setiap customer
-- urutkan hasil pencarian berdasarkan nama belakang customer secara abjad
SELECT cus.customer_id, cus.first_name, cus.last_name, SUM(amount) as total_transaksi
FROM customer cus 
INNER JOIN payment pay ON cus.customer_id = pay.customer_id 
GROUP BY cus.customer_id 
ORDER BY cus.last_name 

-- 12. Perusahaan ingin membuat marketing campaign melalui email di Kanada
-- Cari semua email customer yang berasal dari Kanada, Gunakan CTE kalau bisa
WITH location_info as (
	SELECT a.address , a.city_id , ct.country_id , cn.country
	FROM address a 
	INNER JOIN city ct ON a.city_id = ct.city_id
	LEFT JOIN country cn ON ct.country_id = cn.country_id
	)
SELECT email
FROM customer c
WHERE address_id IN (SELECT address_id FROM location_info WHERE country='Canada')


-- 13. Tampilkan nama film yang paling sering disewa/dirental 
-- urutkan dari yang paling populer
SELECT f.title , COUNT(rental_id) as total_rented
FROM film f 
INNER JOIN inventory as inv ON f.film_id = inv.film_id 
INNER JOIN rental as rent ON inv.inventory_id = rent.inventory_id 
GROUP BY f.title 
ORDER BY total_rented DESC 


-- 14. Buat query yang menunjukkan berpa banyak revenue (amount)
-- yang diperoleh masing-masing toko
SELECT st.store_id , SUM(amount) as store_revenue
FROM payment pay
INNER JOIN rental as rent ON pay.rental_id = rent.rental_id
INNER JOIN inventory as inv ON inv.inventory_id = rent.inventory_id 
INNER JOIN store as st ON st.store_id = inv.store_id 
GROUP BY st.store_id 


-- 15. Cari 5 genre film dengan gross revenue tertinggi
-- diurutkan dari yang paling laku terlebih dahulu 
-- hint: genre terdapat di tabel: film_category
-- join table payment > rental > inventory > film > film category > category
SELECT ct.name as genre , SUM(amount) as gross_revenue  
FROM payment pay
JOIN rental rent ON rent.rental_id = pay.rental_id 
JOIN inventory inv ON inv.inventory_id = rent.inventory_id 
JOIN film f ON f.film_id = inv.film_id 
JOIN film_category fc ON fc.film_id = f.film_id 
JOIN category ct ON ct.category_id = fc.category_id 
GROUP BY genre
ORDER BY gross_revenue DESC 
LIMIT 5


