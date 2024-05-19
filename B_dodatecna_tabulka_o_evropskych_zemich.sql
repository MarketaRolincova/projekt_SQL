CREATE TABLE t_marketa_rolincova_project_SQL_secondary_final AS 
	SELECT c.country 
		 , c.population 
		 , e.GDP 
		 , e.gini 
		 , e.`year` 
	FROM countries c 
	LEFT JOIN economies e 
		ON c.country = e.country 
	WHERE c.continent = 'Europe'
		AND e.`year` BETWEEN 2006 AND 2018;