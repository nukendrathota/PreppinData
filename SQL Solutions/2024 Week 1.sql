SELECT *
FROM pdweek1
;
-- Flow Card = Yes!
SELECT
	(string_to_array("Flight Details", '//'))[1]::date AS "Date",
	(string_to_array("Flight Details", '//'))[2]::varchar AS "Flight Number",
	(string_to_array((string_to_array("Flight Details", '//'))[3], '-'))[1] AS "From",
	(string_to_array((string_to_array("Flight Details", '//'))[3], '-'))[2] AS "To",
	(string_to_array("Flight Details", '//'))[4]::text AS "Class",
	ROUND((string_to_array("Flight Details", '//'))[5]::numeric,2) AS "Price",
	CASE WHEN "Flow Card?" = '1' THEN 'Yes' ELSE 'No' END AS "Flow Card?",
	"Bags Checked",
	"Meal Type"
	
FROM pdweek1
WHERE "Flow Card?" = '1'
;

-- Flow Card = No
SELECT
	(string_to_array("Flight Details", '//'))[1]::date AS "Date",
	(string_to_array("Flight Details", '//'))[2]::varchar AS "Flight Number",
	(string_to_array((string_to_array("Flight Details", '//'))[3], '-'))[1] AS "From",
	(string_to_array((string_to_array("Flight Details", '//'))[3], '-'))[2] AS "To",
	(string_to_array("Flight Details", '//'))[4]::text AS "Class",
	ROUND((string_to_array("Flight Details", '//'))[5]::numeric,2) AS "Price",
	CASE WHEN "Flow Card?" = '1' THEN 'Yes' ELSE 'No' END AS "Flow Card?",
	"Bags Checked",
	"Meal Type"
	
FROM pdweek1
WHERE "Flow Card?" = '0'
;