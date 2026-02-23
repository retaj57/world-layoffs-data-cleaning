select *
from layoffs;

create table layoff_test
like layoffs;

select *
from layoff_test;

insert layoff_test
select * 
from layoffs;

-- 1. Remove Duplicates
select *,
row_number() over(partition by company, industry, total_laid_off, percentage_laid_off, `date`) as row_num
from layoff_test;

with duplicate_cte as
(
select *,
row_number() over(partition by company, location, industry, total_laid_off, 
percentage_laid_off, `date`, stage, country, funds_raised_millions) as row_num
from layoff_test
)
select *
from duplicate_cte
where row_num > 1;

select *
from layoff_test
where company= 'Casper';

CREATE TABLE `layoff_test2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select *
from layoff_test2;

insert into layoff_test2
select *,
row_number() over(partition by company, location, industry, total_laid_off, 
percentage_laid_off, `date`, stage, country, funds_raised_millions) as row_num
from layoff_test;

select *
from layoff_test2
where row_num > 1;

delete
from layoff_test2
where row_num > 1;

select *
from layoff_test2;

-- 2. Standrizing Data
select company, trim(company)
from layoff_test2;

update layoff_test2
set company = trim(company);

select *
from layoff_test2
where industry like 'Crypto%';

update layoff_test2
set industry = 'Crypto'
where industry like 'Crypto%';

select distinct industry
from layoff_test2;

select distinct location
from layoff_test2
order by 1;

select distinct country
from layoff_test2
order by 1;

select distinct country, trim(trailing '.' from country)
from layoff_test2
order by 1;

update layoff_test2
set country = trim(trailing '.' from country)
where country like 'United States%';

select * 
from layoff_test2;

select `date`,
str_to_date(`date`, '%m/%d/%Y')
from layoff_test2;

update layoff_test2
set `date` = str_to_date(`date`, '%m/%d/%Y');

select `date`
from layoff_test2;

alter table layoff_test2
modify column `date` date;

select *
from layoff_test2;

-- 3. Remove Null or Blank Values
select *
from layoff_test2
where total_laid_off is null
and percentage_laid_off is null;

update layoff_test2
set industry = null
where industry = '';

select *
from layoff_test2
where industry is null
or industry = '';

select *
from layoff_test2 t1
join layoff_test2 t2
on t1.company = t2.company
where (t1.industry is null or t1.industry = '')
and t2.industry is not null;

select t1.industry, t2.industry
from layoff_test2 t1
join layoff_test2 t2
on t1.company = t2.company
where (t1.industry is null or t1.industry = '')
and t2.industry is not null;

update layoff_test2 t1
join layoff_test2 t2
on t1.company = t2.company
set t1.industry = t2.industry
where t1.industry is null 
and t2.industry is not null;

select * 
from layoff_test2
where company = 'Airbnb';

select *
from layoff_test2;

select *
from layoff_test2
where total_laid_off is null
and percentage_laid_off is null;

alter table layoff_test2
drop column row_num;
