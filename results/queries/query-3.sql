SELECT * 
FROM orders 
WHERE date>CURDATE() 
ORDER BY id DESC;