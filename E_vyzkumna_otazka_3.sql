-- 3. Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?
-- odpoved: Jakostní víno bílé
SELECT category_name
	 , round(avg(average_price_growth), 2) AS overall_average_price_growth
FROM (
	SELECT t1.category_code 
			 , t1.category_name AS category_name 
			 , t2.year AS prev_year
			 , t2.average_payroll_price AS prev_year_average_price
			 , t1.`year` AS current_year 
			 , t1.average_payroll_price AS current_year_average_price
			 , round((t1.average_payroll_price - t2.average_payroll_price) / t2.average_payroll_price * 100, 2) AS average_price_growth
	FROM t_marketa_rolincova_project_SQL_primary_final t1 
	JOIN t_marketa_rolincova_project_SQL_primary_final t2 
		ON t1.category_code = t2.category_code
		AND t1.`year` = t2.`year` + 1
		AND t1.category_type = 'FOOD'
	HAVING average_price_growth > 0
	ORDER BY average_price_growth) AS sub
GROUP BY category_name
ORDER BY overall_average_price_growth
LIMIT 5;

-- 24 kategorii potravin mezirocne zlevnilo 
SELECT category_name
	 , round(avg(average_price_growth), 2) AS overall_average_price_growth
FROM (
	SELECT t1.category_code 
			 , t1.category_name AS category_name 
			 , t2.year AS prev_year
			 , t2.average_payroll_price AS prev_year_average_price
			 , t1.`year` AS current_year 
			 , t1.average_payroll_price AS current_year_average_price
			 , round((t1.average_payroll_price - t2.average_payroll_price) / t2.average_payroll_price * 100, 2) AS average_price_growth
	FROM t_marketa_rolincova_project_SQL_primary_final t1 
	JOIN t_marketa_rolincova_project_SQL_primary_final t2 
		ON t1.category_code = t2.category_code
		AND t1.`year` = t2.`year` + 1
		AND t1.category_type = 'FOOD'
	HAVING average_price_growth < 0
	ORDER BY average_price_growth) AS sub
GROUP BY category_name
ORDER BY overall_average_price_growth;