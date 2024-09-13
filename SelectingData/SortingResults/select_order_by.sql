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
--ORDER BY Clause needs a reference in the result set or the Table to order the rows.

