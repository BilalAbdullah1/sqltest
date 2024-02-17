create table Customers(
	CustomerID int primary key identity(1,1),
	FirstName varchar(15) not null,
	LastNAme varchar(15) not null,
	Email varchar(50) not null,
	PhoneNumber int,
)


create table Orders (
	OrderID int primary key identity(1,1),
	Orderdate date,
	TotalAmount decimal(10,2),
	Customerid int,
	foreign key (Customerid) references Customers(CustomerID)
)





create table OrderDetail (
	OrderDetailID int primary key identity(1,1),
	quantity int ,
	OrderId int,
	ProductId int,
	foreign key (OrderId) references Orders(OrderID),
	foreign key (ProductId) references Products(ProductID),
)


create table Products (
	ProductID int primary key identity(1,1),
	ProductName varchar(15),
	UnitPrice decimal(10,2),
	InStockQuantity int 
)

INSERT INTO Orders (OrderDate, TotalAmount, CustomerID)
VALUES
    ('2024-02-01', 100.50, 1),
    ('2024-02-02', 75.20, 3),
    ('2024-02-03', 150.75, 5),
    ('2024-02-04', 200.00, 2),
    ('2024-02-05', 120.90, 4),
    ('2024-02-06', 80.60, 6),
    ('2024-02-07', 90.25, 8),
    ('2024-02-08', 180.40, 7),
    ('2024-02-09', 130.75, 9),
    ('2024-02-10', 160.90, 10);

INSERT INTO Customers (FirstName, LastName, Email, PhoneNumber)
VALUES
    ('John', 'Doe', 'john.doe@example.com', 123123),
    ('Jane', 'Smith', 'jane.smith@example.com', 123124),
    ('Bob', 'Johnson', 'bob.johnson@example.com', 45278),
    ('Alice', 'Williams', 'alice.williams@example.com', 278245),
    ('Chris', 'Taylor', 'chris.taylor@example.com', 78645),
    ('Emily', 'Jones', 'emily.jones@example.com', 2123),
    ('David', 'Brown', 'david.brown@example.com', 4756345),
    ('Emma', 'Miller', 'emma.miller@example.com', 12345),
    ('Ryan', 'Davis', 'ryan.davis@example.com', 3123),
    ('Sophia', 'Anderson', 'sophia.anderson@example.com', 123123);


INSERT INTO Products (ProductName, UnitPrice, InStockQuantity)
VALUES
    ('Product1', 49.99, 100),
    ('Product2', 29.95, 75),
    ('Product3', 19.99, 150),
    ('Product4', 89.99, 50),
    ('Product5', 39.50, 120),
    ('Product6', 59.75, 80),
    ('Product7', 69.99, 90),
    ('Product8', 79.50, 180),
    ('Product9', 99.95, 130),
    ('Product10', 119.99, 160);


--3)
select FirstName,LastNAme,Orderdate,TotalAmount from Customers cust
left join Orders ord on cust.CustomerID = ord.Customerid 

--7)
create view ProductInventory 
as
select 
	ProductName,InStockQuantity
from Products
select * from ProductInventory

--6)
create view OrderSummary as
select OrderID,Orderdate,Customerid,TotalAmount from Orders
select * from OrderSummary

--8)
select FirstName,LastNAme,OrderID,Orderdate,ord.Customerid,TotalAmount from OrderSummary ord
left join Customers cust on cust.CustomerID = ord.Customerid
select * from Products

--4)
select * from Products prod
left join OrderDetail orddt on orddt.ProductId = prod.ProductID

