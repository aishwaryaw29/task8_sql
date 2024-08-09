-- having subquery

select customer_name from customer where customer_id in (select customer_id from sales group by customer_id having sum(sales) > 1000)


	
--find if we can do insert, update, alter , delete on view 

create view customer_sales as 
select c.customer_id , c.customer_name , s.order_id , s.sales from sales as s
inner join customer as c 
on s.customer_id = c.customer_id
where sales > 5000

select * from customer_sales

--1)insert

insert into customer_sales values ('BH-11711','Chris Evans','US-2015-118984','6000.33' )         --error

--2)update
	
update customer_sales set customer_name = 'Taylor Swift' where customer_id = 'BM-11140'          --error

--3)delete

delete from customer_sales where customer_id = 'BM-11140'                                    --error

--4)alter

alter table customer_sales add column sum_sales double precision                            --error


