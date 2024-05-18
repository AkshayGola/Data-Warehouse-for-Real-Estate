DROP TABLE agent;
DROP TABLE customer;
DROP TABLE office;
DROP TABLE paymenttype;
DROP TABLE property;
DROP TABLE propertytype;
DROP TABLE quotation;
DROP TABLE rental;
DROP TABLE sale;
DROP TABLE time;

CREATE TABLE agent (
    agentpk   INTEGER NOT NULL,
    agentid   VARCHAR(50),
    agentname VARCHAR(50) NOT NULL,
    officefk  INTEGER,
    landline  VARCHAR(20),
    mobile    VARCHAR(20),
    email     VARCHAR(50)
);

ALTER TABLE agent ADD CONSTRAINT customerv1_pk PRIMARY KEY ( agentpk );

CREATE TABLE customer (
    customerpk   INTEGER NOT NULL,
    customerid   VARCHAR(50),
    customername VARCHAR(50),
    state        VARCHAR(50),
    district     VARCHAR(50),
    city         VARCHAR(50),
    pincode      INTEGER,
    landline     VARCHAR(20),
    mobile       VARCHAR(20),
    email        VARCHAR(50)
);

ALTER TABLE customer ADD CONSTRAINT customer_pk PRIMARY KEY ( customerpk );

CREATE TABLE office (
    officepk   INTEGER NOT NULL,
    officename VARCHAR(50),
    state      VARCHAR(50),
    district   VARCHAR(50),
    city       VARCHAR(50),
    pincode    INTEGER,
    landline   VARCHAR(20),
    email      VARCHAR(50)
);

ALTER TABLE office ADD CONSTRAINT propertytypev1_pk PRIMARY KEY ( officepk );

CREATE TABLE paymenttype (
    paymenttypepk INTEGER NOT NULL,
    description   VARCHAR(50)
);

ALTER TABLE paymenttype ADD CONSTRAINT paymenttype_pk PRIMARY KEY ( paymenttypepk );

CREATE TABLE property (
    propertypk     INTEGER NOT NULL,
    propertytypefk INTEGER,
    propertyarea   FLOAT,
    state          VARCHAR(50),
    district       VARCHAR(50),
    city           VARCHAR(50),
    pincode        INTEGER,
    floors         INTEGER,
    rooms          INTEGER
);

ALTER TABLE property ADD CONSTRAINT property_pk PRIMARY KEY ( propertypk );

CREATE TABLE propertytype (
    propertytypepk INTEGER NOT NULL,
    description    VARCHAR(50),
    iscommercial   SMALLINT
);

ALTER TABLE propertytype ADD CONSTRAINT propertytype_pk PRIMARY KEY ( propertytypepk );

CREATE TABLE quotation (
    quotationpk INTEGER NOT NULL,
    propertyfk  INTEGER,
    sellerfk    INTEGER,
    agentfk     INTEGER,
    timefk      INTEGER,
    saleorrent  SMALLINT,
    quoteprice  FLOAT
);

ALTER TABLE quotation ADD CONSTRAINT quotation_pk PRIMARY KEY ( quotationpk );

CREATE TABLE rental (
    rentalpk            INTEGER NOT NULL,
    propertyfk          INTEGER,
    sellerfk            INTEGER,
    buyerfk             INTEGER,
    agentfk             INTEGER,
    timefk              INTEGER,
    monthlyrent         FLOAT,
    rentduration        INTEGER,
    securityamount      FLOAT,
    landlordbrokerage   FLOAT,
    tenantbrokerage     FLOAT,
    landlordagentrating INTEGER,
    tenantagentrating   INTEGER
);

ALTER TABLE rental ADD CONSTRAINT rental_pk PRIMARY KEY ( rentalpk );

CREATE TABLE sale (
    salepk            INTEGER NOT NULL,
    propertyfk        INTEGER,
    sellerfk          INTEGER,
    buyerfk           INTEGER,
    agentfk           INTEGER,
    timefk            INTEGER,
    paymenttypefk     INTEGER,
    saleprice         FLOAT,
    sellerbrokerage   FLOAT,
    buyerbrokerage    FLOAT,
    selleragentrating INTEGER,
    buyeragentrating  INTEGER
);

ALTER TABLE sale ADD CONSTRAINT sale_pk PRIMARY KEY ( salepk );

CREATE TABLE time (
    timepk INTEGER NOT NULL,
    "Date" SMALLINT,
    month  SMALLINT,
    year   SMALLINT
);

ALTER TABLE time ADD CONSTRAINT time_pk PRIMARY KEY ( timepk );

