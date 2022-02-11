insert into "customers"(first_name, last_name, email, phone)
values
('Derek', 'Hawkins', 'derekh@codingtemple.com', '2141117890'),
('Lucas', 'Lang', 'lucasl@codingtemple.com', '6141117891'),
('Joel', 'Carter', 'joelc@codingtemple.com', '2141117892'),
('Shakti', 'Shah', 'shaktis@codingtemple.com', '9131117893');

select * from customers

insert into "mechanics"(first_name, last_name)
values
('John', 'Doe'),
('James', 'Jordan'),
('Charles', 'Smith'),
('Eric', 'Peterson');

select * from mechanics

insert into "salesperson"(first_name, last_name)
values
('Richard', 'Tyson'),
('Michio', 'Rogan'),
('Tim', 'Dillon'),
('Bob', 'Darwin');

select * from salesperson

CREATE or REPLACE FUNCTION insert_data(_make varchar, _model varchar, _year int, _color varchar, _price int)
  RETURNS void AS
  $BODY$
      BEGIN
        INSERT INTO cars_for_sale(make, model, year, color, price)
        VALUES(_make, _model, _year, _color, _price);
      END;
  $BODY$
  LANGUAGE 'plpgsql' volatile;
 
-- select * from insert_data('Honda','Accord',2022,'Red', 25500)
-- select * from insert_data('Toyota','Camry',2019,'Black', 19500)
-- select * from insert_data('Subaru','Outback',2020,'Blue', 27500)
-- select * from insert_data('BMW','m3',2021,'Matte Black', 80500) 
 
 select * from cars_for_sale
 
 CREATE or REPLACE FUNCTION insert_data(_customer_id int, _mechanic_id int)
  RETURNS void AS
  $BODY$
      BEGIN
        INSERT INTO cars_for_service(customer_id, mechanic_id)
        VALUES(_customer_id, _mechanic_id);
      END;
  $BODY$
  LANGUAGE 'plpgsql' volatile;
  
--select * from insert_data(4,4)
--select * from insert_data(3,1)
--select * from insert_data(2,2)
--select * from insert_data (1,3)
 
select * from cars_for_service

CREATE or REPLACE FUNCTION insert_data(_customer_id int, _car_id int, _amount int, _salesperson_id int)
  RETURNS void AS
  $BODY$
      BEGIN
        INSERT INTO sale_invoice(customer_id, car_id, amount, salesperson_id)
        VALUES(_customer_id, _car_id, _amount, _salesperson_id);
      END;
  $BODY$
  LANGUAGE 'plpgsql' volatile;
  
-- select * from insert_data(4, 1, 22000, 3)
-- select * from insert_data(2, 3, 27500, 4)
-- select * from insert_data(1, 4, 80500, 2)
-- select * from insert_data(3, 2, 19500, 1)
 
select * from sale_invoice


CREATE or REPLACE FUNCTION insert_data(_car_id int, _mechanic_id int, _services varchar, _amount int)
  RETURNS void AS
  $BODY$
      BEGIN
        INSERT INTO service_invoice(car_id, mechanic_id, services, amount)
        VALUES(_car_id, _mechanic_id, _services, _amount);
      END;
  $BODY$
  LANGUAGE 'plpgsql' volatile;
 
--select * from insert_data(1, 4, 'alignment and break pads change', 250)
--select * from insert_data(2, 1, 'air filter and oil change', 150)
--select * from insert_data(3, 2, 'alignment and replaced tail lights (both)', 300)
--select * from insert_data(4, 3, 'dent removal and replaced catalytic converter', 550)

select * from service_invoice

CREATE or REPLACE FUNCTION insert_data(_service_ticket_id int)
  RETURNS void AS
  $BODY$
      BEGIN
        INSERT INTO service_history(service_ticket_id)
        VALUES(_service_ticket_id);
      END;
  $BODY$
  LANGUAGE 'plpgsql' volatile;

--select * from insert_data(2)
--select * from insert_data(3)
--select * from insert_data(4)
--select * from insert_data(5)

select * from service_history


--insert into customers_sale_invoice (customer_id, sale_invoice)
--values
--(3, 4),
--(1, 3),
--(4, 1),
--(2, 2);

select * from customers_sale_invoice
