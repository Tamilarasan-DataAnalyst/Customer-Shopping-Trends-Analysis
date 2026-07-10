use project_shopping_trends;
select * from shopping_table
limit 10;
select count(*) from shopping_table;
describe shopping_table;
SHOW FULL TABLES
WHERE Table_type = 'VIEW';
describe shopping_table;
select * from std;
select count(*) from std;

### Which category needs discount

select Customer_ID,Item_Purchased,Category,Discount_Applied,Promo_Code_Used ,
avg(Purchase_Amount_USD) as Average_sales
from shopping_table
group by Category ,Customer_ID
order by Average_sales ;

### Age vs Spending

select Customer_ID,Item_Purchased,Category,
avg(Purchase_Amount_USD) as Average_sales
from shopping_table
group by Age ,Customer_ID
order by Average_sales ;

### Season vs Spending

select Customer_ID,Item_Purchased,Category,Season,
avg(Purchase_Amount_USD) as Average_sales
from shopping_table
group by Season ,Customer_ID
order by Average_sales ;

## Location vs Spending

select Customer_ID,Item_Purchased,Category,Location,Season,
avg(Purchase_Amount_USD) as Average_sales
from shopping_table
group by Location ,Customer_ID
order by Average_sales;

  ###  1. Age Group Wise Spending Category

select
case 
when age between 18 and 25 then "YOUNG"
when age between 25 and 35 then "ADULT"
when age between 35 and 60 then "MIDDLE AGE"
else "SENIOR"
end as Age_group,
Category,
sum(Purchase_Amount_USD) as Total_spending
from shopping_table
group by Age,Customer_ID
order by Age_group,Total_spending Desc;

### Season Wise Spending Category

select distinct(Season) from shopping_table;

select Category,Season,sum(Purchase_Amount_USD) as Total_spending
from shopping_table
group by Season,Category
order by Total_spending Desc;

### Payment_Method,Discount_Applied

select Payment_Method,Discount_Applied,sum(Purchase_Amount_USD) as Total_spend
from shopping_table
group by Payment_Method,Discount_Applied
order by Total_spend desc;