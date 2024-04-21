USE ShopDB; 
START TRANSACTION; 

-- Insert a new order
INSERT INTO Orders (CustomerID, Date) VALUES (1, '2023-01-01');
SET @orderId = LAST_INSERT_ID();

-- Insert an order item associated with the new order
INSERT INTO OrderItems (OrderID, ProductID, Count) VALUES (@orderId, 1, 1);

-- Optional: Update product inventory
UPDATE Products SET WarehouseAmount = WarehouseAmount - 1 WHERE ID = 1;
IF ROW_COUNT() = 0 THEN
    ROLLBACK;
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Failed to update product inventory';
ELSE
    COMMIT;
END IF;
