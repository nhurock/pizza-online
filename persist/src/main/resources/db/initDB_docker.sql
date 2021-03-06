DROP TABLE IF EXISTS ORDER_PRODUCT;
DROP TABLE IF EXISTS ORDERS;
DROP TABLE IF EXISTS PRODUCT;
-- DROP TABLE IF EXISTS PERSON;
-- DROP TABLE IF EXISTS ADDRESS;


DROP SEQUENCE IF EXISTS global_seq;

CREATE SEQUENCE global_seq START 1005;

CREATE TABLE PRODUCT
(
    id          INTEGER PRIMARY KEY DEFAULT nextval('global_seq'),
    name        VARCHAR(100) NOT NULL,
    description VARCHAR(100) NOT NULL,
    price       NUMERIC(5, 2)       DEFAULT 0,
    discount    INTEGER             DEFAULT 0,
    picture     VARCHAR(100)
);

CREATE UNIQUE INDEX product_unique_name_description_index ON PRODUCT (name, description);

CREATE TABLE ORDERS
(
    id        INTEGER PRIMARY KEY DEFAULT nextval('global_seq'),
    person_id INTEGER NOT NULL,
    created   TIMESTAMP,
    completed BOOLEAN NOT NULL    DEFAULT FALSE,
    FOREIGN KEY (person_id) REFERENCES user_entity (id) ON DELETE CASCADE
);

CREATE TABLE ORDER_PRODUCT
(
    order_id   INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    quantity   INTEGER NOT NULL,
    FOREIGN KEY (product_id) REFERENCES PRODUCT (id) ON DELETE CASCADE,
    FOREIGN KEY (order_id) REFERENCES ORDERS (id) ON DELETE CASCADE,
    PRIMARY KEY (order_id, product_id)
);
