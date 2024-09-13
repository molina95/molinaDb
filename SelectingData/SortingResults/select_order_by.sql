Use SlickShop;

-- Order by Column Position in the Select Statement
    SELECT Description, PartID
        FROM Part
ORDER BY 2;

--Order by Column Name in the Table;
    SELECT Description, PartID
        FROM Part
ORDER BY PartID;

--Both give the same result but you can see how the
--ORDER BY Clause needs a reference in the result set or the FROM Tables to order the rows.

    SELECT  Description
        FROM Part
ORDER BY  Cost;

--Here you can  see the use of the ASC and the DES keyword
--By default SQL Orders in ascending order unless you give it
--The DES keyword for descending order.

    SELECT PartID, Description, Cost
        FROM Part
ORDER BY  Cost ASC;

    SELECT PartID, Description, Cost
        FROM Part
ORDER BY  Cost DESC ;

--This result set should be the same as the one in Ascending order.
    SELECT PartID, Description, Cost
        FROM Part
ORDER BY  Cost;