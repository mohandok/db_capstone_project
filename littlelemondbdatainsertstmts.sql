-- Insert data into CustomerDetails
INSERT INTO `db_capstone_proj`.`customerdetails` (`CustomerID`,`Name`, `ContactNumber`, `Email`)
VALUES 
    ('2','Oliver Johnson', '07767958846', 'oliver.johnson@example.com'),
    ('3','Sophia Williams', '07767958847', 'sophia.williams@example.com'),
    ('4','Noah Brown', '07767958848', 'noah.brown@example.com'),
    ('5','Ava Jones', '07767958849', 'ava.jones@example.com'),
    ('6','William Davis', '07767958850', 'william.davis@example.com'),
    ('7','Isabella Wilson', '07767958851', 'isabella.wilson@example.com'),
    ('8','James Miller', '07767958852', 'james.miller@example.com'),
    ('9','Charlotte Taylor', '07767958853', 'charlotte.taylor@example.com'),
    ('10','Benjamin Martinez', '07767958854', 'benjamin.martinez@example.com');

-- Insert data into staffinfo
INSERT INTO `db_capstone_proj`.`staffinfo` (`StaffID`, `Name`, `Role`, `Salary`) VALUES
('2','Liam Garcia', 'Waiter', 31000),
('3','Mia Rodriguez', 'Chef', 42000),
('4','Lucas Hernandez', 'Cashier', 33000),
('5','Harper Martinez', 'Waiter', 30000),
('6','Evelyn Nguyen', 'Hostess', 29000),
('7','Ethan Perez', 'Manager', 62000),
('8','Chloe Rivera', 'Chef', 40000),
('9','Alexander Kim', 'Waiter', 28000),
('10','Luna Cooper', 'Hostess', 27000);

-- insert data into menuitems
INSERT INTO `db_capstone_proj`.`menuitems` (`MenuItemsID`, `CourseName`, `StartersName`, `DessertName`)
VALUES
(1, 'Appetizer', 'Garlic Butter Shrimp', 'Tiramisu'),
(2, 'Appetizer', 'Spring Rolls', 'Fruit Tart'),
(3, 'Salad', 'Caprese Salad', 'Cheesecake'),
(4, 'Appetizer', 'Chicken Wings', 'Chocolate Cake'),
(5, 'Soup', 'Tomato Soup', 'Creme Brulee'),
(6, 'Appetizer', 'Sushi Rolls', 'Mochi Ice Cream'),
(7, 'Appetizer', 'Hummus with Pita', 'Baklava'),
(8, 'Main Course', 'Tandoori Chicken', 'Gulab Jamun'),
(9, 'Salad', 'Greek Salad', 'Baklava'),
(10, 'Main Course', 'Steak au Poivre', 'Creme Brulee');

-- Insert data into Menus
INSERT INTO `db_capstone_proj`.`menus` (`MenuID`, `MenuItemsID`, `Name`, `Type`, `Price`, `Cuisine`)
VALUES 
('2', '2', 'Salmon', 'Main', '20', 'Japanese'),
('3', '3', 'Caesar Salad', 'Salad', '12', 'Italian'),
('4', '4', 'French Fries', 'Side', '6', 'American'),
('5', '5', 'Chicken Alfredo', 'Main', '16', 'Italian'),
('6', '6', 'Sushi Platter', 'Main', '22', 'Japanese'),
('7', '7', 'Hamburger', 'Main', '14', 'American'),
('8', '8', 'Pad Thai', 'Main', '15', 'Thai'),
('9', '9', 'Veggie Pizza', 'Main', '13', 'Italian'),
('10', '10', 'Tiramisu', 'Dessert', '8', 'Italian');


-- Insert data into Bookings
INSERT INTO `db_capstone_proj`.`bookings` (`BookingID`, `CustomerID`, `StaffID`, `Date`, `TableNumber`) VALUES
('1','1','1', '2024-01-15 18:30:00', 10),
('2','2','2', '2024-01-15 19:00:00', 12),
('3','3','3', '2024-01-16 19:30:00', 14),
('4','4','4', '2024-01-16 20:00:00', 16),
('5','5','5', '2024-01-17 18:00:00', 18),
('6','6','6', '2024-01-17 18:30:00', 20),
('7','7','7', '2024-01-18 19:00:00', 22),
('8','8','8', '2024-01-18 19:30:00', 24),
('9','9','9', '2024-01-19 20:00:00', 26),
('10','10','10', '2024-01-19 20:30:00', 28);

-- Insert data into Orders
INSERT INTO `db_capstone_proj`.`orders` (`OrderID`, `CustomerID`, `MenuItemID`, `StaffID`, `Date`, `Quantity`, `TotalCost`)
VALUES 
('2', '2', '2', '2', '2024-01-15 19:00:00', '1', '20'),
('3', '3', '3', '3', '2024-01-15 19:30:00', '3', '36'),
('4', '4', '4', '4', '2024-01-15 20:00:00', '1', '10'),
('5', '5', '5', '5', '2024-01-16 18:30:00', '2', '32'),
('6', '6', '6', '6', '2024-01-16 19:00:00', '2', '44'),
('7', '7', '7', '7', '2024-01-16 19:30:00', '1', '14'),
('8', '8', '8', '8', '2024-01-17 18:30:00', '3', '45'),
('9', '9', '9', '9', '2024-01-17 19:00:00', '1', '13'),
('10', '10', '10', '10', '2024-01-17 19:30:00', '1', '8');


-- Insert data into OrderDeliveryStatuses
INSERT INTO `db_capstone_proj`.`orderdeliverystatus` (`DeliveryID`, `OrderID`, `Date`, `Status`) VALUES
('1','1', '2024-01-15 18:45:00', 'Delivered'),
('2','2', '2024-01-15 19:15:00', 'Preparing'),
('3','3', '2024-01-16 19:45:00', 'Preparing'),
('4','4', '2024-01-16 20:15:00', 'Out for delivery'),
('5','5', '2024-01-17 18:15:00', 'Out for delivery'),
('6','6', '2024-01-17 18:45:00', 'Delivered'),
('7','7', '2024-01-18 19:15:00', 'Preparing'),
('8','8', '2024-01-18 19:45:00', 'Delivered'),
('9','9', '2024-01-19 20:15:00', 'Delivered'),
('10','10', '2024-01-19 20:45:00', 'Delivered');