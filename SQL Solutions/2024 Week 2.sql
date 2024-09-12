WITH inputdata AS
(
    SELECT *
    FROM pdweek2flowyes
    UNION
    SELECT *
    FROM pdweek2flowno
)
SELECT 
    'Minimum Price' AS _price,
    EXTRACT(QUARTER FROM TO_DATE("Date", 'dd/mm/yyyy')) AS quarter,
    "Flow Card?",
    COALESCE(MIN(CASE WHEN "Class" = 'Economy' THEN "Price" END), 0) AS first_class,
    COALESCE(MIN(CASE WHEN "Class" = 'Business Class' THEN "Price" END), 0) AS premium_economy,
    COALESCE(MIN(CASE WHEN "Class" = 'Premium Economy' THEN "Price" END), 0) AS business_class,
    COALESCE(MIN(CASE WHEN "Class" = 'First Class' THEN "Price" END), 0) AS economy
FROM inputdata
GROUP BY quarter, "Flow Card?"
-- ORDER BY quarter, "Flow Card?"
UNION
SELECT 
    'Maximum Price' AS _price,
    EXTRACT(QUARTER FROM TO_DATE("Date", 'dd/mm/yyyy')) AS quarter,
    "Flow Card?",
    COALESCE(MAX(CASE WHEN "Class" = 'Economy' THEN "Price" END), 0) AS first_class,
    COALESCE(MAX(CASE WHEN "Class" = 'Business Class' THEN "Price" END), 0) AS premium_economy,
    COALESCE(MAX(CASE WHEN "Class" = 'Premium Economy' THEN "Price" END), 0) AS business_class,
    COALESCE(MAX(CASE WHEN "Class" = 'First Class' THEN "Price" END), 0) AS economy
FROM inputdata
GROUP BY quarter, "Flow Card?"
ORDER BY quarter, "Flow Card?"
;