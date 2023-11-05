CREATE TABLE "users" (
  "id" bigserial PRIMARY KEY,
  "wallet_address" varchar(255),
  "name" varchar(255),
  "avatar_url" varchar(1000),
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp
);

CREATE TABLE "event" (
  "id" bigserial PRIMARY KEY,
  "author_id" bigint,
  "name" varchar(1000),
  "date" timestamp,
  "location" varchar(1000),
  "description" varchar(1000),
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp
);

CREATE TABLE "ticket" (
  "id" bigserial PRIMARY KEY,
  "event_id" bigint,
  "name" varchar,
  "amount" int,
  "price" int,
  "status" int,
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp
);

CREATE TABLE "orders" (
  "id" bigserial PRIMARY KEY,
  "customer_id" bigint,
  "total" int
);

CREATE TABLE "order_detail" (
  "id" bigserial PRIMARY KEY,
  "order_id" bigint,
  "ticket_id" bigint,
  "price" int,
  "qty" int,
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp
);

ALTER TABLE "orders" ADD FOREIGN KEY ("customer_id") REFERENCES "users" ("id");

ALTER TABLE "event" ADD FOREIGN KEY ("author_id") REFERENCES "users" ("id");

ALTER TABLE "ticket" ADD FOREIGN KEY ("event_id") REFERENCES "event" ("id");

ALTER TABLE "order_detail" ADD FOREIGN KEY ("order_id") REFERENCES "orders" ("id");

ALTER TABLE "order_detail" ADD FOREIGN KEY ("ticket_id") REFERENCES "ticket" ("id");
