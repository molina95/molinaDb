-- If the SELECT clause allows us to filter the columns that are shown in the result set,
-- the WHERE clause lets us interact which rows are return in the result set.
-- The WHERE clause works by filtering the result set of the select statement based on
-- the evaluation of logical expressions, for example, here we evaluate if the
-- value of City, StateOrProvince, and PostalCode in a single row IS NOT NULL
-- If the all the logical operations annexed by the operator AND evaluate to true
-- then the value is shown, otherwise is filtered by the conditions.
    SELECT FirstName, LastName, Address, City, StateOrProvince AS State, PostalCode
        FROM Customer
    WHERE Address IS NOT NULL
        AND City  IS NOT NULL
        AND StateOrProvince IS NOT NULL
        AND PostalCode IS NOT NULL
ORDER BY StateOrProvince, LastName;

-- There are other operators that are valid within the WHERE clause, for example, the
-- '<>' Not equal operator, here we filter the rows that have 'IN' as their StateOrProvince.
-- 'VA' is not equal to 'IN', evaluates to true, then shows the result.
    SELECT FirstName, LastName, Address, City, StateOrProvince, PostalCode
        FROM Customer
    WHERE StateOrProvince <> 'IN';
-- Here we have the Inverse of the previous query, this gives us all the Customers that live in Indiana.
-- We are using the equal to operator '='
    SELECT FirstName, LastName, Address, City, StateOrProvince, PostalCode
        FROM Customer
    WHERE StateOrProvince = 'IN';
-- There are multiple operators that you can use on the WHERE clause here is a list of some of them.
/*
Operator  Description                 Example           Meaning
IS Equal  (used with NULL)            City IS NULL      Where the City column contains a NULL
IS NOT    Not equal (used with NULL)  City IS NOT       NULL Where the City column does not contain a NULL
 =        Equal                       City = 'Chicago'  Where the City column contains 'Chicago'
<>        Not equal                   City <> 'Chicago' Where the City column does not contain 'Chicago'
 <        Less than                   Quantity < 5      Where the Quantity column contains a
                                                        value less than 5
 >        Greater than                Quantity > 5      Where the Quantity column contains a value
                                                        greater than 5
 <=       Less than or equal to       Quantity <= 5     Where the Quantity column contains a
                                                        value less than or equal to 5
>=        Greater than or equal to    Quantity >= 5     Where the Quantity column contains a value
                                                        greater than or equal to 5
*/

-- Some of the uses we can give to the greater or equal than is to use it to search for dates
-- Here we can get all the JobTickets that have a Startdate after January first 2002
    SELECT *
        FROM JobTicket
    WHERE StartDate >= '1/1/2002';
-- We can also close the range of dates to cover only January or 2002
-- By combining 2 conditions with the AND operator, one that ches that is greater or equal to January 1st
-- and another one that checks that is less or equal than January 31st.
    SELECT *
        FROM JobTicket
    WHERE StartDate >= '1/1/2002'
      AND StartDate <= '1/31/2002';
-- We can even define 2 Sets of ranges.
-- AND expressions are evaluated before OR expressions.
-- It's important to understand the use of parentheses
-- when performing AND|OR evaluations.
-- OR is a complement to AND where and needs both sides of the operation to
-- be true OR only needs one of them to be true in order to return true.
-- Here we are using it to annex another date range to our request.
-- We use parentheses to differentiate the sides to be evaluated and be sure
-- what gets evaluated first. In this case, we use it to separate date ranges.
-- This is important to make sure witch operations are evaluated with an AND or an OR.
    SELECT *
        FROM JobTicket
    WHERE StartDate >= '1/1/2002'
      AND StartDate <= '1/31/2002'
      OR  (StartDate >= '5/1/2002'
      AND StartDate <= '5/31/2002');

-- Here we can see an example where
-- the AND Pair VehicleYear = 2002 AND Make = 'Chevrolet' is evaluated first
-- making it return vehicles which year is 2000 or their year is 2002, but
-- their maker is Chevrolet, instead of returning vehicles that are either made on
-- 2000 or 2002 and their maker is Chevrolet
    SELECT VehicleYear, Make, Model
        FROM Vehicle
     WHERE VehicleYear = 2000
        OR VehicleYear = 2002
        AND Make = 'Chevrolet';

-- By the Use of Parentheses, Evaluates VehicleYear = 2002 AND Make = 'Chevrolet' first.
-- Returning the query we wanted. Remember that it is important to understand the order
-- the operations are evaluated.
    SELECT VehicleYear, Make, Model
        FROM Vehicle
     WHERE (VehicleYear = 2000
        OR VehicleYear = 2002)
    ORDER BY VehicleYear;

