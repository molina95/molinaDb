Use SlickShop;
SELECT StateOrProvince
FROM StateOrProvince;

SELECT StateOrProvinceName
FROM StateOrProvince;

SELECT StateOrProvince, StateOrProvinceName
FROM StateOrProvince;

SELECT *
FROM StateOrProvince;

SELECT StateOrProvince
FROM Customer;


--Takes one customer row and joins it with each of the rows in stateorprovince regardless of what the customer stateorprovince is.
SELECT CustomerID, Customer.StateOrProvince, StateOrProvince.StateOrProvince
FROM Customer, StateOrProvince;