Use SlickShop;

-- Order by Column Position in the Select Statement
    SELECT Description, PartID
        FROM Part
ORDER BY 2;

--Order by Column Name in the Table;
    SELECT Description, PartID
        FROM Part
ORDER BY PartID;

--Both give the same result, but you can see how the
--ORDER BY Clause needs a reference in the result set or the FROM Tables to order the rows.

    SELECT  Description
        FROM Part
ORDER BY  Cost;

-- For example let's use the * expression to get all the columns from a table
-- and the column position to order it by.

--Keep in mind that the Natural order of the table is
--PartId, Description and Cost

--Will order them by PartId
    SELECT *
        FROM Part
ORDER BY 1;

--Will order them by Description
    SELECT *
        FROM Part
ORDER BY 2;

--Will order them by Cost
    SELECT *
        FROM Part
ORDER BY 3;


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

--Let's say we want to get a report of the parts ordered by cost in descending order
--We would write a Select statement like this one.

    SELECT Description, Cost
        FROM Part
ORDER BY Cost DESC;
--Should give the samer result.
    SELECT Description, Cost
        FROM  Part
ORDER BY Cost DESC, PartID ASC;

--The previous query will return the values ordered by Cost, but it will show
-- the Parts with the same price order by insertion in the table, if we want to
-- order our result set further we need to order within the first sort we do this
-- by adding a secondary sort to our primary sort, like this.
    SELECT Description, Cost
        FROM  Part
ORDER BY Cost DESC, Description ASC;