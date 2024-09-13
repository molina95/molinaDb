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

INSERT INTO StateOrProvince
VALUES ('AB', 'Alberta');
INSERT INTO StateOrProvince
VALUES ('BC', 'British Columbia');
INSERT INTO StateOrProvince
VALUES ('MB', 'Manitoba');
INSERT INTO StateOrProvince
VALUES ('NB', 'New Brunswick');
INSERT INTO StateOrProvince
VALUES ('NF', 'Newfoundland');
INSERT INTO StateOrProvince
VALUES ('NT', 'Northwest Territories');
INSERT INTO StateOrProvince
VALUES ('NS', 'Nova Scotia');
INSERT INTO StateOrProvince
VALUES ('NU', 'Nunavut');
INSERT INTO StateOrProvince
VALUES ('ON', 'Ontario');
INSERT INTO StateOrProvince
VALUES ('PE', 'Prince Edward Island');
INSERT INTO StateOrProvince
VALUES ('QC', 'Quebec');
INSERT INTO StateOrProvince
VALUES ('SK', 'Saskatchewan');
INSERT INTO StateOrProvince
VALUES ('YT', 'Yukon Territory');
INSERT INTO StateOrProvince
VALUES ('AL', 'Alabama');
INSERT INTO StateOrProvince
VALUES ('AK', 'Alaska');
INSERT INTO StateOrProvince
VALUES ('AZ', 'Arizona');
INSERT INTO StateOrProvince
VALUES ('AR', 'Arkansas');
INSERT INTO StateOrProvince
VALUES ('CA', 'California');
INSERT INTO StateOrProvince
VALUES ('CO', 'Colorado');
INSERT INTO StateOrProvince
VALUES ('CT', 'Connecticut');
INSERT INTO StateOrProvince
VALUES ('DE', 'Delaware');
INSERT INTO StateOrProvince
VALUES ('DC', 'District of Columbia');
INSERT INTO StateOrProvince
VALUES ('FL', 'Florida');
INSERT INTO StateOrProvince
VALUES ('GA', 'Georgia');
INSERT INTO StateOrProvince
VALUES ('HI', 'Hawaii');
INSERT INTO StateOrProvince
VALUES ('ID', 'Idaho');
INSERT INTO StateOrProvince
VALUES ('IL', 'Illinois');
INSERT INTO StateOrProvince
VALUES ('IN', 'Indiana');
INSERT INTO StateOrProvince
VALUES ('IA', 'Iowa');
INSERT INTO StateOrProvince
VALUES ('KS', 'Kansas');
INSERT INTO StateOrProvince
VALUES ('KY', 'Kentucky');
INSERT INTO StateOrProvince
VALUES ('LA', 'Louisiana');
INSERT INTO StateOrProvince
VALUES ('ME', 'Maine');
INSERT INTO StateOrProvince
VALUES ('MD', 'Maryland');
INSERT INTO StateOrProvince
VALUES ('MA', 'Massachusetts');
INSERT INTO StateOrProvince
VALUES ('MI', 'Michigan');
INSERT INTO StateOrProvince
VALUES ('MN', 'Minnesota');
INSERT INTO StateOrProvince
VALUES ('MS', 'Mississippi');
INSERT INTO StateOrProvince
VALUES ('MO', 'Missouri');
INSERT INTO StateOrProvince
VALUES ('MT', 'Montana');
INSERT INTO StateOrProvince
VALUES ('NE', 'Nebraska');
INSERT INTO StateOrProvince
VALUES ('NV', 'Nevada');
INSERT INTO StateOrProvince
VALUES ('NH', 'New Hampshire');
INSERT INTO StateOrProvince
VALUES ('NJ', 'New Jersey');
INSERT INTO StateOrProvince
VALUES ('NM', 'New Mexico');
INSERT INTO StateOrProvince
VALUES ('NY', 'New York');
INSERT INTO StateOrProvince
VALUES ('NC', 'North Carolina');
INSERT INTO StateOrProvince
VALUES ('ND', 'North Dakota');
INSERT INTO StateOrProvince
VALUES ('OH', 'Ohio');
INSERT INTO StateOrProvince
VALUES ('OK', 'Oklahoma');
INSERT INTO StateOrProvince
VALUES ('OR', 'Oregon');
INSERT INTO StateOrProvince
VALUES ('PA', 'Pennsylvania');
INSERT INTO StateOrProvince
VALUES ('RI', 'Rhode Island');
INSERT INTO StateOrProvince
VALUES ('SC', 'South Carolina');
INSERT INTO StateOrProvince
VALUES ('SD', 'South Dakota');
INSERT INTO StateOrProvince
VALUES ('TN', 'Tennessee');
INSERT INTO StateOrProvince
VALUES ('TX', 'Texas');
INSERT INTO StateOrProvince
VALUES ('UT', 'Utah');
INSERT INTO StateOrProvince
VALUES ('VT', 'Vermont');
INSERT INTO StateOrProvince
VALUES ('VA', 'Virginia');
INSERT INTO StateOrProvince
VALUES ('WA', 'Washington');
INSERT INTO StateOrProvince
VALUES ('WV', 'West Virginia');
INSERT INTO StateOrProvince
VALUES ('WI', 'Wisconsin');
INSERT INTO StateOrProvince
VALUES ('WY', 'Wyoming');

