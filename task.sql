USE ShopDB;
START TRANSACTION;

INSERT INTO Orders (CustomerID, Date) VALUES (1, '2023-01-01');
SET @orderId = LAST_INSERT_ID();

INSERT INTO OrderItems (OrderID, ProductID, Count) VALUES (@orderId, 1, 1);

UPDATE Products SET WarehouseAmount = WarehouseAmount - 1 WHERE ID = 1;

SET @updateSuccess = ROW_COUNT();
SELECT CASE
    WHEN @updateSuccess > 0 THEN 'Commit'
    ELSE 'Rollback'
END;
