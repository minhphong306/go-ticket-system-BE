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

-- FILEPATH: /Users/apple/go/src/simple-bank-2/db/migration/000001_init_schema.up.sql
-- BEGIN: ed8c6549bwf9
CREATE OR REPLACE FUNCTION update_users_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_users_updated_at
AFTER UPDATE ON users
FOR EACH ROW
EXECUTE FUNCTION update_users_updated_at();

CREATE OR REPLACE FUNCTION update_event_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_event_updated_at
AFTER UPDATE ON event
FOR EACH ROW
EXECUTE FUNCTION update_event_updated_at();

CREATE OR REPLACE FUNCTION update_ticket_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_ticket_updated_at
AFTER UPDATE ON ticket
FOR EACH ROW
EXECUTE FUNCTION update_ticket_updated_at();

CREATE OR REPLACE FUNCTION update_order_detail_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_order_detail_updated_at
AFTER UPDATE ON order_detail
FOR EACH ROW
EXECUTE FUNCTION update_order_detail_updated_at();

CREATE OR REPLACE FUNCTION update_orders_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_orders_updated_at
AFTER UPDATE ON orders
FOR EACH ROW
EXECUTE FUNCTION update_orders_updated_at();
-- END: ed8c6549bwf9
