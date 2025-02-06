
-- Create Customers Table
CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    PhoneNumber VARCHAR(15),
    Address TEXT,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Create Products Table
CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Category VARCHAR(50),
    Price DECIMAL(10, 2) NOT NULL,
    StockQuantity INT NOT NULL
);

-- Create Orders Table
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Create OrderDetails Table
CREATE TABLE OrderDetails (
    OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    Subtotal DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Insert Sample Data into Customers Table
INSERT INTO Customers (FirstName, LastName, Email, PhoneNumber, Address) VALUES
('John', 'Doe', 'john@example.com', '1234567890', '123 Main St, NY'),
('Jane', 'Smith', 'jane@example.com', '9876543210', '456 Elm St, CA'),
('Alice', 'Johnson', 'alice@example.com', '5551234567', '789 Oak St, TX'),
('Bob', 'Brown', 'bob@example.com', '3334445555', '321 Pine St, FL'),
('Charlie', 'Davis', 'charlie@example.com', '1112223333', '654 Maple St, IL');

-- Insert Sample Data into Products Table
INSERT INTO Products (ProductName, Category, Price, StockQuantity) VALUES
('Laptop', 'Electronics', 799.99, 10),
('Phone', 'Electronics', 499.99, 20),
('Headphones', 'Accessories', 99.99, 50),
('Keyboard', 'Accessories', 49.99, 30),
('Mouse', 'Accessories', 29.99, 40);

-- Insert Sample Data into Orders Table
INSERT INTO Orders (CustomerID, TotalAmount) VALUES
(1, 899.98),
(2, 499.99),
(3, 1299.98),
(4, 79.99),
(5, 189.98);

-- Insert Sample Data into OrderDetails Table
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Subtotal) VALUES
(1, 1, 1, 799.99),
(1, 3, 1, 99.99),
(2, 2, 1, 499.99),
(3, 1, 1, 799.99),
(3, 4, 1, 49.99),
(4, 5, 1, 29.99),
(5, 2, 1, 499.99),
(5, 3, 1, 99.99);
