-- Má výška HDP vliv na změny ve mzdách a cenách potravin? 
-- Neboli, pokud HDP vzroste výrazněji v jednom roce, 
-- projeví se to na cenách potravin či mzdách ve stejném nebo násdujícím roce výraznějším růstem?

-- odpoved: Nevypada to, rust HDP nema vyrazny vliv na rust cen nebo mezd nebo obojiho dohromady 

SELECT w.prev_year
	 , w.current_year
	 , round(avg(f.average_price_growth), 2) AS overall_avg_price_growth
	 , round(avg(w.avg_wage_growth), 2) AS overall_avg_wage_growth
	 , s.GDP_growth
	 , round((((avg(f.average_price_growth) + avg(w.avg_wage_growth))/2) - GDP_growth), 2) AS wage_price_GDP_growth_difference
	 , round((avg(f.average_price_growth) - avg(w.avg_wage_growth)), 2) AS wage_price_growth_difference
	 , round((avg(f.average_price_growth) - avg(s.GDP_growth)), 2) AS price_GDP_growth_difference
	 , round((avg(w.avg_wage_growth) - avg(s.GDP_growth)), 2) AS wage_GDP_growth_difference
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
	JOIN 
	(SELECT s2.`year` AS prev_year
	 	  , s1.`year` AS current_year
	 	  , round((s1.GDP - s2.GDP) / s2.GDP * 100, 2) AS GDP_growth  
	FROM t_marketa_rolincova_project_SQL_secondary_final s1
	JOIN t_marketa_rolincova_project_SQL_secondary_final s2
		ON s1.country = s2.country 
		AND s1.`year` = s2.`year` + 1
		AND s1.country = 'Czech Republic') AS s
			ON w.prev_year = s.prev_year
GROUP BY w.prev_year
ORDER BY wage_price_GDP_growth_difference;
