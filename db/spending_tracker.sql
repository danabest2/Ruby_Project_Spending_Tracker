DROP TABLE transactions;
DROP TABLE merchants;
DROP TABLE spending_types;

CREATE TABLE spending_types(
  id SERIAL8 primary key,
  tag VARCHAR(255)
);

CREATE TABLE merchants(
  id SERIAL8 primary key,
  name VARCHAR(255)
);

CREATE TABLE transactions(
  id SERIAL8 primary key,
  value INT4,
  spending_type_id INT8 REFERENCES spending_types(id),
  merchant_id INT8 REFERENCES merchants(id)
);
