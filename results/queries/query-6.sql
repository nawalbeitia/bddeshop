SELECT orders.id, (products.price*order_product.quantity)
FROM orders join order_product ON orders.id = order_product.order_id 
join products ON order_product.product_id = products.id