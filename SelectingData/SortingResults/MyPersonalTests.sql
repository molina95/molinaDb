Use SlickShop

--You can do combinations of Columns when using the DISTINCT clause.
--Here we can get all the unique combinations of StateOrProvince and PostalCode.
SELECT DISTINCT StateOrProvince, PostalCode
    FROM Customer;

--You can take Distinct result sets and order them.
--But you need a reference in the result set of the row you want to order them by.
    SELECT DISTINCT Cost
        FROM Part
ORDER BY Cost DESC;

/* This Won't work when using the DISTINCT clause
      SELECT  DISTINCT Description
        FROM Part
ORDER BY  Cost ASC;
*/