SELECT * 
FROM orders 
WHERE date (`date`) = CURRENT_DATE() 
ORDER BY `date` DESC;