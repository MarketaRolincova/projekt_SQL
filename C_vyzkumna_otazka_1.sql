-- Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?
SELECT category_name 
	 , `year` 
	 , average_payroll_price 
FROM t_marketa_rolincova_project_SQL_primary_final
WHERE category_code = 'A'
ORDER BY average_payroll_price
	   , `year`;
	  
SELECT category_name 
	 , `year` 
	 , average_payroll_price 
FROM t_marketa_rolincova_project_SQL_primary_final
WHERE category_code = 'B'
ORDER BY average_payroll_price
	   , `year`;

SELECT category_name 
	 , `year` 
	 , average_payroll_price 
FROM t_marketa_rolincova_project_SQL_primary_final
WHERE category_code = 'C'
ORDER BY average_payroll_price
	   , `year`;

SELECT category_name 
	 , `year` 
	 , average_payroll_price 
FROM t_marketa_rolincova_project_SQL_primary_final
WHERE category_code = 'D'
ORDER BY average_payroll_price
	   , `year`;

SELECT category_name 
	 , `year` 
	 , average_payroll_price 
FROM t_marketa_rolincova_project_SQL_primary_final
WHERE category_code = 'E'
ORDER BY average_payroll_price
	   , `year`;
	  
SELECT category_name 
	 , `year` 
	 , average_payroll_price 
FROM t_marketa_rolincova_project_SQL_primary_final
WHERE category_code = 'F'
ORDER BY average_payroll_price
	   , `year`;
	  
SELECT category_name 
	 , `year` 
	 , average_payroll_price 
FROM t_marketa_rolincova_project_SQL_primary_final
WHERE category_code = 'G'
ORDER BY average_payroll_price
	   , `year`;
	 
SELECT category_name 
	 , `year` 
	 , average_payroll_price 
FROM t_marketa_rolincova_project_SQL_primary_final
WHERE category_code = 'H'
ORDER BY average_payroll_price
	   , `year`;
	 
SELECT category_name 
	 , `year` 
	 , average_payroll_price 
FROM t_marketa_rolincova_project_SQL_primary_final
WHERE category_code = 'I'
ORDER BY average_payroll_price
	   , `year`;

SELECT category_name 
	 , `year` 
	 , average_payroll_price 
FROM t_marketa_rolincova_project_SQL_primary_final
WHERE category_code = 'J'
ORDER BY average_payroll_price
	   , `year`;

SELECT category_name 
	 , `year` 
	 , average_payroll_price 
FROM t_marketa_rolincova_project_SQL_primary_final
WHERE category_code = 'K'
ORDER BY average_payroll_price
	   , `year`;

SELECT category_name 
	 , `year` 
	 , average_payroll_price 
FROM t_marketa_rolincova_project_SQL_primary_final
WHERE category_code = 'L'
ORDER BY average_payroll_price
	   , `year`;

SELECT category_name 
	 , `year` 
	 , average_payroll_price 
FROM t_marketa_rolincova_project_SQL_primary_final
WHERE category_code = 'M'
ORDER BY average_payroll_price
	   , `year`;

SELECT category_name 
	 , `year` 
	 , average_payroll_price 
FROM t_marketa_rolincova_project_SQL_primary_final
WHERE category_code = 'N'
ORDER BY average_payroll_price
	   , `year`;

SELECT category_name 
	 , `year` 
	 , average_payroll_price 
FROM t_marketa_rolincova_project_SQL_primary_final
WHERE category_code = 'O'
ORDER BY average_payroll_price
	   , `year`;
	  
SELECT category_name 
	 , `year` 
	 , average_payroll_price 
FROM t_marketa_rolincova_project_SQL_primary_final
WHERE category_code = 'P'
ORDER BY average_payroll_price
	   , `year`;
	   
SELECT category_name 
	 , `year` 
	 , average_payroll_price 
FROM t_marketa_rolincova_project_SQL_primary_final
WHERE category_code = 'Q'
ORDER BY average_payroll_price
	   , `year`;

SELECT category_name 
	 , `year` 
	 , average_payroll_price 
FROM t_marketa_rolincova_project_SQL_primary_final
WHERE category_code = 'R'
ORDER BY average_payroll_price
	   , `year`;
	  
SELECT category_name 
	 , `year` 
	 , average_payroll_price 
FROM t_marketa_rolincova_project_SQL_primary_final
WHERE category_code = 'S'
ORDER BY average_payroll_price
	   , `year`;

-- A, C, Q, S - kontinualni rust
-- B,D - mzda klesla v letech 2009, a od roku 2012 kolisa smerem dolu az do roku 2017 kdy opet roste
-- K - mzda od roku 2012 kolisa smerem dolu az do roku 2017 kdy opet roste
-- E,G, J, N - mzda klesla v roce 2013 pod hladinu roku 2012 (mezirocni pokles, potom opet roste)
-- F, L - mzda klesla mezirocne v roce 2013 pod hladinu roku 2011 
-- I - mzda klesa v letech 2009, 2011 (mezirocne)
-- M - mzda klesla v letech 2009, a od roku 2012 kolisa smerem dolu az do roku 2015 kdy opet roste   
-- O - mzda od roku 2009 kolisa smerem dolu az do roku 2014 kdy opet roste
-- P - mezirocni pokles v letech 2010
-- R - mezirocni pokles v letech 2011 a 2013 