CREATE DATABASE ProVita;

Use ProVita;

CREATE TABLE Customers (
    Customer_ID INT NOT NULL,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Phone VARCHAR(50),
    Address VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50),
    Zipcode VARCHAR(10),
    PRIMARY KEY (Customer_ID)
);

CREATE TABLE Payments (
    Payment_ID INT PRIMARY KEY,
    Payment_Date DATE,
    Payment_Amount DECIMAL(10, 2),
    Payment_Method VARCHAR(50)
);

CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    OrderDate TIMESTAMP,
    Employee_ID INT,
    Customer_ID INT,
    Total_Amount DECIMAL(10,2),
    Status VARCHAR(50),
    Payment_ID INT,
    CONSTRAINT fk_customer FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_payment FOREIGN KEY (Payment_ID) REFERENCES Payments(Payment_ID)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE Order_Items (
    Item_ID INT PRIMARY KEY,
    Order_ID INT,
    Product_ID INT,
    Quantity INT,
    Price_Per_Unit DECIMAL(10,2),
    CONSTRAINT fk_order FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE Product_Category (
    Category_ID INT PRIMARY KEY,
    Category_Name VARCHAR(30),
    Description VARCHAR(80)
);

CREATE TABLE Supplier (
    Supplier_ID INT PRIMARY KEY,
    Supplier_Name VARCHAR(50)
);

CREATE TABLE Products (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(50),
    Price DECIMAL(10,2),
    Stock_Quantity INT,
    Category_ID INT,
    Supplier_ID INT,
    Description VARCHAR(30),
    CONSTRAINT fk_category FOREIGN KEY (Category_ID) REFERENCES Product_Category(Category_ID)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_supplier FOREIGN KEY (Supplier_ID) REFERENCES Supplier(Supplier_ID)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE Inventory (
    Inventory_ID INT PRIMARY KEY,
    Item_ID INT,
    Stock_Added_Date DATE,
    Warehouse_Location VARCHAR(30),
    Stock_Quantity INT,
    CONSTRAINT fk_item FOREIGN KEY (Item_ID) REFERENCES Order_Items(Item_ID)
        ON DELETE RESTRICT ON UPDATE CASCADE
);