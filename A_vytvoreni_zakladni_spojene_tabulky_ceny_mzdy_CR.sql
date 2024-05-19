CREATE OR REPLACE TABLE t_marketa_rolincova_project_SQL_primary_final AS 
	SELECT cp.industry_branch_code AS category_code  
		 , cpib.name AS category_name 
	     , cp.payroll_year AS year 
		 , round(avg(cp.value)) AS average_payroll_price
	FROM czechia_payroll cp 
	LEFT JOIN czechia_payroll_industry_branch cpib 
		ON cp.industry_branch_code = cpib.code 
	WHERE value_type_code = 5958
		AND industry_branch_code IS NOT NULL
		AND payroll_year IN (
							 SELECT DISTINCT payroll_year 
							 FROM czechia_payroll cp  
						     INTERSECT
						     SELECT DISTINCT year(date_from) 
						     FROM czechia_price cp)
	GROUP BY industry_branch_code
	       , payroll_year
	UNION ALL 
	SELECT cp.category_code AS category_code
		 , cpc.name AS category_name
		 , year(cp.date_from) AS year
		 , round(avg(cp.value), 2) AS average_payroll_price
	FROM czechia_price cp
	LEFT JOIN czechia_price_category cpc 
		ON cp.category_code = cpc.code 
	GROUP BY category_code
		   , year;

ALTER TABLE t_marketa_rolincova_project_SQL_primary_final 
	ADD COLUMN category_type VARCHAR(255);


UPDATE t_marketa_rolincova_project_SQL_primary_final
SET category_type = 'INDUSTRY_BRANCH'
WHERE category_code IN (SELECT code 
						FROM czechia_payroll_industry_branch cpib);

UPDATE t_marketa_rolincova_project_SQL_primary_final
SET category_type = 'FOOD'
WHERE category_code IN (SELECT code 
						FROM czechia_price_category);