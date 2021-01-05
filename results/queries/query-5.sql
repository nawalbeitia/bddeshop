SELECT name, price,products.quantity
FROM order_product
INNER JOIN products ON order_product.product_id = products.id
WHERE order_product.order_id = 1;