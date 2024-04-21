USE ShopDB;

INSERT INTO Orders (CustomerID, Date)
    VALUES (1, '2023-01-01');

START TRANSACTION;
INSERT INTO OrderItems (OrderID, ProductID, Count)
    VALUES (1, 1, 0);
UPDATE Products SET WarehouseAmount = WarehouseAmount - 1 WHERE ID = '1'; 
UPDATE OrderItems SET Count = Count + 1 WHERE OrderID = '1';  -- Assuming you want to update Count by OrderID
COMMIT;