INSERT INTO Customer (FirstName, LastName, Address, City,
                      StateOrProvince, PostalCode, PhoneNumber)
VALUES ('John', 'Smith', '10341 Crestpoint Boulevard', 'North
             Beach', 'VA', '10234', '1022341234');

INSERT INTO Customer (FirstName, LastName, Address, City,
                      StateOrProvince, PostalCode, PhoneNumber)
VALUES ('Jacob', 'Salter', '234 North Main', 'Groveland', null,
        '45678', '7665554444');

INSERT INTO Customer (FirstName, LastName, Address, City,
                      StateOrProvince, PostalCode, PhoneNumber)
VALUES ('Victoria', 'Smithe', '14301 Mountain Ridge Court',
        'Huntington', 'WV', '22211', '2175438679');

INSERT INTO Customer (FirstName, LastName, Address, City,
                      StateOrProvince, PostalCode, PhoneNumber)
VALUES ('Bryce', 'Hatfield', '566 Pine Road', 'Marion',
        'IN', null, null);

INSERT INTO Customer (FirstName, LastName, Address, City,
                      StateOrProvince, PostalCode, PhoneNumber)
VALUES ('Kylee', 'Dicken', null, 'Upland', 'IN', '46905',
        '7654321098');

INSERT INTO Customer (FirstName, LastName, Address, City,
                      StateOrProvince, PostalCode, PhoneNumber)
VALUES ('Alex', 'Thompson', null, null, 'IN', null,
        '3175551213');

INSERT INTO Customer (FirstName, LastName, Address, City,
                      StateOrProvince, PostalCode, PhoneNumber)
VALUES ('Davis', 'Thompson', '298 North Broadway', 'Greensburg',
        'IN', '46514', '3175551214');

INSERT INTO Customer (FirstName, LastName, Address, City,
                      StateOrProvince, PostalCode, PhoneNumber)
VALUES ('Harrison', 'Thompson', '345 Hawks Point Drive Apt B',
        'Indianapolis', 'IN', '46123', '3175551215');

INSERT INTO Vehicle (VehicleYear, Make, Model, Color, LicensePlate#,
                     LastServiceDate, CustomerID)
VALUES ('2000', 'Chevrolet', 'S-10', 'Purple', 'TROJANS',
        '8-13-2001', 4);

INSERT INTO Vehicle (VehicleYear, Make, Model, Color, LicensePlate#,
                     LastServiceDate, CustomerID)
VALUES ('1998', 'Ford', 'Mustang', 'Red', 'HH7832',
        '9-16-2001', 2);

INSERT INTO Vehicle (VehicleYear, Make, Model, Color, LicensePlate#,
                     LastServiceDate, CustomerID)
VALUES ('2002', 'Pontiac', 'Grand Prix', 'Black', 'GOPRDUE',
        '5-21-2002', 5);

INSERT INTO Vehicle (VehicleYear, Make, Model, Color, LicensePlate#,
                     LastServiceDate, CustomerID)
VALUES ('1968', 'Chevrolet', 'Corvette', 'Black', 'KODIAK',
        '1-20-2002', 1);

INSERT INTO Vehicle (VehicleYear, Make, Model, Color, LicensePlate#,
                     LastServiceDate, CustomerID)
VALUES ('2002', 'Nissan', 'Altima', 'White', 'HEYDARE',
        '1-26-2002', 3);

INSERT INTO Vehicle (VehicleYear, Make, Model, Color, LicensePlate#,
                     LastServiceDate, CustomerID)
VALUES ('2000', 'Chrysler', 'PT Cruiser', 'Black', 'ALEX T',
        '5-15-2002', 6);

INSERT INTO Vehicle (VehicleYear, Make, Model, Color, LicensePlate#,
                     LastServiceDate, CustomerID)
VALUES ('2002', 'Chevrolet', 'Trail Blazer', 'Green', 'I TRADE',
        '5-31-2001', 8);

INSERT INTO Vehicle (VehicleYear, Make, Model, Color, LicensePlate#,
                     LastServiceDate, CustomerID)
VALUES ('2001', 'Ford', 'Expedition', 'Maroon', 'DAVIS T',
        '5-31-2001', 7);

INSERT INTO Vehicle (VehicleYear, Make, Model, Color, LicensePlate#,
                     LastServiceDate, CustomerID)
VALUES ('1972', 'AMC', 'Gremlin', 'Pink', 'UGOGIRL',
        '2-17-2002', 4);

INSERT INTO Service (Description, RatePerHour)
VALUES ('Oil Change', 60.00);

INSERT INTO Service (Description, RatePerHour)
VALUES ('Replace Wiperblades', 10.00);

INSERT INTO Service (Description, RatePerHour)
VALUES ('Replace Air Filter', 10.00);

INSERT INTO Service (Description, RatePerHour)
VALUES ('Change PVC Valve', 10.00);

INSERT INTO Service (Description, RatePerHour)
VALUES ('Change and Flush Cooling System', 60.00);

INSERT INTO Service (Description, RatePerHour)
VALUES ('Change and Flush Differential', 60.00);

INSERT INTO Part (Description, Cost)
VALUES ('Protects 10w-30 Oil', 7.49);

INSERT INTO Part (Description, Cost)
VALUES ('Protects 10w-40 Oil', 7.49);

INSERT INTO Part (Description, Cost)
VALUES ('Black Gold 10w-30 Oil', 7.99);

INSERT INTO Part (Description, Cost)
VALUES ('Black Gold 10w-40 Oil', 7.99);

INSERT INTO Part (Description, Cost)
VALUES ('Motion Synthetic Oil 10w-30', 13.99);

INSERT INTO Part (Description, Cost)
VALUES ('Motion Synthetic Oil 10w-40', 13.99);

INSERT INTO Part (Description, Cost)
VALUES ('Texas Tea Economy Oil Filter', 3.99);

INSERT INTO Part (Description, Cost)
VALUES ('ACME Oil Filter', 4.99);

INSERT INTO Part (Description, Cost)
VALUES ('ACME Air Filter', 8.99);

INSERT INTO Part (Description, Cost)
VALUES ('ACME Wiper Blades', 9.99);

INSERT INTO Part (Description, Cost)
VALUES ('ACME Brake Fluid', 0.00);

INSERT INTO Part (Description, Cost)
VALUES ('ACME Transmission Fluid', 0.00);

INSERT INTO Part (Description, Cost)
VALUES ('ACME Coolant', 0.00);

INSERT INTO Part (Description, Cost)
VALUES ('ACME Windshield Fluid', 0.00);

INSERT INTO Part (Description, Cost)
VALUES ('ACME Differential Fluid', 0.00);

INSERT INTO Part (Description, Cost)
VALUES ('ACME PVC Valve', 12.99);

INSERT INTO JobTicket (CustomerID, StartDate, EndDate, VehicleID)
VALUES (1, '1-20-2002', '1-20-2002', 4);

INSERT INTO JobTicket (CustomerID, StartDate, EndDate, VehicleID)
VALUES (1, '7-20-2001', '7-20-2001', 4);

INSERT INTO JobTicket (CustomerID, StartDate, EndDate, VehicleID)
VALUES (2, '9-16-2001', '9-16-2001', 2);

INSERT INTO JobTicket (CustomerID, StartDate, EndDate, VehicleID)
VALUES (3, '1-26-2002', '1-26-2002', 5);

INSERT INTO JobTicket (CustomerID, StartDate, EndDate, VehicleID)
VALUES (5, '5-21-2002', '5-21-2002', 3);

INSERT INTO JobTicket (CustomerID, StartDate, EndDate, VehicleID)
VALUES (4, '8-13-2001', '8-13-2001', 1);

INSERT INTO JobTicket (CustomerID, StartDate, EndDate, VehicleID)
VALUES (4, '2-16-2002', '2-17-2002', 9);

INSERT INTO JobTicketDetail (JobTicketID, LineItemNumber, ServiceID,
                             DateComplete, HoursSpent)
VALUES (1, 1, 1, '1-20-2002', .5);

INSERT INTO JobTicketDetail (JobTicketID, LineItemNumber, ServiceID,
                             DateComplete, HoursSpent)
VALUES (2, 1, 1, '7-20-2001', .25);

INSERT INTO JobTicketDetail (JobTicketID, LineItemNumber, ServiceID,
                             DateComplete, HoursSpent)
VALUES (2, 2, 3, '7-20-2001', .1);

INSERT INTO JobTicketDetail (JobTicketID, LineItemNumber, ServiceID,
                             DateComplete, HoursSpent)
VALUES (2, 3, 4, '7-20-2002', .1);

INSERT INTO JobTicketDetail (JobTicketID, LineItemNumber, ServiceID,
                             DateComplete, HoursSpent)
VALUES (3, 1, 1, '9-16-2001', .25);

INSERT INTO JobTicketDetail (JobTicketID, LineItemNumber, ServiceID,
                             DateComplete, HoursSpent)
VALUES (4, 1, 1, '1-26-2002', .25);

INSERT INTO JobTicketDetail (JobTicketID, LineItemNumber, ServiceID,
                             DateComplete, HoursSpent)
VALUES (5, 1, 2, '5-21-2002', .2);

INSERT INTO JobTicketDetail (JobTicketID, LineItemNumber, ServiceID,
                             DateComplete, HoursSpent)
VALUES (5, 2, 1, '5-21-2002', .25);

INSERT INTO JobTicketDetail (JobTicketID, LineItemNumber, ServiceID,
                             DateComplete, HoursSpent)
VALUES (6, 1, 5, '8-13-2001', 1.15);

INSERT INTO JobTicketDetail (JobTicketID, LineItemNumber, ServiceID,
                             DateComplete, HoursSpent)
VALUES (7, 1, 1, '2-16-2002', .35);

INSERT INTO JobTicketDetail (JobTicketID, LineItemNumber, ServiceID,
                             DateComplete, HoursSpent)
VALUES (7, 2, 3, '2-16-2002', .1);

INSERT INTO JobTicketDetail (JobTicketID, LineItemNumber, ServiceID,
                             DateComplete, HoursSpent)
VALUES (7, 3, 4, '2-16-2002', .15);

INSERT INTO JobTicketDetail (JobTicketID, LineItemNumber, ServiceID,
                             DateComplete, HoursSpent)
VALUES (7, 4, 6, '2-16-2002', 1.0);

INSERT INTO JobTicketDetail (JobTicketID, LineItemNumber, ServiceID,
                             DateComplete, HoursSpent)
VALUES (7, 5, 5, '2-17-2002', .5);

INSERT INTO PartUsed (JobTicketID, LineItemNumber, PartID, Quantity)
VALUES (1, 1, 4, 4);

INSERT INTO PartUsed (JobTicketID, LineItemNumber, PartID, Quantity)
VALUES (1, 1, 7, 1);

INSERT INTO PartUsed (JobTicketID, LineItemNumber, PartID, Quantity)
VALUES (1, 1, 11, 1);

INSERT INTO PartUsed (JobTicketID, LineItemNumber, PartID, Quantity)
VALUES (1, 1, 12, 1);

INSERT INTO PartUsed (JobTicketID, LineItemNumber, PartID, Quantity)
VALUES (2, 1, 5, 4);

INSERT INTO PartUsed (JobTicketID, LineItemNumber, PartID, Quantity)
VALUES (2, 1, 14, 1);

INSERT INTO PartUsed (JobTicketID, LineItemNumber, PartID, Quantity)
VALUES (2, 1, 8, 1);

INSERT INTO PartUsed (JobTicketID, LineItemNumber, PartID, Quantity)
VALUES (2, 2, 9, 1);

INSERT INTO PartUsed (JobTicketID, LineItemNumber, PartID, Quantity)
VALUES (2, 3, 16, 1);

INSERT INTO PartUsed (JobTicketID, LineItemNumber, PartID, Quantity)
VALUES (3, 1, 6, 4);

INSERT INTO PartUsed (JobTicketID, LineItemNumber, PartID, Quantity)
VALUES (3, 1, 7, 1);

INSERT INTO PartUsed (JobTicketID, LineItemNumber, PartID, Quantity)
VALUES (4, 1, 1, 4);

INSERT INTO PartUsed (JobTicketID, LineItemNumber, PartID, Quantity)
VALUES (4, 1, 8, 1);

INSERT INTO PartUsed (JobTicketID, LineItemNumber, PartID, Quantity)
VALUES (5, 1, 10, 1);

INSERT INTO PartUsed (JobTicketID, LineItemNumber, PartID, Quantity)
VALUES (5, 2, 3, 4);

INSERT INTO PartUsed (JobTicketID, LineItemNumber, PartID, Quantity)
VALUES (5, 2, 14, 1);

INSERT INTO PartUsed (JobTicketID, LineItemNumber, PartID, Quantity)
VALUES (5, 2, 12, 1);

INSERT INTO PartUsed (JobTicketID, LineItemNumber, PartID, Quantity)
VALUES (5, 2, 8, 1);

INSERT INTO PartUsed (JobTicketID, LineItemNumber, PartID, Quantity)
VALUES (6, 1, 13, 1);

INSERT INTO PartUsed (JobTicketID, LineItemNumber, PartID, Quantity)
VALUES (7, 1, 1, 4);

INSERT INTO PartUsed (JobTicketID, LineItemNumber, PartID, Quantity)
VALUES (7, 1, 8, 1);

INSERT INTO PartUsed (JobTicketID, LineItemNumber, PartID, Quantity)
VALUES (7, 1, 14, 1);

INSERT INTO PartUsed (JobTicketID, LineItemNumber, PartID, Quantity)
VALUES (7, 1, 12, 1);

INSERT INTO PartUsed (JobTicketID, LineItemNumber, PartID, Quantity)
VALUES (7, 2, 9, 1);

INSERT INTO PartUsed (JobTicketID, LineItemNumber, PartID, Quantity)
VALUES (7, 3, 16, 1);

INSERT INTO PartUsed (JobTicketID, LineItemNumber, PartID, Quantity)
VALUES (7, 4, 15, 1);

INSERT INTO PartUsed (JobTicketID, LineItemNumber, PartID, Quantity)
VALUES (7, 5, 13, 1);

