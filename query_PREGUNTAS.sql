use proyectodb;
#PRIMERAS 5 PREGUNTAS
select productName from products;
select categoryName from categories;
select supplierID, companyName, city from suppliers;
select unitPrice, quantityPerUnit, unitsInStock from products order by unitsInStock desc;
select productName, quantityPerUnit, CompanyName, city, phone
from products as pr
join suppliers as sup
on sup.supplierID = pr.supplierID;
#####################################################################################
select companyName  from customers where companyName like "%a%";
select shipCountry from orders where shipCountry like "%a";
select sum(unitPrice), avg (unitPrice) from order_details;
select max(discount), min(unitPrice), count(quantity) from order_details;
select companyName, city, shippedDate, requiredDate, shipCountry
from customers as cus
join orders as ords
on cus.customerID = ords.customerID
group by shipCountry;
######################################################################################
select lastName, firstName, title from employees group by title;
select  lastName, FirstName, territoryID
from employees as em
LEFT JOIN employee_territories as emt
on em.employeeID = emt.employeeID;
select lastName, firstName, orderID, shippedDate, requiredDate, shipCountry
from employees as em
JOIN orders as ord
on em.employeeID = ord.employeeID;
select * from ANTIGUEDAD_EMPLEADO_Y_A_QUIEN_VENDE;
select lastName, firstName, territoryDescription, regionDescription
from employees as empl
Join territories as terri
on empl.employeeID = terri.regionID
join regions as rg
on rg.regionID = terri.regionID;



########################################################################
create view ANTIGUEDAD_EMPLEADO_Y_A_QUIEN_VENDE as 
(select e.lastName,e.firstName,e.title, e.hireDate, e.country, o.customerID
from employees e
join orders o 
on e.employeeID = o.employeeID
join employee_territories emt
on o.employeeID = emt.employeeID
group by e.title);

select * from ANTIGUEDAD_EMPLEADO_Y_A_QUIEN_VENDE;
select * from ANTIGUEDAD_EMPLEADO_Y_A_QUIEN_VENDE order by lastName desc;
########################################################################################


