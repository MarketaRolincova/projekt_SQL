-- 4. Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?
-- odpoved: neexistuje, 
-- nejvyssi rozdil v mezirocnim narustu cen potravin oproti rustu mezd je 6.79 % a to mezi lety 2012 a 2013
SELECT w.prev_year
	 , w.current_year
	 , round(avg(f.average_price_growth), 2) AS overall_average_price_growth
	 , round(avg(w.avg_wage_growth), 2) AS overall_avg_wage_growth
	 , round((avg(f.average_price_growth) - avg(w.avg_wage_growth)), 2) AS growth_difference
FROM (
	SELECT t1.category_code
		 , t1.category_name
		 , t2.`year` AS prev_year
		 , t2.average_payroll_price AS average_wage_prev_year
		 , t1.`year` AS current_year
		 , t1.average_payroll_price AS average_wage_current_year
		 , round((t1.average_payroll_price - t2.average_payroll_price) / t2.average_payroll_price * 100, 2) AS avg_wage_growth
	FROM t_marketa_rolincova_project_SQL_primary_final t1
	JOIN t_marketa_rolincova_project_SQL_primary_final t2
		ON t1.category_code = t2.category_code 
		AND t1.`year` = t2.`year` + 1
		AND t1.category_type = 'INDUSTRY_BRANCH') AS w
	JOIN 
	(SELECT t1.category_code 
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
		AND t1.category_type = 'FOOD') AS f
			ON w.prev_year = f.prev_year
GROUP BY w.prev_year
ORDER BY growth_difference DESC;