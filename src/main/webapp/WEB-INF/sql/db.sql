/*CREATE TABLE product (
    product_id INT DEFAULT product_id_seq.NEXTVAL PRIMARY KEY,
    product_name VARCHAR2(255),
    product_content CLOB, -- TEXT 대신 CLOB를 사용
    product_price NUMBER(10, 2),
    product_count NUMBER,
    productImage VARCHAR2(255),
    viewType VARCHAR2(255)
);*/


CREATE TABLE product (
    product_id INT DEFAULT product_id_seq.NEXTVAL PRIMARY KEY,
    product_name VARCHAR2(255),
    product_content CLOB, -- TEXT 대신 CLOB를 사용
    product_price NUMBER(10, 2),
    product_count NUMBER,
    uploadFile VARCHAR2(255),
    viewType VARCHAR2(255)
);
