CREATE TABLE "customers" (
  "id" SERIAL PRIMARY KEY,
  "first_name" varchar(50),
  "last_name" varchar(50),
  "email" varchar(100),
  "phone" varchar(20)
);

CREATE TABLE "salesperson" (
  "id" SERIAL PRIMARY KEY,
  "first_name" varchar(50),
  "last_name" varchar(50)
);

CREATE TABLE "mechanics" (
  "id" SERIAL PRIMARY KEY,
  "first_name" varchar(50),
  "last_name" varchar(50)
);

CREATE TABLE "cars_for_sale" (
  "id" SERIAL PRIMARY KEY,
  "make" varchar(50),
  "model" varchar(100),
  "year" int,
  "color" varchar(50),
  "price" int
);

CREATE TABLE "customers_sale_invoice" (
  "id" SERIAL PRIMARY KEY,
  "customer_id" int,
  "sale_invoice" int
);

CREATE TABLE "sale_invoice" (
  "sale_invoice_id" SERIAL PRIMARY KEY,
  "customer_id" int,
  "car_id" int,
  "amount" float,
  "salesperson_id" int
);

CREATE TABLE "cars_for_service" (
  "service_car_id" SERIAL PRIMARY KEY,
  "customer_id" int,
  "mechanic_id" int
);

CREATE TABLE "service_invoice" (
  "service_ticket_id" SERIAL PRIMARY KEY,
  "car_id" int,
  "mechanic_id" int,
  "services" varchar(255),
  "amount" float
);

CREATE TABLE "service_history" (
  "service_history_id" SERIAL PRIMARY KEY,
  "service_ticket_id" int
);

ALTER TABLE "sale_invoice" ADD FOREIGN KEY ("customer_id") REFERENCES "customers" ("id");

ALTER TABLE "cars_for_service" ADD FOREIGN KEY ("customer_id") REFERENCES "customers" ("id");

ALTER TABLE "service_invoice" ADD FOREIGN KEY ("car_id") REFERENCES "cars_for_service" ("service_car_id");

ALTER TABLE "cars_for_service" ADD FOREIGN KEY ("mechanic_id") REFERENCES "mechanics" ("id");

ALTER TABLE "service_invoice" ADD FOREIGN KEY ("mechanic_id") REFERENCES "mechanics" ("id");

ALTER TABLE "service_history" ADD FOREIGN KEY ("service_ticket_id") REFERENCES "service_invoice" ("service_ticket_id");

ALTER TABLE "sale_invoice" ADD FOREIGN KEY ("salesperson_id") REFERENCES "salesperson" ("id");

ALTER TABLE "customers_sale_invoice" ADD FOREIGN KEY ("sale_invoice") REFERENCES "sale_invoice" ("sale_invoice_id");

ALTER TABLE "customers_sale_invoice" ADD FOREIGN KEY ("customer_id") REFERENCES "customers" ("id");

ALTER TABLE "sale_invoice" ADD FOREIGN KEY ("car_id") REFERENCES "cars_for_sale" ("id");
