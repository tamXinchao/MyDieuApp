create database MyDieu
CREATE TABLE Colors (
  Color_Id INT NOT NULL IDENTITY(1,1),
  Name NVARCHAR(150) NOT NULL,
  PRIMARY KEY (Color_Id)
);

CREATE TABLE Sizes
(
  Size_Id INT NOT NULL IDENTITY(1,1),
  Name NVARCHAR(150) NOT NULL,
  PRIMARY KEY (Size_Id)
);
ALTER TABLE Manufactures ALTER COLUMN Info NVARCHAR(Max) NULL;
CREATE TABLE Manufactures
(
  Manu_Id INT NOT NULL IDENTITY(1,1),
  Manu_Name NVARCHAR(150) NOT NULL,
  Image VARCHAR(150) NOT NULL,
  Info NVARCHAR(250) NOT NULL,
  PRIMARY KEY (Manu_Id)
);
CREATE TABLE Categories
(
  Cate_Id INT NOT NULL IDENTITY(1,1),
  Name NVARCHAR(150) NOT NULL,
  Image VARCHAR(150) NULL,
  PRIMARY KEY (Cate_Id)
);

CREATE TABLE Roles
(
  Role_Id INT NOT NULL IDENTITY(1,1),
  Name NVARCHAR(150) NOT NULL,
  PRIMARY KEY (Role_Id)
);
CREATE TABLE Products
(
  Product_Id INT NOT NULL  IDENTITY(1,1),
  Product_Name NVARCHAR(200) NOT NULL,
  Origin NVARCHAR(50) NOT NULL,
  Material NVARCHAR(200) NOT NULL,
  Describe NVARCHAR(250) NOT NULL,
  NgayNhap DATE NOT NULL,
  Manu_Id INT NOT NULL,
  Cate_Id INT NOT NULL,
  PRIMARY KEY (Product_Id),
  FOREIGN KEY (Manu_Id) REFERENCES Manufactures(Manu_Id),
  FOREIGN KEY (Cate_Id) REFERENCES Categories(Cate_Id)
);

CREATE TABLE Users
(
  User_Id INT NOT NULL IDENTITY(1,1),
  Fullname NVARCHAR(150) NOT NULL,
  Username NVARCHAR(150) NOT NULL,
  Password NVARCHAR(150) NOT NULL,
  Gender BIT NOT NULL,
  Role_Id INT NOT NULL,
  PRIMARY KEY (User_Id),
  FOREIGN KEY (Role_Id) REFERENCES Roles(Role_Id)
);

CREATE TABLE Address
(
  Address_Id INT NOT NULL IDENTITY(1,1),
  PhoneNumber NVARCHAR(150) NOT NULL,
  Email NVARCHAR(150) NOT NULL,
  Address NVARCHAR(200) NOT NULL,
  Provincial NVARCHAR(150) NOT NULL,
  PRIMARY KEY (Address_Id),
);

CREATE TABLE Address_User
(
  Id INT NOT NULL IDENTITY(1,1),
  User_Id INT NOT NULL,
  Address_Id INT NOT NULL,
  PRIMARY KEY (Id),
  FOREIGN KEY (User_Id) REFERENCES Users(User_Id),
  FOREIGN KEY (Address_Id) REFERENCES Address(Address_Id),
  UNIQUE (User_Id, Address_Id)
);

CREATE TABLE Product_Size_Color
(
  Pro_Size_Color_Id INT NOT NULL IDENTITY(1,1),
  Status BIT NOT NULL,
  Quality INT NOT NULL,
  Price FLOAT NOT NULL,
  Size_Id INT NOT NULL,
  Color_Id INT NOT NULL,
  Product_Id INT NOT NULL,
  PRIMARY KEY (Pro_Size_Color_Id),
  FOREIGN KEY (Size_Id) REFERENCES Sizes(Size_Id),
  FOREIGN KEY (Color_Id) REFERENCES Colors(Color_Id),
  FOREIGN KEY (Product_Id) REFERENCES Products(Product_Id)
);

CREATE TABLE Employees
(
  Em_Id INT NOT NULL IDENTITY(1,1),
  Position NVARCHAR(150) NOT NULL,
  Startday DATE NOT NULL,
  User_Id INT NOT NULL,
  PRIMARY KEY (Em_Id),
  FOREIGN KEY (User_Id) REFERENCES Users(User_Id)
);

CREATE TABLE Cart
(
  Id INT NOT NULL IDENTITY(1,1),
  Date DATE NOT NULL,
  User_Id INT NOT NULL,
  Pro_Size_Color_Id INT NOT NULL,
  PRIMARY KEY (Id),
  FOREIGN KEY (User_Id) REFERENCES Users(User_Id),
  FOREIGN KEY (Pro_Size_Color_Id) REFERENCES Product_Size_Color(Pro_Size_Color_Id)
);

CREATE TABLE Product_Image
(
  Id INT NOT NULL IDENTITY(1,1),
  Name_Img VARCHAR(100) NOT NULL,
  Pro_Size_Color_Id INT NOT NULL,
  FOREIGN KEY (Pro_Size_Color_Id) REFERENCES Product_Size_Color(Pro_Size_Color_Id)
);
ALTER TABLE Orders ALTER COLUMN Status NVARCHAR(50) not NULL;
CREATE TABLE Orders
(
  Order_Id INT NOT NULL IDENTITY(1,1),
  Date DATE NOT NULL,
  Status INT NOT NULL,
  TotalAmount FLOAT NOT NULL,
  User_Id INT NOT NULL,
  Em_Id INT NOT NULL,
  PRIMARY KEY (Order_Id),
  FOREIGN KEY (User_Id) REFERENCES Users(User_Id),
  FOREIGN KEY (Em_Id) REFERENCES Employees(Em_Id)
);

CREATE TABLE Order_Detail
(
  Order_Detail_Id INT NOT NULL IDENTITY(1,1),
  Quality INT NOT NULL,
  Pro_Size_Color_Id INT NOT NULL,
  Order_Id INT NOT NULL,
  PRIMARY KEY (Order_Detail_Id),
  FOREIGN KEY (Pro_Size_Color_Id) REFERENCES Product_Size_Color(Pro_Size_Color_Id),
  FOREIGN KEY (Order_Id) REFERENCES Orders(Order_Id),
  UNIQUE (Pro_Size_Color_Id, Order_Id)
);