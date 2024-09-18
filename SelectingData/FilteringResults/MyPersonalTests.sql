
--Customers who DON'T live in Indiana
    SELECT FirstName, LastName, Address, City, StateOrProvince, PostalCode
        FROM Customer
    WHERE StateOrProvince <> 'IN';
-- We have the inverse, customer that do live in Indiana.
    SELECT FirstName, LastName, Address, City, StateOrProvince, PostalCode
        FROM Customer
    WHERE StateOrProvince = 'IN';

    SELECT FirstName, LastName, Address, City, StateOrProvince, PostalCode
        FROM Customer
    WHERE City IS NULL;

    SELECT FirstName, LastName, Address, City, StateOrProvince, PostalCode
        FROM Customer
    WHERE StateOrProvince = 'IN';


-- Use of Parentheses, Evaluates VehicleYear = 2002 AND Make = 'Chevrolet' first.
    SELECT VehicleYear, Make, Model
        FROM Vehicle
     WHERE VehicleYear = 2000
        OR VehicleYear = 2002
        AND Make = 'Chevrolet';

-- Evaluates the Parentheses first, then makes the AND.

    SELECT VehicleYear, Make, Model
        FROM Vehicle
     WHERE (VehicleYear = 2000
        OR VehicleYear = 2002)
    ORDER BY VehicleYear;

    SELECT VehicleYear, Make, Model
        FROM Vehicle
     WHERE (VehicleYear = 2000
        OR VehicleYear = 2002)
        AND Make = 'Chevrolet';

-- In, Between, and Like.
    SELECT FirstName, LastName, City
        FROM Customer
    WHERE City IN ('Marion');

    SELECT FirstName, LastName, City
        FROM Customer
    WHERE City IN ('Marion', 'Upland');

    SELECT FirstName, LastName, City
        FROM Customer
    WHERE City IN ('Marion', 'Upland', 'Indianapolis');

-- Inverse Result set

    SELECT FirstName, LastName, City
        FROM Customer
    WHERE City NOT IN ('Marion', 'Upland', 'Indianapolis');

-- Null values do not appear in WHERE IN queries
    SELECT FirstName, LastName, City
        FROM Customer
    WHERE City NOT IN ('Marion', 'Upland', 'Indianapolis', NULL)

-- Like, is used as a wildcard to match expressions.
-- Customer whose name starts with the letter S.
--This is case-sensitive depending on the configuration of the database
-- % represents any sequences of characters after the S
    SELECT FirstName, LastName
        FROM Customer
    WHERE LastName LIKE 'S%';

    SELECT FirstName, LastName
        FROM Customer
    WHERE LastName LIKE 's%';

--Case sensitiv like in Microsoft SQL Server
    SELECT FirstName, LastName
        FROM Customer
    WHERE LastName COLLATE Latin1_General_BIN LIKE '%e';

    SELECT FirstName, LastName
        FROM Customer
    WHERE LastName COLLATE Latin1_General_BIN LIKE '%E';

--Last character has a minus e
    SELECT FirstName, LastName
        FROM Customer
    WHERE LastName LIKE '%e';

-- Find a first name that has a vowel as the second letter [a,e,i,o,u]
/*
    The _ finds anything for the first letter, the [ ] list finds a vowel in the
    second position, and the % finds the rest of the string no matter what the
    contents or the length.
*/
    SELECT FirstName, LastName
    FROM Customer
    WHERE FirstName LIKE '_[aeiou]%'

-- Inverse Selection
    SELECT FirstName, LastName
    FROM Customer
    WHERE FirstName NOT LIKE '_[aeiou]%'

    SELECT FirstName, LastName
    FROM Customer
    WHERE FirstName LIKE '_[a-e]%'

-- Becareful assuming the result of every inverse result set
-- This one will return the names that begin with J and a vowel
-- like John and Jacob, but it's inverse will simply return
-- the remaining names on the table that are not John or Jacob.
   SELECT FirstName, LastName
    FROM Customer
    WHERE FirstName LIKE 'J[aeiou]%'
-- Don't expect this to return the nanes that contain J but not vowels instead this will
-- return the names that do not begin with J and contain a vowel as  the second letter.
   SELECT FirstName, LastName
    FROM Customer
    WHERE FirstName NOT LIKE 'J[aeiou]%'

-- If you want to inverse use the ^ Operator
   SELECT FirstName, LastName
    FROM Customer
    WHERE FirstName LIKE 'J[^aeiou]%'
