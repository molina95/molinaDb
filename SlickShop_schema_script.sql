CREATE DATABASE SlickShop;

USE SlickShop;

CREATE TABLE StateOrProvince
(
    StateOrProvince     Char(2)     NOT NULL PRIMARY KEY CLUSTERED,
    StateOrProvinceName Varchar(50) NOT NULL
);

CREATE TABLE Customer
(
    CustomerID      Integer IDENTITY NOT NULL
        PRIMARY KEY CLUSTERED,
    FirstName       Varchar(20)      NULL,
    LastName        Varchar(30)      NULL,
    Address         Varchar(100)     NULL,
    City            Varchar(30)      NULL,
    StateOrProvince Char(2)          NULL REFERENCES
        StateOrProvince (StateOrProvince),
    PostalCode      Varchar(10)      NULL,
    PhoneNumber     Varchar(10)      NULL
);

CREATE TABLE Vehicle
(
    VehicleID       Integer IDENTITY NOT NULL
        PRIMARY KEY CLUSTERED,
    VehicleYear     SmallInt         NULL,
    Make            Varchar(30)      NULL,
    Model           Varchar(30)      NULL,
    Color           Varchar(30)      NULL,
    LicensePlate#   Varchar(10)      NULL,
    LastServiceDate Smalldatetime    NULL,
    CustomerID      Integer          NOT NULL
        REFERENCES Customer (CustomerID)
);

CREATE TABLE Service
(
    ServiceID   Integer IDENTITY NOT NULL
        PRIMARY KEY CLUSTERED,
    Description Varchar(100)     NOT NULL,
    RatePerHour Money            NOT NULL
);

CREATE TABLE Part
(
    PartID      Integer IDENTITY NOT NULL
        PRIMARY KEY CLUSTERED,
    Description Varchar(100)     NOT NULL,
    Cost        Money            NOT NULL
);

CREATE TABLE JobTicket
(
    JobTicketID Integer IDENTITY NOT NULL
        PRIMARY KEY CLUSTERED,
    CustomerID  Integer          NOT NULL
        REFERENCES Customer (CustomerID),
    StartDate   Smalldatetime    NULL,
    EndDate     Smalldatetime    NULL,
    VehicleID   Integer          NOT NULL
        REFERENCES Vehicle (VehicleID)
);

CREATE TABLE JobTicketDetail
(
    JobTicketID    Integer       NOT NULL
        REFERENCES JobTicket (JobTicketID),
    LineItemNumber TinyInt       NOT NULL,
    ServiceID      Integer       NOT NULL
        REFERENCES Service (ServiceID),
    DateComplete   Smalldatetime NULL,
    HoursSpent     Decimal(5, 2) NOT NULL DEFAULT 0,
    CONSTRAINT PK_JobTicketDetail PRIMARY KEY (JobTicketID,
                                               LineItemNumber)
);

CREATE TABLE PartUsed
(
    JobTicketID    Integer NOT NULL,
    LineItemNumber TinyInt NOT NULL,
    PartID         Integer NOT NULL REFERENCES Part (PartID),
    Quantity       TinyInt NOT NULL,
    CONSTRAINT PK_PartUsed PRIMARY KEY (JobTicketID, LineItemNumber,
                                        PartID),
    CONSTRAINT FK_JobTicketDetail_PartUsed FOREIGN KEY (JobTicketID,
                                                        LineItemNumber)
        REFERENCES JobTicketDetail (JobTicketID, LineItemNumber)
);
