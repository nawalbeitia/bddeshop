SELECT * 
    FROM orders 
    WHERE `date` > DATE_SUB(NOW(), INTERVAL 10 DAY);