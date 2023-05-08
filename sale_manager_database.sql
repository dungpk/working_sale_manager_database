use quanlybanhang;

insert into customer 
values  (1,'Minh Quan',10),
		(2,'Ngoc Oanh',20),
		(3,'Hong Ha',50);

insert into orders
 values (1,1,'2006-3-21',null),
		(2,2,'2006-3-23',null),
		(3,1,'2006-3-16',null);
                          
insert into product
values  (default,'May giat',3),
		(default,'Tu lanh',5),
        (default,'Dieu Hoa',7),
        (default,'Quat',1),
        (default,'Bep dien',2);
        
insert into orderdetail 
values  (1,1,3),
		(1,3,7),
        (1,4,2),
        (2,1,1),
        (3,1,8),
        (2,5,4),
        (2,3,3);
        
-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
SELECT orderID,orderDate,ordertotalprice
 FROM quanlybanhang.orders;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
SELECT c.customerName,p.productname
FROM customer c 
	join orders o on c.customerID = o.customerID 
	join orderDetail orderD on orderD.OderdetailID = o.orderID 
	join product p on p.ProductID = orderD.OderdetailProductID;
    
--  Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
SELECT c.customerName
FROM customer c
	left join orders o
    on c.customerID = o.customerID 
    where o.customerID is null;
    
-- Hiển thị mã hóa đơn,
 -- ngày bán và giá tiền của từng hóa đơn 
 -- (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. 
 -- Giá bán của từng loại được tính = odQTY*pPrice)
 
SELECT orders.orderID,orders.orderDate,SUM(orderDetail.OderdetailQuantity*Product.ProductPrice) AS totalPrice
	from orders LEFT join orderDetail
	ON orders.orderID = orderDetail.OderdetailID
	LEFT JOIN product 
	ON OrderDetail.OderdetailProductID = product.productID
	group by orders.orderID;
    

    
	
