CREATE DATABASE supplycchain_db;

USE supplycchain_db;

-- create tables according to schema:
CREATE TABLE orders (
    order_id VARCHAR(10) PRIMARY KEY,
    product_id int,
    supplier_id int,
    order_date DATE,
    quantity_ordered int,
    order_status VARCHAR(20),
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);
-- run this query after creating other tables or else query will fail as it can't reference foreign keys

CREATE TABLE products (
    product_id int PRIMARY KEY,
    product_name VARCHAR(255),
    description TEXT,
    unit_price DECIMAL(10, 2),
    quantity_in_stock int
);

CREATE TABLE shipments (
    shipment_id VARCHAR(10) PRIMARY KEY,
    order_id VARCHAR(10),
    shipment_date DATE,
    delivery_date DATE,
    shipping_company VARCHAR(50),
    tracking_number VARCHAR(20),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

CREATE TABLE suppliers (
    supplier_id int PRIMARY KEY,
    supplier_name VARCHAR(255),
    contact_person VARCHAR(255),
    phone_number VARCHAR(255),
    email VARCHAR(255)
);

-- Data addition to tables:
INSERT INTO suppliers (supplier_id, supplier_name, contact_person, phone_number, email) VALUES
(1, 'Supplier A', 'John Smith', '123-456-7890', 'john@example.com'),
(2, 'Supplier B', 'Alice Johnson', '987-654-3210', 'alice@example.com'),
(3, 'Supplier C', 'Mark Brown', '456-789-0123', 'mark@example.com'),
(4, 'Supplier D', 'Sarah Lee', '789-123-4560', 'sarah@example.com'),
(5, 'Supplier E', 'Michael Green', '321-654-0987', 'michael@example.com'),
(6, 'Supplier F', 'Emily White', '654-098-3210', 'emily@example.com'),
(7, 'Supplier G', 'David Black', '987-321-6540', 'david@example.com'),
(8, 'Supplier H', 'Jessica Brown', '456-098-1237', 'jessica@example.com'),
(9, 'Supplier I', 'Daniel Smith', '012-345-6789', 'daniel@example.com'),
(10, 'Supplier J', 'Lisa Johnson', '789-456-1230', 'lisa@example.com'),
(11, 'Supplier K', 'Ryan Green', '234-567-8901', 'ryan@example.com'),
(12, 'Supplier L', 'Samantha White', '567-890-1234', 'samantha@example.com'),
(13, 'Supplier M', 'Chris Brown', '890-123-4567', 'chris@example.com'),
(14, 'Supplier N', 'Amanda Black', '123-456-7890', 'amanda@example.com'),
(15, 'Supplier O', 'Kevin Green', '345-678-9012', 'kevin@example.com'),
(16, 'Supplier P', 'Jennifer White', '678-901-2345', 'jennifer@example.com'),
(17, 'Supplier Q', 'Eric Brown', '901-234-5678', 'eric@example.com'),
(18, 'Supplier R', 'Michelle Black', '234-567-8901', 'michelle@example.com'),
(19, 'Supplier S', 'Brian Green', '456-789-0123', 'brian@example.com'),
(20, 'Supplier T', 'Ashley White', '789-012-3456', 'ashley@example.com'),
(21, 'Supplier A', 'John Smith', '123-456-7890', 'john@example.com'),
(22, 'Supplier A', 'Jane Doe', '456-789-0123', 'jane@example.com'),
(23, 'Supplier A', 'Michael Johnson', '789-123-4560', 'michael@example.com'),
(24, 'Supplier B', 'Alice Johnson', '987-654-3210', 'alice@example.com'),
(25, 'Supplier B', 'Bob Brown', '654-321-0987', 'bob@example.com'),
(26, 'Supplier C', 'Mark Brown', '456-789-0123', 'mark@example.com'),
(27, 'Supplier A', 'Jane Doe', '456-789-0123', 'jane@example.com'),
(28, 'Supplier A', 'Michael Johnson', '789-123-4560', 'michael@example.com'),
(29, 'Supplier B', 'Bob Brown', '654-321-0987', 'bob@example.com'),
(30, 'Supplier C', 'Mark Brown', '456-789-0123', 'mark@example.com'),
(31, 'Supplier C', 'Mark Brown', '456-789-0123', 'mark@example.com'),
(32, 'Supplier C', 'Mark Brown', '456-789-0123', 'mark@example.com');

INSERT INTO products (product_id, product_name, description, unit_price, quantity_in_stock) VALUES
(101, 'Widget X', 'Widget X description', 10.99, 100),
(102, 'Widget Y', 'Widget Y description', 15.99, 150),
(103, 'Widget Z', 'Widget Z description', 20.99, 200),
(104, 'Widget A', 'Widget A description', 8.99, 80),
(105, 'Widget B', 'Widget B description', 12.99, 120),
(106, 'Widget C', 'Widget C description', 18.99, 180),
(107, 'Widget D', 'Widget D description', 9.99, 90),
(108, 'Widget E', 'Widget E description', 14.99, 140),
(109, 'Widget F', 'Widget F description', 22.99, 220),
(110, 'Widget G', 'Widget G description', 11.99, 110),
(111, 'Widget H', 'Widget H description', 16.99, 160),
(112, 'Widget I', 'Widget I description', 21.99, 210),
(113, 'Widget J', 'Widget J description', 7.99, 70),
(114, 'Widget K', 'Widget K description', 13.99, 130),
(115, 'Widget L', 'Widget L description', 19.99, 190),
(116, 'Widget M', 'Widget M description', 10.49, 105),
(117, 'Widget N', 'Widget N description', 15.49, 155),
(118, 'Widget O', 'Widget O description', 23.49, 235),
(119, 'Widget P', 'Widget P description', 12.49, 124),
(120, 'Widget Q', 'Widget Q description', 17.49, 174);

INSERT INTO orders(order_id, product_id, supplier_id, order_date, quantity_ordered, order_status) VALUES
('ORD-0001', 101, 1, '2023-11-02', 25, 'Completed'),
('ORD-0002', 102, 2, '2023-10-25', 30, 'In Progress'),
('ORD-0003', 103, 3, '2023-10-30', 20, 'Completed'),
('ORD-0004', 104, 4, '2023-11-05', 35, 'In Progress'),
('ORD-0005', 105, 5, '2023-11-08', 40, 'Completed'),
('ORD-0006', 106, 6, '2023-11-10', 45, 'In Progress'),
('ORD-0007', 107, 7, '2023-11-12', 50, 'Completed'),
('ORD-0008', 108, 8, '2023-11-15', 55, 'In Progress'),
('ORD-0009', 109, 9, '2023-11-18', 60, 'Completed'),
('ORD-0010', 110, 10, '2023-11-20', 65, 'In Progress'),
('ORD-0011', 111, 11, '2023-11-22', 70, 'Completed'),
('ORD-0012', 112, 12, '2023-11-25', 75, 'In Progress'),
('ORD-0013', 113, 13, '2023-11-28', 80, 'Completed'),
('ORD-0014', 114, 14, '2023-12-01', 85, 'In Progress'),
('ORD-0015', 115, 15, '2023-12-04', 90, 'Completed'),
('ORD-0016', 116, 16, '2023-12-07', 95, 'In Progress'),
('ORD-0017', 117, 17, '2023-12-10', 100, 'Completed'),
('ORD-0018', 118, 18, '2023-12-13', 105, 'In Progress'),
('ORD-0019', 119, 19, '2023-12-16', 110, 'Completed'),
('ORD-0020', 120, 20, '2023-12-19', 115, 'In Progress');

INSERT INTO shipments (shipment_id, order_id, shipment_date, delivery_date, shipping_company, tracking_number) VALUES
('SH-0001', 'ORD-0001', '2023-11-03', '2023-11-05', 'UPS', 'UPS123456'),
('SH-0002', 'ORD-0002', '2023-10-28', '2023-10-30', 'FedEx', 'FDX789012'),
('SH-0003', 'ORD-0003', '2023-11-01', '2023-11-03', 'DHL', 'DHL456789'),
('SH-0004', 'ORD-0004', '2023-11-06', '2023-11-08', 'UPS', 'UPS987654'),
('SH-0005', 'ORD-0005', '2023-11-09', '2023-11-12', 'FedEx', 'FDX654321'),
('SH-0006', 'ORD-0006', '2023-11-11', '2023-11-14', 'DHL', 'DHL987654'),
('SH-0007', 'ORD-0007', '2023-11-13', '2023-11-16', 'UPS', 'UPS456789'),
('SH-0008', 'ORD-0008', '2023-11-16', '2023-11-19', 'FedEx', 'FDX123456'),
('SH-0009', 'ORD-0009', '2023-11-19', '2023-11-22', 'DHL', 'DHL789012'),
('SH-0010', 'ORD-0010', '2023-11-21', '2023-11-24', 'UPS', 'UPS987123'),
('SH-0011', 'ORD-0011', '2023-11-23', '2023-11-26', 'FedEx', 'FDX456789'),
('SH-0012', 'ORD-0012', '2023-11-26', '2023-11-29', 'DHL', 'DHL654321'),
('SH-0013', 'ORD-0013', '2023-11-29', '2023-12-02', 'UPS', 'UPS789456'),
('SH-0014', 'ORD-0014', '2023-12-02', '2023-12-05', 'FedEx', 'FDX987654'),
('SH-0015', 'ORD-0015', '2023-12-05', '2023-12-08', 'DHL', 'DHL321098'),
('SH-0016', 'ORD-0016', '2023-12-08', '2023-12-11', 'UPS', 'UPS654987'),
('SH-0017', 'ORD-0017', '2023-12-11', '2023-12-14', 'FedEx', 'FDX321654'),
('SH-0018', 'ORD-0018', '2023-12-14', '2023-12-17', 'DHL', 'DHL987321'),
('SH-0019', 'ORD-0019', '2023-12-17', '2023-12-20', 'UPS', 'UPS654321'),
('SH-0020', 'ORD-0020', '2023-12-20', '2023-12-23', 'FedEx', 'FDX987654');

-- check if data added successfully (works)
SELECT *
FROM shipments;
SELECT *
FROM products;

-- all records from suppliers
SELECT *
FROM suppliers;

-- product_name & unit_price
SELECT products.product_name, products.unit_price
FROM products;

-- order_id & order_date
SELECT orders.order_id, orders.order_date
FROM orders;

-- shipment_id & shipment_date
SELECT shipments.shipment_id, shipments.shipment_date
FROM shipments;

-- total no. of products in stock (types of products)
SELECT COUNT(product_id) as total_products
FROM products;

-- total quantity of products
SELECT SUM(products.quantity_in_stock)
FROM products;

-- avg. unit_price
SELECT AVG(products.unit_price)
FROM products;

-- max quantity ordered
SELECT MAX(orders.quantity_ordered)
FROM orders;

-- suppliers with their POCs
SELECT suppliers.supplier_name, suppliers.contact_person
FROM suppliers;

-- products with their description
SELECT products.product_name, products.description
FROM products;

-- shipment details & tracking number (covers all shipment details)
SELECT *
FROM shipments;

-- orders with associated suppliers
SELECT orders.order_id, orders.order_date, suppliers.supplier_name
FROM orders
INNER JOIN suppliers on orders.supplier_id = suppliers.supplier_id
GROUP BY suppliers.supplier_name;

-- products with unit_price > 15
SELECT products.product_name, products.unit_price
FROM products
WHERE unit_price > 15
ORDER BY unit_price DESC;

-- #orders per supplier (there is only 1 order per supplier)
SELECT orders.supplier_id, orders.order_id
FROM orders
GROUP BY orders.supplier_id;

-- quantity ordered for each product
SELECT orders.product_id, SUM(orders.quantity_ordered) as product_quantity
FROM orders
GROUP BY orders.product_id;

-- shipments with their order info
SELECT shipments.*, orders.order_id, orders.order_date, orders.quantity_ordered, orders.order_status
FROM shipments
INNER JOIN orders on shipments.order_id = orders.order_id
WHERE orders.order_status = 'In Progress';

-- 