# Projekt z SQL – Data o mzdách a cenách potravin a jejich zpracování pomocí SQL

# Zadání projektu
Na vašem analytickém oddělení nezávislé společnosti, která se zabývá životní úrovní občanů, jste se dohodli, že se pokusíte odpovědět na pár definovaných výzkumných otázek, které adresují dostupnost základních potravin široké veřejnosti. Kolegové již vydefinovali základní otázky, na které se pokusí odpovědět a poskytnout tuto informaci tiskovému oddělení. Toto oddělení bude výsledky prezentovat na následující konferenci zaměřené na tuto oblast.
Potřebují k tomu od vás připravit robustní datové podklady, ve kterých bude možné vidět porovnání dostupnosti potravin na základě průměrných příjmů za určité časové období.
Jako dodatečný materiál připravte i tabulku s HDP, GINI koeficientem a populací dalších evropských států ve stejném období, jako primární přehled pro ČR.

# Výzkumné otázky
1.	Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?
2.	Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?
3.	Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?
4.	Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?
5.	Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo   následujícím roce výraznějším růstem?

# Postup
Jako první jsem vytvořila spojenou tabulku z 5 ti tabulek s primárními daty (2x faktická tabulka, 3x číselník), vybrala jsem ty, které jsem potřebovala ke zodpovězení otázek. Mým cílem bylo vytvořit jednu tabulku s agregovanými daty za určité časové období. Data jsem agregovala prvně dle určených kategorií – 1) průmyslové odvětví v případě mezd (19 odvětví) a 2) kategorie potravin v případě cen potravin (27 kategorií) a poté dle společného časového období – let 2006–2018. Výsledná tabulka obsahuje průměrnou cenu/mzdu pro každou kategorii a rok. 
Dále jsem vytvořila doprovodnou tabulku s daty o evropských zemích ze dvou primárních tabulek, které obsahují informace o zemích světa a jejich ekonomikách. 
Poté jsem vytvořila SQL dotazy nad tabulkami, tak abych odpověděla na výzkumné otázky. SQL soubory jsou pojmenovány „výzkumná otázka“ doplněné o číslo otázky na kterou odpovídám.

# Odpovědi na výzkumné otázky

# 1.	Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?
Kontinuální růst mezd zaznamenávají pouze 4 odvětví z celkových 19 ti. Odvětvími s kontinuálním růstem jsou:
-	Zemědělství, lesnictví, rybářství
-	Zpracovatelský průmysl
-	Zdravotní a sociální péče 
-	Ostatní činnosti

Významné jsou v datech zejména dvě období, a to léta 2009/2010 a 2012.

V letech 2009/2010 zaznamenala některá odvětví meziroční pokles, a to tato odvětví:
-	Těžba a dobývání
-	Výroba a rozvod elektřiny, plynu, tepla a klimatiz. vzduchu
-	Ubytování, stravování a pohostinství
-	Profesní, vědecké a technické činnosti
-	Vzdělávání
-	Kulturní, zábavní a rekreační činnosti

Zajímavé je, že jediné odvětví (Veřejná správa a obrana; povinné sociální zabezpečení) mělo v roce 2009 výraznější nárůst, kdy poté mzda klesá a k opětovnému nárustu nad hranici roku 2009 dochází až v roce 2014. 

Rok 2012 byl co se týče růstu mezd významný. Od tohoto roku většina odvětví zaznamenává pokles, který je v některých případech zvrácen 2014, 2015 a někdy až 2017. 

# 2.	Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?
V roce 2006 bylo možné zakoupit z průměrné mzdy 20 754 Kč:
-	1 437 litrů mléka
-	1 287 kilogramů chleba
  
V roce 2018 bylo možné zakoupit z průměrné mzdy 32 536 Kč:
-	1 642 litrů mléka
-	1 342 kilogramů chleba

Založeno na těchto číslech z dat vyplývá, že průměrná mzda roste rychlejším tempem než ceny potravin, a společnost bohatne.

# 3.	Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?
Kategorií, která zdražuje nejpomaleji je Jakostní víno bílé. Následované Pivem výčepním, světlým, lahvovým a Přírodní minerální vodou uhličitou. Všechny tyto jsou však technicky nápoje. Tudíž první skutečnou potravinou, která zdražuje nejpomaleji je Šunkový salám, následovaný Hovězím masem zadním bez kosti.

Nutno podotknout, že je 24 kategorií potravin (z celkových 27 kategorií), které dokonce zlevňují, nikoli zdražují. 

# 4.	Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?
Neexistuje, nejvyšší rozdíl v meziročním nárůstu cen potravin oproti růstu mezd je 6.79 % a to mezi lety 2012 a 2013.

# 5.	Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo následujícím roce výraznějším růstem?
Výška HDP nemá žádný významný vliv na ceny potravin nebo výšku mezd v daném roce nebo roce následujícím, tzn. že pokud HDP vzroste výrazněji v jednom roce, tak se to stejným směrem neprojeví na cenách potravin nebo na výšce mezd. 

Jako příklad uvedu léta 2011-2013, toto období jsme označili již ve výzkumné otázce 1 jako jeden z ekonomických vrcholů pro mnohá odvětví průmyslu a výzkumná otázka 4 zase napovídá, že šlo o nejvyšší růst cen oproti mzdám za sledované období (6.79 %). HDP v té době však nerostlo výrazně, naopak v některých letech dokonce kleslo. 
-	meziroční růst HDP 2010/2011: 1.79 %
-	meziroční pokles HDP 2011/2012: -0.79 %  
-	meziroční pokles HDP 2012/2013: -0.05 %




