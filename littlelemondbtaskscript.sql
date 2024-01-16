USE db_capstone_proj;
--                       ----------------------------------Week 2-------------------------------------------------
-- Task1 view creation

CREATE VIEW `OrdersView` AS
SELECT OrderID, Quantity, TotalCost as Cost FROM db_capstone_proj.orders
where quantity > 2;

SELECT * FROM OrdersView;

-- Task 2 order cost more than 150 dollars

SELECT cd.CustomerID, cd.Name as FullName, o.OrderID, o.TotalCost as Cost, m.Name as MenuName, mi.CourseName FROM db_capstone_proj.customerdetails as cd INNER JOIN db_capstone_proj.orders as o on o.CustomerID = cd.CustomerID INNER JOIN db_capstone_proj.menus as m on o.MenuItemID = m.MenuItemsID INNER JOIN db_capstone_proj.menuitems as mi on m.MenuItemsID = mi.MenuItemsID WHERE o.TotalCost>150 ORDER BY o.TotalCost;

-- Task 3 Orders more than 2
SELECT m.Name AS MenuName
FROM Menus m
WHERE m.MenuID IN (
    SELECT o.MenuItemID
    FROM Orders o
    GROUP BY o.MenuItemID
    HAVING COUNT(*) > 2
);
-- Exercise: Create optimized queries to manage and analyze data
-- Task 4 Procedure getmaxquantity
DELIMITER //
CREATE PROCEDURE GetMaxQuantity()
BEGIN
    DECLARE maxQty INT;
	SELECT MAX(Quantity) INTO maxQty FROM `db_capstone_proj`.`Orders`;
	SELECT maxQty AS 'Maximum Ordered Quantity';END //
DELIMITER ;

CALL GetMaxQuantity()

-- Task 5 prepared statement 'GetOrderDetail'
PREPARE GetOrderDetail FROM 'SELECT OrderID, Quantity, TotalCost FROM db_capstone_proj.orders WHERE CustomerID = ?';
SET @id = 1;
EXECUTE GetOrderDetail USING @id;

-- Task 6 Procedure Cancel order

DELIMITER //

CREATE PROCEDURE CancelOrder(IN orderIDToDelete INT)
BEGIN
  DECLARE orderExistence INT;
  
  SELECT COUNT(*) INTO orderExistence FROM `db_capstone_proj`.`orders` WHERE OrderID = orderIDToDelete;
  
  IF orderExistence > 0 THEN
    DELETE FROM `db_capstone_proj`.`orderdeliverystatus` WHERE OrderID = orderIDToDelete;
    DELETE FROM `db_capstone_proj`.`orders` WHERE OrderID = orderIDToDelete;
  END IF;
END //

DELIMITER ;

CALL CancelOrder(5);

-- Exercise: Create SQL queries to check available bookings based on user input
-- Task 7 simple INSERT statements
INSERT INTO Bookings (BookingID,CustomerID, Date, TableNumber)
VALUES 
(1,1, '2022-10-10', 5),
(2,2, '2022-11-12', 3),
(3,3, '2022-10-11', 2),
(4,4, '2022-10-13', 2);
-- Note: coz i have added data previously i replace the above insert statement step with a update step to replace data with the ones mentjoned in the question.
UPDATE `db_capstone_proj`.`bookings` SET `Date` = '2022-10-10 18:30:00', `TableNumber` = '5' WHERE (`BookingID` = '1');
UPDATE `db_capstone_proj`.`bookings` SET `Date` = '2022-11-12 19:00:00', `TableNumber` = '3' WHERE (`BookingID` = '2');
UPDATE `db_capstone_proj`.`bookings` SET `Date` = '2022-10-11 19:30:00', `TableNumber` = '2' WHERE (`BookingID` = '3');
UPDATE `db_capstone_proj`.`bookings` SET `Date` = '2022-10-13 20:00:00', `TableNumber` = '2' WHERE (`BookingID` = '4');

-- Task 8 CheckBooking

DELIMITER //
CREATE PROCEDURE `db_capstone_proj`.`CheckBooking`(IN booking_date DATE, IN table_number INT)
BEGIN
    DECLARE table_status VARCHAR(50);

    SELECT COUNT(*) INTO @table_count
    FROM `db_capstone_proj`.`Bookings`
    WHERE `Date` = booking_date AND `TableNumber` = table_number;

    IF (@table_count > 0) THEN
        SET table_status = 'Table already booked.';
    ELSE
        SET table_status = 'Table available.';
    END IF;

    SELECT table_status AS 'TableStatus';
END;
//
DELIMITER ;
CALL `db_capstone_proj`.`CheckBooking`('2022-10-10', 5);

-- Task 9 AddValidBooking
DELIMITER //
CREATE PROCEDURE `db_capstone_proj`.`AddValidBooking`(IN bookingid INT,IN customerid INT,IN bookingdate DATE, IN tablenumber INT)
BEGIN
    DECLARE tablestatus INT;
    START TRANSACTION;

    SELECT COUNT(*) INTO tablestatus
    FROM `db_capstone_proj`.`Bookings`
    WHERE `Date` = bookingdate AND `TableNumber` = tablenumber;

    IF (tablestatus > 0) THEN
        ROLLBACK;
        SELECT 'Booking could not be completed. Table is already booked on the specified date.' AS 'Status';
    ELSE
        INSERT INTO `db_capstone_proj`.`Bookings`(`BookingID`,`CustomerID`,`Date`, `TableNumber`)
        VALUES(bookingid,customerid,bookingdate, tablenumber);

        COMMIT;
        SELECT 'Booking completed successfully.' AS 'Status';
    END IF;
END;
//
DELIMITER ;

CALL `db_capstone_proj`.`AddValidBooking`(11, 1, 1,'2022-10-10', 5);

-- Exercise: Create SQL queries to add and update bookings
-- Task 10 AddBooking
DELIMITER //
CREATE PROCEDURE `db_capstone_proj`.`AddBooking`(
    IN booking_id INT, 
    IN customer_id INT, 
    IN booking_date DATETIME, 
    IN table_number INT)
BEGIN
	INSERT INTO `db_capstone_proj`.`bookings` (`BookingID`, `CustomerID`, `Date`, `TableNumber`)
    VALUES(booking_id, customer_id,booking_date, table_number);

    SELECT 'New booking added' AS 'Booking Confirmation';
END;
//
DELIMITER ;


CALL `db_capstone_proj`.`AddBooking`(17, 1, '2023-10-10 21:30:00', 10);

-- Task 11 UpdateBooking
DELIMITER //
CREATE PROCEDURE `db_capstone_proj`.`UpdateBooking`(
    IN booking_id INT, 
    IN booking_date DATE)
BEGIN
    UPDATE `db_capstone_proj`.`Bookings`
    SET `Date` = booking_date
    WHERE `BookingID` = booking_id;

    SELECT CONCAT('Booking ', booking_id, ' is updated now') AS 'Confirmation';
END;
//
DELIMITER ;

CALL `db_capstone_proj`.`UpdateBooking`(9, '2022-11-15');

-- Task 12

DELIMITER //
CREATE PROCEDURE `db_capstone_proj`.`CancelBooking`(IN booking_id INT)
BEGIN
    DELETE FROM `db_capstone_proj`.`Bookings`
    WHERE `BookingID` = booking_id;

    SELECT CONCAT('Booking ', booking_id, ' is cancelled') AS 'Confirmation';
END;
//
DELIMITER ;

CALL `db_capstone_proj`.`CancelBooking`(9);