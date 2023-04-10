SELECT
	ord.order_id,
	cus.first_name + ' ' + cus.last_name customer,
	sta.first_name + ' ' + sta.last_name sales_rep,
	cus.city,
	cus.state,
	sto.store_name store,
	ord.order_date,
	pro.product_name,
	bra.brand_name,
	cat.category_name,
	ite.quantity,
	ite.list_price,
	ite.quantity * ite.list_price revenue
FROM sales.customers cus
	JOIN sales.orders ord ON cus.customer_id = ord.customer_id
	JOIN sales.stores sto ON ord.store_id = sto.store_id
	JOIN sales.staffs sta ON ord.staff_id = sta.staff_id
	JOIN sales.order_items ite ON ord.order_id = ite.order_id
	JOIN production.products pro ON ite.product_id = pro.product_id
	JOIN production.brands bra ON pro.brand_id = bra.brand_id
	JOIN production.categories cat ON pro.category_id = cat.category_id
GROUP BY
	ord.order_id,
	cus.first_name,
	cus.last_name,
	sta.first_name,
	sta.last_name,
	sto.store_name,
	cus.city,
	cus.state,
	ord.order_date,
	pro.product_name,
	bra.brand_name,
	cat.category_name,
	ite.quantity,
	ite.list_price;