-- Now let's looks at the IN() Operator
-- It lets us search for items from a list of values.
-- In this case, this query will return the customers that live
-- In mario or upland or indianapolis.
-- We can do this with the '=' and the 'OR' operators, but it gives us
-- A cleaner an easier to read a query by simply using the IN operator.
-- Remember that if it is a numeric value, we need to put in outside single quotes.
    SELECT FirstName, LastName, City
        FROM Customer
    WHERE City IN ('Marion', 'Upland', 'Indianapolis');

-- We can also inverse the result set and get all the other Customers
-- That do not live in Mario, Upland or Indianapolis.
-- We achieve this by using the operator NOT before IN
-- This inverse query won't return the customers whose city is NULL.
    SELECT FirstName, LastName, City
        FROM Customer
    WHERE City NOT IN ('Marion', 'Upland', 'Indianapolis');

-- The IN operator cannot check for NULL values, that means that we
-- Have to explicitly tell SQL that we want those values.
    SELECT FirstName, LastName, City
        FROM Customer
    WHERE City NOT IN ('Marion', 'Upland', 'Indianapolis')
        OR City IS NULL;

-- Another useful operator is BETWEEN AND
-- It allows us to work with ranges, we can work with ranges using other
-- Operators like OR, equal or greater than and even the IN operator
-- but it servers for a cleaner query to simply use IN BETWEEN
    SELECT VehicleYear, Make, Model
    FROM Vehicle
    WHERE VehicleYear = 2001
    OR VehicleYear = 2000
    OR VehicleYear =1999
    OR VehicleYear = 1998
ORDER BY VehicleYear DESC ;

    SELECT VehicleYear, Make, Model
    FROM Vehicle
    WHERE VehicleYear >= 1998
    AND VehicleYear <= 2001
ORDER BY VehicleYear DESC ;

    SELECT VehicleYear, Make, Model
    FROM  Vehicle
    WHERE VehicleYear IN (2001, 2000, 1999, 1998)
ORDER BY VehicleYear DESC;

-- Remember that the BETWEEN operator works with an inclusive range
-- meaning that this will not only return the values between 1998 and 2001
-- but also the ones the values equal to 1998 and 2001.
    SELECT VehicleYear, Make, Model
    FROM Vehicle
    WHERE VehicleYear BETWEEN 1998 AND  2001
ORDER BY VehicleYear DESC ;

-- We can also inverse the result set with the operator NOT.
-- You can see that the range is still inclusive.
    SELECT VehicleYear, Make, Model
    FROM  Vehicle
    WHERE VehicleYear NOT BETWEEN 1998 AND 2001
ORDER BY VehicleYear DESC ;

-- Like, is used as a wildcard/patterns to match expressions.
-- When we want to search within the content of our columns.
-- For example, trying to find a Customer Lastname that follows a pattern.
-- Customer whose name starts with the letter S.
--This may or not be case-sensitive depending on the configuration of the database
-- % represents any sequences of characters after the S
    SELECT FirstName, LastName
        FROM Customer
    WHERE LastName LIKE 'S%';

-- We can even use the % character to search for a word within a larger text.
-- For example, we can search if an address related to a customer contains the
-- word 'Pine'.
-- Contains %WORD%
-- % any sequence of characters, followed by the WORD,
-- followed % by any other sequence of characters.
    SELECT FirstName, LastName, Address
        FROM Customer
    WHERE Address LIKE '%Pine%';

-- We can also Match against a single character with '_'
-- Find a first name 5 characters long that ends with e.
-- Here you can see that we are only looking for a last character to be 'e'.
    SELECT FirstName, LastName
    FROM Customer
    WHERE FirstName LIKE '____e';

-- But we can ask for or one of other multiple characters by using
-- brackets [] to list the desired characters [aeiou].
-- Here we are looking for a firstname that has a vowel as its second letter.
    SELECT FirstName, LastName
    FROM Customer
    WHERE FirstName LIKE '_[aeiou]%'

-- Be careful when using the NOT operator to reverse queries that use wildcards
-- What SQL does is to simply return all the other rows that do not apply to
-- that condition. However, the logic is not inverted, for that we have special characters.
    SELECT FirstName, LastName
    FROM Customer
    WHERE FirstName NOT LIKE '_[aeiou]%'

-- Use the ^ NOT character instead.
-- Here we are asking for the second character not to be in the range
-- of characters [aeiou].
   SELECT FirstName, LastName
    FROM Customer
    WHERE FirstName LIKE '_[^aeiou]%'