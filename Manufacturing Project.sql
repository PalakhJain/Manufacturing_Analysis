#Total Rejected Qty#
Create View 1_TRQ AS
SELECT SUM(`Rejected Qty`) as Total_Rejected_Qty FROM main;

#Total Rejected Qty#
Create View 2_TMQ AS
SELECT SUM(`Manufactured Qty`) as Total_Manufactured_Qty FROM main;

#Wastage_%#
Create view 3_Wastage_Percentage as
select concat(sum(`Rejected Qty`)/sum(`Processed Qty`),"%") as Wastage_percentage from main;

#WO Qty by Work Centre#
Create View 4_WO_Qty_by_Work_Centre as
select	`Work Centre Name`, sum(`WO qty`) as 'WO_Qty' from main
group by `Work Centre Name`
order by `Work Centre Name`;

#Production Trend#
create view 5_Production_Trend as
select year(`so docdate`) as 'Year', month(`so docdate`) as 'Month', sum(`manufactured qty`) as Total_Manufacture_Qty from main
group by year(`so docdate`), month(`so docdate`)
order by year(`so docdate`) , month(`so docdate`);

#Department wise Produced Qty#
create view 6_Department_wise_Produced_Qty as
select `department name`, concat(round(count(`produced qty`)/(select count(`produced qty`) from main)*100,2),"%") as `%` from main
group by `Department Name`;

#Total Machine Cost#
create view 7_Total_Machine_Cost as
select `machine code` ,sum(`Per day Machine Cost made`) as Machine_cost from main
group by `machine code`;

#10th  buyer with  total qty#
create view 8_10th_buyer_with_totalqty as
select buyer, sum(totalqty) as Totalqty from main
group by buyer
order by sum(totalqty) desc
limit 9,1;
