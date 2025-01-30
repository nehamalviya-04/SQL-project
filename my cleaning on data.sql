SELECT * FROM test_db.orders, test_db.customer,test_db.order_item, products, customer_feedbacks, delivery
where 
customer.customer_id=orders.customer_id
and round(order_item.order_id)=orders.order_id 
and products.product_id=round(order_item.product_id)
and customer_feedbacks.order_id=orders.order_id
and customer_feedbacks.customer_id=orders.customer_id
and delivery.delivery_partner_id=orders.delivery_partner_id
and delivery.order_id=orders.order_id
;


SELECT 
orders.order_date,
orders.order_id,
products.product_id,
orders.delivery_partner_id,
customer.customer_id,
customer_feedbacks.feedback_id,
customer.area,
customer.customer_name,
customer.customer_segment,
products.product_name,
products.category,
products.price,
order_item.quantity,
round(products.price*order_item.quantity,2) value,
orders.actual_delivery_time,
orders.promised_delivery_time,
delivery.actual_time,
delivery.reasons_if_delayed,
delivery.delivery_time_minutes,
customer_feedbacks.rating,
customer_feedbacks.feedback_text,
customer_feedbacks.feedback_category,
customer_feedbacks.sentiment feedback_segment,  
rating.Emoji,
rating.star,
category.img,
date(orders.order_date) Date

 FROM 
 test_db.orders, 
 test_db.customer,
 test_db.order_item, 
 products, 
 customer_feedbacks, 
 delivery,
 rating,
 category
where 
customer.customer_id=orders.customer_id
and round(order_item.order_id)=orders.order_id 
and products.product_id=round(order_item.product_id)
and customer_feedbacks.order_id=orders.order_id
and customer_feedbacks.customer_id=orders.customer_id
and delivery.delivery_partner_id=orders.delivery_partner_id
and delivery.order_id=orders.order_id
and customer_feedbacks.rating=rating.Rating
and products.category=category.category
;




CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `zeptodb` AS
    SELECT 
        `orders`.`order_date` AS `order_date`,
        `orders`.`order_id` AS `order_id`,
        `products`.`product_id` AS `product_id`,
        `orders`.`delivery_partner_id` AS `delivery_partner_id`,
        `customer`.`customer_id` AS `customer_id`,
        `customer_feedbacks`.`feedback_id` AS `feedback_id`,
        `customer`.`area` AS `area`,
        `customer`.`customer_name` AS `customer_name`,
        `customer`.`customer_segment` AS `customer_segment`,
        `products`.`product_name` AS `product_name`,
        `products`.`category` AS `category`,
        `products`.`price` AS `price`,
        `order_item`.`quantity` AS `quantity`,
        ROUND((`products`.`price` * `order_item`.`quantity`),
                2) AS `value`,
        `orders`.`actual_delivery_time` AS `actual_delivery_time`,
        `orders`.`promised_delivery_time` AS `promised_delivery_time`,
        `delivery`.`actual_time` AS `actual_time`,
        `delivery`.`reasons_if_delayed` AS `reasons_if_delayed`,
        `delivery`.`delivery_time_minutes` AS `delivery_time_minutes`,
        `customer_feedbacks`.`rating` AS `rating`,
        `customer_feedbacks`.`feedback_text` AS `feedback_text`,
        `customer_feedbacks`.`feedback_category` AS `feedback_category`,
        `customer_feedbacks`.`sentiment` AS `feedback_segment`,
        `rating`.`Emoji` AS `Emoji`,
        `rating`.`Star` AS `star`,
        `category`.`Img` AS `img`,
        CAST(`orders`.`order_date` AS DATE) AS `Date`
    FROM
        (((((((`orders`
        JOIN `customer`)
        JOIN `order_item`)
        JOIN `products`)
        JOIN `customer_feedbacks`)
        JOIN `delivery`)
        JOIN `rating`)
        JOIN `category`)
    WHERE
        ((`customer`.`customer_id` = `orders`.`customer_id`)
            AND (ROUND(`order_item`.`order_id`, 0) = `orders`.`order_id`)
            AND (`products`.`product_id` = ROUND(`order_item`.`product_id`, 0))
            AND (`customer_feedbacks`.`order_id` = `orders`.`order_id`)
            AND (`customer_feedbacks`.`customer_id` = `orders`.`customer_id`)
            AND (`delivery`.`delivery_partner_id` = `orders`.`delivery_partner_id`)
            AND (`delivery`.`order_id` = `orders`.`order_id`)
            AND (`customer_feedbacks`.`rating` = `rating`.`Rating`)
            AND (`products`.`category` = `category`.`category`));
            
            
            
            
            
            
SELECT * FROM test_db.zeptodb;


SELECT 
	i.product_id,
    p.category,
    p.product_name,
    p.price,
    i.date,
    i.stock_received,
    i.damaged_stock
FROM
    inventory i,
    products p
WHERE
    i.product_id = p.product_id;
    
    
    
    CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `inven` AS
    SELECT 
        `i`.`product_id` AS `product_id`,
        `p`.`category` AS `category`,
        `p`.`product_name` AS `product_name`,
        `p`.`price` AS `price`,
        `i`.`date` AS `date`,
        `i`.`stock_received` AS `stock_received`,
        `i`.`damaged_stock` AS `damaged_stock`
    FROM
        (`inventory` `i`
        JOIN `products` `p`)
    WHERE
        (`i`.`product_id` = `p`.`product_id`);
        
        
        
        
        SELECT * FROM test_db.inven;