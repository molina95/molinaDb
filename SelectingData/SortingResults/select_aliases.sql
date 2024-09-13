--SQL gives you the option to Use Aliases to show a different column name in the result set or to
--Address a Column, Table or Object name with simpler or more complex name depending on you needs.

USE SlickShop;

--Here we are using the column names as they are defined in their respective table and the names defined there
--are the ones used in the result set and the one that the commands executed from this Select
-- statement will address them by.
    SELECT FirstName, LastName, Address, City, StateOrProvince, PostalCode
        FROM Customer
ORDER BY StateOrProvince, LastName;

--Here we get the same result set but with different column names.
    SELECT FirstName, LastName, Address, City, StateOrProvince AS State, PostalCode AS Zip
        FROM Customer
ORDER BY StateOrProvince, LastName;
