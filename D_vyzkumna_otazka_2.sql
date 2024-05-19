-- 2. Kolik je možné si koupit 
-- litrů mléka (code 114201, price 2006 14.44, price 2018 19.82)  
-- kilogramů chleba (code 111301, price 2006 16.12, price 2018 24.24) 
-- za první (2006) a poslední (2018) srovnatelné období v dostupných datech cen a mezd?

SELECT round(avg(average_payroll_price)) AS average_wage_2006
	 , round(avg(average_payroll_price)/14.44) AS liters_of_milk_per_avg_wage_2006
	 , round(avg(average_payroll_price)/16.12) AS kg_of_bread_per_avg_wage_2006
FROM t_marketa_rolincova_project_SQL_primary_final
WHERE category_type = 'INDUSTRY_BRANCH'
	AND `year` = 2006; 

SELECT round(avg(average_payroll_price)) AS average_wage_2018
	 , round(avg(average_payroll_price)/19.82) AS liters_of_milk_per_avg_wage_2018
	 , round(avg(average_payroll_price)/24.24) AS kg_of_bread_per_avg_wage_2018
FROM t_marketa_rolincova_project_SQL_primary_final
WHERE category_type = 'INDUSTRY_BRANCH'
	AND `year` = 2018;
	
-- po kategoriich industry

SELECT category_name 
	 , `year` 
	 , average_payroll_price
	 , round(average_payroll_price / 14.44) AS liters_of_milk_per_wage
	 , round (average_payroll_price / 16.12) AS kg_of_bread_per_wage
FROM t_marketa_rolincova_project_SQL_primary_final
WHERE category_type = 'INDUSTRY_BRANCH'
	AND `year` = 2006;

SELECT category_name 
	 , `year` 
	 , average_payroll_price
	 , round(average_payroll_price / 19.82) AS liters_of_milk_per_wage
	 , round (average_payroll_price / 24.24) AS kg_of_bread_per_wage
FROM t_marketa_rolincova_project_SQL_primary_final
WHERE category_type = 'INDUSTRY_BRANCH'
	AND `year` = 2018;