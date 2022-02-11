select first_name, last_name, amount from sale_invoice si 
join salesperson s on s.id = si.salesperson_id
where s.id = 4

select first_name, last_name from service_history sh 
join service_invoice si on si.service_ticket_id = sh.service_ticket_id
join mechanics m on m.id = si.mechanic_id
group by first_name, last_name

select m.first_name, m.last_name, m.id from customers c 
join cars_for_service cfs on cfs.customer_id = c.id 
join mechanics m on m.id = cfs.mechanic_id
order by m.id

select cfs.make, cfs.model, cfs.price from cars_for_sale cfs 
join customers c on c.id = cfs.id
where cfs.color = 'Red'