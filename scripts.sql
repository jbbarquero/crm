-- Table: cart_order

-- DROP TABLE cart_order;

CREATE TABLE cart_order
(
  cart_order_id bigint NOT NULL,
  date_of_order date,
  customer_id bigint,
  CONSTRAINT cart_order_pkey PRIMARY KEY (cart_order_id),
  CONSTRAINT fkdce08d4f321c69d0 FOREIGN KEY (customer_id)
      REFERENCES customer (customer_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE cart_order OWNER TO "WASDSNP";

-- Table: company

-- DROP TABLE company;

CREATE TABLE company
(
  company_id bigint NOT NULL,
  company character varying(255),
  CONSTRAINT company_pkey PRIMARY KEY (company_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE company OWNER TO "WASDSNP";

-- Table: company

-- DROP TABLE company;

CREATE TABLE company
(
  company_id bigint NOT NULL,
  company character varying(255),
  CONSTRAINT company_pkey PRIMARY KEY (company_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE company OWNER TO "WASDSNP";

-- Table: line_item

-- DROP TABLE line_item;

CREATE TABLE line_item
(
  line_item_id bigint NOT NULL,
  quantity bigint,
  cart_order_id bigint,
  product_id bigint,
  CONSTRAINT line_item_pkey PRIMARY KEY (line_item_id),
  CONSTRAINT fk3cc85c7e51a437c4 FOREIGN KEY (product_id)
      REFERENCES product (product_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk3cc85c7efc9477e3 FOREIGN KEY (cart_order_id)
      REFERENCES cart_order (cart_order_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE line_item OWNER TO "WASDSNP";

-- Table: product

-- DROP TABLE product;

CREATE TABLE product
(
  product_id bigint NOT NULL,
  description character varying(1000),
  "name" character varying(255),
  price double precision,
  CONSTRAINT product_pkey PRIMARY KEY (product_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE product OWNER TO "WASDSNP";
