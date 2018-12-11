--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.14
-- Dumped by pg_dump version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: wegmans2; Type: SCHEMA; Schema: -; Owner: jaf9897
--

CREATE SCHEMA wegmans2;


ALTER SCHEMA wegmans2 OWNER TO jaf9897;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: admin; Type: TABLE; Schema: wegmans2; Owner: jaf9897
--

CREATE TABLE wegmans2.admin (
    username character varying(15) NOT NULL,
    password character varying(12)
);


ALTER TABLE wegmans2.admin OWNER TO jaf9897;

--
-- Name: brand; Type: TABLE; Schema: wegmans2; Owner: jaf9897
--

CREATE TABLE wegmans2.brand (
    name character varying(50) NOT NULL,
    numberofproducts integer,
    vendor character varying(50) NOT NULL
);


ALTER TABLE wegmans2.brand OWNER TO jaf9897;

--
-- Name: carriedby; Type: TABLE; Schema: wegmans2; Owner: jaf9897
--

CREATE TABLE wegmans2.carriedby (
    storeid character(8),
    brand character varying(50)
);


ALTER TABLE wegmans2.carriedby OWNER TO jaf9897;

--
-- Name: customer; Type: TABLE; Schema: wegmans2; Owner: jaf9897
--

CREATE TABLE wegmans2.customer (
    phonenumber character(10) NOT NULL,
    firstname character varying(50) NOT NULL,
    lastname character varying(50)
);


ALTER TABLE wegmans2.customer OWNER TO jaf9897;

--
-- Name: distributedby; Type: TABLE; Schema: wegmans2; Owner: jaf9897
--

CREATE TABLE wegmans2.distributedby (
    vendor character varying(50),
    brand character varying(50)
);


ALTER TABLE wegmans2.distributedby OWNER TO jaf9897;

--
-- Name: orders; Type: TABLE; Schema: wegmans2; Owner: jaf9897
--

CREATE TABLE wegmans2.orders (
    customer character(10),
    ordernumber character(8) NOT NULL,
    product character(12) NOT NULL,
    store character(8),
    numbersold integer
);


ALTER TABLE wegmans2.orders OWNER TO jaf9897;

--
-- Name: product; Type: TABLE; Schema: wegmans2; Owner: jaf9897
--

CREATE TABLE wegmans2.product (
    upc character(12) NOT NULL,
    brand character varying(50),
    name character varying(50) NOT NULL,
    type character varying(50),
    size character varying(50),
    price double precision
);


ALTER TABLE wegmans2.product OWNER TO jaf9897;

--
-- Name: reorder; Type: TABLE; Schema: wegmans2; Owner: jaf9897
--

CREATE TABLE wegmans2.reorder (
    ordernumber character(8) NOT NULL,
    product character(12) NOT NULL,
    store character(8) NOT NULL,
    deliverydate date,
    stockrequested integer,
    fulfilledby character varying(50)
);


ALTER TABLE wegmans2.reorder OWNER TO jaf9897;

--
-- Name: soldby; Type: TABLE; Schema: wegmans2; Owner: jaf9897
--

CREATE TABLE wegmans2.soldby (
    storeid character(8),
    productid character(12),
    numberinstock integer
);


ALTER TABLE wegmans2.soldby OWNER TO jaf9897;

--
-- Name: store; Type: TABLE; Schema: wegmans2; Owner: jaf9897
--

CREATE TABLE wegmans2.store (
    id character(8) NOT NULL,
    address character varying(50),
    state character(2) NOT NULL,
    opentime integer,
    closetime integer
);


ALTER TABLE wegmans2.store OWNER TO jaf9897;

--
-- Name: vendor; Type: TABLE; Schema: wegmans2; Owner: jaf9897
--

CREATE TABLE wegmans2.vendor (
    name character varying(50) NOT NULL,
    homestate character(2)
);


ALTER TABLE wegmans2.vendor OWNER TO jaf9897;

--
-- Data for Name: admin; Type: TABLE DATA; Schema: wegmans2; Owner: jaf9897
--

COPY wegmans2.admin (username, password) FROM stdin;
JWegman21	honeycrisp
AdobeHead	reader4lyfe
camelCase	malboro
\.


--
-- Data for Name: brand; Type: TABLE DATA; Schema: wegmans2; Owner: jaf9897
--

COPY wegmans2.brand (name, numberofproducts, vendor) FROM stdin;
ACME	73	ACME
Atlantis Beverage	7	Moo Corp.
Carboload	5	Penguin Incorporated
Classified Cosmetics	4	MegaCorp
Clout Drinks	7	Brawndo
Cover Up	6	Monsanto
Dairy Things	7	Moo Corp.
Dairy Time	6	Penguin Incorporated
Deli Emporium	5	MegaCorp
Doctor Bird's	6	ACME
Dole	19	Brawndo
Elmer Inc	17	Monsanto
Freezy Freeze	4	Moo Corp.
Fresh Stuff	15	Penguin Incorporated
Fries Frozen Foods	5	MegaCorp
Grain Train	5	ACME
Marty's Meds	7	Brawndo
Meat and Stuff	19	Monsanto
Munchie Mash	5	Moo Corp.
Scootie's Cleaning	5	Penguin Incorporated
Snack Me Up	5	MegaCorp
Squeaky Clean	6	ACME
\.


--
-- Data for Name: carriedby; Type: TABLE DATA; Schema: wegmans2; Owner: jaf9897
--

COPY wegmans2.carriedby (storeid, brand) FROM stdin;
1       	Doctor Bird's
1       	Squeaky Clean
1       	Freezy Freeze
1       	Grain Train
1       	Munchie Mash
1       	Dole
1       	Cover Up
1       	Deli Emporium
1       	Meat and Stuff
1       	Clout Drinks
1       	Fries Frozen Foods
1       	Dairy Time
1       	Fresh Stuff
1       	ACME
1       	Elmer Inc
1       	Snack Me Up
1       	Carboload
1       	Marty's Meds
1       	Atlantis Beverage
1       	Scootie's Cleaning
1       	Classified Cosmetics
2       	Munchie Mash
2       	Dairy Things
2       	Dairy Time
2       	Cover Up
2       	Meat and Stuff
2       	Doctor Bird's
2       	Squeaky Clean
2       	ACME
2       	Snack Me Up
2       	Carboload
2       	Scootie's Cleaning
2       	Fries Frozen Foods
2       	Freezy Freeze
2       	Clout Drinks
2       	Marty's Meds
2       	Atlantis Beverage
2       	Fresh Stuff
2       	Deli Emporium
2       	Grain Train
3       	Cover Up
3       	Carboload
3       	Grain Train
3       	Elmer Inc
3       	Dairy Time
3       	Snack Me Up
3       	ACME
3       	Classified Cosmetics
3       	Dole
3       	Freezy Freeze
3       	Scootie's Cleaning
3       	Meat and Stuff
3       	Marty's Meds
3       	Clout Drinks
3       	Dairy Things
4       	Clout Drinks
4       	Cover Up
4       	Carboload
4       	Fresh Stuff
4       	Grain Train
4       	Scootie's Cleaning
4       	Dole
4       	Freezy Freeze
4       	ACME
4       	Dairy Time
4       	Elmer Inc
4       	Classified Cosmetics
4       	Snack Me Up
4       	Munchie Mash
4       	Dairy Things
4       	Doctor Bird's
4       	Deli Emporium
4       	Fries Frozen Foods
4       	Atlantis Beverage
4       	Marty's Meds
4       	Squeaky Clean
5       	Fries Frozen Foods
5       	Classified Cosmetics
5       	Carboload
5       	Marty's Meds
5       	Fresh Stuff
5       	Cover Up
5       	Meat and Stuff
5       	Deli Emporium
5       	Clout Drinks
5       	Dole
5       	Dairy Time
5       	ACME
5       	Freezy Freeze
5       	Squeaky Clean
5       	Munchie Mash
5       	Grain Train
5       	Dairy Things
5       	Doctor Bird's
5       	Elmer Inc
5       	Snack Me Up
5       	Atlantis Beverage
5       	Scootie's Cleaning
6       	Doctor Bird's
6       	Scootie's Cleaning
6       	Meat and Stuff
6       	Dole
6       	Dairy Things
6       	Fries Frozen Foods
6       	Dairy Time
6       	Marty's Meds
6       	Grain Train
6       	ACME
6       	Carboload
6       	Munchie Mash
6       	Fresh Stuff
6       	Clout Drinks
6       	Squeaky Clean
6       	Freezy Freeze
6       	Deli Emporium
7       	Squeaky Clean
7       	Classified Cosmetics
7       	Grain Train
7       	Fresh Stuff
7       	Cover Up
7       	Dairy Time
7       	Fries Frozen Foods
7       	Clout Drinks
7       	Elmer Inc
7       	Doctor Bird's
7       	Freezy Freeze
7       	Dole
7       	Deli Emporium
7       	Scootie's Cleaning
7       	Munchie Mash
8       	Fresh Stuff
8       	Cover Up
8       	Clout Drinks
8       	Grain Train
8       	Snack Me Up
8       	Dairy Things
8       	ACME
8       	Elmer Inc
8       	Freezy Freeze
8       	Dairy Time
8       	Deli Emporium
8       	Doctor Bird's
8       	Dole
8       	Classified Cosmetics
8       	Scootie's Cleaning
8       	Munchie Mash
8       	Atlantis Beverage
8       	Meat and Stuff
8       	Fries Frozen Foods
8       	Squeaky Clean
8       	Marty's Meds
9       	Fries Frozen Foods
9       	Deli Emporium
9       	Dairy Time
9       	Fresh Stuff
9       	Doctor Bird's
9       	Cover Up
9       	Snack Me Up
9       	Marty's Meds
9       	Scootie's Cleaning
9       	Dole
9       	Meat and Stuff
9       	ACME
9       	Dairy Things
9       	Classified Cosmetics
9       	Grain Train
9       	Carboload
9       	Freezy Freeze
10      	Atlantis Beverage
10      	Deli Emporium
10      	Doctor Bird's
10      	Snack Me Up
10      	ACME
10      	Cover Up
10      	Dairy Things
10      	Scootie's Cleaning
10      	Dairy Time
10      	Classified Cosmetics
10      	Munchie Mash
10      	Carboload
10      	Dole
10      	Freezy Freeze
10      	Fries Frozen Foods
10      	Meat and Stuff
10      	Fresh Stuff
10      	Grain Train
10      	Squeaky Clean
10      	Clout Drinks
10      	Elmer Inc
10      	Marty's Meds
11      	Fries Frozen Foods
11      	Cover Up
11      	Classified Cosmetics
11      	Doctor Bird's
11      	Dairy Things
11      	Freezy Freeze
11      	Munchie Mash
11      	ACME
11      	Fresh Stuff
11      	Dairy Time
11      	Snack Me Up
11      	Elmer Inc
11      	Atlantis Beverage
11      	Dole
11      	Carboload
11      	Scootie's Cleaning
11      	Squeaky Clean
11      	Clout Drinks
11      	Marty's Meds
11      	Grain Train
11      	Deli Emporium
12      	Doctor Bird's
12      	Dole
12      	Classified Cosmetics
12      	Meat and Stuff
12      	Marty's Meds
12      	Squeaky Clean
12      	ACME
12      	Cover Up
12      	Clout Drinks
12      	Fries Frozen Foods
12      	Fresh Stuff
12      	Deli Emporium
12      	Elmer Inc
12      	Scootie's Cleaning
12      	Dairy Things
12      	Snack Me Up
12      	Carboload
12      	Grain Train
12      	Freezy Freeze
12      	Dairy Time
13      	Deli Emporium
13      	Dairy Time
13      	Snack Me Up
13      	Meat and Stuff
13      	Fries Frozen Foods
13      	Marty's Meds
13      	Freezy Freeze
13      	Doctor Bird's
13      	Scootie's Cleaning
13      	Squeaky Clean
13      	Dairy Things
13      	Cover Up
13      	ACME
13      	Munchie Mash
13      	Carboload
13      	Grain Train
13      	Elmer Inc
13      	Dole
13      	Atlantis Beverage
13      	Classified Cosmetics
13      	Fresh Stuff
13      	Clout Drinks
14      	Fries Frozen Foods
14      	Dairy Time
14      	Elmer Inc
14      	Carboload
14      	Freezy Freeze
14      	Doctor Bird's
14      	Dole
14      	Snack Me Up
14      	Meat and Stuff
14      	Grain Train
14      	ACME
14      	Marty's Meds
14      	Squeaky Clean
14      	Atlantis Beverage
14      	Scootie's Cleaning
14      	Fresh Stuff
14      	Munchie Mash
14      	Classified Cosmetics
14      	Clout Drinks
14      	Dairy Things
14      	Deli Emporium
15      	Dole
15      	Dairy Things
15      	Fresh Stuff
15      	Meat and Stuff
15      	Grain Train
15      	Doctor Bird's
15      	Marty's Meds
15      	Fries Frozen Foods
15      	Cover Up
15      	ACME
15      	Elmer Inc
15      	Clout Drinks
15      	Scootie's Cleaning
15      	Atlantis Beverage
15      	Classified Cosmetics
15      	Squeaky Clean
16      	Scootie's Cleaning
16      	Snack Me Up
16      	Fresh Stuff
16      	Fries Frozen Foods
16      	Deli Emporium
16      	Freezy Freeze
16      	Classified Cosmetics
16      	ACME
16      	Dairy Things
16      	Atlantis Beverage
16      	Marty's Meds
16      	Munchie Mash
16      	Carboload
16      	Dole
16      	Clout Drinks
16      	Doctor Bird's
16      	Grain Train
16      	Cover Up
16      	Elmer Inc
17      	Elmer Inc
17      	Dairy Time
17      	Snack Me Up
17      	ACME
17      	Dole
17      	Squeaky Clean
17      	Marty's Meds
17      	Fries Frozen Foods
17      	Carboload
17      	Cover Up
17      	Meat and Stuff
17      	Grain Train
17      	Freezy Freeze
17      	Atlantis Beverage
17      	Munchie Mash
18      	Clout Drinks
18      	Atlantis Beverage
18      	Freezy Freeze
18      	Dole
18      	Doctor Bird's
18      	Munchie Mash
18      	Carboload
18      	Marty's Meds
18      	Dairy Time
18      	Elmer Inc
18      	Grain Train
18      	Deli Emporium
18      	Fries Frozen Foods
18      	Classified Cosmetics
18      	Scootie's Cleaning
18      	Squeaky Clean
18      	Cover Up
18      	Meat and Stuff
18      	Snack Me Up
18      	Dairy Things
18      	ACME
19      	Dairy Things
19      	Freezy Freeze
19      	Squeaky Clean
19      	Dairy Time
19      	Fries Frozen Foods
19      	Doctor Bird's
19      	Dole
19      	Fresh Stuff
19      	Grain Train
19      	Clout Drinks
19      	Deli Emporium
19      	Munchie Mash
19      	Scootie's Cleaning
19      	Snack Me Up
19      	Marty's Meds
19      	Meat and Stuff
19      	ACME
20      	Cover Up
20      	Fries Frozen Foods
20      	Dairy Time
20      	Scootie's Cleaning
20      	Elmer Inc
20      	Meat and Stuff
20      	Fresh Stuff
20      	Dairy Things
20      	Munchie Mash
20      	Grain Train
20      	Classified Cosmetics
20      	Snack Me Up
20      	ACME
20      	Carboload
20      	Deli Emporium
20      	Marty's Meds
20      	Doctor Bird's
20      	Squeaky Clean
20      	Clout Drinks
20      	Dole
21      	Dairy Time
21      	Doctor Bird's
21      	Fries Frozen Foods
21      	Snack Me Up
21      	Scootie's Cleaning
21      	Meat and Stuff
21      	Munchie Mash
21      	Squeaky Clean
21      	Fresh Stuff
21      	Marty's Meds
21      	Dairy Things
21      	Classified Cosmetics
21      	Grain Train
21      	Clout Drinks
21      	Deli Emporium
21      	Atlantis Beverage
21      	Elmer Inc
22      	Doctor Bird's
22      	Carboload
22      	Fresh Stuff
22      	Fries Frozen Foods
22      	Scootie's Cleaning
22      	ACME
22      	Classified Cosmetics
22      	Dairy Things
22      	Snack Me Up
22      	Cover Up
22      	Elmer Inc
22      	Freezy Freeze
22      	Squeaky Clean
22      	Meat and Stuff
22      	Atlantis Beverage
22      	Deli Emporium
22      	Dole
22      	Grain Train
22      	Clout Drinks
22      	Munchie Mash
22      	Dairy Time
22      	Marty's Meds
23      	Dairy Time
23      	Classified Cosmetics
23      	Carboload
23      	Dairy Things
23      	Munchie Mash
23      	Deli Emporium
23      	Marty's Meds
23      	Doctor Bird's
23      	Atlantis Beverage
23      	Squeaky Clean
23      	Fries Frozen Foods
23      	Meat and Stuff
23      	Scootie's Cleaning
23      	Fresh Stuff
23      	Elmer Inc
23      	Grain Train
23      	Clout Drinks
23      	Snack Me Up
23      	ACME
24      	Munchie Mash
24      	Freezy Freeze
24      	Deli Emporium
24      	Marty's Meds
24      	Elmer Inc
24      	Clout Drinks
24      	Dairy Time
24      	Atlantis Beverage
24      	Dairy Things
24      	Meat and Stuff
24      	Fresh Stuff
24      	Scootie's Cleaning
24      	Snack Me Up
24      	Cover Up
24      	Dole
24      	Squeaky Clean
25      	Clout Drinks
25      	Cover Up
25      	ACME
25      	Munchie Mash
25      	Dairy Things
25      	Elmer Inc
25      	Marty's Meds
25      	Classified Cosmetics
25      	Squeaky Clean
25      	Dairy Time
25      	Freezy Freeze
25      	Doctor Bird's
25      	Deli Emporium
25      	Meat and Stuff
25      	Fries Frozen Foods
25      	Snack Me Up
25      	Scootie's Cleaning
26      	Freezy Freeze
26      	Fries Frozen Foods
26      	Munchie Mash
26      	ACME
26      	Classified Cosmetics
26      	Meat and Stuff
26      	Cover Up
26      	Squeaky Clean
26      	Scootie's Cleaning
26      	Snack Me Up
26      	Atlantis Beverage
26      	Carboload
26      	Fresh Stuff
26      	Elmer Inc
26      	Doctor Bird's
26      	Dole
26      	Deli Emporium
26      	Marty's Meds
26      	Dairy Time
26      	Clout Drinks
27      	Marty's Meds
27      	Freezy Freeze
27      	Classified Cosmetics
27      	Fresh Stuff
27      	Munchie Mash
27      	Elmer Inc
27      	Meat and Stuff
27      	Scootie's Cleaning
27      	Carboload
27      	ACME
27      	Dairy Time
27      	Squeaky Clean
27      	Grain Train
27      	Fries Frozen Foods
27      	Deli Emporium
27      	Atlantis Beverage
28      	Cover Up
28      	Dole
28      	Meat and Stuff
28      	Marty's Meds
28      	Dairy Things
28      	Snack Me Up
28      	Munchie Mash
28      	Carboload
28      	Doctor Bird's
28      	Elmer Inc
28      	Grain Train
28      	Scootie's Cleaning
28      	Classified Cosmetics
28      	Deli Emporium
28      	Clout Drinks
28      	ACME
28      	Squeaky Clean
28      	Dairy Time
28      	Fries Frozen Foods
29      	Deli Emporium
29      	Atlantis Beverage
29      	Scootie's Cleaning
29      	Snack Me Up
29      	Meat and Stuff
29      	Elmer Inc
29      	Marty's Meds
29      	Carboload
29      	ACME
29      	Munchie Mash
29      	Fries Frozen Foods
29      	Fresh Stuff
29      	Squeaky Clean
29      	Grain Train
29      	Dole
29      	Clout Drinks
29      	Doctor Bird's
29      	Freezy Freeze
29      	Cover Up
29      	Dairy Things
30      	Grain Train
30      	Classified Cosmetics
30      	Carboload
30      	Elmer Inc
30      	Squeaky Clean
30      	Deli Emporium
30      	Dole
30      	Fresh Stuff
30      	ACME
30      	Munchie Mash
30      	Doctor Bird's
30      	Dairy Things
30      	Freezy Freeze
30      	Marty's Meds
30      	Atlantis Beverage
30      	Scootie's Cleaning
30      	Clout Drinks
31      	Meat and Stuff
31      	Dairy Things
31      	Munchie Mash
31      	Dole
31      	Atlantis Beverage
31      	Clout Drinks
31      	Carboload
31      	Scootie's Cleaning
31      	Doctor Bird's
31      	Classified Cosmetics
31      	Marty's Meds
31      	Fresh Stuff
31      	Grain Train
31      	Squeaky Clean
31      	Snack Me Up
32      	Clout Drinks
32      	Squeaky Clean
32      	Grain Train
32      	Atlantis Beverage
32      	Dole
32      	Fresh Stuff
32      	Meat and Stuff
32      	Dairy Time
32      	Fries Frozen Foods
32      	Dairy Things
32      	Scootie's Cleaning
32      	ACME
32      	Snack Me Up
32      	Doctor Bird's
32      	Deli Emporium
32      	Classified Cosmetics
32      	Carboload
32      	Elmer Inc
32      	Munchie Mash
32      	Cover Up
33      	Fries Frozen Foods
33      	Munchie Mash
33      	Doctor Bird's
33      	Snack Me Up
33      	Fresh Stuff
33      	Grain Train
33      	Atlantis Beverage
33      	Freezy Freeze
33      	Squeaky Clean
33      	Dole
33      	Deli Emporium
33      	Classified Cosmetics
33      	Dairy Time
33      	Elmer Inc
33      	Scootie's Cleaning
33      	Marty's Meds
33      	Clout Drinks
33      	Meat and Stuff
33      	Dairy Things
33      	Carboload
33      	ACME
33      	Cover Up
34      	Fresh Stuff
34      	Doctor Bird's
34      	Meat and Stuff
34      	Marty's Meds
34      	Squeaky Clean
34      	Freezy Freeze
34      	Grain Train
34      	Cover Up
34      	Carboload
34      	Clout Drinks
34      	Dole
34      	Snack Me Up
34      	Classified Cosmetics
34      	ACME
34      	Scootie's Cleaning
34      	Dairy Things
34      	Elmer Inc
34      	Deli Emporium
34      	Fries Frozen Foods
34      	Atlantis Beverage
34      	Dairy Time
34      	Munchie Mash
35      	Cover Up
35      	Grain Train
35      	Marty's Meds
35      	Doctor Bird's
35      	Clout Drinks
35      	Meat and Stuff
35      	Scootie's Cleaning
35      	Carboload
35      	Freezy Freeze
35      	Dairy Time
35      	Classified Cosmetics
35      	Squeaky Clean
35      	Snack Me Up
35      	Dole
35      	Munchie Mash
35      	Fries Frozen Foods
35      	Elmer Inc
35      	Fresh Stuff
35      	Deli Emporium
35      	ACME
36      	Fresh Stuff
36      	Dole
36      	Scootie's Cleaning
36      	Dairy Things
36      	Fries Frozen Foods
36      	Deli Emporium
36      	Carboload
36      	Marty's Meds
36      	Dairy Time
36      	Grain Train
36      	Squeaky Clean
36      	Atlantis Beverage
36      	Doctor Bird's
36      	Snack Me Up
36      	Freezy Freeze
36      	Cover Up
36      	Elmer Inc
36      	Classified Cosmetics
37      	Grain Train
37      	Snack Me Up
37      	ACME
37      	Meat and Stuff
37      	Dairy Time
37      	Atlantis Beverage
37      	Freezy Freeze
37      	Dole
37      	Clout Drinks
37      	Doctor Bird's
37      	Marty's Meds
37      	Squeaky Clean
37      	Elmer Inc
37      	Scootie's Cleaning
37      	Munchie Mash
37      	Carboload
37      	Dairy Things
37      	Cover Up
37      	Fries Frozen Foods
37      	Deli Emporium
38      	Grain Train
38      	Dole
38      	ACME
38      	Marty's Meds
38      	Fresh Stuff
38      	Atlantis Beverage
38      	Meat and Stuff
38      	Carboload
38      	Snack Me Up
38      	Classified Cosmetics
38      	Munchie Mash
38      	Deli Emporium
38      	Clout Drinks
38      	Fries Frozen Foods
38      	Doctor Bird's
38      	Dairy Things
38      	Freezy Freeze
38      	Elmer Inc
38      	Scootie's Cleaning
38      	Dairy Time
38      	Squeaky Clean
39      	Carboload
39      	Fresh Stuff
39      	Doctor Bird's
39      	Squeaky Clean
39      	Cover Up
39      	Clout Drinks
39      	Scootie's Cleaning
39      	Marty's Meds
39      	Fries Frozen Foods
39      	Munchie Mash
39      	Snack Me Up
39      	Dairy Things
39      	Deli Emporium
39      	Meat and Stuff
39      	ACME
39      	Grain Train
39      	Atlantis Beverage
39      	Dole
39      	Dairy Time
39      	Elmer Inc
39      	Classified Cosmetics
40      	Dairy Time
40      	Fresh Stuff
40      	Grain Train
40      	Meat and Stuff
40      	Clout Drinks
40      	Doctor Bird's
40      	Dole
40      	ACME
40      	Atlantis Beverage
40      	Classified Cosmetics
40      	Carboload
40      	Scootie's Cleaning
40      	Snack Me Up
40      	Munchie Mash
40      	Squeaky Clean
40      	Deli Emporium
40      	Dairy Things
40      	Elmer Inc
40      	Fries Frozen Foods
41      	Fresh Stuff
41      	Dairy Things
41      	Classified Cosmetics
41      	Clout Drinks
41      	Deli Emporium
41      	Dairy Time
41      	Doctor Bird's
41      	Dole
41      	Carboload
41      	Elmer Inc
41      	Munchie Mash
41      	Grain Train
41      	Freezy Freeze
41      	Meat and Stuff
41      	Marty's Meds
42      	Meat and Stuff
42      	Atlantis Beverage
42      	Cover Up
42      	Doctor Bird's
42      	Deli Emporium
42      	Dairy Things
42      	Elmer Inc
42      	Dairy Time
42      	Munchie Mash
42      	Squeaky Clean
42      	Marty's Meds
42      	Fresh Stuff
42      	Carboload
42      	Scootie's Cleaning
42      	Classified Cosmetics
42      	Fries Frozen Foods
42      	Freezy Freeze
42      	Snack Me Up
43      	Fresh Stuff
43      	Elmer Inc
43      	Cover Up
43      	Squeaky Clean
43      	Snack Me Up
43      	Dole
43      	Deli Emporium
43      	Scootie's Cleaning
43      	Munchie Mash
43      	Doctor Bird's
43      	Atlantis Beverage
43      	Fries Frozen Foods
43      	Grain Train
43      	Dairy Things
43      	ACME
43      	Carboload
43      	Marty's Meds
43      	Dairy Time
43      	Freezy Freeze
43      	Classified Cosmetics
43      	Meat and Stuff
43      	Clout Drinks
44      	Clout Drinks
44      	Marty's Meds
44      	Fresh Stuff
44      	ACME
44      	Atlantis Beverage
44      	Munchie Mash
44      	Carboload
44      	Freezy Freeze
44      	Dairy Time
44      	Dole
44      	Meat and Stuff
44      	Classified Cosmetics
44      	Deli Emporium
44      	Dairy Things
44      	Squeaky Clean
44      	Doctor Bird's
44      	Elmer Inc
45      	Scootie's Cleaning
45      	Elmer Inc
45      	Dole
45      	Freezy Freeze
45      	Atlantis Beverage
45      	Fresh Stuff
45      	Dairy Time
45      	Doctor Bird's
45      	ACME
45      	Munchie Mash
45      	Cover Up
45      	Clout Drinks
45      	Meat and Stuff
45      	Carboload
45      	Dairy Things
45      	Classified Cosmetics
45      	Snack Me Up
45      	Deli Emporium
45      	Squeaky Clean
45      	Grain Train
45      	Fries Frozen Foods
46      	Dairy Time
46      	Cover Up
46      	Dole
46      	Freezy Freeze
46      	Fresh Stuff
46      	Marty's Meds
46      	Munchie Mash
46      	Meat and Stuff
46      	Fries Frozen Foods
46      	Atlantis Beverage
46      	Dairy Things
46      	Squeaky Clean
46      	Scootie's Cleaning
46      	Grain Train
46      	Carboload
47      	Freezy Freeze
47      	Elmer Inc
47      	Atlantis Beverage
47      	Squeaky Clean
47      	ACME
47      	Carboload
47      	Deli Emporium
47      	Clout Drinks
47      	Classified Cosmetics
47      	Fries Frozen Foods
47      	Snack Me Up
47      	Dairy Things
47      	Scootie's Cleaning
47      	Grain Train
47      	Marty's Meds
48      	Deli Emporium
48      	Meat and Stuff
48      	Doctor Bird's
48      	Classified Cosmetics
48      	Dairy Time
48      	Marty's Meds
48      	Dairy Things
48      	Cover Up
48      	Carboload
48      	Snack Me Up
48      	Fresh Stuff
48      	Dole
48      	Clout Drinks
48      	Atlantis Beverage
48      	Munchie Mash
48      	Squeaky Clean
48      	Scootie's Cleaning
48      	Freezy Freeze
48      	Elmer Inc
48      	Grain Train
48      	Fries Frozen Foods
48      	ACME
49      	Marty's Meds
49      	Classified Cosmetics
49      	Squeaky Clean
49      	Atlantis Beverage
49      	Fries Frozen Foods
49      	Dairy Time
49      	Doctor Bird's
49      	Elmer Inc
49      	ACME
49      	Cover Up
49      	Freezy Freeze
49      	Meat and Stuff
49      	Clout Drinks
49      	Dairy Things
49      	Deli Emporium
49      	Grain Train
49      	Fresh Stuff
49      	Carboload
49      	Scootie's Cleaning
49      	Snack Me Up
49      	Munchie Mash
49      	Dole
50      	Snack Me Up
50      	Doctor Bird's
50      	Atlantis Beverage
50      	Cover Up
50      	Classified Cosmetics
50      	Squeaky Clean
50      	Dairy Things
50      	Deli Emporium
50      	Elmer Inc
50      	Munchie Mash
50      	Carboload
50      	Grain Train
50      	Freezy Freeze
50      	Meat and Stuff
50      	Fries Frozen Foods
50      	Scootie's Cleaning
50      	ACME
50      	Clout Drinks
50      	Fresh Stuff
50      	Dairy Time
51      	Clout Drinks
51      	Doctor Bird's
51      	Dole
51      	Grain Train
51      	Scootie's Cleaning
51      	Squeaky Clean
51      	Dairy Time
51      	Cover Up
51      	Freezy Freeze
51      	Elmer Inc
51      	Snack Me Up
51      	Fries Frozen Foods
51      	Dairy Things
51      	Meat and Stuff
51      	Atlantis Beverage
51      	Munchie Mash
51      	Carboload
51      	Classified Cosmetics
51      	Marty's Meds
51      	Deli Emporium
51      	Fresh Stuff
51      	ACME
52      	Munchie Mash
52      	Squeaky Clean
52      	Deli Emporium
52      	Meat and Stuff
52      	Freezy Freeze
52      	Dole
52      	Classified Cosmetics
52      	Dairy Things
52      	Carboload
52      	Marty's Meds
52      	Atlantis Beverage
52      	Snack Me Up
52      	Dairy Time
52      	Fresh Stuff
52      	Fries Frozen Foods
52      	Scootie's Cleaning
52      	Cover Up
52      	Grain Train
52      	ACME
52      	Doctor Bird's
53      	Dairy Things
53      	Grain Train
53      	Dairy Time
53      	Cover Up
53      	Carboload
53      	Fries Frozen Foods
53      	Classified Cosmetics
53      	Fresh Stuff
53      	Atlantis Beverage
53      	Deli Emporium
53      	Snack Me Up
53      	Doctor Bird's
53      	Dole
53      	Clout Drinks
53      	Scootie's Cleaning
53      	Munchie Mash
54      	Deli Emporium
54      	Clout Drinks
54      	Carboload
54      	Dole
54      	Munchie Mash
54      	Freezy Freeze
54      	Meat and Stuff
54      	Dairy Time
54      	Snack Me Up
54      	Fries Frozen Foods
54      	Squeaky Clean
54      	Scootie's Cleaning
54      	ACME
54      	Dairy Things
54      	Marty's Meds
54      	Doctor Bird's
55      	Classified Cosmetics
55      	Snack Me Up
55      	Clout Drinks
55      	Dole
55      	Freezy Freeze
55      	Meat and Stuff
55      	Fresh Stuff
55      	Fries Frozen Foods
55      	Marty's Meds
55      	Elmer Inc
55      	Grain Train
55      	Deli Emporium
55      	Squeaky Clean
55      	Scootie's Cleaning
55      	Atlantis Beverage
55      	Dairy Time
55      	Carboload
55      	ACME
55      	Cover Up
55      	Munchie Mash
55      	Dairy Things
56      	Grain Train
56      	Cover Up
56      	Meat and Stuff
56      	Munchie Mash
56      	Marty's Meds
56      	Atlantis Beverage
56      	Scootie's Cleaning
56      	Doctor Bird's
56      	Clout Drinks
56      	Carboload
56      	Dairy Time
56      	ACME
56      	Squeaky Clean
56      	Deli Emporium
56      	Dole
56      	Elmer Inc
56      	Freezy Freeze
56      	Fresh Stuff
56      	Snack Me Up
56      	Fries Frozen Foods
56      	Dairy Things
57      	Munchie Mash
57      	Scootie's Cleaning
57      	Clout Drinks
57      	Classified Cosmetics
57      	Marty's Meds
57      	Squeaky Clean
57      	Freezy Freeze
57      	Dairy Time
57      	Fries Frozen Foods
57      	Cover Up
57      	Carboload
57      	Fresh Stuff
57      	Grain Train
57      	Snack Me Up
57      	Dairy Things
57      	Meat and Stuff
57      	Atlantis Beverage
57      	Doctor Bird's
57      	ACME
57      	Deli Emporium
57      	Dole
57      	Elmer Inc
58      	Doctor Bird's
58      	Deli Emporium
58      	Atlantis Beverage
58      	Dairy Things
58      	Carboload
58      	ACME
58      	Squeaky Clean
58      	Grain Train
58      	Fresh Stuff
58      	Freezy Freeze
58      	Dairy Time
58      	Classified Cosmetics
58      	Meat and Stuff
58      	Snack Me Up
58      	Fries Frozen Foods
58      	Elmer Inc
58      	Scootie's Cleaning
58      	Cover Up
58      	Dole
58      	Munchie Mash
59      	Doctor Bird's
59      	Cover Up
59      	Clout Drinks
59      	ACME
59      	Meat and Stuff
59      	Freezy Freeze
59      	Classified Cosmetics
59      	Carboload
59      	Dairy Things
59      	Snack Me Up
59      	Squeaky Clean
59      	Elmer Inc
59      	Fresh Stuff
59      	Grain Train
59      	Munchie Mash
59      	Scootie's Cleaning
59      	Deli Emporium
59      	Dairy Time
59      	Dole
60      	Atlantis Beverage
60      	Clout Drinks
60      	Munchie Mash
60      	Elmer Inc
60      	Meat and Stuff
60      	Classified Cosmetics
60      	Fresh Stuff
60      	Deli Emporium
60      	Freezy Freeze
60      	Carboload
60      	Cover Up
60      	Scootie's Cleaning
60      	Grain Train
60      	ACME
60      	Squeaky Clean
60      	Fries Frozen Foods
60      	Doctor Bird's
60      	Marty's Meds
60      	Dairy Things
60      	Dairy Time
60      	Snack Me Up
61      	Freezy Freeze
61      	Dairy Things
61      	Doctor Bird's
61      	Meat and Stuff
61      	Marty's Meds
61      	Dole
61      	Fries Frozen Foods
61      	Munchie Mash
61      	Carboload
61      	Scootie's Cleaning
61      	Grain Train
61      	ACME
61      	Squeaky Clean
61      	Clout Drinks
61      	Elmer Inc
61      	Deli Emporium
61      	Snack Me Up
61      	Cover Up
61      	Dairy Time
61      	Fresh Stuff
61      	Classified Cosmetics
62      	Snack Me Up
62      	Elmer Inc
62      	Scootie's Cleaning
62      	Dole
62      	Marty's Meds
62      	Doctor Bird's
62      	Fries Frozen Foods
62      	ACME
62      	Cover Up
62      	Atlantis Beverage
62      	Squeaky Clean
62      	Grain Train
62      	Meat and Stuff
62      	Dairy Things
62      	Carboload
62      	Fresh Stuff
62      	Classified Cosmetics
62      	Clout Drinks
62      	Freezy Freeze
62      	Deli Emporium
62      	Munchie Mash
63      	Dairy Things
63      	ACME
63      	Grain Train
63      	Atlantis Beverage
63      	Scootie's Cleaning
63      	Deli Emporium
63      	Dairy Time
63      	Meat and Stuff
63      	Clout Drinks
63      	Fries Frozen Foods
63      	Dole
63      	Elmer Inc
63      	Classified Cosmetics
63      	Snack Me Up
63      	Fresh Stuff
63      	Freezy Freeze
63      	Doctor Bird's
63      	Munchie Mash
63      	Cover Up
64      	Dairy Time
64      	ACME
64      	Fresh Stuff
64      	Munchie Mash
64      	Squeaky Clean
64      	Dole
64      	Scootie's Cleaning
64      	Doctor Bird's
64      	Dairy Things
64      	Snack Me Up
64      	Clout Drinks
64      	Meat and Stuff
64      	Fries Frozen Foods
64      	Cover Up
64      	Freezy Freeze
64      	Deli Emporium
65      	Dole
65      	Atlantis Beverage
65      	Marty's Meds
65      	ACME
65      	Classified Cosmetics
65      	Fresh Stuff
65      	Dairy Time
65      	Doctor Bird's
65      	Dairy Things
65      	Deli Emporium
65      	Munchie Mash
65      	Grain Train
65      	Snack Me Up
65      	Freezy Freeze
65      	Meat and Stuff
65      	Cover Up
65      	Carboload
65      	Fries Frozen Foods
65      	Elmer Inc
65      	Scootie's Cleaning
66      	Atlantis Beverage
66      	Dairy Time
66      	Grain Train
66      	Fries Frozen Foods
66      	Clout Drinks
66      	Snack Me Up
66      	Deli Emporium
66      	Meat and Stuff
66      	Munchie Mash
66      	Dairy Things
66      	Scootie's Cleaning
66      	Squeaky Clean
66      	Cover Up
66      	Dole
66      	Freezy Freeze
66      	Classified Cosmetics
66      	ACME
66      	Doctor Bird's
66      	Elmer Inc
66      	Fresh Stuff
66      	Carboload
66      	Marty's Meds
67      	Cover Up
67      	ACME
67      	Dole
67      	Elmer Inc
67      	Fries Frozen Foods
67      	Grain Train
67      	Atlantis Beverage
67      	Meat and Stuff
67      	Clout Drinks
67      	Snack Me Up
67      	Carboload
67      	Doctor Bird's
67      	Marty's Meds
67      	Scootie's Cleaning
67      	Munchie Mash
68      	Dole
68      	Freezy Freeze
68      	Dairy Time
68      	Atlantis Beverage
68      	Doctor Bird's
68      	Snack Me Up
68      	Fresh Stuff
68      	Clout Drinks
68      	Fries Frozen Foods
68      	Squeaky Clean
68      	Marty's Meds
68      	Grain Train
68      	ACME
68      	Scootie's Cleaning
68      	Classified Cosmetics
68      	Dairy Things
68      	Deli Emporium
68      	Meat and Stuff
68      	Munchie Mash
69      	Deli Emporium
69      	Grain Train
69      	Carboload
69      	Scootie's Cleaning
69      	ACME
69      	Squeaky Clean
69      	Marty's Meds
69      	Fresh Stuff
69      	Atlantis Beverage
69      	Classified Cosmetics
69      	Fries Frozen Foods
69      	Dole
69      	Cover Up
69      	Dairy Time
69      	Elmer Inc
70      	Deli Emporium
70      	Snack Me Up
70      	Dairy Things
70      	Dairy Time
70      	Marty's Meds
70      	Doctor Bird's
70      	Carboload
70      	Cover Up
70      	Squeaky Clean
70      	Freezy Freeze
70      	Classified Cosmetics
70      	Elmer Inc
70      	Munchie Mash
70      	Atlantis Beverage
70      	Fresh Stuff
70      	ACME
70      	Grain Train
71      	Squeaky Clean
71      	Atlantis Beverage
71      	Grain Train
71      	Fresh Stuff
71      	Elmer Inc
71      	Meat and Stuff
71      	Munchie Mash
71      	Scootie's Cleaning
71      	Dole
71      	Fries Frozen Foods
71      	Freezy Freeze
71      	Marty's Meds
71      	Clout Drinks
71      	Classified Cosmetics
71      	Deli Emporium
71      	Cover Up
71      	Dairy Time
72      	Classified Cosmetics
72      	Grain Train
72      	Dole
72      	ACME
72      	Atlantis Beverage
72      	Freezy Freeze
72      	Marty's Meds
72      	Scootie's Cleaning
72      	Elmer Inc
72      	Snack Me Up
72      	Dairy Time
72      	Cover Up
72      	Munchie Mash
72      	Fries Frozen Foods
72      	Dairy Things
72      	Meat and Stuff
72      	Doctor Bird's
72      	Fresh Stuff
72      	Carboload
72      	Squeaky Clean
73      	Doctor Bird's
73      	Snack Me Up
73      	Meat and Stuff
73      	Dairy Things
73      	Fresh Stuff
73      	Squeaky Clean
73      	Elmer Inc
73      	Carboload
73      	Grain Train
73      	ACME
73      	Dairy Time
73      	Cover Up
73      	Munchie Mash
73      	Freezy Freeze
73      	Clout Drinks
73      	Dole
73      	Classified Cosmetics
73      	Marty's Meds
73      	Scootie's Cleaning
74      	Squeaky Clean
74      	Clout Drinks
74      	Fresh Stuff
74      	Dole
74      	ACME
74      	Atlantis Beverage
74      	Meat and Stuff
74      	Carboload
74      	Munchie Mash
74      	Classified Cosmetics
74      	Marty's Meds
74      	Grain Train
74      	Dairy Time
74      	Freezy Freeze
74      	Doctor Bird's
75      	Dole
75      	Grain Train
75      	Carboload
75      	Doctor Bird's
75      	Deli Emporium
75      	Dairy Things
75      	Munchie Mash
75      	Scootie's Cleaning
75      	ACME
75      	Cover Up
75      	Squeaky Clean
75      	Elmer Inc
75      	Marty's Meds
75      	Fresh Stuff
75      	Dairy Time
75      	Snack Me Up
76      	Grain Train
76      	Fresh Stuff
76      	Elmer Inc
76      	Classified Cosmetics
76      	Deli Emporium
76      	ACME
76      	Carboload
76      	Munchie Mash
76      	Snack Me Up
76      	Squeaky Clean
76      	Scootie's Cleaning
76      	Atlantis Beverage
76      	Dairy Time
76      	Marty's Meds
76      	Freezy Freeze
76      	Dole
76      	Dairy Things
76      	Cover Up
76      	Fries Frozen Foods
77      	Fresh Stuff
77      	Marty's Meds
77      	Munchie Mash
77      	Grain Train
77      	Clout Drinks
77      	Dole
77      	Carboload
77      	Fries Frozen Foods
77      	Doctor Bird's
77      	Dairy Things
77      	Scootie's Cleaning
77      	Meat and Stuff
77      	Freezy Freeze
77      	Dairy Time
77      	Snack Me Up
77      	Elmer Inc
77      	Atlantis Beverage
77      	ACME
77      	Deli Emporium
77      	Classified Cosmetics
77      	Squeaky Clean
77      	Cover Up
78      	Dole
78      	Fresh Stuff
78      	Scootie's Cleaning
78      	Classified Cosmetics
78      	Deli Emporium
78      	Munchie Mash
78      	Snack Me Up
78      	Cover Up
78      	Doctor Bird's
78      	Carboload
78      	ACME
78      	Dairy Time
78      	Squeaky Clean
78      	Marty's Meds
78      	Meat and Stuff
79      	Squeaky Clean
79      	Grain Train
79      	Meat and Stuff
79      	Scootie's Cleaning
79      	Freezy Freeze
79      	Atlantis Beverage
79      	Doctor Bird's
79      	Deli Emporium
79      	Snack Me Up
79      	ACME
79      	Cover Up
79      	Elmer Inc
79      	Marty's Meds
79      	Fresh Stuff
79      	Fries Frozen Foods
79      	Classified Cosmetics
79      	Dairy Time
79      	Dole
80      	Snack Me Up
80      	Scootie's Cleaning
80      	Atlantis Beverage
80      	Meat and Stuff
80      	ACME
80      	Cover Up
80      	Freezy Freeze
80      	Squeaky Clean
80      	Clout Drinks
80      	Munchie Mash
80      	Fresh Stuff
80      	Dole
80      	Elmer Inc
80      	Grain Train
80      	Deli Emporium
80      	Fries Frozen Foods
80      	Marty's Meds
80      	Dairy Time
80      	Dairy Things
80      	Carboload
80      	Doctor Bird's
80      	Classified Cosmetics
81      	Elmer Inc
81      	Scootie's Cleaning
81      	Dole
81      	Meat and Stuff
81      	Fries Frozen Foods
81      	Freezy Freeze
81      	Deli Emporium
81      	Classified Cosmetics
81      	Clout Drinks
81      	Snack Me Up
81      	Marty's Meds
81      	Cover Up
81      	Doctor Bird's
81      	Grain Train
81      	Carboload
81      	Squeaky Clean
82      	Elmer Inc
82      	Carboload
82      	Freezy Freeze
82      	Dairy Things
82      	Fries Frozen Foods
82      	Snack Me Up
82      	Meat and Stuff
82      	Deli Emporium
82      	Marty's Meds
82      	ACME
82      	Squeaky Clean
82      	Classified Cosmetics
82      	Scootie's Cleaning
82      	Doctor Bird's
82      	Dairy Time
82      	Clout Drinks
82      	Munchie Mash
82      	Cover Up
82      	Dole
82      	Atlantis Beverage
82      	Fresh Stuff
82      	Grain Train
83      	Marty's Meds
83      	Grain Train
83      	ACME
83      	Clout Drinks
83      	Munchie Mash
83      	Cover Up
83      	Atlantis Beverage
83      	Carboload
83      	Deli Emporium
83      	Classified Cosmetics
83      	Elmer Inc
83      	Snack Me Up
83      	Dairy Things
83      	Freezy Freeze
83      	Fries Frozen Foods
83      	Squeaky Clean
83      	Doctor Bird's
83      	Meat and Stuff
83      	Fresh Stuff
83      	Scootie's Cleaning
83      	Dole
83      	Dairy Time
84      	Snack Me Up
84      	Dole
84      	Carboload
84      	ACME
84      	Grain Train
84      	Squeaky Clean
84      	Marty's Meds
84      	Freezy Freeze
84      	Fresh Stuff
84      	Atlantis Beverage
84      	Elmer Inc
84      	Dairy Time
84      	Deli Emporium
84      	Fries Frozen Foods
84      	Meat and Stuff
85      	Dairy Time
85      	Dole
85      	Fries Frozen Foods
85      	Dairy Things
85      	Squeaky Clean
85      	Fresh Stuff
85      	Cover Up
85      	Elmer Inc
85      	Doctor Bird's
85      	Scootie's Cleaning
85      	Meat and Stuff
85      	Classified Cosmetics
85      	Freezy Freeze
85      	ACME
85      	Atlantis Beverage
85      	Carboload
85      	Grain Train
85      	Snack Me Up
85      	Clout Drinks
86      	Dairy Things
86      	Deli Emporium
86      	Elmer Inc
86      	Clout Drinks
86      	Doctor Bird's
86      	Dairy Time
86      	Grain Train
86      	Dole
86      	Classified Cosmetics
86      	Scootie's Cleaning
86      	Meat and Stuff
86      	Cover Up
86      	Atlantis Beverage
86      	Marty's Meds
86      	Fries Frozen Foods
86      	Snack Me Up
87      	ACME
87      	Fries Frozen Foods
87      	Dairy Things
87      	Doctor Bird's
87      	Elmer Inc
87      	Squeaky Clean
87      	Grain Train
87      	Snack Me Up
87      	Dole
87      	Fresh Stuff
87      	Cover Up
87      	Deli Emporium
87      	Classified Cosmetics
87      	Dairy Time
87      	Scootie's Cleaning
87      	Carboload
87      	Clout Drinks
87      	Atlantis Beverage
87      	Marty's Meds
87      	Munchie Mash
88      	Meat and Stuff
88      	Clout Drinks
88      	Dairy Time
88      	Snack Me Up
88      	Cover Up
88      	Grain Train
88      	Classified Cosmetics
88      	Scootie's Cleaning
88      	Squeaky Clean
88      	Dole
88      	Dairy Things
88      	Freezy Freeze
88      	Munchie Mash
88      	Carboload
88      	ACME
88      	Marty's Meds
88      	Elmer Inc
88      	Fries Frozen Foods
89      	ACME
89      	Classified Cosmetics
89      	Dairy Time
89      	Atlantis Beverage
89      	Clout Drinks
89      	Grain Train
89      	Dole
89      	Carboload
89      	Cover Up
89      	Marty's Meds
89      	Elmer Inc
89      	Doctor Bird's
89      	Squeaky Clean
89      	Fries Frozen Foods
89      	Meat and Stuff
89      	Munchie Mash
89      	Freezy Freeze
89      	Scootie's Cleaning
89      	Snack Me Up
89      	Deli Emporium
89      	Fresh Stuff
90      	Carboload
90      	Meat and Stuff
90      	Elmer Inc
90      	Fries Frozen Foods
90      	Freezy Freeze
90      	Scootie's Cleaning
90      	Classified Cosmetics
90      	ACME
90      	Marty's Meds
90      	Deli Emporium
90      	Fresh Stuff
90      	Dairy Things
90      	Squeaky Clean
90      	Atlantis Beverage
90      	Dole
90      	Doctor Bird's
90      	Munchie Mash
90      	Clout Drinks
90      	Grain Train
90      	Snack Me Up
90      	Dairy Time
91      	ACME
91      	Doctor Bird's
91      	Classified Cosmetics
91      	Deli Emporium
91      	Scootie's Cleaning
91      	Carboload
91      	Munchie Mash
91      	Dairy Time
91      	Clout Drinks
91      	Atlantis Beverage
91      	Squeaky Clean
91      	Elmer Inc
91      	Fresh Stuff
91      	Marty's Meds
91      	Freezy Freeze
91      	Cover Up
91      	Meat and Stuff
91      	Grain Train
91      	Snack Me Up
91      	Dairy Things
91      	Fries Frozen Foods
91      	Dole
92      	ACME
92      	Dairy Things
92      	Fries Frozen Foods
92      	Clout Drinks
92      	Scootie's Cleaning
92      	Dairy Time
92      	Grain Train
92      	Squeaky Clean
92      	Marty's Meds
92      	Elmer Inc
92      	Fresh Stuff
92      	Freezy Freeze
92      	Doctor Bird's
92      	Snack Me Up
92      	Classified Cosmetics
92      	Cover Up
92      	Meat and Stuff
92      	Dole
92      	Munchie Mash
92      	Carboload
93      	Clout Drinks
93      	Fries Frozen Foods
93      	Fresh Stuff
93      	Deli Emporium
93      	Marty's Meds
93      	Munchie Mash
93      	ACME
93      	Atlantis Beverage
93      	Cover Up
93      	Scootie's Cleaning
93      	Elmer Inc
93      	Snack Me Up
93      	Freezy Freeze
93      	Meat and Stuff
93      	Squeaky Clean
94      	Deli Emporium
94      	Doctor Bird's
94      	Dairy Time
94      	ACME
94      	Squeaky Clean
94      	Fresh Stuff
94      	Marty's Meds
94      	Scootie's Cleaning
94      	Carboload
94      	Grain Train
94      	Munchie Mash
94      	Dairy Things
94      	Dole
94      	Snack Me Up
94      	Atlantis Beverage
94      	Freezy Freeze
94      	Elmer Inc
95      	Grain Train
95      	Dairy Things
95      	Clout Drinks
95      	Marty's Meds
95      	Atlantis Beverage
95      	Fresh Stuff
95      	Squeaky Clean
95      	Deli Emporium
95      	Freezy Freeze
95      	Snack Me Up
95      	Munchie Mash
95      	Dairy Time
95      	Meat and Stuff
95      	Dole
95      	Fries Frozen Foods
95      	Cover Up
95      	Scootie's Cleaning
95      	Carboload
95      	ACME
95      	Classified Cosmetics
95      	Elmer Inc
96      	Munchie Mash
96      	Doctor Bird's
96      	Squeaky Clean
96      	Fresh Stuff
96      	Clout Drinks
96      	Dairy Time
96      	Atlantis Beverage
96      	Grain Train
96      	Dole
96      	Deli Emporium
96      	ACME
96      	Freezy Freeze
96      	Elmer Inc
96      	Classified Cosmetics
96      	Dairy Things
96      	Meat and Stuff
96      	Snack Me Up
96      	Scootie's Cleaning
96      	Marty's Meds
97      	Scootie's Cleaning
97      	ACME
97      	Fresh Stuff
97      	Freezy Freeze
97      	Doctor Bird's
97      	Clout Drinks
97      	Atlantis Beverage
97      	Dole
97      	Meat and Stuff
97      	Dairy Things
97      	Cover Up
97      	Munchie Mash
97      	Grain Train
97      	Carboload
97      	Fries Frozen Foods
97      	Dairy Time
97      	Deli Emporium
97      	Snack Me Up
98      	Freezy Freeze
98      	Grain Train
98      	Deli Emporium
98      	Snack Me Up
98      	Fresh Stuff
98      	Dairy Things
98      	Fries Frozen Foods
98      	Marty's Meds
98      	ACME
98      	Scootie's Cleaning
98      	Clout Drinks
98      	Doctor Bird's
98      	Elmer Inc
98      	Carboload
98      	Dairy Time
98      	Dole
98      	Atlantis Beverage
98      	Squeaky Clean
98      	Classified Cosmetics
99      	Elmer Inc
99      	Deli Emporium
99      	Fries Frozen Foods
99      	Dairy Time
99      	Dole
99      	ACME
99      	Dairy Things
99      	Classified Cosmetics
99      	Freezy Freeze
99      	Snack Me Up
99      	Fresh Stuff
99      	Grain Train
99      	Meat and Stuff
99      	Marty's Meds
99      	Clout Drinks
100     	Carboload
100     	Dairy Things
100     	Fries Frozen Foods
100     	Squeaky Clean
100     	Marty's Meds
100     	Elmer Inc
100     	Meat and Stuff
100     	Doctor Bird's
100     	Scootie's Cleaning
100     	Freezy Freeze
100     	Snack Me Up
100     	Munchie Mash
100     	Deli Emporium
100     	Dole
100     	Dairy Time
100     	Grain Train
100     	Clout Drinks
100     	ACME
100     	Cover Up
100     	Atlantis Beverage
100     	Classified Cosmetics
100     	Fresh Stuff
101     	Munchie Mash
101     	Meat and Stuff
101     	Clout Drinks
101     	Squeaky Clean
101     	Doctor Bird's
101     	Deli Emporium
101     	Carboload
101     	Dairy Things
101     	Elmer Inc
101     	Snack Me Up
101     	Marty's Meds
101     	Scootie's Cleaning
101     	Fresh Stuff
101     	Fries Frozen Foods
101     	Dairy Time
102     	Scootie's Cleaning
102     	Squeaky Clean
102     	Elmer Inc
102     	Classified Cosmetics
102     	Dairy Time
102     	Fries Frozen Foods
102     	Clout Drinks
102     	Carboload
102     	Munchie Mash
102     	Cover Up
102     	Freezy Freeze
102     	Dole
102     	Fresh Stuff
102     	Meat and Stuff
102     	Grain Train
102     	Dairy Things
102     	Doctor Bird's
102     	Deli Emporium
102     	Snack Me Up
103     	Squeaky Clean
103     	Clout Drinks
103     	Scootie's Cleaning
103     	Deli Emporium
103     	Dairy Time
103     	Carboload
103     	Munchie Mash
103     	Classified Cosmetics
103     	Dole
103     	Marty's Meds
103     	Fresh Stuff
103     	Fries Frozen Foods
103     	Grain Train
103     	Cover Up
103     	Meat and Stuff
103     	Elmer Inc
103     	Dairy Things
103     	ACME
104     	Deli Emporium
104     	Meat and Stuff
104     	Dairy Time
104     	Squeaky Clean
104     	Freezy Freeze
104     	Fries Frozen Foods
104     	Elmer Inc
104     	Carboload
104     	ACME
104     	Dole
104     	Atlantis Beverage
104     	Snack Me Up
104     	Grain Train
104     	Doctor Bird's
104     	Classified Cosmetics
104     	Dairy Things
104     	Marty's Meds
104     	Cover Up
104     	Clout Drinks
104     	Scootie's Cleaning
104     	Fresh Stuff
104     	Munchie Mash
105     	Dole
105     	Atlantis Beverage
105     	Elmer Inc
105     	ACME
105     	Dairy Things
105     	Classified Cosmetics
105     	Dairy Time
105     	Scootie's Cleaning
105     	Doctor Bird's
105     	Fresh Stuff
105     	Grain Train
105     	Munchie Mash
105     	Carboload
105     	Clout Drinks
105     	Freezy Freeze
106     	Clout Drinks
106     	Atlantis Beverage
106     	Dairy Things
106     	Elmer Inc
106     	Classified Cosmetics
106     	ACME
106     	Doctor Bird's
106     	Freezy Freeze
106     	Deli Emporium
106     	Grain Train
106     	Munchie Mash
106     	Scootie's Cleaning
106     	Dole
106     	Fries Frozen Foods
106     	Squeaky Clean
106     	Carboload
106     	Dairy Time
106     	Cover Up
106     	Fresh Stuff
107     	Fries Frozen Foods
107     	Marty's Meds
107     	Squeaky Clean
107     	Grain Train
107     	Scootie's Cleaning
107     	Carboload
107     	Elmer Inc
107     	Snack Me Up
107     	Deli Emporium
107     	Atlantis Beverage
107     	Cover Up
107     	Clout Drinks
107     	Dairy Time
107     	Dairy Things
107     	Dole
107     	Freezy Freeze
108     	Freezy Freeze
108     	Dole
108     	Scootie's Cleaning
108     	Munchie Mash
108     	Fresh Stuff
108     	Grain Train
108     	Classified Cosmetics
108     	Elmer Inc
108     	Marty's Meds
108     	Cover Up
108     	Snack Me Up
108     	Meat and Stuff
108     	Carboload
108     	Atlantis Beverage
108     	Clout Drinks
108     	ACME
108     	Deli Emporium
109     	Scootie's Cleaning
109     	Freezy Freeze
109     	Classified Cosmetics
109     	Deli Emporium
109     	Grain Train
109     	Carboload
109     	Fries Frozen Foods
109     	Snack Me Up
109     	Cover Up
109     	ACME
109     	Munchie Mash
109     	Dole
109     	Doctor Bird's
109     	Marty's Meds
109     	Dairy Time
109     	Elmer Inc
109     	Squeaky Clean
110     	Atlantis Beverage
110     	Scootie's Cleaning
110     	Classified Cosmetics
110     	ACME
110     	Freezy Freeze
110     	Squeaky Clean
110     	Grain Train
110     	Carboload
110     	Snack Me Up
110     	Marty's Meds
110     	Dairy Things
110     	Fries Frozen Foods
110     	Dairy Time
110     	Dole
110     	Clout Drinks
111     	Freezy Freeze
111     	Cover Up
111     	Doctor Bird's
111     	Atlantis Beverage
111     	Classified Cosmetics
111     	Fries Frozen Foods
111     	Marty's Meds
111     	Meat and Stuff
111     	Elmer Inc
111     	Dole
111     	Scootie's Cleaning
111     	Munchie Mash
111     	Clout Drinks
111     	Dairy Things
111     	Carboload
111     	ACME
111     	Squeaky Clean
112     	Doctor Bird's
112     	Scootie's Cleaning
112     	Munchie Mash
112     	Classified Cosmetics
112     	Fries Frozen Foods
112     	Deli Emporium
112     	Dole
112     	Dairy Time
112     	Dairy Things
112     	Clout Drinks
112     	Marty's Meds
112     	Grain Train
112     	Freezy Freeze
112     	ACME
112     	Squeaky Clean
112     	Cover Up
112     	Elmer Inc
112     	Atlantis Beverage
113     	Snack Me Up
113     	Dairy Time
113     	Fresh Stuff
113     	Classified Cosmetics
113     	Freezy Freeze
113     	Dairy Things
113     	Doctor Bird's
113     	Deli Emporium
113     	Dole
113     	Carboload
113     	Meat and Stuff
113     	Squeaky Clean
113     	Fries Frozen Foods
113     	Marty's Meds
113     	Elmer Inc
113     	Munchie Mash
113     	Scootie's Cleaning
113     	Clout Drinks
114     	Fresh Stuff
114     	Dairy Time
114     	Classified Cosmetics
114     	Atlantis Beverage
114     	Elmer Inc
114     	Scootie's Cleaning
114     	Clout Drinks
114     	Snack Me Up
114     	Grain Train
114     	Marty's Meds
114     	Doctor Bird's
114     	Squeaky Clean
114     	Fries Frozen Foods
114     	Meat and Stuff
114     	Carboload
114     	Dole
114     	ACME
114     	Deli Emporium
114     	Freezy Freeze
115     	Dole
115     	Classified Cosmetics
115     	Clout Drinks
115     	Fries Frozen Foods
115     	ACME
115     	Atlantis Beverage
115     	Doctor Bird's
115     	Cover Up
115     	Marty's Meds
115     	Snack Me Up
115     	Carboload
115     	Meat and Stuff
115     	Dairy Time
115     	Deli Emporium
115     	Grain Train
115     	Scootie's Cleaning
115     	Fresh Stuff
116     	Deli Emporium
116     	Doctor Bird's
116     	Atlantis Beverage
116     	Elmer Inc
116     	Marty's Meds
116     	Grain Train
116     	Carboload
116     	Clout Drinks
116     	Cover Up
116     	Scootie's Cleaning
116     	Dairy Things
116     	Classified Cosmetics
116     	Squeaky Clean
116     	Fries Frozen Foods
116     	ACME
117     	Freezy Freeze
117     	Elmer Inc
117     	Classified Cosmetics
117     	Meat and Stuff
117     	Carboload
117     	Doctor Bird's
117     	Deli Emporium
117     	Dairy Things
117     	Dole
117     	ACME
117     	Dairy Time
117     	Atlantis Beverage
117     	Squeaky Clean
117     	Fresh Stuff
117     	Marty's Meds
117     	Scootie's Cleaning
117     	Munchie Mash
117     	Snack Me Up
117     	Grain Train
117     	Clout Drinks
118     	Freezy Freeze
118     	Squeaky Clean
118     	Meat and Stuff
118     	Snack Me Up
118     	Fresh Stuff
118     	Deli Emporium
118     	Grain Train
118     	Dairy Time
118     	Dole
118     	Fries Frozen Foods
118     	Clout Drinks
118     	Dairy Things
118     	Atlantis Beverage
118     	Scootie's Cleaning
118     	ACME
118     	Marty's Meds
118     	Classified Cosmetics
119     	Atlantis Beverage
119     	Clout Drinks
119     	Snack Me Up
119     	Dole
119     	Deli Emporium
119     	Classified Cosmetics
119     	Fresh Stuff
119     	Munchie Mash
119     	Grain Train
119     	Meat and Stuff
119     	Squeaky Clean
119     	Dairy Time
119     	Fries Frozen Foods
119     	Cover Up
119     	Elmer Inc
119     	Freezy Freeze
119     	Scootie's Cleaning
119     	Dairy Things
119     	Carboload
119     	Marty's Meds
119     	ACME
119     	Doctor Bird's
120     	ACME
120     	Dole
120     	Fresh Stuff
120     	Scootie's Cleaning
120     	Elmer Inc
120     	Atlantis Beverage
120     	Marty's Meds
120     	Deli Emporium
120     	Dairy Time
120     	Classified Cosmetics
120     	Clout Drinks
120     	Munchie Mash
120     	Squeaky Clean
120     	Meat and Stuff
120     	Fries Frozen Foods
120     	Freezy Freeze
120     	Doctor Bird's
120     	Carboload
120     	Grain Train
120     	Cover Up
120     	Snack Me Up
121     	Snack Me Up
121     	Dairy Time
121     	Dairy Things
121     	Munchie Mash
121     	Fresh Stuff
121     	Deli Emporium
121     	Meat and Stuff
121     	Clout Drinks
121     	Marty's Meds
121     	Atlantis Beverage
121     	Doctor Bird's
121     	Elmer Inc
121     	Carboload
121     	ACME
121     	Fries Frozen Foods
121     	Cover Up
121     	Squeaky Clean
121     	Scootie's Cleaning
122     	Dairy Time
122     	Elmer Inc
122     	Clout Drinks
122     	Dairy Things
122     	Snack Me Up
122     	Deli Emporium
122     	Fries Frozen Foods
122     	Classified Cosmetics
122     	Grain Train
122     	Meat and Stuff
122     	Dole
122     	Atlantis Beverage
122     	Cover Up
122     	Freezy Freeze
122     	Squeaky Clean
122     	ACME
122     	Carboload
122     	Marty's Meds
122     	Munchie Mash
122     	Scootie's Cleaning
123     	Fries Frozen Foods
123     	Marty's Meds
123     	Clout Drinks
123     	Dole
123     	Squeaky Clean
123     	Deli Emporium
123     	Cover Up
123     	Meat and Stuff
123     	Carboload
123     	Doctor Bird's
123     	Classified Cosmetics
123     	Snack Me Up
123     	Munchie Mash
123     	Grain Train
123     	Elmer Inc
123     	Fresh Stuff
123     	Scootie's Cleaning
123     	Dairy Time
123     	ACME
123     	Dairy Things
123     	Atlantis Beverage
123     	Freezy Freeze
124     	Dairy Time
124     	Fries Frozen Foods
124     	Deli Emporium
124     	Doctor Bird's
124     	Elmer Inc
124     	Classified Cosmetics
124     	Dole
124     	Atlantis Beverage
124     	Munchie Mash
124     	Meat and Stuff
124     	Dairy Things
124     	Marty's Meds
124     	Carboload
124     	Grain Train
124     	Snack Me Up
124     	Squeaky Clean
124     	Scootie's Cleaning
124     	Cover Up
124     	Fresh Stuff
125     	Fresh Stuff
125     	ACME
125     	Classified Cosmetics
125     	Atlantis Beverage
125     	Deli Emporium
125     	Squeaky Clean
125     	Meat and Stuff
125     	Snack Me Up
125     	Dairy Things
125     	Freezy Freeze
125     	Doctor Bird's
125     	Marty's Meds
125     	Dole
125     	Carboload
125     	Cover Up
125     	Scootie's Cleaning
126     	ACME
126     	Freezy Freeze
126     	Fresh Stuff
126     	Doctor Bird's
126     	Deli Emporium
126     	Squeaky Clean
126     	Classified Cosmetics
126     	Scootie's Cleaning
126     	Clout Drinks
126     	Marty's Meds
126     	Fries Frozen Foods
126     	Dole
126     	Meat and Stuff
126     	Cover Up
126     	Dairy Things
126     	Snack Me Up
127     	Doctor Bird's
127     	Elmer Inc
127     	ACME
127     	Dairy Time
127     	Marty's Meds
127     	Atlantis Beverage
127     	Squeaky Clean
127     	Fresh Stuff
127     	Fries Frozen Foods
127     	Dairy Things
127     	Carboload
127     	Deli Emporium
127     	Clout Drinks
127     	Freezy Freeze
127     	Meat and Stuff
127     	Snack Me Up
127     	Grain Train
127     	Scootie's Cleaning
127     	Dole
127     	Cover Up
127     	Classified Cosmetics
128     	Squeaky Clean
128     	Cover Up
128     	Carboload
128     	Classified Cosmetics
128     	Marty's Meds
128     	Deli Emporium
128     	Dairy Time
128     	Fresh Stuff
128     	Elmer Inc
128     	Snack Me Up
128     	Meat and Stuff
128     	Scootie's Cleaning
128     	Doctor Bird's
128     	Grain Train
128     	Dairy Things
128     	Freezy Freeze
128     	ACME
128     	Clout Drinks
128     	Munchie Mash
128     	Atlantis Beverage
128     	Fries Frozen Foods
128     	Dole
129     	Snack Me Up
129     	Fries Frozen Foods
129     	Dole
129     	Classified Cosmetics
129     	Fresh Stuff
129     	Dairy Time
129     	Squeaky Clean
129     	Atlantis Beverage
129     	Scootie's Cleaning
129     	Marty's Meds
129     	Deli Emporium
129     	Doctor Bird's
129     	Munchie Mash
129     	Clout Drinks
129     	Meat and Stuff
129     	Cover Up
129     	Elmer Inc
129     	Freezy Freeze
130     	Dairy Things
130     	Munchie Mash
130     	Fresh Stuff
130     	ACME
130     	Dole
130     	Carboload
130     	Deli Emporium
130     	Clout Drinks
130     	Squeaky Clean
130     	Atlantis Beverage
130     	Grain Train
130     	Scootie's Cleaning
130     	Meat and Stuff
130     	Marty's Meds
130     	Fries Frozen Foods
130     	Classified Cosmetics
130     	Snack Me Up
131     	ACME
131     	Carboload
131     	Dairy Time
131     	Elmer Inc
131     	Scootie's Cleaning
131     	Meat and Stuff
131     	Marty's Meds
131     	Doctor Bird's
131     	Clout Drinks
131     	Grain Train
131     	Atlantis Beverage
131     	Freezy Freeze
131     	Munchie Mash
131     	Classified Cosmetics
131     	Dairy Things
131     	Fries Frozen Foods
131     	Fresh Stuff
132     	Meat and Stuff
132     	Carboload
132     	Doctor Bird's
132     	Atlantis Beverage
132     	Freezy Freeze
132     	Squeaky Clean
132     	Dairy Things
132     	Snack Me Up
132     	Grain Train
132     	Classified Cosmetics
132     	Deli Emporium
132     	ACME
132     	Fresh Stuff
132     	Clout Drinks
132     	Elmer Inc
132     	Dairy Time
132     	Scootie's Cleaning
132     	Marty's Meds
132     	Dole
132     	Munchie Mash
132     	Fries Frozen Foods
133     	Munchie Mash
133     	Snack Me Up
133     	Fresh Stuff
133     	Doctor Bird's
133     	Carboload
133     	Dairy Time
133     	Cover Up
133     	Clout Drinks
133     	Dairy Things
133     	Elmer Inc
133     	ACME
133     	Scootie's Cleaning
133     	Classified Cosmetics
133     	Marty's Meds
133     	Fries Frozen Foods
133     	Dole
133     	Grain Train
133     	Deli Emporium
133     	Squeaky Clean
133     	Meat and Stuff
134     	Dole
134     	Scootie's Cleaning
134     	Grain Train
134     	Dairy Things
134     	Carboload
134     	Deli Emporium
134     	Munchie Mash
134     	Cover Up
134     	Fresh Stuff
134     	ACME
134     	Elmer Inc
134     	Meat and Stuff
134     	Atlantis Beverage
134     	Clout Drinks
134     	Doctor Bird's
134     	Marty's Meds
134     	Snack Me Up
134     	Fries Frozen Foods
134     	Classified Cosmetics
134     	Dairy Time
134     	Freezy Freeze
134     	Squeaky Clean
135     	Dairy Time
135     	ACME
135     	Doctor Bird's
135     	Squeaky Clean
135     	Freezy Freeze
135     	Munchie Mash
135     	Clout Drinks
135     	Fries Frozen Foods
135     	Cover Up
135     	Carboload
135     	Elmer Inc
135     	Scootie's Cleaning
135     	Dairy Things
135     	Deli Emporium
135     	Atlantis Beverage
135     	Fresh Stuff
135     	Dole
135     	Classified Cosmetics
135     	Snack Me Up
135     	Meat and Stuff
135     	Marty's Meds
136     	Freezy Freeze
136     	Squeaky Clean
136     	Dole
136     	Fresh Stuff
136     	Deli Emporium
136     	Meat and Stuff
136     	Marty's Meds
136     	Dairy Things
136     	Carboload
136     	Snack Me Up
136     	Grain Train
136     	Dairy Time
136     	Munchie Mash
136     	Cover Up
136     	Fries Frozen Foods
136     	Atlantis Beverage
136     	Doctor Bird's
136     	Scootie's Cleaning
136     	Elmer Inc
136     	Clout Drinks
137     	Cover Up
137     	Squeaky Clean
137     	Carboload
137     	Classified Cosmetics
137     	Elmer Inc
137     	Fresh Stuff
137     	Scootie's Cleaning
137     	Clout Drinks
137     	Dole
137     	Marty's Meds
137     	Doctor Bird's
137     	Fries Frozen Foods
137     	Munchie Mash
137     	Freezy Freeze
137     	ACME
137     	Grain Train
137     	Snack Me Up
138     	ACME
138     	Elmer Inc
138     	Grain Train
138     	Clout Drinks
138     	Dairy Time
138     	Carboload
138     	Marty's Meds
138     	Deli Emporium
138     	Cover Up
138     	Dairy Things
138     	Munchie Mash
138     	Atlantis Beverage
138     	Dole
138     	Meat and Stuff
138     	Scootie's Cleaning
138     	Squeaky Clean
138     	Doctor Bird's
138     	Freezy Freeze
138     	Classified Cosmetics
138     	Fresh Stuff
138     	Snack Me Up
139     	Deli Emporium
139     	Cover Up
139     	Snack Me Up
139     	Meat and Stuff
139     	Grain Train
139     	Doctor Bird's
139     	Carboload
139     	Classified Cosmetics
139     	Munchie Mash
139     	Dairy Things
139     	Freezy Freeze
139     	Dairy Time
139     	Scootie's Cleaning
139     	Atlantis Beverage
139     	ACME
139     	Clout Drinks
139     	Fries Frozen Foods
139     	Squeaky Clean
139     	Fresh Stuff
140     	Scootie's Cleaning
140     	Fresh Stuff
140     	Deli Emporium
140     	Classified Cosmetics
140     	Snack Me Up
140     	Dairy Things
140     	Dole
140     	Doctor Bird's
140     	Atlantis Beverage
140     	Elmer Inc
140     	Carboload
140     	Freezy Freeze
140     	Marty's Meds
140     	Meat and Stuff
140     	Squeaky Clean
140     	Munchie Mash
140     	Fries Frozen Foods
140     	Cover Up
140     	Grain Train
140     	Dairy Time
140     	Clout Drinks
141     	Snack Me Up
141     	Deli Emporium
141     	Cover Up
141     	ACME
141     	Clout Drinks
141     	Grain Train
141     	Munchie Mash
141     	Fresh Stuff
141     	Dole
141     	Freezy Freeze
141     	Atlantis Beverage
141     	Classified Cosmetics
141     	Meat and Stuff
141     	Doctor Bird's
141     	Dairy Time
142     	Freezy Freeze
142     	Cover Up
142     	Deli Emporium
142     	Scootie's Cleaning
142     	Doctor Bird's
142     	Elmer Inc
142     	Dairy Things
142     	Meat and Stuff
142     	Clout Drinks
142     	Classified Cosmetics
142     	Grain Train
142     	Dole
142     	Marty's Meds
142     	Atlantis Beverage
142     	Fries Frozen Foods
142     	Dairy Time
142     	Fresh Stuff
142     	Snack Me Up
142     	Carboload
143     	ACME
143     	Cover Up
143     	Deli Emporium
143     	Scootie's Cleaning
143     	Meat and Stuff
143     	Dairy Things
143     	Doctor Bird's
143     	Carboload
143     	Classified Cosmetics
143     	Fries Frozen Foods
143     	Grain Train
143     	Elmer Inc
143     	Squeaky Clean
143     	Atlantis Beverage
143     	Marty's Meds
143     	Fresh Stuff
143     	Dairy Time
144     	Dole
144     	Fries Frozen Foods
144     	Squeaky Clean
144     	Cover Up
144     	Deli Emporium
144     	ACME
144     	Freezy Freeze
144     	Munchie Mash
144     	Classified Cosmetics
144     	Doctor Bird's
144     	Fresh Stuff
144     	Elmer Inc
144     	Atlantis Beverage
144     	Snack Me Up
144     	Marty's Meds
144     	Scootie's Cleaning
144     	Clout Drinks
145     	Squeaky Clean
145     	Clout Drinks
145     	Elmer Inc
145     	Atlantis Beverage
145     	Marty's Meds
145     	Grain Train
145     	Freezy Freeze
145     	Fries Frozen Foods
145     	Scootie's Cleaning
145     	Deli Emporium
145     	Dole
145     	Fresh Stuff
145     	Meat and Stuff
145     	Munchie Mash
145     	Snack Me Up
146     	Doctor Bird's
146     	Atlantis Beverage
146     	Fries Frozen Foods
146     	Clout Drinks
146     	ACME
146     	Snack Me Up
146     	Cover Up
146     	Marty's Meds
146     	Dole
146     	Dairy Things
146     	Freezy Freeze
146     	Squeaky Clean
146     	Dairy Time
146     	Deli Emporium
146     	Munchie Mash
146     	Fresh Stuff
146     	Meat and Stuff
146     	Classified Cosmetics
146     	Grain Train
146     	Scootie's Cleaning
147     	Cover Up
147     	Scootie's Cleaning
147     	Elmer Inc
147     	ACME
147     	Deli Emporium
147     	Dole
147     	Atlantis Beverage
147     	Carboload
147     	Dairy Things
147     	Squeaky Clean
147     	Doctor Bird's
147     	Marty's Meds
147     	Freezy Freeze
147     	Grain Train
147     	Fries Frozen Foods
147     	Meat and Stuff
147     	Classified Cosmetics
147     	Fresh Stuff
147     	Clout Drinks
148     	Scootie's Cleaning
148     	Munchie Mash
148     	Carboload
148     	Clout Drinks
148     	Freezy Freeze
148     	Atlantis Beverage
148     	Elmer Inc
148     	Meat and Stuff
148     	ACME
148     	Classified Cosmetics
148     	Fries Frozen Foods
148     	Grain Train
148     	Dairy Time
148     	Fresh Stuff
148     	Doctor Bird's
148     	Marty's Meds
148     	Cover Up
148     	Squeaky Clean
149     	Dairy Things
149     	Dairy Time
149     	Doctor Bird's
149     	Classified Cosmetics
149     	Clout Drinks
149     	Dole
149     	Meat and Stuff
149     	Fries Frozen Foods
149     	Cover Up
149     	Elmer Inc
149     	Carboload
149     	Grain Train
149     	Squeaky Clean
149     	Marty's Meds
149     	Freezy Freeze
149     	Snack Me Up
149     	Atlantis Beverage
149     	Fresh Stuff
149     	Deli Emporium
149     	Scootie's Cleaning
149     	ACME
149     	Munchie Mash
150     	Dole
150     	Atlantis Beverage
150     	Scootie's Cleaning
150     	Marty's Meds
150     	Cover Up
150     	ACME
150     	Dairy Things
150     	Dairy Time
150     	Elmer Inc
150     	Deli Emporium
150     	Grain Train
150     	Freezy Freeze
150     	Snack Me Up
150     	Fresh Stuff
150     	Classified Cosmetics
150     	Meat and Stuff
151     	Carboload
151     	Cover Up
151     	Scootie's Cleaning
151     	Fries Frozen Foods
151     	Grain Train
151     	ACME
151     	Doctor Bird's
151     	Marty's Meds
151     	Atlantis Beverage
151     	Deli Emporium
151     	Meat and Stuff
151     	Dole
151     	Dairy Time
151     	Munchie Mash
151     	Fresh Stuff
151     	Snack Me Up
151     	Squeaky Clean
151     	Elmer Inc
151     	Classified Cosmetics
152     	Munchie Mash
152     	Grain Train
152     	Fries Frozen Foods
152     	Snack Me Up
152     	Doctor Bird's
152     	Classified Cosmetics
152     	Deli Emporium
152     	Freezy Freeze
152     	Dairy Things
152     	Clout Drinks
152     	Dairy Time
152     	Meat and Stuff
152     	Squeaky Clean
152     	Cover Up
152     	Elmer Inc
152     	Scootie's Cleaning
152     	Fresh Stuff
153     	Dole
153     	Elmer Inc
153     	Scootie's Cleaning
153     	Meat and Stuff
153     	Grain Train
153     	Classified Cosmetics
153     	Fries Frozen Foods
153     	ACME
153     	Carboload
153     	Munchie Mash
153     	Dairy Time
153     	Squeaky Clean
153     	Snack Me Up
153     	Clout Drinks
153     	Deli Emporium
153     	Freezy Freeze
153     	Dairy Things
153     	Cover Up
153     	Marty's Meds
153     	Fresh Stuff
153     	Atlantis Beverage
153     	Doctor Bird's
154     	Snack Me Up
154     	Elmer Inc
154     	Classified Cosmetics
154     	Cover Up
154     	Grain Train
154     	Scootie's Cleaning
154     	Dairy Time
154     	Fresh Stuff
154     	Atlantis Beverage
154     	Dole
154     	Marty's Meds
154     	Deli Emporium
154     	ACME
154     	Squeaky Clean
154     	Clout Drinks
154     	Freezy Freeze
155     	Clout Drinks
155     	Munchie Mash
155     	Marty's Meds
155     	Fries Frozen Foods
155     	Deli Emporium
155     	Dairy Time
155     	Classified Cosmetics
155     	Scootie's Cleaning
155     	Grain Train
155     	Dole
155     	Snack Me Up
155     	Atlantis Beverage
155     	Doctor Bird's
155     	Meat and Stuff
155     	ACME
155     	Squeaky Clean
155     	Freezy Freeze
155     	Fresh Stuff
156     	Dairy Time
156     	Squeaky Clean
156     	Carboload
156     	Munchie Mash
156     	Clout Drinks
156     	Doctor Bird's
156     	Snack Me Up
156     	Meat and Stuff
156     	ACME
156     	Fries Frozen Foods
156     	Fresh Stuff
156     	Scootie's Cleaning
156     	Dole
156     	Dairy Things
156     	Atlantis Beverage
156     	Grain Train
156     	Classified Cosmetics
156     	Marty's Meds
157     	Freezy Freeze
157     	Elmer Inc
157     	ACME
157     	Munchie Mash
157     	Marty's Meds
157     	Scootie's Cleaning
157     	Squeaky Clean
157     	Dairy Time
157     	Meat and Stuff
157     	Clout Drinks
157     	Atlantis Beverage
157     	Fries Frozen Foods
157     	Deli Emporium
157     	Cover Up
157     	Fresh Stuff
157     	Snack Me Up
157     	Carboload
157     	Doctor Bird's
157     	Dole
157     	Classified Cosmetics
158     	Grain Train
158     	Deli Emporium
158     	Classified Cosmetics
158     	Dairy Time
158     	Scootie's Cleaning
158     	ACME
158     	Doctor Bird's
158     	Clout Drinks
158     	Carboload
158     	Cover Up
158     	Dole
158     	Dairy Things
158     	Marty's Meds
158     	Squeaky Clean
158     	Atlantis Beverage
158     	Elmer Inc
158     	Munchie Mash
158     	Fresh Stuff
158     	Meat and Stuff
158     	Fries Frozen Foods
158     	Snack Me Up
159     	ACME
159     	Deli Emporium
159     	Fresh Stuff
159     	Dole
159     	Clout Drinks
159     	Doctor Bird's
159     	Squeaky Clean
159     	Elmer Inc
159     	Cover Up
159     	Dairy Time
159     	Fries Frozen Foods
159     	Scootie's Cleaning
159     	Classified Cosmetics
159     	Snack Me Up
159     	Carboload
159     	Dairy Things
159     	Meat and Stuff
160     	Clout Drinks
160     	Fries Frozen Foods
160     	Doctor Bird's
160     	Deli Emporium
160     	Scootie's Cleaning
160     	Squeaky Clean
160     	Freezy Freeze
160     	Elmer Inc
160     	Fresh Stuff
160     	Carboload
160     	Marty's Meds
160     	Classified Cosmetics
160     	Cover Up
160     	Dairy Time
160     	Dole
160     	Dairy Things
160     	Meat and Stuff
160     	Snack Me Up
160     	ACME
160     	Atlantis Beverage
161     	Fries Frozen Foods
161     	Carboload
161     	Snack Me Up
161     	Clout Drinks
161     	Squeaky Clean
161     	Meat and Stuff
161     	Doctor Bird's
161     	Fresh Stuff
161     	Deli Emporium
161     	Grain Train
161     	Classified Cosmetics
161     	Munchie Mash
161     	Scootie's Cleaning
161     	Freezy Freeze
161     	ACME
161     	Marty's Meds
162     	Scootie's Cleaning
162     	Cover Up
162     	Freezy Freeze
162     	Dole
162     	Munchie Mash
162     	Atlantis Beverage
162     	Marty's Meds
162     	Classified Cosmetics
162     	Clout Drinks
162     	Snack Me Up
162     	Grain Train
162     	Squeaky Clean
162     	Fresh Stuff
162     	Doctor Bird's
162     	ACME
162     	Dairy Time
162     	Fries Frozen Foods
162     	Dairy Things
162     	Deli Emporium
162     	Meat and Stuff
162     	Elmer Inc
163     	Dole
163     	Freezy Freeze
163     	Fresh Stuff
163     	Dairy Things
163     	Snack Me Up
163     	Carboload
163     	Munchie Mash
163     	Marty's Meds
163     	Dairy Time
163     	Elmer Inc
163     	Doctor Bird's
163     	Grain Train
163     	Meat and Stuff
163     	Clout Drinks
163     	Classified Cosmetics
163     	ACME
163     	Scootie's Cleaning
163     	Fries Frozen Foods
163     	Squeaky Clean
163     	Deli Emporium
164     	Cover Up
164     	Squeaky Clean
164     	Scootie's Cleaning
164     	Carboload
164     	Dole
164     	Atlantis Beverage
164     	Dairy Things
164     	Fresh Stuff
164     	Meat and Stuff
164     	Fries Frozen Foods
164     	Clout Drinks
164     	Dairy Time
164     	Marty's Meds
164     	Snack Me Up
164     	Deli Emporium
164     	Freezy Freeze
164     	Munchie Mash
164     	Grain Train
164     	Classified Cosmetics
164     	Elmer Inc
164     	Doctor Bird's
164     	ACME
165     	Meat and Stuff
165     	Grain Train
165     	Marty's Meds
165     	Squeaky Clean
165     	Dairy Time
165     	ACME
165     	Elmer Inc
165     	Munchie Mash
165     	Clout Drinks
165     	Fresh Stuff
165     	Atlantis Beverage
165     	Carboload
165     	Classified Cosmetics
165     	Dole
165     	Snack Me Up
165     	Deli Emporium
166     	Doctor Bird's
166     	Carboload
166     	Dairy Things
166     	ACME
166     	Dole
166     	Freezy Freeze
166     	Clout Drinks
166     	Squeaky Clean
166     	Marty's Meds
166     	Fresh Stuff
166     	Dairy Time
166     	Elmer Inc
166     	Deli Emporium
166     	Classified Cosmetics
166     	Snack Me Up
166     	Cover Up
167     	Dairy Time
167     	Grain Train
167     	Carboload
167     	Freezy Freeze
167     	Scootie's Cleaning
167     	Marty's Meds
167     	Meat and Stuff
167     	Dairy Things
167     	Cover Up
167     	Squeaky Clean
167     	Dole
167     	Doctor Bird's
167     	Fries Frozen Foods
167     	Atlantis Beverage
167     	Snack Me Up
167     	Munchie Mash
167     	Classified Cosmetics
167     	Clout Drinks
167     	Fresh Stuff
167     	Elmer Inc
168     	Dairy Things
168     	Fresh Stuff
168     	ACME
168     	Atlantis Beverage
168     	Dairy Time
168     	Clout Drinks
168     	Carboload
168     	Deli Emporium
168     	Dole
168     	Cover Up
168     	Marty's Meds
168     	Elmer Inc
168     	Meat and Stuff
168     	Snack Me Up
168     	Munchie Mash
169     	Fries Frozen Foods
169     	Scootie's Cleaning
169     	Grain Train
169     	Deli Emporium
169     	Cover Up
169     	Snack Me Up
169     	Dole
169     	Marty's Meds
169     	Doctor Bird's
169     	Atlantis Beverage
169     	ACME
169     	Fresh Stuff
169     	Munchie Mash
169     	Clout Drinks
169     	Dairy Time
169     	Dairy Things
169     	Elmer Inc
169     	Carboload
169     	Freezy Freeze
170     	Marty's Meds
170     	Elmer Inc
170     	Freezy Freeze
170     	Deli Emporium
170     	Doctor Bird's
170     	Fries Frozen Foods
170     	Munchie Mash
170     	ACME
170     	Dole
170     	Cover Up
170     	Fresh Stuff
170     	Clout Drinks
170     	Squeaky Clean
170     	Dairy Things
170     	Classified Cosmetics
170     	Atlantis Beverage
170     	Scootie's Cleaning
170     	Dairy Time
171     	Atlantis Beverage
171     	Carboload
171     	Classified Cosmetics
171     	Clout Drinks
171     	Freezy Freeze
171     	Cover Up
171     	Snack Me Up
171     	Dairy Things
171     	Squeaky Clean
171     	Dole
171     	ACME
171     	Fries Frozen Foods
171     	Elmer Inc
171     	Meat and Stuff
171     	Doctor Bird's
172     	Dole
172     	Freezy Freeze
172     	Meat and Stuff
172     	Squeaky Clean
172     	Clout Drinks
172     	Atlantis Beverage
172     	Deli Emporium
172     	Fries Frozen Foods
172     	Doctor Bird's
172     	Munchie Mash
172     	Elmer Inc
172     	Fresh Stuff
172     	Snack Me Up
172     	Carboload
172     	Dairy Time
172     	Grain Train
172     	Cover Up
172     	Marty's Meds
172     	Dairy Things
172     	Scootie's Cleaning
173     	Clout Drinks
173     	Cover Up
173     	Atlantis Beverage
173     	Dole
173     	ACME
173     	Snack Me Up
173     	Fries Frozen Foods
173     	Elmer Inc
173     	Squeaky Clean
173     	Carboload
173     	Munchie Mash
173     	Doctor Bird's
173     	Fresh Stuff
173     	Dairy Time
173     	Classified Cosmetics
173     	Grain Train
173     	Scootie's Cleaning
173     	Dairy Things
173     	Deli Emporium
173     	Meat and Stuff
174     	Clout Drinks
174     	Squeaky Clean
174     	Snack Me Up
174     	Dairy Things
174     	Elmer Inc
174     	Classified Cosmetics
174     	Fries Frozen Foods
174     	Grain Train
174     	Scootie's Cleaning
174     	Cover Up
174     	Munchie Mash
174     	ACME
174     	Fresh Stuff
174     	Atlantis Beverage
174     	Dole
174     	Meat and Stuff
174     	Doctor Bird's
174     	Marty's Meds
174     	Deli Emporium
175     	Dairy Time
175     	Classified Cosmetics
175     	Grain Train
175     	Scootie's Cleaning
175     	Doctor Bird's
175     	Fresh Stuff
175     	Clout Drinks
175     	Munchie Mash
175     	Dole
175     	Marty's Meds
175     	Dairy Things
175     	Deli Emporium
175     	Meat and Stuff
175     	Squeaky Clean
175     	Fries Frozen Foods
175     	Freezy Freeze
175     	Elmer Inc
175     	Snack Me Up
175     	Atlantis Beverage
175     	Cover Up
175     	ACME
176     	Classified Cosmetics
176     	Carboload
176     	Cover Up
176     	Atlantis Beverage
176     	Marty's Meds
176     	Snack Me Up
176     	Dairy Time
176     	Meat and Stuff
176     	Munchie Mash
176     	Freezy Freeze
176     	Elmer Inc
176     	Grain Train
176     	Squeaky Clean
176     	Dole
176     	ACME
176     	Doctor Bird's
177     	Marty's Meds
177     	Munchie Mash
177     	Atlantis Beverage
177     	Meat and Stuff
177     	Fries Frozen Foods
177     	Squeaky Clean
177     	Cover Up
177     	Deli Emporium
177     	Dole
177     	Freezy Freeze
177     	Elmer Inc
177     	Carboload
177     	ACME
177     	Scootie's Cleaning
177     	Grain Train
178     	Meat and Stuff
178     	Classified Cosmetics
178     	Elmer Inc
178     	Fries Frozen Foods
178     	Grain Train
178     	Clout Drinks
178     	Snack Me Up
178     	Dairy Things
178     	ACME
178     	Squeaky Clean
178     	Cover Up
178     	Carboload
178     	Dole
178     	Atlantis Beverage
178     	Dairy Time
179     	Dairy Time
179     	Carboload
179     	Classified Cosmetics
179     	Fresh Stuff
179     	Dairy Things
179     	Munchie Mash
179     	Fries Frozen Foods
179     	Marty's Meds
179     	Deli Emporium
179     	Cover Up
179     	ACME
179     	Atlantis Beverage
179     	Meat and Stuff
179     	Elmer Inc
179     	Scootie's Cleaning
179     	Clout Drinks
179     	Dole
179     	Doctor Bird's
179     	Freezy Freeze
179     	Snack Me Up
179     	Grain Train
180     	Munchie Mash
180     	Deli Emporium
180     	Snack Me Up
180     	Marty's Meds
180     	Doctor Bird's
180     	Scootie's Cleaning
180     	Classified Cosmetics
180     	Grain Train
180     	Dairy Time
180     	Carboload
180     	Meat and Stuff
180     	Fries Frozen Foods
180     	Atlantis Beverage
180     	Freezy Freeze
180     	Elmer Inc
180     	Dole
180     	Clout Drinks
180     	ACME
180     	Cover Up
181     	Squeaky Clean
181     	Dairy Things
181     	Elmer Inc
181     	ACME
181     	Fries Frozen Foods
181     	Grain Train
181     	Meat and Stuff
181     	Clout Drinks
181     	Snack Me Up
181     	Fresh Stuff
181     	Scootie's Cleaning
181     	Dole
181     	Deli Emporium
181     	Freezy Freeze
181     	Marty's Meds
181     	Classified Cosmetics
181     	Cover Up
181     	Atlantis Beverage
181     	Dairy Time
181     	Doctor Bird's
182     	Classified Cosmetics
182     	Squeaky Clean
182     	Atlantis Beverage
182     	Scootie's Cleaning
182     	Elmer Inc
182     	Munchie Mash
182     	Dole
182     	Meat and Stuff
182     	Doctor Bird's
182     	Dairy Things
182     	Grain Train
182     	Freezy Freeze
182     	Snack Me Up
182     	Deli Emporium
182     	Marty's Meds
182     	Dairy Time
182     	Carboload
183     	Dairy Time
183     	Atlantis Beverage
183     	Elmer Inc
183     	Snack Me Up
183     	Dairy Things
183     	Dole
183     	Munchie Mash
183     	Classified Cosmetics
183     	Cover Up
183     	Marty's Meds
183     	Fries Frozen Foods
183     	Carboload
183     	Deli Emporium
183     	ACME
183     	Fresh Stuff
183     	Scootie's Cleaning
183     	Meat and Stuff
183     	Doctor Bird's
183     	Clout Drinks
183     	Squeaky Clean
183     	Freezy Freeze
183     	Grain Train
184     	Classified Cosmetics
184     	Scootie's Cleaning
184     	Clout Drinks
184     	Grain Train
184     	Fresh Stuff
184     	Squeaky Clean
184     	Fries Frozen Foods
184     	Dairy Time
184     	Elmer Inc
184     	Cover Up
184     	Dole
184     	ACME
184     	Meat and Stuff
184     	Marty's Meds
184     	Freezy Freeze
184     	Doctor Bird's
184     	Snack Me Up
184     	Deli Emporium
184     	Dairy Things
184     	Atlantis Beverage
185     	Doctor Bird's
185     	Elmer Inc
185     	Munchie Mash
185     	Fries Frozen Foods
185     	Snack Me Up
185     	Cover Up
185     	Carboload
185     	Deli Emporium
185     	Freezy Freeze
185     	Meat and Stuff
185     	Squeaky Clean
185     	ACME
185     	Grain Train
185     	Marty's Meds
185     	Atlantis Beverage
185     	Dairy Things
185     	Fresh Stuff
185     	Clout Drinks
185     	Dairy Time
185     	Scootie's Cleaning
186     	Grain Train
186     	ACME
186     	Elmer Inc
186     	Meat and Stuff
186     	Deli Emporium
186     	Marty's Meds
186     	Cover Up
186     	Snack Me Up
186     	Atlantis Beverage
186     	Dairy Time
186     	Scootie's Cleaning
186     	Clout Drinks
186     	Dairy Things
186     	Classified Cosmetics
186     	Doctor Bird's
186     	Squeaky Clean
186     	Fresh Stuff
186     	Carboload
186     	Freezy Freeze
187     	Meat and Stuff
187     	Atlantis Beverage
187     	Squeaky Clean
187     	Dole
187     	Deli Emporium
187     	Dairy Things
187     	Marty's Meds
187     	Scootie's Cleaning
187     	Classified Cosmetics
187     	Snack Me Up
187     	Freezy Freeze
187     	Clout Drinks
187     	Elmer Inc
187     	Doctor Bird's
187     	Carboload
187     	Fries Frozen Foods
187     	Dairy Time
187     	Cover Up
187     	Grain Train
187     	Fresh Stuff
187     	Munchie Mash
187     	ACME
188     	Freezy Freeze
188     	Dole
188     	Meat and Stuff
188     	Grain Train
188     	Fresh Stuff
188     	Squeaky Clean
188     	Atlantis Beverage
188     	ACME
188     	Scootie's Cleaning
188     	Doctor Bird's
188     	Cover Up
188     	Fries Frozen Foods
188     	Deli Emporium
188     	Snack Me Up
188     	Dairy Things
188     	Classified Cosmetics
188     	Carboload
188     	Elmer Inc
188     	Marty's Meds
188     	Clout Drinks
188     	Munchie Mash
188     	Dairy Time
189     	Deli Emporium
189     	Freezy Freeze
189     	Fries Frozen Foods
189     	Carboload
189     	Doctor Bird's
189     	Meat and Stuff
189     	Fresh Stuff
189     	Dairy Time
189     	Grain Train
189     	Dairy Things
189     	Dole
189     	Marty's Meds
189     	ACME
189     	Munchie Mash
189     	Squeaky Clean
189     	Snack Me Up
189     	Atlantis Beverage
189     	Elmer Inc
189     	Scootie's Cleaning
189     	Clout Drinks
189     	Classified Cosmetics
189     	Cover Up
190     	Deli Emporium
190     	Carboload
190     	Classified Cosmetics
190     	Clout Drinks
190     	Doctor Bird's
190     	Snack Me Up
190     	Cover Up
190     	Atlantis Beverage
190     	Dairy Time
190     	Munchie Mash
190     	ACME
190     	Fries Frozen Foods
190     	Fresh Stuff
190     	Meat and Stuff
190     	Freezy Freeze
190     	Marty's Meds
190     	Dairy Things
190     	Elmer Inc
190     	Grain Train
190     	Scootie's Cleaning
190     	Dole
190     	Squeaky Clean
191     	Atlantis Beverage
191     	Elmer Inc
191     	Deli Emporium
191     	Marty's Meds
191     	Dole
191     	Classified Cosmetics
191     	Doctor Bird's
191     	Squeaky Clean
191     	Scootie's Cleaning
191     	Dairy Time
191     	Fresh Stuff
191     	Meat and Stuff
191     	Munchie Mash
191     	Fries Frozen Foods
191     	ACME
191     	Clout Drinks
191     	Carboload
191     	Grain Train
191     	Freezy Freeze
191     	Snack Me Up
191     	Cover Up
191     	Dairy Things
192     	Clout Drinks
192     	Elmer Inc
192     	Fries Frozen Foods
192     	Deli Emporium
192     	Dole
192     	Classified Cosmetics
192     	ACME
192     	Freezy Freeze
192     	Meat and Stuff
192     	Atlantis Beverage
192     	Munchie Mash
192     	Squeaky Clean
192     	Dairy Things
192     	Dairy Time
192     	Marty's Meds
192     	Doctor Bird's
193     	Atlantis Beverage
193     	ACME
193     	Munchie Mash
193     	Freezy Freeze
193     	Deli Emporium
193     	Squeaky Clean
193     	Scootie's Cleaning
193     	Snack Me Up
193     	Dole
193     	Carboload
193     	Grain Train
193     	Clout Drinks
193     	Dairy Things
193     	Doctor Bird's
193     	Fries Frozen Foods
193     	Classified Cosmetics
193     	Meat and Stuff
193     	Fresh Stuff
193     	Dairy Time
193     	Marty's Meds
193     	Elmer Inc
194     	Meat and Stuff
194     	Fries Frozen Foods
194     	Cover Up
194     	Elmer Inc
194     	Grain Train
194     	Classified Cosmetics
194     	Squeaky Clean
194     	Deli Emporium
194     	Scootie's Cleaning
194     	Clout Drinks
194     	Munchie Mash
194     	Doctor Bird's
194     	Freezy Freeze
194     	Snack Me Up
194     	Atlantis Beverage
195     	Doctor Bird's
195     	Fresh Stuff
195     	Scootie's Cleaning
195     	Snack Me Up
195     	Meat and Stuff
195     	Atlantis Beverage
195     	Munchie Mash
195     	Dairy Time
195     	Fries Frozen Foods
195     	Grain Train
195     	Dairy Things
195     	Marty's Meds
195     	Clout Drinks
195     	Squeaky Clean
195     	Classified Cosmetics
195     	Dole
196     	Fresh Stuff
196     	Snack Me Up
196     	Marty's Meds
196     	ACME
196     	Dairy Time
196     	Classified Cosmetics
196     	Freezy Freeze
196     	Atlantis Beverage
196     	Elmer Inc
196     	Fries Frozen Foods
196     	Munchie Mash
196     	Squeaky Clean
196     	Clout Drinks
196     	Cover Up
196     	Carboload
196     	Meat and Stuff
196     	Doctor Bird's
196     	Dole
197     	Classified Cosmetics
197     	Squeaky Clean
197     	Grain Train
197     	Snack Me Up
197     	Carboload
197     	Deli Emporium
197     	Atlantis Beverage
197     	Freezy Freeze
197     	ACME
197     	Fries Frozen Foods
197     	Scootie's Cleaning
197     	Meat and Stuff
197     	Elmer Inc
197     	Munchie Mash
197     	Dairy Time
197     	Dole
197     	Fresh Stuff
198     	Squeaky Clean
198     	Dairy Time
198     	Doctor Bird's
198     	Marty's Meds
198     	Carboload
198     	Munchie Mash
198     	Grain Train
198     	Fresh Stuff
198     	Classified Cosmetics
198     	Elmer Inc
198     	Scootie's Cleaning
198     	Deli Emporium
198     	ACME
198     	Meat and Stuff
198     	Freezy Freeze
198     	Clout Drinks
198     	Snack Me Up
198     	Atlantis Beverage
198     	Fries Frozen Foods
198     	Cover Up
198     	Dairy Things
198     	Dole
199     	Dairy Time
199     	Classified Cosmetics
199     	Elmer Inc
199     	Snack Me Up
199     	Munchie Mash
199     	Carboload
199     	Clout Drinks
199     	Scootie's Cleaning
199     	Deli Emporium
199     	Fresh Stuff
199     	Fries Frozen Foods
199     	Doctor Bird's
199     	Grain Train
199     	Cover Up
199     	Dole
199     	Atlantis Beverage
199     	Dairy Things
199     	Meat and Stuff
200     	Clout Drinks
200     	Elmer Inc
200     	Dole
200     	Grain Train
200     	Scootie's Cleaning
200     	Munchie Mash
200     	Fries Frozen Foods
200     	ACME
200     	Atlantis Beverage
200     	Squeaky Clean
200     	Fresh Stuff
200     	Deli Emporium
200     	Doctor Bird's
200     	Dairy Things
200     	Snack Me Up
200     	Classified Cosmetics
200     	Carboload
200     	Cover Up
200     	Dairy Time
200     	Meat and Stuff
201     	Classified Cosmetics
201     	Freezy Freeze
201     	Squeaky Clean
201     	Munchie Mash
201     	Doctor Bird's
201     	ACME
201     	Carboload
201     	Scootie's Cleaning
201     	Dairy Time
201     	Grain Train
201     	Deli Emporium
201     	Fries Frozen Foods
201     	Snack Me Up
201     	Dole
201     	Fresh Stuff
201     	Meat and Stuff
201     	Atlantis Beverage
201     	Marty's Meds
201     	Dairy Things
201     	Clout Drinks
201     	Cover Up
202     	Carboload
202     	Elmer Inc
202     	Dole
202     	Dairy Time
202     	Freezy Freeze
202     	ACME
202     	Squeaky Clean
202     	Dairy Things
202     	Scootie's Cleaning
202     	Fries Frozen Foods
202     	Munchie Mash
202     	Fresh Stuff
202     	Doctor Bird's
202     	Atlantis Beverage
202     	Cover Up
202     	Classified Cosmetics
202     	Snack Me Up
202     	Deli Emporium
202     	Grain Train
202     	Marty's Meds
202     	Clout Drinks
203     	Fresh Stuff
203     	Dairy Time
203     	Fries Frozen Foods
203     	ACME
203     	Clout Drinks
203     	Classified Cosmetics
203     	Meat and Stuff
203     	Dairy Things
203     	Squeaky Clean
203     	Grain Train
203     	Elmer Inc
203     	Carboload
203     	Freezy Freeze
203     	Snack Me Up
203     	Atlantis Beverage
203     	Marty's Meds
204     	Munchie Mash
204     	Squeaky Clean
204     	Dairy Things
204     	Dole
204     	Cover Up
204     	Dairy Time
204     	Fries Frozen Foods
204     	Fresh Stuff
204     	Snack Me Up
204     	Atlantis Beverage
204     	Elmer Inc
204     	Classified Cosmetics
204     	Marty's Meds
204     	Clout Drinks
204     	Carboload
205     	Scootie's Cleaning
205     	Dole
205     	Dairy Time
205     	Freezy Freeze
205     	Doctor Bird's
205     	Fresh Stuff
205     	Marty's Meds
205     	Cover Up
205     	Squeaky Clean
205     	Grain Train
205     	Elmer Inc
205     	Atlantis Beverage
205     	Munchie Mash
205     	Deli Emporium
205     	Clout Drinks
205     	Carboload
205     	Classified Cosmetics
205     	ACME
205     	Dairy Things
206     	Munchie Mash
206     	Snack Me Up
206     	Grain Train
206     	Dole
206     	Freezy Freeze
206     	Dairy Time
206     	Fries Frozen Foods
206     	Classified Cosmetics
206     	Clout Drinks
206     	Deli Emporium
206     	Marty's Meds
206     	Scootie's Cleaning
206     	Cover Up
206     	Carboload
206     	Doctor Bird's
206     	Squeaky Clean
206     	Atlantis Beverage
207     	Munchie Mash
207     	Marty's Meds
207     	Clout Drinks
207     	Dairy Things
207     	Classified Cosmetics
207     	Scootie's Cleaning
207     	Carboload
207     	Elmer Inc
207     	Dairy Time
207     	Meat and Stuff
207     	Fries Frozen Foods
207     	Grain Train
207     	ACME
207     	Deli Emporium
207     	Snack Me Up
207     	Cover Up
207     	Doctor Bird's
207     	Atlantis Beverage
207     	Freezy Freeze
208     	Fries Frozen Foods
208     	Dairy Things
208     	Meat and Stuff
208     	Doctor Bird's
208     	Fresh Stuff
208     	ACME
208     	Snack Me Up
208     	Marty's Meds
208     	Grain Train
208     	Munchie Mash
208     	Carboload
208     	Cover Up
208     	Scootie's Cleaning
208     	Classified Cosmetics
208     	Squeaky Clean
209     	Meat and Stuff
209     	Grain Train
209     	Classified Cosmetics
209     	Carboload
209     	Freezy Freeze
209     	Atlantis Beverage
209     	Munchie Mash
209     	Dairy Things
209     	Fresh Stuff
209     	Dairy Time
209     	Dole
209     	Scootie's Cleaning
209     	Marty's Meds
209     	Clout Drinks
209     	Doctor Bird's
209     	Deli Emporium
209     	ACME
209     	Squeaky Clean
209     	Elmer Inc
210     	Freezy Freeze
210     	Classified Cosmetics
210     	Scootie's Cleaning
210     	Doctor Bird's
210     	ACME
210     	Munchie Mash
210     	Cover Up
210     	Clout Drinks
210     	Squeaky Clean
210     	Dairy Time
210     	Fresh Stuff
210     	Atlantis Beverage
210     	Snack Me Up
210     	Elmer Inc
210     	Carboload
210     	Dairy Things
210     	Marty's Meds
210     	Meat and Stuff
211     	Grain Train
211     	Fries Frozen Foods
211     	Meat and Stuff
211     	Clout Drinks
211     	Squeaky Clean
211     	Doctor Bird's
211     	Marty's Meds
211     	Carboload
211     	Cover Up
211     	ACME
211     	Elmer Inc
211     	Dairy Things
211     	Freezy Freeze
211     	Deli Emporium
211     	Classified Cosmetics
212     	Atlantis Beverage
212     	Classified Cosmetics
212     	Fries Frozen Foods
212     	Meat and Stuff
212     	Doctor Bird's
212     	ACME
212     	Scootie's Cleaning
212     	Dairy Time
212     	Marty's Meds
212     	Dole
212     	Freezy Freeze
212     	Deli Emporium
212     	Cover Up
212     	Grain Train
212     	Fresh Stuff
212     	Elmer Inc
212     	Squeaky Clean
212     	Dairy Things
212     	Carboload
212     	Snack Me Up
213     	Elmer Inc
213     	Clout Drinks
213     	Grain Train
213     	Deli Emporium
213     	Dairy Things
213     	Marty's Meds
213     	Dole
213     	Fresh Stuff
213     	Fries Frozen Foods
213     	Munchie Mash
213     	ACME
213     	Snack Me Up
213     	Dairy Time
213     	Scootie's Cleaning
213     	Classified Cosmetics
213     	Doctor Bird's
213     	Carboload
213     	Atlantis Beverage
214     	Clout Drinks
214     	Carboload
214     	Snack Me Up
214     	Dairy Things
214     	Grain Train
214     	Deli Emporium
214     	Fresh Stuff
214     	Classified Cosmetics
214     	Squeaky Clean
214     	ACME
214     	Freezy Freeze
214     	Meat and Stuff
214     	Doctor Bird's
214     	Dairy Time
214     	Cover Up
214     	Scootie's Cleaning
215     	Freezy Freeze
215     	Snack Me Up
215     	Cover Up
215     	Clout Drinks
215     	Fries Frozen Foods
215     	Fresh Stuff
215     	Squeaky Clean
215     	Scootie's Cleaning
215     	Atlantis Beverage
215     	Dairy Things
215     	Meat and Stuff
215     	Deli Emporium
215     	Classified Cosmetics
215     	Elmer Inc
215     	Doctor Bird's
215     	Dole
215     	Munchie Mash
215     	Marty's Meds
215     	ACME
216     	Freezy Freeze
216     	Marty's Meds
216     	Fresh Stuff
216     	Fries Frozen Foods
216     	Classified Cosmetics
216     	Dairy Time
216     	Munchie Mash
216     	Snack Me Up
216     	Meat and Stuff
216     	Cover Up
216     	Clout Drinks
216     	Squeaky Clean
216     	Deli Emporium
216     	Scootie's Cleaning
216     	Elmer Inc
216     	Doctor Bird's
217     	Cover Up
217     	Dole
217     	Fries Frozen Foods
217     	Deli Emporium
217     	Munchie Mash
217     	Freezy Freeze
217     	Marty's Meds
217     	Squeaky Clean
217     	Elmer Inc
217     	Dairy Time
217     	Dairy Things
217     	Clout Drinks
217     	Fresh Stuff
217     	Doctor Bird's
217     	Scootie's Cleaning
217     	Atlantis Beverage
217     	Snack Me Up
217     	Grain Train
217     	ACME
217     	Classified Cosmetics
217     	Meat and Stuff
217     	Carboload
218     	Doctor Bird's
218     	Munchie Mash
218     	Carboload
218     	Elmer Inc
218     	Cover Up
218     	Grain Train
218     	Squeaky Clean
218     	Fries Frozen Foods
218     	Snack Me Up
218     	Dairy Time
218     	Dairy Things
218     	ACME
218     	Freezy Freeze
218     	Scootie's Cleaning
218     	Meat and Stuff
218     	Clout Drinks
219     	Meat and Stuff
219     	Carboload
219     	Scootie's Cleaning
219     	Fries Frozen Foods
219     	Fresh Stuff
219     	Dole
219     	Elmer Inc
219     	ACME
219     	Classified Cosmetics
219     	Grain Train
219     	Munchie Mash
219     	Snack Me Up
219     	Dairy Things
219     	Atlantis Beverage
219     	Deli Emporium
219     	Cover Up
220     	Munchie Mash
220     	Atlantis Beverage
220     	Classified Cosmetics
220     	Snack Me Up
220     	Fries Frozen Foods
220     	Doctor Bird's
220     	Dairy Things
220     	Cover Up
220     	Elmer Inc
220     	Dole
220     	Fresh Stuff
220     	Marty's Meds
220     	Deli Emporium
220     	Freezy Freeze
220     	Dairy Time
220     	Carboload
220     	Meat and Stuff
221     	Squeaky Clean
221     	Elmer Inc
221     	Atlantis Beverage
221     	Meat and Stuff
221     	Clout Drinks
221     	Grain Train
221     	Freezy Freeze
221     	Deli Emporium
221     	Snack Me Up
221     	Carboload
221     	Fries Frozen Foods
221     	Dole
221     	Cover Up
221     	Marty's Meds
221     	Scootie's Cleaning
222     	Dairy Time
222     	ACME
222     	Clout Drinks
222     	Scootie's Cleaning
222     	Snack Me Up
222     	Deli Emporium
222     	Fresh Stuff
222     	Dole
222     	Atlantis Beverage
222     	Classified Cosmetics
222     	Squeaky Clean
222     	Cover Up
222     	Dairy Things
222     	Grain Train
222     	Doctor Bird's
223     	Dole
223     	Dairy Things
223     	Squeaky Clean
223     	Fresh Stuff
223     	Grain Train
223     	Munchie Mash
223     	Elmer Inc
223     	Fries Frozen Foods
223     	Freezy Freeze
223     	Carboload
223     	Clout Drinks
223     	Deli Emporium
223     	Meat and Stuff
223     	Classified Cosmetics
223     	Atlantis Beverage
223     	Snack Me Up
223     	Dairy Time
223     	Marty's Meds
224     	ACME
224     	Fresh Stuff
224     	Doctor Bird's
224     	Freezy Freeze
224     	Classified Cosmetics
224     	Clout Drinks
224     	Marty's Meds
224     	Scootie's Cleaning
224     	Deli Emporium
224     	Carboload
224     	Elmer Inc
224     	Dairy Things
224     	Dairy Time
224     	Munchie Mash
224     	Snack Me Up
224     	Squeaky Clean
224     	Cover Up
224     	Meat and Stuff
225     	Carboload
225     	Classified Cosmetics
225     	Atlantis Beverage
225     	Snack Me Up
225     	Dole
225     	Cover Up
225     	Fries Frozen Foods
225     	Freezy Freeze
225     	Fresh Stuff
225     	Squeaky Clean
225     	Clout Drinks
225     	Elmer Inc
225     	Meat and Stuff
225     	Dairy Things
225     	Marty's Meds
226     	Dairy Time
226     	Dole
226     	Freezy Freeze
226     	Dairy Things
226     	Deli Emporium
226     	Atlantis Beverage
226     	Grain Train
226     	Squeaky Clean
226     	Snack Me Up
226     	Clout Drinks
226     	ACME
226     	Meat and Stuff
226     	Scootie's Cleaning
226     	Fries Frozen Foods
226     	Elmer Inc
226     	Munchie Mash
226     	Carboload
226     	Cover Up
226     	Fresh Stuff
226     	Marty's Meds
226     	Classified Cosmetics
227     	Doctor Bird's
227     	Munchie Mash
227     	Grain Train
227     	Deli Emporium
227     	Atlantis Beverage
227     	Clout Drinks
227     	ACME
227     	Squeaky Clean
227     	Dairy Things
227     	Cover Up
227     	Meat and Stuff
227     	Fries Frozen Foods
227     	Fresh Stuff
227     	Freezy Freeze
227     	Snack Me Up
227     	Carboload
227     	Dole
227     	Marty's Meds
227     	Elmer Inc
227     	Dairy Time
228     	Cover Up
228     	Munchie Mash
228     	Clout Drinks
228     	Classified Cosmetics
228     	Scootie's Cleaning
228     	Dairy Things
228     	Meat and Stuff
228     	Freezy Freeze
228     	Snack Me Up
228     	Squeaky Clean
228     	Deli Emporium
228     	Marty's Meds
228     	Dairy Time
228     	Atlantis Beverage
228     	Doctor Bird's
228     	Carboload
229     	Doctor Bird's
229     	Munchie Mash
229     	Meat and Stuff
229     	Marty's Meds
229     	Freezy Freeze
229     	Cover Up
229     	Fresh Stuff
229     	Classified Cosmetics
229     	Clout Drinks
229     	Squeaky Clean
229     	ACME
229     	Dairy Time
229     	Grain Train
229     	Scootie's Cleaning
229     	Fries Frozen Foods
230     	Fries Frozen Foods
230     	Atlantis Beverage
230     	Fresh Stuff
230     	Dairy Things
230     	Meat and Stuff
230     	Elmer Inc
230     	Carboload
230     	Grain Train
230     	Snack Me Up
230     	Cover Up
230     	Dairy Time
230     	Dole
230     	Classified Cosmetics
230     	Munchie Mash
230     	Squeaky Clean
230     	Freezy Freeze
230     	ACME
230     	Deli Emporium
230     	Doctor Bird's
231     	Carboload
231     	Atlantis Beverage
231     	Dole
231     	Freezy Freeze
231     	Doctor Bird's
231     	Clout Drinks
231     	Munchie Mash
231     	Snack Me Up
231     	Scootie's Cleaning
231     	Marty's Meds
231     	Classified Cosmetics
231     	Fresh Stuff
231     	Deli Emporium
231     	Dairy Time
231     	Meat and Stuff
231     	Elmer Inc
231     	Fries Frozen Foods
231     	Squeaky Clean
231     	Cover Up
231     	Grain Train
231     	ACME
232     	Squeaky Clean
232     	Dairy Time
232     	Marty's Meds
232     	Elmer Inc
232     	Dole
232     	Snack Me Up
232     	Fries Frozen Foods
232     	Cover Up
232     	Dairy Things
232     	Munchie Mash
232     	Atlantis Beverage
232     	Scootie's Cleaning
232     	Fresh Stuff
232     	Freezy Freeze
232     	Grain Train
232     	Deli Emporium
232     	Clout Drinks
232     	ACME
232     	Carboload
232     	Classified Cosmetics
233     	Fries Frozen Foods
233     	Scootie's Cleaning
233     	Squeaky Clean
233     	Deli Emporium
233     	Munchie Mash
233     	ACME
233     	Dairy Things
233     	Clout Drinks
233     	Atlantis Beverage
233     	Meat and Stuff
233     	Cover Up
233     	Marty's Meds
233     	Fresh Stuff
233     	Classified Cosmetics
233     	Dairy Time
233     	Grain Train
233     	Elmer Inc
233     	Dole
233     	Doctor Bird's
233     	Carboload
234     	Classified Cosmetics
234     	Dairy Things
234     	Freezy Freeze
234     	Scootie's Cleaning
234     	Elmer Inc
234     	Fresh Stuff
234     	Clout Drinks
234     	Cover Up
234     	Munchie Mash
234     	Grain Train
234     	Dairy Time
234     	Dole
234     	Atlantis Beverage
234     	Squeaky Clean
234     	Doctor Bird's
234     	Snack Me Up
234     	Meat and Stuff
235     	Freezy Freeze
235     	Carboload
235     	Squeaky Clean
235     	Scootie's Cleaning
235     	Munchie Mash
235     	Grain Train
235     	Atlantis Beverage
235     	Deli Emporium
235     	Fries Frozen Foods
235     	Clout Drinks
235     	Dairy Things
235     	Fresh Stuff
235     	Doctor Bird's
235     	Cover Up
235     	Dairy Time
236     	Freezy Freeze
236     	Dole
236     	Deli Emporium
236     	Squeaky Clean
236     	Grain Train
236     	Classified Cosmetics
236     	Fresh Stuff
236     	Atlantis Beverage
236     	Munchie Mash
236     	Meat and Stuff
236     	Carboload
236     	Fries Frozen Foods
236     	Dairy Time
236     	Elmer Inc
236     	ACME
236     	Clout Drinks
236     	Cover Up
236     	Dairy Things
236     	Marty's Meds
236     	Doctor Bird's
236     	Scootie's Cleaning
236     	Snack Me Up
237     	Munchie Mash
237     	Scootie's Cleaning
237     	Atlantis Beverage
237     	Doctor Bird's
237     	Freezy Freeze
237     	Meat and Stuff
237     	Marty's Meds
237     	ACME
237     	Dairy Time
237     	Fries Frozen Foods
237     	Grain Train
237     	Deli Emporium
237     	Cover Up
237     	Snack Me Up
237     	Dairy Things
237     	Classified Cosmetics
237     	Squeaky Clean
237     	Clout Drinks
237     	Dole
237     	Carboload
237     	Elmer Inc
237     	Fresh Stuff
238     	Fries Frozen Foods
238     	ACME
238     	Dairy Time
238     	Atlantis Beverage
238     	Snack Me Up
238     	Dole
238     	Carboload
238     	Freezy Freeze
238     	Doctor Bird's
238     	Grain Train
238     	Fresh Stuff
238     	Clout Drinks
238     	Elmer Inc
238     	Classified Cosmetics
238     	Dairy Things
238     	Scootie's Cleaning
238     	Cover Up
238     	Meat and Stuff
238     	Marty's Meds
238     	Munchie Mash
239     	Grain Train
239     	Dairy Things
239     	Elmer Inc
239     	Dairy Time
239     	Dole
239     	Carboload
239     	Cover Up
239     	Squeaky Clean
239     	ACME
239     	Munchie Mash
239     	Freezy Freeze
239     	Fresh Stuff
239     	Meat and Stuff
239     	Deli Emporium
239     	Marty's Meds
239     	Snack Me Up
240     	Fries Frozen Foods
240     	Munchie Mash
240     	Atlantis Beverage
240     	Carboload
240     	Meat and Stuff
240     	Dole
240     	Snack Me Up
240     	Fresh Stuff
240     	Freezy Freeze
240     	Marty's Meds
240     	Classified Cosmetics
240     	Doctor Bird's
240     	Dairy Time
240     	ACME
240     	Deli Emporium
240     	Clout Drinks
241     	Doctor Bird's
241     	Dairy Things
241     	Carboload
241     	Grain Train
241     	ACME
241     	Meat and Stuff
241     	Classified Cosmetics
241     	Freezy Freeze
241     	Marty's Meds
241     	Dole
241     	Elmer Inc
241     	Deli Emporium
241     	Fresh Stuff
241     	Fries Frozen Foods
241     	Snack Me Up
241     	Dairy Time
241     	Atlantis Beverage
241     	Cover Up
241     	Scootie's Cleaning
242     	Squeaky Clean
242     	Elmer Inc
242     	Meat and Stuff
242     	Dole
242     	Freezy Freeze
242     	Snack Me Up
242     	Clout Drinks
242     	Atlantis Beverage
242     	Fries Frozen Foods
242     	Scootie's Cleaning
242     	Fresh Stuff
242     	Grain Train
242     	Munchie Mash
242     	Dairy Things
242     	ACME
242     	Carboload
242     	Classified Cosmetics
242     	Dairy Time
242     	Deli Emporium
242     	Cover Up
243     	Elmer Inc
243     	Freezy Freeze
243     	Dairy Things
243     	Squeaky Clean
243     	Cover Up
243     	Dole
243     	Carboload
243     	Munchie Mash
243     	Dairy Time
243     	Marty's Meds
243     	Atlantis Beverage
243     	Scootie's Cleaning
243     	Fries Frozen Foods
243     	Snack Me Up
243     	Doctor Bird's
243     	ACME
243     	Classified Cosmetics
243     	Deli Emporium
244     	Doctor Bird's
244     	Freezy Freeze
244     	Elmer Inc
244     	Snack Me Up
244     	Marty's Meds
244     	Dole
244     	Classified Cosmetics
244     	Dairy Things
244     	Dairy Time
244     	Grain Train
244     	Squeaky Clean
244     	Fries Frozen Foods
244     	Clout Drinks
244     	Carboload
244     	Fresh Stuff
244     	Meat and Stuff
245     	Scootie's Cleaning
245     	Munchie Mash
245     	Carboload
245     	ACME
245     	Dairy Time
245     	Fresh Stuff
245     	Deli Emporium
245     	Meat and Stuff
245     	Doctor Bird's
245     	Fries Frozen Foods
245     	Atlantis Beverage
245     	Clout Drinks
245     	Cover Up
245     	Squeaky Clean
245     	Marty's Meds
245     	Snack Me Up
245     	Dole
246     	Atlantis Beverage
246     	Meat and Stuff
246     	Doctor Bird's
246     	Fries Frozen Foods
246     	Marty's Meds
246     	Freezy Freeze
246     	Elmer Inc
246     	Grain Train
246     	Classified Cosmetics
246     	Fresh Stuff
246     	Clout Drinks
246     	Cover Up
246     	Scootie's Cleaning
246     	Squeaky Clean
246     	ACME
246     	Snack Me Up
247     	Clout Drinks
247     	Classified Cosmetics
247     	Elmer Inc
247     	Marty's Meds
247     	Atlantis Beverage
247     	Dole
247     	Carboload
247     	Dairy Things
247     	Dairy Time
247     	Freezy Freeze
247     	Cover Up
247     	Scootie's Cleaning
247     	Fries Frozen Foods
247     	Deli Emporium
247     	Snack Me Up
247     	Grain Train
247     	Squeaky Clean
247     	Fresh Stuff
247     	ACME
247     	Meat and Stuff
247     	Doctor Bird's
247     	Munchie Mash
248     	Snack Me Up
248     	Freezy Freeze
248     	Squeaky Clean
248     	Munchie Mash
248     	Dairy Things
248     	Grain Train
248     	Carboload
248     	Fries Frozen Foods
248     	Dairy Time
248     	Clout Drinks
248     	Dole
248     	Classified Cosmetics
248     	Scootie's Cleaning
248     	Fresh Stuff
248     	Deli Emporium
249     	Dole
249     	Clout Drinks
249     	Deli Emporium
249     	Carboload
249     	Fresh Stuff
249     	Dairy Time
249     	Munchie Mash
249     	Fries Frozen Foods
249     	Atlantis Beverage
249     	Grain Train
249     	ACME
249     	Meat and Stuff
249     	Snack Me Up
249     	Scootie's Cleaning
249     	Doctor Bird's
249     	Elmer Inc
250     	Clout Drinks
250     	Dole
250     	Deli Emporium
250     	Cover Up
250     	Carboload
250     	Grain Train
250     	Dairy Things
250     	Classified Cosmetics
250     	Elmer Inc
250     	Doctor Bird's
250     	ACME
250     	Fries Frozen Foods
250     	Snack Me Up
250     	Dairy Time
250     	Scootie's Cleaning
250     	Marty's Meds
250     	Atlantis Beverage
\.


--
-- Data for Name: customer; Type: TABLE DATA; Schema: wegmans2; Owner: jaf9897
--

COPY wegmans2.customer (phonenumber, firstname, lastname) FROM stdin;
5019312140	Janine	Ide
1041696514	Sumner	Jochanany
4306662364	Niven	Mathissen
9911334282	Neils	Menure
5633570761	Frank	Sima
1737695393	Frank	Gillings
3407030933	Hube	Boutflour
3212001020	Karla	Perrins
3179028009	Orbadiah	Trace
5549033462	Idell	Fothergill
4413418188	Luke	Eberst
1728134760	Jo-ann	Gantz
1687575631	Matty	Brisley
9305781770	Kaylyn	Loney
2208061030	Penrod	Pragnell
3008326696	Bartolemo	Wildsmith
6788946633	Keenan	Barkus
2221154896	Melisandra	Narup
4141889531	Phyllida	Bencher
6002323152	Dicky	Serrurier
1947254190	Ilsa	Downham
1971424470	Galven	Markovic
1413628150	Robb	Stodhart
5963264222	Clemmy	Cackett
8405144973	Carr	Humpherson
6979644969	Lee	Menguy
7211210217	Cati	Bamforth
2155030720	Gerri	Loreit
2542508689	Had	Prestwich
8512482553	Rosie	Lodo
5062815303	Zaria	Vanichev
2389037733	Fae	Strangeway
4367035640	Alikee	Fones
3289827635	Athene	Blincow
8732245967	Hali	Aslett
8663049346	Bay	Egerton
9296229981	Rriocard	Coppens
2929362520	Sammie	Attkins
4691516229	Dalia	Slimming
3394024658	Sarina	Roalfe
8564213736	Wilhelm	Galer
4831409387	Grace	Copplestone
2628943214	Tannie	Jent
8731889087	Hollis	Kensett
6756496857	Maryrose	Govan
9251037101	Lorinda	Jorgensen
8995437747	Hagen	Jacmar
4143640474	Con	Vido
8719163626	Lisette	Bringloe
6117150833	Rubie	Pymar
6746827048	Rosabelle	Pauer
1007127177	Kermit	Ellyatt
1798825222	Erminia	Hungerford
5458636091	Ashby	Elkins
6758921194	Avram	Dahle
5216472904	Miof mela	Struis
8546488578	Liva	Broyd
3438857837	Ty	Pickerell
6698635493	Myer	Sebastian
2473778271	Nonnah	Bowton
8571321349	Bobbette	Bartley
4497141442	Prescott	Jaggs
6778124472	Shelley	Rowes
7216071890	Wyatt	Lanchbury
7116278144	Stanly	Coughan
7381140027	Dodi	Harnell
8031688077	Kerrill	Passfield
1511505063	Fernande	Prettyman
9528022780	Saunder	Connor
6613289086	Enos	Dunseath
5217136758	Eldredge	Melendez
4752628252	Kathlin	Kiloh
7434024297	Daron	Cashmore
8089519838	Wilow	Dignall
7802118695	Oates	Crichten
6766171955	Alanson	Butfield
8018916776	Norris	Custy
6144969851	Garth	Dankov
8067440133	Nahum	McLise
4267735567	Fredek	Tedridge
8685919938	Nadean	Lambard
3759486084	Maurene	Geaney
9859289886	Inesita	Stidworthy
5609753201	Allie	Meas
5578561084	Oneida	Starrs
4323489871	Colby	Stapells
3202963823	Jeannine	Georgi
8044068658	Berty	McGavigan
9984833166	Kev	Lydall
4293159647	Karlen	Gladtbach
5961584539	Gratiana	Giacomo
3164782687	Quinta	Gaughan
6806054949	Wendy	Yerby
4377909332	Hasty	Chiplin
7205472287	Wallace	Arthurs
3857645514	Tarra	Alvy
8872404266	Felecia	Tatham
2242735766	Reynold	Woollends
7862148938	Ardella	Chaunce
8417181288	Marion	Jiran
7208494824	Giorgi	Goosey
3413181570	Ronnica	Reglar
9057353891	Halie	Clacey
2921157997	Shelli	Stratiff
5791573168	Jessalyn	Silvers
4758421551	Lazarus	Waddington
4925167684	Bowie	Livings
8238526632	Vin	Fantini
7038025925	Ethe	Olivi
4072260019	Zane	Lagneaux
3264239750	Frederico	Wellfare
5641652995	Marty	Petrowsky
2732870626	Emmalyn	Shillaker
5475050199	Holly	Brewerton
3882983658	Osmund	Swettenham
2685161059	Melonie	Jumont
7383939083	Powell	Sprague
6075102214	Alla	Cuncliffe
4462548794	Fiona	Gennrich
6712129706	Brandie	Stringer
5145621850	Virge	Diego
5719201957	Sofie	Shackelton
2279056566	Karalynn	Lamanby
5318736001	Brenna	MacMickan
4688687768	Liesa	Trevallion
6849665343	Major	Feldberger
1629932982	Doralynn	Cereceres
9119153655	Barri	Durrand
2461823714	Howey	Lapping
2329656829	Cecil	Aspy
9033249885	Harry	Manuel
7976703056	Griffin	Anfonsi
6298481612	Brittaney	Gosling
7206340636	Heath	Gatch
7207657400	Marcelo	Jouandet
2822133199	Damien	Durrance
6618381028	Florella	Korlat
7263490809	Hilliary	Hainsworth
7065815243	Chrystel	Shitliff
6099232381	Kellen	Shevels
5149199675	Clare	Ivashnikov
9176290163	Lois	Strewthers
3138633625	Carney	Mournian
6907684648	Fifi	Dadds
2134459395	Etti	Menhci
3937225081	Ferguson	Healks
6579611591	Jo ann	Letcher
1079167299	Selia	Goodwins
3703311506	Byrann	Clappson
3224863676	Karlene	St. Queintain
2721788806	Jobie	Kippen
5204765617	Andros	Beaty
6209655947	Lanette	Wilkowski
6961767437	Missy	Trytsman
6896741321	Eartha	Melmoth
6325640898	Annamarie	Feronet
3882493546	Doretta	Burnsides
6601774478	Joshia	McKleod
6398368619	Corbet	Valenta
2537304659	Konstantine	McEnery
6609295298	Jeddy	Saenz
2194069220	Selby	Fanshawe
7671146431	Barnard	Dunphy
8552394845	Fair	Darey
1492680627	Osbourn	Mackney
5242462708	Andonis	Naulls
3232262245	Consuela	Swanwick
3228266818	Hilario	Tures
8133508491	Mord	Barnfield
3505472187	Adelheid	Coneau
2761695829	Holli	Sporrij
3501154222	Norry	Maciejak
5834583085	Agnes	Verriour
1532520627	Mathe	Chong
9043656607	Foster	Studman
7124041819	Carree	Robertz
6267352331	Herbert	De Miranda
6457985321	Kiel	Divall
3396576291	Bradford	Batrop
2495997349	Madlin	Elion
5557994994	Tades	Crighton
5921080373	Timothea	Warlow
6922989673	Colan	McNess
5899404919	Andonis	Ohm
6872967398	Alex	Rosebotham
9628032353	Harwell	Enos
9695919715	Melania	Jotham
3442482448	Haroun	Stokoe
3555061016	Gavrielle	Lagden
4228097219	Aile	Pugsley
2022526757	Amelina	Smead
6939496597	Douglas	Jzhakov
7969888831	Eward	Greenmon
5185205464	Sherye	Kuna
8613443722	Camilla	Roper
5511880212	Giles	Leipnik
5608081367	Vicki	Jahn
2466473978	Max	Bransdon
6929681529	Jilly	Portlock
3957160343	Cam	Munnion
0123456789	Ryan	Cervantes
9876543210	Jorge	Flores
\.


--
-- Data for Name: distributedby; Type: TABLE DATA; Schema: wegmans2; Owner: jaf9897
--

COPY wegmans2.distributedby (vendor, brand) FROM stdin;
ACME	ACME
Moo Corp.	Atlantis Beverage
Penguin Incorporated	Carboload
MegaCorp	Classified Cosmetics
Brawndo	Clout Drinks
Monsanto	Cover Up
Moo Corp.	Dairy Things
Penguin Incorporated	Dairy Time
MegaCorp	Deli Emporium
ACME	Doctor Bird's
Brawndo	Dole
Monsanto	Elmer Inc
Moo Corp.	Freezy Freeze
Penguin Incorporated	Fresh Stuff
MegaCorp	Fries Frozen Foods
ACME	Grain Train
Brawndo	Marty's Meds
Monsanto	Meat and Stuff
Moo Corp.	Munchie Mash
Penguin Incorporated	Scootie's Cleaning
MegaCorp	Snack Me Up
ACME	Squeaky Clean
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: wegmans2; Owner: jaf9897
--

COPY wegmans2.orders (customer, ordernumber, product, store, numbersold) FROM stdin;
9305781770	26942418	765572003296	1       	5
9305781770	47699285	702421087613	1       	5
9305781770	75008681	203262278452	1       	5
9305781770	89595637	765572003296	1       	5
9305781770	30752448	702421087613	1       	1
9305781770	83491020	203262278452	1       	3
9305781770	71764627	765572003296	1       	5
9305781770	23302778	702421087613	1       	1
9305781770	25102675	203262278452	1       	3
8732245967	60751015	863129185304	1       	1
8732245967	53489945	569219762080	56      	50
8732245967	97277258	998040421944	56      	23
8732245967	92954640	696368469198	56      	34
8732245967	35264610	944472664850	56      	1
8732245967	25229924	673737891943	21      	32
8732245967	14383856	702421087613	21      	12
8732245967	87194035	203262278452	21      	23
8732245967	68563036	732970729968	21      	24
8732245967	30873674	887528437482	1       	3
8732245967	30088271	388403878360	1       	5
1413628150	59997411	207178796787	78      	1
1413628150	84274838	389169531271	78      	1
1413628150	79370438	383476286895	78      	4
1413628150	21964994	174237001203	78      	1
1413628150	11451780	549746556299	78      	3
2242735766	51883043	836900805029	1       	89
8995437747	95218319	998040421944	1       	16
2685161059	89200779	673737891943	1       	58
7116278144	58703093	420756960291	1       	7
5578561084	14651650	814141265887	1       	96
5242462708	69512038	697814031389	2       	42
5318736001	75695388	814141265887	2       	11
7207657400	61885779	381299535788	2       	64
9911334282	28846965	999543417737	2       	14
5242462708	18168276	400127531270	2       	64
7862148938	22099955	697814031389	3       	11
3555061016	64951744	925484684473	3       	6
6758921194	17434973	986202008726	3       	26
9033249885	66870972	290827207620	3       	44
2242735766	91718453	132954606361	3       	94
7038025925	16087763	203262278452	4       	19
7381140027	97164581	373709485267	4       	97
3212001020	75228040	578147508823	4       	51
8512482553	10121288	654563447110	4       	50
8995437747	85655460	979700065093	4       	84
1532520627	33914502	868744054130	5       	54
4323489871	82413679	569219762080	5       	72
2242735766	28055150	383476286895	5       	67
5608081367	96473934	339589987290	5       	11
4306662364	61818371	814141265887	5       	69
2685161059	39551573	982079076090	6       	67
6907684648	64866241	482429892907	6       	13
3164782687	67691070	118389501460	6       	49
8685919938	74126362	770565227675	6       	77
5185205464	59941891	868744054130	6       	91
8995437747	29105442	234646454745	7       	38
6075102214	56445538	916984241291	7       	17
5791573168	82097615	380734371410	7       	86
2732870626	15890585	516286957430	7       	61
6746827048	62472887	132954606361	7       	11
2495997349	47706408	529831629045	8       	34
9859289886	12792788	274761600136	8       	54
5242462708	66759697	673737891943	8       	79
8512482553	15124803	488529033803	8       	86
6613289086	75519131	482429892907	8       	54
5242462708	36772351	945012228482	9       	5
1532520627	91190922	646511826677	9       	60
6325640898	22763306	549746556299	9       	39
3501154222	67907048	839518983686	9       	69
3501154222	22160453	721857506010	9       	64
3442482448	72028479	875125493289	10      	98
7381140027	90361971	709229053555	10      	25
1629932982	29556828	679453075525	10      	12
9296229981	75508537	902956788286	10      	75
5019312140	27744525	203262278452	10      	23
1798825222	29720000	467986934495	11      	60
8417181288	19302499	264132323061	11      	74
6756496857	57537937	127026679653	11      	67
7065815243	61569393	589814450967	11      	55
2732870626	34581719	875605607431	11      	76
7671146431	67078538	379942304309	12      	54
5145621850	11097120	508818965558	12      	75
5834583085	23556486	697814031389	12      	84
8685919938	81870492	732970729968	12      	84
5963264222	99170813	649921994715	12      	61
8089519838	28056540	590034051433	13      	38
3396576291	50264329	567657950596	13      	96
6929681529	31482899	716818652888	13      	62
3505472187	62672449	317663070530	13      	9
2495997349	31217302	702830548447	1       	30
7116278144	69804790	875605607431	1       	53
7216071890	87560241	525199185853	1       	40
4228097219	74005943	199753522658	1       	29
4688687768	89788418	334425348148	1       	69
1041696514	33054679	457459442332	2       	55
6766171955	19409732	578147508823	2       	25
6579611591	40467309	294993047536	2       	49
5216472904	72406060	549746556299	2       	25
5633570761	11411199	316871031375	2       	29
7969888831	28746511	413227470171	3       	77
5216472904	63194461	132954606361	3       	93
4293159647	44974987	875605607431	3       	24
8719163626	63325509	948543507361	3       	34
4306662364	29499210	377848719039	3       	71
1947254190	51161627	483738463713	4       	65
4497141442	61710142	939369924082	4       	70
9984833166	87734959	941976384328	4       	35
5216472904	19777124	473186595371	4       	69
8663049346	86796924	380734371410	4       	86
3289827635	88779395	167742802915	5       	92
5791573168	52805988	467615168772	5       	21
8238526632	36585068	534109743798	5       	3
4497141442	79395447	716818652888	5       	44
6758921194	38919993	568658660566	5       	2
6579611591	24404907	732970729968	6       	80
8663049346	55584399	508818965558	6       	33
3289827635	17619618	529831629045	6       	43
7206340636	28964062	558886167633	6       	5
8995437747	94208088	875125493289	6       	14
7862148938	25456986	948543507361	7       	34
5145621850	16742622	941976384328	7       	85
3882983658	45254019	925484684473	7       	74
9043656607	75381911	482340522139	7       	17
6907684648	57235287	982079076090	7       	10
6979644969	34423250	300475101700	8       	16
3289827635	88899948	336491915536	8       	83
5963264222	23437264	430946284790	8       	54
6099232381	33584692	108326062706	8       	24
4228097219	35227826	127026679653	8       	31
5062815303	95627327	669515708071	9       	19
3202963823	25782659	418604295928	9       	36
7263490809	42318836	999543417737	9       	57
9695919715	54526993	833663232208	9       	60
4925167684	17134393	525199185853	9       	30
5458636091	10075558	749625390019	10      	76
5318736001	37808009	589814450967	10      	47
7208494824	55503810	527453991710	10      	85
1413628150	67240123	103362565865	10      	53
6712129706	47405027	180531962334	10      	5
7065815243	34949698	554521191996	11      	96
6099232381	80339518	646511826677	11      	70
4752628252	55014505	473186595371	11      	59
5217136758	81211524	194144382996	11      	4
7216071890	61724821	383476286895	11      	98
1492680627	92775712	199968033019	12      	11
5204765617	52712325	435122760857	12      	55
3289827635	79885558	945012228482	12      	58
3224863676	90718866	199968033019	12      	7
8044068658	90171043	286243122717	12      	69
5318736001	72671089	765572003296	13      	35
6613289086	21233985	146051347589	13      	79
8663049346	74375021	945012228482	13      	8
9033249885	60907425	698718941817	13      	4
2542508689	42898223	140903716305	13      	45
3555061016	25706256	199753522658	14      	72
1532520627	99247608	642234808130	14      	88
6601774478	86084500	996103067914	14      	73
3289827635	48674660	563144943925	14      	19
3138633625	12755411	618570550236	14      	7
9296229981	20302914	284083366181	15      	5
9033249885	43863433	869112308003	15      	24
2732870626	42046471	875125493289	15      	47
6872967398	67869466	568658660566	15      	85
2685161059	82345001	603333456348	15      	87
5216472904	21394014	849681336901	16      	21
2921157997	87847153	457459442332	16      	22
8685919938	13317920	398900612810	16      	79
1687575631	75690427	108649313374	16      	3
3202963823	41901147	139669412174	16      	68
2929362520	98473394	473186595371	17      	64
8031688077	21018494	608852371253	17      	83
6002323152	39826200	444797600349	17      	90
1413628150	90201257	828509049873	17      	50
1492680627	23742587	129753980851	17      	91
6144969851	18255853	692492393712	18      	51
4267735567	22810497	838962966418	18      	47
5458636091	80803344	339589987290	18      	21
5834583085	92208029	339589987290	18      	81
3138633625	49194182	290827207620	18      	34
4497141442	40006742	945012228482	19      	72
8018916776	68533752	554521191996	19      	85
1492680627	97951623	210526151030	19      	77
1492680627	15613824	673737891943	19      	35
3228266818	67296281	882152991390	19      	25
6746827048	24887403	308792010934	20      	91
2279056566	36079932	525199185853	20      	74
9033249885	29682021	572878568883	20      	14
3882493546	14725614	558886167633	20      	85
9305781770	69840168	132954606361	20      	15
7969888831	60260830	129753980851	21      	81
1687575631	34537822	996103067914	21      	51
2389037733	77482663	600770885624	21      	93
6756496857	40554800	939369924082	21      	74
7969888831	84029011	877194198700	21      	28
2732870626	88315200	294993047536	22      	71
1041696514	59941250	887528437482	22      	91
2134459395	71665951	679453075525	22      	44
7216071890	38945204	629919786056	22      	54
4267735567	30256409	776538360607	22      	74
7862148938	63812696	578705048123	23      	46
3505472187	81714689	887528437482	23      	27
9695919715	75363754	132954606361	23      	93
4758421551	44244103	488529033803	23      	3
6613289086	20400674	152614854189	23      	48
8995437747	78259767	425456990082	24      	70
8044068658	77663662	925173129386	24      	51
7216071890	88534581	139669412174	24      	13
6298481612	14576762	636021875565	24      	44
5609753201	83645698	411067277447	24      	29
7383939083	38491433	769357296879	25      	19
8719163626	19389110	159425007904	25      	19
4752628252	43752474	578147508823	25      	8
5475050199	79057733	925484684473	25      	70
6618381028	49286053	576518370019	25      	46
5216472904	92079933	140903716305	26      	3
4267735567	63155166	875605607431	26      	81
2473778271	84733700	421337093409	26      	44
4228097219	79108559	413227470171	26      	37
3202963823	11309211	435122760857	26      	100
6922989673	93702847	349435998924	27      	36
3442482448	82562911	838962966418	27      	32
7216071890	31789038	608852371253	27      	36
3179028009	96307140	875605607431	27      	1
2761695829	85705816	902956788286	27      	14
9296229981	62545306	132954606361	28      	98
2208061030	51109488	129753980851	28      	39
2537304659	96448970	873640709962	28      	38
5609753201	83199588	982079076090	28      	35
6618381028	81651096	630929030795	28      	48
5719201957	81592925	349330324726	29      	40
1041696514	70886496	741544174664	29      	17
6872967398	45682621	636021875565	29      	7
2242735766	65524826	732970729968	29      	89
5834583085	48424416	875605607431	29      	14
2473778271	47266135	567657950596	30      	1
6766171955	93485021	944472664850	30      	58
7862148938	75119747	618570550236	30      	2
6457985321	57750853	187272692439	30      	75
5019312140	88698659	180531962334	30      	76
5475050199	77283552	377848719039	31      	31
1971424470	27604002	126834215166	31      	53
6746827048	45180506	702830548447	31      	15
7862148938	61235298	400127531270	31      	92
8067440133	53902444	861348595761	31      	51
3164782687	68962523	430946284790	32      	35
3882983658	53381558	754664511022	32      	19
6756496857	66422456	364745567029	32      	79
9628032353	24951940	836900805029	32      	49
3413181570	77788789	902956788286	32      	57
3008326696	44519188	246144606961	33      	84
2732870626	29442083	576518370019	33      	47
6144969851	69746262	608852371253	33      	20
3857645514	70224929	741544174664	33      	33
5609753201	89396268	679453075525	33      	34
6601774478	23700452	887528437482	34      	95
8731889087	80150827	508818965558	34      	99
2466473978	71334831	887528437482	34      	91
6849665343	98014680	836900805029	34      	54
3501154222	31364955	159425007904	34      	69
3555061016	55137260	925484684473	35      	44
6806054949	68283536	139669412174	35      	57
5578561084	24251408	916984241291	35      	81
8552394845	40383113	159425007904	35      	21
5216472904	43056545	849681336901	35      	34
2761695829	82025812	527453991710	36      	57
9859289886	41755116	126834215166	36      	19
5204765617	21712399	140903716305	36      	56
6325640898	56160887	952550789390	36      	17
3224863676	52466427	210526151030	36      	62
7211210217	16665997	152614854189	37      	78
4306662364	21541839	925173129386	37      	30
5019312140	87902457	803607788754	37      	81
6806054949	26219335	986202008726	37      	56
3179028009	70404479	336491915536	37      	100
6398368619	79125666	722946564026	38      	38
2279056566	56833071	203262278452	38      	89
2921157997	21313550	633320411611	38      	88
5185205464	33038496	882152991390	38      	63
6849665343	46832480	187272692439	38      	68
9119153655	19156918	286243122717	39      	51
6758921194	34928088	506298714832	39      	23
4691516229	67732701	272121204465	39      	36
6806054949	61785312	732970729968	39      	85
2194069220	31227469	732970729968	39      	22
6601774478	13150511	389169531271	40      	31
2628943214	98618600	508818965558	40      	57
4072260019	70635245	284083366181	40      	20
8405144973	90642876	805966823208	40      	54
9305781770	18409678	654563447110	40      	94
8133508491	83917278	377848719039	41      	99
2194069220	78092487	754664511022	41      	63
3407030933	37974155	384179652400	41      	98
4293159647	87030768	418604295928	41      	33
2022526757	46714564	836900805029	41      	2
5475050199	93536194	590034051433	42      	42
7802118695	22487949	643925479319	42      	38
4141889531	66613977	400930079611	42      	3
8405144973	11767465	294993047536	42      	97
6766171955	90686258	939369924082	42      	59
4925167684	91339359	923237099384	43      	49
9251037101	78774254	246144606961	43      	42
5145621850	96111415	939369924082	43      	42
2761695829	97062285	208174494479	43      	72
4925167684	67756861	208174494479	43      	1
6758921194	97074612	941976384328	44      	29
6075102214	69046845	516495915668	44      	99
3957160343	16467175	702830548447	44      	33
6144969851	84860932	473186595371	44      	50
1532520627	86128846	952550789390	44      	15
8067440133	34199717	899657914264	45      	79
5633570761	36141428	945012228482	45      	31
6756496857	64135857	618570550236	45      	52
4306662364	91963653	418604295928	45      	70
8564213736	30472885	336491915536	45      	29
5834583085	92292207	904647940449	46      	77
7263490809	36826326	986065693858	46      	54
6209655947	55565463	167742802915	46      	22
7263490809	45491719	180531962334	46      	14
8417181288	85949785	508818965558	46      	85
5217136758	30039544	398900612810	47      	78
6746827048	42113159	998040421944	47      	59
6267352331	34936307	483738463713	47      	92
2279056566	51267761	173672457176	47      	69
9057353891	66105414	312237459250	1       	82
6766171955	72671706	140903716305	1       	62
1532520627	76819505	786975743876	1       	97
8872404266	33105354	482340522139	1       	56
3289827635	46164536	210526151030	1       	29
4267735567	60441486	174237001203	2       	9
3442482448	91333751	563144943925	2       	21
3228266818	95005410	875605607431	2       	37
6075102214	25598298	902956788286	2       	63
1728134760	35221363	420756960291	2       	39
5921080373	49097696	873640709962	3       	11
3501154222	33836578	264132323061	3       	60
4267735567	90080347	168074802141	3       	6
7802118695	79506113	568658660566	3       	81
7802118695	93057710	861348595761	3       	72
7434024297	81994195	430946284790	4       	6
2389037733	84320269	207178796787	4       	56
6579611591	48351312	952550789390	4       	46
3212001020	84625343	636021875565	4       	38
8663049346	15387358	567657950596	4       	75
9296229981	24094815	413227470171	5       	7
9528022780	21788056	207178796787	5       	25
2242735766	42973206	294993047536	5       	74
5921080373	15793099	814141265887	5       	87
9911334282	14120290	180531962334	5       	55
8732245967	43821107	173672457176	6       	44
6209655947	40517330	771137437634	6       	45
2155030720	67182786	839518983686	6       	17
2155030720	95929749	673737891943	6       	98
6872967398	86403504	208174494479	6       	46
8564213736	53529420	129753980851	7       	26
4367035640	28894551	139669412174	7       	44
8512482553	97229987	882152991390	7       	48
7862148938	23853550	816260222588	7       	18
2242735766	95499916	506298714832	7       	20
9859289886	80217907	384468659793	8       	74
1532520627	45847651	839518983686	8       	45
9984833166	45446256	839518983686	8       	74
9911334282	56900694	457459442332	8       	24
2461823714	78418319	509762284879	8       	28
1728134760	90654345	786975743876	9       	26
2732870626	56675953	603333456348	9       	23
2822133199	49199593	316871031375	9       	33
5609753201	53426952	673737891943	9       	75
7216071890	29255415	673737891943	9       	60
9628032353	90057532	172950643766	10      	65
5557994994	47091731	336491915536	10      	68
9176290163	84508280	769357296879	10      	47
5242462708	28393538	721857506010	10      	98
5185205464	46056170	108649313374	10      	69
3232262245	31944583	952550789390	11      	51
8417181288	42134983	511511692317	11      	55
3438857837	12277711	444797600349	11      	63
2155030720	27950298	146051347589	11      	5
5961584539	31514098	384179652400	11      	21
7216071890	35215563	923237099384	12      	100
7206340636	10161468	511511692317	12      	15
2628943214	18193242	203262278452	12      	33
3937225081	51028531	322758894316	12      	74
1511505063	19304484	786975743876	12      	95
7116278144	34056152	317663070530	13      	35
4462548794	38698973	692492393712	13      	45
1737695393	60751972	838962966418	13      	1
6099232381	54246165	805966823208	13      	21
4831409387	11925645	435122760857	13      	92
7208494824	37302389	506298714832	14      	22
4413418188	12727616	679453075525	14      	15
3438857837	20256000	380734371410	14      	30
7207657400	53553638	435583017631	14      	98
9119153655	82554196	873640709962	14      	20
2329656829	61673505	986065693858	15      	16
8417181288	23193576	982079076090	15      	51
3555061016	20384899	373709485267	15      	11
2473778271	95436260	294993047536	15      	82
6907684648	25690058	435583017631	15      	65
7216071890	32350815	473186595371	16      	42
8995437747	90052621	996103067914	16      	9
6579611591	27166728	646511826677	16      	73
1629932982	90776055	118389501460	16      	37
9176290163	95897498	261188186216	16      	31
1492680627	75303164	300475101700	17      	98
7862148938	98721611	334074319971	17      	86
2242735766	62064006	272121204465	17      	94
5242462708	84343522	180531962334	17      	72
3882493546	97776366	388403878360	17      	15
1629932982	58066889	334074319971	18      	10
4143640474	60276346	132186536765	18      	21
2461823714	78475192	312237459250	18      	26
2537304659	32562963	786975743876	18      	78
9043656607	73490543	600770885624	18      	60
5963264222	43361176	375276903331	19      	41
0123456789	73141647	252522255166	19      	50
5458636091	32117656	673737891943	19      	54
1532520627	97477742	952550789390	19      	69
9911334282	13227415	528771298719	19      	23
8995437747	39289298	308440276732	20      	36
8995437747	32152620	578147508823	20      	88
9033249885	10497585	816260222588	20      	68
1728134760	43128640	589814450967	20      	97
5217136758	58766200	669515708071	20      	73
6267352331	83765070	261188186216	21      	52
6778124472	42318913	741544174664	21      	72
0123456789	84600612	467986934495	21      	49
2495997349	55685146	414652410482	21      	84
4752628252	58593697	336491915536	21      	75
5633570761	21703484	246144606961	22      	37
5719201957	22132403	467615168772	22      	47
4462548794	51783033	207178796787	22      	4
2466473978	86601183	523196696835	22      	2
8552394845	15888973	418604295928	22      	29
4752628252	55095532	67014520356 	23      	75
6961767437	65188862	556388862616	23      	54
7065815243	12910276	113476782830	23      	31
2473778271	62574468	529831629045	23      	42
5899404919	46474284	692492393712	23      	74
7207657400	74692625	412348931569	24      	85
5921080373	95143047	554521191996	24      	46
2389037733	33158647	749193678427	24      	31
2921157997	31806930	527453991710	24      	24
1511505063	81902677	679453075525	24      	73
6609295298	34130869	152614854189	25      	97
1041696514	19916408	349330324726	25      	30
8546488578	85752688	600770885624	25      	46
8546488578	82988884	776538360607	25      	57
5149199675	56086652	380734371410	25      	34
8663049346	95389113	322758894316	26      	32
2929362520	30890062	786975743876	26      	17
6209655947	45037711	925484684473	26      	18
9628032353	21109909	925173129386	26      	46
5217136758	69205276	692492393712	26      	65
3138633625	50856185	933914210509	27      	50
6758921194	20950970	414652410482	27      	100
4831409387	36939100	176404904473	27      	98
3264239750	95604003	286243122717	27      	46
8995437747	10506266	139669412174	27      	51
2134459395	83282599	139669412174	28      	96
9296229981	26119114	590034051433	28      	97
1041696514	25877618	749193678427	28      	14
5216472904	55704060	706236730898	28      	55
4377909332	99937481	740581174440	28      	18
9859289886	47927802	300475101700	29      	41
5204765617	58092107	210526151030	29      	39
6929681529	91763721	996103067914	29      	10
4758421551	75097649	534109743798	29      	47
6618381028	52513191	384179652400	29      	85
4293159647	65142031	916984241291	30      	17
8133508491	42426700	364745567029	30      	48
7038025925	71256979	618570550236	30      	75
4143640474	83949483	996103067914	30      	99
3937225081	21452995	547244118460	30      	65
8238526632	66069743	563144943925	31      	29
9057353891	39952833	563144943925	31      	95
9043656607	38503424	534109743798	31      	35
5791573168	73130120	379942304309	31      	2
6929681529	89867581	409542246104	31      	87
6778124472	68039597	435583017631	32      	40
2685161059	93462850	398900612810	32      	82
8564213736	65738272	467615168772	32      	14
9251037101	49570209	578147508823	32      	45
7124041819	85932522	483738463713	32      	33
5963264222	19077162	576518370019	33      	47
4688687768	80574447	986065693858	33      	66
6939496597	54654500	322758894316	33      	68
6298481612	15826859	381299535788	33      	39
6002323152	60383251	770565227675	33      	55
7116278144	10007030	284083366181	34      	44
2685161059	85284594	633320411611	34      	25
2721788806	99137295	986202008726	34      	25
0123456789	65705479	576518370019	34      	34
5608081367	79996740	265444172694	34      	74
2208061030	52987790	435583017631	35      	26
3407030933	37906197	180531962334	35      	60
9305781770	30744349	547244118460	35      	66
2194069220	83403607	189470486214	35      	88
7263490809	41167820	389169531271	35      	36
2628943214	26070770	284083366181	36      	44
8089519838	68872801	563144943925	36      	55
3228266818	25657887	250617599940	36      	64
7207657400	85432343	187272692439	36      	52
3407030933	27937193	227635917829	36      	50
2389037733	41564891	187272692439	37      	30
6601774478	10561964	384468659793	37      	8
5834583085	31865609	349435998924	37      	100
8995437747	47870297	590034051433	37      	18
2921157997	33682355	887528437482	37      	55
1532520627	41501615	384468659793	38      	47
9119153655	65176538	679453075525	38      	34
4267735567	43960259	556388862616	38      	59
9119153655	91834418	420756960291	38      	47
6806054949	76988536	919197823026	38      	3
6806054949	57894242	113476782830	39      	85
6896741321	31357383	154554749200	39      	94
8571321349	57401409	749193678427	39      	70
3264239750	63170680	132186536765	39      	55
4367035640	29093786	511511692317	39      	39
7434024297	90938983	962728896848	40      	78
8546488578	53973096	557899454410	40      	25
7216071890	82965823	741544174664	40      	2
5458636091	42897050	569219762080	40      	16
5609753201	90614337	199968033019	40      	70
5921080373	10921679	803607788754	41      	71
3138633625	14520190	636021875565	41      	89
7207657400	52329243	435583017631	41      	57
3857645514	98804376	189470486214	41      	35
6613289086	34216640	308440276732	41      	56
4267735567	57225861	308440276732	42      	92
6939496597	25295733	317663070530	42      	17
6758921194	85980363	297083512852	42      	70
1971424470	29746978	986202008726	42      	20
6267352331	84845637	916984241291	42      	69
5963264222	13994657	509762284879	43      	10
8238526632	90187228	569219762080	43      	11
7038025925	74065278	863129185304	43      	47
4688687768	14550477	673737891943	43      	62
3501154222	41115192	176404904473	43      	12
7671146431	76308457	945312847530	44      	46
1041696514	71626365	514254550616	44      	80
9528022780	88068816	375276903331	44      	14
5633570761	75362417	389169531271	44      	44
6756496857	88347573	486804801433	44      	42
3413181570	94791271	836900805029	45      	76
4143640474	22396573	673737891943	45      	99
8571321349	15851430	418604295928	45      	81
3224863676	51133727	547685258313	45      	99
4072260019	99149477	339589987290	45      	94
7381140027	47492644	144568875894	46      	44
5719201957	94104398	413227470171	46      	37
3202963823	49304744	384179652400	46      	98
9296229981	29270078	421337093409	46      	5
7383939083	14797687	453357640486	46      	79
1511505063	74549507	383476286895	47      	51
6267352331	48684272	435583017631	47      	73
3937225081	88921948	749193678427	47      	47
4925167684	29997509	312237459250	47      	23
9033249885	60964604	718971287692	47      	18
2134459395	71779000	409542246104	48      	69
4691516229	94353735	330700905340	48      	51
4323489871	82774240	187272692439	48      	47
2721788806	36022675	486804801433	48      	72
2628943214	83672673	589814450967	48      	71
9984833166	30931944	381299535788	49      	100
9859289886	60839223	435583017631	49      	64
5185205464	62542016	568658660566	49      	71
1737695393	28751979	379942304309	49      	59
5217136758	15600583	482429892907	49      	47
7207657400	74536411	482340522139	50      	74
1007127177	50052635	290827207620	50      	87
4758421551	60995446	194144382996	50      	53
9176290163	16751500	875605607431	50      	23
6961767437	82986621	384179652400	50      	87
8552394845	86376413	525199185853	51      	96
4306662364	56773315	435122760857	51      	83
6766171955	79337702	511511692317	51      	94
8417181288	71600586	284083366181	51      	51
1971424470	56062075	208174494479	51      	8
6961767437	90109306	979700065093	52      	30
8613443722	48728681	749625390019	52      	1
5633570761	52137076	902956788286	52      	72
8133508491	89088602	272121204465	52      	46
1041696514	81207964	563144943925	52      	62
2929362520	93662282	516495915668	53      	59
1041696514	23683501	467986934495	53      	1
3232262245	28228583	174237001203	53      	42
3289827635	83527509	871701186034	53      	62
9911334282	58984073	986065693858	53      	60
1413628150	16254826	871701186034	54      	85
4306662364	24293240	805966823208	54      	9
8552394845	94607788	873640709962	54      	40
2628943214	83196029	589814450967	54      	67
1511505063	63250559	234646454745	54      	40
9176290163	57396134	518329844939	55      	32
6298481612	32837549	364745567029	55      	31
5145621850	41492561	816260222588	55      	2
8044068658	91976366	709229053555	55      	17
1007127177	52423498	868744054130	55      	39
1413628150	73447484	749193678427	56      	13
5149199675	42100228	349435998924	56      	38
5185205464	47074564	828509049873	56      	67
3882493546	40075295	771137437634	56      	71
8613443722	82844141	274761600136	56      	85
6579611591	18406168	899657914264	57      	48
8417181288	40216918	871701186034	57      	73
6267352331	80799363	67014520356 	57      	63
2461823714	11952895	467986934495	57      	12
9033249885	31632107	642234808130	57      	61
8719163626	50379403	180531962334	58      	48
7207657400	52128259	893005812666	58      	82
6075102214	47130105	411067277447	58      	38
2466473978	70784609	863129185304	58      	64
5921080373	42954740	208174494479	58      	88
6896741321	10009919	444797600349	59      	42
4688687768	29161944	769357296879	59      	81
2822133199	29286955	589814450967	59      	21
5549033462	28665714	567657950596	59      	18
6601774478	71996611	838962966418	59      	71
7862148938	25912003	986065693858	60      	31
7263490809	84651640	398900612810	60      	7
5899404919	31717821	129753980851	60      	9
2495997349	33721550	317663070530	60      	37
7116278144	36867459	558886167633	60      	74
2022526757	17793050	871701186034	61      	20
5318736001	58443181	334425348148	61      	94
2221154896	25914178	380734371410	61      	72
3396576291	52119681	187272692439	61      	34
5458636091	26907392	264132323061	61      	71
5318736001	85551162	986065693858	62      	45
5475050199	19503647	643925479319	62      	1
5961584539	36416837	207178796787	62      	81
5608081367	16271676	134390993040	62      	75
8512482553	47716735	516286957430	62      	36
6849665343	73339525	373709485267	63      	9
7038025925	77230455	839518983686	63      	49
7038025925	18284925	863129185304	63      	77
6579611591	57112882	608852371253	63      	13
3501154222	73739318	413227470171	63      	21
8067440133	12975841	516495915668	64      	56
5475050199	16592916	754664511022	64      	41
9057353891	56815276	380734371410	64      	11
2242735766	57303056	769357296879	64      	39
4925167684	89495274	894482053097	64      	26
8238526632	34877811	933914210509	65      	100
8238526632	21911014	673737891943	65      	29
7124041819	67364630	314482481265	65      	10
3759486084	46809627	887528437482	65      	5
5475050199	40314024	398900612810	65      	94
4831409387	51792120	420756960291	66      	45
2761695829	16549351	339589987290	66      	93
3505472187	70374685	869112308003	66      	26
5719201957	15177061	126834215166	66      	48
8613443722	68298652	982079076090	66      	65
3442482448	84974404	986202008726	67      	70
2495997349	65629240	435122760857	67      	2
3008326696	24250362	816260222588	67      	59
5318736001	72162856	941976384328	67      	13
3857645514	19911054	642234808130	67      	96
6758921194	48453332	154554749200	68      	81
2022526757	72742360	152614854189	68      	86
2732870626	33775511	453357640486	68      	41
7211210217	40448708	467615168772	68      	65
6579611591	36385659	379942304309	68      	84
6766171955	11198735	261188186216	69      	83
4323489871	24140671	482429892907	69      	2
3224863676	24139784	868744054130	69      	3
4758421551	55032660	749193678427	69      	39
6896741321	60831184	400930079611	69      	70
5834583085	21141531	308440276732	70      	61
8089519838	20390938	453357640486	70      	81
6298481612	87802280	576518370019	70      	63
2473778271	89424107	483738463713	70      	42
3232262245	45561922	261188186216	70      	33
6766171955	18935898	833663232208	71      	18
7207657400	85140871	308440276732	71      	25
8564213736	94587153	420756960291	71      	25
1971424470	86496008	483738463713	71      	70
2279056566	89350856	400930079611	71      	84
2155030720	23388660	379942304309	72      	82
7205472287	20424036	418604295928	72      	76
6746827048	58546602	643925479319	72      	33
6698635493	90283200	875605607431	72      	9
3505472187	35845071	557899454410	72      	87
6758921194	65847198	894482053097	73      	20
7211210217	84518421	919197823026	73      	39
3555061016	12735213	227635917829	73      	18
0123456789	44804983	904647940449	73      	79
6896741321	56254213	770565227675	73      	9
8613443722	92072313	849681336901	74      	86
9911334282	13805416	945312847530	74      	9
4462548794	91982442	769357296879	74      	9
4267735567	96707968	803607788754	74      	8
9033249885	28148259	450659382698	74      	46
9251037101	23430501	697814031389	75      	70
2194069220	81297094	600770885624	75      	96
3228266818	74883606	108649313374	75      	65
8731889087	58104705	933914210509	75      	36
6788946633	55235388	384468659793	75      	34
4267735567	17676491	203262278452	76      	48
3264239750	48637164	173672457176	76      	25
9984833166	67172515	159425007904	76      	35
3407030933	42140643	722946564026	76      	60
6922989673	83501910	167742802915	76      	86
8417181288	31614409	636021875565	77      	17
6746827048	83191991	261188186216	77      	1
6929681529	39937521	389169531271	77      	11
5458636091	93254759	861348595761	77      	32
1737695393	87974165	986202008726	77      	4
6457985321	75752844	547244118460	78      	94
8872404266	79107995	945012228482	78      	73
7383939083	94118555	126834215166	78      	28
4752628252	30739284	999543417737	78      	52
6788946633	11931023	557899454410	78      	82
1728134760	94750649	152614854189	79      	52
6849665343	59613361	696368469198	79      	36
2329656829	68460591	264132323061	79      	96
6872967398	32451408	199968033019	79      	38
8133508491	10886338	769357296879	79      	56
2242735766	19948808	839518983686	80      	28
6601774478	21357546	199753522658	80      	94
8685919938	79695741	692492393712	80      	47
3228266818	61120880	919197823026	80      	35
2685161059	92336799	590034051433	80      	3
9296229981	94411615	986065693858	81      	49
2221154896	48513734	994411186239	81      	43
5549033462	66776441	999543417737	81      	83
8872404266	71703718	770565227675	81      	32
6209655947	70351915	871701186034	81      	77
2461823714	93573844	722946564026	82      	80
9628032353	68357953	899657914264	82      	19
3264239750	48818406	308792010934	82      	99
0123456789	97734189	569219762080	82      	52
4228097219	45397814	113476782830	82      	54
7038025925	79823422	400930079611	83      	93
8417181288	97344285	103362565865	83      	49
5549033462	83906793	339589987290	83      	82
2721788806	43156665	413227470171	83      	66
3396576291	92422916	875605607431	83      	57
6922989673	77937831	144568875894	84      	64
9695919715	50004997	576518370019	84      	32
2537304659	98091387	948543507361	84      	95
5834583085	98462392	457459442332	84      	33
9119153655	96169369	716818652888	84      	5
5633570761	38663134	692492393712	85      	7
9119153655	43646816	334425348148	85      	48
1007127177	17966035	400127531270	85      	6
3212001020	13371675	816260222588	85      	24
7208494824	36017863	490997846898	85      	2
1798825222	27593134	334074319971	86      	63
4925167684	43581861	435583017631	86      	67
6746827048	45799130	732970729968	86      	99
9984833166	78955216	444797600349	86      	20
4141889531	97513335	103362565865	86      	56
8031688077	45993149	771137437634	87      	90
6099232381	23299821	952550789390	87      	35
4497141442	77130720	108326062706	87      	42
5549033462	35658001	103362565865	87      	84
2134459395	56394856	381299535788	87      	88
6961767437	42804763	261188186216	88      	69
3759486084	38688193	444797600349	88      	75
1798825222	36771189	721857506010	88      	21
8067440133	21879843	862174790606	88      	72
8546488578	36361330	849681336901	88      	30
5719201957	16186830	265444172694	89      	13
4367035640	34706705	411067277447	89      	65
3438857837	13238349	716818652888	89      	65
3224863676	67190200	925484684473	89      	67
8685919938	86672181	297083512852	89      	62
4377909332	54888571	859109096191	90      	72
2542508689	88299748	660310920540	90      	2
4758421551	51705684	925484684473	90      	95
8133508491	54867652	868744054130	90      	30
5549033462	44166634	210526151030	90      	92
5557994994	99977479	839518983686	91      	65
6075102214	65663564	875125493289	91      	8
2329656829	78704106	384179652400	91      	14
6922989673	57016501	679453075525	91      	32
3957160343	44758644	814141265887	91      	68
4497141442	76034119	67014520356 	92      	45
6579611591	57785653	118389501460	92      	53
4462548794	83304905	380734371410	92      	10
3394024658	99285606	129753980851	92      	13
9911334282	78536985	692492393712	92      	50
7207657400	35462576	430946284790	93      	80
6979644969	40422455	986065693858	93      	95
2929362520	33404417	696368469198	93      	9
3396576291	74280264	261188186216	93      	87
2022526757	12798316	509762284879	93      	84
6099232381	81977175	488529033803	94      	25
1728134760	70248322	172950643766	94      	31
5719201957	31824912	838962966418	94      	46
6075102214	49499032	948543507361	94      	46
2329656829	24909568	483738463713	94      	80
2732870626	66598276	558886167633	95      	10
2542508689	53258326	986065693858	95      	80
2134459395	14061792	572878568883	95      	84
6766171955	61120421	203262278452	95      	93
1728134760	40241733	265444172694	95      	24
6144969851	80689233	642234808130	96      	34
4072260019	46322885	578147508823	96      	92
9057353891	61924892	547685258313	96      	26
3164782687	26022574	862174790606	96      	60
8405144973	21694636	706236730898	96      	4
5633570761	59328704	566877828296	97      	14
6579611591	25125570	400930079611	97      	81
2221154896	65924755	418604295928	97      	35
2242735766	86369690	578705048123	97      	27
1492680627	27193689	836900805029	97      	47
8512482553	44348331	986065693858	98      	8
5641652995	77278876	414652410482	98      	70
2685161059	65238501	506298714832	98      	97
2022526757	51792898	558886167633	98      	30
8417181288	20795890	803607788754	98      	40
3438857837	60414091	400930079611	99      	10
7383939083	35561847	646511826677	99      	53
4688687768	12483407	349435998924	99      	88
6979644969	77247186	771137437634	99      	52
6099232381	45909185	528771298719	99      	39
5217136758	89496027	194144382996	100     	57
8238526632	45576432	167742802915	100     	21
1737695393	83272740	660310920540	100     	54
9296229981	59871683	421337093409	100     	97
5791573168	49375675	511511692317	100     	56
2495997349	83559354	308792010934	101     	61
3289827635	52971493	608852371253	101     	41
6099232381	16166833	982079076090	101     	9
8731889087	82902626	418604295928	101     	71
1532520627	95749022	400930079611	101     	38
4925167684	23097261	566877828296	102     	63
2155030720	57265872	284083366181	102     	52
2732870626	79201979	669515708071	102     	19
1629932982	59517360	716818652888	102     	64
2194069220	43993784	430946284790	102     	36
7205472287	33788833	506298714832	103     	32
8512482553	40076863	554521191996	103     	37
2155030720	66487220	383476286895	103     	2
4497141442	77559983	589814450967	103     	35
5318736001	95111547	189470486214	103     	79
4323489871	95504237	322758894316	104     	64
9057353891	32983030	380734371410	104     	29
8732245967	27772889	814141265887	104     	40
7211210217	56861430	882152991390	104     	30
6609295298	88452804	945312847530	104     	31
2822133199	81995101	566877828296	105     	91
9305781770	81489587	284083366181	105     	90
1971424470	25182688	919197823026	105     	85
7208494824	17802012	698718941817	105     	5
5185205464	17167688	444797600349	105     	50
3937225081	96968871	144568875894	106     	76
8872404266	76732716	523196696835	106     	78
8685919938	73837165	384468659793	106     	53
8613443722	19204151	529831629045	106     	91
9305781770	15161148	187272692439	106     	46
4413418188	24693992	660310920540	107     	71
5899404919	43822545	108649313374	107     	48
4267735567	38876109	261188186216	107     	55
5633570761	14382621	887528437482	107     	60
6929681529	37986502	203262278452	107     	39
7862148938	53153280	518787417161	108     	74
4691516229	74268616	572878568883	108     	94
4831409387	63876112	316871031375	108     	58
6325640898	28678551	979700065093	108     	28
2761695829	23752531	547685258313	108     	69
3703311506	38407305	962728896848	109     	64
6872967398	48876927	649921994715	109     	31
9984833166	79988042	67014520356 	109     	9
5791573168	98970945	944472664850	109     	76
4688687768	27833362	996103067914	109     	87
1511505063	19647218	173672457176	110     	88
8018916776	56064880	314482481265	110     	65
6002323152	42782307	786975743876	110     	8
8512482553	24595842	603333456348	110     	26
9911334282	81035282	284083366181	110     	24
8663049346	52335546	129753980851	111     	61
6609295298	76208754	421337093409	111     	69
3264239750	13583514	863129185304	111     	74
6099232381	36183335	419481071217	111     	95
3396576291	93727864	568658660566	111     	5
3703311506	68771359	384468659793	112     	15
0123456789	50375837	749193678427	112     	26
8089519838	57365729	139669412174	112     	4
5608081367	15094053	828509049873	112     	14
6601774478	56017689	576518370019	112     	57
7205472287	45433736	722946564026	113     	43
5791573168	35409065	904647940449	113     	100
2628943214	61871748	838962966418	113     	99
2628943214	68333311	702421087613	113     	32
5608081367	68684677	566877828296	113     	94
4688687768	76022994	412348931569	114     	65
9695919715	57056989	649921994715	114     	66
9859289886	54740705	636021875565	114     	80
3228266818	77799562	308792010934	114     	24
2495997349	79541305	702830548447	114     	93
2208061030	36988532	828509049873	115     	65
7065815243	85757933	529831629045	115     	67
8031688077	20566061	765572003296	115     	93
3555061016	38369629	152614854189	115     	8
4267735567	35039921	322758894316	115     	59
5185205464	15236209	887528437482	116     	74
2822133199	46464550	199753522658	116     	59
6002323152	45014365	603333456348	116     	34
5921080373	75746586	859109096191	116     	86
4462548794	95736669	473186595371	116     	75
4752628252	65808586	411067277447	117     	25
2155030720	62668151	516495915668	117     	15
5475050199	11802711	384179652400	117     	54
8685919938	16438845	706236730898	117     	25
0123456789	77952784	576518370019	117     	65
9628032353	42103434	765572003296	118     	45
6778124472	67477164	511511692317	118     	83
3394024658	67451202	979700065093	118     	11
2466473978	76941838	103362565865	118     	50
7065815243	98274580	379942304309	118     	23
6922989673	36639265	176404904473	119     	74
1041696514	49206814	419481071217	119     	97
3442482448	46045275	118389501460	119     	77
4367035640	72995808	467986934495	119     	82
5921080373	92045026	534109743798	119     	98
7671146431	47326598	300475101700	120     	92
3703311506	54004420	868744054130	120     	8
6618381028	10818150	419481071217	120     	66
7208494824	27967664	482340522139	120     	37
3442482448	37531418	388403878360	120     	43
3228266818	29977913	916984241291	121     	55
4831409387	81664444	317663070530	121     	34
5899404919	71359377	189470486214	121     	14
7381140027	91012391	887528437482	121     	65
2194069220	86185167	578147508823	121     	31
2329656829	92741436	384179652400	122     	99
5899404919	94099647	718971287692	122     	58
4367035640	53878584	316871031375	122     	71
1737695393	22424612	152614854189	122     	76
6144969851	94870453	558886167633	122     	69
6778124472	79028332	317663070530	123     	45
6806054949	89654031	732970729968	123     	41
2721788806	17239763	882152991390	123     	38
3759486084	11569895	314482481265	123     	47
4072260019	42576333	194144382996	123     	14
5458636091	39892458	516286957430	124     	32
5963264222	31774013	205930062465	124     	88
3413181570	18500908	925173129386	124     	20
7671146431	15020666	945012228482	124     	97
4462548794	46977493	126834215166	124     	59
9057353891	16883852	569219762080	125     	2
2761695829	82158558	419446364450	125     	71
7802118695	14138222	139669412174	125     	90
6117150833	58725970	511511692317	125     	61
6099232381	96408138	486804801433	125     	98
7205472287	35846285	127026679653	126     	99
5217136758	54632639	435583017631	126     	27
2461823714	20658944	986202008726	126     	48
6002323152	84360478	118389501460	126     	48
3703311506	46754666	516495915668	126     	81
2221154896	74453800	134390993040	127     	55
2473778271	98785109	868744054130	127     	66
9859289886	65079086	771137437634	127     	86
3413181570	56558913	933914210509	127     	61
9628032353	21167656	103362565865	127     	87
4367035640	86156501	979700065093	128     	41
3212001020	78557529	373709485267	128     	72
9305781770	64738510	925173129386	128     	97
0123456789	65142759	425456990082	128     	36
3442482448	38286866	384179652400	128     	88
7207657400	63476932	549746556299	129     	82
4141889531	59838994	108649313374	129     	22
6766171955	89326386	108649313374	129     	68
9033249885	81278769	308440276732	129     	61
6117150833	76561488	199968033019	129     	90
5185205464	90816936	893005812666	130     	97
3438857837	93849063	962728896848	130     	19
6117150833	34190008	129753980851	130     	22
6712129706	91870529	925173129386	130     	28
5899404919	22213574	643925479319	130     	17
2628943214	97972896	786975743876	131     	91
5719201957	41012271	308792010934	131     	24
3957160343	77949061	769357296879	131     	74
1079167299	88257091	425456990082	131     	18
8133508491	70812511	380734371410	131     	24
2495997349	55731808	750886611187	132     	19
5963264222	20121653	945312847530	132     	10
2721788806	48386099	516286957430	132     	29
6712129706	94352554	457459442332	132     	93
8564213736	23140386	187272692439	132     	39
3759486084	23000887	618570550236	133     	33
7116278144	90165134	375276903331	133     	79
7124041819	96121971	284083366181	133     	99
5217136758	72996113	400127531270	133     	7
7038025925	67360205	589814450967	133     	42
5216472904	25385663	836900805029	134     	22
7383939083	25736141	706236730898	134     	37
3228266818	32001126	330700905340	134     	49
5185205464	10816216	421337093409	134     	94
6609295298	23284559	234646454745	134     	91
6872967398	27882475	174237001203	135     	56
8089519838	69858684	771137437634	135     	18
5609753201	50740094	716818652888	135     	91
8089519838	36969927	603333456348	135     	24
8044068658	59943054	457459442332	135     	63
7976703056	23500198	308440276732	136     	65
3224863676	42016710	274761600136	136     	18
5145621850	34073977	697814031389	136     	40
2542508689	38268844	576518370019	136     	39
6579611591	18365541	740581174440	136     	23
4497141442	69098387	556388862616	137     	13
2134459395	61772672	67014520356 	137     	11
4072260019	11454818	770565227675	137     	36
7862148938	66391185	430946284790	137     	56
5608081367	53787476	300475101700	137     	42
1079167299	34540628	896919583724	138     	92
8663049346	29241266	364745567029	138     	91
6907684648	99834676	698718941817	138     	49
8089519838	39638426	698718941817	138     	7
1492680627	37037839	536851950801	138     	48
4367035640	10566075	952550789390	139     	81
2822133199	99441269	572878568883	139     	54
6579611591	96668182	896919583724	139     	11
7976703056	75799657	861348595761	139     	36
4306662364	98565438	234646454745	139     	18
9695919715	80056862	420756960291	140     	48
7969888831	32521880	697814031389	140     	37
8512482553	70105402	523196696835	140     	28
9251037101	41500828	600770885624	140     	54
6712129706	12064790	444797600349	140     	91
5458636091	86995345	566877828296	141     	14
9628032353	88439163	769357296879	141     	43
3882983658	55210836	979700065093	141     	23
3224863676	91175397	435583017631	141     	59
1532520627	94275473	769357296879	141     	90
6766171955	26212804	334074319971	142     	1
2761695829	66975624	264132323061	142     	80
1798825222	40477622	488529033803	142     	83
1947254190	73411017	839518983686	142     	70
1798825222	47488334	945012228482	142     	15
8067440133	70265208	569219762080	143     	74
7802118695	25925200	646511826677	143     	96
5062815303	49953161	529831629045	143     	2
4758421551	95013361	377848719039	143     	56
5204765617	41419396	379942304309	143     	2
8685919938	18202907	902956788286	144     	37
8719163626	98510785	488529033803	144     	43
9296229981	67564966	698718941817	144     	58
5578561084	33923373	421337093409	144     	32
7383939083	63240096	516286957430	144     	62
4758421551	42574595	413227470171	145     	69
4141889531	15239302	400127531270	145     	41
5149199675	87715732	388403878360	145     	28
2134459395	12960648	308440276732	145     	87
8872404266	94900607	839518983686	145     	42
3008326696	42907720	508818965558	146     	42
7976703056	62869368	400930079611	146     	65
8552394845	12409243	339589987290	146     	32
5834583085	69137668	547685258313	146     	56
1629932982	78604102	322758894316	146     	16
6922989673	21209403	421337093409	147     	91
5019312140	41232065	732970729968	147     	23
2389037733	69273477	409542246104	147     	18
4367035640	86034935	294993047536	147     	5
8031688077	44244701	642234808130	147     	51
4497141442	64033924	803607788754	148     	35
0123456789	86423696	205930062465	148     	51
2685161059	51587829	294993047536	148     	68
5019312140	57039102	861348595761	148     	23
5921080373	36756875	144568875894	148     	71
7038025925	48509400	567657950596	149     	88
2542508689	36255479	252522255166	149     	52
7206340636	60009952	805966823208	149     	8
2732870626	51984415	516286957430	149     	68
4831409387	55696811	199968033019	149     	1
8031688077	14141655	862174790606	150     	7
6609295298	95858347	290827207620	150     	30
6117150833	59405522	419481071217	150     	8
5216472904	36899300	893005812666	150     	6
2221154896	29356873	722946564026	150     	73
6788946633	30397317	998040421944	151     	49
8731889087	72024582	569219762080	151     	70
3228266818	51909389	836900805029	151     	66
8685919938	86312119	154554749200	151     	21
5609753201	30161959	174237001203	151     	80
6872967398	23801170	698718941817	152     	13
1687575631	94536807	986065693858	152     	97
9057353891	17914713	108649313374	152     	36
5641652995	93266058	490997846898	152     	85
9984833166	29294869	859109096191	152     	2
2194069220	21690552	994411186239	153     	47
5899404919	64700130	603333456348	153     	16
2242735766	22128179	861348595761	153     	95
4413418188	70073188	630929030795	153     	80
7263490809	71518117	194144382996	153     	30
3937225081	42906412	882152991390	154     	39
2495997349	88306330	527453991710	154     	7
8613443722	12660605	108326062706	154     	32
4072260019	28296175	894482053097	154     	21
6746827048	99275357	483738463713	154     	100
8719163626	97042743	317663070530	155     	62
5019312140	61003904	508818965558	155     	49
3957160343	40427811	919197823026	155     	89
5633570761	43120659	227635917829	155     	92
3264239750	17407872	630929030795	155     	87
9043656607	46062389	877194198700	156     	44
4377909332	19357585	523196696835	156     	49
9695919715	93342496	194144382996	156     	46
8685919938	22157013	349435998924	156     	65
4691516229	18083814	771137437634	156     	23
3138633625	19371460	199753522658	157     	4
2685161059	49228086	126834215166	157     	32
9119153655	99344145	769357296879	157     	100
7802118695	55863830	176404904473	157     	32
5216472904	93283048	547244118460	157     	3
4293159647	14978472	322758894316	158     	49
1798825222	68784175	893005812666	158     	41
4323489871	91622631	418604295928	158     	34
1687575631	33539654	549746556299	158     	77
6325640898	30551144	871701186034	158     	90
5458636091	92559433	274761600136	159     	93
3396576291	16411932	786975743876	159     	88
9251037101	24284234	948543507361	159     	1
3264239750	12843018	554521191996	159     	100
9176290163	14622617	375276903331	159     	23
3008326696	37286039	126834215166	160     	64
6756496857	24579966	732970729968	160     	13
2542508689	27996735	528771298719	160     	80
5511880212	51171578	490997846898	160     	81
8552394845	29655130	308792010934	160     	64
5719201957	96846348	618570550236	161     	87
9984833166	17255258	862174790606	161     	41
5578561084	37956712	649921994715	161     	79
5217136758	57105563	203262278452	161     	64
5549033462	42308680	590034051433	161     	94
6601774478	97393286	939369924082	162     	4
4377909332	89658219	558886167633	162     	55
5242462708	16496374	899657914264	162     	30
3413181570	52575745	771137437634	162     	61
7205472287	97661395	871701186034	162     	100
7124041819	64291666	482340522139	163     	64
3394024658	47843413	952550789390	163     	54
6896741321	87918231	875605607431	163     	5
8719163626	68989384	925173129386	163     	27
7976703056	61956798	316871031375	163     	11
2495997349	46217546	836900805029	164     	18
3138633625	80147571	702830548447	164     	25
8238526632	67904028	117431954043	164     	95
2242735766	56384167	765572003296	164     	69
6618381028	16167977	557899454410	164     	94
2822133199	88654848	117431954043	165     	50
3179028009	15815924	159425007904	165     	66
7207657400	23747434	925484684473	165     	64
2822133199	64786251	706236730898	165     	83
4925167684	12940278	172950643766	165     	3
2466473978	81638005	414652410482	166     	88
9984833166	47117945	882152991390	166     	84
6099232381	98993914	702421087613	166     	18
4228097219	52293493	673737891943	166     	90
9911334282	60769620	869112308003	166     	15
8719163626	40819308	250617599940	167     	92
6298481612	54176416	566877828296	167     	100
1728134760	95684130	816260222588	167     	68
5185205464	31059162	877194198700	167     	43
3703311506	73680479	527453991710	167     	34
9695919715	26763170	167742802915	168     	67
6929681529	48945962	775611741635	168     	17
2461823714	64884345	569219762080	168     	37
7434024297	63715342	435583017631	168     	6
8613443722	16655876	284083366181	168     	10
1947254190	18887768	741544174664	169     	30
2466473978	56241224	925173129386	169     	1
6325640898	74664686	896919583724	169     	32
4758421551	98901388	916984241291	169     	78
3407030933	80690968	654563447110	169     	94
7434024297	93201425	152614854189	170     	16
4688687768	16462301	384468659793	170     	65
8732245967	50826441	495776106616	170     	23
8067440133	56088478	286243122717	170     	7
5641652995	75098460	861348595761	170     	19
5641652995	63072790	916984241291	171     	36
7802118695	43173097	103362565865	171     	15
5961584539	14481818	488529033803	171     	45
2628943214	25130955	933914210509	171     	17
8089519838	18675930	673737891943	171     	18
2495997349	56648919	108649313374	172     	45
6609295298	38215967	189470486214	172     	91
6756496857	19477401	945012228482	172     	46
9695919715	43427853	430946284790	172     	50
5549033462	57348764	547685258313	172     	88
4413418188	66811744	414652410482	173     	59
4323489871	47365793	871701186034	173     	86
2329656829	15822768	377848719039	173     	10
5217136758	96701284	904647940449	173     	60
4752628252	59860270	523196696835	173     	20
7207657400	62788571	134390993040	174     	41
3232262245	80895079	103362565865	174     	34
6325640898	90890104	875605607431	174     	78
6144969851	96431998	421337093409	174     	12
9296229981	75015780	875125493289	174     	5
4831409387	30702323	419446364450	175     	66
6712129706	42769348	514254550616	175     	59
6398368619	82657632	483738463713	175     	15
1079167299	97351158	871701186034	175     	75
5216472904	50792759	400930079611	175     	52
1532520627	60738898	902956788286	176     	4
5834583085	12707975	646511826677	176     	40
1687575631	71427946	388403878360	176     	81
8685919938	60388919	286243122717	176     	51
5318736001	29880262	379942304309	1       	96
8872404266	45509465	873640709962	1       	77
3264239750	85388430	314482481265	1       	74
4141889531	92614054	126834215166	1       	7
3138633625	80728428	317663070530	1       	1
1079167299	13608247	945312847530	2       	75
8031688077	58489739	721857506010	2       	56
5185205464	40957151	994411186239	2       	44
9176290163	45355130	933914210509	2       	84
3228266818	61445751	413227470171	2       	30
6117150833	39843047	413227470171	3       	65
3264239750	37008405	629919786056	3       	33
6209655947	29347300	518787417161	3       	96
5458636091	12114773	786975743876	3       	79
5641652995	31177509	272121204465	3       	69
3882493546	76956947	568658660566	4       	13
3164782687	78847807	558886167633	4       	14
6075102214	65650222	923237099384	4       	55
2461823714	70744810	467986934495	4       	29
5242462708	27395655	716818652888	4       	42
5242462708	70293056	838962966418	5       	24
5834583085	90923775	702421087613	5       	79
6267352331	68324475	722946564026	5       	8
5633570761	86848572	234646454745	5       	99
3882493546	63141690	286243122717	5       	19
6872967398	78382179	696368469198	6       	58
1947254190	83247420	412348931569	6       	96
8872404266	59697951	925484684473	6       	62
7802118695	15422370	786975743876	6       	4
3289827635	95991576	134390993040	6       	30
6929681529	33701169	636021875565	7       	80
6758921194	68145213	103362565865	7       	93
3501154222	20138510	877194198700	7       	7
1971424470	99810426	483738463713	7       	94
3164782687	18822783	467986934495	7       	67
7124041819	12325506	412348931569	8       	87
1798825222	46099760	339589987290	8       	45
6929681529	72648069	117431954043	8       	56
4323489871	20421227	180531962334	8       	50
1007127177	17690362	514254550616	8       	3
6398368619	37541726	210526151030	9       	78
5217136758	43849430	199968033019	9       	31
8663049346	37387737	234646454745	9       	29
2022526757	78879699	558886167633	9       	58
5318736001	74616589	697814031389	9       	58
8731889087	37208490	962728896848	10      	25
2022526757	23116109	838962966418	10      	50
6922989673	30292312	411067277447	10      	13
6756496857	83315792	67014520356 	10      	11
1532520627	73727452	168074802141	10      	9
1532520627	25445868	608852371253	11      	47
3179028009	93670775	534109743798	11      	28
7263490809	22642396	692492393712	11      	44
1728134760	47645930	308440276732	11      	81
2461823714	10610299	208174494479	11      	15
2134459395	19560507	294993047536	12      	75
6601774478	24179462	868744054130	12      	35
8238526632	88519023	154554749200	12      	92
6788946633	36829662	986202008726	12      	13
6613289086	18824657	741544174664	12      	72
6618381028	43097539	473186595371	13      	27
8731889087	46739369	945012228482	13      	33
6579611591	15551385	775611741635	13      	78
6788946633	39914502	509762284879	13      	37
1007127177	61809574	529831629045	13      	10
6267352331	86442100	203262278452	14      	61
3164782687	32039505	933914210509	14      	90
7434024297	89498694	132186536765	14      	6
2208061030	74221668	375276903331	14      	18
6002323152	31700685	488529033803	14      	43
6758921194	72024267	420756960291	15      	43
5921080373	13245725	716818652888	15      	56
4752628252	10562515	630929030795	15      	95
7671146431	26603215	600770885624	15      	83
6979644969	50117611	199968033019	15      	15
4306662364	78104761	529831629045	16      	30
5963264222	34416357	435583017631	16      	70
2022526757	36211767	838962966418	16      	9
3442482448	42571189	536851950801	16      	5
4143640474	31719141	189470486214	16      	87
3857645514	30586032	709229053555	17      	31
2461823714	40023651	896919583724	17      	94
1798825222	89184206	557899454410	17      	64
4072260019	96510479	146051347589	17      	92
4141889531	54381673	979700065093	17      	67
6896741321	64038733	803607788754	18      	22
5899404919	53130491	187272692439	18      	33
8613443722	62842178	330700905340	18      	69
7208494824	14703459	996103067914	18      	13
3703311506	11564564	633320411611	18      	46
1511505063	74410528	536851950801	19      	12
9911334282	37444011	173672457176	19      	33
2721788806	39961492	103362565865	19      	56
5149199675	77638003	457459442332	19      	42
2721788806	94995649	869112308003	19      	7
7207657400	40542743	649921994715	20      	88
8018916776	68302735	754664511022	20      	66
8405144973	76165831	849681336901	20      	71
2537304659	22203140	234646454745	20      	12
1947254190	16262514	839518983686	20      	79
5019312140	94799114	203262278452	21      	50
8512482553	20594188	199968033019	21      	17
3224863676	79725740	982079076090	21      	86
4752628252	88645321	999543417737	21      	64
5791573168	25645016	146051347589	21      	10
3555061016	98565599	495776106616	22      	9
3857645514	21825054	400127531270	22      	64
3413181570	44375112	400930079611	22      	36
7216071890	16217966	189470486214	22      	49
7124041819	82795133	300475101700	22      	20
9911334282	40945374	568658660566	23      	47
5834583085	65258043	716818652888	23      	39
5921080373	66334690	286243122717	23      	97
6872967398	44686401	509762284879	23      	93
5963264222	50842641	514254550616	23      	3
6298481612	30709392	919197823026	24      	27
6712129706	23428966	435583017631	24      	56
1413628150	51758889	457459442332	24      	5
9628032353	29161468	877194198700	24      	78
8018916776	24525138	849681336901	24      	90
6698635493	40986961	660310920540	25      	66
5149199675	69018321	933914210509	25      	69
3202963823	50264067	384179652400	25      	38
5242462708	84701614	518787417161	25      	76
0123456789	71413909	750886611187	25      	68
6849665343	61795957	875605607431	26      	62
8089519838	50953130	67014520356 	26      	54
8685919938	59486577	882152991390	26      	26
3289827635	52024136	709229053555	26      	34
3396576291	11348594	246144606961	26      	7
8872404266	48667031	419446364450	27      	40
6872967398	17265032	706236730898	27      	83
6209655947	37135519	945012228482	27      	29
7038025925	29388868	113476782830	27      	34
5185205464	86211085	482429892907	27      	72
7205472287	64557821	576518370019	28      	18
2921157997	41087725	660310920540	28      	48
4377909332	66775689	227635917829	28      	46
9119153655	31050737	702421087613	28      	55
6325640898	90961791	349330324726	28      	64
7205472287	19037992	167742802915	29      	38
1532520627	41178107	261188186216	29      	61
6267352331	47233863	317663070530	29      	51
8613443722	71763930	722946564026	29      	66
5475050199	91579235	482429892907	29      	21
3202963823	40167929	383476286895	30      	90
2732870626	26546357	944472664850	30      	40
2461823714	83054841	603333456348	30      	8
7671146431	86161620	859109096191	30      	24
8571321349	28361598	373709485267	30      	59
5608081367	85873533	894482053097	31      	21
3396576291	56593771	511511692317	31      	46
8405144973	20333134	516286957430	31      	93
8133508491	96357543	172950643766	31      	87
1687575631	53498886	444797600349	31      	42
3555061016	89228222	187272692439	32      	88
5149199675	67761931	108649313374	32      	29
6979644969	29644836	187272692439	32      	45
2542508689	65311203	67014520356 	32      	85
3232262245	79279761	893005812666	32      	79
5633570761	23312670	750886611187	33      	23
5204765617	86374521	317663070530	33      	23
6209655947	58310930	400127531270	33      	10
8133508491	86548330	814141265887	33      	82
6907684648	35183315	696368469198	33      	26
5641652995	10729034	488529033803	34      	3
3407030933	82578669	814141265887	34      	59
3396576291	65117850	944472664850	34      	81
2389037733	47320230	941976384328	34      	27
5633570761	91452727	509762284879	34      	17
5557994994	12149055	286243122717	35      	32
7038025925	46221589	941976384328	35      	27
8995437747	93114161	126834215166	35      	87
0123456789	64454020	290827207620	35      	26
5961584539	58379250	816260222588	35      	46
3759486084	36045293	488529033803	36      	99
8018916776	38593967	246144606961	36      	26
0123456789	97396756	108326062706	36      	17
1511505063	35660817	261188186216	36      	44
8405144973	92315861	939369924082	36      	99
6746827048	63025146	199968033019	37      	44
2537304659	89652328	646511826677	37      	24
8238526632	21688647	814141265887	37      	53
1629932982	29911198	506298714832	37      	82
4306662364	58172045	887528437482	37      	78
2473778271	27247523	904647940449	38      	51
6896741321	82683485	168074802141	38      	87
4497141442	69950652	925484684473	38      	39
8133508491	24157314	467615168772	38      	40
6806054949	89444744	419446364450	38      	55
6756496857	16718527	450659382698	39      	16
4306662364	68598209	467615168772	39      	70
8731889087	61886611	633320411611	39      	75
2732870626	45625722	702830548447	39      	7
1007127177	92001014	227635917829	39      	84
4143640474	46361439	375276903331	40      	53
9911334282	76361115	312237459250	40      	55
6806054949	97562874	486804801433	40      	57
5185205464	19125038	336491915536	40      	52
5145621850	72827498	312237459250	40      	47
3394024658	76907797	873640709962	41      	22
2134459395	19752875	556388862616	41      	33
8417181288	38280753	139669412174	41      	76
2542508689	71491794	549746556299	41      	30
4367035640	49940891	869112308003	41      	62
2221154896	48958544	495776106616	42      	8
9911334282	48883689	925484684473	42      	41
9859289886	25748012	529831629045	42      	21
7383939083	96869736	716818652888	42      	34
4367035640	74342731	207178796787	42      	54
8417181288	61514721	741544174664	43      	23
7381140027	26887849	576518370019	43      	82
4758421551	88435926	227635917829	43      	61
5719201957	13409183	388403878360	43      	67
6979644969	90925251	297083512852	43      	90
2022526757	54215325	380734371410	44      	93
6613289086	79712863	547685258313	44      	96
9296229981	86032494	174237001203	44      	44
3394024658	93543770	836900805029	44      	72
5217136758	99022456	388403878360	44      	93
6961767437	85890590	660310920540	45      	35
5578561084	55730171	300475101700	45      	77
6896741321	99790865	129753980851	45      	68
9176290163	74018255	769357296879	45      	81
5458636091	13977423	721857506010	45      	27
2685161059	29102632	205930062465	46      	76
3857645514	90569969	265444172694	46      	39
1737695393	13568851	962728896848	46      	12
6298481612	72159178	207178796787	46      	17
3224863676	21499512	377848719039	46      	24
5458636091	91897058	952550789390	47      	84
7802118695	16055265	113476782830	47      	64
4377909332	39448133	113476782830	47      	50
7116278144	20633285	140903716305	47      	22
9305781770	96024717	514254550616	47      	47
7969888831	36372686	419446364450	48      	68
1798825222	40682990	618570550236	48      	51
6756496857	53254496	669515708071	48      	99
2921157997	35318159	939369924082	48      	31
5963264222	16579957	421337093409	48      	96
6298481612	42632648	516495915668	49      	14
2495997349	22016083	317663070530	49      	16
6601774478	47396834	660310920540	49      	38
4323489871	83514198	528771298719	49      	80
5549033462	29584601	490997846898	49      	90
8031688077	82978476	894482053097	50      	87
3703311506	21542812	786975743876	50      	39
4267735567	31945876	618570550236	50      	81
6457985321	92872523	875605607431	50      	61
3759486084	64847774	419446364450	50      	95
6766171955	59330808	314482481265	51      	84
8552394845	38306157	754664511022	51      	3
4367035640	45740006	207178796787	51      	53
6896741321	92516215	569219762080	51      	58
7976703056	31733069	523196696835	51      	21
6398368619	37089475	839518983686	52      	34
6778124472	77451795	132954606361	52      	98
3264239750	34581033	814141265887	52      	19
1629932982	39112723	453357640486	52      	3
5204765617	10497173	750886611187	52      	80
4306662364	14344922	600770885624	53      	18
3438857837	63777604	398900612810	53      	72
6144969851	69775588	400127531270	53      	97
6209655947	46177285	453357640486	53      	7
3164782687	14114531	998040421944	53      	79
8732245967	48780921	495776106616	54      	41
6929681529	62399352	308792010934	54      	45
2221154896	92400852	127026679653	54      	47
8552394845	62252279	718971287692	54      	23
3138633625	99987737	590034051433	54      	46
8613443722	31424935	349330324726	55      	15
7124041819	67016928	300475101700	55      	45
1629932982	20804735	740581174440	55      	90
9043656607	29155091	207178796787	55      	72
2208061030	47248746	265444172694	55      	71
2685161059	93072299	554521191996	56      	49
6002323152	66817155	896919583724	56      	46
7116278144	39249400	692492393712	56      	36
2628943214	33977049	414652410482	56      	46
8018916776	96212566	643925479319	56      	4
6075102214	44633516	444797600349	57      	53
8663049346	17862009	567657950596	57      	29
9176290163	82839341	649921994715	57      	74
8571321349	60492449	373709485267	57      	45
6961767437	45610946	939369924082	57      	73
9859289886	97130597	569219762080	58      	33
9119153655	30214719	250617599940	58      	28
5557994994	26617324	144568875894	58      	59
3555061016	75743021	568658660566	58      	82
6758921194	82100655	718971287692	58      	43
7038025925	47077254	754664511022	59      	40
6746827048	47756729	962728896848	59      	91
0123456789	83197558	421337093409	59      	29
6788946633	96659174	373709485267	59      	29
6788946633	12817819	425456990082	59      	68
6579611591	78308134	868744054130	60      	14
4688687768	17881286	939369924082	60      	70
9984833166	62978235	435583017631	60      	78
8685919938	36244920	159425007904	60      	10
3232262245	39657078	649921994715	60      	72
9628032353	33680741	923237099384	61      	90
5608081367	67080829	654563447110	61      	97
3882983658	30529203	697814031389	61      	49
3212001020	26694024	435122760857	61      	61
7116278144	41488315	483738463713	61      	73
7038025925	42724767	180531962334	62      	87
3957160343	56119687	409542246104	62      	32
3438857837	60817373	384179652400	62      	52
9296229981	45346130	875605607431	62      	72
1798825222	30220464	383476286895	62      	32
5834583085	34850763	274761600136	63      	56
6267352331	99114133	528771298719	63      	41
8663049346	33231441	388403878360	63      	67
2685161059	68505824	893005812666	63      	41
6778124472	35199159	775611741635	63      	66
4141889531	84222194	750886611187	64      	25
8018916776	23404731	308440276732	64      	61
2389037733	97466545	862174790606	64      	82
1492680627	56035772	435583017631	64      	80
8018916776	32270519	525199185853	64      	44
2628943214	73141181	388403878360	65      	19
9033249885	90757396	490997846898	65      	66
6922989673	23024822	199968033019	65      	46
3957160343	37239678	518329844939	65      	56
6907684648	92469612	203262278452	65      	33
4306662364	39945109	547244118460	66      	76
8546488578	46474026	563144943925	66      	5
7124041819	87597602	568658660566	66      	50
7383939083	92771587	473186595371	66      	83
5961584539	85057806	349330324726	66      	33
7116278144	96738717	418604295928	67      	72
4831409387	39219837	508818965558	67      	42
7038025925	61269396	208174494479	67      	52
1971424470	70016777	775611741635	67      	62
6099232381	32655874	412348931569	67      	47
8405144973	14070152	284083366181	68      	5
5216472904	30279176	919197823026	68      	27
7976703056	51235827	457459442332	68      	99
1629932982	41401988	187272692439	68      	71
6075102214	46082977	877194198700	68      	15
4691516229	78168155	518329844939	69      	54
4413418188	97150736	716818652888	69      	59
3505472187	19808304	749193678427	69      	71
8067440133	26229353	117431954043	69      	19
7208494824	37966571	421337093409	69      	26
8719163626	12610223	814141265887	70      	3
2473778271	70003035	509762284879	70      	42
5608081367	68135699	398900612810	70      	7
6398368619	16363735	286243122717	70      	76
7976703056	52061440	467615168772	70      	62
2389037733	11523190	103362565865	71      	96
5475050199	74849006	986065693858	71      	40
8067440133	14318881	536851950801	71      	13
6002323152	70527913	139669412174	71      	85
3882493546	84190613	986065693858	71      	62
2628943214	90320796	146051347589	72      	48
6618381028	91588591	919197823026	72      	97
2022526757	89225639	208174494479	72      	89
4377909332	23892574	264132323061	72      	66
6872967398	18083545	381299535788	72      	24
2208061030	78352226	312237459250	73      	44
2208061030	24020405	300475101700	73      	15
6746827048	99037456	117431954043	73      	26
3407030933	19126183	877194198700	73      	93
5719201957	27118102	467986934495	73      	94
3138633625	43148572	154554749200	74      	51
7263490809	24023486	660310920540	74      	83
9528022780	15087659	732970729968	74      	18
0123456789	15452089	495776106616	74      	30
4691516229	83438921	871701186034	74      	70
3202963823	91275939	205930062465	75      	93
6788946633	80902011	264132323061	75      	50
7065815243	90472469	572878568883	75      	27
8872404266	24137860	862174790606	75      	76
5608081367	62977038	709229053555	75      	37
3228266818	73164459	839518983686	76      	76
5019312140	40124204	873640709962	76      	34
3882983658	14656377	547244118460	76      	64
8552394845	21795571	904647940449	76      	22
1687575631	46258552	173672457176	76      	71
1511505063	99824388	384468659793	77      	5
3394024658	29628916	421337093409	77      	4
4306662364	61455078	172950643766	77      	10
8731889087	91224253	706236730898	77      	79
3138633625	33479105	511511692317	77      	14
6144969851	98211043	261188186216	78      	32
7671146431	97686814	132186536765	78      	11
5791573168	60717304	529831629045	78      	96
5609753201	70345127	339589987290	78      	52
7434024297	11073361	547244118460	78      	9
8663049346	61683052	868744054130	79      	77
3264239750	17450565	380734371410	79      	43
1532520627	85840796	227635917829	79      	89
6961767437	35978987	547244118460	79      	66
7205472287	80976839	939369924082	79      	54
2495997349	16094176	168074802141	80      	48
5318736001	31791523	388403878360	80      	84
6766171955	13004030	566877828296	80      	66
1041696514	70753347	117431954043	80      	67
2721788806	37344550	246144606961	80      	72
6778124472	25492065	317663070530	81      	68
5719201957	34226423	334074319971	81      	59
9859289886	99097236	569219762080	81      	61
2389037733	63044371	887528437482	81      	35
2542508689	29067546	982079076090	81      	22
6618381028	23421461	414652410482	82      	56
3703311506	90960212	336491915536	82      	54
6896741321	90644288	754664511022	82      	17
5791573168	79341665	274761600136	82      	85
1737695393	33932547	654563447110	82      	6
1532520627	57875701	945012228482	83      	67
5216472904	63881948	633320411611	83      	33
6002323152	31660820	234646454745	83      	78
7383939083	59102577	871701186034	83      	95
5019312140	26712257	117431954043	83      	85
4925167684	76748740	554521191996	84      	22
2466473978	56056989	698718941817	84      	1
3179028009	11799651	265444172694	84      	35
4367035640	49510357	308792010934	84      	28
1492680627	99308330	814141265887	84      	40
7434024297	82566959	567657950596	85      	32
7206340636	12220913	568658660566	85      	64
6766171955	30011609	899657914264	85      	9
4691516229	77224773	771137437634	85      	17
2221154896	37308761	314482481265	85      	54
5834583085	78138280	660310920540	86      	17
6325640898	36031356	308792010934	86      	10
9859289886	16642755	904647940449	86      	14
8067440133	95342998	608852371253	86      	22
1737695393	51193574	697814031389	86      	94
2628943214	50966469	334074319971	87      	26
6144969851	57869903	716818652888	87      	52
3957160343	53343155	518787417161	87      	97
9033249885	92875362	868744054130	87      	6
7116278144	53727186	944472664850	87      	41
6746827048	29116911	569219762080	88      	38
6758921194	20067359	563144943925	88      	92
7211210217	21550960	875605607431	88      	40
6209655947	73861601	488529033803	88      	36
6267352331	46938186	134390993040	88      	93
2329656829	29951848	207178796787	89      	63
8872404266	38289801	486804801433	89      	50
3138633625	67709520	409542246104	89      	14
6746827048	27227558	384179652400	89      	93
8133508491	87675325	786975743876	89      	66
3555061016	97605570	409542246104	90      	10
6099232381	69095327	482429892907	90      	26
1041696514	18276202	716818652888	90      	19
8044068658	14304621	117431954043	90      	6
6002323152	95910866	467986934495	90      	4
6961767437	59602283	435122760857	91      	23
3438857837	28151196	528771298719	91      	28
6325640898	59855846	600770885624	91      	35
6618381028	17152784	923237099384	91      	45
5549033462	60668659	349435998924	91      	77
5961584539	11014627	702421087613	92      	43
8546488578	96361654	207178796787	92      	35
5549033462	62426610	444797600349	92      	57
9628032353	31126423	998040421944	92      	58
8613443722	93350789	529831629045	92      	69
2495997349	32602379	750886611187	93      	69
3413181570	36843278	569219762080	93      	60
8546488578	56033875	274761600136	93      	65
2761695829	15881449	294993047536	93      	67
7862148938	13497014	899657914264	93      	25
8685919938	49026076	702421087613	94      	31
1971424470	97204423	67014520356 	94      	19
6712129706	96205590	576518370019	94      	90
6075102214	68573747	388403878360	94      	30
5217136758	34733125	721857506010	94      	30
4462548794	93748560	518329844939	95      	85
5963264222	83477612	718971287692	95      	38
2022526757	62816049	893005812666	95      	49
5961584539	57103907	339589987290	95      	76
6618381028	61343395	578147508823	95      	66
9628032353	26694393	567657950596	96      	28
4413418188	96125406	849681336901	96      	100
7383939083	54294054	297083512852	96      	96
1629932982	75664410	769357296879	96      	89
1687575631	64478564	482429892907	96      	70
2194069220	68135203	568658660566	97      	17
2461823714	82244127	261188186216	97      	74
2542508689	56785174	558886167633	97      	84
3407030933	33109045	633320411611	97      	5
6907684648	19137954	511511692317	97      	53
5641652995	50669369	173672457176	98      	97
5608081367	27092179	945012228482	98      	21
3138633625	19620620	549746556299	98      	76
4141889531	58067294	696368469198	98      	61
8089519838	82917371	569219762080	98      	89
2537304659	37280826	608852371253	99      	88
6929681529	57593883	518787417161	99      	92
6788946633	92274297	126834215166	99      	35
3212001020	22910667	312237459250	99      	24
5204765617	25185430	419446364450	99      	95
6756496857	39079539	103362565865	100     	74
4306662364	99009464	873640709962	100     	29
7205472287	64877638	134390993040	100     	90
7207657400	82714991	873640709962	100     	26
2628943214	97871361	172950643766	100     	20
8238526632	40284148	152614854189	101     	12
2022526757	72623019	152614854189	101     	68
2194069220	54928362	873640709962	101     	94
8044068658	98199637	274761600136	101     	98
9119153655	99404833	383476286895	101     	79
2542508689	30334682	284083366181	102     	54
7802118695	23520463	349435998924	102     	24
6144969851	21330973	152614854189	102     	44
6939496597	52813783	300475101700	102     	100
2155030720	30308943	508818965558	102     	61
2466473978	82037636	945012228482	103     	3
2628943214	18710695	435583017631	103     	71
4293159647	86923595	836900805029	103     	56
6601774478	40120490	194144382996	103     	24
5549033462	45538446	132954606361	103     	8
1629932982	61187683	718971287692	104     	8
6929681529	99610326	998040421944	104     	37
7976703056	71281065	534109743798	104     	58
5204765617	66280214	294993047536	104     	9
3224863676	23837405	450659382698	104     	58
2461823714	37033635	108649313374	105     	11
5318736001	49958814	349435998924	105     	58
4323489871	71408221	549746556299	105     	27
2929362520	73097565	308792010934	105     	38
1947254190	73253503	511511692317	105     	18
6758921194	38785928	875605607431	106     	95
7208494824	73463875	882152991390	106     	64
4323489871	69703206	250617599940	106     	90
3857645514	88712044	375276903331	106     	99
6961767437	78595492	172950643766	106     	6
1629932982	37176787	286243122717	107     	40
8546488578	73482396	265444172694	107     	21
8571321349	50821626	629919786056	107     	41
7038025925	12430361	246144606961	107     	95
4367035640	17765074	646511826677	107     	100
5963264222	93810498	172950643766	108     	26
5633570761	82055429	435583017631	108     	67
1007127177	83193748	836900805029	108     	89
8719163626	67654457	836900805029	108     	23
3957160343	32378538	420756960291	108     	26
8405144973	93980490	108326062706	109     	93
1511505063	38966903	998040421944	109     	65
9695919715	85192572	525199185853	109     	2
3008326696	72549845	250617599940	109     	58
4758421551	29436539	979700065093	109     	30
5549033462	87510453	646511826677	110     	83
2473778271	58736822	425456990082	110     	88
8031688077	39759791	999543417737	110     	43
4497141442	24537599	528771298719	110     	6
2929362520	65222662	516286957430	110     	34
7208494824	73085591	904647940449	111     	69
7208494824	71666060	534109743798	111     	8
7208494824	58282995	839518983686	111     	65
9251037101	29429733	556388862616	111     	27
6766171955	17182583	692492393712	111     	70
3703311506	91583178	435583017631	112     	3
2929362520	42985662	414652410482	112     	38
4758421551	67004867	839518983686	112     	80
5921080373	98781519	482429892907	112     	48
9628032353	59104620	349435998924	112     	44
3407030933	63287529	210526151030	113     	52
8089519838	90386736	172950643766	113     	3
7383939083	70582456	132186536765	113     	91
9033249885	66886801	208174494479	113     	64
7671146431	47409692	316871031375	113     	37
9043656607	25496925	996103067914	114     	71
2921157997	76970729	227635917829	114     	86
8018916776	89952890	925173129386	114     	7
2761695829	51218465	261188186216	114     	63
4497141442	30208410	246144606961	114     	55
6601774478	18450235	199968033019	115     	57
5217136758	73662343	803607788754	115     	14
8872404266	92627551	630929030795	115     	3
6613289086	57684824	563144943925	115     	32
7206340636	94890280	126834215166	115     	81
9911334282	76010169	208174494479	116     	4
6961767437	74028768	702421087613	116     	100
5217136758	96304423	547685258313	116     	82
3164782687	56164806	375276903331	116     	65
5609753201	64143665	893005812666	116     	24
6849665343	96660555	660310920540	117     	15
1511505063	79524664	490997846898	117     	42
8564213736	34979663	833663232208	117     	72
6075102214	77018799	314482481265	117     	83
9984833166	33054185	250617599940	117     	58
7802118695	75914203	722946564026	118     	56
2466473978	89045020	945012228482	118     	51
2822133199	15244051	126834215166	118     	30
5458636091	75535778	514254550616	118     	55
3505472187	53999104	140903716305	118     	66
4141889531	56359333	873640709962	119     	34
2461823714	33775710	300475101700	119     	33
1041696514	85371520	516495915668	119     	33
5557994994	93506361	692492393712	119     	22
4323489871	46954754	144568875894	119     	83
1041696514	67483184	816260222588	120     	5
7671146431	14537642	413227470171	120     	42
2329656829	26229813	673737891943	120     	11
5242462708	46030443	444797600349	120     	57
3759486084	16277579	828509049873	120     	30
8044068658	55862633	419446364450	121     	28
6618381028	24490566	167742802915	121     	59
8546488578	88147258	488529033803	121     	33
6849665343	71428835	849681336901	121     	43
7208494824	88712181	140903716305	121     	26
9984833166	51839756	516495915668	122     	86
6613289086	60176078	875125493289	122     	67
5834583085	20685620	589814450967	122     	96
8031688077	97106384	384179652400	122     	14
2208061030	15702106	578705048123	122     	82
3228266818	66947784	174237001203	123     	71
3396576291	69063046	129753980851	123     	9
5963264222	53733587	660310920540	123     	1
2461823714	84453175	180531962334	123     	94
2461823714	37038500	925484684473	123     	74
5961584539	21743017	862174790606	124     	51
3501154222	98652540	490997846898	124     	55
5609753201	95663413	132186536765	124     	63
4497141442	29294744	633320411611	124     	27
1947254190	58027147	861348595761	124     	39
6788946633	84320393	923237099384	125     	26
3138633625	15766671	420756960291	125     	76
2134459395	59097132	118389501460	125     	21
1947254190	20479291	916984241291	125     	68
5511880212	30475054	948543507361	125     	18
2721788806	27036928	514254550616	126     	6
3438857837	44156876	364745567029	126     	91
5609753201	57190524	765572003296	126     	5
6398368619	12478858	994411186239	126     	51
2628943214	35901293	952550789390	126     	93
3407030933	40485999	207178796787	127     	51
5549033462	87824106	483738463713	127     	39
3438857837	95653760	882152991390	127     	31
8552394845	75740059	919197823026	127     	6
3164782687	10955806	146051347589	127     	10
1687575631	91437229	334074319971	128     	84
8512482553	17934229	536851950801	128     	16
8018916776	28861658	925484684473	128     	27
2921157997	62763868	569219762080	128     	16
8018916776	46754469	421337093409	128     	42
4072260019	82294353	398900612810	129     	32
8685919938	10684101	336491915536	129     	33
8133508491	22529419	569219762080	129     	62
3413181570	68072481	379942304309	129     	91
9911334282	90791271	514254550616	129     	71
1492680627	76331128	176404904473	130     	100
9043656607	37687559	435583017631	130     	21
6907684648	36843492	384179652400	130     	39
2022526757	59907486	698718941817	130     	29
6756496857	74107459	875605607431	130     	15
7216071890	67023555	925173129386	131     	25
7124041819	40596851	134390993040	131     	53
1413628150	27695661	349330324726	131     	67
2279056566	55333140	523196696835	131     	90
5145621850	65503605	873640709962	131     	37
5511880212	20091721	933914210509	132     	28
6961767437	11235927	740581174440	132     	32
3264239750	13796982	740581174440	132     	73
4497141442	30599024	383476286895	132     	31
5019312140	41743363	453357640486	132     	81
6325640898	11021953	509762284879	133     	59
7976703056	32731287	246144606961	133     	94
9043656607	78876970	140903716305	133     	50
6613289086	71314781	322758894316	133     	51
7969888831	13623215	234646454745	133     	69
6457985321	34579522	210526151030	134     	67
6756496857	40854326	828509049873	134     	16
1532520627	39643188	952550789390	134     	81
6961767437	29508487	516495915668	134     	22
2329656829	73480420	322758894316	134     	39
5921080373	12128586	998040421944	135     	99
8067440133	98694788	167742802915	135     	65
9176290163	70094284	400127531270	135     	8
2537304659	84942730	265444172694	135     	89
7671146431	25866681	152614854189	135     	51
8564213736	97299518	380734371410	136     	92
1413628150	64327784	649921994715	136     	57
6298481612	16651827	525199185853	136     	34
3396576291	20210521	189470486214	136     	20
7383939083	78993417	117431954043	136     	65
6907684648	60227560	923237099384	137     	55
6766171955	25772456	941976384328	137     	87
4462548794	26586563	527453991710	137     	20
5641652995	43132501	261188186216	137     	2
6872967398	77925524	887528437482	137     	7
3442482448	78611053	716818652888	138     	24
0123456789	52139067	642234808130	138     	47
8133508491	98043814	871701186034	138     	46
5019312140	48058774	334425348148	138     	80
7211210217	18746707	875605607431	138     	60
1798825222	21142587	944472664850	139     	58
2221154896	93036190	180531962334	139     	90
6117150833	16242234	568658660566	139     	52
4752628252	63667406	509762284879	139     	33
6872967398	80853469	129753980851	139     	25
8995437747	96487041	536851950801	140     	82
9251037101	32530024	698718941817	140     	70
6002323152	64597872	508818965558	140     	62
4143640474	52103771	514254550616	140     	33
3759486084	15523503	862174790606	140     	24
4323489871	12155437	528771298719	141     	3
3759486084	12885099	425456990082	141     	58
6601774478	14394000	572878568883	141     	26
7263490809	74898476	899657914264	141     	47
3407030933	59082034	380734371410	141     	28
4925167684	33242642	636021875565	142     	13
9296229981	14227191	509762284879	142     	98
2279056566	15023514	750886611187	142     	68
9176290163	33154881	754664511022	142     	69
5475050199	75665880	314482481265	142     	93
3937225081	82363178	741544174664	143     	64
2208061030	55599036	381299535788	143     	99
5019312140	58446406	576518370019	143     	47
3555061016	89864911	511511692317	143     	33
9057353891	42084964	457459442332	143     	28
5204765617	26029300	317663070530	144     	18
5062815303	70236491	948543507361	144     	93
6002323152	35449001	518787417161	144     	91
6698635493	13126783	962728896848	144     	84
2329656829	60418885	646511826677	144     	36
3289827635	34152443	506298714832	145     	26
5961584539	42934714	180531962334	145     	63
3202963823	44646645	450659382698	145     	16
7211210217	26916433	916984241291	145     	86
6298481612	96264735	180531962334	145     	60
5641652995	74938994	816260222588	146     	20
6579611591	75438562	117431954043	146     	32
1798825222	15460571	265444172694	146     	17
6698635493	64053154	430946284790	146     	37
9043656607	76436582	692492393712	146     	29
2329656829	21156223	252522255166	147     	38
9296229981	85115461	618570550236	147     	60
7969888831	62904975	698718941817	147     	22
5242462708	97250247	861348595761	147     	65
3179028009	98099623	516286957430	147     	96
9033249885	48661906	896919583724	148     	65
5963264222	54775825	67014520356 	148     	98
3228266818	56944104	411067277447	148     	80
2495997349	11849301	261188186216	148     	5
5899404919	21889636	139669412174	148     	69
7263490809	89606002	618570550236	149     	26
2279056566	21350460	400127531270	149     	28
4323489871	69139618	189470486214	149     	67
4228097219	39063934	944472664850	149     	6
6002323152	85028251	534109743798	149     	42
4413418188	47289428	962728896848	150     	13
6756496857	30095691	506298714832	150     	9
5791573168	98270402	418604295928	150     	67
5019312140	23603481	608852371253	150     	40
3703311506	63606276	527453991710	150     	54
4691516229	18396055	349330324726	151     	28
6144969851	70958142	176404904473	151     	38
8995437747	90403462	816260222588	151     	4
6613289086	62934938	527453991710	151     	47
6979644969	51231986	904647940449	151     	16
5719201957	80796200	508818965558	152     	11
6609295298	88768491	139669412174	152     	94
8571321349	59085836	643925479319	152     	86
8872404266	34180150	962728896848	152     	2
7116278144	87624123	828509049873	152     	23
9033249885	46798784	207178796787	153     	40
2389037733	84594829	349435998924	153     	49
4306662364	69352499	180531962334	153     	79
3555061016	56929615	554521191996	153     	61
6117150833	50334517	227635917829	153     	60
2761695829	78289300	948543507361	154     	68
2721788806	18674376	718971287692	154     	7
7207657400	66921533	284083366181	154     	59
7116278144	24362746	486804801433	154     	25
7671146431	39317585	272121204465	154     	31
8546488578	77827362	803607788754	155     	93
3407030933	45345863	518787417161	155     	40
2389037733	93868319	118389501460	155     	60
6778124472	99226426	187272692439	155     	92
2221154896	56456734	208174494479	155     	37
4688687768	77654964	418604295928	156     	68
4228097219	55112914	692492393712	156     	33
1511505063	31584486	300475101700	156     	89
1971424470	24934331	227635917829	156     	40
6325640898	24283755	377848719039	156     	4
6849665343	61520866	654563447110	157     	86
7207657400	50511114	349330324726	157     	94
5608081367	80876569	140903716305	157     	46
3396576291	50721267	754664511022	157     	100
2279056566	98244028	495776106616	157     	94
7065815243	93331198	873640709962	158     	75
3957160343	50973300	771137437634	158     	72
3008326696	61915377	769357296879	158     	25
2389037733	29627120	126834215166	158     	5
2466473978	38793529	284083366181	158     	18
5019312140	46846380	721857506010	159     	70
6613289086	76945581	413227470171	159     	76
4141889531	60600492	709229053555	159     	90
3228266818	41742799	722946564026	159     	94
2329656829	45822015	435583017631	159     	5
4688687768	39939980	274761600136	160     	52
6778124472	69391888	999543417737	160     	62
6872967398	51178855	411067277447	160     	56
8133508491	99132572	420756960291	160     	95
4688687768	77622263	286243122717	160     	94
1737695393	38080882	740581174440	161     	5
5149199675	10019607	412348931569	161     	33
2155030720	62554887	568658660566	161     	33
1007127177	12417494	430946284790	161     	73
6298481612	54472767	941976384328	161     	76
5216472904	76315270	330700905340	162     	73
5511880212	37515182	702830548447	162     	5
7116278144	37369641	833663232208	162     	96
7263490809	71323003	939369924082	162     	61
7211210217	85752428	103362565865	162     	40
9057353891	22331400	654563447110	163     	54
7206340636	25019960	698718941817	163     	44
8564213736	98623770	418604295928	163     	33
2732870626	99912480	234646454745	163     	51
7976703056	80866001	899657914264	163     	99
2921157997	76130373	103362565865	164     	29
4462548794	63658668	336491915536	164     	95
5608081367	80130184	649921994715	164     	46
8732245967	53090683	944472664850	164     	98
5834583085	44645050	473186595371	164     	19
3957160343	78077985	529831629045	165     	72
3703311506	26232575	833663232208	165     	1
3212001020	52656500	839518983686	165     	70
9033249885	84431026	945012228482	165     	88
4323489871	92540372	939369924082	165     	89
8512482553	41626933	189470486214	166     	99
8067440133	15149531	113476782830	166     	19
9859289886	24575361	246144606961	166     	71
9296229981	72357824	697814031389	166     	77
2473778271	88991321	389169531271	166     	99
2194069220	71057953	527453991710	167     	90
5458636091	77574025	435583017631	167     	19
9043656607	75820873	207178796787	167     	25
5185205464	61462313	536851950801	167     	44
6298481612	42816492	945312847530	167     	16
1532520627	42260057	506298714832	168     	9
2389037733	30175719	893005812666	168     	95
2537304659	74731140	518787417161	168     	43
3232262245	64953744	523196696835	168     	4
6922989673	95018012	916984241291	168     	60
5899404919	17186968	740581174440	169     	93
7802118695	48167090	899657914264	169     	83
2721788806	19355931	194144382996	169     	34
6209655947	64253903	400930079611	169     	49
9043656607	46191986	896919583724	169     	57
0123456789	96936531	435122760857	170     	18
9984833166	66149676	904647940449	170     	37
5458636091	95000197	411067277447	170     	75
1971424470	86211871	176404904473	170     	43
6457985321	71722350	284083366181	170     	17
7124041819	93060116	284083366181	171     	43
3212001020	62801397	776538360607	171     	9
2134459395	51773645	375276903331	171     	28
6872967398	25776228	875125493289	171     	92
1532520627	75388564	945012228482	171     	41
4758421551	97585094	409542246104	172     	76
3232262245	36154750	264132323061	172     	30
8719163626	72398390	518329844939	172     	68
4691516229	42537286	108326062706	172     	37
3442482448	67276158	578147508823	172     	63
2685161059	97196118	488529033803	173     	18
5216472904	47139005	379942304309	173     	9
8067440133	80149389	986065693858	173     	53
4691516229	70289568	495776106616	173     	52
4752628252	58115580	300475101700	173     	91
1007127177	69900969	297083512852	174     	85
2221154896	74925860	590034051433	174     	68
2822133199	90450796	388403878360	174     	97
8995437747	86371129	425456990082	174     	40
3759486084	85585228	384468659793	174     	94
1728134760	63283937	488529033803	175     	92
3232262245	98447426	482340522139	175     	53
6746827048	30000862	234646454745	175     	95
3442482448	76053866	118389501460	175     	97
8405144973	69404188	425456990082	175     	8
7976703056	22658300	838962966418	176     	34
2221154896	10552318	457459442332	176     	14
4462548794	99854502	509762284879	176     	23
3224863676	91825736	140903716305	176     	91
2194069220	92873575	578147508823	176     	67
4758421551	61642431	861348595761	177     	93
2194069220	76013151	117431954043	177     	3
3164782687	14436589	775611741635	177     	48
5961584539	26528269	414652410482	177     	97
6209655947	44732253	411067277447	177     	54
3957160343	32579480	952550789390	178     	38
9057353891	43861594	246144606961	178     	25
7207657400	61005314	389169531271	178     	26
7383939083	25016883	741544174664	178     	90
4072260019	44927861	576518370019	178     	96
6267352331	30888826	373709485267	179     	70
9984833166	46120186	838962966418	179     	73
4367035640	19788863	134390993040	179     	49
3407030933	71847229	887528437482	179     	7
5791573168	97447257	388403878360	179     	16
6002323152	73804106	899657914264	180     	55
6398368619	23864989	388403878360	180     	68
3957160343	59387346	379942304309	180     	50
3228266818	58818596	603333456348	180     	98
2466473978	23857382	409542246104	180     	97
4072260019	27377289	863129185304	181     	51
8546488578	90463290	274761600136	181     	18
2929362520	14005032	383476286895	181     	23
8089519838	81425251	740581174440	181     	20
0123456789	63885057	916984241291	181     	46
9033249885	64713712	603333456348	182     	14
5719201957	22757622	146051347589	182     	90
4141889531	45801723	134390993040	182     	67
7216071890	14281713	547244118460	182     	57
7207657400	88778828	697814031389	182     	93
9296229981	85199649	103362565865	183     	42
6601774478	45488858	146051347589	183     	10
6766171955	34542740	554521191996	183     	23
7124041819	91236757	495776106616	183     	18
5719201957	60873837	127026679653	183     	40
4306662364	71025320	838962966418	184     	84
4072260019	23423916	814141265887	184     	30
8417181288	54111158	330700905340	184     	54
2242735766	16645740	312237459250	184     	53
9305781770	81844894	117431954043	184     	100
7802118695	83804573	941976384328	185     	14
1737695393	73180344	998040421944	185     	72
9043656607	93892944	986202008726	185     	57
4377909332	29866007	741544174664	185     	9
6267352331	83538153	849681336901	185     	79
7211210217	86553158	400930079611	186     	18
5019312140	24869100	896919583724	186     	89
8031688077	94804749	482429892907	186     	4
1079167299	54204466	948543507361	186     	39
3008326696	24168108	999543417737	186     	69
5578561084	89196338	893005812666	187     	6
9251037101	28182172	603333456348	187     	53
7208494824	99367611	199968033019	187     	97
4752628252	71366227	706236730898	187     	72
6144969851	54201910	894482053097	187     	38
8685919938	46190077	490997846898	188     	9
5961584539	85912550	669515708071	188     	74
6144969851	30872261	618570550236	188     	8
5641652995	94783912	902956788286	188     	73
9176290163	33090700	176404904473	188     	96
4497141442	48708021	702421087613	189     	14
7802118695	47298478	754664511022	189     	26
9628032353	85427293	838962966418	189     	85
8564213736	18925506	527453991710	189     	68
6002323152	75236149	952550789390	189     	37
8512482553	42326735	919197823026	190     	48
3232262245	24886049	643925479319	190     	63
2761695829	72010221	349330324726	190     	2
9119153655	92050205	572878568883	190     	38
1947254190	28530104	952550789390	190     	48
6788946633	41202929	875125493289	191     	20
1737695393	14281818	608852371253	191     	83
3232262245	41553078	176404904473	191     	37
4925167684	44698859	558886167633	191     	74
6267352331	83893684	412348931569	191     	18
3396576291	41610289	875125493289	192     	73
7205472287	63843481	384468659793	192     	70
2929362520	11117299	941976384328	192     	100
5641652995	28288703	450659382698	192     	55
7116278144	40514129	334074319971	192     	85
2921157997	87920114	839518983686	193     	43
4293159647	34907428	629919786056	193     	35
6806054949	40240003	330700905340	193     	35
1947254190	77559495	274761600136	193     	85
7976703056	99174246	377848719039	193     	6
7216071890	91691094	590034051433	194     	36
6209655947	77054192	108649313374	194     	28
2329656829	64663664	400930079611	194     	2
6002323152	50786353	899657914264	194     	47
9176290163	17453273	419481071217	194     	67
5719201957	84211971	741544174664	195     	42
8719163626	92216008	334425348148	195     	33
1492680627	65175366	265444172694	195     	76
2721788806	76036920	172950643766	195     	88
9695919715	52346416	467615168772	195     	62
5511880212	27732595	603333456348	196     	99
4758421551	16440433	986202008726	196     	63
4367035640	97034847	450659382698	196     	70
1511505063	85381491	168074802141	196     	71
9695919715	49022908	457459442332	196     	78
7206340636	14900507	999543417737	197     	44
6758921194	92529889	113476782830	197     	63
6613289086	28450823	518329844939	197     	81
3407030933	56882308	948543507361	197     	99
6939496597	24091599	384468659793	197     	93
4925167684	37612913	514254550616	198     	95
7207657400	37276997	381299535788	198     	88
3179028009	61096527	986202008726	198     	60
8719163626	69978679	838962966418	198     	89
1079167299	13173985	413227470171	198     	75
8552394845	19795754	132186536765	199     	17
4497141442	42456256	740581174440	199     	64
7862148938	19924766	373709485267	199     	98
8405144973	82361507	554521191996	199     	79
5149199675	92530382	945312847530	199     	20
7976703056	10267928	364745567029	200     	26
3394024658	34175214	646511826677	200     	51
8405144973	31908810	894482053097	200     	44
4462548794	14527725	400127531270	200     	90
1737695393	13966395	483738463713	200     	91
5475050199	51937074	174237001203	201     	82
4925167684	30894346	108649313374	201     	50
3438857837	17389606	636021875565	201     	87
1492680627	11297079	261188186216	201     	10
6579611591	72355581	334425348148	201     	10
6075102214	75474806	786975743876	202     	14
2155030720	83043818	419481071217	202     	19
9628032353	36517720	409542246104	202     	61
1947254190	47948582	833663232208	202     	9
6849665343	80678473	786975743876	202     	99
3407030933	35762317	375276903331	203     	78
5511880212	76035329	227635917829	203     	88
3857645514	67044867	654563447110	203     	60
7038025925	36352996	132954606361	203     	33
4323489871	27627063	425456990082	203     	13
7969888831	71365051	923237099384	204     	92
6298481612	33065826	300475101700	204     	16
3212001020	65958269	814141265887	204     	85
3396576291	57892999	996103067914	204     	10
7211210217	11341963	252522255166	204     	78
6117150833	60406066	996103067914	205     	2
7802118695	28098029	698718941817	205     	80
1413628150	55442107	849681336901	205     	85
7969888831	50889239	558886167633	205     	80
8995437747	54641666	418604295928	205     	25
6961767437	61802280	771137437634	206     	78
8613443722	42749234	722946564026	206     	85
4323489871	73491111	444797600349	206     	60
3224863676	82843775	740581174440	206     	75
6601774478	65381062	174237001203	206     	31
6075102214	67197802	534109743798	207     	85
2761695829	73220513	290827207620	207     	13
2929362520	52287865	336491915536	207     	44
5204765617	71250813	618570550236	207     	37
7862148938	45114881	373709485267	207     	87
9033249885	75671051	322758894316	208     	89
6601774478	54582110	377848719039	208     	73
8731889087	11888548	380734371410	208     	31
5641652995	70242743	893005812666	208     	70
5217136758	62740236	490997846898	208     	43
1511505063	32083516	227635917829	209     	9
5019312140	37958832	549746556299	209     	82
9176290163	75889001	528771298719	209     	48
5963264222	47198826	578705048123	209     	94
9984833166	97694146	770565227675	209     	62
7038025925	82543290	373709485267	210     	63
9057353891	91181591	274761600136	210     	51
4306662364	75080972	572878568883	210     	42
1041696514	35869887	578147508823	210     	36
6806054949	43808502	336491915536	210     	89
2628943214	66798046	421337093409	211     	4
5217136758	11258616	336491915536	211     	53
8564213736	64839456	769357296879	211     	7
8512482553	21202108	567657950596	211     	99
8067440133	19762301	174237001203	211     	86
8417181288	69649621	939369924082	212     	71
2542508689	44124277	336491915536	212     	48
7802118695	53836545	419446364450	212     	47
9305781770	95831635	702421087613	212     	70
4141889531	12001385	205930062465	212     	96
7263490809	38516972	400127531270	213     	23
6939496597	49892062	516286957430	213     	7
6756496857	88233951	863129185304	213     	77
9984833166	80964507	962728896848	213     	81
1532520627	58867283	566877828296	213     	70
8405144973	42022023	702421087613	214     	15
5578561084	37470781	887528437482	214     	59
8044068658	12231281	568658660566	214     	27
9628032353	94705818	381299535788	214     	68
5608081367	31006932	572878568883	214     	88
3442482448	34491822	642234808130	215     	45
2194069220	72679058	300475101700	215     	85
2208061030	30149069	444797600349	215     	18
7208494824	80201945	702830548447	215     	89
3008326696	31213012	750886611187	215     	14
3442482448	43993632	873640709962	216     	62
7434024297	11257009	894482053097	216     	7
3555061016	54957118	508818965558	216     	18
6712129706	74459713	649921994715	216     	64
3396576291	78322074	127026679653	216     	83
3957160343	13289304	334425348148	217     	83
8067440133	88041356	261188186216	217     	48
2461823714	57949110	722946564026	217     	11
8663049346	83355320	775611741635	217     	26
9119153655	30396789	383476286895	217     	63
2473778271	21959045	457459442332	218     	28
6872967398	25178770	154554749200	218     	21
9305781770	92989266	654563447110	218     	91
6872967398	31854241	199753522658	218     	12
5963264222	17481530	986202008726	218     	26
3202963823	34257618	529831629045	219     	98
3857645514	60063052	939369924082	219     	86
6788946633	63649727	435583017631	219     	18
7381140027	44841534	649921994715	219     	14
4072260019	51799079	630929030795	219     	99
8044068658	63212520	863129185304	220     	4
9251037101	63605875	706236730898	220     	18
3937225081	13210628	669515708071	220     	20
5185205464	41412618	339589987290	220     	21
1629932982	45750448	168074802141	220     	92
2461823714	41494662	488529033803	221     	42
8018916776	86589777	194144382996	221     	53
4267735567	79016683	769357296879	221     	91
3438857837	59386328	300475101700	221     	39
4293159647	97648185	549746556299	221     	55
6766171955	74731053	194144382996	222     	67
6117150833	82495192	314482481265	222     	6
6609295298	12195027	349435998924	222     	70
9911334282	68423991	941976384328	222     	79
6209655947	41872291	176404904473	222     	38
4228097219	73591773	364745567029	223     	73
9176290163	44851344	771137437634	223     	51
7216071890	23886259	174237001203	223     	33
5557994994	11558027	721857506010	223     	38
3138633625	22656070	578705048123	223     	53
1007127177	96618056	849681336901	224     	77
2242735766	42631940	506298714832	224     	51
9528022780	27616256	558886167633	224     	20
9296229981	94435834	669515708071	224     	53
6756496857	26910761	113476782830	224     	80
6002323152	87062300	132186536765	225     	51
5318736001	49678911	284083366181	225     	53
5961584539	26728061	108649313374	225     	54
3228266818	66314209	692492393712	225     	50
4293159647	82049562	558886167633	225     	87
5204765617	69438483	523196696835	226     	35
3394024658	36615707	549746556299	226     	94
9043656607	63168310	679453075525	226     	57
3937225081	21863001	490997846898	226     	73
5185205464	86069954	994411186239	226     	36
6267352331	45381873	330700905340	227     	22
5549033462	44073670	649921994715	227     	25
6907684648	79127480	899657914264	227     	66
9033249885	98493103	154554749200	227     	97
6766171955	54853504	868744054130	227     	61
5318736001	90314627	549746556299	228     	96
6075102214	90558801	775611741635	228     	12
6746827048	46767391	483738463713	228     	10
4228097219	56541362	334425348148	228     	26
3202963823	60152190	589814450967	228     	69
2732870626	46372831	316871031375	229     	87
7211210217	36098803	875125493289	229     	25
9296229981	44896786	126834215166	229     	78
2537304659	65993834	549746556299	229     	74
2929362520	65939388	939369924082	229     	24
7207657400	69496615	902956788286	230     	59
5834583085	54256753	381299535788	230     	52
8995437747	75239411	518787417161	230     	27
3957160343	96136409	210526151030	230     	14
2194069220	20841487	414652410482	230     	38
6398368619	36937396	702830548447	231     	75
7216071890	31494061	643925479319	231     	49
5216472904	74841814	272121204465	231     	45
2466473978	54058706	933914210509	231     	18
6267352331	37277827	308440276732	231     	68
6209655947	60633109	899657914264	232     	79
7969888831	77884597	383476286895	232     	43
4367035640	60881120	945012228482	232     	83
1413628150	75972438	425456990082	232     	51
6929681529	10657581	629919786056	232     	13
7206340636	85290497	516495915668	233     	49
4323489871	93029833	108326062706	233     	1
5318736001	30480709	589814450967	233     	41
4228097219	52858515	816260222588	233     	38
9057353891	65118945	618570550236	233     	82
7208494824	24118333	643925479319	234     	1
8613443722	73058654	349330324726	234     	27
9043656607	36893224	294993047536	234     	92
8719163626	69620292	669515708071	234     	51
9528022780	16497668	589814450967	234     	67
1971424470	92159562	529831629045	235     	86
8732245967	80354731	749625390019	235     	27
8663049346	31877055	511511692317	235     	25
8571321349	85292680	649921994715	235     	70
4367035640	40045692	384179652400	235     	86
6209655947	43712176	833663232208	236     	84
6267352331	19250723	629919786056	236     	11
2537304659	14060581	495776106616	236     	83
5921080373	79350882	435583017631	236     	3
7381140027	29821583	420756960291	236     	15
9305781770	11824304	894482053097	237     	35
5921080373	22439939	425456990082	237     	43
0123456789	41217805	692492393712	237     	55
7211210217	25815486	525199185853	237     	70
5578561084	15396163	207178796787	237     	10
7969888831	14272361	108649313374	238     	10
2929362520	84769065	250617599940	238     	53
4072260019	60895700	904647940449	238     	56
8663049346	37762396	400127531270	238     	11
5608081367	26478140	982079076090	238     	14
2628943214	12981253	630929030795	239     	21
2022526757	87469190	721857506010	239     	19
3138633625	36183704	862174790606	239     	96
6849665343	49108611	828509049873	239     	1
4925167684	42574096	563144943925	239     	97
6939496597	35160877	187272692439	240     	98
9911334282	95106742	706236730898	240     	76
3232262245	83842278	994411186239	240     	10
2461823714	71939929	948543507361	240     	10
9859289886	91918781	999543417737	240     	81
2461823714	45832981	836900805029	241     	20
2208061030	24212393	400127531270	241     	43
9251037101	85885710	252522255166	241     	30
8613443722	83167053	716818652888	241     	27
3264239750	83855667	741544174664	241     	65
3224863676	13542197	904647940449	242     	11
6758921194	22372861	430946284790	242     	24
7969888831	11538965	383476286895	242     	15
9033249885	56325551	536851950801	242     	71
6896741321	27944334	899657914264	242     	65
6806054949	98867093	547685258313	243     	23
6872967398	74730602	159425007904	243     	93
6896741321	27049287	649921994715	243     	55
6758921194	38611933	383476286895	243     	13
4691516229	42388837	284083366181	243     	88
6746827048	95298244	894482053097	244     	50
4143640474	87412313	558886167633	244     	85
6788946633	77408487	869112308003	244     	17
7434024297	74225818	643925479319	244     	55
8732245967	75805880	692492393712	244     	71
3413181570	57019109	925173129386	245     	70
3438857837	36242194	536851950801	245     	13
2155030720	85081732	312237459250	245     	89
9305781770	74829181	314482481265	245     	76
2721788806	56249865	203262278452	245     	82
2329656829	95064934	916984241291	246     	13
2721788806	70070032	770565227675	246     	95
6601774478	48251625	176404904473	246     	17
7124041819	20588418	600770885624	246     	10
1492680627	63181193	286243122717	246     	82
7211210217	88232143	180531962334	247     	21
7124041819	95100915	569219762080	247     	8
8685919938	15374896	308792010934	247     	2
4925167684	67350849	702830548447	247     	88
6778124472	97214573	210526151030	247     	43
8018916776	33717682	317663070530	248     	68
6209655947	79206563	923237099384	248     	13
1532520627	37239212	180531962334	248     	66
3228266818	70982295	373709485267	248     	22
7207657400	43683460	308792010934	248     	63
4141889531	27096365	490997846898	249     	59
5242462708	12104686	642234808130	249     	6
2242735766	11366694	144568875894	249     	16
8552394845	78581322	453357640486	249     	21
6979644969	52211602	172950643766	249     	23
3179028009	54565931	750886611187	250     	55
8238526632	92620740	669515708071	250     	95
3164782687	47742406	986202008726	250     	71
8018916776	52920608	862174790606	250     	54
8512482553	48140607	419481071217	250     	84
0123456789	46950133	875125493289	1       	1
0123456789	41644548	457459442332	1       	1
0123456789	14577088	523196696835	50      	1
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: wegmans2; Owner: jaf9897
--

COPY wegmans2.product (upc, brand, name, type, size, price) FROM stdin;
877194198700	ACME	Heirloom Tomato	Vegetables	Large	5.01999999999999957
261188186216	ACME	Potato	Vegetables	Large	39.7299999999999969
525199185853	ACME	Red Onion	Vegetables	Large	41.8500000000000014
649921994715	ACME	Yellow Onion	Vegetables	Large	3.60999999999999988
322758894316	ACME	White Onion	Vegetables	Large	42.9699999999999989
509762284879	ACME	Bell Pepper	Vegetables	Medium	47.3800000000000026
642234808130	ACME	Jalepeno Pepper	Vegetables	Medium	20.6799999999999997
174237001203	ACME	Spinach	Vegetables	Large	48.1099999999999994
336491915536	ACME	Baby Spinach	Vegetables	Large	38.990000000000002
765572003296	ACME	Carrot	Vegetables	Large	13.8900000000000006
167742802915	Dole	Iceberg Lettuce	Vegetables	Medium	3.7200000000000002
636021875565	Fresh Stuff	Kale	Vegetables	Small	22.9699999999999989
514254550616	Fresh Stuff	Tuscan Kale	Vegetables	Small	17.7699999999999996
600770885624	Fresh Stuff	Portabella Mushroom	Vegetables	Medium	43.6599999999999966
557899454410	Fresh Stuff	Cilantro	Vegetables	Small	1.77000000000000002
527453991710	Fresh Stuff	Basil	Vegetables	Small	48.1300000000000026
180531962334	Fresh Stuff	Parsley	Vegetables	Small	29.9800000000000004
608852371253	Fresh Stuff	Shallot	Vegetables	Large	39.740000000000002
435122760857	Fresh Stuff	Green Onion	Vegetables	Large	19.1999999999999993
962728896848	Dole	Garlic	Vegetables	Large	16.6400000000000006
381299535788	Dole	Brocolli	Vegetables	Large	45.3599999999999994
982079076090	Dole	Green Bean	Vegetables	Large	42.2700000000000031
998040421944	Dole	Endive	Vegetables	Large	16.0199999999999996
132954606361	Dole	Porcini Mushroom	Vegetables	Large	33.1000000000000014
749193678427	Dole	Radish	Vegetables	Large	30.9600000000000009
732970729968	Dole	Beet	Vegetables	Medium	44.0900000000000034
203262278452	Dole	Ginger	Vegetables	Medium	2.16000000000000014
412348931569	Dole	Beefsteak Tomato	Vegetables	Large	19.5300000000000011
274761600136	Dole	Grape Tomato	Vegetables	Medium	18.3200000000000003
473186595371	Dole	Green Tomato	Vegetables	Large	10.6500000000000004
944472664850	ACME	Lemon	Fruit	Small	2.18000000000000016
272121204465	ACME	Lime	Fruit	Large	28.6700000000000017
246144606961	ACME	Red Grape	Fruit	Small	42.2100000000000009
383476286895	ACME	Strawberry	Fruit	Medium	48.3800000000000026
692492393712	ACME	Blueberry	Fruit	Small	2.35999999999999988
389169531271	ACME	Pear	Fruit	Small	35.3599999999999994
869112308003	ACME	Apple	Fruit	Large	40.990000000000002
486804801433	Dole	Orange	Fruit	Large	8.34999999999999964
945012228482	Dole	Mango	Fruit	Medium	27.5899999999999999
986065693858	Dole	Pineapple	Fruit	Large	4.94000000000000039
828509049873	Dole	Green Grape	Fruit	Small	20.9800000000000004
199968033019	Dole	Purple Grape	Fruit	Small	19.5700000000000003
194144382996	Dole	Green Apple	Fruit	Large	44.6199999999999974
108326062706	Dole	Banana	Fruit	Large	9.11999999999999922
771137437634	Fresh Stuff	Tangerine	Fruit	Large	17.5500000000000007
430946284790	Fresh Stuff	Coconut	Fruit	Medium	8.41999999999999993
398900612810	Fresh Stuff	Plum	Fruit	Small	45.3599999999999994
868744054130	Fresh Stuff	Grapefruit	Fruit	Small	23.9100000000000001
146051347589	Fresh Stuff	Peach	Fruit	Medium	9.96000000000000085
377848719039	Fresh Stuff	Kiwi	Fruit	Medium	24.120000000000001
453357640486	Fresh Stuff	Clementine	Fruit	Medium	17.4400000000000013
633320411611	ACME	Chicken	Poultry	Large	38.3699999999999974
250617599940	Elmer Inc	Chicken Thigh	Poultry	Medium	2.64000000000000012
534109743798	Elmer Inc	Chicken Breast	Poultry	Small	7.21999999999999975
572878568883	Elmer Inc	Emu	Poultry	Small	48.509999999999998
994411186239	Meat and Stuff	Ostrich	Poultry	Large	28.7399999999999984
334074319971	ACME	Duck	Poultry	Small	38.5799999999999983
718971287692	Meat and Stuff	Duck Thigh	Poultry	Medium	36.9399999999999977
413227470171	ACME	Duck Breast	Poultry	Small	13.3699999999999992
871701186034	ACME	Quail	Poultry	Small	1.37999999999999989
861348595761	Meat and Stuff	Turkey	Poultry	Medium	46.509999999999998
168074802141	Meat and Stuff	Ground Beef	Red Meat	Large	9.63000000000000078
567657950596	ACME	Kobe	Red Meat	Medium	25.6000000000000014
208174494479	ACME	Wagyu	Red Meat	Large	19.0799999999999983
576518370019	Elmer Inc	Reindeer	Red Meat	Small	16.1799999999999997
300475101700	Elmer Inc	Ground Bison	Red Meat	Medium	17.3099999999999987
721857506010	Meat and Stuff	New York Strip	Red Meat	Medium	34.2700000000000031
919197823026	Meat and Stuff	Ribeye	Red Meat	Large	46.2999999999999972
127026679653	Meat and Stuff	Porterhouse	Red Meat	Large	36.2700000000000031
646511826677	Elmer Inc	Filet Mignon	Red Meat	Large	41.5499999999999972
364745567029	Elmer Inc	Goat	Red Meat	Medium	24.1499999999999986
563144943925	Elmer Inc	Kangaroo	Red Meat	Medium	7.24000000000000021
696368469198	ACME	Chop	Pork	Large	17.629999999999999
516286957430	ACME	Cutlet	Pork	Large	1.98999999999999999
511511692317	Elmer Inc	Babyback Ribs	Pork	Small	47.5200000000000031
495776106616	Elmer Inc	Short Ribs	Pork	Small	46.4200000000000017
189470486214	Elmer Inc	Shoulder	Pork	Large	27.6900000000000013
862174790606	Meat and Stuff	Bacon	Pork	Medium	41.0499999999999972
108649313374	Meat and Stuff	Sausage	Pork	Small	6.58000000000000007
833663232208	Meat and Stuff	Butt	Pork	Large	15.4100000000000001
210526151030	Elmer Inc	Whole	Pork	Large	38.6700000000000017
518787417161	ACME	Clam	Seafood	Large	7.20000000000000018
380734371410	ACME	Oyster	Seafood	Large	15.0399999999999991
709229053555	ACME	Muscle	Seafood	Large	35.5
375276903331	ACME	Lobster	Seafood	Small	40.7999999999999972
420756960291	ACME	Crab	Seafood	Medium	43.240000000000002
554521191996	Meat and Stuff	Tuna	Seafood	Small	33.5499999999999972
488529033803	Meat and Stuff	Salmon	Seafood	Large	30.0599999999999987
418604295928	Meat and Stuff	Tilapia	Seafood	Small	1.64999999999999991
904647940449	Meat and Stuff	Sea Bass	Seafood	Small	36.6899999999999977
902956788286	Elmer Inc	Sea Urchin	Seafood	Small	25.0700000000000003
873640709962	Elmer Inc	Octopus	Seafood	Medium	19.3299999999999983
483738463713	Elmer Inc	Shrimp	Seafood	Medium	0.82999999999999996
859109096191	Meat and Stuff	Squid	Seafood	Medium	21.0100000000000016
925484684473	Elmer Inc	Shark	Seafood	Medium	29.8999999999999986
482429892907	Elmer Inc	Swordfish	Seafood	Small	11.5600000000000005
118389501460	ACME	Cottage Cheese	Dairy	Large	33.9500000000000028
875125493289	ACME	Cheddar	Dairy	Medium	16.4400000000000013
205930062465	ACME	Gouda	Dairy	Large	4.30999999999999961
896919583724	ACME	Brie	Dairy	Large	19.120000000000001
549746556299	ACME	Milk	Dairy	Medium	11.9900000000000002
528771298719	Dairy Time	Ricotta	Dairy	Small	48.8500000000000014
316871031375	Dairy Things	Mozzarella	Dairy	Medium	18.7899999999999991
314482481265	Dairy Things	Manchego	Dairy	Medium	31.6799999999999997
590034051433	Dairy Things	Sour Cream	Dairy	Small	36.9799999999999969
176404904473	Dairy Things	Butter	Dairy	Medium	35.1899999999999977
523196696835	Dairy Things	Yogurt	Dairy	Small	32.990000000000002
979700065093	Dairy Things	Swiss	Dairy	Medium	12.5299999999999994
875605607431	Dairy Things	American	Dairy	Medium	19.4400000000000013
373709485267	Dairy Time	Feta	Dairy	Large	31.2899999999999991
159425007904	Dairy Time	Asiago	Dairy	Large	43.5
516495915668	Dairy Time	Camembert	Dairy	Large	46.1099999999999994
660310920540	Dairy Time	Havarti	Dairy	Large	25.4800000000000004
999543417737	Dairy Time	Egg	Dairy	Medium	20.3200000000000003
673737891943	ACME	Ham	Deli Meat	Medium	12.5600000000000005
836900805029	ACME	Roast Beef	Deli Meat	Medium	41.5200000000000031
444797600349	ACME	Bologna	Deli Meat	Medium	17.8500000000000014
379942304309	ACME	Corned Beef	Deli Meat	Small	28.2800000000000011
669515708071	ACME	Prosciutto	Deli Meat	Large	0.630000000000000004
996103067914	Meat and Stuff	Head Cheese	Deli Meat	Medium	19.0399999999999991
126834215166	Meat and Stuff	Mortadella	Deli Meat	Small	2.79999999999999982
284083366181	Meat and Stuff	Salami	Deli Meat	Small	2.89999999999999991
887528437482	Meat and Stuff	Braunschweiger	Deli Meat	Large	38.740000000000002
933914210509	Deli Emporium	Chorizo	Deli Meat	Large	30.7399999999999984
252522255166	Deli Emporium	Pepperoni	Deli Meat	Large	34.7800000000000011
411067277447	Deli Emporium	Olive loaf	Deli Meat	Large	49.8699999999999974
698718941817	Deli Emporium	Pastrami	Deli Meat	Small	4.03000000000000025
630929030795	Deli Emporium	Turkey Breast	Deli Meat	Small	27.3999999999999986
506298714832	ACME	Toilet Paper	Cleaning	Small	0.0500000000000000028
578147508823	ACME	Paper Towel	Cleaning	Large	28.1900000000000013
702421087613	ACME	Broom	Cleaning	Medium	8.41000000000000014
547685258313	ACME	Dust Pan	Cleaning	Large	5.49000000000000021
419481071217	ACME	Plunger	Cleaning	Large	32.9399999999999977
948543507361	Squeaky Clean	Rag	Cleaning	Small	38.259999999999998
227635917829	Squeaky Clean	Sponge	Cleaning	Small	27.4899999999999984
816260222588	Squeaky Clean	Bucket	Cleaning	Medium	9.61999999999999922
547244118460	Squeaky Clean	Mop	Cleaning	Large	22.9699999999999989
706236730898	Squeaky Clean	Vaccum	Cleaning	Large	45.9200000000000017
741544174664	Squeaky Clean	Bleach	Cleaning	Medium	0.419999999999999984
529831629045	Scootie's Cleaning	Toilet Brush	Cleaning	Medium	46.990000000000002
67014520356 	Scootie's Cleaning	Cleaner	Cleaning	Small	43.3299999999999983
740581174440	Scootie's Cleaning	Lint Roller	Cleaning	Small	21.6600000000000001
939369924082	Scootie's Cleaning	Duster	Cleaning	Medium	23.2300000000000004
849681336901	Scootie's Cleaning	Glass Cleaner	Cleaning	Large	20.6700000000000017
882152991390	ACME	Cola	Beverage	Medium	28.6000000000000014
384468659793	ACME	Grape Juice	Beverage	Small	7.40000000000000036
139669412174	ACME	Tonic Water	Beverage	Medium	45.3299999999999983
129753980851	ACME	Seltzer	Beverage	Medium	43.6499999999999986
839518983686	ACME	Cranberry Juice	Beverage	Large	19.620000000000001
308792010934	Clout Drinks	Tomato Juice	Beverage	Medium	37.0300000000000011
199753522658	Clout Drinks	Beer	Beverage	Small	13.2799999999999994
629919786056	Clout Drinks	Water	Beverage	Small	45
558886167633	Clout Drinks	Sports Drink	Beverage	Medium	30.0300000000000011
643925479319	Clout Drinks	Fruit Punch	Beverage	Medium	19.25
945312847530	Clout Drinks	Orange Juice	Beverage	Small	11.8100000000000005
589814450967	Clout Drinks	Apple Juice	Beverage	Small	24.25
330700905340	Atlantis Beverage	Root Beer	Beverage	Medium	28.1700000000000017
894482053097	Atlantis Beverage	Ginger Ale	Beverage	Small	42.5799999999999983
568658660566	Atlantis Beverage	Orange Soda	Beverage	Large	29.6799999999999997
400930079611	Atlantis Beverage	Cream Soda	Beverage	Small	7.42999999999999972
173672457176	Atlantis Beverage	Lemon Juice	Beverage	Large	25.3200000000000003
518329844939	Atlantis Beverage	Lime Juice	Beverage	Small	34.4399999999999977
770565227675	Atlantis Beverage	Citrus Soda	Beverage	Medium	20.8900000000000006
769357296879	ACME	Pizza	Frozen	Medium	34.6000000000000014
113476782830	ACME	Burrito	Frozen	Small	44.6000000000000014
508818965558	ACME	Fries	Frozen	Small	14.2300000000000004
207178796787	ACME	Carrots	Frozen	Large	3.54999999999999982
702830548447	ACME	Peas	Frozen	Medium	38.4799999999999969
140903716305	Fries Frozen Foods	Spinach	Frozen	Small	17.2800000000000011
435583017631	Fries Frozen Foods	Ice Cream	Frozen	Large	44.0700000000000003
103362565865	Fries Frozen Foods	Breakfast Sandwiches	Frozen	Large	0.200000000000000011
556388862616	Fries Frozen Foods	Pizza Rolls	Frozen	Medium	37.5799999999999983
334425348148	Fries Frozen Foods	Burgers	Frozen	Small	30.7399999999999984
425456990082	Freezy Freeze	Ice Pops	Frozen	Large	26.129999999999999
697814031389	Freezy Freeze	Blueberries	Frozen	Large	4.62000000000000011
754664511022	Freezy Freeze	Strawberries	Frozen	Medium	7.25
154554749200	Freezy Freeze	Raspberries	Frozen	Medium	5.00999999999999979
838962966418	ACME	Potato Chips	Snack	Medium	41.3999999999999986
618570550236	ACME	Pretzels	Snack	Large	12.1999999999999993
952550789390	ACME	Corn Chips	Snack	Medium	45.8100000000000023
384179652400	ACME	Peanuts	Snack	Large	14.1999999999999993
925173129386	ACME	Cashews	Snack	Medium	38.1199999999999974
569219762080	Snack Me Up	Almonds	Snack	Large	7.21999999999999975
290827207620	Snack Me Up	Crackers	Snack	Medium	41.1099999999999994
893005812666	Snack Me Up	Beef Jerky	Snack	Small	41.6199999999999974
234646454745	Snack Me Up	Soy Chips	Snack	Large	46.6899999999999977
286243122717	Snack Me Up	Soy Jerky	Snack	Small	19.620000000000001
187272692439	Munchie Mash	Protein Bar	Snack	Small	26.5899999999999999
578705048123	Munchie Mash	Popcorn	Snack	Small	11.4199999999999999
265444172694	Munchie Mash	Raisins	Snack	Small	28.0700000000000003
450659382698	Munchie Mash	Pork Rinds	Snack	Large	34.9299999999999997
349435998924	Munchie Mash	Sunflower Seeds	Snack	Large	25.5
786975743876	ACME	Pain Medication	Health	Large	32.4399999999999977
750886611187	ACME	Linament	Health	Medium	1.81000000000000005
144568875894	ACME	Band-aids	Health	Medium	3
654563447110	ACME	Gauze	Health	Medium	31.5100000000000016
679453075525	ACME	Oitment	Health	Medium	2.43000000000000016
457459442332	Doctor Bird's	Sleeping Pills	Health	Medium	11.1500000000000004
916984241291	Doctor Bird's	Caffeine Pills	Health	Large	23.2300000000000004
803607788754	Doctor Bird's	Zinc Tablets	Health	Small	47.3200000000000003
566877828296	Doctor Bird's	Multivitamin	Health	Large	26.1499999999999986
722946564026	Doctor Bird's	Allergy Medication	Health	Medium	31.0199999999999996
414652410482	Doctor Bird's	Nasal Spray	Health	Small	18.9400000000000013
603333456348	Marty's Meds	Condoms	Health	Medium	28.3999999999999986
132186536765	Marty's Meds	Tampons	Health	Large	31.0799999999999983
899657914264	Marty's Meds	Rubbing Alcohol	Health	Large	7.76999999999999957
317663070530	Marty's Meds	Toothbrush	Health	Large	19.2300000000000004
294993047536	Marty's Meds	Toothpaste	Health	Medium	9.72000000000000064
421337093409	Marty's Meds	Cotton Swabs	Health	Small	22.9400000000000013
805966823208	Marty's Meds	Hydrogen Peroxide	Health	Large	3.39999999999999991
863129185304	ACME	Blush	Cosmetic	Large	37.759999999999998
716818652888	ACME	Eyeliner	Cosmetic	Large	47.6599999999999966
419446364450	ACME	Makeup Brush	Cosmetic	Small	2.74000000000000021
941976384328	Cover Up	Foundation	Cosmetic	Medium	36.5300000000000011
264132323061	Cover Up	Hair Gel	Cosmetic	Medium	1.48999999999999999
172950643766	Cover Up	Hair Paste	Cosmetic	Large	21.5199999999999996
776538360607	Cover Up	Pomade	Cosmetic	Small	21.4899999999999984
388403878360	Cover Up	Hair Brush	Cosmetic	Medium	3.89999999999999991
297083512852	Cover Up	Shampoo	Cosmetic	Medium	23.3200000000000003
923237099384	Classified Cosmetics	Conditioner	Cosmetic	Medium	16.1400000000000006
986202008726	Classified Cosmetics	Hair Spray	Cosmetic	Small	40.25
400127531270	Classified Cosmetics	Mousse	Cosmetic	Medium	5.12000000000000011
339589987290	Classified Cosmetics	Razor	Cosmetic	Medium	15.7699999999999996
536851950801	ACME	Cereal	Grain	Small	42.2999999999999972
775611741635	ACME	Oats	Grain	Large	5.49000000000000021
490997846898	ACME	Bread	Grain	Medium	28.870000000000001
152614854189	Grain Train	Granola	Grain	Medium	26.4200000000000017
117431954043	Grain Train	Tortilla	Grain	Small	35.7999999999999972
814141265887	Grain Train	Pasta	Grain	Large	9.83999999999999986
467615168772	Grain Train	Cookie	Grain	Small	12.0600000000000005
308440276732	Grain Train	Cake	Grain	Small	3.72999999999999998
312237459250	Carboload	Quinoa	Grain	Large	36.1000000000000014
467986934495	Carboload	Corn Meal	Grain	Medium	15.3900000000000006
409542246104	Carboload	Grits	Grain	Small	19.1400000000000006
134390993040	Carboload	Ramen	Grain	Large	12.0800000000000001
482340522139	Carboload	Buns	Grain	Large	43.009999999999998
749625390019	ACME	Ttttthats all folks	Meme	Medium	13.3699999999999992
349330324726	ACME	Wild Boar	Pork	Small	65
\.


--
-- Data for Name: reorder; Type: TABLE DATA; Schema: wegmans2; Owner: jaf9897
--

COPY wegmans2.reorder (ordernumber, product, store, deliverydate, stockrequested, fulfilledby) FROM stdin;
34564734	261188186216	74      	2018-12-04	4	ACME
22345678	572878568883	3       	2018-12-04	50	Monsanto
12345678	457459442332	1       	2018-12-04	10	ACME
12345679	388403878360	1       	2018-12-04	20	Monsanto
12342679	709229053555	1       	2018-12-04	5	ACME
12345612	199968033019	1       	2018-12-10	10	Brawndo
\.


--
-- Data for Name: soldby; Type: TABLE DATA; Schema: wegmans2; Owner: jaf9897
--

COPY wegmans2.soldby (storeid, productid, numberinstock) FROM stdin;
56      	569219762080	43
56      	696368469198	66
78      	207178796787	100
78      	174237001203	92
21      	673737891943	55
21      	702421087613	83
1       	272121204465	\N
1       	863129185304	1
1       	887528437482	80
1       	388403878360	68
1       	875125493289	111
1       	457459442332	1
1       	199968033019	130
1       	488529033803	149
1       	709229053555	135
1       	411067277447	118
1       	189470486214	144
1       	578147508823	53
1       	509762284879	84
1       	516495915668	143
1       	765572003296	80
1       	529831629045	121
1       	692492393712	129
1       	252522255166	103
1       	314482481265	133
1       	979700065093	105
1       	168074802141	120
1       	702421087613	117
1       	290827207620	130
1       	250617599940	118
1       	297083512852	148
1       	203262278452	97
1       	173672457176	74
1       	814141265887	138
1       	246144606961	64
1       	547244118460	115
1       	902956788286	85
1       	982079076090	133
1       	174237001203	135
1       	409542246104	83
1       	339589987290	65
1       	490997846898	106
1       	836900805029	108
1       	483738463713	111
1       	381299535788	141
1       	649921994715	101
1       	383476286895	74
1       	453357640486	127
1       	849681336901	106
1       	508818965558	64
1       	654563447110	91
1       	646511826677	63
1       	398900612810	139
1       	721857506010	103
1       	294993047536	66
1       	482429892907	120
1       	418604295928	86
1       	118389501460	128
1       	67014520356 	68
1       	400930079611	144
1       	904647940449	58
1       	547685258313	74
1       	284083366181	124
1       	643925479319	139
1       	923237099384	96
1       	536851950801	64
1       	525199185853	93
1       	187272692439	68
1       	999543417737	53
1       	265444172694	109
1       	349330324726	67
1       	527453991710	116
1       	566877828296	76
1       	673737891943	62
1       	108326062706	96
1       	603333456348	104
1       	636021875565	101
1       	227635917829	52
1       	419446364450	107
1       	194144382996	120
1       	838962966418	67
1       	389169531271	135
1       	180531962334	146
1       	839518983686	113
1       	871701186034	128
1       	312237459250	110
1       	514254550616	111
2       	750886611187	62
2       	272121204465	71
2       	696368469198	147
2       	568658660566	120
2       	698718941817	119
2       	529831629045	51
2       	210526151030	77
2       	771137437634	111
2       	923237099384	131
2       	252522255166	97
2       	547244118460	120
2       	246144606961	138
2       	444797600349	61
2       	419446364450	150
2       	833663232208	87
2       	754664511022	116
2       	948543507361	104
2       	654563447110	72
2       	509762284879	78
2       	608852371253	63
2       	679453075525	77
2       	882152991390	94
2       	600770885624	53
2       	769357296879	94
2       	334074319971	148
2       	457459442332	138
2       	67014520356 	59
2       	869112308003	57
2       	375276903331	112
2       	576518370019	146
2       	450659382698	137
2       	702830548447	134
2       	127026679653	66
2       	379942304309	58
2       	979700065093	132
2       	893005812666	120
2       	994411186239	83
2       	189470486214	148
2       	554521191996	104
2       	558886167633	81
2       	642234808130	138
2       	134390993040	64
2       	862174790606	131
2       	702421087613	133
2       	430946284790	147
2       	383476286895	118
2       	776538360607	55
2       	945312847530	114
2       	945012228482	147
2       	274761600136	144
2       	132954606361	96
2       	578705048123	71
2       	261188186216	118
2       	749625390019	118
2       	300475101700	60
2       	863129185304	80
2       	322758894316	70
2       	836900805029	118
2       	227635917829	54
2       	556388862616	102
2       	508818965558	67
2       	118389501460	52
2       	952550789390	112
2       	925173129386	150
2       	770565227675	101
2       	525199185853	105
2       	297083512852	140
2       	925484684473	136
2       	140903716305	137
2       	849681336901	73
2       	578147508823	123
2       	312237459250	120
2       	547685258313	72
2       	132186536765	96
2       	919197823026	66
2       	904647940449	109
2       	839518983686	111
2       	877194198700	110
2       	669515708071	74
2       	103362565865	94
2       	418604295928	130
2       	199753522658	99
2       	384179652400	149
2       	514254550616	125
2       	603333456348	116
2       	453357640486	137
2       	996103067914	136
2       	721857506010	76
2       	467986934495	87
2       	380734371410	62
2       	618570550236	105
2       	400930079611	118
2       	411067277447	77
2       	660310920540	70
2       	389169531271	132
2       	349435998924	61
2       	425456990082	114
2       	144568875894	97
2       	649921994715	52
2       	126834215166	138
3       	706236730898	54
3       	194144382996	75
3       	261188186216	146
3       	482340522139	57
3       	904647940449	65
3       	312237459250	91
3       	534109743798	91
3       	741544174664	65
3       	146051347589	112
3       	482429892907	88
3       	486804801433	63
3       	816260222588	64
3       	902956788286	68
3       	516286957430	74
3       	349435998924	61
3       	388403878360	105
3       	749193678427	102
3       	771137437634	81
3       	127026679653	142
3       	518329844939	117
3       	129753980851	106
3       	118389501460	55
3       	618570550236	130
3       	643925479319	52
3       	859109096191	70
3       	483738463713	71
3       	986202008726	107
3       	754664511022	137
3       	167742802915	56
3       	139669412174	56
3       	203262278452	78
3       	554521191996	133
3       	721857506010	86
3       	572878568883	50
3       	290827207620	146
3       	871701186034	140
3       	509762284879	146
3       	495776106616	121
3       	159425007904	112
3       	578705048123	140
3       	770565227675	137
3       	205930062465	51
3       	172950643766	138
3       	660310920540	149
3       	377848719039	66
3       	547244118460	71
3       	709229053555	121
3       	863129185304	130
3       	174237001203	127
3       	861348595761	62
3       	418604295928	112
3       	180531962334	125
3       	252522255166	117
3       	330700905340	90
3       	199753522658	127
3       	925173129386	127
3       	364745567029	108
3       	986065693858	75
3       	923237099384	67
3       	603333456348	141
3       	669515708071	101
3       	409542246104	68
3       	873640709962	67
3       	108649313374	94
3       	563144943925	109
3       	208174494479	73
3       	633320411611	83
3       	899657914264	67
3       	525199185853	58
3       	297083512852	105
3       	300475101700	102
3       	716818652888	142
3       	999543417737	96
3       	567657950596	51
3       	536851950801	78
3       	916984241291	88
3       	805966823208	50
3       	749625390019	135
3       	152614854189	69
3       	654563447110	133
3       	384468659793	72
3       	600770885624	76
3       	590034051433	113
3       	702830548447	145
3       	430946284790	70
3       	838962966418	141
3       	383476286895	88
3       	132954606361	82
3       	126834215166	119
3       	776538360607	82
3       	814141265887	93
3       	994411186239	124
3       	630929030795	135
3       	529831629045	102
3       	246144606961	62
3       	527453991710	99
3       	775611741635	59
3       	176404904473	133
3       	444797600349	67
3       	945312847530	82
3       	294993047536	97
3       	384179652400	140
3       	317663070530	100
3       	557899454410	73
3       	511511692317	67
3       	274761600136	116
3       	207178796787	62
4       	633320411611	81
4       	944472664850	112
4       	529831629045	79
4       	525199185853	109
4       	286243122717	99
4       	642234808130	122
4       	453357640486	93
4       	172950643766	145
4       	654563447110	81
4       	146051347589	118
4       	414652410482	78
4       	180531962334	123
4       	769357296879	102
4       	569219762080	107
4       	741544174664	114
4       	349330324726	65
4       	126834215166	86
4       	199968033019	56
4       	261188186216	51
4       	379942304309	61
4       	952550789390	125
4       	308440276732	50
4       	290827207620	74
4       	398900612810	61
4       	207178796787	114
4       	154554749200	145
4       	495776106616	123
4       	134390993040	73
4       	375276903331	120
4       	732970729968	138
4       	308792010934	53
4       	709229053555	106
4       	600770885624	50
4       	409542246104	112
4       	894482053097	73
4       	999543417737	88
4       	933914210509	55
4       	572878568883	52
4       	252522255166	61
4       	488529033803	73
4       	754664511022	118
4       	702830548447	51
4       	660310920540	113
4       	400127531270	77
4       	578705048123	76
4       	144568875894	50
4       	669515708071	93
4       	948543507361	61
4       	877194198700	101
4       	646511826677	149
4       	873640709962	100
4       	805966823208	112
4       	527453991710	53
4       	152614854189	91
4       	636021875565	65
4       	246144606961	107
4       	702421087613	96
4       	420756960291	93
4       	264132323061	150
4       	435122760857	72
4       	117431954043	86
4       	536851950801	125
4       	916984241291	75
4       	558886167633	115
4       	547244118460	120
4       	945312847530	150
4       	314482481265	132
4       	698718941817	92
4       	294993047536	86
4       	630929030795	102
4       	979700065093	81
4       	418604295928	139
4       	364745567029	136
4       	706236730898	51
4       	590034051433	108
4       	716818652888	59
4       	722946564026	96
4       	300475101700	102
4       	902956788286	114
4       	518329844939	123
4       	334074319971	106
4       	425456990082	65
4       	516286957430	104
4       	549746556299	145
4       	923237099384	72
4       	578147508823	149
4       	483738463713	137
4       	336491915536	53
4       	740581174440	79
4       	250617599940	92
4       	696368469198	83
4       	316871031375	133
4       	450659382698	140
4       	227635917829	76
4       	528771298719	138
4       	272121204465	94
5       	534109743798	68
5       	316871031375	74
5       	420756960291	57
5       	286243122717	114
5       	132954606361	105
5       	576518370019	92
5       	482340522139	91
5       	923237099384	79
5       	383476286895	133
5       	364745567029	57
5       	775611741635	60
5       	863129185304	120
5       	630929030795	59
5       	740581174440	146
5       	952550789390	61
5       	194144382996	84
5       	805966823208	114
5       	490997846898	50
5       	398900612810	133
5       	297083512852	135
5       	265444172694	109
5       	250617599940	58
5       	457459442332	71
5       	414652410482	73
5       	741544174664	149
5       	557899454410	70
5       	925173129386	138
5       	518329844939	101
5       	516495915668	129
5       	750886611187	115
5       	227635917829	96
5       	702830548447	70
5       	444797600349	87
5       	389169531271	92
5       	722946564026	82
5       	941976384328	73
5       	833663232208	88
5       	649921994715	145
5       	556388862616	95
5       	643925479319	125
5       	199753522658	96
5       	600770885624	103
5       	274761600136	113
5       	129753980851	115
5       	529831629045	133
5       	144568875894	66
5       	375276903331	62
5       	113476782830	88
5       	516286957430	62
5       	400930079611	71
5       	836900805029	136
5       	523196696835	75
6       	576518370019	75
6       	364745567029	138
6       	698718941817	92
6       	919197823026	67
6       	697814031389	129
6       	336491915536	68
6       	558886167633	58
6       	377848719039	99
6       	412348931569	90
6       	749193678427	102
6       	646511826677	124
6       	902956788286	114
6       	265444172694	56
6       	264132323061	124
6       	775611741635	107
6       	836900805029	140
6       	567657950596	131
6       	398900612810	56
6       	944472664850	56
6       	899657914264	123
6       	126834215166	60
6       	629919786056	144
6       	563144943925	117
6       	127026679653	72
6       	514254550616	116
6       	172950643766	81
6       	603333456348	51
6       	316871031375	74
6       	349330324726	105
6       	381299535788	127
6       	833663232208	139
6       	566877828296	137
6       	525199185853	53
6       	67014520356 	144
6       	167742802915	96
6       	140903716305	107
6       	875125493289	137
6       	187272692439	87
6       	300475101700	103
6       	425456990082	85
6       	516286957430	128
6       	642234808130	137
6       	457459442332	101
6       	547244118460	111
6       	633320411611	132
6       	805966823208	68
6       	863129185304	65
6       	384179652400	80
6       	569219762080	83
6       	414652410482	87
6       	411067277447	55
6       	450659382698	104
6       	945012228482	54
6       	518787417161	78
6       	430946284790	137
6       	284083366181	103
6       	400930079611	87
6       	173672457176	101
6       	419446364450	132
6       	578147508823	107
6       	334425348148	141
6       	334074319971	123
6       	871701186034	144
6       	904647940449	116
6       	252522255166	137
6       	375276903331	106
6       	536851950801	60
6       	308792010934	108
6       	488529033803	99
6       	608852371253	81
6       	118389501460	73
6       	508818965558	142
6       	312237459250	128
6       	322758894316	80
6       	877194198700	55
6       	590034051433	141
6       	941976384328	117
6       	482429892907	112
6       	308440276732	77
6       	925484684473	118
6       	706236730898	125
6       	721857506010	50
6       	654563447110	93
6       	816260222588	70
6       	467986934495	55
6       	294993047536	137
6       	630929030795	67
6       	227635917829	111
6       	330700905340	141
6       	380734371410	126
7       	144568875894	139
7       	199753522658	100
7       	400930079611	120
7       	877194198700	111
7       	364745567029	147
7       	702830548447	73
7       	208174494479	66
7       	590034051433	86
7       	572878568883	80
7       	139669412174	59
7       	643925479319	135
7       	716818652888	116
7       	511511692317	81
7       	108326062706	146
7       	482340522139	142
7       	518787417161	116
7       	132186536765	136
7       	916984241291	105
7       	816260222588	141
7       	933914210509	67
7       	721857506010	129
7       	578147508823	97
7       	871701186034	59
7       	412348931569	79
7       	805966823208	118
7       	509762284879	122
7       	718971287692	141
7       	999543417737	121
7       	234646454745	137
7       	740581174440	132
7       	314482481265	51
7       	118389501460	106
7       	578705048123	94
7       	103362565865	134
7       	506298714832	65
7       	589814450967	114
7       	608852371253	110
7       	398900612810	139
7       	849681336901	122
7       	803607788754	102
7       	113476782830	141
7       	839518983686	57
7       	450659382698	68
7       	159425007904	93
7       	168074802141	101
7       	567657950596	55
7       	775611741635	90
7       	986202008726	128
7       	308440276732	134
7       	140903716305	117
7       	994411186239	83
7       	945312847530	58
7       	673737891943	54
7       	377848719039	121
7       	527453991710	123
7       	770565227675	108
7       	523196696835	87
7       	904647940449	91
7       	312237459250	150
7       	339589987290	102
7       	290827207620	86
7       	893005812666	93
7       	556388862616	101
7       	129753980851	76
7       	754664511022	68
7       	126834215166	59
7       	246144606961	123
7       	786975743876	112
7       	525199185853	66
7       	654563447110	111
7       	152614854189	137
7       	300475101700	120
7       	411067277447	50
7       	741544174664	132
7       	482429892907	91
7       	294993047536	134
7       	514254550616	139
7       	388403878360	129
7       	948543507361	126
7       	776538360607	95
7       	576518370019	93
7       	875605607431	76
7       	534109743798	120
7       	636021875565	112
7       	986065693858	112
7       	696368469198	77
7       	692492393712	135
7       	629919786056	90
7       	618570550236	137
7       	167742802915	57
7       	383476286895	131
7       	187272692439	138
7       	633320411611	131
7       	863129185304	65
7       	203262278452	57
7       	765572003296	106
7       	859109096191	94
7       	894482053097	132
7       	180531962334	103
7       	444797600349	117
7       	600770885624	150
7       	554521191996	58
7       	508818965558	93
7       	467986934495	140
7       	286243122717	112
7       	207178796787	129
7       	944472664850	112
7       	409542246104	89
7       	453357640486	137
7       	117431954043	93
7       	732970729968	125
7       	488529033803	103
7       	430946284790	118
7       	495776106616	58
7       	467615168772	97
7       	205930062465	70
7       	838962966418	122
7       	473186595371	112
7       	272121204465	131
7       	349330324726	138
7       	134390993040	123
7       	722946564026	68
7       	418604295928	137
7       	516286957430	119
7       	828509049873	105
7       	176404904473	126
7       	769357296879	52
7       	284083366181	125
7       	529831629045	110
7       	833663232208	100
7       	261188186216	130
7       	549746556299	118
7       	925173129386	120
7       	173672457176	101
7       	334425348148	109
7       	400127531270	93
7       	336491915536	111
7       	568658660566	89
7       	528771298719	107
7       	172950643766	92
7       	316871031375	80
7       	557899454410	103
7       	174237001203	140
7       	379942304309	125
7       	518329844939	148
7       	875125493289	89
7       	873640709962	74
8       	547685258313	73
8       	849681336901	116
8       	516286957430	122
8       	516495915668	86
8       	945012228482	118
8       	618570550236	82
8       	506298714832	88
8       	547244118460	98
8       	919197823026	120
8       	210526151030	90
8       	108649313374	114
8       	495776106616	134
8       	139669412174	56
8       	904647940449	62
8       	173672457176	59
8       	862174790606	126
8       	384468659793	121
8       	246144606961	110
8       	873640709962	52
8       	419481071217	59
8       	554521191996	114
8       	629919786056	91
8       	999543417737	65
8       	814141265887	56
8       	140903716305	124
8       	600770885624	61
8       	786975743876	105
8       	894482053097	90
8       	144568875894	68
8       	421337093409	86
8       	706236730898	59
8       	871701186034	104
8       	534109743798	74
8       	669515708071	113
8       	334074319971	132
8       	398900612810	146
8       	132186536765	142
8       	771137437634	104
8       	692492393712	142
8       	514254550616	72
8       	453357640486	96
8       	118389501460	96
8       	286243122717	88
8       	882152991390	101
8       	467986934495	125
8       	199753522658	125
8       	113476782830	130
8       	375276903331	102
8       	167742802915	121
8       	425456990082	82
8       	660310920540	86
8       	589814450967	74
8       	490997846898	64
8       	716818652888	69
8       	373709485267	73
8       	159425007904	59
8       	312237459250	98
8       	420756960291	147
8       	444797600349	130
8       	803607788754	144
8       	389169531271	84
8       	754664511022	63
8       	457459442332	115
8       	816260222588	123
8       	590034051433	50
8       	129753980851	119
8       	578147508823	111
8       	413227470171	131
8       	916984241291	82
8       	208174494479	130
8       	944472664850	72
8       	925173129386	147
8       	899657914264	140
8       	265444172694	95
8       	749625390019	124
8       	508818965558	100
8       	722946564026	111
8       	962728896848	130
8       	308792010934	103
8       	696368469198	119
8       	536851950801	124
8       	264132323061	72
8       	203262278452	94
8       	379942304309	87
8       	718971287692	117
8       	412348931569	89
8       	775611741635	72
8       	336491915536	68
8       	511511692317	136
8       	875125493289	113
8       	833663232208	73
8       	702421087613	53
8       	558886167633	107
8       	314482481265	122
9       	590034051433	104
9       	556388862616	128
9       	868744054130	110
9       	419446364450	58
9       	732970729968	145
9       	721857506010	120
9       	453357640486	93
9       	642234808130	138
9       	873640709962	149
9       	563144943925	103
9       	572878568883	73
9       	828509049873	74
9       	925484684473	133
9       	692492393712	110
9       	749625390019	103
9       	547244118460	143
9       	896919583724	69
9       	379942304309	127
9       	549746556299	86
9       	381299535788	96
9       	421337093409	126
9       	839518983686	110
9       	803607788754	141
9       	334074319971	104
9       	261188186216	50
9       	863129185304	111
9       	996103067914	67
9       	630929030795	118
9       	919197823026	82
9       	308792010934	129
9       	698718941817	128
9       	207178796787	150
9       	486804801433	77
9       	129753980851	77
9       	654563447110	131
9       	152614854189	126
9       	741544174664	102
9       	902956788286	101
9       	312237459250	54
9       	882152991390	67
9       	578147508823	64
9       	264132323061	130
9       	418604295928	98
9       	861348595761	94
9       	511511692317	138
9       	203262278452	134
9       	518329844939	72
9       	467986934495	118
9       	227635917829	67
9       	771137437634	97
9       	962728896848	133
9       	134390993040	71
9       	986202008726	84
9       	250617599940	81
9       	899657914264	59
9       	875605607431	71
9       	495776106616	65
9       	633320411611	53
9       	349330324726	89
9       	117431954043	124
9       	649921994715	54
9       	411067277447	112
9       	643925479319	97
9       	754664511022	50
9       	154554749200	82
9       	838962966418	85
9       	679453075525	134
9       	140903716305	113
9       	126834215166	60
9       	702421087613	73
9       	568658660566	93
9       	159425007904	75
9       	308440276732	119
9       	444797600349	130
9       	199968033019	67
9       	506298714832	59
9       	457459442332	97
9       	862174790606	103
9       	529831629045	137
9       	869112308003	118
9       	400127531270	142
9       	887528437482	65
9       	945312847530	85
9       	508818965558	54
9       	286243122717	50
9       	765572003296	124
9       	527453991710	99
9       	875125493289	111
9       	578705048123	91
9       	373709485267	61
9       	718971287692	96
10      	669515708071	84
10      	996103067914	126
10      	919197823026	96
10      	933914210509	103
10      	418604295928	88
10      	300475101700	70
10      	633320411611	81
10      	557899454410	93
10      	430946284790	139
10      	246144606961	92
10      	203262278452	51
10      	419446364450	107
10      	590034051433	125
10      	925173129386	135
10      	152614854189	98
10      	290827207620	91
10      	871701186034	120
10      	578705048123	73
10      	603333456348	88
10      	547685258313	93
10      	349330324726	100
10      	265444172694	55
10      	698718941817	87
10      	722946564026	124
10      	994411186239	77
10      	103362565865	129
10      	511511692317	133
10      	336491915536	94
10      	861348595761	50
10      	264132323061	129
10      	636021875565	72
10      	732970729968	86
10      	608852371253	126
10      	334074319971	58
10      	576518370019	110
10      	67014520356 	142
10      	697814031389	74
10      	210526151030	119
10      	194144382996	74
10      	435583017631	70
10      	482429892907	51
10      	482340522139	71
10      	702830548447	50
10      	473186595371	75
10      	167742802915	51
10      	113476782830	87
10      	902956788286	130
10      	894482053097	70
10      	129753980851	150
10      	986065693858	62
10      	180531962334	90
10      	375276903331	146
10      	765572003296	68
10      	859109096191	87
10      	877194198700	72
10      	330700905340	122
10      	893005812666	145
10      	400930079611	63
10      	174237001203	61
10      	467986934495	86
10      	769357296879	60
10      	261188186216	53
10      	563144943925	105
10      	741544174664	135
10      	272121204465	148
10      	709229053555	79
10      	208174494479	69
10      	899657914264	113
10      	702421087613	98
10      	836900805029	116
10      	649921994715	102
10      	528771298719	142
10      	696368469198	78
10      	805966823208	145
10      	139669412174	128
10      	776538360607	119
10      	286243122717	148
10      	679453075525	109
10      	364745567029	66
10      	308440276732	103
10      	154554749200	64
10      	572878568883	52
10      	381299535788	68
10      	486804801433	76
10      	316871031375	82
10      	646511826677	114
10      	547244118460	92
10      	108649313374	129
10      	941976384328	91
10      	514254550616	124
10      	140903716305	107
10      	127026679653	92
10      	527453991710	63
10      	868744054130	77
10      	948543507361	108
10      	979700065093	147
10      	467615168772	60
10      	549746556299	76
10      	126834215166	110
10      	569219762080	148
10      	770565227675	99
10      	986202008726	78
10      	554521191996	100
10      	495776106616	103
10      	849681336901	141
10      	716818652888	67
10      	529831629045	69
10      	457459442332	103
10      	536851950801	121
10      	450659382698	51
10      	173672457176	110
10      	629919786056	101
10      	435122760857	58
10      	379942304309	81
11      	265444172694	95
11      	923237099384	62
11      	176404904473	50
11      	294993047536	61
11      	457459442332	92
11      	563144943925	53
11      	264132323061	69
11      	425456990082	91
11      	568658660566	82
11      	600770885624	139
11      	444797600349	52
11      	134390993040	134
11      	836900805029	63
11      	786975743876	101
11      	679453075525	72
11      	246144606961	143
11      	261188186216	126
11      	194144382996	148
11      	488529033803	123
11      	419446364450	86
11      	554521191996	50
11      	139669412174	112
11      	877194198700	92
11      	132954606361	137
11      	871701186034	148
11      	803607788754	136
11      	557899454410	142
11      	187272692439	99
11      	274761600136	100
11      	482429892907	60
11      	129753980851	64
11      	381299535788	91
11      	673737891943	128
11      	453357640486	111
11      	769357296879	146
11      	375276903331	131
11      	419481071217	88
11      	411067277447	128
11      	383476286895	123
11      	775611741635	102
11      	697814031389	140
11      	508818965558	149
11      	210526151030	121
11      	925484684473	94
11      	339589987290	69
11      	250617599940	88
11      	400127531270	142
11      	945012228482	110
11      	862174790606	94
11      	979700065093	114
11      	127026679653	106
11      	67014520356 	94
11      	330700905340	91
11      	636021875565	94
11      	732970729968	63
11      	421337093409	144
11      	986202008726	66
11      	509762284879	131
11      	549746556299	106
11      	939369924082	127
11      	749625390019	76
11      	174237001203	136
11      	384468659793	135
11      	199753522658	129
11      	660310920540	125
11      	547244118460	115
11      	868744054130	70
11      	173672457176	149
11      	566877828296	71
11      	893005812666	71
11      	380734371410	146
11      	669515708071	96
11      	749193678427	142
11      	882152991390	50
11      	589814450967	79
11      	754664511022	85
11      	576518370019	87
11      	152614854189	90
11      	418604295928	82
11      	899657914264	55
11      	933914210509	135
12      	384468659793	58
12      	400127531270	141
12      	849681336901	114
12      	132954606361	123
12      	765572003296	129
12      	265444172694	120
12      	549746556299	55
12      	339589987290	102
12      	108649313374	88
12      	702421087613	77
12      	877194198700	112
12      	839518983686	126
12      	139669412174	62
12      	154554749200	50
12      	740581174440	130
12      	134390993040	75
12      	642234808130	140
12      	646511826677	120
12      	557899454410	135
12      	208174494479	102
12      	904647940449	78
12      	490997846898	95
12      	979700065093	50
12      	902956788286	76
12      	203262278452	128
12      	473186595371	71
12      	180531962334	86
12      	769357296879	70
12      	419481071217	90
12      	986202008726	63
12      	482340522139	133
12      	923237099384	138
12      	430946284790	112
12      	210526151030	102
12      	893005812666	101
12      	264132323061	115
12      	118389501460	112
12      	381299535788	84
12      	692492393712	123
12      	420756960291	84
12      	509762284879	57
12      	630929030795	59
12      	330700905340	126
12      	488529033803	126
12      	948543507361	136
12      	389169531271	53
12      	608852371253	99
12      	174237001203	64
12      	816260222588	115
12      	697814031389	141
12      	554521191996	120
12      	167742802915	106
12      	833663232208	115
12      	882152991390	132
12      	754664511022	80
12      	629919786056	83
12      	444797600349	95
12      	103362565865	115
12      	414652410482	118
12      	814141265887	147
12      	828509049873	101
12      	435122760857	106
12      	419446364450	115
12      	418604295928	142
12      	511511692317	62
12      	290827207620	142
12      	986065693858	104
12      	425456990082	60
12      	706236730898	149
12      	300475101700	94
12      	516286957430	144
12      	349330324726	101
12      	933914210509	139
12      	412348931569	106
12      	227635917829	61
12      	589814450967	85
12      	578705048123	65
12      	334425348148	116
12      	312237459250	76
12      	398900612810	116
12      	409542246104	70
12      	176404904473	143
12      	859109096191	104
12      	749193678427	142
12      	649921994715	116
12      	117431954043	63
12      	373709485267	125
12      	660310920540	50
12      	871701186034	111
12      	679453075525	83
12      	568658660566	81
12      	716818652888	94
12      	514254550616	105
12      	528771298719	78
12      	173672457176	126
12      	805966823208	148
12      	336491915536	120
12      	495776106616	116
12      	750886611187	114
12      	836900805029	139
12      	721857506010	98
12      	861348595761	93
12      	603333456348	102
12      	578147508823	147
12      	527453991710	74
12      	140903716305	59
12      	168074802141	143
12      	126834215166	123
12      	896919583724	95
12      	862174790606	146
12      	547685258313	97
12      	284083366181	51
12      	939369924082	69
12      	113476782830	138
12      	925484684473	62
12      	250617599940	99
12      	749625390019	133
12      	994411186239	72
12      	547244118460	122
12      	962728896848	98
12      	411067277447	85
12      	523196696835	58
12      	558886167633	80
12      	467615168772	73
12      	709229053555	132
12      	483738463713	111
12      	207178796787	77
12      	590034051433	89
12      	421337093409	132
12      	838962966418	84
12      	875605607431	50
12      	172950643766	52
12      	654563447110	128
12      	246144606961	60
12      	952550789390	96
12      	349435998924	141
12      	384179652400	77
12      	899657914264	73
12      	982079076090	53
13      	421337093409	85
13      	882152991390	50
13      	769357296879	56
13      	144568875894	143
13      	284083366181	126
13      	294993047536	84
13      	557899454410	94
13      	939369924082	142
13      	252522255166	66
13      	518787417161	120
13      	945012228482	73
13      	308792010934	85
13      	718971287692	123
13      	339589987290	115
13      	642234808130	134
13      	630929030795	119
13      	384468659793	71
13      	902956788286	52
13      	944472664850	98
13      	189470486214	86
13      	629919786056	88
13      	771137437634	65
13      	316871031375	125
13      	210526151030	125
13      	649921994715	54
13      	334425348148	102
13      	384179652400	148
13      	765572003296	132
13      	118389501460	51
13      	132186536765	83
13      	732970729968	93
13      	377848719039	145
13      	314482481265	141
13      	336491915536	136
13      	833663232208	70
13      	962728896848	77
13      	272121204465	116
13      	986065693858	140
13      	894482053097	70
13      	334074319971	111
13      	453357640486	116
13      	490997846898	103
13      	400127531270	108
13      	373709485267	112
13      	261188186216	134
13      	803607788754	66
13      	716818652888	105
13      	203262278452	66
13      	871701186034	79
13      	941976384328	58
13      	979700065093	135
13      	875605607431	69
13      	467986934495	115
13      	516286957430	63
13      	154554749200	145
13      	528771298719	64
13      	518329844939	90
13      	172950643766	90
13      	516495915668	62
13      	836900805029	65
13      	265444172694	91
13      	556388862616	124
13      	534109743798	94
13      	495776106616	66
13      	919197823026	94
13      	740581174440	132
13      	194144382996	138
14      	979700065093	85
14      	208174494479	86
14      	875605607431	135
14      	882152991390	100
14      	962728896848	133
14      	939369924082	62
14      	430946284790	136
14      	816260222588	90
14      	618570550236	74
14      	272121204465	140
14      	706236730898	119
14      	284083366181	56
14      	528771298719	126
14      	380734371410	90
14      	869112308003	118
14      	986065693858	115
14      	567657950596	98
14      	250617599940	92
14      	381299535788	136
14      	948543507361	103
14      	316871031375	58
14      	750886611187	136
14      	896919583724	147
14      	732970729968	127
14      	290827207620	90
14      	495776106616	107
14      	425456990082	128
14      	252522255166	107
14      	108326062706	87
14      	839518983686	53
14      	836900805029	129
14      	473186595371	55
14      	941976384328	108
14      	986202008726	102
14      	589814450967	110
14      	952550789390	50
14      	180531962334	105
14      	722946564026	146
14      	227635917829	121
14      	923237099384	96
14      	126834215166	141
14      	172950643766	65
14      	904647940449	67
14      	457459442332	93
14      	398900612810	111
14      	168074802141	98
14      	108649313374	84
14      	925484684473	134
14      	646511826677	72
14      	409542246104	83
14      	514254550616	146
14      	873640709962	135
14      	894482053097	75
14      	518787417161	59
14      	118389501460	54
15      	172950643766	131
15      	383476286895	95
15      	706236730898	106
15      	317663070530	135
15      	642234808130	134
15      	290827207620	72
15      	205930062465	52
15      	633320411611	119
15      	467986934495	150
15      	754664511022	64
15      	483738463713	102
15      	528771298719	93
15      	336491915536	76
15      	941976384328	62
15      	322758894316	65
15      	576518370019	115
15      	506298714832	125
15      	134390993040	116
15      	839518983686	70
15      	882152991390	126
15      	518787417161	140
15      	414652410482	111
15      	828509049873	89
15      	863129185304	136
15      	986065693858	57
15      	558886167633	149
15      	516286957430	79
15      	364745567029	96
15      	740581174440	149
15      	453357640486	141
15      	871701186034	62
15      	529831629045	133
15      	381299535788	148
15      	308440276732	79
15      	887528437482	143
15      	536851950801	56
15      	252522255166	93
15      	722946564026	72
15      	389169531271	124
15      	286243122717	136
15      	534109743798	137
15      	349435998924	147
15      	893005812666	121
15      	339589987290	68
15      	144568875894	113
15      	894482053097	125
15      	578147508823	81
15      	568658660566	80
15      	420756960291	147
15      	749193678427	123
15      	199968033019	50
15      	556388862616	111
15      	334425348148	73
15      	203262278452	102
15      	168074802141	96
15      	925173129386	147
15      	916984241291	148
15      	511511692317	133
15      	923237099384	93
15      	636021875565	60
15      	234646454745	99
15      	600770885624	68
15      	486804801433	56
15      	547244118460	107
15      	349330324726	149
15      	312237459250	144
15      	373709485267	140
15      	962728896848	83
15      	457459442332	137
15      	384468659793	59
15      	425456990082	76
15      	435583017631	53
15      	646511826677	107
15      	994411186239	94
15      	919197823026	81
15      	702830548447	115
15      	944472664850	117
15      	308792010934	110
15      	547685258313	81
15      	173672457176	64
15      	557899454410	107
15      	400930079611	121
15      	649921994715	140
15      	939369924082	91
15      	750886611187	149
15      	716818652888	101
15      	877194198700	81
15      	696368469198	92
15      	589814450967	61
15      	945012228482	64
15      	948543507361	117
15      	523196696835	91
15      	409542246104	78
15      	643925479319	72
15      	284083366181	86
15      	554521191996	67
15      	996103067914	68
15      	314482481265	120
15      	413227470171	76
15      	875605607431	52
15      	578705048123	64
15      	673737891943	127
15      	334074319971	131
15      	488529033803	105
15      	316871031375	125
15      	836900805029	140
15      	945312847530	106
15      	982079076090	118
15      	473186595371	118
15      	899657914264	100
16      	152614854189	57
16      	698718941817	71
16      	444797600349	118
16      	388403878360	145
16      	572878568883	55
16      	297083512852	85
16      	996103067914	58
16      	308792010934	67
16      	696368469198	52
16      	414652410482	67
16      	317663070530	145
16      	286243122717	125
16      	488529033803	73
16      	523196696835	84
16      	525199185853	94
16      	534109743798	82
16      	339589987290	82
16      	528771298719	118
16      	706236730898	87
16      	608852371253	90
16      	430946284790	63
16      	603333456348	84
16      	567657950596	71
16      	134390993040	81
16      	861348595761	91
16      	187272692439	134
16      	514254550616	55
16      	654563447110	120
16      	419481071217	89
16      	381299535788	80
16      	697814031389	140
16      	692492393712	113
16      	384468659793	127
16      	986065693858	125
16      	117431954043	125
16      	380734371410	81
16      	578705048123	132
16      	765572003296	143
16      	322758894316	129
16      	871701186034	146
16      	400930079611	96
16      	412348931569	149
16      	511511692317	58
16      	127026679653	119
16      	126834215166	89
16      	862174790606	138
16      	139669412174	111
16      	290827207620	117
16      	999543417737	109
16      	590034051433	110
16      	308440276732	67
16      	482340522139	148
16      	207178796787	148
16      	776538360607	137
16      	194144382996	70
17      	252522255166	96
17      	814141265887	100
17      	882152991390	114
17      	146051347589	94
17      	418604295928	99
17      	608852371253	97
17      	836900805029	129
17      	419481071217	132
17      	205930062465	77
17      	349330324726	72
17      	754664511022	65
17      	996103067914	120
17      	207178796787	150
17      	692492393712	57
17      	398900612810	84
17      	718971287692	120
17      	923237099384	54
17      	636021875565	118
17      	589814450967	141
17      	117431954043	52
17      	364745567029	112
17      	316871031375	127
17      	203262278452	74
17      	234646454745	94
17      	388403878360	132
17      	349435998924	112
17      	948543507361	148
17      	716818652888	71
17      	999543417737	112
17      	600770885624	85
17      	939369924082	140
17      	294993047536	51
17      	381299535788	93
17      	769357296879	116
17      	702421087613	118
17      	132186536765	84
17      	887528437482	105
17      	679453075525	86
17      	516286957430	111
17      	199753522658	101
17      	706236730898	52
17      	523196696835	125
17      	152614854189	121
17      	300475101700	100
17      	528771298719	73
17      	549746556299	115
17      	893005812666	132
17      	509762284879	146
17      	945012228482	144
17      	633320411611	101
17      	556388862616	138
17      	208174494479	50
17      	925484684473	130
17      	642234808130	132
17      	979700065093	61
17      	869112308003	59
17      	308792010934	51
17      	290827207620	147
17      	483738463713	140
17      	284083366181	126
17      	176404904473	90
17      	673737891943	86
17      	140903716305	87
17      	421337093409	77
17      	482429892907	58
17      	547685258313	148
17      	286243122717	108
17      	379942304309	63
17      	732970729968	105
17      	572878568883	139
17      	413227470171	96
17      	126834215166	128
17      	721857506010	61
17      	467615168772	114
17      	527453991710	82
17      	669515708071	53
17      	308440276732	126
17      	986065693858	145
17      	702830548447	99
17      	578705048123	96
17      	933914210509	65
17      	630929030795	63
17      	127026679653	108
17      	828509049873	65
17      	514254550616	81
17      	400930079611	72
17      	274761600136	134
17      	113476782830	73
17      	698718941817	114
17      	334074319971	129
17      	334425348148	88
17      	590034051433	148
17      	894482053097	106
17      	803607788754	69
17      	312237459250	91
17      	317663070530	111
17      	862174790606	52
17      	420756960291	69
17      	941976384328	98
17      	875605607431	93
17      	875125493289	105
17      	578147508823	145
17      	618570550236	149
17      	103362565865	88
17      	902956788286	59
17      	534109743798	83
17      	172950643766	103
18      	814141265887	124
18      	483738463713	86
18      	203262278452	123
18      	419446364450	110
18      	558886167633	105
18      	398900612810	109
18      	144568875894	53
18      	482340522139	72
18      	330700905340	95
18      	925173129386	144
18      	836900805029	140
18      	556388862616	149
18      	118389501460	94
18      	698718941817	132
18      	377848719039	70
18      	108326062706	132
18      	189470486214	83
18      	882152991390	142
18      	126834215166	111
18      	933914210509	86
18      	696368469198	57
18      	952550789390	101
18      	649921994715	53
18      	569219762080	106
18      	409542246104	77
18      	113476782830	107
18      	159425007904	121
18      	506298714832	72
18      	554521191996	146
18      	706236730898	70
18      	199968033019	102
18      	252522255166	101
18      	765572003296	125
18      	381299535788	75
18      	421337093409	94
18      	945012228482	86
18      	140903716305	103
18      	754664511022	143
18      	775611741635	87
18      	557899454410	71
18      	803607788754	63
18      	180531962334	149
18      	925484684473	130
18      	450659382698	110
18      	643925479319	75
18      	349435998924	99
18      	633320411611	107
18      	679453075525	80
18      	297083512852	57
18      	896919583724	139
18      	227635917829	69
18      	246144606961	123
18      	290827207620	59
18      	776538360607	83
18      	718971287692	91
18      	174237001203	97
18      	572878568883	104
18      	642234808130	98
18      	740581174440	74
18      	412348931569	69
18      	308440276732	59
18      	284083366181	50
18      	525199185853	133
18      	103362565865	70
18      	722946564026	92
18      	208174494479	54
18      	877194198700	104
18      	887528437482	130
18      	168074802141	144
18      	261188186216	138
18      	948543507361	107
18      	430946284790	104
18      	979700065093	125
18      	134390993040	115
18      	488529033803	131
18      	536851950801	111
18      	702421087613	106
18      	167742802915	120
18      	523196696835	128
18      	210526151030	52
18      	308792010934	113
18      	205930062465	105
18      	467986934495	136
18      	629919786056	133
18      	654563447110	100
18      	875605607431	140
18      	669515708071	112
18      	264132323061	69
18      	893005812666	75
18      	419481071217	146
18      	435122760857	61
18      	750886611187	125
18      	400930079611	134
18      	547244118460	57
18      	380734371410	97
18      	646511826677	146
18      	411067277447	81
18      	294993047536	69
18      	154554749200	146
18      	67014520356 	131
18      	578147508823	100
18      	567657950596	116
18      	636021875565	108
18      	566877828296	131
18      	511511692317	67
18      	996103067914	101
18      	608852371253	64
18      	863129185304	88
19      	996103067914	138
19      	893005812666	91
19      	569219762080	82
19      	265444172694	73
19      	159425007904	147
19      	646511826677	99
19      	833663232208	124
19      	144568875894	104
19      	873640709962	95
19      	862174790606	88
19      	364745567029	67
19      	199968033019	93
19      	600770885624	76
19      	636021875565	149
19      	547685258313	117
19      	506298714832	122
19      	373709485267	118
19      	633320411611	52
19      	654563447110	90
19      	589814450967	127
19      	140903716305	150
19      	979700065093	84
19      	154554749200	132
19      	322758894316	120
19      	769357296879	60
19      	227635917829	109
19      	945312847530	87
19      	836900805029	147
19      	576518370019	60
19      	814141265887	54
19      	692492393712	62
19      	871701186034	82
19      	284083366181	102
19      	750886611187	58
19      	919197823026	74
19      	384179652400	90
19      	816260222588	138
19      	210526151030	97
19      	495776106616	149
19      	945012228482	68
19      	384468659793	79
19      	400930079611	133
19      	314482481265	66
19      	349435998924	134
19      	380734371410	94
19      	863129185304	54
19      	389169531271	116
19      	176404904473	69
19      	679453075525	92
19      	702830548447	88
19      	877194198700	111
19      	418604295928	148
19      	556388862616	139
19      	274761600136	143
19      	134390993040	79
19      	709229053555	69
19      	430946284790	71
19      	444797600349	56
19      	875125493289	87
19      	554521191996	76
19      	982079076090	86
19      	771137437634	124
19      	986065693858	109
19      	334074319971	84
19      	509762284879	97
19      	775611741635	138
19      	132954606361	73
19      	425456990082	143
19      	126834215166	143
19      	536851950801	138
19      	578705048123	110
19      	516495915668	86
19      	482340522139	90
19      	776538360607	72
19      	400127531270	97
19      	381299535788	74
19      	642234808130	128
19      	453357640486	64
19      	118389501460	143
19      	838962966418	69
19      	868744054130	87
19      	529831629045	55
19      	697814031389	86
20      	933914210509	94
20      	172950643766	73
20      	869112308003	55
20      	290827207620	61
20      	388403878360	109
20      	871701186034	148
20      	986065693858	74
20      	508818965558	109
20      	945012228482	138
20      	413227470171	75
20      	189470486214	66
20      	316871031375	125
20      	814141265887	132
20      	948543507361	132
20      	203262278452	137
20      	398900612810	134
20      	877194198700	93
20      	523196696835	66
20      	549746556299	83
20      	129753980851	147
20      	450659382698	146
20      	702830548447	150
20      	384179652400	60
20      	994411186239	117
20      	862174790606	119
20      	770565227675	143
20      	509762284879	130
20      	140903716305	67
20      	547685258313	89
20      	875125493289	67
20      	205930062465	131
20      	568658660566	66
20      	849681336901	83
20      	152614854189	140
20      	527453991710	123
20      	146051347589	138
20      	514254550616	97
20      	750886611187	58
20      	379942304309	139
20      	569219762080	116
20      	642234808130	84
20      	207178796787	119
20      	108649313374	70
20      	516286957430	72
20      	421337093409	113
20      	859109096191	119
20      	566877828296	142
20      	389169531271	127
20      	234646454745	81
20      	154554749200	144
20      	518329844939	150
21      	132186536765	63
21      	534109743798	90
21      	411067277447	96
21      	140903716305	54
21      	516495915668	113
21      	174237001203	144
21      	868744054130	80
21      	467986934495	136
21      	322758894316	102
21      	421337093409	65
21      	380734371410	149
21      	430946284790	136
21      	771137437634	79
21      	308792010934	146
21      	412348931569	116
21      	227635917829	79
21      	887528437482	123
21      	875605607431	139
21      	600770885624	59
21      	379942304309	95
21      	419446364450	84
21      	945312847530	115
21      	518329844939	50
21      	649921994715	96
21      	862174790606	84
21      	994411186239	104
21      	265444172694	122
21      	944472664850	113
21      	349435998924	130
21      	636021875565	139
21      	312237459250	52
21      	294993047536	83
21      	389169531271	141
21      	765572003296	143
21      	208174494479	103
21      	873640709962	134
21      	770565227675	53
21      	741544174664	78
21      	578147508823	124
21      	272121204465	140
21      	776538360607	99
21      	67014520356 	83
21      	264132323061	92
21      	483738463713	149
21      	740581174440	115
21      	750886611187	52
21      	786975743876	73
21      	297083512852	126
21      	833663232208	129
21      	816260222588	53
21      	916984241291	81
21      	383476286895	59
21      	168074802141	52
21      	187272692439	114
21      	308440276732	59
21      	199968033019	58
21      	482429892907	99
21      	457459442332	109
21      	839518983686	121
21      	608852371253	146
21      	284083366181	76
21      	420756960291	52
21      	805966823208	124
21      	486804801433	60
21      	482340522139	64
21      	314482481265	77
21      	113476782830	148
21      	509762284879	75
21      	117431954043	60
21      	642234808130	93
21      	948543507361	110
21      	108326062706	104
21      	349330324726	113
21      	567657950596	91
21      	300475101700	64
21      	180531962334	96
21      	923237099384	129
21      	722946564026	80
21      	167742802915	95
21      	660310920540	97
21      	246144606961	63
21      	618570550236	57
21      	506298714832	83
21      	418604295928	114
21      	330700905340	116
21      	176404904473	147
21      	336491915536	57
21      	339589987290	105
21      	152614854189	52
21      	495776106616	62
21      	334074319971	63
21      	803607788754	110
21      	569219762080	138
21      	547244118460	129
21      	203262278452	107
21      	732970729968	89
21      	250617599940	102
21      	875125493289	150
21      	716818652888	129
21      	384179652400	52
21      	869112308003	85
21      	400127531270	105
21      	252522255166	150
21      	413227470171	78
21      	814141265887	57
21      	118389501460	139
21      	154554749200	130
21      	375276903331	120
21      	859109096191	129
21      	836900805029	59
21      	467615168772	108
21      	159425007904	138
21      	679453075525	54
21      	996103067914	59
21      	189470486214	63
21      	425456990082	71
21      	398900612810	59
21      	896919583724	66
21      	317663070530	103
22      	556388862616	77
22      	698718941817	84
22      	127026679653	136
22      	654563447110	64
22      	527453991710	89
22      	566877828296	129
22      	882152991390	127
22      	769357296879	78
22      	696368469198	76
22      	349435998924	118
22      	473186595371	77
22      	234646454745	102
22      	534109743798	82
22      	413227470171	96
22      	430946284790	80
22      	518329844939	108
22      	962728896848	66
22      	816260222588	106
22      	400930079611	122
22      	174237001203	69
22      	414652410482	84
22      	660310920540	148
22      	418604295928	75
22      	419446364450	114
22      	557899454410	62
22      	669515708071	125
22      	349330324726	53
22      	409542246104	116
22      	450659382698	138
22      	336491915536	84
22      	518787417161	102
22      	776538360607	139
22      	284083366181	138
22      	398900612810	148
22      	692492393712	142
22      	702830548447	93
22      	330700905340	100
22      	933914210509	95
22      	117431954043	119
22      	859109096191	94
22      	252522255166	101
22      	749625390019	119
22      	999543417737	114
22      	899657914264	66
22      	511511692317	74
22      	558886167633	52
22      	833663232208	88
22      	490997846898	133
22      	754664511022	114
22      	862174790606	105
22      	364745567029	120
22      	925173129386	120
22      	590034051433	80
22      	103362565865	73
22      	199968033019	67
22      	274761600136	68
22      	139669412174	93
22      	861348595761	92
22      	948543507361	110
22      	384179652400	85
22      	939369924082	78
22      	316871031375	146
22      	643925479319	111
22      	875605607431	134
22      	893005812666	74
22      	636021875565	104
22      	902956788286	126
22      	67014520356 	117
22      	172950643766	63
22      	516286957430	94
22      	322758894316	56
22      	272121204465	97
22      	516495915668	66
22      	250617599940	82
22      	771137437634	123
22      	140903716305	124
22      	167742802915	133
22      	126834215166	106
22      	873640709962	61
22      	629919786056	129
22      	384468659793	76
22      	576518370019	111
22      	246144606961	127
22      	261188186216	86
22      	144568875894	75
22      	775611741635	63
22      	380734371410	143
22      	554521191996	82
22      	308440276732	88
22      	679453075525	149
22      	312237459250	63
22      	600770885624	58
22      	118389501460	134
22      	828509049873	72
22      	572878568883	125
22      	286243122717	112
22      	113476782830	143
22      	482340522139	123
22      	716818652888	57
22      	297083512852	62
22      	444797600349	76
22      	308792010934	109
22      	923237099384	55
22      	839518983686	106
22      	388403878360	91
22      	314482481265	56
22      	741544174664	83
22      	411067277447	90
22      	482429892907	126
22      	919197823026	98
22      	896919583724	70
22      	863129185304	142
22      	435122760857	149
22      	916984241291	130
22      	578705048123	92
22      	998040421944	114
22      	805966823208	77
22      	203262278452	118
22      	168074802141	87
22      	649921994715	126
22      	549746556299	135
22      	508818965558	77
22      	765572003296	65
22      	702421087613	121
22      	786975743876	137
22      	982079076090	75
22      	945012228482	107
22      	567657950596	94
22      	722946564026	62
22      	904647940449	146
22      	529831629045	113
22      	770565227675	86
22      	377848719039	64
22      	941976384328	101
22      	568658660566	87
22      	673737891943	86
22      	375276903331	122
22      	528771298719	56
22      	339589987290	137
22      	152614854189	142
22      	495776106616	136
22      	300475101700	101
22      	877194198700	63
22      	453357640486	52
22      	400127531270	97
22      	646511826677	102
22      	154554749200	122
22      	488529033803	75
23      	364745567029	138
23      	312237459250	114
23      	525199185853	78
23      	702421087613	88
23      	308440276732	92
23      	996103067914	56
23      	413227470171	108
23      	925173129386	141
23      	118389501460	112
23      	999543417737	75
23      	998040421944	89
23      	419481071217	108
23      	862174790606	127
23      	290827207620	71
23      	986065693858	136
23      	629919786056	140
23      	509762284879	131
23      	108326062706	82
23      	869112308003	103
23      	314482481265	82
23      	863129185304	129
23      	430946284790	67
23      	603333456348	134
23      	933914210509	122
23      	578147508823	84
23      	420756960291	117
23      	925484684473	88
23      	589814450967	66
23      	103362565865	95
23      	176404904473	147
23      	409542246104	64
23      	529831629045	82
23      	117431954043	56
23      	139669412174	130
23      	873640709962	60
23      	411067277447	137
23      	398900612810	79
23      	265444172694	149
23      	336491915536	129
23      	692492393712	134
23      	272121204465	134
23      	941976384328	140
23      	508818965558	112
23      	887528437482	113
23      	180531962334	95
23      	414652410482	119
23      	129753980851	58
23      	749193678427	148
23      	669515708071	103
23      	194144382996	137
23      	578705048123	100
23      	673737891943	84
23      	146051347589	89
23      	877194198700	53
23      	702830548447	113
23      	144568875894	99
23      	569219762080	52
23      	805966823208	107
23      	732970729968	60
23      	506298714832	145
23      	250617599940	137
23      	518787417161	135
23      	749625390019	70
23      	836900805029	78
23      	962728896848	77
23      	203262278452	144
23      	558886167633	107
23      	698718941817	118
23      	473186595371	139
23      	418604295928	62
23      	636021875565	75
23      	518329844939	57
23      	754664511022	133
23      	600770885624	144
23      	770565227675	96
23      	902956788286	106
23      	861348595761	133
23      	566877828296	111
23      	709229053555	123
23      	516495915668	130
23      	207178796787	106
23      	923237099384	73
23      	899657914264	56
23      	154554749200	56
23      	633320411611	82
23      	349435998924	80
23      	554521191996	98
23      	208174494479	87
23      	467615168772	144
23      	816260222588	68
23      	944472664850	84
23      	567657950596	138
23      	534109743798	131
23      	246144606961	125
23      	986202008726	128
23      	882152991390	51
23      	679453075525	137
23      	375276903331	67
23      	174237001203	97
23      	696368469198	142
23      	919197823026	140
23      	379942304309	75
23      	334425348148	81
23      	536851950801	134
23      	875125493289	65
23      	167742802915	147
23      	389169531271	145
23      	697814031389	65
23      	381299535788	85
24      	566877828296	144
24      	600770885624	142
24      	630929030795	70
24      	527453991710	57
24      	261188186216	55
24      	174237001203	62
24      	962728896848	134
24      	518787417161	88
24      	894482053097	149
24      	189470486214	102
24      	435583017631	57
24      	400930079611	51
24      	377848719039	127
24      	203262278452	54
24      	132954606361	113
24      	172950643766	90
24      	941976384328	145
24      	904647940449	80
24      	771137437634	64
24      	482340522139	67
24      	534109743798	66
24      	608852371253	112
24      	986202008726	76
24      	208174494479	94
24      	516286957430	53
24      	234646454745	143
24      	264132323061	123
24      	629919786056	68
24      	205930062465	70
24      	246144606961	69
24      	887528437482	123
24      	187272692439	88
24      	877194198700	83
24      	322758894316	88
24      	381299535788	75
24      	749625390019	145
24      	314482481265	144
24      	482429892907	64
24      	140903716305	66
24      	180531962334	102
24      	803607788754	66
24      	383476286895	59
24      	435122760857	68
24      	297083512852	51
24      	414652410482	98
24      	775611741635	129
24      	518329844939	75
24      	636021875565	50
24      	732970729968	65
24      	536851950801	150
24      	893005812666	150
24      	126834215166	102
24      	816260222588	139
24      	982079076090	89
24      	398900612810	53
24      	754664511022	70
24      	939369924082	112
24      	173672457176	62
24      	384468659793	57
24      	643925479319	109
24      	252522255166	132
24      	514254550616	137
24      	590034051433	62
24      	875125493289	94
24      	869112308003	137
24      	199753522658	59
24      	508818965558	82
24      	425456990082	59
24      	836900805029	148
24      	578147508823	55
24      	718971287692	81
24      	698718941817	96
24      	308440276732	85
24      	103362565865	121
24      	679453075525	56
24      	528771298719	148
24      	411067277447	93
24      	871701186034	85
24      	654563447110	74
24      	290827207620	79
24      	250617599940	57
24      	769357296879	120
24      	576518370019	64
24      	194144382996	101
24      	168074802141	127
24      	509762284879	149
24      	388403878360	95
24      	312237459250	77
24      	511511692317	137
24      	554521191996	53
24      	749193678427	114
24      	750886611187	67
24      	272121204465	129
24      	786975743876	129
24      	916984241291	69
24      	706236730898	143
24      	875605607431	118
24      	556388862616	146
24      	896919583724	98
24      	467986934495	54
24      	882152991390	134
24      	669515708071	70
24      	849681336901	93
24      	129753980851	79
24      	996103067914	84
24      	349435998924	81
25      	265444172694	61
25      	482429892907	139
25      	117431954043	94
25      	400127531270	115
25      	398900612810	57
25      	486804801433	95
25      	144568875894	144
25      	488529033803	57
25      	679453075525	116
25      	377848719039	64
25      	108326062706	129
25      	334074319971	56
25      	418604295928	127
25      	511511692317	88
25      	556388862616	107
25      	388403878360	111
25      	771137437634	120
25      	506298714832	88
25      	660310920540	124
25      	205930062465	125
25      	168074802141	121
25      	916984241291	118
25      	649921994715	118
25      	749625390019	132
25      	467986934495	69
25      	996103067914	144
25      	126834215166	58
25      	435583017631	134
25      	563144943925	66
25      	420756960291	121
25      	925484684473	52
25      	409542246104	121
25      	629919786056	51
25      	839518983686	105
25      	828509049873	97
25      	769357296879	101
25      	173672457176	65
25      	284083366181	135
25      	673737891943	78
25      	336491915536	115
25      	129753980851	76
25      	317663070530	60
25      	549746556299	121
25      	706236730898	104
25      	877194198700	70
25      	127026679653	57
25      	383476286895	60
25      	457459442332	141
25      	322758894316	63
25      	630929030795	77
25      	384179652400	79
25      	525199185853	78
25      	384468659793	99
25      	375276903331	135
25      	618570550236	67
25      	816260222588	107
25      	945012228482	125
25      	482340522139	141
26      	945312847530	128
26      	126834215166	52
26      	873640709962	100
26      	294993047536	111
26      	816260222588	56
26      	308440276732	136
26      	994411186239	114
26      	859109096191	112
26      	939369924082	54
26      	775611741635	95
26      	336491915536	98
26      	904647940449	118
26      	250617599940	61
26      	741544174664	83
26      	316871031375	122
26      	159425007904	64
26      	893005812666	68
26      	732970729968	105
26      	629919786056	56
26      	838962966418	144
26      	646511826677	81
26      	925173129386	91
26      	284083366181	109
26      	803607788754	54
26      	398900612810	90
26      	495776106616	108
26      	207178796787	91
26      	839518983686	143
26      	578705048123	117
26      	618570550236	96
26      	373709485267	60
26      	740581174440	63
26      	108649313374	110
26      	467986934495	74
26      	409542246104	79
26      	557899454410	51
26      	749625390019	124
26      	933914210509	141
26      	317663070530	57
26      	482340522139	107
26      	435583017631	84
26      	945012228482	82
26      	486804801433	129
26      	679453075525	128
26      	692492393712	119
26      	168074802141	135
26      	709229053555	85
26      	603333456348	86
26      	749193678427	61
26      	384468659793	137
26      	412348931569	88
26      	67014520356 	135
26      	421337093409	65
26      	199968033019	70
26      	388403878360	120
26      	339589987290	93
26      	252522255166	123
26      	896919583724	63
26      	869112308003	122
26      	558886167633	84
26      	877194198700	64
26      	770565227675	90
26      	435122760857	112
26      	154554749200	52
26      	144568875894	113
26      	457459442332	122
26      	643925479319	123
26      	769357296879	57
26      	999543417737	91
26      	322758894316	97
26      	554521191996	53
26      	518787417161	94
26      	528771298719	85
26      	547244118460	95
26      	576518370019	124
26      	518329844939	65
26      	139669412174	146
26      	132954606361	91
26      	696368469198	61
26      	132186536765	104
26      	982079076090	63
26      	364745567029	75
26      	868744054130	65
26      	776538360607	103
26      	952550789390	77
26      	871701186034	78
26      	765572003296	90
26      	194144382996	63
26      	805966823208	110
26      	925484684473	52
26      	771137437634	143
26      	916984241291	79
26      	948543507361	130
26      	549746556299	88
26      	381299535788	144
26      	506298714832	98
26      	349330324726	127
26      	998040421944	127
26      	308792010934	87
26      	706236730898	52
26      	450659382698	109
26      	516286957430	117
26      	483738463713	80
26      	923237099384	57
26      	899657914264	111
26      	117431954043	100
26      	875605607431	106
26      	986065693858	77
26      	430946284790	137
26      	146051347589	102
26      	882152991390	56
26      	962728896848	72
26      	389169531271	141
26      	140903716305	143
26      	894482053097	120
26      	642234808130	146
26      	589814450967	124
26      	108326062706	62
26      	400127531270	105
26      	400930079611	59
26      	944472664850	65
26      	312237459250	101
26      	996103067914	53
26      	246144606961	102
26      	411067277447	113
26      	568658660566	130
26      	654563447110	120
26      	174237001203	116
26      	509762284879	108
26      	265444172694	112
26      	377848719039	76
26      	349435998924	118
26      	673737891943	116
26      	902956788286	148
26      	523196696835	104
26      	514254550616	103
26      	849681336901	145
26      	669515708071	131
26      	941976384328	126
26      	444797600349	147
26      	863129185304	149
27      	108326062706	90
27      	414652410482	110
27      	516495915668	101
27      	836900805029	52
27      	294993047536	125
27      	117431954043	119
27      	568658660566	92
27      	400930079611	148
27      	419446364450	92
27      	706236730898	135
27      	261188186216	135
27      	127026679653	116
27      	839518983686	113
27      	412348931569	118
27      	67014520356 	141
27      	514254550616	129
27      	146051347589	107
27      	558886167633	103
27      	722946564026	72
27      	643925479319	103
27      	549746556299	129
27      	859109096191	61
27      	563144943925	71
27      	430946284790	80
27      	284083366181	131
27      	398900612810	142
27      	418604295928	107
27      	590034051433	136
27      	649921994715	55
27      	265444172694	118
27      	660310920540	72
27      	750886611187	104
27      	113476782830	122
27      	838962966418	77
27      	654563447110	110
27      	126834215166	134
27      	129753980851	98
27      	154554749200	77
27      	933914210509	149
27      	312237459250	109
27      	536851950801	110
27      	290827207620	80
27      	380734371410	136
27      	828509049873	87
27      	569219762080	77
27      	528771298719	61
27      	589814450967	125
27      	896919583724	62
27      	814141265887	96
27      	377848719039	122
27      	816260222588	135
27      	152614854189	145
27      	384179652400	79
27      	882152991390	52
27      	322758894316	76
27      	618570550236	79
27      	557899454410	50
27      	203262278452	73
27      	567657950596	56
27      	525199185853	147
27      	511511692317	54
27      	962728896848	147
27      	556388862616	129
27      	529831629045	56
27      	453357640486	118
27      	578147508823	143
27      	274761600136	63
27      	805966823208	120
27      	381299535788	129
27      	384468659793	104
27      	939369924082	142
27      	679453075525	141
27      	603333456348	126
27      	210526151030	117
27      	776538360607	118
27      	473186595371	133
27      	227635917829	96
27      	413227470171	60
27      	749625390019	81
27      	770565227675	92
27      	421337093409	54
27      	871701186034	87
27      	741544174664	91
27      	252522255166	149
27      	893005812666	128
27      	316871031375	112
27      	144568875894	137
27      	207178796787	66
27      	349435998924	138
27      	861348595761	106
27      	379942304309	81
27      	205930062465	135
27      	765572003296	83
27      	986202008726	128
27      	314482481265	50
27      	904647940449	59
27      	673737891943	84
27      	646511826677	61
27      	375276903331	144
27      	945312847530	87
27      	194144382996	75
27      	999543417737	70
27      	444797600349	148
27      	948543507361	67
27      	629919786056	68
27      	389169531271	119
27      	364745567029	83
27      	420756960291	148
27      	630929030795	131
27      	786975743876	149
27      	894482053097	60
27      	869112308003	124
27      	208174494479	121
27      	919197823026	102
27      	875605607431	124
27      	979700065093	68
27      	118389501460	57
27      	669515708071	70
27      	199753522658	98
27      	642234808130	81
28      	159425007904	61
28      	126834215166	84
28      	941976384328	108
28      	838962966418	86
28      	558886167633	53
28      	488529033803	135
28      	741544174664	110
28      	776538360607	102
28      	649921994715	79
28      	330700905340	65
28      	877194198700	150
28      	933914210509	52
28      	952550789390	123
28      	525199185853	108
28      	534109743798	71
28      	750886611187	115
28      	508818965558	135
28      	252522255166	107
28      	419446364450	108
28      	527453991710	60
28      	264132323061	147
28      	849681336901	134
28      	516495915668	143
28      	284083366181	84
28      	419481071217	126
28      	944472664850	148
28      	384468659793	51
28      	334425348148	51
28      	962728896848	149
28      	839518983686	56
28      	199753522658	116
28      	660310920540	50
28      	679453075525	132
28      	702421087613	91
28      	389169531271	136
28      	828509049873	146
28      	430946284790	119
28      	771137437634	53
28      	506298714832	101
28      	518329844939	67
28      	286243122717	58
28      	568658660566	147
28      	187272692439	137
28      	152614854189	55
28      	180531962334	114
28      	511511692317	76
28      	923237099384	109
28      	994411186239	96
28      	412348931569	147
28      	108649313374	126
28      	982079076090	75
28      	261188186216	73
28      	814141265887	123
28      	300475101700	72
28      	925484684473	126
28      	457459442332	92
28      	490997846898	128
28      	805966823208	68
28      	945312847530	128
28      	167742802915	129
28      	862174790606	109
28      	986202008726	123
28      	418604295928	116
28      	979700065093	76
28      	986065693858	150
28      	384179652400	58
28      	572878568883	142
28      	339589987290	59
28      	139669412174	107
28      	377848719039	63
28      	129753980851	113
28      	697814031389	114
28      	140903716305	76
28      	514254550616	138
28      	400930079611	110
29      	419481071217	140
29      	108326062706	52
29      	590034051433	83
29      	176404904473	59
29      	765572003296	71
29      	836900805029	74
29      	139669412174	102
29      	373709485267	84
29      	509762284879	103
29      	453357640486	144
29      	982079076090	118
29      	875605607431	108
29      	518329844939	94
29      	308440276732	79
29      	457459442332	95
29      	383476286895	57
29      	516286957430	60
29      	986202008726	65
29      	952550789390	142
29      	923237099384	125
29      	389169531271	141
29      	132186536765	58
29      	187272692439	85
29      	117431954043	85
29      	205930062465	115
29      	716818652888	144
29      	882152991390	125
29      	776538360607	73
29      	103362565865	149
29      	421337093409	94
29      	572878568883	87
29      	649921994715	74
29      	450659382698	130
29      	702830548447	68
29      	159425007904	127
29      	875125493289	140
29      	199753522658	66
29      	608852371253	84
29      	152614854189	125
29      	996103067914	89
29      	127026679653	137
29      	741544174664	121
29      	336491915536	147
29      	518787417161	148
29      	486804801433	80
29      	180531962334	133
29      	400930079611	93
29      	578705048123	80
29      	430946284790	122
29      	525199185853	105
29      	706236730898	95
29      	839518983686	111
29      	750886611187	101
29      	803607788754	141
29      	919197823026	99
29      	999543417737	125
29      	979700065093	110
29      	554521191996	150
29      	284083366181	148
29      	227635917829	94
29      	261188186216	127
29      	547244118460	132
29      	816260222588	81
29      	146051347589	50
29      	944472664850	51
29      	549746556299	123
29      	557899454410	124
29      	272121204465	123
29      	986065693858	85
29      	364745567029	58
29      	709229053555	56
29      	490997846898	127
29      	334425348148	92
29      	660310920540	139
29      	721857506010	70
29      	893005812666	112
29      	418604295928	71
29      	945312847530	133
29      	998040421944	136
29      	274761600136	128
29      	246144606961	90
29      	203262278452	82
29      	945012228482	70
29      	129753980851	130
29      	899657914264	83
29      	523196696835	92
29      	749193678427	72
29      	536851950801	65
29      	786975743876	51
29      	673737891943	123
29      	578147508823	125
29      	312237459250	95
29      	754664511022	61
29      	863129185304	96
29      	697814031389	141
29      	400127531270	130
29      	339589987290	96
29      	172950643766	84
29      	126834215166	146
29      	534109743798	138
29      	207178796787	53
29      	265444172694	125
29      	838962966418	57
29      	630929030795	85
29      	916984241291	89
29      	894482053097	85
29      	412348931569	59
29      	384179652400	76
29      	113476782830	84
29      	769357296879	141
29      	444797600349	70
29      	514254550616	134
29      	871701186034	140
29      	933914210509	104
29      	425456990082	146
29      	252522255166	60
29      	194144382996	83
29      	314482481265	113
29      	722946564026	76
29      	483738463713	54
29      	696368469198	68
29      	642234808130	120
29      	308792010934	104
29      	264132323061	104
29      	556388862616	74
29      	567657950596	117
29      	508818965558	138
29      	948543507361	147
29      	698718941817	80
29      	379942304309	69
30      	887528437482	127
30      	349330324726	64
30      	482340522139	82
30      	308440276732	97
30      	697814031389	93
30      	765572003296	91
30      	896919583724	140
30      	420756960291	104
30      	234646454745	120
30      	518329844939	140
30      	749193678427	53
30      	996103067914	146
30      	643925479319	122
30      	529831629045	81
30      	139669412174	58
30      	776538360607	126
30      	863129185304	93
30      	508818965558	139
30      	569219762080	103
30      	349435998924	122
30      	649921994715	97
30      	457459442332	57
30      	467615168772	127
30      	871701186034	137
30      	630929030795	52
30      	113476782830	138
30      	933914210509	86
30      	413227470171	97
30      	518787417161	100
30      	482429892907	110
30      	547244118460	94
30      	252522255166	115
30      	506298714832	85
30      	419481071217	82
30      	603333456348	64
30      	444797600349	144
30      	364745567029	91
30      	199753522658	120
30      	554521191996	110
30      	716818652888	54
30      	435583017631	60
30      	425456990082	143
30      	373709485267	64
30      	660310920540	140
30      	679453075525	84
30      	172950643766	105
30      	265444172694	99
30      	380734371410	103
30      	194144382996	146
30      	144568875894	53
30      	833663232208	67
30      	894482053097	50
30      	389169531271	94
30      	384468659793	61
30      	398900612810	61
30      	556388862616	78
30      	322758894316	59
30      	741544174664	113
30      	412348931569	113
30      	514254550616	130
30      	882152991390	133
30      	430946284790	129
30      	673737891943	134
30      	566877828296	83
30      	300475101700	79
30      	400127531270	140
30      	986065693858	93
30      	379942304309	70
30      	718971287692	150
30      	578147508823	99
30      	875605607431	84
30      	411067277447	124
30      	600770885624	123
30      	154554749200	51
30      	636021875565	143
30      	769357296879	62
30      	419446364450	114
30      	999543417737	106
30      	904647940449	129
30      	786975743876	90
30      	286243122717	92
30      	633320411611	134
30      	108649313374	90
30      	509762284879	105
30      	308792010934	65
30      	534109743798	111
30      	467986934495	58
30      	740581174440	71
30      	118389501460	81
30      	117431954043	114
30      	771137437634	98
30      	274761600136	87
30      	849681336901	138
30      	180531962334	107
30      	126834215166	118
30      	702830548447	126
30      	297083512852	97
30      	770565227675	56
30      	284083366181	53
30      	803607788754	115
30      	952550789390	66
30      	589814450967	87
30      	146051347589	62
30      	877194198700	77
30      	547685258313	61
30      	317663070530	87
30      	578705048123	104
30      	377848719039	51
30      	816260222588	78
30      	732970729968	79
30      	227635917829	82
30      	536851950801	76
30      	381299535788	127
30      	127026679653	129
30      	523196696835	143
30      	486804801433	103
30      	488529033803	70
30      	330700905340	105
30      	409542246104	134
30      	925484684473	135
30      	859109096191	108
30      	986202008726	125
30      	67014520356 	126
30      	925173129386	100
30      	384179652400	112
30      	388403878360	124
30      	205930062465	139
30      	923237099384	59
30      	702421087613	72
30      	642234808130	129
30      	261188186216	132
30      	527453991710	61
30      	176404904473	107
30      	132186536765	68
30      	316871031375	89
30      	861348595761	95
30      	246144606961	82
30      	893005812666	107
30      	483738463713	53
30      	828509049873	94
30      	272121204465	114
31      	453357640486	66
31      	450659382698	91
31      	945012228482	108
31      	838962966418	136
31      	816260222588	91
31      	563144943925	126
31      	578147508823	87
31      	126834215166	82
31      	467615168772	99
31      	982079076090	119
31      	643925479319	117
31      	349330324726	146
31      	174237001203	143
31      	896919583724	117
31      	916984241291	51
31      	419481071217	74
31      	420756960291	69
31      	765572003296	132
31      	528771298719	131
31      	702830548447	135
31      	941976384328	113
31      	227635917829	131
31      	986202008726	82
31      	608852371253	86
31      	839518983686	70
31      	741544174664	147
31      	308792010934	109
31      	899657914264	106
31      	948543507361	123
31      	473186595371	123
31      	246144606961	52
31      	923237099384	141
31      	770565227675	55
31      	939369924082	136
31      	411067277447	132
31      	264132323061	85
31      	527453991710	126
31      	419446364450	76
31      	716818652888	124
31      	945312847530	104
31      	117431954043	118
31      	558886167633	107
31      	567657950596	89
31      	863129185304	142
31      	882152991390	95
31      	425456990082	66
31      	208174494479	87
31      	297083512852	107
31      	589814450967	145
31      	696368469198	123
31      	400127531270	111
31      	706236730898	101
31      	444797600349	127
31      	199753522658	98
31      	887528437482	71
31      	654563447110	54
31      	642234808130	92
31      	836900805029	58
31      	409542246104	84
31      	508818965558	140
31      	381299535788	134
31      	698718941817	130
31      	146051347589	141
31      	828509049873	139
31      	771137437634	58
31      	330700905340	57
31      	316871031375	83
31      	557899454410	109
31      	194144382996	104
31      	379942304309	150
31      	284083366181	143
31      	803607788754	140
31      	944472664850	86
31      	189470486214	140
31      	618570550236	123
31      	722946564026	86
31      	669515708071	148
32      	108649313374	69
32      	381299535788	103
32      	509762284879	133
32      	567657950596	128
32      	982079076090	91
32      	877194198700	92
32      	144568875894	132
32      	187272692439	51
32      	654563447110	63
32      	246144606961	70
32      	948543507361	112
32      	264132323061	133
32      	749625390019	119
32      	769357296879	73
32      	721857506010	58
32      	146051347589	75
32      	473186595371	94
32      	893005812666	125
32      	514254550616	52
32      	660310920540	65
32      	873640709962	87
32      	629919786056	70
32      	129753980851	111
32      	398900612810	70
32      	706236730898	118
32      	388403878360	87
32      	578705048123	62
32      	642234808130	140
32      	696368469198	87
32      	174237001203	60
32      	572878568883	84
32      	297083512852	97
32      	518329844939	58
32      	939369924082	85
32      	536851950801	53
32      	776538360607	106
32      	518787417161	115
32      	140903716305	134
32      	413227470171	50
32      	702421087613	95
32      	159425007904	128
32      	274761600136	144
32      	740581174440	59
32      	167742802915	69
32      	286243122717	146
32      	411067277447	128
32      	108326062706	75
32      	364745567029	134
32      	816260222588	126
32      	718971287692	142
32      	414652410482	137
32      	749193678427	103
33      	435122760857	135
33      	608852371253	128
33      	167742802915	130
33      	904647940449	83
33      	697814031389	82
33      	294993047536	108
33      	189470486214	141
33      	887528437482	102
33      	286243122717	111
33      	776538360607	131
33      	430946284790	139
33      	265444172694	115
33      	527453991710	134
33      	336491915536	141
33      	413227470171	74
33      	308792010934	85
33      	882152991390	96
33      	629919786056	83
33      	836900805029	92
33      	873640709962	118
33      	139669412174	98
33      	982079076090	126
33      	173672457176	91
33      	514254550616	129
33      	467986934495	60
33      	425456990082	115
33      	986065693858	150
33      	159425007904	79
33      	381299535788	141
33      	750886611187	102
33      	488529033803	98
33      	547244118460	121
33      	509762284879	58
33      	174237001203	100
33      	945312847530	144
33      	234646454745	105
33      	297083512852	81
33      	740581174440	62
33      	144568875894	147
33      	482429892907	64
33      	568658660566	150
33      	578705048123	89
33      	117431954043	103
33      	869112308003	119
33      	868744054130	137
33      	418604295928	133
33      	227635917829	125
33      	134390993040	125
33      	450659382698	118
33      	556388862616	55
33      	999543417737	86
33      	875605607431	144
33      	646511826677	77
33      	154554749200	93
33      	636021875565	128
33      	412348931569	92
33      	334425348148	72
33      	486804801433	77
33      	317663070530	85
33      	400127531270	100
33      	108649313374	123
33      	722946564026	73
33      	986202008726	98
33      	838962966418	112
33      	563144943925	67
33      	816260222588	79
33      	861348595761	97
33      	871701186034	53
33      	603333456348	133
33      	349330324726	78
33      	669515708071	122
33      	444797600349	112
33      	483738463713	137
33      	210526151030	61
33      	140903716305	128
33      	132186536765	64
33      	702830548447	126
33      	696368469198	123
33      	916984241291	91
33      	718971287692	95
33      	786975743876	131
33      	176404904473	125
33      	187272692439	80
33      	334074319971	58
33      	467615168772	80
33      	618570550236	76
33      	400930079611	112
33      	421337093409	82
33      	380734371410	143
33      	633320411611	90
33      	113476782830	95
33      	146051347589	85
33      	576518370019	99
33      	939369924082	66
33      	567657950596	145
33      	732970729968	86
33      	511511692317	118
33      	642234808130	77
33      	518329844939	89
33      	108326062706	90
33      	721857506010	116
33      	894482053097	141
33      	998040421944	115
33      	770565227675	135
33      	127026679653	60
33      	207178796787	58
33      	411067277447	111
33      	692492393712	52
33      	923237099384	143
33      	944472664850	108
33      	152614854189	66
33      	893005812666	115
33      	549746556299	145
33      	630929030795	79
33      	261188186216	125
33      	172950643766	53
33      	902956788286	99
33      	290827207620	50
33      	962728896848	136
33      	933914210509	140
34      	732970729968	107
34      	945012228482	88
34      	863129185304	92
34      	180531962334	76
34      	509762284879	51
34      	986202008726	134
34      	786975743876	73
34      	400127531270	149
34      	132186536765	91
34      	567657950596	86
34      	265444172694	93
34      	398900612810	67
34      	172950643766	69
34      	882152991390	107
34      	377848719039	132
34      	893005812666	51
34      	127026679653	149
34      	709229053555	62
34      	349330324726	78
34      	877194198700	115
34      	412348931569	134
34      	411067277447	114
34      	749625390019	51
34      	286243122717	109
34      	861348595761	68
34      	706236730898	123
34      	234646454745	128
34      	189470486214	94
34      	939369924082	104
34      	316871031375	109
34      	869112308003	96
34      	871701186034	129
34      	875605607431	148
34      	669515708071	98
34      	495776106616	57
34      	941976384328	73
34      	925484684473	122
34      	388403878360	133
34      	952550789390	148
34      	636021875565	139
34      	572878568883	99
34      	944472664850	122
34      	208174494479	77
34      	916984241291	67
34      	312237459250	71
34      	899657914264	98
34      	486804801433	141
34      	771137437634	80
34      	246144606961	91
34      	450659382698	143
34      	529831629045	60
34      	741544174664	91
34      	152614854189	145
34      	516495915668	139
34      	483738463713	91
34      	563144943925	81
34      	473186595371	121
34      	199968033019	77
35      	132186536765	114
35      	899657914264	79
35      	528771298719	78
35      	167742802915	51
35      	702421087613	94
35      	696368469198	101
35      	381299535788	55
35      	377848719039	126
35      	414652410482	87
35      	488529033803	121
35      	576518370019	76
35      	816260222588	74
35      	411067277447	97
35      	284083366181	62
35      	654563447110	145
35      	862174790606	78
35      	486804801433	59
35      	140903716305	83
35      	887528437482	73
35      	636021875565	66
35      	300475101700	91
35      	227635917829	106
35      	398900612810	132
35      	334425348148	147
35      	413227470171	133
35      	509762284879	136
35      	939369924082	101
35      	923237099384	84
35      	814141265887	71
35      	697814031389	52
35      	290827207620	142
35      	265444172694	128
35      	421337093409	79
35      	508818965558	114
35      	194144382996	95
35      	925173129386	81
35      	786975743876	52
35      	902956788286	60
35      	523196696835	70
35      	642234808130	129
35      	525199185853	84
35      	126834215166	95
35      	838962966418	89
35      	749625390019	146
35      	740581174440	133
35      	836900805029	77
35      	750886611187	108
35      	495776106616	62
35      	948543507361	63
35      	117431954043	136
35      	904647940449	64
35      	173672457176	87
35      	174237001203	136
35      	418604295928	133
35      	383476286895	142
35      	180531962334	112
35      	629919786056	63
35      	534109743798	73
35      	994411186239	58
35      	896919583724	104
35      	569219762080	55
35      	435122760857	51
35      	567657950596	79
35      	308440276732	110
35      	554521191996	132
35      	457459442332	99
35      	132954606361	124
35      	252522255166	71
35      	669515708071	109
35      	425456990082	102
35      	673737891943	106
35      	558886167633	57
35      	709229053555	122
35      	375276903331	71
35      	660310920540	109
35      	698718941817	71
35      	962728896848	77
35      	527453991710	141
35      	511511692317	75
35      	108326062706	83
35      	618570550236	72
35      	572878568883	62
35      	139669412174	134
35      	549746556299	51
35      	379942304309	121
35      	547685258313	71
35      	944472664850	120
35      	839518983686	58
35      	557899454410	135
35      	334074319971	143
35      	108649313374	93
35      	945012228482	105
35      	578705048123	147
35      	420756960291	74
35      	603333456348	54
35      	718971287692	82
35      	982079076090	145
35      	771137437634	104
35      	134390993040	104
35      	516495915668	70
35      	314482481265	125
35      	316871031375	126
35      	172950643766	88
35      	722946564026	66
35      	529831629045	105
35      	518329844939	122
35      	473186595371	102
35      	518787417161	107
35      	453357640486	144
35      	322758894316	112
35      	176404904473	129
35      	339589987290	116
35      	996103067914	130
35      	444797600349	95
35      	419446364450	110
35      	168074802141	101
35      	882152991390	128
35      	388403878360	82
35      	317663070530	51
35      	999543417737	72
35      	67014520356 	132
35      	547244118460	114
35      	633320411611	110
35      	716818652888	56
35      	894482053097	67
35      	308792010934	83
35      	849681336901	121
35      	250617599940	109
35      	875605607431	90
35      	208174494479	122
35      	336491915536	81
35      	646511826677	77
36      	986065693858	104
36      	618570550236	85
36      	709229053555	90
36      	453357640486	116
36      	425456990082	129
36      	511511692317	90
36      	861348595761	96
36      	948543507361	57
36      	786975743876	148
36      	982079076090	85
36      	528771298719	70
36      	384468659793	76
36      	750886611187	137
36      	863129185304	63
36      	941976384328	70
36      	563144943925	137
36      	646511826677	83
36      	600770885624	69
36      	377848719039	59
36      	286243122717	129
36      	849681336901	125
36      	945012228482	53
36      	839518983686	137
36      	384179652400	143
36      	630929030795	87
36      	284083366181	108
36      	814141265887	148
36      	740581174440	138
36      	336491915536	148
36      	132954606361	82
36      	413227470171	115
36      	490997846898	66
36      	514254550616	67
36      	697814031389	92
36      	322758894316	97
36      	578705048123	88
36      	132186536765	55
36      	203262278452	59
36      	692492393712	102
36      	108326062706	92
36      	317663070530	54
36      	925484684473	119
36      	754664511022	73
36      	207178796787	92
36      	210526151030	125
36      	339589987290	108
36      	862174790606	74
36      	373709485267	138
36      	875605607431	146
36      	159425007904	147
36      	518329844939	68
36      	381299535788	69
36      	578147508823	145
36      	882152991390	126
36      	722946564026	130
36      	636021875565	113
36      	589814450967	55
36      	334425348148	118
36      	721857506010	136
36      	608852371253	87
36      	189470486214	131
36      	314482481265	58
36      	495776106616	122
36      	741544174664	81
36      	945312847530	75
36      	127026679653	97
36      	444797600349	56
36      	633320411611	134
36      	994411186239	126
36      	435122760857	83
36      	435583017631	63
36      	642234808130	139
36      	364745567029	141
36      	316871031375	72
36      	140903716305	145
36      	486804801433	92
36      	534109743798	124
36      	547685258313	68
36      	252522255166	56
36      	536851950801	135
36      	894482053097	127
36      	718971287692	94
36      	380734371410	67
36      	649921994715	92
36      	383476286895	96
36      	765572003296	130
36      	308792010934	63
36      	400930079611	86
36      	902956788286	122
36      	174237001203	143
36      	294993047536	95
36      	152614854189	83
36      	265444172694	128
36      	409542246104	107
36      	836900805029	119
36      	660310920540	92
36      	749625390019	117
36      	117431954043	120
36      	246144606961	94
36      	986202008726	80
36      	654563447110	142
36      	952550789390	120
36      	523196696835	72
36      	558886167633	149
36      	473186595371	64
36      	833663232208	118
36      	129753980851	143
36      	776538360607	90
36      	482340522139	118
36      	557899454410	125
36      	875125493289	94
36      	933914210509	129
36      	389169531271	145
36      	430946284790	75
36      	67014520356 	140
36      	208174494479	143
36      	168074802141	99
37      	925173129386	132
37      	718971287692	62
37      	882152991390	101
37      	862174790606	52
37      	384468659793	87
37      	994411186239	86
37      	923237099384	140
37      	877194198700	55
37      	113476782830	143
37      	364745567029	98
37      	227635917829	149
37      	770565227675	52
37      	863129185304	72
37      	234646454745	77
37      	127026679653	53
37      	578147508823	78
37      	435583017631	139
37      	839518983686	110
37      	518329844939	136
37      	67014520356 	91
37      	534109743798	57
37      	962728896848	109
37      	528771298719	74
37      	264132323061	105
37      	419481071217	109
37      	413227470171	139
37      	159425007904	112
37      	941976384328	91
37      	803607788754	59
37      	986202008726	112
37      	589814450967	78
37      	996103067914	91
37      	945012228482	104
37      	754664511022	81
37      	525199185853	128
37      	608852371253	139
37      	673737891943	107
37      	572878568883	136
37      	849681336901	98
37      	488529033803	62
37      	414652410482	80
37      	649921994715	114
37      	945312847530	59
37      	420756960291	55
37      	134390993040	104
37      	398900612810	90
37      	286243122717	138
37      	300475101700	92
37      	547244118460	71
37      	483738463713	114
37      	418604295928	90
37      	902956788286	75
37      	629919786056	126
37      	384179652400	129
37      	896919583724	95
37      	529831629045	92
37      	816260222588	81
37      	576518370019	81
37      	205930062465	128
37      	334425348148	60
37      	679453075525	121
37      	444797600349	76
37      	389169531271	50
37      	189470486214	147
37      	558886167633	118
37      	174237001203	142
37      	199753522658	98
37      	776538360607	120
38      	373709485267	147
38      	381299535788	132
38      	167742802915	64
38      	207178796787	63
38      	933914210509	69
38      	336491915536	136
38      	642234808130	114
38      	568658660566	62
38      	923237099384	51
38      	172950643766	77
38      	334425348148	63
38      	547685258313	116
38      	833663232208	76
38      	863129185304	50
38      	721857506010	52
38      	836900805029	71
38      	187272692439	139
38      	108326062706	102
38      	718971287692	121
38      	420756960291	102
38      	490997846898	61
38      	702830548447	99
38      	453357640486	141
38      	994411186239	59
38      	547244118460	67
38      	308792010934	149
38      	516495915668	138
38      	208174494479	104
38      	996103067914	76
38      	649921994715	96
38      	999543417737	65
38      	384179652400	131
38      	425456990082	66
38      	529831629045	121
38      	435583017631	87
38      	495776106616	97
38      	272121204465	87
38      	152614854189	84
38      	629919786056	126
38      	400930079611	123
38      	770565227675	132
38      	697814031389	130
38      	828509049873	141
38      	419446364450	145
38      	576518370019	148
38      	590034051433	90
38      	300475101700	67
38      	868744054130	112
38      	316871031375	72
38      	979700065093	142
38      	556388862616	121
38      	518329844939	118
38      	887528437482	114
38      	334074319971	106
38      	388403878360	96
38      	882152991390	82
38      	578147508823	55
38      	528771298719	102
38      	509762284879	66
38      	986202008726	72
38      	430946284790	142
38      	893005812666	131
38      	339589987290	50
38      	274761600136	78
38      	873640709962	76
38      	916984241291	79
38      	294993047536	62
38      	646511826677	69
38      	608852371253	102
38      	899657914264	96
38      	618570550236	84
38      	871701186034	133
38      	409542246104	79
38      	563144943925	91
38      	998040421944	99
38      	398900612810	123
39      	998040421944	56
39      	534109743798	148
39      	554521191996	150
39      	547244118460	94
39      	786975743876	128
39      	771137437634	73
39      	925484684473	144
39      	246144606961	130
39      	939369924082	93
39      	692492393712	116
39      	146051347589	102
39      	828509049873	50
39      	132954606361	58
39      	511511692317	107
39      	578705048123	63
39      	409542246104	74
39      	349330324726	87
39      	527453991710	104
39      	194144382996	65
39      	925173129386	90
39      	377848719039	71
39      	334074319971	133
39      	334425348148	61
39      	902956788286	110
39      	999543417737	67
39      	996103067914	68
39      	380734371410	73
39      	208174494479	127
39      	923237099384	101
39      	317663070530	81
39      	132186536765	104
39      	557899454410	51
39      	776538360607	79
39      	838962966418	111
39      	836900805029	141
39      	529831629045	79
39      	330700905340	145
39      	286243122717	52
39      	589814450967	140
39      	265444172694	123
39      	696368469198	145
39      	722946564026	106
39      	199968033019	52
39      	875125493289	145
39      	986202008726	91
39      	336491915536	57
39      	558886167633	109
39      	770565227675	87
39      	916984241291	146
39      	769357296879	126
39      	941976384328	131
39      	207178796787	129
39      	467986934495	93
39      	316871031375	81
39      	952550789390	65
39      	467615168772	83
39      	919197823026	127
39      	180531962334	111
39      	871701186034	60
39      	525199185853	72
39      	272121204465	143
39      	508818965558	50
39      	741544174664	81
39      	152614854189	60
39      	523196696835	116
39      	630929030795	52
39      	749625390019	111
39      	495776106616	84
39      	697814031389	112
39      	444797600349	67
39      	411067277447	74
39      	113476782830	66
39      	948543507361	124
39      	381299535788	60
39      	67014520356 	87
39      	642234808130	128
39      	490997846898	64
39      	308792010934	53
39      	300475101700	57
39      	556388862616	132
39      	375276903331	124
39      	509762284879	86
39      	189470486214	82
39      	453357640486	80
40      	199753522658	52
40      	618570550236	145
40      	654563447110	52
40      	869112308003	61
40      	117431954043	57
40      	425456990082	144
40      	534109743798	106
40      	660310920540	120
40      	754664511022	127
40      	643925479319	70
40      	709229053555	105
40      	421337093409	109
40      	140903716305	123
40      	294993047536	69
40      	814141265887	54
40      	419446364450	117
40      	877194198700	86
40      	483738463713	131
40      	861348595761	101
40      	118389501460	82
40      	578147508823	150
40      	377848719039	66
40      	127026679653	86
40      	679453075525	77
40      	126834215166	96
40      	600770885624	68
40      	159425007904	77
40      	444797600349	138
40      	400930079611	56
40      	506298714832	150
40      	132186536765	115
40      	210526151030	52
40      	373709485267	85
40      	590034051433	51
40      	411067277447	134
40      	453357640486	148
40      	400127531270	127
40      	208174494479	126
40      	916984241291	64
40      	589814450967	109
40      	272121204465	70
40      	413227470171	88
40      	252522255166	131
40      	939369924082	99
40      	482340522139	67
40      	227635917829	110
40      	146051347589	108
40      	749193678427	55
40      	979700065093	129
40      	349330324726	62
40      	769357296879	57
40      	986202008726	133
40      	108326062706	109
40      	207178796787	74
40      	945012228482	82
40      	234646454745	59
40      	420756960291	148
40      	556388862616	56
40      	286243122717	98
40      	388403878360	94
40      	569219762080	79
40      	996103067914	137
41      	518787417161	122
41      	430946284790	100
41      	154554749200	85
41      	741544174664	60
41      	994411186239	94
41      	982079076090	91
41      	146051347589	108
41      	776538360607	74
41      	765572003296	135
41      	516495915668	147
41      	771137437634	104
41      	129753980851	68
41      	603333456348	80
41      	902956788286	50
41      	227635917829	61
41      	836900805029	114
41      	113476782830	56
41      	721857506010	112
41      	234646454745	116
41      	272121204465	93
41      	698718941817	80
41      	669515708071	69
41      	547685258313	121
41      	654563447110	142
41      	629919786056	59
41      	696368469198	50
41      	849681336901	109
41      	316871031375	117
41      	861348595761	109
41      	873640709962	62
41      	948543507361	113
41      	816260222588	77
41      	384468659793	123
41      	412348931569	103
41      	868744054130	149
41      	176404904473	84
41      	373709485267	115
41      	547244118460	102
41      	473186595371	105
41      	749625390019	56
41      	339589987290	117
41      	379942304309	119
41      	187272692439	122
41      	998040421944	126
41      	450659382698	112
41      	718971287692	62
41      	264132323061	95
41      	207178796787	70
41      	167742802915	117
41      	933914210509	105
41      	904647940449	104
41      	679453075525	79
41      	549746556299	85
41      	199968033019	148
41      	349330324726	99
41      	523196696835	103
41      	388403878360	115
41      	118389501460	91
41      	208174494479	141
41      	716818652888	110
41      	67014520356 	84
41      	786975743876	61
41      	132186536765	57
41      	518329844939	95
41      	400127531270	89
41      	400930079611	108
41      	636021875565	79
41      	702830548447	149
41      	144568875894	138
41      	803607788754	108
41      	600770885624	148
41      	754664511022	143
41      	525199185853	128
41      	630929030795	58
41      	646511826677	123
41      	286243122717	65
41      	312237459250	111
42      	308440276732	130
42      	862174790606	72
42      	547685258313	134
42      	154554749200	74
42      	467615168772	113
42      	453357640486	150
42      	413227470171	68
42      	132186536765	90
42      	962728896848	66
42      	771137437634	78
42      	589814450967	149
42      	425456990082	81
42      	488529033803	105
42      	272121204465	63
42      	159425007904	70
42      	167742802915	86
42      	786975743876	148
42      	444797600349	120
42      	317663070530	87
42      	511511692317	86
42      	887528437482	55
42      	400930079611	123
42      	210526151030	145
42      	873640709962	131
42      	986065693858	123
42      	264132323061	51
42      	250617599940	120
42      	732970729968	55
42      	722946564026	126
42      	412348931569	71
42      	207178796787	77
42      	945012228482	136
42      	134390993040	89
42      	227635917829	64
42      	608852371253	139
42      	379942304309	97
42      	633320411611	87
42      	649921994715	60
42      	113476782830	120
42      	139669412174	71
42      	569219762080	123
42      	839518983686	119
42      	375276903331	89
42      	861348595761	147
42      	322758894316	131
42      	945312847530	96
42      	187272692439	88
42      	252522255166	107
42      	418604295928	112
42      	642234808130	86
42      	568658660566	139
42      	528771298719	143
42      	189470486214	138
42      	435583017631	97
42      	566877828296	58
42      	419481071217	56
42      	740581174440	83
42      	518329844939	66
42      	660310920540	73
42      	180531962334	104
42      	516495915668	50
42      	836900805029	87
42      	146051347589	135
42      	749193678427	73
42      	554521191996	111
42      	536851950801	90
42      	702830548447	100
42      	919197823026	108
42      	389169531271	51
42      	108649313374	59
42      	805966823208	147
42      	698718941817	149
42      	994411186239	134
42      	409542246104	100
42      	168074802141	127
42      	373709485267	147
42      	420756960291	52
42      	643925479319	59
42      	176404904473	121
42      	630929030795	98
42      	549746556299	62
42      	749625390019	83
42      	411067277447	131
42      	636021875565	84
42      	925484684473	58
42      	871701186034	145
42      	208174494479	97
42      	877194198700	73
42      	669515708071	117
42      	132954606361	137
42      	384468659793	89
42      	590034051433	128
42      	518787417161	114
42      	986202008726	116
42      	998040421944	64
42      	875605607431	146
42      	770565227675	56
42      	603333456348	101
42      	152614854189	62
42      	578147508823	58
42      	336491915536	131
42      	334425348148	65
42      	654563447110	122
42      	925173129386	117
42      	567657950596	60
42      	508818965558	149
42      	547244118460	122
42      	979700065093	110
42      	692492393712	50
42      	172950643766	56
42      	398900612810	67
42      	140903716305	56
42      	450659382698	79
42      	312237459250	150
42      	882152991390	72
42      	600770885624	105
42      	108326062706	92
42      	506298714832	135
42      	534109743798	138
42      	750886611187	145
42      	383476286895	123
42      	999543417737	148
42      	509762284879	99
42      	529831629045	134
42      	716818652888	54
42      	721857506010	68
42      	174237001203	120
42      	944472664850	126
43      	199753522658	50
43      	716818652888	52
43      	618570550236	127
43      	67014520356 	95
43      	380734371410	79
43      	945012228482	108
43      	199968033019	62
43      	894482053097	134
43      	330700905340	62
43      	629919786056	99
43      	418604295928	140
43      	603333456348	78
43      	702421087613	83
43      	696368469198	79
43      	349435998924	53
43      	375276903331	81
43      	749625390019	83
43      	173672457176	72
43      	902956788286	137
43      	174237001203	138
43      	754664511022	82
43      	558886167633	149
43      	660310920540	63
43      	400127531270	52
43      	207178796787	50
43      	721857506010	118
43      	994411186239	137
43      	979700065093	105
43      	600770885624	73
43      	425456990082	112
43      	322758894316	98
43      	508818965558	54
43      	536851950801	75
43      	636021875565	76
43      	673737891943	141
43      	740581174440	80
43      	373709485267	51
43      	709229053555	57
43      	482429892907	150
43      	893005812666	106
43      	862174790606	138
43      	450659382698	129
43      	816260222588	124
43      	486804801433	118
43      	786975743876	128
43      	284083366181	135
43      	435122760857	55
43      	589814450967	61
43      	986202008726	111
43      	312237459250	82
43      	838962966418	146
43      	495776106616	79
43      	467986934495	104
43      	168074802141	132
43      	916984241291	64
43      	419446364450	73
43      	525199185853	103
43      	649921994715	60
43      	457459442332	106
43      	939369924082	138
43      	896919583724	121
43      	828509049873	129
43      	567657950596	122
43      	308440276732	99
43      	421337093409	135
43      	534109743798	118
43      	297083512852	50
43      	718971287692	122
43      	413227470171	55
43      	669515708071	100
43      	945312847530	77
44      	412348931569	81
44      	547244118460	130
44      	139669412174	134
44      	108649313374	83
44      	786975743876	105
44      	999543417737	103
44      	828509049873	118
44      	882152991390	95
44      	380734371410	99
44      	894482053097	115
44      	334425348148	129
44      	646511826677	85
44      	578147508823	63
44      	941976384328	52
44      	152614854189	140
44      	418604295928	54
44      	444797600349	93
44      	814141265887	50
44      	388403878360	146
44      	411067277447	79
44      	127026679653	115
44      	893005812666	141
44      	722946564026	100
44      	199968033019	127
44      	419481071217	141
44      	630929030795	74
44      	534109743798	61
44      	945012228482	78
44      	556388862616	124
44      	944472664850	135
44      	902956788286	127
44      	308440276732	146
44      	925173129386	57
44      	536851950801	67
44      	692492393712	72
44      	375276903331	80
44      	336491915536	128
44      	649921994715	115
44      	113476782830	116
44      	576518370019	59
44      	400930079611	95
44      	482429892907	122
44      	839518983686	69
44      	948543507361	142
44      	203262278452	105
44      	923237099384	87
44      	803607788754	95
44      	518787417161	123
44      	176404904473	91
44      	284083366181	100
44      	132186536765	145
44      	430946284790	144
44      	194144382996	80
44      	554521191996	104
44      	904647940449	119
44      	400127531270	55
44      	108326062706	146
44      	516286957430	88
44      	330700905340	50
44      	364745567029	93
44      	679453075525	90
44      	916984241291	69
44      	174237001203	133
44      	117431954043	82
44      	749193678427	119
44      	642234808130	108
44      	234646454745	96
44      	871701186034	103
44      	549746556299	90
44      	140903716305	99
44      	450659382698	95
44      	265444172694	144
44      	383476286895	84
44      	525199185853	69
44      	146051347589	86
44      	618570550236	78
44      	126834215166	96
44      	227635917829	77
44      	208174494479	96
44      	297083512852	90
44      	741544174664	85
44      	859109096191	94
44      	765572003296	70
44      	252522255166	119
44      	718971287692	64
44      	600770885624	115
44      	316871031375	59
44      	816260222588	130
44      	557899454410	97
44      	482340522139	111
44      	986065693858	77
44      	172950643766	66
44      	173672457176	82
44      	189470486214	139
44      	654563447110	146
44      	589814450967	109
44      	771137437634	108
44      	563144943925	69
44      	633320411611	62
44      	457459442332	102
44      	979700065093	66
44      	962728896848	116
44      	669515708071	62
44      	673737891943	99
44      	721857506010	79
44      	568658660566	126
44      	180531962334	69
44      	518329844939	144
44      	339589987290	142
44      	398900612810	100
45      	516286957430	76
45      	629919786056	127
45      	234646454745	122
45      	312237459250	75
45      	916984241291	117
45      	549746556299	107
45      	334425348148	64
45      	770565227675	89
45      	836900805029	136
45      	126834215166	121
45      	486804801433	56
45      	509762284879	83
45      	945312847530	110
45      	444797600349	113
45      	994411186239	86
45      	411067277447	143
45      	862174790606	128
45      	336491915536	119
45      	749193678427	109
45      	877194198700	50
45      	518787417161	82
45      	482340522139	142
45      	373709485267	94
45      	925484684473	92
45      	473186595371	60
45      	590034051433	135
45      	923237099384	74
45      	127026679653	74
45      	608852371253	101
45      	569219762080	66
45      	132186536765	53
45      	103362565865	105
45      	578705048123	78
45      	159425007904	55
45      	633320411611	104
45      	286243122717	74
45      	838962966418	98
45      	490997846898	93
45      	899657914264	50
45      	849681336901	93
45      	113476782830	90
45      	108326062706	145
45      	962728896848	75
45      	400127531270	80
45      	547685258313	72
45      	383476286895	112
45      	669515708071	117
45      	134390993040	67
45      	154554749200	77
45      	210526151030	112
45      	902956788286	91
45      	194144382996	91
45      	696368469198	84
45      	875125493289	145
45      	246144606961	144
45      	207178796787	88
45      	706236730898	54
45      	167742802915	128
45      	786975743876	65
45      	152614854189	50
45      	722946564026	145
45      	765572003296	95
45      	381299535788	90
45      	118389501460	80
45      	483738463713	86
45      	398900612810	147
45      	176404904473	149
45      	567657950596	80
45      	199968033019	114
45      	740581174440	126
45      	893005812666	143
45      	873640709962	94
45      	419446364450	89
45      	334074319971	150
45      	419481071217	66
45      	400930079611	63
45      	261188186216	92
45      	673737891943	138
45      	649921994715	93
45      	741544174664	99
45      	117431954043	93
45      	709229053555	106
45      	692492393712	88
45      	702421087613	145
45      	775611741635	76
45      	189470486214	85
45      	871701186034	97
45      	600770885624	84
45      	698718941817	118
45      	414652410482	61
45      	603333456348	145
45      	300475101700	147
45      	643925479319	118
45      	290827207620	72
45      	108649313374	143
45      	435583017631	112
45      	941976384328	84
46      	509762284879	121
46      	527453991710	122
46      	741544174664	61
46      	199753522658	125
46      	373709485267	88
46      	549746556299	141
46      	916984241291	75
46      	863129185304	130
46      	716818652888	108
46      	718971287692	131
46      	389169531271	136
46      	467986934495	94
46      	636021875565	62
46      	649921994715	143
46      	608852371253	98
46      	554521191996	105
46      	563144943925	84
46      	516495915668	130
46      	453357640486	108
46      	103362565865	114
46      	173672457176	149
46      	775611741635	104
46      	899657914264	78
46      	317663070530	86
46      	349435998924	103
46      	770565227675	96
46      	189470486214	130
46      	998040421944	55
46      	418604295928	100
46      	771137437634	106
46      	567657950596	145
46      	140903716305	53
46      	838962966418	143
46      	568658660566	121
46      	234646454745	63
46      	482429892907	70
46      	176404904473	125
46      	381299535788	76
46      	227635917829	103
46      	132186536765	138
46      	534109743798	91
46      	180531962334	144
46      	547244118460	63
46      	444797600349	70
46      	375276903331	111
46      	618570550236	139
46      	569219762080	113
46      	962728896848	79
46      	629919786056	76
46      	379942304309	149
46      	578147508823	143
46      	144568875894	131
46      	364745567029	140
46      	630929030795	136
46      	547685258313	87
46      	205930062465	110
46      	300475101700	103
46      	754664511022	89
46      	803607788754	89
46      	904647940449	61
46      	696368469198	121
46      	316871031375	143
46      	490997846898	140
46      	518787417161	147
46      	152614854189	57
46      	159425007904	121
46      	272121204465	79
46      	786975743876	102
46      	994411186239	72
46      	896919583724	89
47      	833663232208	69
47      	527453991710	133
47      	771137437634	86
47      	557899454410	76
47      	859109096191	124
47      	203262278452	146
47      	509762284879	94
47      	525199185853	77
47      	948543507361	124
47      	132186536765	149
47      	982079076090	60
47      	618570550236	106
47      	563144943925	140
47      	409542246104	82
47      	349435998924	102
47      	317663070530	130
47      	118389501460	86
47      	495776106616	66
47      	210526151030	89
47      	999543417737	86
47      	875125493289	113
47      	600770885624	51
47      	187272692439	145
47      	425456990082	57
47      	199968033019	146
47      	199753522658	149
47      	750886611187	78
47      	482340522139	58
47      	861348595761	115
47      	377848719039	140
47      	400127531270	147
47      	384468659793	73
47      	979700065093	80
47      	330700905340	88
47      	869112308003	114
47      	144568875894	57
47      	308792010934	70
47      	108326062706	68
47      	849681336901	61
47      	549746556299	148
47      	933914210509	93
47      	364745567029	86
47      	379942304309	82
47      	732970729968	51
47      	916984241291	98
47      	511511692317	114
47      	805966823208	87
47      	925484684473	130
47      	696368469198	140
47      	159425007904	91
47      	642234808130	82
47      	554521191996	54
47      	572878568883	132
47      	117431954043	70
47      	838962966418	53
47      	994411186239	119
47      	939369924082	78
47      	836900805029	123
47      	108649313374	138
47      	590034051433	67
47      	322758894316	53
47      	894482053097	134
47      	896919583724	132
47      	314482481265	122
47      	863129185304	141
47      	473186595371	109
47      	569219762080	68
47      	868744054130	53
47      	871701186034	121
47      	168074802141	81
47      	146051347589	61
47      	126834215166	130
47      	749193678427	111
47      	252522255166	135
47      	996103067914	52
47      	412348931569	58
47      	261188186216	132
47      	174237001203	142
47      	749625390019	82
47      	300475101700	134
47      	274761600136	50
47      	173672457176	123
47      	534109743798	100
47      	194144382996	114
48      	630929030795	120
48      	159425007904	84
48      	312237459250	105
48      	176404904473	142
48      	618570550236	97
48      	633320411611	111
48      	308440276732	128
48      	154554749200	84
48      	873640709962	126
48      	979700065093	96
48      	509762284879	65
48      	868744054130	102
48      	566877828296	55
48      	862174790606	142
48      	828509049873	149
48      	297083512852	119
48      	527453991710	111
48      	373709485267	99
48      	534109743798	134
48      	556388862616	95
48      	205930062465	104
48      	420756960291	84
48      	314482481265	118
48      	721857506010	70
48      	654563447110	75
48      	514254550616	145
48      	388403878360	94
48      	189470486214	116
48      	518787417161	118
48      	986202008726	131
48      	430946284790	51
48      	945312847530	90
48      	939369924082	133
48      	483738463713	108
48      	572878568883	58
48      	875605607431	61
48      	636021875565	63
48      	490997846898	123
48      	144568875894	113
48      	208174494479	52
48      	261188186216	132
48      	453357640486	130
48      	203262278452	148
48      	996103067914	137
48      	364745567029	116
48      	578147508823	66
48      	518329844939	130
48      	384468659793	67
48      	716818652888	98
48      	706236730898	136
48      	506298714832	123
48      	998040421944	112
48      	375276903331	144
48      	67014520356 	64
48      	838962966418	53
48      	547685258313	70
48      	252522255166	104
48      	749625390019	139
48      	875125493289	107
48      	172950643766	136
48      	294993047536	132
48      	702830548447	136
48      	608852371253	131
48      	380734371410	54
48      	290827207620	62
48      	210526151030	117
48      	146051347589	118
48      	139669412174	99
48      	769357296879	71
48      	457459442332	78
48      	669515708071	133
48      	740581174440	148
49      	334425348148	67
49      	998040421944	105
49      	103362565865	67
49      	775611741635	99
49      	117431954043	69
49      	330700905340	71
49      	923237099384	146
49      	568658660566	102
49      	297083512852	139
49      	805966823208	60
49      	882152991390	106
49      	377848719039	102
49      	862174790606	101
49      	869112308003	133
49      	152614854189	110
49      	420756960291	141
49      	187272692439	79
49      	569219762080	130
49      	939369924082	129
49      	702421087613	131
49      	450659382698	109
49      	722946564026	78
49      	776538360607	114
49      	589814450967	114
49      	189470486214	93
49      	108326062706	111
49      	887528437482	100
49      	139669412174	135
49      	572878568883	52
49      	636021875565	140
49      	246144606961	146
49      	207178796787	150
49      	375276903331	145
49      	383476286895	149
49      	916984241291	59
49      	339589987290	145
49      	384468659793	72
49      	482429892907	121
49      	770565227675	107
49      	741544174664	78
49      	349330324726	116
49      	381299535788	77
49      	528771298719	133
49      	413227470171	107
49      	126834215166	146
49      	769357296879	118
49      	894482053097	125
49      	508818965558	115
49      	208174494479	125
49      	547244118460	58
49      	409542246104	98
49      	411067277447	91
49      	549746556299	75
49      	875605607431	111
49      	336491915536	82
49      	557899454410	145
49      	527453991710	82
49      	919197823026	86
49      	421337093409	96
49      	435583017631	113
49      	861348595761	116
49      	771137437634	133
49      	252522255166	100
49      	419446364450	101
49      	925484684473	127
49      	944472664850	131
49      	227635917829	53
49      	904647940449	131
49      	199753522658	141
49      	875125493289	64
49      	633320411611	129
49      	536851950801	52
49      	418604295928	55
49      	435122760857	65
49      	154554749200	50
49      	679453075525	110
49      	873640709962	112
49      	618570550236	77
49      	692492393712	117
49      	373709485267	78
49      	702830548447	112
49      	294993047536	91
49      	828509049873	139
49      	554521191996	127
49      	290827207620	148
49      	836900805029	73
49      	180531962334	106
49      	556388862616	102
49      	749625390019	103
49      	172950643766	105
49      	495776106616	103
49      	814141265887	74
49      	902956788286	142
49      	600770885624	112
49      	603333456348	109
49      	563144943925	143
49      	308440276732	138
49      	511511692317	108
49      	642234808130	59
49      	132954606361	79
49      	871701186034	70
49      	398900612810	68
49      	567657950596	67
49      	414652410482	145
49      	948543507361	54
49      	322758894316	116
49      	578705048123	132
49      	994411186239	104
49      	210526151030	54
49      	868744054130	91
49      	488529033803	138
49      	312237459250	96
49      	349435998924	131
49      	523196696835	127
49      	516495915668	98
49      	425456990082	99
49      	146051347589	79
50      	506298714832	136
50      	113476782830	147
50      	308792010934	65
50      	558886167633	98
50      	373709485267	113
50      	633320411611	120
50      	210526151030	124
50      	129753980851	76
50      	716818652888	62
50      	108649313374	73
50      	509762284879	79
50      	786975743876	74
50      	419446364450	63
50      	814141265887	69
50      	286243122717	54
50      	246144606961	72
50      	547685258313	83
50      	816260222588	65
50      	488529033803	78
50      	297083512852	141
50      	252522255166	149
50      	859109096191	140
50      	194144382996	128
50      	205930062465	128
50      	261188186216	114
50      	673737891943	78
50      	629919786056	90
50      	388403878360	102
50      	962728896848	124
50      	444797600349	100
50      	134390993040	109
50      	176404904473	103
50      	721857506010	75
50      	418604295928	115
50      	330700905340	84
50      	887528437482	82
50      	862174790606	111
50      	389169531271	122
50      	868744054130	126
50      	706236730898	115
50      	172950643766	104
50      	412348931569	113
50      	207178796787	64
50      	600770885624	113
50      	994411186239	78
50      	203262278452	103
50      	875125493289	85
50      	409542246104	149
50      	863129185304	73
50      	702830548447	67
50      	669515708071	128
50      	948543507361	148
50      	317663070530	51
50      	419481071217	53
50      	945312847530	106
50      	536851950801	93
50      	180531962334	60
50      	264132323061	129
50      	67014520356 	149
50      	649921994715	106
50      	740581174440	104
50      	411067277447	86
50      	871701186034	112
50      	167742802915	72
50      	630929030795	91
50      	578705048123	125
50      	549746556299	141
50      	381299535788	106
50      	882152991390	147
50      	140903716305	72
50      	803607788754	103
50      	998040421944	145
50      	126834215166	93
50      	603333456348	55
50      	383476286895	111
50      	400127531270	132
50      	334425348148	145
50      	692492393712	142
50      	435583017631	133
51      	412348931569	89
51      	400127531270	122
51      	132954606361	150
51      	174237001203	71
51      	525199185853	119
51      	839518983686	143
51      	482429892907	112
51      	722946564026	125
51      	518787417161	103
51      	380734371410	143
51      	849681336901	141
51      	608852371253	106
51      	154554749200	68
51      	518329844939	116
51      	379942304309	64
51      	297083512852	86
51      	103362565865	100
51      	871701186034	142
51      	962728896848	71
51      	199968033019	50
51      	168074802141	132
51      	945012228482	116
51      	948543507361	143
51      	334074319971	75
51      	944472664850	85
51      	167742802915	116
51      	679453075525	112
51      	776538360607	75
51      	108326062706	145
51      	187272692439	87
51      	418604295928	128
51      	877194198700	115
51      	979700065093	72
51      	467615168772	83
51      	377848719039	121
51      	349435998924	55
51      	569219762080	149
51      	933914210509	90
51      	646511826677	113
51      	108649313374	128
51      	113476782830	85
51      	398900612810	73
51      	384179652400	88
51      	194144382996	90
51      	534109743798	88
51      	941976384328	137
51      	547685258313	81
51      	863129185304	53
51      	836900805029	116
51      	740581174440	109
51      	833663232208	87
51      	566877828296	101
51      	414652410482	84
51      	144568875894	102
51      	308440276732	76
51      	600770885624	147
51      	430946284790	129
51      	208174494479	57
51      	716818652888	130
51      	996103067914	114
51      	490997846898	122
51      	998040421944	105
51      	786975743876	68
51      	514254550616	136
51      	572878568883	136
51      	457459442332	123
51      	419446364450	112
51      	381299535788	54
51      	952550789390	75
51      	893005812666	54
51      	698718941817	129
51      	420756960291	93
51      	173672457176	142
51      	314482481265	65
51      	578147508823	114
51      	982079076090	76
51      	118389501460	110
51      	450659382698	127
51      	330700905340	116
51      	203262278452	108
51      	754664511022	57
51      	828509049873	104
51      	673737891943	114
51      	925484684473	90
51      	925173129386	91
51      	916984241291	132
51      	803607788754	149
51      	400930079611	99
51      	389169531271	111
51      	643925479319	73
51      	286243122717	72
51      	317663070530	101
51      	508818965558	132
51      	473186595371	119
51      	549746556299	141
52      	741544174664	89
52      	246144606961	67
52      	506298714832	117
52      	398900612810	58
52      	144568875894	127
52      	673737891943	78
52      	180531962334	87
52      	749625390019	147
52      	669515708071	64
52      	603333456348	123
52      	944472664850	105
52      	375276903331	79
52      	861348595761	78
52      	732970729968	100
52      	205930062465	80
52      	722946564026	105
52      	312237459250	79
52      	721857506010	134
52      	769357296879	101
52      	986202008726	132
52      	696368469198	72
52      	873640709962	124
52      	567657950596	69
52      	383476286895	62
52      	572878568883	113
52      	172950643766	108
52      	660310920540	94
52      	250617599940	126
52      	636021875565	50
52      	771137437634	81
52      	994411186239	114
52      	986065693858	145
52      	568658660566	144
52      	557899454410	83
52      	516286957430	115
52      	549746556299	55
52      	308792010934	126
52      	108649313374	94
52      	495776106616	106
52      	534109743798	104
52      	933914210509	51
52      	523196696835	135
52      	600770885624	96
52      	941976384328	119
52      	419446364450	119
52      	608852371253	55
52      	168074802141	60
52      	833663232208	67
52      	152614854189	99
52      	875125493289	89
52      	893005812666	60
52      	706236730898	88
52      	316871031375	57
52      	528771298719	64
52      	525199185853	111
52      	786975743876	134
52      	862174790606	100
52      	877194198700	104
52      	203262278452	115
52      	388403878360	87
52      	159425007904	109
52      	642234808130	58
52      	118389501460	55
52      	962728896848	90
52      	187272692439	62
52      	364745567029	82
52      	227635917829	92
52      	457459442332	143
52      	411067277447	135
52      	765572003296	79
52      	816260222588	132
52      	435122760857	76
52      	132186536765	81
52      	199753522658	116
52      	838962966418	105
52      	349330324726	135
52      	252522255166	145
52      	828509049873	78
52      	127026679653	97
52      	996103067914	128
52      	322758894316	51
52      	979700065093	118
53      	679453075525	104
53      	998040421944	127
53      	227635917829	123
53      	899657914264	67
53      	144568875894	56
53      	127026679653	71
53      	721857506010	78
53      	933914210509	95
53      	495776106616	109
53      	769357296879	52
53      	322758894316	54
53      	349330324726	79
53      	483738463713	147
53      	814141265887	135
53      	654563447110	71
53      	962728896848	143
53      	139669412174	68
53      	608852371253	114
53      	140903716305	96
53      	528771298719	87
53      	986202008726	90
53      	945012228482	96
53      	210526151030	71
53      	862174790606	139
53      	339589987290	121
53      	567657950596	64
53      	923237099384	134
53      	702830548447	58
53      	999543417737	148
53      	861348595761	63
53      	776538360607	68
53      	467986934495	97
53      	482429892907	118
53      	508818965558	88
53      	435122760857	61
53      	400127531270	143
53      	103362565865	108
53      	952550789390	70
53      	435583017631	69
53      	421337093409	142
53      	308792010934	100
53      	982079076090	85
53      	473186595371	129
53      	563144943925	50
53      	568658660566	72
53      	893005812666	130
53      	749193678427	86
53      	525199185853	137
53      	775611741635	117
53      	314482481265	83
53      	749625390019	111
53      	770565227675	57
53      	896919583724	56
53      	317663070530	143
53      	132186536765	124
53      	925484684473	86
53      	375276903331	59
53      	549746556299	119
53      	836900805029	83
53      	300475101700	91
53      	250617599940	102
53      	556388862616	54
53      	740581174440	141
53      	673737891943	146
53      	859109096191	94
53      	572878568883	84
53      	600770885624	126
53      	511511692317	97
53      	996103067914	148
53      	364745567029	131
53      	308440276732	121
54      	861348595761	91
54      	702421087613	103
54      	265444172694	147
54      	486804801433	123
54      	933914210509	112
54      	569219762080	96
54      	473186595371	133
54      	490997846898	141
54      	692492393712	136
54      	308792010934	115
54      	203262278452	62
54      	132954606361	125
54      	706236730898	75
54      	536851950801	82
54      	525199185853	142
54      	750886611187	116
54      	925484684473	55
54      	364745567029	61
54      	187272692439	135
54      	979700065093	77
54      	349330324726	90
54      	654563447110	125
54      	518787417161	112
54      	702830548447	136
54      	272121204465	106
54      	516286957430	114
54      	887528437482	50
54      	457459442332	101
54      	144568875894	74
54      	435583017631	119
54      	557899454410	133
54      	563144943925	129
54      	996103067914	84
54      	814141265887	136
54      	871701186034	130
54      	414652410482	109
54      	770565227675	125
54      	129753980851	56
54      	925173129386	90
54      	514254550616	125
54      	173672457176	87
54      	384179652400	98
54      	849681336901	90
54      	409542246104	62
54      	578705048123	126
54      	506298714832	77
54      	698718941817	78
54      	189470486214	144
54      	740581174440	114
54      	113476782830	61
54      	398900612810	149
54      	467615168772	116
54      	643925479319	94
54      	771137437634	82
54      	330700905340	104
54      	207178796787	128
54      	377848719039	66
54      	567657950596	110
54      	261188186216	66
54      	566877828296	147
54      	508818965558	144
54      	419481071217	61
54      	286243122717	147
54      	554521191996	138
54      	568658660566	142
54      	308440276732	92
54      	732970729968	123
54      	168074802141	76
54      	176404904473	68
54      	749193678427	108
54      	630929030795	84
54      	589814450967	147
54      	836900805029	149
54      	199753522658	127
54      	603333456348	146
54      	721857506010	55
54      	108649313374	117
54      	986065693858	124
54      	741544174664	147
54      	534109743798	130
54      	132186536765	146
54      	400127531270	89
54      	339589987290	149
54      	945012228482	58
54      	869112308003	98
54      	578147508823	84
54      	388403878360	146
54      	786975743876	76
54      	696368469198	115
54      	862174790606	127
54      	679453075525	118
54      	629919786056	70
54      	511511692317	134
54      	450659382698	93
54      	816260222588	71
54      	421337093409	137
54      	572878568883	130
54      	252522255166	140
54      	152614854189	80
54      	576518370019	69
54      	297083512852	112
54      	608852371253	143
54      	495776106616	132
54      	722946564026	143
54      	894482053097	51
54      	167742802915	88
54      	126834215166	127
54      	673737891943	144
54      	246144606961	71
54      	590034051433	134
54      	828509049873	111
54      	381299535788	72
54      	205930062465	56
54      	108326062706	63
54      	518329844939	96
54      	375276903331	71
54      	549746556299	104
54      	669515708071	108
54      	697814031389	129
54      	941976384328	97
54      	334425348148	116
54      	660310920540	71
54      	380734371410	132
54      	290827207620	60
54      	349435998924	57
54      	839518983686	103
54      	558886167633	146
54      	642234808130	80
54      	945312847530	142
55      	669515708071	63
55      	286243122717	92
55      	944472664850	72
55      	490997846898	111
55      	482429892907	105
55      	803607788754	83
55      	435122760857	120
55      	868744054130	95
55      	646511826677	107
55      	349330324726	65
55      	786975743876	149
55      	636021875565	106
55      	871701186034	59
55      	482340522139	133
55      	457459442332	114
55      	567657950596	131
55      	916984241291	136
55      	578147508823	74
55      	547244118460	104
55      	836900805029	118
55      	176404904473	84
55      	536851950801	129
55      	998040421944	51
55      	894482053097	96
55      	264132323061	122
55      	430946284790	148
55      	300475101700	95
55      	697814031389	84
55      	589814450967	96
55      	336491915536	119
55      	199968033019	82
55      	168074802141	58
55      	919197823026	147
55      	483738463713	69
55      	134390993040	83
55      	994411186239	70
55      	982079076090	137
55      	294993047536	96
55      	765572003296	104
55      	414652410482	76
55      	159425007904	125
55      	205930062465	125
55      	308792010934	60
55      	108649313374	114
55      	167742802915	128
55      	549746556299	85
55      	679453075525	70
55      	999543417737	94
55      	425456990082	54
55      	814141265887	92
55      	174237001203	61
55      	508818965558	93
55      	839518983686	63
55      	388403878360	92
55      	979700065093	52
55      	904647940449	91
55      	528771298719	88
55      	838962966418	113
55      	152614854189	63
55      	398900612810	134
55      	265444172694	87
55      	207178796787	97
55      	246144606961	133
55      	805966823208	119
55      	590034051433	66
55      	939369924082	74
55      	412348931569	84
55      	534109743798	68
55      	377848719039	133
55      	775611741635	67
55      	272121204465	112
55      	208174494479	62
55      	514254550616	133
55      	189470486214	139
55      	568658660566	90
55      	486804801433	52
55      	941976384328	132
55      	411067277447	87
55      	400930079611	113
55      	180531962334	139
55      	400127531270	96
55      	732970729968	71
55      	108326062706	53
55      	373709485267	142
55      	409542246104	54
55      	308440276732	103
55      	330700905340	118
55      	154554749200	130
55      	418604295928	69
55      	833663232208	109
55      	516286957430	117
55      	769357296879	61
55      	706236730898	95
55      	113476782830	127
55      	633320411611	74
55      	379942304309	101
55      	849681336901	96
55      	828509049873	74
55      	660310920540	118
55      	384179652400	83
55      	132186536765	89
55      	948543507361	109
55      	893005812666	129
55      	132954606361	88
55      	383476286895	62
55      	467615168772	98
55      	172950643766	141
55      	933914210509	87
55      	877194198700	60
55      	511511692317	141
55      	199753522658	149
55      	709229053555	68
55      	127026679653	85
55      	642234808130	67
55      	529831629045	106
55      	556388862616	131
55      	741544174664	78
56      	516495915668	141
56      	457459442332	76
56      	398900612810	90
56      	716818652888	109
56      	859109096191	71
56      	986065693858	98
56      	139669412174	108
56      	284083366181	103
56      	509762284879	86
56      	317663070530	92
56      	168074802141	88
56      	578705048123	123
56      	646511826677	116
56      	144568875894	110
56      	805966823208	130
56      	568658660566	109
56      	146051347589	103
56      	952550789390	103
56      	473186595371	142
56      	590034051433	132
56      	836900805029	71
56      	421337093409	135
56      	941976384328	74
56      	939369924082	65
56      	572878568883	127
56      	518329844939	149
56      	803607788754	89
56      	108649313374	141
56      	482340522139	72
56      	205930062465	56
56      	882152991390	136
56      	916984241291	135
56      	566877828296	63
56      	167742802915	58
56      	814141265887	76
56      	894482053097	67
56      	349330324726	74
56      	467986934495	62
56      	300475101700	55
56      	529831629045	128
56      	172950643766	115
56      	750886611187	139
56      	702830548447	111
56      	388403878360	133
56      	896919583724	76
56      	786975743876	94
56      	642234808130	93
56      	435122760857	118
56      	286243122717	123
56      	176404904473	87
56      	863129185304	95
56      	227635917829	97
56      	996103067914	53
56      	732970729968	133
56      	384468659793	116
56      	948543507361	81
56      	246144606961	50
56      	899657914264	148
56      	126834215166	50
56      	108326062706	51
56      	264132323061	110
56      	828509049873	103
56      	749193678427	107
56      	174237001203	66
56      	979700065093	86
56      	379942304309	109
56      	250617599940	116
56      	430946284790	147
56      	982079076090	128
56      	692492393712	118
56      	709229053555	90
56      	660310920540	65
56      	334425348148	125
56      	330700905340	127
56      	380734371410	128
56      	633320411611	82
56      	986202008726	135
56      	578147508823	67
56      	600770885624	60
56      	904647940449	133
56      	523196696835	123
56      	199968033019	78
56      	556388862616	111
56      	132954606361	106
56      	482429892907	92
56      	702421087613	93
56      	506298714832	81
56      	998040421944	34
56      	944472664850	84
56      	400127531270	109
56      	411067277447	130
56      	274761600136	60
56      	412348931569	140
56      	769357296879	54
56      	154554749200	98
56      	741544174664	129
57      	134390993040	82
57      	828509049873	148
57      	400930079611	146
57      	692492393712	84
57      	769357296879	114
57      	430946284790	58
57      	660310920540	81
57      	875125493289	111
57      	833663232208	66
57      	939369924082	106
57      	549746556299	133
57      	174237001203	69
57      	863129185304	63
57      	339589987290	70
57      	132186536765	96
57      	126834215166	84
57      	172950643766	101
57      	413227470171	130
57      	525199185853	60
57      	718971287692	123
57      	999543417737	134
57      	294993047536	115
57      	336491915536	85
57      	227635917829	130
57      	349435998924	96
57      	528771298719	109
57      	207178796787	81
57      	998040421944	73
57      	435122760857	74
57      	654563447110	87
57      	384468659793	125
57      	749625390019	84
57      	771137437634	76
57      	274761600136	112
57      	377848719039	60
57      	261188186216	137
57      	334074319971	85
57      	414652410482	134
57      	873640709962	107
57      	741544174664	69
57      	775611741635	71
57      	488529033803	104
57      	373709485267	133
57      	765572003296	150
57      	308792010934	90
57      	786975743876	69
57      	203262278452	87
57      	508818965558	105
57      	379942304309	70
57      	199753522658	55
57      	696368469198	80
57      	893005812666	70
57      	732970729968	132
57      	979700065093	148
57      	234646454745	94
57      	814141265887	148
57      	750886611187	64
57      	167742802915	125
57      	511511692317	61
57      	146051347589	70
57      	902956788286	62
57      	554521191996	62
57      	590034051433	94
57      	945012228482	130
57      	589814450967	143
57      	108326062706	61
57      	887528437482	137
57      	576518370019	140
57      	904647940449	68
57      	516286957430	138
57      	697814031389	56
57      	425456990082	128
57      	529831629045	136
57      	518787417161	110
57      	252522255166	138
57      	152614854189	77
57      	894482053097	84
57      	919197823026	65
57      	409542246104	50
57      	308440276732	119
57      	159425007904	96
57      	603333456348	137
57      	618570550236	98
57      	132954606361	60
57      	117431954043	149
57      	882152991390	105
57      	945312847530	135
57      	381299535788	81
57      	578705048123	63
57      	418604295928	57
57      	702421087613	140
57      	173672457176	68
57      	556388862616	139
57      	297083512852	115
57      	210526151030	101
57      	118389501460	125
57      	770565227675	89
57      	144568875894	73
57      	563144943925	99
57      	506298714832	60
57      	838962966418	106
57      	941976384328	107
57      	205930062465	82
57      	67014520356 	123
57      	265444172694	108
57      	923237099384	135
57      	246144606961	54
57      	776538360607	117
57      	754664511022	90
57      	608852371253	150
57      	420756960291	73
57      	868744054130	58
57      	566877828296	116
57      	467986934495	117
57      	982079076090	142
57      	176404904473	66
57      	284083366181	119
57      	523196696835	104
57      	516495915668	70
57      	816260222588	79
57      	444797600349	112
57      	129753980851	94
57      	839518983686	147
57      	419446364450	77
57      	314482481265	60
57      	636021875565	135
57      	679453075525	90
57      	805966823208	51
57      	986202008726	78
57      	300475101700	57
57      	569219762080	59
57      	557899454410	143
57      	384179652400	56
57      	473186595371	148
57      	316871031375	134
57      	140903716305	92
57      	673737891943	99
57      	649921994715	116
58      	765572003296	63
58      	547244118460	141
58      	986202008726	150
58      	563144943925	121
58      	718971287692	82
58      	272121204465	100
58      	383476286895	134
58      	450659382698	134
58      	567657950596	122
58      	836900805029	77
58      	516495915668	76
58      	828509049873	150
58      	803607788754	115
58      	925173129386	149
58      	300475101700	95
58      	816260222588	148
58      	400930079611	96
58      	536851950801	80
58      	490997846898	133
58      	234646454745	149
58      	569219762080	71
58      	199753522658	106
58      	409542246104	53
58      	297083512852	50
58      	754664511022	76
58      	144568875894	59
58      	863129185304	137
58      	749625390019	75
58      	590034051433	81
58      	467615168772	61
58      	633320411611	67
58      	578147508823	60
58      	250617599940	62
58      	488529033803	131
58      	721857506010	137
58      	697814031389	53
58      	925484684473	50
58      	506298714832	119
58      	264132323061	142
58      	814141265887	113
58      	871701186034	119
58      	398900612810	65
58      	868744054130	130
58      	877194198700	71
58      	380734371410	64
58      	740581174440	112
58      	775611741635	73
58      	554521191996	72
58      	862174790606	124
58      	246144606961	117
58      	308440276732	103
58      	140903716305	138
58      	654563447110	66
58      	572878568883	90
58      	377848719039	58
58      	516286957430	75
58      	741544174664	77
58      	117431954043	118
58      	508818965558	113
58      	176404904473	101
58      	636021875565	97
58      	750886611187	144
58      	389169531271	144
58      	589814450967	92
58      	174237001203	74
58      	482340522139	113
58      	861348595761	54
58      	420756960291	83
58      	414652410482	63
58      	103362565865	77
58      	549746556299	132
58      	518329844939	130
58      	127026679653	72
58      	996103067914	141
58      	108649313374	106
58      	482429892907	126
58      	113476782830	68
58      	875125493289	54
58      	702421087613	129
58      	208174494479	138
58      	159425007904	109
58      	205930062465	121
59      	518329844939	124
59      	227635917829	111
59      	590034051433	132
59      	838962966418	83
59      	528771298719	122
59      	572878568883	114
59      	113476782830	128
59      	673737891943	108
59      	679453075525	85
59      	103362565865	134
59      	706236730898	71
59      	140903716305	87
59      	349330324726	142
59      	770565227675	57
59      	979700065093	105
59      	529831629045	58
59      	646511826677	127
59      	172950643766	118
59      	132186536765	126
59      	948543507361	74
59      	556388862616	138
59      	578147508823	101
59      	836900805029	88
59      	563144943925	123
59      	388403878360	50
59      	377848719039	136
59      	732970729968	81
59      	334425348148	111
59      	384179652400	94
59      	314482481265	105
59      	994411186239	88
59      	312237459250	103
59      	364745567029	57
59      	384468659793	129
59      	618570550236	77
59      	873640709962	55
59      	649921994715	64
59      	925484684473	79
59      	863129185304	107
59      	692492393712	52
59      	286243122717	130
59      	902956788286	131
59      	250617599940	63
59      	168074802141	52
59      	566877828296	74
59      	718971287692	67
59      	608852371253	101
59      	567657950596	122
59      	144568875894	91
59      	265444172694	76
59      	419446364450	67
59      	210526151030	119
59      	839518983686	119
59      	381299535788	53
59      	775611741635	130
59      	194144382996	95
59      	187272692439	87
59      	904647940449	122
59      	284083366181	64
59      	547244118460	72
59      	339589987290	107
59      	660310920540	92
59      	419481071217	107
59      	828509049873	105
59      	414652410482	145
59      	418604295928	78
59      	189470486214	89
59      	771137437634	98
59      	697814031389	111
59      	336491915536	109
59      	716818652888	118
59      	261188186216	124
59      	518787417161	74
59      	117431954043	124
59      	698718941817	113
59      	534109743798	137
59      	453357640486	116
60      	495776106616	80
60      	490997846898	53
60      	572878568883	109
60      	308792010934	96
60      	316871031375	78
60      	511511692317	66
60      	113476782830	64
60      	388403878360	84
60      	450659382698	60
60      	833663232208	79
60      	875605607431	147
60      	894482053097	65
60      	523196696835	94
60      	108649313374	111
60      	312237459250	138
60      	381299535788	104
60      	421337093409	102
60      	862174790606	124
60      	904647940449	109
60      	234646454745	55
60      	698718941817	128
60      	556388862616	130
60      	467615168772	145
60      	732970729968	57
60      	172950643766	65
60      	379942304309	86
60      	457459442332	108
60      	882152991390	50
60      	919197823026	117
60      	805966823208	81
60      	373709485267	102
60      	127026679653	126
60      	702421087613	51
60      	322758894316	100
60      	205930062465	82
60      	167742802915	58
60      	118389501460	97
60      	384468659793	133
60      	425456990082	87
60      	709229053555	128
60      	194144382996	78
60      	589814450967	100
60      	925484684473	100
60      	769357296879	68
60      	174237001203	125
60      	578147508823	71
60      	152614854189	73
60      	899657914264	119
60      	877194198700	142
60      	557899454410	130
60      	706236730898	133
60      	525199185853	143
60      	750886611187	72
60      	349435998924	57
60      	630929030795	65
60      	210526151030	136
60      	398900612810	96
60      	776538360607	79
60      	692492393712	92
60      	389169531271	115
60      	642234808130	105
60      	948543507361	115
60      	300475101700	89
60      	261188186216	71
60      	375276903331	51
60      	999543417737	114
60      	418604295928	89
60      	863129185304	96
60      	529831629045	112
60      	871701186034	80
60      	527453991710	119
60      	272121204465	114
60      	334074319971	86
60      	518329844939	60
60      	514254550616	146
60      	925173129386	111
60      	126834215166	77
60      	952550789390	77
60      	297083512852	69
60      	536851950801	121
60      	67014520356 	82
60      	549746556299	92
60      	887528437482	56
60      	873640709962	77
60      	528771298719	119
60      	411067277447	102
60      	486804801433	80
60      	199968033019	138
60      	286243122717	125
60      	702830548447	129
60      	654563447110	59
60      	349330324726	113
60      	945012228482	93
60      	430946284790	104
60      	189470486214	56
60      	749625390019	104
60      	722946564026	148
60      	334425348148	66
60      	252522255166	146
60      	435122760857	92
60      	839518983686	105
60      	140903716305	104
60      	482340522139	93
60      	336491915536	92
60      	838962966418	102
60      	435583017631	137
60      	400127531270	66
60      	103362565865	130
60      	518787417161	93
60      	986065693858	122
60      	836900805029	147
60      	339589987290	102
60      	679453075525	71
60      	516286957430	51
60      	290827207620	105
60      	643925479319	80
60      	558886167633	114
60      	509762284879	126
60      	308440276732	101
60      	608852371253	88
60      	488529033803	75
60      	578705048123	110
61      	996103067914	98
61      	518787417161	147
61      	771137437634	128
61      	982079076090	147
61      	859109096191	107
61      	435583017631	118
61      	261188186216	98
61      	312237459250	66
61      	557899454410	122
61      	660310920540	136
61      	425456990082	54
61      	754664511022	122
61      	836900805029	87
61      	945012228482	149
61      	300475101700	89
61      	322758894316	145
61      	709229053555	126
61      	336491915536	133
61      	902956788286	130
61      	284083366181	109
61      	769357296879	57
61      	893005812666	89
61      	400930079611	144
61      	702830548447	148
61      	962728896848	61
61      	673737891943	87
61      	488529033803	100
61      	603333456348	113
61      	948543507361	68
61      	589814450967	101
61      	290827207620	128
61      	869112308003	97
61      	383476286895	79
61      	706236730898	130
61      	167742802915	71
61      	636021875565	83
61      	805966823208	123
61      	418604295928	55
61      	334425348148	51
61      	536851950801	107
61      	882152991390	91
61      	334074319971	63
61      	205930062465	62
61      	173672457176	55
61      	453357640486	133
61      	525199185853	52
61      	904647940449	144
61      	203262278452	96
61      	875605607431	63
61      	849681336901	72
61      	168074802141	98
61      	979700065093	65
61      	339589987290	150
61      	314482481265	146
61      	732970729968	120
61      	132186536765	136
61      	944472664850	106
61      	187272692439	52
61      	172950643766	145
61      	419446364450	74
61      	117431954043	54
61      	421337093409	52
61      	877194198700	101
61      	629919786056	77
61      	379942304309	134
61      	873640709962	89
61      	377848719039	118
61      	941976384328	120
61      	495776106616	57
61      	568658660566	60
61      	939369924082	108
61      	776538360607	129
61      	945312847530	135
61      	770565227675	126
61      	646511826677	147
61      	916984241291	84
61      	297083512852	121
61      	349330324726	128
61      	814141265887	136
61      	516286957430	69
61      	875125493289	98
61      	330700905340	65
61      	514254550616	145
61      	444797600349	140
61      	199753522658	118
61      	159425007904	79
61      	467615168772	112
61      	234646454745	140
61      	398900612810	92
61      	152614854189	68
61      	419481071217	72
61      	381299535788	61
61      	698718941817	82
61      	923237099384	53
61      	189470486214	102
61      	482340522139	54
61      	786975743876	117
61      	364745567029	101
61      	139669412174	113
61      	633320411611	103
61      	473186595371	69
61      	412348931569	89
61      	384468659793	114
61      	467986934495	74
61      	518329844939	50
61      	722946564026	71
61      	692492393712	63
61      	887528437482	91
61      	154554749200	109
61      	413227470171	54
61      	528771298719	102
61      	508818965558	78
61      	316871031375	90
61      	511511692317	133
61      	414652410482	72
61      	765572003296	62
61      	457459442332	122
61      	486804801433	92
61      	400127531270	86
61      	702421087613	86
61      	250617599940	100
61      	118389501460	137
61      	308792010934	142
61      	208174494479	55
61      	630929030795	97
61      	750886611187	113
61      	547685258313	97
61      	506298714832	146
61      	547244118460	77
61      	721857506010	113
61      	600770885624	102
61      	868744054130	111
61      	294993047536	123
61      	265444172694	99
61      	999543417737	135
61      	108326062706	132
62      	603333456348	101
62      	490997846898	60
62      	234646454745	77
62      	272121204465	133
62      	339589987290	145
62      	290827207620	143
62      	896919583724	65
62      	776538360607	116
62      	998040421944	120
62      	702421087613	143
62      	893005812666	147
62      	261188186216	75
62      	618570550236	138
62      	246144606961	124
62      	168074802141	121
62      	495776106616	120
62      	389169531271	76
62      	859109096191	59
62      	375276903331	134
62      	509762284879	122
62      	636021875565	54
62      	923237099384	52
62      	816260222588	78
62      	419481071217	125
62      	252522255166	126
62      	863129185304	93
62      	314482481265	138
62      	126834215166	139
62      	308440276732	116
62      	174237001203	67
62      	814141265887	127
62      	208174494479	50
62      	210526151030	126
62      	154554749200	143
62      	516495915668	147
62      	803607788754	117
62      	887528437482	81
62      	118389501460	58
62      	159425007904	140
62      	467615168772	71
62      	933914210509	86
62      	523196696835	126
62      	749193678427	95
62      	563144943925	78
62      	529831629045	141
62      	511511692317	118
62      	199753522658	138
62      	982079076090	115
62      	264132323061	99
62      	740581174440	94
62      	518787417161	88
62      	381299535788	67
62      	398900612810	107
62      	986202008726	120
62      	127026679653	135
62      	536851950801	139
62      	948543507361	132
62      	421337093409	107
62      	284083366181	98
62      	869112308003	134
62      	894482053097	51
62      	939369924082	104
62      	516286957430	96
62      	430946284790	107
62      	833663232208	59
62      	265444172694	134
62      	194144382996	133
62      	334074319971	118
62      	754664511022	83
62      	134390993040	58
62      	646511826677	121
62      	435122760857	130
62      	868744054130	136
62      	349435998924	132
62      	316871031375	105
62      	702830548447	118
62      	286243122717	138
62      	419446364450	75
62      	554521191996	145
62      	558886167633	95
62      	547244118460	149
62      	317663070530	59
62      	388403878360	71
62      	453357640486	58
62      	187272692439	79
62      	633320411611	146
62      	547685258313	79
62      	205930062465	74
62      	718971287692	84
62      	749625390019	143
62      	786975743876	69
62      	444797600349	129
62      	828509049873	141
62      	649921994715	63
62      	435583017631	115
62      	384468659793	94
62      	692492393712	125
62      	482429892907	64
62      	836900805029	75
62      	518329844939	109
62      	861348595761	142
62      	173672457176	109
62      	771137437634	121
62      	849681336901	83
62      	722946564026	60
62      	380734371410	55
62      	696368469198	147
62      	108649313374	78
62      	144568875894	112
62      	925484684473	130
62      	349330324726	69
62      	944472664850	95
62      	919197823026	85
62      	882152991390	83
62      	572878568883	85
62      	312237459250	95
62      	411067277447	150
62      	732970729968	137
62      	838962966418	71
62      	180531962334	149
62      	629919786056	140
62      	706236730898	65
62      	450659382698	125
62      	630929030795	63
62      	534109743798	122
62      	379942304309	57
62      	457459442332	104
62      	568658660566	129
62      	132954606361	90
62      	132186536765	63
62      	999543417737	61
62      	250617599940	63
62      	862174790606	97
62      	945312847530	59
62      	925173129386	96
62      	383476286895	103
62      	322758894316	63
62      	330700905340	84
62      	400127531270	93
62      	871701186034	134
62      	875605607431	85
62      	556388862616	125
62      	979700065093	99
62      	412348931569	94
62      	117431954043	113
62      	199968033019	96
63      	207178796787	101
63      	692492393712	98
63      	516495915668	69
63      	861348595761	90
63      	893005812666	92
63      	642234808130	81
63      	384179652400	60
63      	528771298719	72
63      	894482053097	89
63      	457459442332	55
63      	316871031375	91
63      	227635917829	99
63      	430946284790	136
63      	377848719039	78
63      	919197823026	60
63      	649921994715	86
63      	986065693858	82
63      	749625390019	110
63      	998040421944	114
63      	629919786056	50
63      	336491915536	62
63      	523196696835	91
63      	314482481265	113
63      	117431954043	124
63      	425456990082	97
63      	600770885624	102
63      	199968033019	138
63      	775611741635	90
63      	383476286895	106
63      	554521191996	97
63      	380734371410	52
63      	697814031389	93
63      	754664511022	59
63      	127026679653	115
63      	882152991390	147
63      	875125493289	55
63      	234646454745	61
63      	933914210509	142
63      	174237001203	70
63      	413227470171	106
63      	945312847530	131
63      	718971287692	116
63      	547685258313	126
63      	518329844939	95
63      	467986934495	121
63      	132954606361	88
63      	330700905340	56
63      	334425348148	88
63      	187272692439	121
63      	172950643766	103
63      	527453991710	80
63      	203262278452	132
64      	525199185853	102
64      	375276903331	132
64      	418604295928	126
64      	421337093409	77
64      	999543417737	52
64      	861348595761	147
64      	173672457176	148
64      	264132323061	72
64      	334074319971	108
64      	290827207620	118
64      	986065693858	91
64      	749625390019	71
64      	669515708071	126
64      	636021875565	112
64      	419446364450	105
64      	152614854189	102
64      	896919583724	70
64      	518787417161	138
64      	334425348148	79
64      	516286957430	132
64      	444797600349	118
64      	716818652888	110
64      	547244118460	67
64      	425456990082	112
64      	203262278452	106
64      	383476286895	136
64      	187272692439	124
64      	749193678427	94
64      	608852371253	117
64      	904647940449	70
64      	207178796787	63
64      	294993047536	133
64      	814141265887	116
64      	388403878360	87
64      	805966823208	113
64      	467986934495	54
64      	511511692317	150
64      	252522255166	139
64      	828509049873	76
64      	297083512852	55
64      	139669412174	106
64      	698718941817	131
64      	948543507361	105
64      	377848719039	117
64      	618570550236	119
64      	816260222588	53
64      	654563447110	83
64      	600770885624	122
64      	642234808130	65
64      	414652410482	68
64      	205930062465	85
64      	516495915668	76
64      	312237459250	149
64      	523196696835	140
64      	129753980851	113
64      	134390993040	135
64      	419481071217	82
64      	877194198700	56
64      	578705048123	66
64      	113476782830	123
64      	945312847530	82
64      	261188186216	133
64      	556388862616	106
64      	508818965558	96
64      	234646454745	102
64      	933914210509	150
64      	765572003296	150
64      	603333456348	105
64      	506298714832	133
64      	314482481265	82
64      	330700905340	97
64      	893005812666	101
64      	536851950801	115
64      	702421087613	103
64      	702830548447	148
64      	300475101700	107
64      	208174494479	52
64      	420756960291	64
64      	557899454410	114
64      	349330324726	62
64      	643925479319	126
64      	646511826677	116
64      	381299535788	68
64      	140903716305	97
64      	775611741635	140
64      	696368469198	115
64      	384179652400	72
64      	722946564026	129
64      	473186595371	77
64      	875125493289	83
64      	706236730898	116
64      	750886611187	56
64      	154554749200	71
64      	488529033803	92
64      	398900612810	106
64      	482340522139	52
64      	400127531270	70
64      	174237001203	147
64      	529831629045	54
64      	862174790606	125
64      	566877828296	127
64      	660310920540	108
64      	916984241291	115
64      	679453075525	121
64      	899657914264	134
64      	998040421944	86
64      	144568875894	61
64      	308440276732	123
64      	770565227675	111
64      	159425007904	96
64      	379942304309	123
64      	576518370019	134
64      	859109096191	127
64      	265444172694	105
64      	709229053555	114
64      	274761600136	99
64      	364745567029	92
64      	697814031389	87
64      	692492393712	101
64      	180531962334	99
64      	199968033019	90
64      	572878568883	143
64      	567657950596	113
64      	246144606961	64
64      	986202008726	109
64      	979700065093	119
64      	732970729968	150
64      	649921994715	117
65      	134390993040	74
65      	419481071217	61
65      	999543417737	51
65      	986202008726	96
65      	576518370019	130
65      	536851950801	84
65      	636021875565	121
65      	893005812666	145
65      	986065693858	119
65      	339589987290	146
65      	132186536765	96
65      	962728896848	122
65      	902956788286	53
65      	642234808130	141
65      	600770885624	116
65      	887528437482	117
65      	272121204465	91
65      	534109743798	77
65      	646511826677	53
65      	741544174664	54
65      	814141265887	82
65      	118389501460	127
65      	314482481265	104
65      	692492393712	91
65      	514254550616	62
65      	375276903331	108
65      	816260222588	143
65      	274761600136	106
65      	630929030795	50
65      	176404904473	59
65      	749193678427	145
65      	435122760857	132
65      	384179652400	65
65      	205930062465	53
65      	923237099384	58
65      	919197823026	135
65      	979700065093	79
65      	669515708071	80
65      	875605607431	119
65      	948543507361	148
65      	154554749200	147
65      	234646454745	81
65      	572878568883	71
65      	871701186034	77
65      	349435998924	116
65      	364745567029	52
65      	547685258313	144
65      	528771298719	134
65      	384468659793	147
65      	589814450967	74
65      	265444172694	124
65      	482429892907	54
65      	187272692439	138
65      	709229053555	146
65      	252522255166	66
65      	698718941817	138
65      	629919786056	56
66      	769357296879	101
66      	630929030795	147
66      	132954606361	97
66      	113476782830	135
66      	118389501460	93
66      	252522255166	91
66      	488529033803	137
66      	334074319971	58
66      	250617599940	90
66      	603333456348	52
66      	904647940449	77
66      	523196696835	114
66      	994411186239	85
66      	420756960291	52
66      	388403878360	74
66      	409542246104	79
66      	536851950801	100
66      	925484684473	88
66      	314482481265	67
66      	528771298719	65
66      	939369924082	82
66      	284083366181	70
66      	134390993040	135
66      	421337093409	113
66      	875125493289	78
66      	629919786056	95
66      	435583017631	120
66      	506298714832	119
66      	547244118460	146
66      	945312847530	105
66      	749625390019	58
66      	679453075525	69
66      	261188186216	67
66      	887528437482	128
66      	549746556299	66
66      	862174790606	125
66      	998040421944	69
66      	414652410482	149
66      	189470486214	54
66      	882152991390	79
66      	486804801433	108
66      	554521191996	56
66      	716818652888	61
66      	945012228482	141
66      	375276903331	124
66      	167742802915	116
66      	495776106616	72
66      	529831629045	68
66      	702830548447	121
66      	154554749200	105
66      	894482053097	148
66      	642234808130	105
66      	838962966418	104
66      	203262278452	125
66      	272121204465	91
66      	246144606961	79
66      	317663070530	106
66      	805966823208	66
66      	563144943925	86
66      	108326062706	129
66      	450659382698	144
66      	828509049873	76
66      	557899454410	102
66      	398900612810	98
66      	187272692439	112
66      	771137437634	127
66      	518329844939	145
66      	875605607431	87
66      	698718941817	71
66      	923237099384	60
66      	770565227675	111
66      	377848719039	147
66      	168074802141	68
66      	490997846898	96
66      	722946564026	124
66      	673737891943	53
66      	208174494479	105
66      	697814031389	54
66      	419446364450	133
66      	849681336901	58
66      	384468659793	136
66      	290827207620	141
66      	568658660566	80
66      	944472664850	136
66      	982079076090	83
66      	425456990082	111
66      	979700065093	144
66      	833663232208	63
66      	869112308003	110
66      	419481071217	83
66      	453357640486	112
66      	948543507361	72
66      	776538360607	62
66      	334425348148	82
66      	67014520356 	121
66      	660310920540	136
66      	413227470171	77
66      	643925479319	64
66      	297083512852	101
66      	576518370019	76
66      	265444172694	93
66      	380734371410	126
66      	379942304309	129
66      	589814450967	75
66      	174237001203	54
66      	514254550616	121
66      	108649313374	91
66      	786975743876	128
66      	159425007904	142
66      	322758894316	85
66      	952550789390	73
66      	381299535788	100
66      	483738463713	143
66      	457459442332	127
66      	916984241291	56
66      	816260222588	116
66      	146051347589	71
66      	227635917829	117
66      	444797600349	71
66      	411067277447	144
66      	152614854189	129
66      	775611741635	86
66      	732970729968	89
66      	312237459250	111
66      	339589987290	116
66      	384179652400	138
66      	180531962334	68
66      	308440276732	135
66      	873640709962	81
66      	692492393712	109
66      	400930079611	50
66      	556388862616	135
66      	803607788754	65
66      	899657914264	67
66      	430946284790	82
66      	868744054130	136
66      	962728896848	55
67      	509762284879	50
67      	547244118460	133
67      	899657914264	120
67      	994411186239	58
67      	127026679653	64
67      	473186595371	93
67      	549746556299	91
67      	435583017631	61
67      	174237001203	66
67      	986065693858	65
67      	836900805029	93
67      	770565227675	83
67      	272121204465	75
67      	692492393712	83
67      	718971287692	98
67      	590034051433	77
67      	875125493289	124
67      	518329844939	88
67      	250617599940	96
67      	379942304309	111
67      	246144606961	108
67      	646511826677	80
67      	722946564026	101
67      	414652410482	57
67      	490997846898	99
67      	516495915668	83
67      	833663232208	84
67      	873640709962	126
67      	373709485267	95
67      	234646454745	108
67      	982079076090	92
67      	339589987290	72
67      	134390993040	87
67      	380734371410	141
67      	139669412174	128
67      	750886611187	134
67      	495776106616	75
67      	483738463713	81
67      	945312847530	56
67      	419481071217	150
67      	679453075525	89
67      	208174494479	148
67      	199968033019	84
67      	205930062465	139
67      	673737891943	68
67      	412348931569	54
67      	749625390019	131
67      	508818965558	85
67      	108326062706	87
67      	453357640486	80
67      	167742802915	71
67      	608852371253	51
67      	948543507361	128
67      	868744054130	86
67      	384179652400	67
67      	563144943925	67
67      	754664511022	52
67      	986202008726	89
67      	398900612810	135
67      	140903716305	124
67      	925173129386	141
67      	317663070530	110
67      	698718941817	131
67      	568658660566	124
67      	450659382698	69
67      	117431954043	136
67      	199753522658	97
67      	941976384328	50
67      	660310920540	123
67      	603333456348	93
67      	129753980851	62
67      	923237099384	75
67      	916984241291	146
67      	869112308003	138
67      	384468659793	90
67      	113476782830	113
68      	488529033803	90
68      	875605607431	77
68      	902956788286	88
68      	308792010934	61
68      	509762284879	67
68      	567657950596	106
68      	486804801433	79
68      	814141265887	129
68      	173672457176	111
68      	334425348148	125
68      	435122760857	102
68      	925173129386	78
68      	859109096191	148
68      	199968033019	78
68      	308440276732	97
68      	139669412174	87
68      	838962966418	79
68      	660310920540	59
68      	317663070530	120
68      	528771298719	89
68      	590034051433	86
68      	547244118460	94
68      	945012228482	68
68      	495776106616	90
68      	749625390019	56
68      	525199185853	77
68      	718971287692	50
68      	556388862616	143
68      	702421087613	50
68      	373709485267	85
68      	839518983686	72
68      	948543507361	71
68      	636021875565	83
68      	629919786056	83
68      	875125493289	133
68      	589814450967	103
68      	380734371410	126
68      	536851950801	71
68      	979700065093	149
68      	132954606361	125
68      	450659382698	103
68      	208174494479	149
68      	146051347589	128
68      	697814031389	122
68      	483738463713	123
68      	722946564026	80
68      	518787417161	68
68      	986065693858	119
68      	300475101700	79
68      	383476286895	61
68      	776538360607	64
68      	775611741635	94
68      	384468659793	82
68      	941976384328	93
68      	349435998924	94
68      	294993047536	92
68      	421337093409	87
68      	887528437482	118
68      	199753522658	144
68      	643925479319	122
68      	108326062706	53
68      	152614854189	136
68      	339589987290	58
68      	286243122717	94
68      	998040421944	76
68      	805966823208	93
68      	547685258313	52
68      	388403878360	97
68      	803607788754	72
68      	419446364450	134
68      	384179652400	129
68      	702830548447	108
68      	227635917829	136
68      	473186595371	67
68      	919197823026	51
68      	563144943925	66
68      	467615168772	137
68      	430946284790	140
68      	882152991390	78
68      	769357296879	100
68      	877194198700	60
68      	379942304309	131
68      	419481071217	90
68      	828509049873	75
68      	205930062465	61
68      	893005812666	87
68      	250617599940	70
68      	863129185304	84
68      	274761600136	109
68      	566877828296	96
68      	312237459250	142
68      	412348931569	93
68      	180531962334	127
68      	618570550236	52
68      	284083366181	98
68      	514254550616	111
68      	869112308003	105
68      	749193678427	117
68      	558886167633	50
68      	398900612810	65
68      	633320411611	54
68      	411067277447	95
68      	904647940449	113
68      	982079076090	125
68      	322758894316	111
68      	698718941817	129
68      	673737891943	98
68      	108649313374	75
68      	578705048123	51
68      	207178796787	147
68      	696368469198	144
68      	457459442332	55
68      	523196696835	54
68      	952550789390	124
68      	833663232208	67
68      	925484684473	55
69      	741544174664	137
69      	132954606361	72
69      	483738463713	87
69      	486804801433	52
69      	925484684473	107
69      	334425348148	122
69      	435122760857	75
69      	413227470171	142
69      	294993047536	144
69      	945312847530	60
69      	490997846898	150
69      	836900805029	125
69      	643925479319	133
69      	859109096191	126
69      	430946284790	117
69      	863129185304	112
69      	103362565865	66
69      	608852371253	109
69      	199968033019	93
69      	189470486214	63
69      	849681336901	143
69      	740581174440	147
69      	828509049873	108
69      	129753980851	51
69      	630929030795	117
69      	316871031375	58
69      	896919583724	131
69      	998040421944	51
69      	203262278452	124
69      	140903716305	143
69      	227635917829	82
69      	482340522139	102
69      	833663232208	79
69      	816260222588	95
69      	375276903331	97
69      	569219762080	53
69      	875125493289	128
69      	108326062706	71
69      	173672457176	64
69      	887528437482	139
69      	547685258313	139
69      	208174494479	86
69      	871701186034	59
69      	775611741635	63
69      	207178796787	80
69      	805966823208	74
69      	518787417161	118
69      	669515708071	86
69      	518329844939	142
69      	117431954043	147
69      	923237099384	116
69      	336491915536	66
69      	603333456348	117
69      	127026679653	59
69      	618570550236	97
69      	590034051433	60
69      	379942304309	117
69      	925173129386	124
69      	154554749200	69
69      	286243122717	107
69      	702830548447	69
69      	419481071217	129
69      	882152991390	135
69      	749625390019	51
69      	709229053555	102
69      	814141265887	93
69      	364745567029	89
69      	994411186239	66
69      	495776106616	105
69      	982079076090	137
69      	450659382698	140
69      	776538360607	81
69      	578147508823	56
69      	168074802141	82
69      	457459442332	54
69      	272121204465	137
69      	633320411611	85
69      	250617599940	63
69      	999543417737	66
69      	875605607431	83
70      	636021875565	53
70      	828509049873	138
70      	314482481265	98
70      	567657950596	72
70      	172950643766	77
70      	871701186034	91
70      	816260222588	119
70      	398900612810	65
70      	234646454745	121
70      	948543507361	59
70      	435583017631	138
70      	379942304309	136
70      	300475101700	148
70      	569219762080	81
70      	453357640486	85
70      	716818652888	71
70      	227635917829	132
70      	603333456348	79
70      	159425007904	81
70      	473186595371	127
70      	67014520356 	74
70      	718971287692	72
70      	168074802141	76
70      	549746556299	85
70      	572878568883	93
70      	297083512852	50
70      	286243122717	105
70      	290827207620	149
70      	199968033019	95
70      	600770885624	82
70      	250617599940	93
70      	679453075525	92
70      	113476782830	82
70      	274761600136	115
70      	944472664850	119
70      	557899454410	89
70      	419481071217	64
70      	508818965558	56
70      	642234808130	129
70      	176404904473	56
70      	412348931569	122
70      	722946564026	129
70      	413227470171	91
70      	514254550616	122
70      	525199185853	68
70      	511511692317	130
70      	836900805029	91
70      	547685258313	85
70      	916984241291	144
70      	923237099384	138
70      	349435998924	101
70      	925173129386	108
70      	608852371253	119
70      	294993047536	118
70      	692492393712	82
70      	482429892907	125
70      	576518370019	145
70      	933914210509	78
70      	999543417737	55
70      	126834215166	88
70      	167742802915	99
70      	902956788286	76
70      	709229053555	146
70      	409542246104	140
70      	646511826677	57
70      	769357296879	70
70      	199753522658	120
70      	134390993040	140
70      	444797600349	82
70      	377848719039	125
70      	566877828296	73
70      	450659382698	117
70      	264132323061	129
70      	673737891943	125
70      	528771298719	144
70      	732970729968	66
70      	563144943925	111
70      	108649313374	84
70      	803607788754	122
70      	633320411611	104
70      	418604295928	100
70      	261188186216	93
70      	925484684473	131
70      	838962966418	72
70      	336491915536	59
70      	750886611187	87
70      	770565227675	85
70      	849681336901	140
70      	205930062465	97
70      	754664511022	109
70      	373709485267	122
70      	527453991710	57
70      	388403878360	141
70      	589814450967	69
70      	660310920540	53
70      	467986934495	120
70      	400930079611	112
70      	536851950801	62
70      	516286957430	138
70      	430946284790	78
70      	862174790606	122
70      	194144382996	94
70      	127026679653	146
70      	568658660566	127
70      	317663070530	112
70      	144568875894	105
70      	941976384328	88
70      	833663232208	137
70      	994411186239	92
70      	706236730898	140
70      	203262278452	109
70      	380734371410	52
70      	894482053097	125
70      	643925479319	117
70      	814141265887	69
70      	457459442332	137
70      	174237001203	91
70      	534109743798	83
70      	117431954043	81
70      	108326062706	50
70      	381299535788	93
70      	187272692439	73
70      	364745567029	137
70      	873640709962	61
70      	629919786056	131
70      	208174494479	131
70      	771137437634	58
71      	297083512852	121
71      	349330324726	139
71      	557899454410	91
71      	863129185304	141
71      	589814450967	76
71      	569219762080	120
71      	467615168772	149
71      	294993047536	58
71      	379942304309	125
71      	862174790606	106
71      	132186536765	95
71      	246144606961	126
71      	174237001203	62
71      	998040421944	145
71      	749193678427	137
71      	364745567029	128
71      	566877828296	79
71      	189470486214	61
71      	334074319971	105
71      	899657914264	65
71      	444797600349	113
71      	140903716305	135
71      	409542246104	86
71      	508818965558	52
71      	805966823208	70
71      	317663070530	109
71      	894482053097	92
71      	483738463713	92
71      	418604295928	75
71      	421337093409	112
71      	388403878360	132
71      	939369924082	71
71      	139669412174	83
71      	547685258313	137
71      	203262278452	59
71      	529831629045	138
71      	839518983686	51
71      	925173129386	88
71      	572878568883	120
71      	554521191996	51
71      	400127531270	91
71      	642234808130	82
71      	838962966418	88
71      	769357296879	75
71      	208174494479	122
71      	450659382698	120
71      	419446364450	107
71      	706236730898	113
71      	330700905340	60
71      	127026679653	140
71      	172950643766	92
71      	732970729968	106
71      	549746556299	94
71      	608852371253	64
71      	375276903331	115
71      	741544174664	141
71      	814141265887	62
71      	803607788754	139
71      	210526151030	116
71      	861348595761	117
71      	875605607431	101
71      	400930079611	77
71      	679453075525	137
71      	547244118460	107
71      	516495915668	107
71      	534109743798	117
71      	134390993040	112
71      	199753522658	77
71      	457459442332	90
71      	490997846898	120
71      	775611741635	63
71      	482429892907	134
71      	300475101700	53
71      	558886167633	70
71      	453357640486	110
71      	103362565865	147
71      	702830548447	105
71      	952550789390	139
71      	199968033019	79
71      	994411186239	117
71      	167742802915	104
71      	286243122717	78
71      	919197823026	103
71      	836900805029	63
71      	568658660566	81
71      	516286957430	110
71      	435583017631	117
71      	334425348148	131
71      	722946564026	137
71      	716818652888	140
71      	316871031375	92
71      	173672457176	134
71      	467986934495	53
71      	576518370019	74
71      	308440276732	114
71      	108326062706	101
71      	996103067914	75
71      	816260222588	90
71      	697814031389	107
71      	312237459250	61
71      	509762284879	150
71      	646511826677	133
71      	234646454745	101
71      	833663232208	51
71      	383476286895	129
71      	187272692439	134
71      	633320411611	109
71      	413227470171	141
71      	349435998924	123
71      	314482481265	88
71      	425456990082	105
71      	979700065093	115
71      	904647940449	98
71      	518787417161	74
71      	660310920540	130
71      	754664511022	60
71      	578147508823	54
71      	696368469198	141
71      	916984241291	146
71      	284083366181	85
71      	274761600136	81
71      	272121204465	51
71      	528771298719	106
71      	118389501460	58
71      	144568875894	86
71      	882152991390	115
71      	945312847530	64
72      	636021875565	57
72      	418604295928	149
72      	349330324726	82
72      	103362565865	101
72      	132186536765	123
72      	578147508823	73
72      	887528437482	60
72      	250617599940	97
72      	899657914264	138
72      	608852371253	81
72      	962728896848	136
72      	339589987290	140
72      	129753980851	143
72      	863129185304	137
72      	207178796787	134
72      	534109743798	83
72      	421337093409	149
72      	673737891943	80
72      	862174790606	142
72      	527453991710	135
72      	776538360607	90
72      	750886611187	52
72      	252522255166	86
72      	518329844939	119
72      	902956788286	132
72      	836900805029	95
72      	569219762080	147
72      	126834215166	108
72      	334425348148	72
72      	290827207620	111
72      	453357640486	50
72      	722946564026	85
72      	152614854189	58
72      	816260222588	132
72      	923237099384	64
72      	117431954043	86
72      	108649313374	129
72      	698718941817	133
72      	642234808130	75
72      	113476782830	108
72      	457459442332	51
72      	925173129386	91
72      	982079076090	133
72      	488529033803	149
72      	398900612810	98
72      	144568875894	139
72      	603333456348	105
72      	516286957430	139
72      	528771298719	92
72      	308792010934	96
72      	264132323061	148
72      	859109096191	63
72      	132954606361	145
72      	523196696835	62
72      	168074802141	111
72      	495776106616	68
72      	986065693858	90
72      	274761600136	136
72      	769357296879	53
72      	146051347589	88
72      	630929030795	87
72      	373709485267	142
72      	381299535788	143
72      	265444172694	50
72      	508818965558	146
72      	939369924082	108
72      	894482053097	129
72      	732970729968	81
72      	187272692439	107
72      	893005812666	66
72      	180531962334	145
72      	246144606961	132
72      	108326062706	140
72      	765572003296	103
72      	261188186216	82
72      	199753522658	114
72      	389169531271	75
72      	786975743876	83
72      	140903716305	135
72      	629919786056	98
72      	633320411611	58
72      	316871031375	125
72      	525199185853	104
72      	618570550236	89
72      	721857506010	79
72      	330700905340	106
72      	643925479319	81
72      	411067277447	106
72      	600770885624	112
73      	473186595371	126
73      	514254550616	56
73      	696368469198	83
73      	750886611187	117
73      	290827207620	73
73      	776538360607	111
73      	516286957430	74
73      	765572003296	135
73      	349330324726	124
73      	925484684473	122
73      	986065693858	114
73      	862174790606	93
73      	336491915536	54
73      	108649313374	146
73      	140903716305	120
73      	508818965558	80
73      	377848719039	132
73      	904647940449	136
73      	420756960291	84
73      	199968033019	128
73      	636021875565	107
73      	152614854189	139
73      	467615168772	68
73      	679453075525	61
73      	317663070530	103
73      	144568875894	52
73      	803607788754	101
73      	868744054130	119
73      	297083512852	73
73      	709229053555	115
73      	314482481265	64
73      	173672457176	103
73      	189470486214	113
73      	421337093409	55
73      	167742802915	113
73      	706236730898	108
73      	334425348148	134
73      	589814450967	105
73      	861348595761	80
73      	199753522658	96
73      	486804801433	78
73      	308440276732	71
73      	103362565865	142
73      	882152991390	139
73      	629919786056	50
73      	740581174440	90
73      	718971287692	127
73      	334074319971	52
73      	264132323061	90
73      	379942304309	139
73      	322758894316	57
73      	227635917829	91
73      	139669412174	116
73      	877194198700	144
73      	563144943925	127
73      	916984241291	54
73      	523196696835	87
73      	569219762080	122
73      	252522255166	122
73      	786975743876	150
73      	769357296879	116
73      	568658660566	74
73      	770565227675	113
73      	457459442332	105
73      	384468659793	140
73      	814141265887	87
73      	444797600349	113
73      	518787417161	122
73      	450659382698	58
73      	836900805029	131
73      	578705048123	74
73      	554521191996	116
73      	127026679653	112
73      	590034051433	137
73      	506298714832	147
73      	893005812666	79
73      	286243122717	131
73      	132186536765	129
73      	859109096191	70
73      	716818652888	130
73      	67014520356 	78
73      	838962966418	70
73      	380734371410	148
73      	250617599940	133
73      	312237459250	82
73      	567657950596	82
73      	411067277447	106
73      	483738463713	114
73      	982079076090	138
73      	741544174664	121
73      	771137437634	56
73      	388403878360	65
73      	702830548447	129
73      	702421087613	102
73      	375276903331	59
73      	633320411611	125
73      	945312847530	119
73      	996103067914	94
73      	511511692317	63
73      	557899454410	96
73      	923237099384	141
73      	527453991710	130
73      	400127531270	76
73      	556388862616	100
73      	896919583724	66
73      	389169531271	103
73      	944472664850	128
73      	308792010934	101
73      	979700065093	91
73      	697814031389	107
74      	457459442332	57
74      	140903716305	105
74      	173672457176	132
74      	139669412174	100
74      	349330324726	90
74      	836900805029	125
74      	261188186216	141
74      	126834215166	115
74      	389169531271	119
74      	786975743876	65
74      	334074319971	52
74      	272121204465	85
74      	633320411611	125
74      	863129185304	73
74      	702830548447	143
74      	679453075525	82
74      	696368469198	135
74      	643925479319	147
74      	159425007904	88
74      	557899454410	113
74      	252522255166	52
74      	322758894316	114
74      	450659382698	52
74      	364745567029	54
74      	754664511022	69
74      	506298714832	50
74      	816260222588	149
74      	308440276732	126
74      	939369924082	69
74      	528771298719	127
74      	718971287692	74
74      	962728896848	92
74      	590034051433	113
74      	108649313374	76
74      	589814450967	107
74      	945012228482	66
74      	400127531270	117
74      	482340522139	81
74      	839518983686	117
74      	246144606961	68
74      	409542246104	122
74      	297083512852	123
74      	334425348148	128
74      	205930062465	56
74      	300475101700	142
74      	312237459250	72
74      	529831629045	113
74      	234646454745	81
74      	833663232208	58
74      	419446364450	120
74      	603333456348	101
74      	563144943925	101
74      	925173129386	117
74      	629919786056	96
74      	765572003296	103
74      	578147508823	90
74      	649921994715	100
74      	435122760857	89
74      	375276903331	135
74      	516286957430	140
74      	979700065093	128
74      	896919583724	130
74      	933914210509	136
74      	814141265887	117
74      	127026679653	80
74      	290827207620	125
74      	558886167633	94
74      	514254550616	79
74      	168074802141	50
74      	414652410482	70
74      	692492393712	96
74      	630929030795	68
74      	511511692317	62
74      	488529033803	78
74      	208174494479	115
74      	871701186034	93
74      	642234808130	127
74      	132186536765	128
74      	996103067914	113
74      	67014520356 	97
74      	882152991390	87
74      	435583017631	143
74      	877194198700	109
74      	868744054130	69
74      	986202008726	92
74      	536851950801	123
74      	210526151030	81
74      	421337093409	100
74      	925484684473	140
74      	549746556299	68
74      	174237001203	93
74      	982079076090	92
74      	547244118460	114
74      	769357296879	86
74      	952550789390	72
74      	383476286895	144
74      	430946284790	144
74      	419481071217	81
74      	525199185853	92
74      	483738463713	125
74      	722946564026	100
74      	152614854189	95
74      	146051347589	51
74      	673737891943	95
74      	379942304309	68
74      	716818652888	141
74      	400930079611	85
75      	721857506010	90
75      	679453075525	150
75      	349435998924	142
75      	869112308003	100
75      	771137437634	84
75      	274761600136	50
75      	839518983686	141
75      	962728896848	55
75      	118389501460	69
75      	409542246104	147
75      	414652410482	131
75      	339589987290	134
75      	132186536765	93
75      	334074319971	94
75      	896919583724	64
75      	618570550236	103
75      	482340522139	66
75      	534109743798	141
75      	948543507361	68
75      	174237001203	101
75      	516495915668	75
75      	516286957430	85
75      	272121204465	97
75      	159425007904	55
75      	919197823026	62
75      	775611741635	82
75      	373709485267	106
75      	349330324726	112
75      	419481071217	51
75      	457459442332	145
75      	172950643766	129
75      	525199185853	70
75      	384468659793	77
75      	576518370019	71
75      	654563447110	65
75      	290827207620	55
75      	698718941817	142
75      	199968033019	104
75      	660310920540	118
75      	861348595761	117
75      	300475101700	72
75      	863129185304	110
75      	246144606961	56
75      	129753980851	78
75      	547244118460	97
75      	511511692317	150
75      	167742802915	109
75      	776538360607	121
75      	364745567029	129
75      	379942304309	56
75      	986202008726	123
75      	418604295928	73
75      	398900612810	82
75      	234646454745	75
75      	381299535788	58
75      	126834215166	144
75      	435122760857	125
75      	923237099384	141
75      	210526151030	126
75      	152614854189	74
75      	882152991390	116
75      	887528437482	149
75      	716818652888	106
75      	893005812666	70
75      	425456990082	53
75      	567657950596	95
75      	473186595371	54
75      	740581174440	128
75      	875125493289	116
75      	902956788286	109
75      	786975743876	122
75      	108326062706	80
75      	509762284879	129
75      	453357640486	63
75      	189470486214	127
75      	180531962334	81
75      	413227470171	129
75      	871701186034	134
75      	308792010934	85
75      	996103067914	89
75      	649921994715	65
75      	569219762080	137
75      	899657914264	87
75      	482429892907	92
75      	998040421944	74
75      	933914210509	123
75      	754664511022	113
75      	986065693858	61
75      	696368469198	68
75      	227635917829	113
75      	146051347589	129
75      	384179652400	104
75      	308440276732	135
75      	979700065093	100
75      	108649313374	70
75      	486804801433	90
75      	467986934495	136
75      	377848719039	62
75      	205930062465	115
75      	945012228482	63
75      	558886167633	63
75      	467615168772	90
75      	563144943925	90
75      	173672457176	148
75      	894482053097	121
75      	862174790606	139
75      	528771298719	121
75      	383476286895	72
75      	722946564026	132
75      	838962966418	121
75      	741544174664	70
75      	578705048123	106
75      	828509049873	128
75      	868744054130	128
75      	490997846898	137
75      	572878568883	132
75      	749193678427	142
75      	709229053555	144
75      	430946284790	72
75      	633320411611	109
75      	316871031375	135
76      	896919583724	72
76      	590034051433	141
76      	902956788286	133
76      	312237459250	62
76      	265444172694	78
76      	873640709962	146
76      	679453075525	135
76      	509762284879	81
76      	227635917829	64
76      	234646454745	124
76      	654563447110	54
76      	696368469198	147
76      	833663232208	91
76      	945312847530	58
76      	381299535788	107
76      	383476286895	53
76      	636021875565	65
76      	566877828296	81
76      	203262278452	84
76      	882152991390	127
76      	877194198700	78
76      	364745567029	137
76      	578705048123	123
76      	547685258313	94
76      	697814031389	74
76      	411067277447	98
76      	379942304309	131
76      	419446364450	71
76      	732970729968	64
76      	893005812666	130
76      	740581174440	58
76      	435583017631	128
76      	317663070530	130
76      	113476782830	87
76      	786975743876	149
76      	996103067914	99
76      	803607788754	86
76      	770565227675	143
76      	814141265887	50
76      	589814450967	62
76      	409542246104	144
76      	749193678427	96
76      	144568875894	65
76      	608852371253	93
76      	816260222588	76
76      	861348595761	92
76      	132186536765	56
76      	482340522139	141
76      	316871031375	118
76      	430946284790	65
76      	875605607431	65
76      	174237001203	137
76      	962728896848	147
76      	511511692317	143
76      	117431954043	54
76      	754664511022	107
76      	274761600136	145
76      	939369924082	70
76      	482429892907	91
76      	709229053555	78
76      	941976384328	124
76      	643925479319	120
76      	863129185304	121
76      	189470486214	83
76      	435122760857	72
76      	127026679653	143
76      	514254550616	117
76      	775611741635	148
76      	525199185853	106
76      	308440276732	137
76      	108649313374	114
76      	576518370019	55
76      	453357640486	74
76      	986065693858	73
76      	702830548447	83
76      	839518983686	131
76      	769357296879	139
76      	750886611187	75
76      	899657914264	74
76      	919197823026	147
76      	167742802915	89
76      	384179652400	142
76      	646511826677	81
76      	176404904473	90
76      	600770885624	56
76      	349330324726	81
77      	134390993040	55
77      	334074319971	99
77      	272121204465	109
77      	769357296879	117
77      	322758894316	99
77      	578147508823	69
77      	482340522139	61
77      	869112308003	138
77      	377848719039	71
77      	373709485267	92
77      	457459442332	92
77      	786975743876	79
77      	525199185853	96
77      	933914210509	78
77      	189470486214	85
77      	875605607431	83
77      	349330324726	141
77      	411067277447	62
77      	962728896848	67
77      	557899454410	87
77      	803607788754	136
77      	103362565865	134
77      	388403878360	71
77      	518787417161	113
77      	227635917829	54
77      	945012228482	74
77      	495776106616	72
77      	108649313374	94
77      	208174494479	88
77      	412348931569	78
77      	129753980851	135
77      	67014520356 	89
77      	286243122717	135
77      	467986934495	87
77      	126834215166	87
77      	108326062706	123
77      	140903716305	65
77      	590034051433	76
77      	749625390019	67
77      	210526151030	76
77      	979700065093	141
77      	721857506010	122
77      	654563447110	98
77      	450659382698	111
77      	941976384328	78
77      	706236730898	65
77      	923237099384	125
77      	902956788286	112
77      	904647940449	134
77      	419481071217	76
77      	697814031389	81
77      	563144943925	100
77      	998040421944	116
77      	435122760857	150
77      	234646454745	60
77      	702830548447	123
77      	608852371253	126
77      	871701186034	102
77      	569219762080	111
77      	400930079611	118
77      	770565227675	80
77      	568658660566	128
77      	939369924082	140
77      	194144382996	62
77      	636021875565	90
77      	159425007904	77
77      	740581174440	96
77      	646511826677	142
77      	952550789390	84
77      	113476782830	53
77      	838962966418	59
77      	816260222588	94
77      	529831629045	93
77      	364745567029	135
77      	863129185304	79
77      	349435998924	55
77      	696368469198	58
77      	139669412174	137
77      	919197823026	116
77      	709229053555	70
77      	859109096191	142
77      	882152991390	96
77      	618570550236	69
77      	425456990082	63
77      	176404904473	142
77      	527453991710	148
77      	836900805029	58
77      	506298714832	90
77      	805966823208	94
77      	554521191996	105
77      	875125493289	110
78      	999543417737	68
78      	948543507361	128
78      	862174790606	128
78      	838962966418	61
78      	154554749200	147
78      	272121204465	58
78      	140903716305	98
78      	265444172694	132
78      	330700905340	148
78      	732970729968	92
78      	944472664850	50
78      	590034051433	113
78      	833663232208	58
78      	457459442332	64
78      	336491915536	117
78      	859109096191	80
78      	643925479319	121
78      	118389501460	99
78      	486804801433	95
78      	692492393712	59
78      	877194198700	99
78      	642234808130	92
78      	709229053555	124
78      	982079076090	78
78      	467986934495	56
78      	578705048123	76
78      	740581174440	141
78      	339589987290	123
78      	187272692439	127
78      	152614854189	100
78      	308440276732	119
78      	765572003296	60
78      	527453991710	123
78      	284083366181	64
78      	578147508823	59
78      	849681336901	130
78      	373709485267	125
78      	576518370019	112
78      	618570550236	69
78      	630929030795	54
78      	979700065093	53
78      	414652410482	68
78      	425456990082	144
78      	904647940449	127
78      	297083512852	125
78      	554521191996	100
78      	629919786056	55
79      	189470486214	137
79      	411067277447	98
79      	630929030795	102
79      	838962966418	126
79      	435583017631	105
79      	649921994715	72
79      	132954606361	80
79      	419481071217	58
79      	629919786056	127
79      	373709485267	102
79      	467615168772	58
79      	430946284790	92
79      	516286957430	106
79      	159425007904	84
79      	873640709962	112
79      	129753980851	55
79      	904647940449	115
79      	558886167633	110
79      	899657914264	137
79      	986065693858	142
79      	108326062706	104
79      	869112308003	112
79      	330700905340	112
79      	506298714832	66
79      	444797600349	98
79      	654563447110	69
79      	646511826677	72
79      	317663070530	134
79      	603333456348	65
79      	875125493289	65
79      	563144943925	76
79      	566877828296	89
79      	308792010934	137
79      	297083512852	97
79      	435122760857	84
79      	486804801433	74
79      	996103067914	92
79      	698718941817	89
79      	134390993040	109
79      	334425348148	54
79      	208174494479	142
78      	389169531271	129
78      	383476286895	118
78      	549746556299	145
79      	775611741635	63
79      	816260222588	52
79      	516495915668	55
79      	118389501460	67
79      	706236730898	111
79      	643925479319	140
79      	771137437634	148
79      	274761600136	105
79      	882152991390	93
79      	916984241291	104
79      	457459442332	74
79      	349330324726	83
79      	547244118460	110
79      	952550789390	84
79      	421337093409	123
79      	923237099384	99
79      	608852371253	65
79      	721857506010	142
79      	642234808130	110
79      	569219762080	108
79      	518329844939	114
79      	180531962334	96
79      	919197823026	57
79      	939369924082	53
79      	896919583724	130
79      	696368469198	128
79      	482340522139	94
79      	861348595761	76
79      	786975743876	67
79      	349435998924	55
79      	754664511022	52
79      	660310920540	68
79      	250617599940	73
79      	199968033019	73
79      	207178796787	90
79      	154554749200	80
79      	576518370019	61
79      	999543417737	140
79      	673737891943	50
79      	740581174440	138
79      	412348931569	131
79      	173672457176	81
79      	803607788754	54
79      	877194198700	120
79      	246144606961	144
79      	556388862616	113
79      	126834215166	92
79      	534109743798	98
79      	467986934495	125
79      	300475101700	149
79      	525199185853	54
79      	944472664850	140
79      	67014520356 	66
79      	514254550616	147
79      	203262278452	135
79      	117431954043	132
79      	172950643766	69
79      	284083366181	82
79      	261188186216	132
79      	508818965558	142
79      	933914210509	54
79      	839518983686	138
79      	127026679653	130
79      	572878568883	61
79      	364745567029	106
79      	863129185304	63
79      	750886611187	64
79      	557899454410	130
79      	473186595371	84
79      	702830548447	74
79      	718971287692	79
79      	554521191996	54
79      	893005812666	141
79      	925173129386	55
79      	887528437482	56
79      	776538360607	109
79      	859109096191	88
79      	547685258313	131
79      	286243122717	137
79      	490997846898	75
79      	483738463713	116
79      	578147508823	108
79      	383476286895	145
79      	716818652888	80
79      	948543507361	116
79      	633320411611	136
79      	398900612810	107
79      	400127531270	115
79      	103362565865	56
79      	140903716305	69
79      	770565227675	67
79      	413227470171	127
79      	749625390019	88
80      	899657914264	101
80      	716818652888	124
80      	272121204465	115
80      	572878568883	61
80      	549746556299	54
80      	740581174440	131
80      	388403878360	58
80      	187272692439	83
80      	962728896848	60
80      	776538360607	84
80      	769357296879	65
80      	167742802915	98
80      	189470486214	53
80      	375276903331	59
80      	316871031375	96
80      	488529033803	74
80      	805966823208	111
80      	516495915668	126
80      	511511692317	102
80      	836900805029	52
80      	127026679653	113
80      	554521191996	111
80      	945312847530	135
80      	750886611187	74
80      	297083512852	62
80      	849681336901	145
80      	518787417161	66
80      	246144606961	121
80      	916984241291	109
80      	877194198700	144
80      	941976384328	133
80      	400127531270	122
80      	982079076090	91
80      	952550789390	139
80      	999543417737	51
80      	300475101700	72
80      	314482481265	110
80      	646511826677	99
80      	718971287692	133
80      	506298714832	141
80      	210526151030	123
80      	534109743798	61
80      	264132323061	110
80      	706236730898	127
80      	775611741635	149
80      	418604295928	105
80      	566877828296	123
80      	518329844939	147
80      	679453075525	53
80      	871701186034	142
80      	380734371410	118
80      	654563447110	140
80      	770565227675	97
80      	563144943925	112
80      	861348595761	133
80      	749193678427	69
80      	132954606361	100
80      	556388862616	90
80      	741544174664	109
80      	603333456348	134
80      	862174790606	104
80      	457459442332	145
80      	168074802141	137
80      	227635917829	57
80      	590034051433	145
80      	863129185304	93
80      	979700065093	69
80      	996103067914	72
80      	113476782830	54
80      	669515708071	126
80      	435122760857	84
80      	925173129386	69
80      	383476286895	139
80      	754664511022	59
80      	364745567029	113
80      	154554749200	86
80      	286243122717	129
80      	207178796787	58
80      	495776106616	134
80      	923237099384	108
80      	803607788754	68
80      	529831629045	84
80      	349330324726	128
80      	398900612810	85
80      	450659382698	58
80      	134390993040	66
80      	948543507361	147
80      	330700905340	82
80      	673737891943	110
80      	660310920540	70
80      	261188186216	138
80      	126834215166	122
80      	482429892907	116
80      	473186595371	148
80      	558886167633	87
80      	508818965558	70
81      	398900612810	69
81      	180531962334	122
81      	649921994715	145
81      	250617599940	100
81      	400127531270	118
81      	636021875565	91
81      	294993047536	98
81      	646511826677	109
81      	529831629045	104
81      	117431954043	101
81      	925484684473	126
81      	558886167633	68
81      	420756960291	53
81      	721857506010	123
81      	986202008726	137
81      	381299535788	105
81      	669515708071	107
81      	716818652888	123
81      	349435998924	111
81      	187272692439	83
81      	450659382698	138
81      	412348931569	91
81      	308440276732	58
81      	630929030795	145
81      	203262278452	76
81      	421337093409	84
81      	786975743876	141
81      	859109096191	84
81      	159425007904	80
81      	482429892907	120
81      	132954606361	146
81      	836900805029	116
81      	514254550616	60
81      	272121204465	64
81      	349330324726	57
81      	67014520356 	84
81      	380734371410	67
81      	384468659793	118
81      	127026679653	78
81      	516495915668	128
81      	896919583724	145
81      	118389501460	100
81      	982079076090	101
81      	887528437482	78
81      	467615168772	102
81      	129753980851	124
81      	673737891943	103
81      	425456990082	52
81      	861348595761	127
81      	709229053555	62
81      	642234808130	125
81      	654563447110	51
81      	871701186034	78
81      	419446364450	58
81      	207178796787	111
81      	741544174664	143
81      	154554749200	116
81      	765572003296	128
81      	444797600349	60
81      	952550789390	53
81      	495776106616	62
81      	205930062465	131
81      	139669412174	108
81      	894482053097	126
81      	882152991390	88
81      	375276903331	125
81      	996103067914	124
81      	388403878360	128
81      	300475101700	76
81      	643925479319	74
81      	286243122717	142
81      	899657914264	137
81      	252522255166	62
82      	308792010934	55
82      	568658660566	127
82      	771137437634	77
82      	941976384328	52
82      	893005812666	114
82      	962728896848	76
82      	297083512852	103
82      	702830548447	146
82      	590034051433	74
82      	859109096191	109
82      	467986934495	81
82      	286243122717	130
82      	159425007904	71
82      	207178796787	59
82      	534109743798	74
82      	409542246104	117
82      	398900612810	99
82      	572878568883	87
82      	803607788754	90
82      	948543507361	124
82      	486804801433	50
82      	996103067914	59
82      	916984241291	118
82      	600770885624	87
82      	322758894316	109
82      	349435998924	78
82      	400127531270	145
82      	152614854189	121
82      	384179652400	54
82      	578705048123	64
82      	364745567029	143
82      	754664511022	93
82      	380734371410	113
82      	132186536765	50
82      	516495915668	50
82      	836900805029	87
82      	139669412174	60
82      	168074802141	123
82      	877194198700	93
82      	547244118460	122
82      	144568875894	79
82      	488529033803	97
82      	290827207620	117
82      	174237001203	83
82      	349330324726	86
82      	649921994715	108
82      	146051347589	54
82      	334074319971	148
82      	336491915536	53
82      	511511692317	77
82      	176404904473	101
82      	108649313374	77
82      	919197823026	123
82      	379942304309	124
82      	923237099384	99
82      	979700065093	105
82      	669515708071	52
82      	514254550616	127
82      	339589987290	142
82      	692492393712	112
82      	589814450967	119
82      	887528437482	133
82      	839518983686	110
82      	722946564026	120
82      	199753522658	138
82      	419446364450	121
82      	509762284879	137
82      	636021875565	130
82      	873640709962	112
82      	518329844939	127
82      	413227470171	51
82      	679453075525	75
82      	986065693858	111
82      	113476782830	59
82      	300475101700	52
82      	435122760857	123
82      	482429892907	96
82      	506298714832	116
82      	894482053097	104
82      	473186595371	103
82      	673737891943	147
82      	316871031375	137
82      	418604295928	112
82      	308440276732	61
82      	696368469198	118
82      	453357640486	99
82      	642234808130	115
82      	554521191996	141
82      	525199185853	74
82      	108326062706	118
82      	412348931569	125
82      	849681336901	70
82      	317663070530	132
82      	718971287692	123
82      	189470486214	83
82      	875125493289	107
82      	180531962334	116
82      	132954606361	77
82      	558886167633	148
82      	716818652888	53
82      	528771298719	55
82      	706236730898	84
82      	578147508823	103
82      	556388862616	63
82      	863129185304	101
82      	994411186239	84
83      	859109096191	147
83      	450659382698	110
83      	603333456348	59
83      	316871031375	122
83      	227635917829	71
83      	568658660566	75
83      	875605607431	126
83      	839518983686	53
83      	572878568883	69
83      	134390993040	63
83      	718971287692	137
83      	467986934495	116
83      	189470486214	89
83      	563144943925	69
83      	750886611187	87
83      	534109743798	53
83      	152614854189	80
83      	317663070530	105
83      	636021875565	117
83      	998040421944	97
83      	776538360607	57
83      	945312847530	117
83      	132954606361	147
83      	388403878360	148
83      	252522255166	144
83      	207178796787	127
83      	108649313374	109
83      	509762284879	137
83      	349435998924	125
83      	467615168772	82
83      	264132323061	62
83      	882152991390	89
83      	646511826677	130
83      	144568875894	138
83      	516286957430	149
83      	349330324726	84
83      	334074319971	145
83      	290827207620	129
83      	529831629045	62
83      	322758894316	111
83      	187272692439	130
83      	336491915536	80
83      	398900612810	125
83      	962728896848	52
83      	453357640486	144
83      	430946284790	107
83      	286243122717	105
83      	176404904473	122
83      	732970729968	124
83      	979700065093	148
83      	944472664850	57
83      	250617599940	86
83      	549746556299	125
83      	180531962334	106
83      	159425007904	148
83      	986065693858	60
83      	556388862616	94
83      	875125493289	63
83      	284083366181	77
83      	208174494479	104
83      	814141265887	143
83      	721857506010	131
83      	409542246104	87
83      	629919786056	121
83      	994411186239	150
83      	578705048123	109
83      	384468659793	98
83      	589814450967	141
83      	669515708071	100
83      	330700905340	74
83      	816260222588	105
83      	490997846898	126
83      	435122760857	147
83      	569219762080	95
83      	769357296879	109
83      	986202008726	73
83      	933914210509	73
83      	518787417161	54
83      	896919583724	56
83      	833663232208	102
83      	210526151030	63
83      	308440276732	75
83      	199968033019	60
83      	375276903331	57
83      	488529033803	105
83      	649921994715	145
83      	297083512852	96
83      	557899454410	123
83      	803607788754	105
83      	939369924082	82
83      	722946564026	65
83      	113476782830	101
83      	868744054130	71
83      	400930079611	52
83      	630929030795	85
83      	381299535788	105
83      	246144606961	107
83      	473186595371	114
83      	525199185853	104
83      	919197823026	134
83      	444797600349	62
83      	511511692317	78
83      	457459442332	61
83      	887528437482	140
83      	400127531270	113
83      	771137437634	141
83      	600770885624	77
83      	673737891943	103
83      	805966823208	62
83      	425456990082	63
83      	334425348148	145
83      	838962966418	115
84      	814141265887	144
84      	421337093409	76
84      	139669412174	85
84      	127026679653	70
84      	297083512852	138
84      	569219762080	126
84      	409542246104	77
84      	696368469198	122
84      	506298714832	73
84      	377848719039	114
84      	952550789390	127
84      	373709485267	126
84      	227635917829	134
84      	250617599940	118
84      	572878568883	107
84      	718971287692	142
84      	435583017631	115
84      	556388862616	77
84      	187272692439	91
84      	207178796787	69
84      	317663070530	114
84      	603333456348	132
84      	534109743798	109
84      	473186595371	77
84      	945312847530	115
84      	274761600136	81
84      	300475101700	58
84      	629919786056	108
84      	716818652888	117
84      	996103067914	102
84      	803607788754	122
84      	568658660566	75
84      	590034051433	129
84      	697814031389	147
84      	770565227675	57
84      	508818965558	110
84      	514254550616	121
84      	643925479319	123
84      	529831629045	50
84      	334074319971	89
84      	986202008726	91
84      	383476286895	124
84      	467615168772	68
84      	286243122717	125
84      	180531962334	141
84      	649921994715	130
84      	702421087613	120
84      	511511692317	56
84      	862174790606	98
84      	252522255166	88
84      	861348595761	138
84      	547685258313	76
84      	210526151030	67
84      	875125493289	67
84      	771137437634	146
84      	400930079611	94
84      	679453075525	73
84      	962728896848	138
84      	525199185853	54
84      	264132323061	140
84      	205930062465	70
84      	140903716305	120
84      	380734371410	61
84      	863129185304	111
84      	482340522139	51
84      	246144606961	118
84      	899657914264	89
84      	549746556299	65
84      	816260222588	77
84      	563144943925	140
84      	528771298719	115
84      	375276903331	147
84      	979700065093	86
84      	208174494479	105
84      	435122760857	114
84      	349435998924	110
84      	986065693858	128
84      	877194198700	99
84      	941976384328	135
84      	765572003296	116
84      	322758894316	55
84      	265444172694	59
84      	234646454745	95
84      	189470486214	123
84      	379942304309	81
84      	776538360607	139
84      	948543507361	135
84      	636021875565	139
84      	578147508823	130
84      	495776106616	99
84      	334425348148	72
84      	836900805029	142
84      	721857506010	79
84      	420756960291	120
84      	566877828296	90
84      	576518370019	130
84      	152614854189	101
84      	558886167633	121
84      	873640709962	55
84      	919197823026	124
84      	467986934495	66
84      	732970729968	79
84      	838962966418	98
85      	732970729968	114
85      	412348931569	139
85      	180531962334	78
85      	132186536765	90
85      	692492393712	110
85      	754664511022	143
85      	642234808130	82
85      	569219762080	58
85      	381299535788	140
85      	629919786056	92
85      	527453991710	71
85      	716818652888	76
85      	297083512852	106
85      	525199185853	116
85      	749625390019	50
85      	146051347589	139
85      	364745567029	108
85      	516495915668	122
85      	511511692317	56
85      	227635917829	113
85      	590034051433	148
85      	630929030795	74
85      	776538360607	85
85      	933914210509	117
85      	514254550616	131
85      	103362565865	111
85      	330700905340	112
85      	925173129386	89
85      	962728896848	86
85      	887528437482	143
85      	523196696835	108
85      	679453075525	97
85      	709229053555	107
85      	547244118460	94
85      	608852371253	77
85      	696368469198	146
85      	414652410482	117
85      	373709485267	104
85      	187272692439	148
85      	769357296879	56
85      	199968033019	107
85      	945012228482	60
85      	419481071217	68
85      	863129185304	110
85      	453357640486	137
85      	488529033803	80
85      	771137437634	131
85      	450659382698	93
85      	379942304309	62
85      	482429892907	50
85      	473186595371	92
85      	409542246104	112
85      	770565227675	119
85      	139669412174	82
85      	483738463713	119
85      	495776106616	105
85      	389169531271	99
85      	317663070530	105
85      	252522255166	77
85      	528771298719	147
85      	986065693858	104
85      	741544174664	106
85      	979700065093	107
85      	132954606361	76
85      	210526151030	99
85      	568658660566	63
85      	875125493289	84
85      	603333456348	50
85      	312237459250	66
85      	999543417737	145
85      	536851950801	64
85      	322758894316	79
85      	836900805029	130
85      	718971287692	83
85      	518787417161	77
85      	159425007904	138
86      	272121204465	108
86      	527453991710	113
86      	126834215166	116
86      	152614854189	63
86      	816260222588	84
86      	264132323061	50
86      	418604295928	136
86      	776538360607	129
86      	803607788754	101
86      	317663070530	69
86      	649921994715	120
86      	536851950801	131
86      	108326062706	123
86      	265444172694	149
86      	294993047536	83
86      	771137437634	59
86      	618570550236	129
86      	511511692317	91
86      	904647940449	66
86      	322758894316	94
86      	589814450967	124
86      	709229053555	61
86      	887528437482	120
86      	716818652888	71
86      	896919583724	117
86      	925173129386	140
86      	721857506010	109
86      	330700905340	89
86      	450659382698	66
86      	875605607431	75
86      	660310920540	103
86      	420756960291	108
86      	941976384328	76
86      	952550789390	54
86      	349330324726	108
86      	314482481265	71
86      	518787417161	113
86      	636021875565	111
86      	554521191996	112
86      	380734371410	73
86      	673737891943	59
86      	939369924082	59
86      	679453075525	50
86      	697814031389	115
86      	210526151030	51
86      	419481071217	130
86      	706236730898	126
86      	754664511022	127
86      	769357296879	86
86      	698718941817	67
86      	525199185853	121
86      	894482053097	98
86      	514254550616	71
86      	173672457176	147
86      	384179652400	54
86      	558886167633	140
86      	284083366181	146
86      	518329844939	104
86      	643925479319	83
86      	411067277447	128
86      	300475101700	128
86      	252522255166	143
86      	838962966418	78
86      	702830548447	59
86      	572878568883	67
86      	490997846898	58
86      	132186536765	87
86      	549746556299	148
86      	144568875894	67
86      	250617599940	81
86      	868744054130	101
86      	534109743798	53
86      	871701186034	128
86      	547685258313	127
86      	786975743876	140
86      	339589987290	140
86      	814141265887	127
86      	414652410482	149
86      	467986934495	112
86      	364745567029	103
86      	488529033803	54
86      	290827207620	136
86      	208174494479	101
86      	916984241291	50
86      	297083512852	117
86      	590034051433	67
86      	508818965558	84
86      	873640709962	53
86      	398900612810	63
86      	381299535788	55
86      	516286957430	133
86      	400127531270	137
86      	334074319971	93
86      	642234808130	99
86      	482340522139	96
86      	132954606361	138
86      	203262278452	126
86      	982079076090	68
86      	600770885624	75
86      	765572003296	60
86      	849681336901	138
86      	669515708071	54
86      	630929030795	135
86      	473186595371	85
86      	556388862616	120
86      	893005812666	85
86      	563144943925	65
86      	316871031375	127
86      	127026679653	131
86      	770565227675	53
86      	134390993040	114
86      	453357640486	147
86      	375276903331	69
86      	261188186216	76
86      	388403878360	118
86      	646511826677	78
86      	569219762080	106
86      	154554749200	132
86      	732970729968	103
86      	986065693858	140
86      	482429892907	58
86      	139669412174	60
86      	749625390019	121
86      	828509049873	147
86      	435583017631	129
87      	945012228482	118
87      	330700905340	77
87      	265444172694	61
87      	506298714832	77
87      	608852371253	140
87      	421337093409	71
87      	518787417161	134
87      	528771298719	129
87      	384179652400	111
87      	563144943925	82
87      	511511692317	124
87      	771137437634	88
87      	339589987290	79
87      	516495915668	81
87      	962728896848	65
87      	805966823208	139
87      	250617599940	128
87      	334425348148	146
87      	643925479319	69
87      	227635917829	57
87      	875605607431	148
87      	126834215166	143
87      	600770885624	126
87      	904647940449	78
87      	322758894316	77
87      	646511826677	115
87      	721857506010	118
87      	654563447110	107
87      	286243122717	138
87      	379942304309	142
87      	702421087613	72
87      	349330324726	119
87      	144568875894	86
87      	636021875565	87
87      	770565227675	76
87      	180531962334	75
87      	450659382698	126
87      	210526151030	86
87      	979700065093	136
87      	132954606361	101
87      	859109096191	82
87      	203262278452	70
87      	389169531271	64
87      	998040421944	66
87      	749193678427	64
87      	982079076090	112
87      	467986934495	79
87      	669515708071	96
87      	630929030795	97
87      	697814031389	143
87      	986202008726	62
87      	420756960291	93
87      	814141265887	103
87      	208174494479	56
87      	525199185853	56
87      	486804801433	145
87      	134390993040	66
87      	159425007904	75
87      	692492393712	54
87      	952550789390	75
87      	314482481265	119
87      	246144606961	140
87      	996103067914	74
87      	108326062706	101
87      	67014520356 	56
87      	187272692439	96
87      	877194198700	86
87      	633320411611	104
87      	899657914264	79
87      	168074802141	113
87      	603333456348	124
87      	297083512852	107
87      	139669412174	114
87      	923237099384	56
87      	572878568883	56
87      	308792010934	80
87      	518329844939	129
87      	749625390019	75
87      	589814450967	73
87      	207178796787	138
87      	576518370019	130
87      	741544174664	119
87      	264132323061	97
87      	483738463713	53
87      	509762284879	89
87      	495776106616	85
87      	400930079611	139
87      	882152991390	65
87      	869112308003	63
87      	317663070530	122
87      	398900612810	145
87      	140903716305	59
87      	482340522139	102
87      	252522255166	105
87      	945312847530	146
87      	384468659793	78
87      	722946564026	67
87      	129753980851	52
87      	740581174440	57
87      	419481071217	88
87      	482429892907	72
87      	754664511022	55
87      	349435998924	133
87      	167742802915	129
87      	174237001203	81
87      	547685258313	131
87      	274761600136	51
87      	172950643766	99
87      	308440276732	55
87      	861348595761	134
87      	709229053555	76
87      	750886611187	64
87      	838962966418	140
87      	896919583724	134
87      	418604295928	149
87      	887528437482	57
87      	516286957430	118
87      	868744054130	119
87      	828509049873	57
87      	776538360607	83
87      	430946284790	61
87      	999543417737	149
87      	769357296879	80
87      	103362565865	101
87      	176404904473	88
87      	294993047536	96
87      	527453991710	150
87      	649921994715	105
87      	732970729968	118
87      	871701186034	149
87      	373709485267	93
88      	828509049873	99
88      	207178796787	54
88      	67014520356 	62
88      	419446364450	107
88      	246144606961	93
88      	450659382698	124
88      	882152991390	50
88      	264132323061	88
88      	996103067914	97
88      	103362565865	101
88      	952550789390	59
88      	919197823026	106
88      	140903716305	62
88      	126834215166	92
88      	286243122717	79
88      	805966823208	108
88      	388403878360	99
88      	600770885624	78
88      	172950643766	64
88      	411067277447	73
88      	554521191996	59
88      	381299535788	102
88      	718971287692	77
88      	769357296879	70
88      	389169531271	59
88      	776538360607	140
88      	669515708071	132
88      	945312847530	68
88      	649921994715	135
88      	146051347589	148
88      	556388862616	84
88      	660310920540	141
88      	962728896848	93
88      	518787417161	64
88      	495776106616	64
88      	859109096191	52
88      	862174790606	52
88      	578705048123	140
88      	814141265887	114
88      	765572003296	98
88      	457459442332	136
88      	272121204465	52
88      	646511826677	133
88      	706236730898	145
88      	740581174440	102
88      	654563447110	61
88      	330700905340	125
88      	208174494479	146
88      	567657950596	111
88      	722946564026	113
88      	986202008726	128
88      	572878568883	92
88      	511511692317	53
88      	384179652400	70
88      	618570550236	74
88      	274761600136	141
88      	523196696835	146
88      	568658660566	52
88      	979700065093	101
88      	322758894316	116
89      	297083512852	86
89      	868744054130	139
89      	875125493289	114
89      	486804801433	68
89      	849681336901	126
89      	207178796787	100
89      	377848719039	120
89      	457459442332	125
89      	871701186034	140
89      	129753980851	110
89      	516495915668	84
89      	945312847530	136
89      	381299535788	136
89      	549746556299	123
89      	132954606361	74
89      	944472664850	115
89      	894482053097	57
89      	199753522658	53
89      	630929030795	54
89      	490997846898	86
89      	750886611187	99
89      	118389501460	55
89      	642234808130	101
89      	986202008726	127
89      	633320411611	53
89      	336491915536	104
89      	421337093409	96
89      	308792010934	76
89      	770565227675	52
89      	554521191996	68
89      	572878568883	115
89      	589814450967	59
89      	412348931569	87
89      	875605607431	91
89      	945012228482	84
89      	673737891943	59
89      	117431954043	97
89      	933914210509	147
89      	646511826677	110
89      	569219762080	79
89      	769357296879	90
89      	887528437482	98
89      	400930079611	71
89      	941976384328	93
89      	527453991710	148
89      	803607788754	99
89      	414652410482	138
89      	925173129386	98
89      	523196696835	124
89      	205930062465	54
89      	696368469198	107
89      	274761600136	143
89      	511511692317	80
89      	210526151030	113
89      	603333456348	131
89      	208174494479	130
89      	425456990082	98
89      	679453075525	75
89      	919197823026	64
89      	349435998924	51
89      	334425348148	99
89      	488529033803	64
89      	567657950596	88
89      	636021875565	56
89      	516286957430	58
89      	103362565865	105
89      	754664511022	75
89      	529831629045	57
89      	419481071217	139
89      	317663070530	131
89      	284083366181	126
89      	718971287692	129
89      	775611741635	73
89      	435122760857	121
89      	899657914264	96
89      	294993047536	119
89      	384179652400	87
89      	194144382996	80
89      	528771298719	147
89      	994411186239	89
89      	643925479319	85
89      	411067277447	83
89      	816260222588	67
89      	962728896848	129
89      	706236730898	53
89      	692492393712	133
89      	740581174440	95
89      	409542246104	119
89      	660310920540	68
89      	67014520356 	116
89      	557899454410	150
89      	467615168772	89
89      	882152991390	106
89      	482340522139	115
89      	702830548447	58
89      	948543507361	118
89      	286243122717	114
89      	859109096191	59
89      	134390993040	98
89      	649921994715	64
89      	364745567029	146
89      	534109743798	130
89      	566877828296	71
90      	873640709962	78
90      	336491915536	65
90      	400127531270	98
90      	803607788754	95
90      	568658660566	65
90      	982079076090	75
90      	483738463713	101
90      	916984241291	130
90      	482429892907	121
90      	578705048123	85
90      	290827207620	137
90      	836900805029	71
90      	558886167633	103
90      	180531962334	147
90      	572878568883	60
90      	444797600349	101
90      	877194198700	79
90      	749193678427	101
90      	887528437482	145
90      	152614854189	52
90      	286243122717	93
90      	576518370019	137
90      	300475101700	112
90      	603333456348	110
90      	986065693858	94
90      	272121204465	97
90      	144568875894	103
90      	770565227675	52
90      	660310920540	81
90      	129753980851	73
90      	902956788286	88
90      	330700905340	76
90      	547685258313	134
90      	194144382996	68
90      	398900612810	99
90      	316871031375	128
90      	419481071217	64
90      	250617599940	124
90      	159425007904	114
90      	816260222588	135
90      	509762284879	53
90      	317663070530	125
90      	952550789390	71
90      	697814031389	142
90      	567657950596	122
90      	234646454745	75
90      	721857506010	116
90      	199968033019	105
90      	167742802915	88
90      	168074802141	123
90      	388403878360	100
90      	996103067914	98
90      	381299535788	54
90      	998040421944	69
90      	430946284790	76
90      	775611741635	148
90      	523196696835	124
90      	154554749200	127
90      	189470486214	145
90      	948543507361	66
90      	673737891943	110
90      	413227470171	129
90      	862174790606	87
90      	383476286895	84
90      	294993047536	66
90      	776538360607	86
90      	173672457176	132
90      	284083366181	138
90      	875605607431	108
90      	698718941817	80
90      	205930062465	50
90      	377848719039	133
90      	859109096191	98
90      	979700065093	142
90      	939369924082	83
90      	108326062706	104
90      	833663232208	131
90      	919197823026	117
90      	904647940449	108
90      	765572003296	110
90      	308440276732	69
90      	134390993040	56
90      	578147508823	123
90      	718971287692	129
90      	414652410482	146
90      	518787417161	81
90      	113476782830	61
90      	490997846898	118
90      	118389501460	84
90      	140903716305	119
90      	566877828296	62
90      	227635917829	63
90      	174237001203	118
90      	941976384328	106
90      	525199185853	146
90      	495776106616	81
90      	421337093409	141
90      	589814450967	57
90      	67014520356 	139
90      	265444172694	68
90      	608852371253	103
90      	962728896848	123
90      	203262278452	69
90      	945012228482	77
90      	750886611187	121
90      	349330324726	81
91      	421337093409	98
91      	636021875565	122
91      	364745567029	109
91      	836900805029	111
91      	716818652888	81
91      	194144382996	70
91      	375276903331	80
91      	740581174440	86
91      	887528437482	149
91      	527453991710	126
91      	998040421944	109
91      	483738463713	116
91      	718971287692	134
91      	400930079611	54
91      	103362565865	117
91      	939369924082	62
91      	383476286895	85
91      	925484684473	138
91      	849681336901	80
91      	741544174664	95
91      	174237001203	75
91      	549746556299	77
91      	272121204465	83
91      	996103067914	85
91      	709229053555	96
91      	600770885624	106
91      	979700065093	83
91      	286243122717	118
91      	457459442332	87
91      	528771298719	64
91      	134390993040	61
91      	336491915536	135
91      	511511692317	120
91      	113476782830	53
91      	578705048123	87
91      	339589987290	120
91      	490997846898	107
91      	508818965558	88
91      	534109743798	95
91      	732970729968	131
91      	418604295928	98
91      	556388862616	122
91      	377848719039	81
91      	771137437634	92
91      	982079076090	141
91      	962728896848	91
91      	425456990082	54
91      	629919786056	109
91      	603333456348	107
91      	187272692439	71
91      	838962966418	99
91      	925173129386	60
91      	563144943925	142
91      	334074319971	114
91      	411067277447	66
91      	944472664850	119
91      	388403878360	114
91      	514254550616	112
91      	706236730898	113
91      	916984241291	57
91      	167742802915	74
91      	557899454410	50
91      	199968033019	145
91      	904647940449	146
91      	816260222588	68
91      	189470486214	68
91      	210526151030	95
91      	899657914264	131
91      	430946284790	88
91      	506298714832	119
91      	334425348148	100
91      	308792010934	126
91      	495776106616	50
91      	871701186034	103
91      	467986934495	77
91      	875125493289	95
91      	642234808130	90
91      	205930062465	114
91      	839518983686	75
91      	558886167633	84
91      	986202008726	111
91      	132186536765	53
91      	529831629045	128
91      	265444172694	87
91      	108649313374	65
91      	312237459250	83
91      	398900612810	93
91      	308440276732	83
91      	554521191996	91
91      	126834215166	55
91      	509762284879	133
91      	567657950596	116
91      	646511826677	63
91      	132954606361	111
91      	234646454745	51
91      	389169531271	121
91      	518329844939	99
91      	589814450967	99
91      	414652410482	70
91      	435122760857	60
91      	786975743876	147
91      	896919583724	54
91      	152614854189	98
91      	833663232208	136
91      	749193678427	108
91      	933914210509	99
91      	869112308003	95
91      	146051347589	59
91      	409542246104	122
91      	168074802141	100
91      	208174494479	58
91      	140903716305	69
91      	482340522139	117
91      	264132323061	140
91      	868744054130	106
91      	450659382698	120
91      	516286957430	114
91      	999543417737	104
91      	516495915668	145
91      	159425007904	63
91      	770565227675	80
91      	322758894316	69
91      	290827207620	126
91      	769357296879	93
91      	373709485267	60
91      	250617599940	129
91      	566877828296	67
91      	765572003296	74
91      	419481071217	80
91      	660310920540	118
91      	882152991390	123
91      	692492393712	54
91      	568658660566	123
91      	754664511022	127
91      	877194198700	103
92      	646511826677	75
92      	67014520356 	76
92      	816260222588	59
92      	334425348148	110
92      	660310920540	140
92      	412348931569	125
92      	334074319971	131
92      	187272692439	136
92      	300475101700	96
92      	578705048123	86
92      	384179652400	58
92      	722946564026	67
92      	450659382698	77
92      	633320411611	103
92      	127026679653	108
92      	129753980851	95
92      	893005812666	62
92      	945312847530	101
92      	486804801433	144
92      	979700065093	118
92      	199968033019	102
92      	400127531270	114
92      	482340522139	57
92      	384468659793	56
92      	998040421944	61
92      	838962966418	96
92      	765572003296	88
92      	902956788286	140
92      	786975743876	119
92      	941976384328	83
92      	534109743798	78
92      	696368469198	136
92      	749625390019	128
92      	516286957430	140
92      	312237459250	129
92      	490997846898	57
92      	904647940449	64
92      	525199185853	73
92      	673737891943	128
92      	776538360607	89
92      	803607788754	100
92      	339589987290	150
92      	750886611187	87
92      	999543417737	100
92      	207178796787	129
92      	205930062465	69
92      	952550789390	59
92      	349435998924	81
92      	379942304309	133
92      	527453991710	105
92      	409542246104	134
92      	875125493289	127
92      	140903716305	92
92      	536851950801	144
93      	769357296879	86
93      	467615168772	65
93      	529831629045	62
93      	578705048123	57
93      	272121204465	62
93      	608852371253	144
93      	618570550236	63
93      	194144382996	53
93      	660310920540	123
93      	692492393712	91
93      	904647940449	142
93      	697814031389	88
93      	749625390019	74
93      	383476286895	121
93      	227635917829	90
93      	869112308003	145
93      	379942304309	96
93      	349435998924	137
93      	875125493289	95
93      	274761600136	86
93      	176404904473	142
93      	132186536765	118
93      	945012228482	54
93      	925484684473	144
93      	384179652400	82
93      	861348595761	113
93      	389169531271	119
93      	205930062465	127
93      	600770885624	115
93      	630929030795	60
93      	549746556299	127
93      	388403878360	91
93      	849681336901	143
93      	154554749200	64
93      	349330324726	109
93      	589814450967	68
93      	523196696835	56
93      	721857506010	82
93      	103362565865	93
93      	297083512852	56
93      	673737891943	64
93      	649921994715	62
93      	317663070530	72
93      	896919583724	148
93      	203262278452	96
93      	633320411611	52
93      	312237459250	115
93      	749193678427	131
93      	234646454745	98
93      	527453991710	149
93      	290827207620	61
93      	998040421944	98
93      	576518370019	66
93      	261188186216	134
93      	482340522139	106
93      	180531962334	144
93      	646511826677	118
93      	567657950596	83
93      	199968033019	57
93      	509762284879	145
93      	208174494479	138
93      	336491915536	134
93      	838962966418	98
93      	770565227675	125
93      	199753522658	90
93      	919197823026	122
93      	916984241291	104
93      	654563447110	87
93      	210526151030	80
93      	146051347589	52
93      	877194198700	64
93      	334074319971	51
93      	765572003296	86
93      	923237099384	85
93      	252522255166	67
93      	939369924082	83
93      	486804801433	127
93      	108326062706	51
93      	986065693858	118
93      	534109743798	113
93      	467986934495	67
93      	859109096191	55
93      	364745567029	132
93      	862174790606	97
93      	373709485267	70
93      	547685258313	128
93      	418604295928	117
93      	836900805029	119
93      	893005812666	112
93      	265444172694	91
93      	868744054130	118
93      	420756960291	120
93      	400930079611	53
93      	590034051433	103
93      	944472664850	132
93      	894482053097	62
93      	740581174440	79
93      	776538360607	118
93      	117431954043	97
93      	506298714832	145
93      	547244118460	110
93      	557899454410	144
93      	732970729968	58
93      	430946284790	54
93      	702421087613	129
93      	384468659793	101
94      	578705048123	125
94      	576518370019	104
94      	986202008726	84
94      	771137437634	118
94      	775611741635	99
94      	702421087613	80
94      	925484684473	124
94      	384179652400	66
94      	859109096191	122
94      	467986934495	127
94      	227635917829	102
94      	308440276732	128
94      	702830548447	141
94      	419481071217	107
94      	706236730898	64
94      	430946284790	100
94      	643925479319	117
94      	435122760857	73
94      	483738463713	100
94      	208174494479	88
94      	400930079611	135
94      	952550789390	106
94      	916984241291	140
94      	349435998924	94
94      	314482481265	88
94      	803607788754	75
94      	187272692439	126
94      	636021875565	124
94      	316871031375	60
94      	174237001203	146
94      	457459442332	141
94      	264132323061	138
94      	849681336901	82
94      	294993047536	110
94      	893005812666	119
94      	380734371410	64
94      	692492393712	108
94      	514254550616	57
94      	547244118460	101
94      	467615168772	57
94      	486804801433	93
94      	814141265887	89
94      	518787417161	147
94      	754664511022	145
94      	334425348148	113
94      	749193678427	77
94      	863129185304	130
94      	894482053097	89
94      	284083366181	132
94      	450659382698	119
94      	569219762080	93
94      	557899454410	92
94      	67014520356 	63
94      	132954606361	85
94      	167742802915	134
94      	740581174440	83
94      	919197823026	141
94      	172950643766	89
94      	113476782830	61
94      	654563447110	136
94      	925173129386	71
94      	646511826677	57
94      	473186595371	150
94      	572878568883	70
94      	868744054130	131
94      	146051347589	57
94      	939369924082	124
94      	528771298719	97
94      	902956788286	58
94      	444797600349	123
94      	425456990082	131
94      	698718941817	147
94      	722946564026	59
94      	482429892907	90
94      	786975743876	83
94      	875125493289	77
94      	413227470171	123
94      	379942304309	70
94      	765572003296	98
94      	330700905340	129
94      	180531962334	101
94      	176404904473	115
94      	409542246104	88
94      	297083512852	57
94      	300475101700	66
94      	144568875894	104
94      	518329844939	55
94      	999543417737	137
94      	488529033803	140
94      	578147508823	97
94      	336491915536	108
94      	312237459250	115
94      	139669412174	149
94      	896919583724	149
94      	373709485267	127
94      	339589987290	101
94      	933914210509	121
94      	118389501460	78
94      	132186536765	149
94      	377848719039	62
94      	308792010934	73
94      	941976384328	108
94      	523196696835	114
94      	381299535788	118
94      	716818652888	103
94      	750886611187	132
94      	490997846898	113
94      	741544174664	128
94      	871701186034	89
94      	568658660566	131
94      	709229053555	50
94      	421337093409	100
94      	159425007904	89
94      	388403878360	67
94      	252522255166	73
94      	210526151030	91
95      	308792010934	110
95      	740581174440	71
95      	373709485267	134
95      	314482481265	119
95      	590034051433	91
95      	569219762080	75
95      	887528437482	57
95      	168074802141	141
95      	482429892907	63
95      	381299535788	106
95      	154554749200	105
95      	118389501460	135
95      	252522255166	78
95      	389169531271	85
95      	364745567029	101
95      	159425007904	74
95      	877194198700	66
95      	556388862616	66
95      	529831629045	65
95      	776538360607	118
95      	317663070530	101
95      	925173129386	121
95      	919197823026	141
95      	833663232208	142
95      	589814450967	80
95      	525199185853	146
95      	508818965558	117
95      	982079076090	85
95      	786975743876	105
95      	765572003296	90
95      	297083512852	148
95      	578147508823	147
95      	557899454410	102
95      	207178796787	145
95      	894482053097	83
95      	769357296879	100
95      	873640709962	85
95      	189470486214	74
95      	132186536765	65
95      	409542246104	126
95      	814141265887	114
95      	722946564026	53
95      	754664511022	117
95      	916984241291	70
95      	923237099384	65
95      	490997846898	109
95      	274761600136	140
95      	457459442332	106
95      	643925479319	143
95      	547244118460	130
95      	172950643766	150
95      	516495915668	98
95      	330700905340	135
95      	467615168772	96
95      	904647940449	52
96      	771137437634	107
96      	308440276732	79
96      	250617599940	107
96      	518787417161	130
96      	838962966418	75
96      	364745567029	81
96      	803607788754	64
96      	334074319971	83
96      	482340522139	135
96      	317663070530	74
96      	589814450967	114
96      	568658660566	135
96      	383476286895	66
96      	207178796787	118
96      	740581174440	87
96      	893005812666	136
96      	265444172694	66
96      	979700065093	94
96      	272121204465	117
96      	775611741635	137
96      	290827207620	145
96      	511511692317	69
96      	514254550616	71
96      	274761600136	52
96      	925173129386	103
96      	118389501460	59
96      	558886167633	99
96      	380734371410	130
96      	529831629045	81
96      	887528437482	83
96      	506298714832	63
96      	234646454745	101
96      	636021875565	118
96      	945312847530	55
96      	312237459250	70
96      	994411186239	79
96      	132954606361	135
96      	208174494479	113
96      	349435998924	122
96      	944472664850	135
96      	716818652888	70
96      	877194198700	121
96      	923237099384	57
96      	871701186034	92
96      	411067277447	139
96      	769357296879	115
96      	450659382698	141
96      	316871031375	61
96      	556388862616	133
96      	473186595371	146
96      	732970729968	54
96      	814141265887	59
96      	384468659793	87
96      	168074802141	82
96      	741544174664	54
96      	140903716305	75
96      	679453075525	71
96      	563144943925	148
96      	488529033803	136
96      	261188186216	123
96      	642234808130	146
96      	419481071217	60
96      	697814031389	66
96      	444797600349	115
96      	127026679653	142
96      	126834215166	101
96      	373709485267	143
96      	180531962334	143
97      	740581174440	145
97      	765572003296	147
97      	421337093409	110
97      	669515708071	78
97      	290827207620	96
97      	962728896848	99
97      	741544174664	126
97      	816260222588	138
97      	873640709962	129
97      	380734371410	74
97      	508818965558	140
97      	771137437634	102
97      	144568875894	123
97      	418604295928	125
97      	398900612810	111
97      	859109096191	128
97      	127026679653	60
97      	113476782830	68
97      	549746556299	75
97      	377848719039	140
97      	134390993040	97
97      	509762284879	146
97      	490997846898	83
97      	576518370019	120
97      	828509049873	69
97      	506298714832	54
97      	261188186216	123
97      	547685258313	142
97      	246144606961	89
97      	718971287692	130
97      	558886167633	100
97      	316871031375	139
97      	839518983686	106
97      	523196696835	54
97      	425456990082	107
97      	272121204465	95
97      	896919583724	85
97      	861348595761	126
97      	875125493289	101
97      	702830548447	93
97      	692492393712	113
97      	869112308003	106
97      	578147508823	97
97      	168074802141	66
97      	383476286895	77
97      	572878568883	52
97      	330700905340	77
97      	252522255166	72
97      	925484684473	138
97      	414652410482	141
97      	534109743798	83
97      	923237099384	143
97      	862174790606	70
97      	384468659793	133
97      	893005812666	74
97      	556388862616	80
97      	887528437482	74
97      	642234808130	125
97      	132186536765	124
97      	140903716305	91
97      	776538360607	71
97      	933914210509	52
97      	174237001203	62
97      	409542246104	125
97      	697814031389	69
97      	643925479319	138
97      	336491915536	85
97      	388403878360	107
98      	398900612810	53
98      	435122760857	106
98      	697814031389	56
98      	769357296879	148
98      	518787417161	121
98      	284083366181	96
98      	199968033019	83
98      	134390993040	90
98      	814141265887	90
98      	495776106616	129
98      	205930062465	142
98      	400127531270	90
98      	483738463713	83
98      	875125493289	113
98      	389169531271	127
98      	208174494479	119
98      	569219762080	99
98      	514254550616	97
98      	297083512852	115
98      	939369924082	73
98      	516495915668	123
98      	833663232208	60
98      	383476286895	111
98      	339589987290	55
98      	572878568883	72
98      	144568875894	135
98      	902956788286	118
98      	654563447110	97
98      	264132323061	129
98      	998040421944	50
98      	418604295928	75
98      	576518370019	63
98      	154554749200	84
98      	377848719039	147
98      	786975743876	72
98      	172950643766	89
98      	629919786056	75
98      	308440276732	66
98      	869112308003	125
98      	420756960291	106
98      	718971287692	84
98      	159425007904	77
98      	453357640486	116
98      	189470486214	127
98      	294993047536	103
98      	899657914264	68
98      	646511826677	145
98      	862174790606	92
98      	590034051433	89
98      	916984241291	71
98      	409542246104	78
98      	518329844939	69
98      	118389501460	94
98      	982079076090	74
98      	381299535788	118
98      	868744054130	96
98      	894482053097	95
98      	669515708071	128
98      	673737891943	146
98      	558886167633	79
98      	129753980851	143
98      	108649313374	123
98      	698718941817	110
98      	252522255166	63
98      	174237001203	66
98      	882152991390	89
98      	180531962334	136
98      	419481071217	77
98      	511511692317	144
98      	127026679653	87
98      	336491915536	69
98      	933914210509	143
98      	887528437482	110
98      	696368469198	108
98      	482429892907	91
98      	314482481265	114
98      	523196696835	139
98      	750886611187	86
98      	379942304309	60
98      	836900805029	91
98      	566877828296	69
98      	945312847530	74
98      	776538360607	118
98      	952550789390	64
98      	435583017631	147
98      	803607788754	118
98      	919197823026	66
98      	578147508823	123
98      	941976384328	81
98      	265444172694	147
98      	702421087613	120
98      	486804801433	139
98      	103362565865	128
98      	692492393712	119
98      	749193678427	99
98      	643925479319	130
98      	805966823208	81
98      	859109096191	61
98      	556388862616	129
98      	871701186034	80
98      	414652410482	63
98      	770565227675	62
98      	986202008726	124
98      	139669412174	56
99      	234646454745	78
99      	482429892907	117
99      	771137437634	147
99      	364745567029	96
99      	527453991710	145
99      	380734371410	122
99      	816260222588	67
99      	339589987290	74
99      	899657914264	105
99      	252522255166	135
99      	274761600136	116
99      	400930079611	105
99      	508818965558	128
99      	349330324726	54
99      	718971287692	110
99      	482340522139	141
99      	669515708071	136
99      	246144606961	86
99      	916984241291	106
99      	558886167633	53
99      	414652410482	122
99      	511511692317	62
99      	875125493289	114
99      	139669412174	146
99      	706236730898	72
99      	132954606361	55
99      	389169531271	72
99      	375276903331	86
99      	419481071217	116
99      	314482481265	130
99      	536851950801	84
99      	999543417737	101
99      	117431954043	99
99      	919197823026	134
99      	618570550236	135
99      	646511826677	55
99      	600770885624	95
99      	828509049873	91
99      	654563447110	99
99      	140903716305	120
99      	578705048123	81
99      	419446364450	149
99      	300475101700	147
99      	862174790606	108
99      	877194198700	132
99      	199968033019	50
99      	749625390019	142
99      	578147508823	100
99      	839518983686	122
99      	894482053097	50
99      	833663232208	65
99      	863129185304	56
99      	893005812666	115
99      	952550789390	141
99      	986065693858	136
99      	384468659793	54
99      	316871031375	72
99      	286243122717	118
99      	871701186034	52
99      	702830548447	81
99      	944472664850	149
99      	554521191996	96
99      	925173129386	56
99      	418604295928	116
99      	868744054130	81
99      	349435998924	79
99      	264132323061	124
99      	205930062465	127
99      	805966823208	100
99      	203262278452	133
99      	948543507361	118
99      	176404904473	51
99      	518329844939	62
99      	421337093409	138
99      	189470486214	139
99      	483738463713	100
99      	167742802915	95
99      	208174494479	64
99      	383476286895	119
99      	373709485267	89
99      	902956788286	111
99      	996103067914	55
99      	490997846898	103
99      	400127531270	150
99      	488529033803	129
99      	732970729968	144
99      	297083512852	50
99      	721857506010	73
99      	803607788754	69
99      	696368469198	145
99      	709229053555	100
99      	770565227675	116
99      	775611741635	77
99      	962728896848	138
99      	716818652888	76
99      	566877828296	96
99      	722946564026	59
99      	486804801433	71
99      	887528437482	108
99      	284083366181	141
99      	697814031389	132
99      	172950643766	114
99      	982079076090	143
99      	529831629045	69
99      	679453075525	52
99      	108649313374	81
99      	265444172694	127
99      	608852371253	148
99      	210526151030	147
99      	923237099384	84
99      	849681336901	105
99      	776538360607	125
99      	159425007904	73
99      	113476782830	61
99      	154554749200	88
99      	741544174664	70
99      	589814450967	66
99      	473186595371	135
99      	516286957430	141
99      	152614854189	53
99      	649921994715	76
99      	702421087613	59
99      	698718941817	107
99      	673737891943	108
99      	227635917829	126
99      	334074319971	95
99      	388403878360	131
99      	250617599940	74
99      	873640709962	108
99      	869112308003	115
99      	294993047536	56
99      	939369924082	108
99      	814141265887	52
99      	576518370019	116
99      	118389501460	115
99      	312237459250	92
99      	861348595761	109
99      	384179652400	54
99      	308440276732	78
99      	411067277447	120
99      	330700905340	78
99      	836900805029	122
99      	516495915668	134
99      	322758894316	129
99      	450659382698	134
99      	467986934495	139
99      	180531962334	67
99      	643925479319	126
99      	420756960291	112
100     	709229053555	89
100     	805966823208	133
100     	252522255166	124
100     	349435998924	51
100     	899657914264	69
100     	569219762080	140
100     	330700905340	110
100     	877194198700	125
100     	168074802141	69
100     	996103067914	105
100     	547685258313	76
100     	339589987290	57
100     	673737891943	89
100     	113476782830	115
100     	117431954043	52
100     	334074319971	100
100     	127026679653	128
100     	210526151030	128
100     	646511826677	77
100     	108649313374	147
100     	412348931569	135
100     	718971287692	91
100     	558886167633	116
100     	716818652888	147
100     	776538360607	55
100     	511511692317	67
100     	167742802915	69
100     	265444172694	113
100     	859109096191	114
100     	473186595371	89
100     	132954606361	94
100     	702421087613	106
100     	409542246104	56
100     	696368469198	144
100     	875125493289	97
100     	833663232208	131
100     	486804801433	72
100     	314482481265	131
100     	435122760857	129
100     	863129185304	106
100     	261188186216	113
100     	786975743876	101
100     	118389501460	119
100     	384468659793	116
100     	925484684473	53
100     	312237459250	135
100     	180531962334	86
100     	176404904473	75
100     	509762284879	61
100     	294993047536	62
100     	467986934495	56
100     	568658660566	112
100     	518329844939	83
100     	749625390019	122
100     	814141265887	72
100     	108326062706	54
100     	435583017631	91
100     	816260222588	137
100     	126834215166	99
101     	589814450967	78
101     	952550789390	139
101     	875605607431	149
101     	568658660566	145
101     	547244118460	89
101     	750886611187	115
101     	630929030795	100
101     	334074319971	74
101     	525199185853	147
101     	749193678427	105
101     	508818965558	52
101     	199968033019	124
101     	873640709962	124
101     	286243122717	119
101     	377848719039	91
101     	558886167633	69
101     	863129185304	126
101     	388403878360	50
101     	421337093409	135
101     	629919786056	96
101     	435122760857	70
101     	168074802141	80
101     	483738463713	78
101     	482429892907	116
101     	473186595371	119
101     	398900612810	61
101     	862174790606	79
101     	265444172694	90
101     	816260222588	75
101     	264132323061	90
101     	203262278452	56
101     	113476782830	140
101     	234646454745	76
101     	775611741635	139
101     	514254550616	150
101     	771137437634	105
101     	673737891943	72
101     	679453075525	146
101     	384179652400	63
101     	411067277447	125
101     	330700905340	132
101     	509762284879	130
101     	649921994715	124
101     	706236730898	93
101     	172950643766	131
101     	999543417737	108
101     	180531962334	138
101     	536851950801	66
101     	986065693858	125
101     	187272692439	134
101     	312237459250	103
101     	495776106616	60
102     	982079076090	126
102     	509762284879	58
102     	383476286895	86
102     	194144382996	66
102     	603333456348	92
102     	528771298719	132
102     	467615168772	142
102     	554521191996	59
102     	642234808130	147
102     	389169531271	88
102     	132186536765	82
102     	636021875565	69
102     	861348595761	111
102     	556388862616	66
102     	718971287692	127
102     	294993047536	81
102     	952550789390	93
102     	284083366181	135
102     	722946564026	94
102     	698718941817	134
102     	339589987290	68
102     	453357640486	139
102     	506298714832	117
102     	199753522658	57
102     	709229053555	148
102     	816260222588	124
102     	979700065093	74
102     	838962966418	108
102     	939369924082	107
102     	904647940449	68
102     	207178796787	95
102     	373709485267	95
102     	203262278452	70
102     	547685258313	66
102     	566877828296	51
102     	899657914264	140
102     	261188186216	90
102     	265444172694	125
102     	334074319971	109
102     	381299535788	80
102     	490997846898	147
102     	576518370019	112
102     	649921994715	109
102     	108326062706	78
102     	786975743876	126
102     	349435998924	150
102     	379942304309	69
102     	863129185304	85
102     	250617599940	88
102     	882152991390	88
102     	400930079611	82
102     	419481071217	92
102     	450659382698	95
102     	916984241291	70
102     	945312847530	137
102     	868744054130	113
102     	721857506010	109
102     	152614854189	114
102     	414652410482	139
102     	902956788286	66
102     	516495915668	55
102     	419446364450	70
102     	126834215166	119
102     	140903716305	127
102     	859109096191	70
102     	108649313374	139
102     	630929030795	112
102     	488529033803	59
102     	769357296879	57
102     	750886611187	95
102     	893005812666	95
102     	420756960291	110
102     	118389501460	67
102     	274761600136	104
102     	300475101700	89
102     	567657950596	82
102     	547244118460	148
102     	805966823208	132
102     	986065693858	112
102     	833663232208	128
102     	749625390019	66
102     	176404904473	122
102     	113476782830	52
102     	167742802915	58
102     	887528437482	136
102     	765572003296	126
102     	430946284790	130
102     	495776106616	82
102     	568658660566	131
102     	534109743798	121
102     	749193678427	137
102     	529831629045	136
102     	418604295928	72
102     	483738463713	149
102     	849681336901	103
102     	473186595371	52
102     	654563447110	52
102     	925484684473	125
102     	425456990082	51
102     	308792010934	61
102     	129753980851	59
102     	134390993040	121
102     	435583017631	87
102     	409542246104	98
102     	523196696835	110
102     	589814450967	123
102     	919197823026	71
102     	696368469198	108
102     	569219762080	72
102     	486804801433	65
102     	894482053097	90
102     	706236730898	50
102     	803607788754	64
102     	308440276732	122
102     	643925479319	122
102     	246144606961	78
102     	272121204465	104
102     	511511692317	112
102     	875605607431	76
102     	117431954043	107
102     	996103067914	94
102     	962728896848	57
102     	234646454745	54
102     	618570550236	132
102     	384179652400	113
102     	467986934495	87
102     	994411186239	60
102     	549746556299	118
102     	336491915536	73
102     	444797600349	116
102     	986202008726	146
102     	525199185853	122
102     	776538360607	141
103     	290827207620	102
103     	380734371410	147
103     	506298714832	95
103     	514254550616	52
103     	998040421944	144
103     	660310920540	86
103     	482429892907	100
103     	152614854189	113
103     	300475101700	134
103     	132954606361	101
103     	203262278452	77
103     	272121204465	130
103     	316871031375	108
103     	467986934495	150
103     	339589987290	142
103     	334425348148	128
103     	702830548447	127
103     	453357640486	55
103     	630929030795	89
103     	400930079611	66
103     	126834215166	117
103     	786975743876	126
103     	284083366181	98
103     	413227470171	132
103     	536851950801	136
103     	194144382996	91
103     	373709485267	111
103     	473186595371	107
103     	482340522139	121
103     	893005812666	66
103     	716818652888	63
103     	749193678427	66
103     	603333456348	109
103     	381299535788	129
103     	633320411611	89
103     	721857506010	140
103     	698718941817	150
103     	419446364450	100
103     	412348931569	56
103     	776538360607	81
103     	554521191996	59
103     	706236730898	55
103     	527453991710	72
103     	679453075525	100
103     	740581174440	98
103     	882152991390	145
103     	508818965558	146
103     	849681336901	121
103     	549746556299	111
103     	322758894316	94
103     	172950643766	115
103     	297083512852	90
103     	996103067914	68
103     	629919786056	140
103     	873640709962	53
103     	692492393712	96
103     	945312847530	70
103     	159425007904	88
103     	425456990082	115
103     	450659382698	107
103     	877194198700	121
103     	173672457176	139
103     	168074802141	100
103     	108326062706	68
103     	816260222588	66
103     	250617599940	98
103     	941976384328	102
103     	600770885624	145
103     	349330324726	111
103     	113476782830	72
103     	308792010934	120
103     	140903716305	92
103     	398900612810	143
103     	814141265887	64
103     	933914210509	149
103     	180531962334	137
103     	418604295928	128
103     	274761600136	113
103     	986065693858	119
103     	775611741635	129
103     	569219762080	88
103     	982079076090	70
103     	227635917829	81
103     	636021875565	109
104     	572878568883	61
104     	902956788286	127
104     	173672457176	93
104     	776538360607	132
104     	113476782830	144
104     	265444172694	76
104     	205930062465	108
104     	534109743798	150
104     	814141265887	58
104     	654563447110	142
104     	294993047536	77
104     	754664511022	64
104     	633320411611	77
104     	450659382698	75
104     	549746556299	110
104     	979700065093	59
104     	646511826677	56
104     	514254550616	118
104     	578147508823	60
104     	722946564026	123
104     	420756960291	81
104     	871701186034	76
104     	859109096191	132
104     	457459442332	141
104     	923237099384	69
104     	300475101700	61
104     	412348931569	79
104     	250617599940	123
104     	126834215166	114
104     	290827207620	60
104     	567657950596	64
104     	511511692317	125
104     	127026679653	107
104     	698718941817	68
104     	518787417161	101
104     	600770885624	125
104     	400930079611	114
104     	189470486214	127
104     	132186536765	100
104     	948543507361	105
104     	389169531271	113
104     	435122760857	141
104     	467986934495	114
104     	986065693858	121
104     	108649313374	136
104     	330700905340	149
104     	435583017631	96
104     	132954606361	51
104     	364745567029	135
104     	152614854189	117
104     	529831629045	116
104     	786975743876	67
104     	919197823026	133
104     	334074319971	52
104     	696368469198	136
104     	252522255166	58
104     	925484684473	60
104     	999543417737	69
104     	430946284790	106
104     	174237001203	98
104     	925173129386	130
104     	816260222588	83
104     	679453075525	95
104     	775611741635	61
104     	944472664850	111
104     	172950643766	132
104     	896919583724	143
104     	732970729968	70
104     	144568875894	115
104     	284083366181	98
104     	945312847530	111
104     	608852371253	138
104     	986202008726	141
104     	421337093409	99
104     	697814031389	103
104     	146051347589	53
104     	334425348148	109
104     	167742802915	59
104     	203262278452	126
104     	381299535788	125
104     	868744054130	64
104     	660310920540	83
104     	941976384328	139
104     	467615168772	123
104     	636021875565	119
104     	838962966418	79
104     	199968033019	121
104     	996103067914	63
104     	803607788754	140
104     	246144606961	64
104     	418604295928	102
105     	284083366181	98
105     	144568875894	102
105     	769357296879	55
105     	702421087613	93
105     	679453075525	65
105     	649921994715	80
105     	117431954043	112
105     	569219762080	104
105     	514254550616	83
105     	750886611187	143
105     	375276903331	69
105     	547685258313	108
105     	563144943925	100
105     	113476782830	119
105     	486804801433	78
105     	986065693858	102
105     	673737891943	103
105     	962728896848	128
105     	732970729968	91
105     	919197823026	55
105     	618570550236	81
105     	67014520356 	97
105     	172950643766	85
105     	425456990082	65
105     	833663232208	83
105     	589814450967	96
105     	174237001203	147
105     	330700905340	64
105     	490997846898	97
105     	868744054130	66
105     	483738463713	133
105     	421337093409	91
105     	558886167633	96
105     	916984241291	102
105     	349330324726	91
105     	168074802141	133
105     	435583017631	90
105     	849681336901	116
105     	210526151030	123
105     	896919583724	142
105     	882152991390	78
105     	722946564026	73
105     	495776106616	94
105     	994411186239	142
105     	814141265887	119
105     	669515708071	147
105     	718971287692	61
105     	702830548447	145
105     	187272692439	149
105     	945012228482	109
105     	749193678427	116
105     	534109743798	57
106     	590034051433	133
106     	444797600349	147
106     	108649313374	137
106     	297083512852	57
106     	227635917829	120
106     	199968033019	104
106     	525199185853	133
106     	334425348148	97
106     	208174494479	70
106     	962728896848	115
106     	523196696835	136
106     	868744054130	78
106     	294993047536	100
106     	814141265887	64
106     	572878568883	127
106     	740581174440	118
106     	642234808130	102
106     	509762284879	150
106     	952550789390	122
106     	722946564026	119
106     	412348931569	92
106     	400127531270	108
106     	457459442332	109
106     	132186536765	55
106     	979700065093	129
106     	453357640486	53
106     	528771298719	57
106     	718971287692	124
106     	679453075525	101
106     	146051347589	82
106     	127026679653	83
106     	314482481265	84
106     	944472664850	74
106     	557899454410	71
106     	389169531271	75
106     	420756960291	95
106     	409542246104	54
106     	381299535788	92
106     	483738463713	135
106     	246144606961	140
106     	129753980851	80
106     	421337093409	73
106     	805966823208	117
106     	312237459250	141
106     	828509049873	132
106     	925173129386	90
106     	482340522139	64
106     	643925479319	150
106     	473186595371	89
106     	430946284790	91
106     	375276903331	86
106     	749193678427	75
106     	771137437634	70
106     	398900612810	100
106     	769357296879	150
106     	732970729968	65
106     	334074319971	89
106     	316871031375	147
106     	803607788754	56
106     	629919786056	141
106     	174237001203	82
106     	132954606361	136
106     	67014520356 	96
106     	529831629045	128
106     	554521191996	126
106     	902956788286	117
106     	649921994715	147
106     	261188186216	102
106     	877194198700	116
106     	467615168772	70
106     	603333456348	129
106     	916984241291	115
106     	786975743876	98
106     	140903716305	127
106     	608852371253	108
106     	696368469198	148
106     	636021875565	138
106     	721857506010	57
106     	435122760857	98
106     	286243122717	150
106     	862174790606	85
106     	180531962334	134
106     	113476782830	104
106     	274761600136	80
106     	566877828296	74
106     	380734371410	91
106     	516286957430	131
106     	379942304309	72
106     	194144382996	64
106     	871701186034	56
106     	103362565865	133
106     	765572003296	140
106     	482429892907	83
106     	108326062706	127
106     	534109743798	104
106     	413227470171	81
106     	547244118460	150
106     	716818652888	106
106     	754664511022	91
106     	578705048123	83
106     	556388862616	77
106     	336491915536	69
106     	518787417161	63
106     	986202008726	147
106     	945312847530	87
106     	776538360607	75
106     	669515708071	66
106     	511511692317	99
106     	419481071217	98
106     	172950643766	89
106     	176404904473	99
106     	167742802915	71
106     	882152991390	84
106     	450659382698	52
106     	569219762080	142
106     	600770885624	149
106     	527453991710	64
106     	618570550236	112
106     	252522255166	145
106     	646511826677	56
106     	633320411611	60
107     	894482053097	102
107     	919197823026	64
107     	430946284790	84
107     	210526151030	134
107     	749625390019	121
107     	994411186239	76
107     	172950643766	98
107     	425456990082	65
107     	904647940449	97
107     	836900805029	78
107     	312237459250	78
107     	490997846898	125
107     	420756960291	70
107     	868744054130	127
107     	642234808130	99
107     	636021875565	149
107     	863129185304	76
107     	486804801433	144
107     	722946564026	145
107     	563144943925	74
107     	554521191996	76
107     	893005812666	96
107     	144568875894	94
107     	557899454410	120
107     	117431954043	95
107     	286243122717	125
107     	630929030795	85
107     	899657914264	61
107     	805966823208	103
107     	549746556299	98
107     	482429892907	106
107     	660310920540	141
107     	514254550616	146
107     	377848719039	109
107     	234646454745	115
107     	528771298719	132
107     	113476782830	71
107     	398900612810	58
107     	558886167633	116
107     	786975743876	133
107     	414652410482	72
107     	457459442332	125
107     	569219762080	132
107     	418604295928	58
107     	828509049873	68
107     	600770885624	128
107     	875605607431	114
107     	495776106616	52
107     	129753980851	138
107     	702830548447	67
107     	154554749200	119
107     	589814450967	90
107     	986202008726	126
107     	511511692317	116
107     	208174494479	100
107     	754664511022	68
107     	887528437482	116
107     	833663232208	106
107     	297083512852	141
107     	721857506010	85
107     	869112308003	59
107     	103362565865	61
107     	67014520356 	107
107     	732970729968	106
107     	923237099384	137
107     	986065693858	104
107     	118389501460	99
107     	567657950596	119
107     	749193678427	80
107     	556388862616	53
107     	939369924082	73
107     	750886611187	100
107     	300475101700	84
107     	916984241291	78
107     	139669412174	68
107     	379942304309	99
107     	925173129386	58
107     	816260222588	111
107     	952550789390	91
107     	999543417737	108
107     	453357640486	144
107     	945312847530	119
107     	998040421944	66
107     	207178796787	99
107     	316871031375	135
107     	261188186216	128
107     	174237001203	75
107     	126834215166	101
107     	814141265887	59
107     	272121204465	82
107     	264132323061	78
107     	274761600136	98
107     	882152991390	115
107     	962728896848	64
107     	518787417161	120
107     	861348595761	84
107     	199968033019	73
107     	134390993040	134
107     	608852371253	133
108     	554521191996	103
108     	925173129386	59
108     	108326062706	78
108     	945312847530	62
108     	419446364450	132
108     	770565227675	82
108     	453357640486	84
108     	633320411611	147
108     	721857506010	83
108     	349435998924	52
108     	536851950801	134
108     	139669412174	126
108     	518787417161	53
108     	875605607431	70
108     	558886167633	50
108     	600770885624	91
108     	706236730898	110
108     	516286957430	75
108     	383476286895	51
108     	297083512852	142
108     	336491915536	63
108     	250617599940	57
108     	483738463713	141
108     	590034051433	102
108     	998040421944	143
108     	381299535788	140
108     	380734371410	109
108     	697814031389	58
108     	467615168772	105
108     	444797600349	122
108     	941976384328	119
108     	265444172694	124
108     	103362565865	132
108     	833663232208	114
108     	547685258313	118
108     	572878568883	91
108     	194144382996	110
108     	199753522658	120
108     	457459442332	131
108     	384179652400	51
108     	317663070530	144
108     	294993047536	106
108     	578147508823	92
108     	589814450967	117
108     	863129185304	53
108     	916984241291	139
108     	523196696835	150
108     	450659382698	87
108     	284083366181	108
108     	859109096191	127
108     	836900805029	76
108     	486804801433	65
108     	379942304309	149
108     	384468659793	60
108     	205930062465	95
108     	172950643766	96
108     	896919583724	85
108     	189470486214	65
108     	132954606361	62
108     	180531962334	129
108     	168074802141	81
108     	398900612810	67
108     	509762284879	121
108     	377848719039	133
108     	939369924082	126
108     	722946564026	84
108     	654563447110	132
108     	435122760857	143
108     	274761600136	88
108     	776538360607	105
108     	608852371253	62
108     	67014520356 	81
108     	982079076090	116
108     	373709485267	82
108     	732970729968	106
108     	349330324726	80
108     	420756960291	54
108     	290827207620	149
108     	199968033019	65
108     	146051347589	148
108     	618570550236	109
108     	495776106616	109
108     	873640709962	81
108     	692492393712	149
108     	506298714832	102
108     	411067277447	54
108     	334074319971	115
108     	467986934495	64
108     	750886611187	129
108     	771137437634	59
108     	312237459250	123
108     	849681336901	120
108     	208174494479	142
108     	754664511022	78
108     	511511692317	114
108     	893005812666	56
108     	996103067914	125
108     	862174790606	70
108     	108649313374	95
108     	187272692439	123
108     	556388862616	145
108     	419481071217	138
108     	207178796787	150
108     	518329844939	83
108     	868744054130	69
108     	814141265887	91
108     	904647940449	85
108     	877194198700	105
108     	113476782830	134
108     	828509049873	102
108     	154554749200	103
108     	563144943925	94
108     	203262278452	62
108     	430946284790	116
108     	869112308003	112
108     	525199185853	115
108     	646511826677	63
108     	425456990082	96
108     	816260222588	100
108     	775611741635	85
108     	803607788754	51
108     	994411186239	112
108     	435583017631	123
108     	364745567029	72
108     	234646454745	86
108     	388403878360	117
108     	557899454410	114
108     	698718941817	76
108     	709229053555	129
108     	286243122717	119
108     	923237099384	57
108     	527453991710	84
108     	549746556299	97
108     	159425007904	90
108     	718971287692	121
108     	875125493289	129
108     	765572003296	86
108     	716818652888	82
108     	413227470171	148
108     	514254550616	111
108     	140903716305	63
108     	925484684473	105
108     	979700065093	85
108     	786975743876	100
108     	805966823208	140
108     	529831629045	131
108     	962728896848	127
108     	660310920540	91
108     	482429892907	138
108     	986065693858	132
109     	630929030795	118
109     	979700065093	79
109     	482340522139	93
109     	868744054130	86
109     	642234808130	145
109     	589814450967	97
109     	771137437634	72
109     	450659382698	137
109     	569219762080	110
109     	696368469198	141
109     	882152991390	95
109     	673737891943	64
109     	227635917829	65
109     	511511692317	136
109     	174237001203	104
109     	554521191996	132
109     	199753522658	130
109     	261188186216	75
109     	199968033019	76
109     	986202008726	119
109     	129753980851	91
109     	139669412174	99
109     	339589987290	53
109     	189470486214	74
109     	749625390019	53
109     	420756960291	87
109     	308792010934	126
109     	566877828296	114
109     	419446364450	72
109     	941976384328	61
109     	290827207620	117
109     	646511826677	89
109     	527453991710	50
109     	871701186034	110
109     	568658660566	92
109     	414652410482	84
109     	590034051433	141
109     	654563447110	105
109     	769357296879	101
109     	514254550616	90
109     	982079076090	111
109     	159425007904	145
109     	425456990082	131
109     	349435998924	116
109     	168074802141	112
109     	252522255166	74
109     	525199185853	147
109     	117431954043	78
109     	534109743798	71
109     	381299535788	150
109     	473186595371	133
109     	933914210509	71
109     	488529033803	121
109     	154554749200	90
109     	536851950801	115
109     	994411186239	66
109     	861348595761	90
109     	132954606361	83
109     	413227470171	97
109     	297083512852	146
109     	518329844939	137
109     	264132323061	51
110     	294993047536	143
110     	569219762080	58
110     	430946284790	119
110     	941976384328	66
110     	721857506010	73
110     	490997846898	150
110     	126834215166	88
110     	286243122717	95
110     	528771298719	142
110     	420756960291	50
110     	380734371410	110
110     	467986934495	145
110     	863129185304	51
110     	144568875894	106
110     	803607788754	135
110     	709229053555	78
110     	316871031375	69
110     	986065693858	112
110     	722946564026	83
110     	377848719039	79
110     	312237459250	84
110     	525199185853	141
110     	629919786056	96
110     	67014520356 	72
110     	692492393712	135
110     	421337093409	104
110     	208174494479	139
110     	706236730898	58
110     	227635917829	148
110     	603333456348	81
110     	994411186239	140
110     	754664511022	102
110     	893005812666	104
110     	336491915536	102
110     	996103067914	128
110     	140903716305	55
110     	765572003296	73
110     	435583017631	102
110     	589814450967	146
110     	518787417161	132
110     	771137437634	111
110     	308440276732	128
110     	284083366181	131
110     	838962966418	141
110     	904647940449	127
110     	702421087613	105
110     	770565227675	86
110     	576518370019	110
110     	697814031389	126
110     	716818652888	59
110     	945012228482	113
110     	916984241291	109
110     	679453075525	67
110     	643925479319	141
110     	902956788286	92
110     	435122760857	145
110     	134390993040	131
110     	590034051433	140
110     	566877828296	140
110     	414652410482	98
111     	144568875894	99
111     	814141265887	82
111     	322758894316	61
111     	373709485267	55
111     	816260222588	60
111     	554521191996	121
111     	172950643766	129
111     	716818652888	71
111     	873640709962	92
111     	750886611187	74
111     	154554749200	118
111     	67014520356 	79
111     	629919786056	102
111     	312237459250	87
111     	600770885624	127
111     	769357296879	139
111     	669515708071	110
111     	412348931569	79
111     	732970729968	138
111     	945012228482	143
111     	129753980851	98
111     	514254550616	127
111     	861348595761	67
111     	893005812666	141
111     	618570550236	111
111     	702830548447	54
111     	483738463713	64
111     	643925479319	142
111     	962728896848	50
111     	994411186239	102
111     	400127531270	63
111     	482429892907	78
111     	869112308003	100
111     	838962966418	86
111     	567657950596	141
111     	334425348148	149
111     	527453991710	93
111     	284083366181	109
111     	706236730898	137
111     	199753522658	63
111     	384468659793	126
111     	877194198700	101
111     	568658660566	138
111     	547244118460	76
111     	741544174664	116
111     	887528437482	57
111     	453357640486	139
111     	444797600349	108
111     	945312847530	87
111     	118389501460	71
111     	389169531271	80
111     	168074802141	73
111     	899657914264	69
111     	400930079611	73
111     	805966823208	70
111     	518787417161	64
111     	952550789390	109
111     	563144943925	147
111     	336491915536	124
111     	349435998924	58
111     	749625390019	123
111     	413227470171	111
111     	923237099384	147
111     	203262278452	129
111     	875605607431	141
111     	590034051433	84
111     	300475101700	84
111     	998040421944	54
111     	113476782830	92
111     	127026679653	63
111     	646511826677	52
111     	140903716305	67
111     	828509049873	76
111     	944472664850	117
111     	673737891943	137
111     	996103067914	69
111     	549746556299	60
111     	642234808130	139
111     	189470486214	147
111     	409542246104	114
111     	187272692439	74
111     	467615168772	139
111     	308792010934	80
111     	776538360607	63
111     	849681336901	127
111     	999543417737	119
111     	925484684473	129
111     	770565227675	62
111     	384179652400	140
111     	139669412174	112
111     	430946284790	106
111     	506298714832	58
111     	176404904473	86
111     	696368469198	136
111     	939369924082	86
111     	933914210509	58
111     	754664511022	97
111     	862174790606	95
111     	941976384328	103
111     	234646454745	150
111     	134390993040	126
111     	290827207620	119
111     	509762284879	88
111     	839518983686	86
111     	467986934495	135
111     	146051347589	148
111     	986065693858	124
111     	986202008726	149
111     	207178796787	57
111     	578705048123	89
111     	721857506010	73
111     	518329844939	92
111     	294993047536	62
111     	246144606961	144
112     	516286957430	103
112     	633320411611	85
112     	297083512852	79
112     	317663070530	100
112     	939369924082	129
112     	722946564026	62
112     	203262278452	82
112     	126834215166	118
112     	511511692317	63
112     	117431954043	119
112     	252522255166	122
112     	322758894316	131
112     	308440276732	98
112     	234646454745	148
112     	925484684473	71
112     	769357296879	85
112     	646511826677	101
112     	952550789390	80
112     	868744054130	92
112     	741544174664	122
112     	660310920540	74
112     	418604295928	124
112     	127026679653	97
112     	718971287692	120
112     	534109743798	100
112     	246144606961	125
112     	948543507361	88
112     	294993047536	78
112     	154554749200	94
112     	314482481265	110
112     	629919786056	116
112     	569219762080	135
112     	398900612810	54
112     	300475101700	103
112     	118389501460	69
112     	420756960291	123
112     	986065693858	134
112     	383476286895	98
112     	435583017631	86
112     	882152991390	143
112     	630929030795	64
112     	904647940449	143
112     	862174790606	129
112     	375276903331	61
112     	805966823208	112
112     	925173129386	50
112     	207178796787	93
112     	286243122717	121
112     	419446364450	89
112     	384468659793	83
112     	199968033019	62
112     	146051347589	67
112     	754664511022	117
112     	380734371410	133
112     	536851950801	77
112     	578705048123	106
112     	894482053097	108
112     	709229053555	79
112     	998040421944	91
112     	336491915536	56
112     	187272692439	131
112     	839518983686	54
112     	486804801433	107
112     	566877828296	114
112     	330700905340	118
112     	589814450967	128
112     	732970729968	111
112     	349435998924	144
112     	414652410482	149
112     	770565227675	126
112     	421337093409	137
112     	547244118460	105
112     	567657950596	55
112     	435122760857	129
112     	716818652888	80
112     	603333456348	81
112     	944472664850	147
112     	859109096191	101
112     	483738463713	114
112     	518329844939	82
112     	349330324726	99
112     	549746556299	71
112     	144568875894	68
112     	979700065093	67
112     	618570550236	128
112     	902956788286	69
112     	775611741635	92
112     	210526151030	75
112     	261188186216	121
112     	108649313374	84
112     	379942304309	98
112     	786975743876	110
112     	316871031375	72
112     	377848719039	90
112     	776538360607	116
112     	134390993040	51
112     	482429892907	150
112     	381299535788	120
112     	590034051433	56
112     	103362565865	61
112     	516495915668	74
112     	816260222588	67
112     	518787417161	108
112     	425456990082	93
112     	265444172694	117
112     	669515708071	55
112     	159425007904	115
113     	159425007904	138
113     	589814450967	57
113     	205930062465	79
113     	952550789390	86
113     	453357640486	142
113     	174237001203	84
113     	669515708071	53
113     	473186595371	94
113     	129753980851	103
113     	312237459250	102
113     	518329844939	64
113     	557899454410	71
113     	418604295928	99
113     	444797600349	74
113     	566877828296	94
113     	576518370019	66
113     	925484684473	61
113     	941976384328	99
113     	578147508823	78
113     	199753522658	55
113     	679453075525	83
113     	568658660566	122
113     	893005812666	104
113     	718971287692	124
113     	770565227675	80
113     	144568875894	60
113     	400127531270	72
113     	508818965558	85
113     	836900805029	71
113     	863129185304	57
113     	516286957430	74
113     	127026679653	90
113     	274761600136	85
113     	702830548447	136
113     	511511692317	94
113     	765572003296	150
113     	146051347589	84
113     	495776106616	52
113     	547244118460	66
113     	642234808130	116
113     	261188186216	75
113     	384179652400	52
113     	334425348148	79
113     	482340522139	110
113     	771137437634	67
113     	919197823026	136
113     	709229053555	114
113     	339589987290	78
113     	633320411611	116
113     	252522255166	115
113     	696368469198	95
113     	467615168772	70
113     	732970729968	110
113     	409542246104	61
113     	330700905340	99
113     	108649313374	107
113     	514254550616	56
113     	457459442332	98
113     	373709485267	137
113     	523196696835	50
113     	608852371253	91
113     	896919583724	117
113     	962728896848	109
113     	336491915536	113
113     	698718941817	145
113     	139669412174	121
113     	982079076090	81
113     	483738463713	75
113     	887528437482	110
113     	534109743798	62
113     	264132323061	149
114     	636021875565	124
114     	633320411611	54
114     	300475101700	97
114     	264132323061	68
114     	554521191996	50
114     	529831629045	91
114     	132954606361	116
114     	944472664850	143
114     	603333456348	99
114     	722946564026	129
114     	172950643766	135
114     	877194198700	68
114     	339589987290	55
114     	108326062706	81
114     	134390993040	125
114     	252522255166	132
114     	525199185853	112
114     	203262278452	113
114     	272121204465	83
114     	732970729968	110
114     	765572003296	114
114     	939369924082	109
114     	871701186034	59
114     	168074802141	93
114     	692492393712	128
114     	336491915536	148
114     	330700905340	68
114     	933914210509	72
114     	741544174664	66
114     	117431954043	95
114     	527453991710	76
114     	108649313374	130
114     	925484684473	64
114     	536851950801	95
114     	986065693858	92
114     	982079076090	144
114     	999543417737	74
114     	556388862616	142
114     	409542246104	145
114     	862174790606	121
114     	419481071217	54
114     	740581174440	89
114     	314482481265	74
114     	364745567029	93
114     	649921994715	73
114     	375276903331	144
114     	518329844939	124
114     	250617599940	82
114     	590034051433	51
114     	750886611187	148
114     	618570550236	58
114     	207178796787	137
114     	411067277447	132
114     	308792010934	136
114     	547685258313	78
114     	948543507361	79
114     	962728896848	119
114     	419446364450	145
114     	297083512852	138
114     	506298714832	98
114     	274761600136	101
114     	941976384328	140
114     	286243122717	143
114     	381299535788	107
114     	174237001203	129
114     	400127531270	117
114     	453357640486	86
114     	849681336901	81
114     	754664511022	52
114     	482340522139	116
114     	516495915668	62
114     	425456990082	115
114     	146051347589	106
114     	642234808130	63
114     	400930079611	111
114     	334425348148	92
114     	129753980851	108
114     	775611741635	100
114     	833663232208	61
114     	167742802915	106
114     	875125493289	85
114     	608852371253	82
114     	578705048123	118
114     	421337093409	119
114     	902956788286	131
114     	673737891943	58
114     	473186595371	60
114     	199968033019	135
114     	893005812666	85
114     	189470486214	55
114     	294993047536	66
114     	483738463713	127
114     	589814450967	105
114     	159425007904	106
114     	998040421944	51
114     	558886167633	85
114     	566877828296	83
114     	139669412174	98
114     	718971287692	136
114     	646511826677	59
114     	716818652888	79
114     	696368469198	61
114     	568658660566	122
114     	916984241291	58
114     	629919786056	61
114     	828509049873	53
115     	199968033019	60
115     	554521191996	148
115     	770565227675	145
115     	882152991390	120
115     	894482053097	148
115     	578147508823	132
115     	317663070530	147
115     	173672457176	114
115     	871701186034	108
115     	409542246104	86
115     	176404904473	82
115     	979700065093	89
115     	508818965558	85
115     	516286957430	126
115     	986065693858	150
115     	563144943925	59
115     	261188186216	59
115     	411067277447	141
115     	608852371253	66
115     	873640709962	62
115     	518329844939	80
115     	534109743798	131
115     	945012228482	93
115     	511511692317	55
115     	132954606361	95
115     	506298714832	74
115     	863129185304	117
115     	630929030795	105
115     	566877828296	54
115     	877194198700	94
115     	308440276732	128
115     	749193678427	147
115     	828509049873	134
115     	869112308003	85
115     	732970729968	144
115     	383476286895	96
115     	941976384328	106
115     	716818652888	69
115     	379942304309	126
115     	252522255166	142
115     	754664511022	109
115     	741544174664	95
115     	334074319971	99
115     	139669412174	149
115     	322758894316	84
115     	134390993040	55
115     	126834215166	114
115     	316871031375	129
115     	250617599940	71
115     	421337093409	135
115     	377848719039	60
115     	633320411611	56
115     	692492393712	56
115     	210526151030	143
115     	649921994715	128
115     	207178796787	55
115     	108649313374	102
115     	194144382996	131
115     	589814450967	122
115     	525199185853	122
115     	994411186239	105
115     	775611741635	124
115     	618570550236	62
115     	203262278452	91
115     	189470486214	78
115     	629919786056	102
115     	660310920540	145
115     	986202008726	130
115     	172950643766	146
115     	486804801433	132
115     	536851950801	146
115     	547685258313	81
115     	495776106616	118
115     	364745567029	104
115     	400930079611	68
115     	669515708071	105
115     	412348931569	79
115     	312237459250	62
115     	336491915536	76
115     	297083512852	94
115     	916984241291	137
115     	679453075525	60
115     	516495915668	127
115     	902956788286	92
115     	944472664850	142
115     	859109096191	65
115     	444797600349	137
115     	187272692439	101
115     	948543507361	64
115     	180531962334	70
115     	127026679653	50
115     	467986934495	144
115     	284083366181	126
115     	982079076090	107
115     	896919583724	94
115     	205930062465	62
115     	600770885624	57
115     	776538360607	104
115     	702421087613	78
115     	709229053555	136
115     	939369924082	63
115     	523196696835	66
115     	952550789390	134
115     	814141265887	86
115     	199753522658	91
115     	528771298719	92
115     	862174790606	127
115     	384468659793	119
115     	482429892907	123
115     	590034051433	52
115     	294993047536	57
115     	174237001203	146
115     	749625390019	116
115     	418604295928	103
115     	919197823026	143
115     	925484684473	91
115     	576518370019	100
115     	578705048123	86
115     	702830548447	78
115     	765572003296	53
115     	414652410482	72
115     	482340522139	62
115     	425456990082	58
115     	945312847530	79
115     	113476782830	98
115     	473186595371	144
115     	838962966418	109
115     	483738463713	67
115     	108326062706	94
115     	999543417737	147
116     	536851950801	93
116     	205930062465	100
116     	383476286895	77
116     	379942304309	60
116     	388403878360	105
116     	199753522658	141
116     	925484684473	65
116     	523196696835	60
116     	398900612810	144
116     	139669412174	145
116     	859109096191	100
116     	722946564026	89
116     	250617599940	134
116     	272121204465	68
116     	174237001203	57
116     	126834215166	70
116     	381299535788	132
116     	294993047536	106
116     	945012228482	97
116     	805966823208	80
116     	414652410482	60
116     	849681336901	145
116     	290827207620	109
116     	413227470171	99
116     	642234808130	147
116     	482429892907	118
116     	425456990082	62
116     	679453075525	55
116     	330700905340	86
116     	567657950596	94
116     	364745567029	131
116     	473186595371	82
116     	189470486214	111
116     	140903716305	91
116     	557899454410	149
116     	996103067914	51
116     	636021875565	122
116     	706236730898	101
116     	873640709962	113
116     	187272692439	118
116     	875605607431	134
116     	314482481265	150
116     	749625390019	61
116     	172950643766	102
116     	444797600349	77
116     	902956788286	95
116     	373709485267	96
116     	718971287692	127
116     	786975743876	126
116     	435583017631	109
116     	590034051433	75
116     	618570550236	109
116     	669515708071	121
116     	103362565865	140
116     	696368469198	66
116     	979700065093	75
116     	770565227675	133
116     	421337093409	83
117     	868744054130	126
117     	859109096191	124
117     	146051347589	68
117     	527453991710	79
117     	547244118460	113
117     	250617599940	55
117     	836900805029	52
117     	159425007904	81
117     	669515708071	52
117     	919197823026	136
117     	176404904473	147
117     	234646454745	74
117     	945312847530	94
117     	646511826677	70
117     	572878568883	108
117     	776538360607	143
117     	453357640486	67
117     	388403878360	81
117     	339589987290	51
117     	679453075525	68
117     	722946564026	68
117     	529831629045	87
117     	982079076090	132
117     	902956788286	142
117     	379942304309	150
117     	805966823208	138
117     	698718941817	91
117     	490997846898	80
117     	418604295928	53
117     	400930079611	111
117     	199753522658	62
117     	450659382698	134
117     	925484684473	66
117     	203262278452	59
117     	741544174664	57
117     	718971287692	84
117     	923237099384	116
117     	129753980851	75
117     	290827207620	74
117     	986065693858	124
117     	246144606961	114
117     	486804801433	51
117     	132186536765	88
117     	721857506010	63
117     	425456990082	95
117     	765572003296	88
117     	716818652888	88
117     	265444172694	71
117     	516286957430	141
117     	322758894316	115
117     	706236730898	120
117     	286243122717	50
117     	172950643766	128
117     	770565227675	135
117     	174237001203	115
117     	189470486214	88
117     	660310920540	133
117     	252522255166	115
117     	139669412174	52
117     	467615168772	89
118     	996103067914	68
118     	509762284879	142
118     	925484684473	85
118     	286243122717	53
118     	608852371253	71
118     	297083512852	84
118     	986202008726	126
118     	557899454410	135
118     	706236730898	124
118     	419481071217	128
118     	569219762080	114
118     	952550789390	95
118     	108326062706	82
118     	776538360607	148
118     	749625390019	67
118     	518329844939	90
118     	861348595761	69
118     	529831629045	93
118     	749193678427	139
118     	568658660566	110
118     	203262278452	105
118     	250617599940	141
118     	103362565865	79
118     	536851950801	78
118     	803607788754	138
118     	117431954043	68
118     	566877828296	61
118     	869112308003	110
118     	134390993040	60
118     	414652410482	55
118     	589814450967	67
118     	904647940449	51
118     	349435998924	113
118     	290827207620	114
118     	300475101700	118
118     	132954606361	132
118     	771137437634	100
118     	189470486214	67
118     	314482481265	101
118     	339589987290	54
118     	945012228482	59
118     	294993047536	53
118     	525199185853	121
118     	948543507361	63
118     	274761600136	126
118     	754664511022	109
118     	308792010934	56
118     	261188186216	146
118     	482429892907	57
118     	139669412174	92
118     	882152991390	124
118     	576518370019	51
118     	877194198700	132
118     	839518983686	143
118     	482340522139	113
118     	654563447110	64
118     	379942304309	61
118     	495776106616	109
118     	894482053097	90
118     	388403878360	104
118     	172950643766	110
118     	836900805029	60
118     	875125493289	149
118     	567657950596	68
118     	939369924082	123
118     	873640709962	64
118     	467986934495	101
118     	919197823026	62
118     	412348931569	107
118     	923237099384	65
118     	833663232208	88
118     	775611741635	135
118     	334074319971	116
118     	868744054130	52
118     	140903716305	122
118     	264132323061	129
118     	246144606961	145
118     	629919786056	62
118     	692492393712	107
119     	234646454745	100
119     	129753980851	147
119     	803607788754	124
119     	207178796787	147
119     	962728896848	121
119     	721857506010	121
119     	996103067914	54
119     	413227470171	142
119     	945012228482	78
119     	716818652888	145
119     	176404904473	134
119     	375276903331	115
119     	998040421944	51
119     	527453991710	118
119     	272121204465	115
119     	590034051433	60
119     	377848719039	117
119     	765572003296	121
119     	336491915536	102
119     	380734371410	140
119     	334425348148	52
119     	654563447110	110
119     	859109096191	85
119     	205930062465	70
119     	508818965558	142
119     	495776106616	50
119     	702830548447	75
119     	113476782830	102
119     	140903716305	81
119     	740581174440	88
119     	246144606961	99
119     	132954606361	91
119     	833663232208	138
119     	904647940449	54
119     	939369924082	104
119     	421337093409	65
119     	618570550236	133
119     	775611741635	86
119     	180531962334	85
119     	379942304309	55
119     	210526151030	53
119     	875125493289	64
119     	134390993040	54
119     	849681336901	93
119     	557899454410	132
119     	488529033803	75
119     	482340522139	108
119     	261188186216	138
119     	875605607431	96
119     	770565227675	145
119     	414652410482	119
119     	483738463713	95
119     	692492393712	50
119     	412348931569	149
119     	187272692439	78
119     	838962966418	142
119     	576518370019	54
119     	126834215166	134
119     	750886611187	127
119     	294993047536	65
119     	314482481265	110
119     	330700905340	132
119     	132186536765	141
119     	944472664850	67
119     	409542246104	120
119     	203262278452	73
119     	398900612810	94
120     	511511692317	134
120     	828509049873	129
120     	525199185853	146
120     	869112308003	84
120     	154554749200	138
120     	998040421944	111
120     	642234808130	107
120     	314482481265	128
120     	322758894316	51
120     	557899454410	121
120     	636021875565	92
120     	633320411611	147
120     	180531962334	72
120     	572878568883	144
120     	300475101700	135
120     	986065693858	101
120     	444797600349	80
120     	486804801433	59
120     	108649313374	117
120     	547244118460	59
120     	986202008726	50
120     	420756960291	89
120     	284083366181	103
120     	933914210509	81
120     	679453075525	82
120     	414652410482	86
120     	567657950596	57
120     	308792010934	108
120     	875605607431	150
120     	398900612810	73
120     	508818965558	104
120     	413227470171	52
120     	590034051433	137
120     	495776106616	124
120     	187272692439	60
120     	629919786056	103
120     	838962966418	79
120     	994411186239	131
120     	144568875894	146
120     	776538360607	103
120     	208174494479	104
120     	199753522658	90
120     	250617599940	60
120     	618570550236	126
120     	702830548447	123
120     	814141265887	90
120     	568658660566	131
120     	234646454745	128
120     	528771298719	134
120     	349435998924	95
120     	566877828296	109
120     	467986934495	131
120     	996103067914	53
120     	140903716305	141
120     	490997846898	116
120     	167742802915	82
120     	412348931569	138
120     	578705048123	108
120     	749625390019	125
120     	702421087613	104
120     	654563447110	132
120     	608852371253	135
120     	706236730898	135
120     	173672457176	77
121     	373709485267	132
121     	698718941817	52
121     	697814031389	81
121     	692492393712	150
121     	388403878360	59
121     	364745567029	148
121     	722946564026	51
121     	741544174664	65
121     	265444172694	87
121     	173672457176	140
121     	294993047536	75
121     	152614854189	137
121     	264132323061	69
121     	578705048123	72
121     	473186595371	139
121     	568658660566	148
121     	322758894316	133
121     	557899454410	85
121     	199968033019	54
121     	113476782830	105
121     	861348595761	56
121     	528771298719	102
121     	252522255166	138
121     	486804801433	111
121     	508818965558	82
121     	775611741635	64
121     	411067277447	100
121     	189470486214	118
121     	547244118460	114
121     	709229053555	131
121     	159425007904	89
121     	174237001203	111
121     	483738463713	79
121     	894482053097	81
121     	996103067914	87
121     	952550789390	56
121     	814141265887	67
121     	308792010934	77
121     	923237099384	142
121     	430946284790	56
121     	805966823208	83
121     	554521191996	51
121     	516286957430	90
121     	180531962334	81
121     	716818652888	142
121     	210526151030	63
121     	986065693858	150
121     	514254550616	94
121     	547685258313	117
121     	875605607431	65
121     	312237459250	143
121     	129753980851	96
121     	176404904473	138
121     	132954606361	124
121     	409542246104	84
121     	414652410482	68
121     	669515708071	73
121     	649921994715	123
121     	721857506010	71
121     	400127531270	73
121     	740581174440	58
121     	859109096191	129
121     	314482481265	130
121     	139669412174	89
121     	290827207620	102
121     	863129185304	122
121     	284083366181	66
121     	979700065093	56
121     	718971287692	50
121     	765572003296	96
121     	982079076090	95
121     	948543507361	118
121     	566877828296	102
121     	646511826677	52
121     	939369924082	133
121     	679453075525	142
121     	418604295928	64
121     	998040421944	81
121     	413227470171	101
121     	126834215166	97
121     	633320411611	72
121     	412348931569	55
121     	261188186216	119
121     	833663232208	142
121     	576518370019	149
121     	316871031375	52
121     	250617599940	53
121     	194144382996	72
121     	839518983686	145
121     	849681336901	137
121     	398900612810	75
121     	187272692439	106
121     	529831629045	56
121     	450659382698	95
121     	146051347589	71
121     	916984241291	147
121     	902956788286	80
121     	154554749200	126
121     	103362565865	67
121     	317663070530	81
121     	207178796787	98
121     	453357640486	99
121     	419446364450	130
121     	696368469198	85
122     	556388862616	123
122     	576518370019	142
122     	330700905340	55
122     	646511826677	120
122     	334425348148	72
122     	986065693858	126
122     	698718941817	83
122     	557899454410	144
122     	765572003296	111
122     	952550789390	117
122     	127026679653	147
122     	400930079611	74
122     	939369924082	71
122     	786975743876	116
122     	290827207620	80
122     	272121204465	51
122     	523196696835	68
122     	636021875565	87
122     	875605607431	128
122     	154554749200	150
122     	67014520356 	90
122     	322758894316	144
122     	173672457176	105
122     	265444172694	121
122     	129753980851	112
122     	875125493289	100
122     	187272692439	59
122     	894482053097	109
122     	384468659793	148
122     	308440276732	115
122     	962728896848	149
122     	246144606961	106
122     	506298714832	140
122     	863129185304	104
122     	381299535788	97
122     	132186536765	55
122     	495776106616	117
122     	893005812666	140
122     	383476286895	128
122     	547244118460	149
122     	849681336901	71
122     	803607788754	97
122     	716818652888	70
122     	483738463713	127
122     	314482481265	94
122     	861348595761	129
122     	679453075525	53
122     	754664511022	142
122     	457459442332	131
122     	721857506010	79
122     	702830548447	86
122     	534109743798	66
122     	349330324726	88
122     	882152991390	129
122     	771137437634	51
122     	608852371253	68
122     	334074319971	128
122     	994411186239	82
122     	566877828296	58
122     	425456990082	143
122     	409542246104	122
122     	941976384328	115
123     	314482481265	80
123     	939369924082	50
123     	488529033803	146
123     	740581174440	75
123     	649921994715	112
123     	660310920540	50
123     	189470486214	100
123     	716818652888	83
123     	569219762080	130
123     	389169531271	106
123     	896919583724	85
123     	718971287692	71
123     	227635917829	103
123     	297083512852	59
123     	419446364450	108
123     	435122760857	122
123     	629919786056	56
123     	152614854189	129
123     	706236730898	126
123     	925484684473	150
123     	600770885624	150
123     	882152991390	115
123     	411067277447	142
123     	134390993040	120
123     	286243122717	70
123     	140903716305	145
123     	567657950596	51
123     	103362565865	82
123     	250617599940	71
123     	849681336901	81
123     	380734371410	52
123     	902956788286	71
123     	132954606361	57
123     	208174494479	105
123     	435583017631	59
123     	945012228482	81
123     	556388862616	143
123     	557899454410	54
123     	563144943925	75
123     	945312847530	137
123     	246144606961	150
123     	473186595371	87
123     	364745567029	58
123     	877194198700	114
123     	769357296879	140
123     	330700905340	95
123     	453357640486	52
123     	630929030795	97
123     	199753522658	87
123     	590034051433	98
123     	300475101700	94
123     	67014520356 	144
123     	916984241291	66
123     	805966823208	114
123     	749625390019	85
124     	673737891943	51
124     	902956788286	144
124     	871701186034	121
124     	904647940449	69
124     	265444172694	63
124     	388403878360	132
124     	435122760857	65
124     	514254550616	85
124     	899657914264	70
124     	418604295928	71
124     	740581174440	150
124     	939369924082	78
124     	508818965558	148
124     	547244118460	119
124     	334074319971	103
124     	923237099384	131
124     	706236730898	63
124     	490997846898	68
124     	636021875565	99
124     	563144943925	110
124     	380734371410	108
124     	925484684473	72
124     	523196696835	56
124     	805966823208	96
124     	413227470171	114
124     	207178796787	87
124     	863129185304	80
124     	159425007904	105
124     	453357640486	98
124     	603333456348	65
124     	509762284879	139
124     	132954606361	98
124     	741544174664	92
124     	467615168772	69
124     	945312847530	123
124     	749193678427	53
124     	549746556299	87
124     	330700905340	120
124     	250617599940	109
124     	516286957430	63
124     	261188186216	145
124     	816260222588	130
124     	945012228482	67
124     	411067277447	65
124     	194144382996	110
124     	893005812666	71
124     	732970729968	92
124     	339589987290	58
124     	941976384328	132
124     	126834215166	88
124     	349330324726	69
124     	722946564026	95
124     	630929030795	112
124     	536851950801	73
124     	999543417737	109
124     	998040421944	117
124     	152614854189	125
124     	189470486214	63
124     	419481071217	108
124     	284083366181	64
124     	554521191996	60
124     	669515708071	145
124     	425456990082	76
124     	702421087613	139
124     	873640709962	98
124     	473186595371	95
124     	272121204465	145
124     	660310920540	103
124     	511511692317	61
124     	919197823026	134
124     	274761600136	137
124     	692492393712	51
124     	646511826677	129
124     	377848719039	50
124     	317663070530	83
124     	412348931569	51
124     	828509049873	122
124     	896919583724	61
124     	375276903331	52
124     	547685258313	59
124     	556388862616	137
124     	578147508823	82
124     	103362565865	56
124     	887528437482	147
124     	771137437634	68
124     	199968033019	81
124     	495776106616	139
124     	979700065093	54
124     	467986934495	62
124     	108326062706	77
124     	373709485267	108
124     	849681336901	90
124     	264132323061	76
124     	398900612810	118
124     	349435998924	143
124     	838962966418	58
124     	316871031375	120
124     	234646454745	59
124     	176404904473	121
124     	450659382698	75
124     	389169531271	104
124     	364745567029	91
124     	894482053097	146
124     	113476782830	135
124     	754664511022	123
124     	982079076090	60
124     	996103067914	147
124     	839518983686	84
124     	948543507361	117
124     	334425348148	79
124     	400127531270	146
124     	146051347589	85
124     	962728896848	125
124     	618570550236	57
124     	308440276732	147
124     	589814450967	136
124     	721857506010	146
124     	600770885624	70
124     	172950643766	130
124     	435583017631	139
124     	173672457176	124
124     	697814031389	101
124     	384179652400	91
124     	252522255166	114
124     	187272692439	113
124     	167742802915	126
124     	286243122717	143
124     	488529033803	60
124     	409542246104	64
124     	444797600349	124
124     	803607788754	121
124     	557899454410	57
124     	180531962334	104
124     	118389501460	126
124     	572878568883	81
124     	528771298719	103
124     	168074802141	80
124     	419446364450	78
124     	227635917829	81
124     	578705048123	67
124     	108649313374	90
124     	944472664850	95
124     	482340522139	74
125     	488529033803	132
125     	894482053097	113
125     	534109743798	69
125     	334074319971	117
125     	636021875565	77
125     	536851950801	56
125     	172950643766	135
125     	979700065093	60
125     	425456990082	140
125     	673737891943	61
125     	775611741635	113
125     	642234808130	60
125     	398900612810	88
125     	709229053555	97
125     	590034051433	106
125     	308792010934	141
125     	419481071217	122
125     	418604295928	116
125     	933914210509	89
125     	770565227675	74
125     	316871031375	60
125     	384179652400	106
125     	873640709962	135
125     	697814031389	116
125     	887528437482	86
125     	483738463713	136
125     	769357296879	66
125     	373709485267	96
125     	207178796787	52
125     	444797600349	125
125     	849681336901	107
125     	698718941817	129
125     	741544174664	83
125     	669515708071	74
125     	286243122717	145
125     	482340522139	72
125     	294993047536	115
125     	495776106616	81
125     	300475101700	135
125     	563144943925	79
125     	567657950596	150
125     	375276903331	103
125     	139669412174	70
125     	523196696835	131
125     	902956788286	65
125     	702421087613	148
125     	246144606961	72
125     	388403878360	71
125     	250617599940	145
125     	334425348148	137
125     	67014520356 	115
125     	529831629045	76
125     	875125493289	93
125     	877194198700	59
125     	103362565865	96
125     	132186536765	64
125     	174237001203	88
125     	308440276732	121
125     	412348931569	54
125     	754664511022	87
125     	205930062465	92
125     	740581174440	96
125     	450659382698	98
125     	118389501460	100
125     	771137437634	108
125     	189470486214	117
125     	618570550236	82
125     	527453991710	59
125     	557899454410	97
125     	945312847530	149
125     	108326062706	92
125     	126834215166	104
125     	490997846898	107
125     	630929030795	87
125     	706236730898	115
125     	556388862616	90
125     	389169531271	69
125     	146051347589	86
125     	558886167633	81
125     	718971287692	122
125     	836900805029	124
125     	702830548447	110
125     	349330324726	118
125     	916984241291	94
125     	732970729968	53
125     	986202008726	79
125     	660310920540	97
125     	435583017631	109
125     	159425007904	116
125     	649921994715	130
125     	314482481265	120
125     	336491915536	145
125     	473186595371	70
125     	509762284879	138
125     	377848719039	96
125     	152614854189	121
125     	511511692317	88
125     	566877828296	74
125     	210526151030	101
125     	982079076090	130
125     	994411186239	73
125     	117431954043	144
125     	828509049873	141
125     	168074802141	109
125     	896919583724	55
125     	608852371253	136
125     	576518370019	100
125     	261188186216	89
125     	948543507361	67
125     	420756960291	85
125     	643925479319	126
125     	180531962334	138
125     	252522255166	59
125     	234646454745	144
125     	518787417161	55
125     	986065693858	125
125     	203262278452	71
125     	589814450967	91
125     	882152991390	144
125     	805966823208	135
125     	317663070530	112
125     	414652410482	135
125     	508818965558	85
125     	154554749200	140
125     	272121204465	60
125     	569219762080	82
125     	413227470171	69
125     	833663232208	148
125     	467986934495	63
125     	839518983686	58
125     	525199185853	113
126     	578147508823	99
126     	893005812666	124
126     	132954606361	143
126     	718971287692	128
126     	646511826677	96
126     	103362565865	148
126     	696368469198	84
126     	933914210509	130
126     	419481071217	116
126     	654563447110	118
126     	413227470171	95
126     	334425348148	102
126     	516495915668	91
126     	144568875894	146
126     	336491915536	114
126     	754664511022	123
126     	871701186034	85
126     	643925479319	141
126     	945312847530	52
126     	488529033803	142
126     	174237001203	70
126     	509762284879	98
126     	925173129386	122
126     	159425007904	85
126     	894482053097	119
126     	836900805029	115
126     	118389501460	77
126     	398900612810	115
126     	786975743876	55
126     	630929030795	146
126     	411067277447	90
126     	839518983686	110
126     	776538360607	99
126     	208174494479	128
126     	435583017631	51
126     	316871031375	77
126     	769357296879	60
126     	642234808130	103
126     	833663232208	55
126     	875605607431	51
126     	569219762080	54
126     	176404904473	149
126     	709229053555	76
126     	558886167633	79
126     	265444172694	116
126     	518329844939	140
126     	547685258313	97
126     	740581174440	128
126     	873640709962	131
126     	506298714832	54
126     	381299535788	146
126     	528771298719	84
126     	172950643766	92
126     	692492393712	63
126     	608852371253	146
126     	482340522139	130
126     	205930062465	116
126     	207178796787	142
126     	568658660566	86
126     	859109096191	53
126     	482429892907	62
126     	286243122717	150
126     	979700065093	74
126     	529831629045	93
126     	317663070530	60
126     	741544174664	117
126     	882152991390	50
126     	998040421944	133
126     	167742802915	141
126     	380734371410	100
126     	849681336901	115
126     	765572003296	83
126     	556388862616	84
126     	629919786056	138
126     	923237099384	86
126     	749625390019	115
126     	814141265887	130
126     	139669412174	70
126     	419446364450	52
126     	563144943925	97
126     	140903716305	144
126     	944472664850	125
126     	132186536765	129
126     	129753980851	93
126     	899657914264	51
126     	312237459250	80
126     	986202008726	87
126     	495776106616	111
126     	516286957430	65
126     	572878568883	92
126     	732970729968	137
126     	227635917829	123
126     	154554749200	90
127     	952550789390	79
127     	698718941817	119
127     	554521191996	53
127     	172950643766	108
127     	979700065093	83
127     	896919583724	92
127     	771137437634	80
127     	203262278452	131
127     	453357640486	84
127     	558886167633	115
127     	669515708071	135
127     	660310920540	127
127     	205930062465	61
127     	118389501460	87
127     	435122760857	66
127     	523196696835	84
127     	495776106616	109
127     	525199185853	93
127     	375276903331	87
127     	828509049873	132
127     	557899454410	94
127     	67014520356 	130
127     	364745567029	71
127     	706236730898	76
127     	379942304309	119
127     	312237459250	101
127     	873640709962	121
127     	274761600136	58
127     	877194198700	127
127     	467986934495	98
127     	893005812666	64
127     	770565227675	100
127     	750886611187	91
127     	836900805029	64
127     	849681336901	63
127     	113476782830	96
127     	547244118460	95
127     	506298714832	81
127     	349435998924	101
127     	412348931569	105
127     	566877828296	108
127     	556388862616	80
127     	749193678427	61
127     	419481071217	57
127     	887528437482	95
127     	529831629045	140
127     	246144606961	100
127     	400127531270	105
127     	290827207620	129
127     	300475101700	93
127     	568658660566	80
127     	862174790606	146
127     	765572003296	65
127     	174237001203	130
127     	511511692317	88
127     	176404904473	133
127     	769357296879	143
127     	444797600349	130
127     	414652410482	90
127     	173672457176	100
127     	721857506010	97
127     	702830548447	66
127     	925484684473	77
127     	869112308003	116
127     	272121204465	129
127     	569219762080	60
127     	146051347589	107
127     	692492393712	52
127     	547685258313	101
127     	646511826677	111
127     	994411186239	73
127     	549746556299	58
127     	654563447110	78
127     	127026679653	148
127     	567657950596	101
127     	168074802141	87
127     	803607788754	109
127     	871701186034	135
127     	534109743798	81
127     	516286957430	129
127     	421337093409	142
127     	939369924082	134
127     	919197823026	87
127     	126834215166	96
127     	381299535788	99
127     	629919786056	140
127     	514254550616	57
127     	899657914264	112
127     	467615168772	75
128     	383476286895	112
128     	373709485267	65
128     	250617599940	147
128     	896919583724	90
128     	556388862616	69
128     	643925479319	55
128     	411067277447	133
128     	873640709962	91
128     	869112308003	103
128     	566877828296	126
128     	108326062706	117
128     	945312847530	131
128     	933914210509	53
128     	882152991390	69
128     	999543417737	144
128     	786975743876	103
128     	982079076090	138
128     	379942304309	56
128     	154554749200	85
128     	646511826677	88
128     	418604295928	59
128     	660310920540	110
128     	444797600349	111
128     	139669412174	63
128     	875125493289	78
128     	608852371253	139
128     	887528437482	58
128     	187272692439	70
128     	108649313374	109
128     	334074319971	59
128     	948543507361	126
128     	979700065093	110
128     	569219762080	104
128     	482340522139	50
128     	702421087613	53
128     	576518370019	54
128     	483738463713	139
128     	839518983686	117
128     	919197823026	105
128     	986202008726	88
128     	377848719039	69
128     	67014520356 	63
128     	741544174664	97
128     	322758894316	146
128     	863129185304	110
128     	316871031375	132
128     	284083366181	114
128     	330700905340	131
128     	749625390019	60
128     	557899454410	82
128     	572878568883	70
128     	567657950596	74
128     	925484684473	109
128     	523196696835	57
128     	334425348148	77
128     	413227470171	134
128     	816260222588	59
128     	518329844939	60
128     	732970729968	146
128     	962728896848	126
128     	246144606961	105
128     	871701186034	58
128     	173672457176	63
128     	312237459250	134
128     	430946284790	91
128     	578147508823	135
128     	364745567029	111
128     	939369924082	102
128     	126834215166	61
128     	590034051433	52
128     	814141265887	139
128     	629919786056	80
128     	152614854189	101
128     	400127531270	86
128     	103362565865	91
128     	805966823208	67
128     	642234808130	62
128     	516286957430	106
128     	996103067914	92
128     	547685258313	113
128     	516495915668	106
128     	836900805029	61
128     	176404904473	54
128     	578705048123	102
128     	649921994715	145
128     	134390993040	92
128     	893005812666	98
128     	952550789390	130
128     	384468659793	69
128     	600770885624	114
128     	314482481265	127
128     	127026679653	76
128     	132954606361	111
128     	349435998924	67
128     	274761600136	53
128     	457459442332	64
128     	633320411611	146
128     	775611741635	51
128     	769357296879	71
128     	473186595371	108
128     	290827207620	67
128     	252522255166	103
128     	412348931569	145
128     	549746556299	116
128     	199753522658	92
128     	636021875565	106
128     	673737891943	54
128     	210526151030	88
128     	998040421944	114
128     	227635917829	87
128     	902956788286	112
128     	718971287692	85
128     	264132323061	63
128     	536851950801	84
128     	389169531271	77
128     	168074802141	83
128     	490997846898	57
128     	317663070530	138
128     	868744054130	53
128     	117431954043	89
128     	144568875894	140
128     	765572003296	121
128     	113476782830	76
129     	887528437482	86
129     	312237459250	51
129     	187272692439	94
129     	132186536765	94
129     	108649313374	61
129     	339589987290	57
129     	457459442332	61
129     	140903716305	59
129     	467986934495	88
129     	286243122717	75
129     	506298714832	91
129     	435122760857	116
129     	566877828296	120
129     	986065693858	112
129     	126834215166	67
129     	314482481265	102
129     	982079076090	65
129     	144568875894	115
129     	925484684473	93
129     	696368469198	97
129     	882152991390	121
129     	939369924082	70
129     	643925479319	67
129     	482429892907	137
129     	205930062465	54
129     	775611741635	72
129     	398900612810	63
129     	490997846898	66
129     	473186595371	144
129     	176404904473	59
129     	567657950596	79
129     	482340522139	62
129     	608852371253	109
129     	962728896848	67
129     	877194198700	135
129     	589814450967	132
129     	836900805029	104
129     	869112308003	127
129     	488529033803	143
129     	750886611187	88
129     	536851950801	80
129     	264132323061	50
129     	558886167633	123
129     	467615168772	146
129     	152614854189	103
129     	833663232208	119
129     	435583017631	62
129     	421337093409	103
129     	349435998924	59
129     	828509049873	75
129     	317663070530	118
129     	265444172694	70
129     	425456990082	104
129     	633320411611	82
129     	246144606961	121
129     	916984241291	94
129     	702830548447	79
129     	495776106616	150
129     	527453991710	52
129     	132954606361	123
129     	630929030795	79
129     	740581174440	113
129     	534109743798	133
129     	814141265887	97
129     	199968033019	66
129     	174237001203	116
129     	334425348148	110
129     	732970729968	98
129     	893005812666	132
129     	330700905340	74
129     	154554749200	109
129     	749193678427	128
129     	861348595761	133
129     	952550789390	65
129     	786975743876	126
129     	194144382996	124
129     	227635917829	135
130     	349330324726	89
130     	444797600349	123
130     	398900612810	89
130     	923237099384	98
130     	127026679653	119
130     	412348931569	117
130     	413227470171	145
130     	547244118460	115
130     	618570550236	98
130     	839518983686	61
130     	771137437634	86
130     	750886611187	84
130     	765572003296	78
130     	103362565865	106
130     	996103067914	69
130     	939369924082	53
130     	986065693858	119
130     	525199185853	135
130     	529831629045	132
130     	384468659793	86
130     	769357296879	88
130     	836900805029	53
130     	482429892907	120
130     	603333456348	122
130     	999543417737	69
130     	227635917829	131
130     	722946564026	95
130     	862174790606	100
130     	379942304309	95
130     	786975743876	124
130     	308440276732	116
130     	549746556299	141
130     	875125493289	139
130     	457459442332	120
130     	508818965558	134
130     	495776106616	51
130     	702421087613	74
130     	660310920540	128
130     	509762284879	119
130     	189470486214	105
130     	566877828296	127
130     	629919786056	125
130     	203262278452	120
130     	904647940449	85
130     	654563447110	106
130     	986202008726	95
130     	600770885624	126
130     	776538360607	126
130     	194144382996	138
130     	859109096191	81
130     	558886167633	136
130     	569219762080	71
130     	414652410482	67
130     	871701186034	108
130     	234646454745	59
130     	572878568883	125
130     	199968033019	128
130     	944472664850	107
130     	486804801433	135
130     	563144943925	140
130     	435583017631	66
130     	536851950801	90
130     	578705048123	88
130     	250617599940	64
130     	749193678427	123
130     	381299535788	53
130     	873640709962	88
130     	425456990082	108
130     	383476286895	51
130     	718971287692	123
130     	129753980851	122
130     	384179652400	83
130     	286243122717	124
130     	925173129386	97
130     	838962966418	50
130     	389169531271	106
130     	933914210509	120
130     	896919583724	147
130     	828509049873	127
130     	330700905340	55
130     	435122760857	66
130     	887528437482	147
130     	453357640486	79
130     	334074319971	135
130     	770565227675	93
130     	894482053097	57
130     	246144606961	51
130     	673737891943	87
130     	314482481265	104
130     	962728896848	143
130     	264132323061	91
130     	207178796787	75
130     	679453075525	55
130     	400127531270	61
130     	514254550616	84
130     	982079076090	65
130     	364745567029	57
130     	919197823026	131
130     	589814450967	140
130     	490997846898	83
130     	173672457176	124
130     	168074802141	62
130     	421337093409	145
130     	205930062465	62
130     	578147508823	131
130     	882152991390	129
131     	750886611187	86
131     	998040421944	108
131     	875605607431	129
131     	113476782830	148
131     	207178796787	60
131     	741544174664	94
131     	569219762080	73
131     	126834215166	133
131     	893005812666	128
131     	334425348148	87
131     	948543507361	133
131     	419481071217	82
131     	527453991710	56
131     	887528437482	135
131     	495776106616	129
131     	999543417737	73
131     	839518983686	86
131     	312237459250	138
131     	618570550236	108
131     	836900805029	133
131     	174237001203	76
131     	294993047536	115
131     	765572003296	95
131     	154554749200	90
131     	420756960291	91
131     	941976384328	58
131     	414652410482	93
131     	514254550616	88
131     	859109096191	55
131     	167742802915	74
131     	384179652400	56
131     	629919786056	64
131     	776538360607	131
131     	525199185853	144
131     	173672457176	145
131     	849681336901	124
131     	516495915668	94
131     	435122760857	99
131     	373709485267	68
131     	716818652888	119
131     	814141265887	127
131     	904647940449	144
131     	205930062465	150
131     	139669412174	149
131     	982079076090	54
131     	172950643766	125
131     	118389501460	64
131     	379942304309	53
131     	511511692317	121
131     	875125493289	120
131     	558886167633	130
131     	336491915536	142
131     	933914210509	117
131     	578705048123	55
131     	877194198700	93
131     	246144606961	58
131     	384468659793	93
131     	994411186239	80
131     	805966823208	104
131     	633320411611	78
131     	536851950801	64
131     	377848719039	80
131     	509762284879	94
131     	697814031389	58
131     	308440276732	106
131     	556388862616	110
131     	349435998924	65
131     	314482481265	90
131     	140903716305	143
131     	547685258313	145
131     	457459442332	112
131     	187272692439	53
131     	732970729968	76
131     	572878568883	123
131     	132186536765	61
131     	400930079611	76
131     	409542246104	113
131     	646511826677	52
131     	925484684473	119
131     	189470486214	53
131     	413227470171	103
131     	380734371410	120
131     	375276903331	150
131     	506298714832	117
131     	654563447110	72
131     	754664511022	63
131     	769357296879	86
131     	557899454410	125
131     	589814450967	60
131     	297083512852	75
131     	696368469198	120
131     	117431954043	101
131     	775611741635	57
131     	482340522139	131
131     	563144943925	86
131     	600770885624	72
131     	862174790606	127
131     	388403878360	124
131     	833663232208	102
131     	199753522658	123
131     	418604295928	107
131     	882152991390	76
131     	721857506010	91
131     	919197823026	104
131     	603333456348	144
131     	566877828296	150
131     	702830548447	112
131     	916984241291	87
131     	284083366181	150
131     	923237099384	96
131     	986202008726	77
131     	425456990082	136
131     	334074319971	140
131     	412348931569	141
131     	549746556299	86
131     	421337093409	86
132     	180531962334	136
132     	457459442332	116
132     	882152991390	132
132     	896919583724	87
132     	862174790606	67
132     	549746556299	106
132     	349435998924	63
132     	982079076090	130
132     	765572003296	100
132     	419481071217	90
132     	483738463713	116
132     	103362565865	149
132     	450659382698	146
132     	925173129386	99
132     	252522255166	83
132     	750886611187	138
132     	527453991710	125
132     	986065693858	102
132     	364745567029	60
132     	261188186216	61
132     	205930062465	62
132     	381299535788	111
132     	425456990082	93
132     	467986934495	104
132     	534109743798	60
132     	660310920540	123
132     	290827207620	111
132     	600770885624	113
132     	286243122717	104
132     	486804801433	71
132     	654563447110	52
132     	576518370019	127
132     	317663070530	131
132     	118389501460	147
132     	272121204465	61
132     	227635917829	60
132     	646511826677	96
132     	274761600136	87
132     	411067277447	101
132     	339589987290	87
132     	250617599940	150
132     	113476782830	108
132     	979700065093	51
132     	129753980851	91
132     	322758894316	140
132     	803607788754	124
132     	482429892907	82
132     	919197823026	61
132     	986202008726	112
132     	998040421944	123
132     	334425348148	140
132     	994411186239	146
132     	868744054130	116
132     	265444172694	59
132     	140903716305	142
132     	208174494479	57
132     	314482481265	105
132     	776538360607	84
132     	377848719039	125
132     	173672457176	134
132     	702830548447	80
132     	312237459250	80
132     	379942304309	83
132     	741544174664	104
132     	740581174440	71
132     	384179652400	149
132     	380734371410	113
132     	669515708071	83
132     	430946284790	58
132     	873640709962	68
132     	234646454745	60
132     	629919786056	69
132     	418604295928	99
132     	536851950801	110
132     	467615168772	98
132     	568658660566	81
132     	414652410482	55
132     	849681336901	86
132     	132954606361	55
132     	643925479319	80
132     	572878568883	111
132     	893005812666	111
132     	952550789390	76
132     	578147508823	82
132     	871701186034	128
132     	308792010934	146
132     	529831629045	136
132     	558886167633	115
132     	556388862616	115
132     	618570550236	116
132     	67014520356 	112
132     	189470486214	82
132     	814141265887	112
132     	590034051433	54
132     	706236730898	60
132     	933914210509	77
132     	172950643766	68
132     	630929030795	93
132     	330700905340	146
132     	962728896848	91
132     	899657914264	130
132     	284083366181	55
132     	633320411611	74
132     	488529033803	144
132     	578705048123	84
132     	264132323061	87
132     	297083512852	85
132     	509762284879	95
132     	435122760857	136
132     	490997846898	134
132     	453357640486	114
133     	933914210509	101
133     	939369924082	83
133     	875605607431	111
133     	979700065093	126
133     	108649313374	137
133     	261188186216	132
133     	384468659793	67
133     	590034051433	138
133     	377848719039	83
133     	894482053097	66
133     	425456990082	138
133     	264132323061	87
133     	629919786056	143
133     	692492393712	110
133     	173672457176	75
133     	882152991390	122
133     	741544174664	150
133     	750886611187	114
133     	419446364450	113
133     	199968033019	90
133     	572878568883	51
133     	702421087613	94
133     	364745567029	133
133     	132186536765	107
133     	816260222588	138
133     	389169531271	56
133     	144568875894	85
133     	679453075525	54
133     	384179652400	76
133     	528771298719	132
133     	373709485267	75
133     	203262278452	83
133     	633320411611	123
133     	117431954043	108
133     	450659382698	133
133     	805966823208	106
133     	770565227675	52
133     	444797600349	91
133     	732970729968	95
133     	904647940449	116
133     	776538360607	104
133     	722946564026	95
133     	294993047536	57
133     	246144606961	76
133     	316871031375	79
133     	398900612810	90
133     	896919583724	93
133     	786975743876	128
133     	418604295928	55
133     	527453991710	76
133     	146051347589	66
133     	139669412174	137
133     	210526151030	96
133     	563144943925	119
133     	286243122717	126
133     	999543417737	63
133     	411067277447	79
133     	506298714832	97
133     	473186595371	78
133     	379942304309	118
133     	159425007904	66
133     	952550789390	125
133     	127026679653	51
133     	516286957430	52
133     	349435998924	133
133     	308440276732	88
133     	336491915536	95
133     	578147508823	116
133     	453357640486	78
133     	916984241291	127
133     	578705048123	88
133     	516495915668	73
133     	765572003296	71
133     	754664511022	108
133     	649921994715	118
133     	769357296879	103
133     	234646454745	68
133     	467615168772	141
133     	869112308003	59
133     	636021875565	150
133     	108326062706	62
133     	412348931569	90
133     	129753980851	62
133     	174237001203	130
133     	380734371410	90
133     	873640709962	134
133     	698718941817	114
133     	126834215166	133
133     	375276903331	88
133     	568658660566	57
133     	435122760857	55
133     	618570550236	67
133     	859109096191	80
133     	132954606361	75
133     	140903716305	119
133     	486804801433	57
133     	814141265887	93
133     	996103067914	56
133     	740581174440	61
133     	529831629045	116
133     	871701186034	101
133     	194144382996	59
133     	962728896848	125
133     	314482481265	74
133     	490997846898	93
133     	899657914264	76
133     	388403878360	98
133     	435583017631	101
133     	986065693858	71
133     	838962966418	97
133     	861348595761	61
133     	554521191996	74
133     	495776106616	145
133     	919197823026	144
133     	400127531270	144
133     	945012228482	84
133     	836900805029	114
133     	547685258313	50
133     	709229053555	78
133     	274761600136	133
133     	511511692317	77
133     	383476286895	102
133     	208174494479	134
133     	945312847530	107
133     	312237459250	94
134     	473186595371	93
134     	297083512852	57
134     	925484684473	142
134     	210526151030	103
134     	749625390019	102
134     	265444172694	120
134     	139669412174	111
134     	126834215166	134
134     	941976384328	101
134     	167742802915	64
134     	706236730898	144
134     	769357296879	108
134     	420756960291	135
134     	411067277447	130
134     	702421087613	117
134     	732970729968	129
134     	435583017631	123
134     	453357640486	102
134     	578705048123	50
134     	636021875565	72
134     	511511692317	127
134     	523196696835	86
134     	483738463713	112
134     	673737891943	126
134     	189470486214	76
134     	467615168772	118
134     	413227470171	100
134     	868744054130	142
134     	294993047536	113
134     	412348931569	131
134     	740581174440	109
134     	314482481265	116
134     	805966823208	133
134     	312237459250	80
134     	419446364450	145
134     	603333456348	144
134     	379942304309	66
134     	861348595761	108
134     	380734371410	66
134     	67014520356 	56
134     	589814450967	52
134     	698718941817	84
134     	557899454410	75
134     	654563447110	56
134     	962728896848	70
134     	482340522139	57
134     	894482053097	53
134     	576518370019	111
134     	414652410482	150
134     	919197823026	138
134     	669515708071	123
134     	569219762080	129
134     	234646454745	132
134     	419481071217	69
134     	873640709962	116
134     	882152991390	81
134     	199753522658	132
134     	933914210509	143
134     	457459442332	145
134     	814141265887	69
134     	308792010934	75
134     	316871031375	105
134     	168074802141	81
134     	334074319971	128
134     	547685258313	82
134     	643925479319	116
134     	514254550616	70
134     	916984241291	66
134     	384468659793	142
134     	590034051433	110
134     	893005812666	110
134     	509762284879	131
134     	339589987290	91
134     	618570550236	139
134     	377848719039	88
134     	373709485267	113
134     	375276903331	64
134     	776538360607	73
134     	679453075525	54
134     	334425348148	67
134     	945312847530	138
134     	771137437634	150
134     	923237099384	146
134     	716818652888	139
134     	979700065093	88
134     	274761600136	103
134     	869112308003	56
134     	308440276732	88
134     	578147508823	116
134     	176404904473	133
134     	467986934495	88
134     	488529033803	73
134     	506298714832	66
134     	435122760857	87
134     	945012228482	50
134     	549746556299	110
134     	388403878360	106
134     	132186536765	136
134     	508818965558	74
134     	490997846898	127
134     	944472664850	76
134     	421337093409	71
134     	250617599940	102
134     	692492393712	51
134     	630929030795	113
134     	364745567029	66
134     	896919583724	53
134     	518329844939	127
134     	722946564026	148
134     	925173129386	68
134     	425456990082	75
134     	875125493289	78
134     	754664511022	95
134     	741544174664	81
134     	349330324726	72
134     	384179652400	58
134     	999543417737	65
134     	264132323061	127
134     	529831629045	132
134     	317663070530	72
134     	383476286895	107
134     	996103067914	120
134     	290827207620	111
134     	444797600349	56
134     	400127531270	131
134     	398900612810	62
134     	536851950801	51
134     	173672457176	93
134     	129753980851	93
134     	381299535788	148
134     	786975743876	115
134     	349435998924	97
134     	330700905340	114
135     	265444172694	98
135     	187272692439	85
135     	939369924082	89
135     	450659382698	146
135     	982079076090	80
135     	702830548447	75
135     	603333456348	141
135     	117431954043	117
135     	863129185304	72
135     	154554749200	67
135     	349330324726	116
135     	732970729968	107
135     	608852371253	116
135     	547685258313	128
135     	159425007904	141
135     	473186595371	144
135     	506298714832	101
135     	722946564026	88
135     	569219762080	102
135     	508818965558	132
135     	140903716305	73
135     	418604295928	146
135     	300475101700	97
135     	511511692317	139
135     	409542246104	59
135     	527453991710	127
135     	642234808130	93
135     	364745567029	135
135     	413227470171	72
135     	330700905340	104
135     	875125493289	139
135     	679453075525	135
135     	669515708071	113
135     	996103067914	71
135     	572878568883	103
135     	264132323061	122
135     	692492393712	55
135     	765572003296	107
135     	618570550236	148
135     	952550789390	70
135     	103362565865	105
135     	873640709962	139
135     	132186536765	75
135     	139669412174	135
135     	590034051433	77
135     	129753980851	75
135     	173672457176	100
135     	839518983686	81
135     	261188186216	69
135     	373709485267	103
135     	234646454745	66
135     	945312847530	119
135     	775611741635	89
135     	786975743876	126
135     	576518370019	87
135     	495776106616	111
135     	176404904473	80
135     	600770885624	51
135     	899657914264	137
136     	384468659793	98
136     	654563447110	74
136     	816260222588	53
136     	126834215166	88
136     	709229053555	142
136     	314482481265	136
136     	558886167633	124
136     	702421087613	148
136     	718971287692	117
136     	159425007904	75
136     	986202008726	51
136     	411067277447	91
136     	457459442332	78
136     	261188186216	79
136     	486804801433	104
136     	246144606961	64
136     	488529033803	106
136     	805966823208	112
136     	669515708071	117
136     	132954606361	119
136     	833663232208	75
136     	453357640486	90
136     	518787417161	92
136     	516495915668	142
136     	875125493289	137
136     	925173129386	114
136     	643925479319	70
136     	364745567029	100
136     	771137437634	91
136     	388403878360	56
136     	862174790606	68
136     	836900805029	126
136     	203262278452	124
136     	673737891943	76
136     	698718941817	58
136     	349330324726	107
136     	702830548447	150
136     	377848719039	128
136     	873640709962	118
136     	608852371253	68
136     	322758894316	110
136     	776538360607	55
136     	962728896848	65
136     	117431954043	88
136     	174237001203	149
136     	849681336901	137
136     	786975743876	97
136     	514254550616	144
136     	887528437482	98
136     	450659382698	148
136     	205930062465	78
136     	199753522658	147
136     	482340522139	133
136     	139669412174	127
136     	398900612810	90
136     	210526151030	66
136     	536851950801	70
136     	986065693858	69
136     	706236730898	59
136     	923237099384	53
136     	227635917829	58
136     	741544174664	78
136     	529831629045	138
136     	636021875565	86
136     	916984241291	149
136     	578705048123	59
136     	381299535788	71
137     	833663232208	53
137     	642234808130	117
137     	816260222588	117
137     	384468659793	138
137     	945312847530	54
137     	962728896848	56
137     	425456990082	71
137     	430946284790	50
137     	771137437634	63
137     	673737891943	130
137     	904647940449	145
137     	312237459250	84
137     	557899454410	140
137     	482429892907	102
137     	294993047536	103
137     	563144943925	71
137     	882152991390	66
137     	654563447110	119
137     	290827207620	135
137     	630929030795	116
137     	578705048123	129
137     	893005812666	123
137     	649921994715	130
137     	839518983686	52
137     	444797600349	75
137     	805966823208	51
137     	261188186216	73
137     	566877828296	59
137     	274761600136	80
137     	916984241291	142
137     	264132323061	126
137     	435583017631	100
137     	411067277447	64
137     	144568875894	129
137     	589814450967	142
137     	300475101700	96
137     	518787417161	116
137     	250617599940	80
137     	176404904473	75
137     	272121204465	138
137     	925173129386	149
137     	982079076090	112
137     	692492393712	66
137     	786975743876	52
137     	869112308003	116
137     	126834215166	148
137     	389169531271	64
137     	590034051433	128
137     	776538360607	51
137     	286243122717	52
137     	205930062465	110
137     	698718941817	114
137     	994411186239	128
137     	453357640486	94
137     	887528437482	57
137     	769357296879	124
137     	709229053555	66
137     	159425007904	108
137     	450659382698	117
137     	349435998924	95
137     	896919583724	74
137     	380734371410	146
137     	194144382996	58
137     	861348595761	79
137     	516495915668	70
137     	316871031375	130
137     	134390993040	91
137     	569219762080	63
137     	749625390019	109
137     	488529033803	118
137     	998040421944	61
137     	467986934495	83
137     	174237001203	113
137     	167742802915	116
137     	388403878360	51
138     	317663070530	72
138     	176404904473	59
138     	904647940449	107
138     	322758894316	71
138     	284083366181	55
138     	117431954043	68
138     	381299535788	71
138     	642234808130	60
138     	944472664850	50
138     	660310920540	72
138     	435583017631	102
138     	618570550236	73
138     	692492393712	97
138     	633320411611	64
138     	208174494479	113
138     	939369924082	84
138     	511511692317	125
138     	421337093409	131
138     	649921994715	129
138     	375276903331	108
138     	274761600136	110
138     	776538360607	63
138     	180531962334	78
138     	630929030795	149
138     	803607788754	54
138     	536851950801	69
138     	398900612810	58
138     	457459442332	82
138     	833663232208	124
138     	199753522658	128
138     	948543507361	107
138     	590034051433	110
138     	749193678427	95
138     	144568875894	112
138     	308792010934	149
138     	923237099384	58
138     	525199185853	87
138     	246144606961	104
138     	871701186034	74
138     	750886611187	59
138     	549746556299	121
138     	962728896848	53
138     	409542246104	115
138     	330700905340	63
138     	419481071217	121
138     	982079076090	79
138     	529831629045	61
138     	527453991710	70
138     	467615168772	67
138     	349330324726	73
138     	941976384328	91
138     	765572003296	87
138     	159425007904	138
138     	925173129386	148
138     	877194198700	135
138     	412348931569	77
138     	608852371253	71
138     	400127531270	142
138     	945012228482	63
138     	563144943925	141
138     	400930079611	105
138     	893005812666	73
138     	569219762080	75
138     	174237001203	92
138     	103362565865	131
138     	414652410482	115
138     	286243122717	67
138     	486804801433	139
138     	636021875565	80
138     	384179652400	92
138     	334074319971	100
138     	294993047536	117
138     	473186595371	104
138     	516286957430	92
138     	482340522139	60
138     	698718941817	122
138     	861348595761	109
138     	547244118460	99
138     	127026679653	71
138     	706236730898	145
138     	373709485267	120
138     	945312847530	134
138     	816260222588	106
138     	453357640486	53
138     	514254550616	142
138     	576518370019	132
138     	899657914264	105
138     	389169531271	94
138     	534109743798	65
138     	696368469198	84
138     	679453075525	59
138     	875125493289	131
138     	902956788286	52
138     	334425348148	103
138     	265444172694	77
138     	518329844939	60
138     	450659382698	103
138     	600770885624	116
138     	483738463713	57
138     	771137437634	74
138     	863129185304	71
138     	146051347589	135
138     	272121204465	148
138     	203262278452	106
138     	250617599940	82
139     	536851950801	111
139     	152614854189	70
139     	330700905340	148
139     	875605607431	78
139     	861348595761	148
139     	649921994715	107
139     	572878568883	69
139     	603333456348	82
139     	716818652888	142
139     	994411186239	102
139     	952550789390	51
139     	199968033019	112
139     	776538360607	101
139     	518787417161	123
139     	741544174664	150
139     	118389501460	63
139     	863129185304	134
139     	334074319971	146
139     	849681336901	150
139     	941976384328	121
139     	511511692317	64
139     	803607788754	124
139     	871701186034	126
139     	899657914264	68
139     	375276903331	93
139     	384179652400	94
139     	261188186216	110
139     	172950643766	127
139     	482340522139	133
139     	600770885624	76
139     	154554749200	107
139     	896919583724	69
139     	272121204465	150
139     	187272692439	105
139     	696368469198	137
139     	750886611187	94
139     	467986934495	71
139     	412348931569	88
139     	999543417737	105
139     	419481071217	56
139     	945312847530	85
139     	67014520356 	125
139     	589814450967	88
139     	816260222588	142
139     	859109096191	83
139     	308792010934	82
139     	383476286895	143
139     	669515708071	51
139     	457459442332	136
139     	450659382698	148
139     	566877828296	60
139     	679453075525	129
139     	939369924082	90
139     	132954606361	117
139     	754664511022	130
139     	568658660566	55
139     	373709485267	71
139     	297083512852	131
139     	284083366181	77
139     	563144943925	117
139     	618570550236	128
139     	904647940449	101
139     	775611741635	100
139     	873640709962	56
139     	322758894316	119
139     	525199185853	131
139     	732970729968	124
139     	833663232208	96
139     	948543507361	70
139     	509762284879	69
139     	786975743876	132
139     	642234808130	102
139     	126834215166	51
139     	721857506010	98
139     	490997846898	114
139     	495776106616	71
139     	557899454410	52
139     	523196696835	53
139     	336491915536	129
139     	770565227675	109
139     	199753522658	84
139     	709229053555	52
139     	996103067914	91
139     	549746556299	99
139     	706236730898	114
139     	317663070530	106
139     	314482481265	150
139     	578705048123	71
139     	805966823208	113
139     	419446364450	128
139     	771137437634	95
139     	862174790606	70
139     	381299535788	100
139     	534109743798	78
139     	411067277447	119
139     	636021875565	59
139     	400930079611	89
139     	203262278452	66
139     	159425007904	124
139     	506298714832	98
139     	435583017631	142
139     	205930062465	138
139     	877194198700	88
139     	482429892907	140
139     	979700065093	66
139     	173672457176	93
139     	167742802915	144
139     	567657950596	121
139     	189470486214	127
139     	364745567029	79
139     	117431954043	89
139     	698718941817	141
139     	473186595371	55
139     	919197823026	138
139     	986065693858	114
139     	722946564026	137
139     	692492393712	125
139     	590034051433	127
139     	944472664850	86
139     	702830548447	79
139     	945012228482	104
139     	986202008726	55
139     	673737891943	143
139     	894482053097	143
139     	339589987290	51
139     	420756960291	112
139     	286243122717	68
139     	264132323061	91
140     	643925479319	68
140     	679453075525	110
140     	168074802141	100
140     	297083512852	77
140     	199968033019	50
140     	882152991390	121
140     	923237099384	109
140     	741544174664	84
140     	998040421944	52
140     	409542246104	139
140     	118389501460	117
140     	144568875894	110
140     	414652410482	147
140     	272121204465	146
140     	986065693858	76
140     	139669412174	132
140     	698718941817	118
140     	896919583724	81
140     	108326062706	98
140     	859109096191	78
140     	839518983686	63
140     	618570550236	147
140     	996103067914	74
140     	925173129386	118
140     	740581174440	59
140     	578705048123	52
140     	904647940449	82
140     	516286957430	105
140     	380734371410	148
140     	982079076090	60
140     	509762284879	99
140     	203262278452	102
140     	673737891943	56
140     	529831629045	115
140     	952550789390	54
140     	308792010934	54
140     	314482481265	144
140     	868744054130	125
140     	589814450967	114
140     	384468659793	115
140     	770565227675	82
140     	557899454410	112
140     	732970729968	108
140     	312237459250	97
140     	173672457176	72
140     	435122760857	80
140     	117431954043	144
140     	189470486214	54
140     	383476286895	116
140     	547244118460	93
140     	336491915536	103
140     	669515708071	113
140     	444797600349	57
140     	630929030795	106
140     	495776106616	110
140     	317663070530	50
140     	590034051433	120
140     	547685258313	132
140     	925484684473	137
140     	636021875565	68
140     	887528437482	61
140     	284083366181	118
140     	411067277447	59
140     	261188186216	72
140     	536851950801	136
140     	633320411611	137
140     	814141265887	140
140     	899657914264	67
141     	518329844939	70
141     	534109743798	91
141     	839518983686	69
141     	425456990082	123
141     	334425348148	61
141     	646511826677	57
141     	629919786056	93
141     	420756960291	73
141     	139669412174	123
141     	692492393712	117
141     	172950643766	66
141     	873640709962	53
141     	528771298719	68
141     	330700905340	139
141     	453357640486	105
141     	547685258313	94
141     	322758894316	107
141     	203262278452	126
141     	261188186216	78
141     	375276903331	103
141     	490997846898	86
141     	875605607431	122
141     	117431954043	138
141     	525199185853	70
141     	486804801433	61
141     	180531962334	126
141     	444797600349	80
141     	770565227675	60
141     	506298714832	128
141     	194144382996	79
141     	127026679653	53
141     	140903716305	90
141     	234646454745	106
141     	982079076090	111
141     	902956788286	121
141     	126834215166	114
141     	567657950596	132
141     	435583017631	89
141     	776538360607	141
141     	576518370019	94
141     	979700065093	53
141     	297083512852	148
141     	482340522139	148
141     	568658660566	146
141     	862174790606	71
141     	380734371410	139
141     	511511692317	122
141     	654563447110	68
141     	732970729968	137
141     	572878568883	143
141     	113476782830	63
141     	152614854189	65
141     	868744054130	73
141     	159425007904	77
141     	516495915668	137
141     	765572003296	127
141     	633320411611	104
141     	400930079611	59
141     	578147508823	111
141     	904647940449	100
141     	630929030795	74
141     	919197823026	102
141     	207178796787	60
141     	349330324726	70
141     	467986934495	74
141     	412348931569	104
141     	702421087613	100
141     	388403878360	105
141     	400127531270	113
141     	473186595371	66
141     	869112308003	115
141     	529831629045	122
141     	176404904473	54
141     	118389501460	107
141     	411067277447	100
141     	749193678427	105
141     	384468659793	150
141     	660310920540	109
141     	286243122717	90
141     	554521191996	143
141     	265444172694	85
141     	941976384328	124
141     	933914210509	55
141     	430946284790	102
141     	816260222588	123
141     	414652410482	138
141     	875125493289	115
141     	944472664850	145
141     	379942304309	79
141     	435122760857	111
141     	838962966418	98
141     	250617599940	74
141     	317663070530	146
141     	547244118460	121
141     	998040421944	127
141     	314482481265	94
141     	740581174440	122
141     	129753980851	124
141     	132186536765	112
141     	389169531271	117
141     	769357296879	119
141     	312237459250	60
141     	859109096191	109
141     	716818652888	140
141     	771137437634	146
141     	697814031389	64
141     	274761600136	101
141     	246144606961	137
141     	199753522658	107
141     	828509049873	147
141     	618570550236	143
141     	144568875894	113
141     	962728896848	76
141     	467615168772	57
141     	418604295928	51
141     	986202008726	150
141     	413227470171	75
141     	590034051433	66
141     	364745567029	127
141     	871701186034	55
141     	272121204465	115
141     	833663232208	81
141     	750886611187	112
141     	557899454410	88
141     	925173129386	73
141     	108326062706	85
141     	187272692439	63
141     	603333456348	145
141     	336491915536	72
141     	994411186239	122
141     	642234808130	115
141     	696368469198	106
141     	814141265887	52
141     	527453991710	83
141     	754664511022	90
141     	986065693858	123
141     	482429892907	89
141     	916984241291	51
141     	300475101700	134
141     	948543507361	111
142     	527453991710	58
142     	207178796787	128
142     	444797600349	76
142     	803607788754	138
142     	692492393712	127
142     	518329844939	110
142     	549746556299	61
142     	749625390019	119
142     	754664511022	91
142     	999543417737	95
142     	643925479319	102
142     	770565227675	52
142     	264132323061	94
142     	210526151030	142
142     	418604295928	117
142     	529831629045	102
142     	642234808130	131
142     	450659382698	75
142     	339589987290	137
142     	902956788286	130
142     	400127531270	115
142     	979700065093	70
142     	805966823208	110
142     	569219762080	97
142     	578705048123	73
142     	916984241291	73
142     	861348595761	94
142     	590034051433	134
142     	176404904473	91
142     	203262278452	81
142     	435122760857	118
142     	108649313374	74
142     	722946564026	139
142     	412348931569	141
142     	194144382996	136
142     	173672457176	66
142     	127026679653	61
142     	126834215166	124
142     	516286957430	122
142     	660310920540	78
142     	398900612810	128
142     	894482053097	149
142     	557899454410	116
142     	312237459250	79
142     	673737891943	106
142     	473186595371	118
142     	388403878360	140
142     	765572003296	111
142     	103362565865	90
142     	863129185304	55
142     	618570550236	82
142     	589814450967	111
142     	234646454745	102
142     	384179652400	104
142     	322758894316	73
142     	317663070530	57
142     	875125493289	107
142     	261188186216	99
142     	904647940449	146
142     	274761600136	118
142     	836900805029	57
142     	871701186034	118
142     	630929030795	94
142     	925173129386	99
142     	749193678427	135
142     	383476286895	142
142     	316871031375	73
142     	294993047536	113
142     	862174790606	59
142     	430946284790	118
142     	373709485267	56
142     	534109743798	51
142     	516495915668	79
142     	506298714832	107
142     	868744054130	145
142     	536851950801	104
142     	716818652888	149
142     	117431954043	93
142     	113476782830	80
142     	199753522658	69
142     	400930079611	62
142     	349435998924	62
142     	649921994715	58
142     	375276903331	138
142     	732970729968	53
142     	508818965558	79
142     	420756960291	77
142     	629919786056	139
142     	556388862616	101
142     	154554749200	131
142     	882152991390	106
142     	139669412174	76
142     	129753980851	91
142     	869112308003	72
142     	300475101700	78
142     	467615168772	63
142     	994411186239	138
142     	838962966418	104
142     	146051347589	150
142     	435583017631	115
142     	696368469198	108
143     	172950643766	75
143     	706236730898	114
143     	180531962334	54
143     	453357640486	148
143     	567657950596	106
143     	590034051433	125
143     	998040421944	81
143     	933914210509	115
143     	473186595371	141
143     	467615168772	117
143     	618570550236	84
143     	999543417737	65
143     	284083366181	88
143     	702830548447	139
143     	527453991710	146
143     	849681336901	75
143     	528771298719	109
143     	750886611187	87
143     	312237459250	64
143     	518329844939	125
143     	939369924082	140
143     	893005812666	70
143     	286243122717	135
143     	250617599940	52
143     	859109096191	101
143     	896919583724	84
143     	962728896848	148
143     	547685258313	109
143     	118389501460	129
143     	563144943925	119
143     	140903716305	89
143     	868744054130	86
143     	646511826677	78
143     	314482481265	67
143     	373709485267	106
143     	444797600349	103
143     	948543507361	81
143     	189470486214	138
143     	814141265887	108
143     	265444172694	65
143     	435583017631	109
143     	882152991390	78
143     	199968033019	59
143     	557899454410	68
143     	732970729968	143
143     	673737891943	119
143     	894482053097	112
143     	227635917829	53
143     	349330324726	142
143     	108326062706	144
143     	952550789390	145
143     	132186536765	95
143     	749193678427	87
143     	290827207620	50
143     	425456990082	138
143     	925484684473	99
143     	861348595761	109
143     	919197823026	85
143     	264132323061	114
143     	722946564026	73
143     	765572003296	50
143     	643925479319	100
143     	450659382698	111
143     	457459442332	137
143     	770565227675	148
143     	509762284879	64
143     	875125493289	128
143     	330700905340	98
143     	923237099384	74
143     	554521191996	98
143     	126834215166	55
143     	630929030795	80
143     	176404904473	63
143     	576518370019	116
143     	547244118460	124
143     	364745567029	59
143     	300475101700	71
143     	108649313374	54
143     	144568875894	134
143     	400127531270	134
143     	769357296879	140
143     	467986934495	93
143     	902956788286	141
143     	568658660566	101
143     	411067277447	121
143     	152614854189	65
143     	904647940449	113
143     	805966823208	70
143     	709229053555	54
143     	600770885624	126
143     	838962966418	149
143     	389169531271	99
143     	308792010934	55
143     	786975743876	141
143     	514254550616	95
143     	994411186239	69
143     	679453075525	88
143     	916984241291	147
143     	139669412174	125
143     	944472664850	118
143     	721857506010	121
143     	421337093409	87
143     	754664511022	119
143     	636021875565	120
143     	316871031375	144
143     	377848719039	73
143     	775611741635	90
143     	322758894316	90
143     	129753980851	71
143     	566877828296	71
143     	702421087613	85
143     	388403878360	101
143     	803607788754	75
143     	379942304309	141
143     	113476782830	94
143     	642234808130	64
143     	529831629045	60
143     	380734371410	58
143     	649921994715	128
143     	246144606961	127
143     	203262278452	136
143     	525199185853	83
143     	413227470171	62
143     	398900612810	150
143     	435122760857	59
143     	252522255166	93
143     	839518983686	90
143     	899657914264	150
143     	187272692439	65
143     	134390993040	89
143     	979700065093	115
143     	207178796787	133
143     	660310920540	83
143     	400930079611	97
143     	508818965558	104
143     	836900805029	142
143     	159425007904	63
143     	869112308003	109
144     	383476286895	135
144     	776538360607	88
144     	117431954043	70
144     	578705048123	140
144     	308440276732	123
144     	732970729968	56
144     	435583017631	63
144     	127026679653	85
144     	771137437634	103
144     	765572003296	111
144     	126834215166	143
144     	420756960291	60
144     	862174790606	82
144     	67014520356 	111
144     	572878568883	73
144     	590034051433	56
144     	398900612810	138
144     	982079076090	72
144     	679453075525	117
144     	786975743876	80
144     	633320411611	111
144     	838962966418	126
144     	518329844939	103
144     	568658660566	104
144     	933914210509	139
144     	516495915668	130
144     	400127531270	122
144     	414652410482	81
144     	702421087613	65
144     	527453991710	66
144     	457459442332	63
144     	297083512852	65
144     	168074802141	146
144     	716818652888	105
144     	132954606361	60
144     	902956788286	53
144     	103362565865	78
144     	770565227675	95
144     	589814450967	130
144     	660310920540	123
144     	409542246104	89
144     	418604295928	138
144     	749625390019	78
144     	290827207620	88
144     	636021875565	99
144     	696368469198	107
144     	384179652400	120
144     	554521191996	98
144     	264132323061	148
144     	849681336901	97
144     	284083366181	90
144     	300475101700	132
144     	814141265887	150
144     	630929030795	134
144     	669515708071	130
144     	495776106616	110
144     	486804801433	65
144     	194144382996	141
144     	139669412174	111
144     	986065693858	77
144     	706236730898	114
144     	419481071217	143
144     	718971287692	130
144     	999543417737	121
144     	869112308003	115
144     	600770885624	146
144     	775611741635	115
144     	618570550236	107
144     	557899454410	121
144     	875605607431	99
144     	349330324726	84
144     	482429892907	112
144     	608852371253	108
144     	709229053555	116
144     	859109096191	116
144     	265444172694	135
144     	174237001203	133
144     	904647940449	114
144     	286243122717	141
144     	152614854189	96
144     	261188186216	116
144     	419446364450	80
144     	140903716305	137
144     	722946564026	70
144     	172950643766	86
144     	473186595371	100
144     	925484684473	56
144     	336491915536	149
145     	828509049873	99
145     	379942304309	68
145     	877194198700	133
145     	862174790606	89
145     	435583017631	141
145     	134390993040	102
145     	998040421944	67
145     	261188186216	107
145     	740581174440	81
145     	649921994715	99
145     	732970729968	149
145     	139669412174	75
145     	389169531271	85
145     	893005812666	82
145     	199753522658	142
145     	132186536765	116
145     	516495915668	111
145     	948543507361	148
145     	618570550236	79
145     	506298714832	73
145     	511511692317	85
145     	873640709962	72
145     	420756960291	76
145     	414652410482	76
145     	508818965558	83
145     	290827207620	106
145     	113476782830	148
145     	152614854189	69
145     	450659382698	139
145     	814141265887	108
145     	696368469198	60
145     	453357640486	111
145     	250617599940	75
145     	334425348148	115
145     	563144943925	123
145     	630929030795	76
145     	986202008726	146
145     	322758894316	95
145     	679453075525	144
145     	603333456348	92
145     	549746556299	111
145     	771137437634	63
145     	941976384328	60
145     	444797600349	146
145     	706236730898	150
145     	882152991390	128
145     	364745567029	131
145     	916984241291	58
145     	482340522139	135
145     	923237099384	132
145     	483738463713	117
145     	925173129386	145
145     	833663232208	85
145     	495776106616	96
145     	176404904473	147
145     	944472664850	77
145     	173672457176	124
145     	996103067914	92
145     	419481071217	62
145     	518787417161	118
146     	902956788286	133
146     	108326062706	114
146     	250617599940	73
146     	986202008726	78
146     	941976384328	116
146     	718971287692	127
146     	572878568883	76
146     	444797600349	138
146     	863129185304	104
146     	272121204465	55
146     	334425348148	75
146     	380734371410	70
146     	381299535788	94
146     	861348595761	99
146     	776538360607	119
146     	982079076090	75
146     	948543507361	109
146     	377848719039	138
146     	384468659793	114
146     	187272692439	134
146     	194144382996	71
146     	887528437482	80
146     	349330324726	150
146     	643925479319	59
146     	199753522658	54
146     	554521191996	113
146     	629919786056	130
146     	749625390019	51
146     	875125493289	97
146     	317663070530	106
146     	413227470171	64
146     	740581174440	124
146     	389169531271	115
146     	828509049873	123
146     	508818965558	148
146     	118389501460	95
146     	168074802141	80
146     	945012228482	94
146     	375276903331	98
146     	534109743798	55
146     	875605607431	78
146     	525199185853	147
146     	334074319971	111
146     	838962966418	143
146     	127026679653	54
146     	673737891943	112
146     	227635917829	144
146     	400930079611	113
146     	556388862616	85
146     	419481071217	150
146     	134390993040	63
146     	769357296879	89
146     	286243122717	104
146     	322758894316	82
146     	421337093409	78
146     	945312847530	103
146     	603333456348	62
146     	140903716305	61
146     	409542246104	134
146     	862174790606	52
146     	904647940449	56
146     	274761600136	116
146     	771137437634	79
146     	805966823208	94
146     	199968033019	114
146     	547685258313	54
146     	998040421944	114
146     	894482053097	95
146     	388403878360	98
146     	933914210509	53
146     	994411186239	90
146     	939369924082	71
146     	246144606961	139
146     	925484684473	82
146     	721857506010	106
146     	418604295928	141
146     	159425007904	64
146     	265444172694	90
146     	511511692317	116
146     	877194198700	77
146     	167742802915	142
146     	547244118460	93
146     	314482481265	133
146     	450659382698	109
146     	414652410482	92
146     	207178796787	51
146     	618570550236	61
146     	146051347589	75
146     	383476286895	86
146     	716818652888	57
146     	420756960291	63
146     	308440276732	77
146     	528771298719	68
146     	999543417737	132
146     	679453075525	52
146     	379942304309	138
146     	600770885624	144
146     	702421087613	129
146     	696368469198	134
146     	566877828296	145
146     	925173129386	80
146     	467986934495	149
146     	882152991390	75
146     	859109096191	64
146     	339589987290	55
146     	152614854189	79
146     	871701186034	89
146     	732970729968	79
146     	176404904473	110
146     	919197823026	65
146     	261188186216	70
146     	453357640486	148
146     	563144943925	95
146     	642234808130	61
146     	816260222588	120
146     	117431954043	72
146     	646511826677	138
146     	173672457176	95
146     	103362565865	100
146     	180531962334	60
146     	590034051433	115
146     	557899454410	65
146     	488529033803	97
147     	118389501460	140
147     	250617599940	60
147     	322758894316	103
147     	643925479319	134
147     	636021875565	92
147     	925484684473	108
147     	103362565865	77
147     	140903716305	88
147     	176404904473	55
147     	816260222588	82
147     	887528437482	104
147     	805966823208	104
147     	986065693858	66
147     	516286957430	77
147     	568658660566	53
147     	660310920540	130
147     	979700065093	50
147     	877194198700	141
147     	803607788754	60
147     	508818965558	57
147     	696368469198	143
147     	679453075525	67
147     	272121204465	57
147     	629919786056	77
147     	706236730898	101
147     	642234808130	123
147     	208174494479	141
147     	308440276732	90
147     	765572003296	51
147     	578705048123	89
147     	702421087613	110
147     	384468659793	82
147     	962728896848	111
147     	383476286895	98
147     	127026679653	97
147     	996103067914	137
147     	482340522139	83
147     	234646454745	89
147     	467986934495	102
147     	863129185304	104
147     	381299535788	126
147     	418604295928	131
147     	421337093409	114
147     	603333456348	72
147     	518787417161	55
147     	896919583724	131
147     	389169531271	88
147     	159425007904	96
147     	945012228482	70
147     	740581174440	112
147     	113476782830	79
147     	528771298719	148
147     	511511692317	134
147     	312237459250	58
147     	377848719039	130
147     	139669412174	100
147     	771137437634	61
147     	67014520356 	82
147     	849681336901	72
147     	873640709962	150
147     	420756960291	77
147     	203262278452	116
147     	994411186239	63
147     	732970729968	59
147     	194144382996	75
147     	467615168772	66
147     	749193678427	137
147     	174237001203	95
147     	697814031389	80
147     	861348595761	75
147     	300475101700	74
147     	536851950801	91
147     	414652410482	77
147     	167742802915	134
147     	982079076090	71
147     	527453991710	112
147     	871701186034	70
147     	316871031375	123
147     	933914210509	107
147     	754664511022	123
147     	430946284790	128
147     	509762284879	67
147     	168074802141	108
147     	506298714832	83
147     	986202008726	144
147     	180531962334	114
147     	334425348148	62
147     	364745567029	64
147     	769357296879	149
147     	786975743876	92
147     	566877828296	88
147     	925173129386	109
147     	578147508823	125
147     	894482053097	130
147     	770565227675	72
147     	775611741635	88
147     	649921994715	68
147     	875125493289	92
147     	246144606961	79
147     	154554749200	73
147     	750886611187	124
147     	529831629045	117
147     	722946564026	73
147     	419481071217	51
147     	199753522658	109
147     	814141265887	53
147     	654563447110	70
147     	314482481265	91
147     	698718941817	64
147     	210526151030	100
147     	380734371410	76
147     	576518370019	53
147     	261188186216	105
147     	132954606361	107
147     	473186595371	96
147     	569219762080	90
147     	482429892907	99
147     	554521191996	103
147     	108649313374	137
147     	349435998924	97
147     	252522255166	73
147     	409542246104	122
147     	187272692439	57
147     	514254550616	56
147     	692492393712	109
147     	702830548447	148
147     	411067277447	148
147     	286243122717	76
147     	516495915668	88
147     	284083366181	52
147     	838962966418	51
147     	152614854189	76
147     	205930062465	123
147     	379942304309	80
147     	144568875894	130
147     	264132323061	81
147     	384179652400	120
147     	833663232208	145
147     	132186536765	80
147     	630929030795	141
147     	608852371253	117
147     	646511826677	62
147     	919197823026	147
147     	398900612810	64
147     	859109096191	142
147     	265444172694	99
147     	952550789390	109
147     	349330324726	83
147     	117431954043	148
147     	941976384328	77
148     	330700905340	96
148     	108326062706	88
148     	833663232208	82
148     	208174494479	55
148     	294993047536	127
148     	261188186216	124
148     	103362565865	144
148     	899657914264	103
148     	814141265887	100
148     	839518983686	115
148     	547244118460	97
148     	933914210509	124
148     	633320411611	122
148     	887528437482	54
148     	167742802915	50
148     	566877828296	97
148     	140903716305	84
148     	945012228482	139
148     	250617599940	53
148     	286243122717	54
148     	322758894316	73
148     	334425348148	74
148     	646511826677	131
148     	786975743876	147
148     	556388862616	57
148     	173672457176	107
148     	152614854189	145
148     	205930062465	68
148     	336491915536	104
148     	875125493289	142
148     	506298714832	138
148     	252522255166	93
148     	134390993040	124
148     	199968033019	93
148     	749625390019	109
148     	996103067914	69
148     	418604295928	104
148     	113476782830	127
148     	495776106616	67
148     	349330324726	131
148     	698718941817	60
148     	534109743798	127
148     	511511692317	93
148     	868744054130	59
148     	849681336901	64
148     	414652410482	134
148     	722946564026	145
148     	207178796787	149
148     	589814450967	108
148     	398900612810	124
148     	490997846898	86
148     	528771298719	97
148     	430946284790	117
148     	154554749200	77
148     	749193678427	105
148     	118389501460	129
148     	649921994715	90
148     	425456990082	71
148     	334074319971	134
148     	272121204465	73
148     	482340522139	72
148     	576518370019	80
148     	721857506010	75
148     	549746556299	114
148     	679453075525	140
148     	132186536765	58
148     	673737891943	118
148     	174237001203	90
148     	450659382698	82
148     	590034051433	60
148     	692492393712	59
148     	529831629045	113
148     	518787417161	144
148     	750886611187	96
148     	172950643766	117
148     	380734371410	51
148     	643925479319	53
148     	603333456348	129
148     	168074802141	99
148     	400930079611	59
148     	127026679653	82
148     	210526151030	86
148     	384468659793	141
148     	948543507361	57
148     	600770885624	139
148     	159425007904	88
148     	557899454410	128
148     	411067277447	108
148     	523196696835	106
148     	132954606361	131
148     	608852371253	106
148     	558886167633	108
148     	180531962334	142
148     	697814031389	86
148     	388403878360	127
148     	117431954043	72
148     	902956788286	60
148     	986065693858	135
148     	982079076090	72
148     	274761600136	95
148     	765572003296	100
148     	896919583724	53
148     	514254550616	84
148     	246144606961	129
148     	308792010934	111
148     	314482481265	115
148     	875605607431	88
148     	952550789390	72
148     	706236730898	99
148     	871701186034	147
148     	962728896848	81
148     	139669412174	120
148     	754664511022	53
148     	508818965558	96
148     	979700065093	62
148     	836900805029	105
148     	939369924082	83
148     	904647940449	97
148     	435122760857	133
148     	290827207620	85
148     	629919786056	84
148     	859109096191	117
148     	732970729968	114
148     	227635917829	132
148     	660310920540	103
148     	803607788754	76
149     	871701186034	109
149     	873640709962	67
149     	144568875894	146
149     	771137437634	134
149     	322758894316	75
149     	919197823026	78
149     	916984241291	142
149     	875605607431	145
149     	377848719039	50
149     	982079076090	65
149     	896919583724	81
149     	836900805029	145
149     	899657914264	50
149     	252522255166	77
149     	547244118460	144
149     	698718941817	124
149     	300475101700	116
149     	467615168772	107
149     	349435998924	53
149     	330700905340	63
149     	775611741635	92
149     	986065693858	147
149     	673737891943	105
149     	297083512852	133
149     	308440276732	101
149     	373709485267	106
149     	312237459250	53
149     	203262278452	66
149     	483738463713	137
149     	174237001203	122
149     	207178796787	100
149     	488529033803	69
149     	525199185853	145
149     	336491915536	85
149     	172950643766	80
149     	518787417161	56
149     	117431954043	111
149     	173672457176	54
149     	979700065093	96
149     	945312847530	144
149     	556388862616	120
149     	482340522139	100
149     	457459442332	62
149     	509762284879	134
149     	566877828296	76
149     	534109743798	131
149     	769357296879	112
149     	721857506010	56
149     	558886167633	72
149     	467986934495	94
149     	176404904473	110
149     	139669412174	139
149     	925173129386	60
149     	654563447110	132
149     	833663232208	72
149     	140903716305	142
149     	732970729968	109
149     	264132323061	88
149     	450659382698	68
149     	863129185304	117
149     	516495915668	80
149     	709229053555	100
149     	849681336901	77
149     	180531962334	109
149     	508818965558	56
149     	317663070530	118
149     	904647940449	82
149     	944472664850	84
149     	334074319971	117
149     	803607788754	55
149     	952550789390	70
149     	702421087613	150
149     	722946564026	51
149     	414652410482	147
149     	208174494479	71
149     	529831629045	90
149     	411067277447	54
149     	868744054130	134
149     	749193678427	106
149     	861348595761	148
149     	518329844939	58
149     	294993047536	112
149     	272121204465	138
149     	557899454410	137
149     	154554749200	62
149     	669515708071	102
149     	418604295928	91
150     	754664511022	125
150     	589814450967	108
150     	536851950801	140
150     	199968033019	146
150     	167742802915	114
150     	194144382996	106
150     	894482053097	62
150     	381299535788	116
150     	698718941817	86
150     	816260222588	148
150     	444797600349	124
150     	189470486214	105
150     	749193678427	105
150     	556388862616	110
150     	863129185304	102
150     	286243122717	124
150     	146051347589	150
150     	246144606961	69
150     	633320411611	150
150     	986202008726	65
150     	882152991390	75
150     	284083366181	94
150     	554521191996	145
150     	389169531271	101
150     	482429892907	55
150     	373709485267	61
150     	380734371410	126
150     	518787417161	57
150     	948543507361	128
150     	117431954043	114
150     	916984241291	145
150     	250617599940	118
150     	896919583724	101
150     	132186536765	87
150     	516495915668	128
150     	673737891943	132
150     	716818652888	114
150     	159425007904	142
150     	557899454410	52
150     	765572003296	67
150     	334074319971	109
150     	629919786056	102
150     	660310920540	95
150     	873640709962	138
150     	776538360607	108
150     	567657950596	128
150     	636021875565	139
150     	887528437482	109
150     	144568875894	69
150     	108326062706	88
150     	506298714832	90
150     	314482481265	81
150     	322758894316	135
150     	642234808130	127
150     	769357296879	81
150     	364745567029	132
150     	126834215166	138
150     	400127531270	124
150     	414652410482	105
150     	692492393712	58
150     	207178796787	81
150     	174237001203	101
151     	421337093409	81
151     	679453075525	60
151     	514254550616	109
151     	590034051433	103
151     	413227470171	99
151     	603333456348	64
151     	205930062465	77
151     	420756960291	65
151     	805966823208	95
151     	722946564026	53
151     	916984241291	138
151     	473186595371	77
151     	486804801433	69
151     	483738463713	149
151     	339589987290	64
151     	525199185853	53
151     	290827207620	103
151     	400930079611	83
151     	673737891943	136
151     	642234808130	75
151     	649921994715	61
151     	208174494479	72
151     	996103067914	67
151     	732970729968	55
151     	702421087613	110
151     	556388862616	115
151     	457459442332	138
151     	322758894316	86
151     	871701186034	141
151     	189470486214	52
151     	383476286895	114
151     	923237099384	60
151     	828509049873	134
151     	265444172694	71
151     	482340522139	108
151     	373709485267	60
151     	132186536765	95
151     	709229053555	75
151     	875605607431	120
151     	669515708071	71
151     	569219762080	110
151     	482429892907	79
151     	893005812666	115
151     	317663070530	101
151     	863129185304	102
151     	962728896848	108
151     	227635917829	70
151     	877194198700	136
151     	349330324726	79
151     	316871031375	142
151     	999543417737	75
151     	419446364450	114
151     	294993047536	71
151     	308792010934	104
151     	816260222588	103
151     	643925479319	140
151     	380734371410	77
151     	389169531271	68
151     	398900612810	61
151     	692492393712	53
151     	750886611187	69
151     	127026679653	82
151     	284083366181	119
152     	297083512852	90
152     	467615168772	117
152     	261188186216	53
152     	108649313374	135
152     	418604295928	135
152     	203262278452	125
152     	982079076090	55
152     	572878568883	93
152     	516286957430	120
152     	786975743876	138
152     	692492393712	105
152     	473186595371	134
152     	274761600136	121
152     	187272692439	64
152     	129753980851	110
152     	569219762080	77
152     	698718941817	140
152     	939369924082	88
152     	450659382698	100
152     	174237001203	62
152     	558886167633	109
152     	334425348148	53
152     	877194198700	121
152     	578147508823	117
152     	999543417737	61
152     	523196696835	89
152     	483738463713	59
152     	400127531270	66
152     	863129185304	108
152     	488529033803	112
152     	633320411611	117
152     	603333456348	95
152     	589814450967	100
152     	290827207620	76
152     	339589987290	73
152     	312237459250	63
152     	527453991710	133
152     	576518370019	63
152     	618570550236	99
152     	314482481265	131
152     	814141265887	78
152     	420756960291	80
152     	838962966418	101
152     	373709485267	100
152     	875125493289	150
152     	334074319971	94
152     	642234808130	124
152     	933914210509	111
152     	227635917829	128
152     	486804801433	93
152     	210526151030	124
152     	207178796787	59
152     	180531962334	66
152     	457459442332	95
152     	388403878360	88
152     	554521191996	113
152     	383476286895	107
152     	265444172694	116
152     	536851950801	146
152     	875605607431	72
152     	490997846898	74
152     	284083366181	73
152     	146051347589	107
152     	103362565865	132
152     	899657914264	74
152     	816260222588	143
152     	349435998924	93
152     	330700905340	72
152     	108326062706	81
152     	986202008726	104
152     	377848719039	68
153     	168074802141	80
153     	488529033803	109
153     	709229053555	104
153     	566877828296	104
153     	516286957430	87
153     	118389501460	138
153     	875605607431	127
153     	629919786056	111
153     	618570550236	107
153     	518329844939	56
153     	740581174440	82
153     	549746556299	127
153     	873640709962	59
153     	330700905340	134
153     	630929030795	140
153     	334074319971	95
153     	839518983686	148
153     	527453991710	77
153     	525199185853	145
153     	409542246104	119
153     	706236730898	110
153     	904647940449	134
153     	523196696835	145
153     	490997846898	127
153     	775611741635	91
153     	411067277447	50
153     	849681336901	126
153     	172950643766	62
153     	877194198700	81
153     	982079076090	85
153     	419446364450	55
153     	430946284790	116
153     	702421087613	132
153     	159425007904	145
153     	139669412174	94
153     	516495915668	126
153     	483738463713	139
153     	994411186239	98
153     	569219762080	117
153     	786975743876	67
153     	473186595371	72
153     	547244118460	140
153     	933914210509	60
153     	419481071217	52
153     	608852371253	148
153     	697814031389	82
153     	754664511022	116
153     	716818652888	118
153     	894482053097	93
153     	113476782830	85
153     	814141265887	103
153     	435122760857	140
153     	556388862616	95
153     	919197823026	56
153     	916984241291	102
153     	246144606961	101
153     	67014520356 	101
153     	334425348148	138
153     	600770885624	70
153     	308792010934	125
153     	945312847530	121
153     	869112308003	76
153     	805966823208	98
153     	389169531271	94
153     	482340522139	86
153     	721857506010	73
153     	297083512852	109
153     	509762284879	149
153     	861348595761	127
153     	692492393712	57
153     	986202008726	98
153     	567657950596	101
153     	381299535788	88
153     	132954606361	75
153     	294993047536	126
153     	349435998924	52
153     	643925479319	143
153     	749625390019	87
153     	649921994715	54
153     	380734371410	126
153     	506298714832	146
153     	948543507361	121
153     	482429892907	146
153     	457459442332	127
153     	176404904473	103
153     	558886167633	97
153     	803607788754	109
153     	554521191996	148
153     	925484684473	109
153     	750886611187	137
153     	234646454745	106
153     	384179652400	129
153     	272121204465	99
153     	383476286895	144
153     	722946564026	134
153     	529831629045	84
153     	300475101700	73
153     	173672457176	106
153     	833663232208	123
153     	373709485267	127
153     	199968033019	121
153     	336491915536	116
153     	776538360607	124
153     	696368469198	65
153     	129753980851	143
154     	398900612810	52
154     	308792010934	140
154     	732970729968	83
154     	962728896848	56
154     	234646454745	56
154     	518329844939	122
154     	227635917829	52
154     	414652410482	95
154     	453357640486	131
154     	207178796787	89
154     	589814450967	147
154     	139669412174	102
154     	316871031375	138
154     	300475101700	107
154     	467615168772	80
154     	420756960291	68
154     	833663232208	63
154     	509762284879	53
154     	945312847530	112
154     	618570550236	86
154     	600770885624	111
154     	312237459250	83
154     	814141265887	77
154     	692492393712	93
154     	875605607431	129
154     	210526151030	50
154     	508818965558	129
154     	317663070530	119
154     	297083512852	92
154     	722946564026	91
154     	514254550616	59
154     	770565227675	139
154     	945012228482	52
154     	578147508823	62
154     	113476782830	84
154     	322758894316	98
154     	450659382698	100
154     	349330324726	116
154     	556388862616	119
154     	702421087613	88
154     	511511692317	99
154     	246144606961	78
154     	805966823208	134
154     	388403878360	58
154     	838962966418	82
154     	286243122717	84
154     	381299535788	141
154     	534109743798	56
154     	174237001203	60
154     	265444172694	58
154     	649921994715	52
154     	389169531271	96
154     	172950643766	113
154     	771137437634	114
154     	126834215166	107
154     	803607788754	88
154     	816260222588	94
154     	473186595371	51
154     	488529033803	107
154     	132186536765	51
154     	633320411611	61
154     	194144382996	59
154     	425456990082	129
154     	749625390019	117
154     	836900805029	110
154     	199968033019	62
154     	373709485267	88
154     	187272692439	128
154     	578705048123	51
154     	419446364450	91
154     	948543507361	66
154     	862174790606	120
154     	377848719039	94
154     	873640709962	133
154     	925484684473	78
154     	603333456348	112
154     	274761600136	150
154     	264132323061	110
154     	336491915536	103
154     	859109096191	80
154     	379942304309	73
154     	180531962334	107
154     	894482053097	122
155     	643925479319	133
155     	523196696835	91
155     	144568875894	87
155     	608852371253	50
155     	568658660566	143
155     	528771298719	143
155     	486804801433	77
155     	982079076090	71
155     	556388862616	62
155     	383476286895	148
155     	939369924082	88
155     	861348595761	141
155     	373709485267	100
155     	618570550236	143
155     	413227470171	82
155     	467986934495	147
155     	227635917829	50
155     	859109096191	138
155     	176404904473	81
155     	633320411611	67
155     	172950643766	147
155     	444797600349	89
155     	419481071217	95
155     	435122760857	105
155     	697814031389	130
155     	749193678427	118
155     	547244118460	66
155     	457459442332	56
155     	563144943925	97
155     	205930062465	120
155     	916984241291	93
155     	875125493289	64
155     	979700065093	140
155     	389169531271	147
155     	210526151030	67
155     	483738463713	84
155     	706236730898	80
155     	833663232208	99
155     	174237001203	58
155     	718971287692	96
155     	199753522658	54
155     	400127531270	76
155     	948543507361	75
155     	118389501460	145
155     	776538360607	80
155     	839518983686	111
155     	698718941817	111
155     	159425007904	83
155     	294993047536	92
155     	646511826677	125
155     	741544174664	114
155     	274761600136	116
155     	558886167633	53
155     	67014520356 	106
155     	103362565865	118
155     	349435998924	78
155     	246144606961	126
155     	941976384328	133
155     	816260222588	98
155     	589814450967	92
155     	732970729968	105
155     	411067277447	110
155     	516495915668	66
155     	308440276732	100
155     	868744054130	125
155     	569219762080	90
155     	286243122717	106
155     	600770885624	126
155     	925484684473	55
155     	803607788754	83
155     	430946284790	134
155     	516286957430	67
155     	336491915536	102
155     	364745567029	66
155     	754664511022	143
155     	514254550616	54
155     	511511692317	127
155     	986202008726	124
155     	418604295928	136
155     	902956788286	107
155     	996103067914	114
155     	234646454745	65
155     	380734371410	115
156     	643925479319	54
156     	467986934495	72
156     	435122760857	145
156     	379942304309	65
156     	902956788286	92
156     	771137437634	99
156     	308792010934	140
156     	572878568883	95
156     	316871031375	121
156     	168074802141	116
156     	373709485267	100
156     	488529033803	98
156     	388403878360	91
156     	770565227675	73
156     	896919583724	63
156     	861348595761	72
156     	482429892907	131
156     	556388862616	149
156     	384179652400	149
156     	412348931569	53
156     	925484684473	67
156     	425456990082	93
156     	868744054130	128
156     	126834215166	80
156     	590034051433	82
156     	933914210509	135
156     	698718941817	111
156     	152614854189	122
156     	300475101700	142
156     	765572003296	111
156     	486804801433	111
156     	600770885624	83
156     	409542246104	85
156     	490997846898	61
156     	509762284879	133
156     	706236730898	94
156     	709229053555	62
156     	642234808130	52
156     	208174494479	119
156     	945012228482	82
156     	508818965558	78
156     	948543507361	75
156     	939369924082	64
156     	894482053097	105
156     	814141265887	65
156     	234646454745	132
156     	129753980851	112
156     	528771298719	132
156     	457459442332	135
156     	945312847530	127
156     	630929030795	103
156     	421337093409	92
156     	265444172694	132
156     	692492393712	64
156     	467615168772	143
156     	139669412174	115
156     	173672457176	94
156     	994411186239	75
156     	862174790606	52
156     	833663232208	63
156     	516286957430	62
156     	290827207620	135
156     	716818652888	75
156     	187272692439	123
156     	349330324726	103
156     	589814450967	88
156     	180531962334	107
156     	669515708071	95
156     	381299535788	63
156     	952550789390	91
156     	877194198700	62
156     	996103067914	67
156     	534109743798	81
156     	146051347589	73
156     	286243122717	53
156     	336491915536	68
156     	284083366181	92
156     	563144943925	67
156     	383476286895	72
156     	702830548447	72
156     	919197823026	86
156     	334425348148	107
156     	134390993040	79
156     	999543417737	62
156     	67014520356 	89
156     	566877828296	95
156     	904647940449	64
156     	722946564026	52
156     	482340522139	71
156     	882152991390	125
156     	986202008726	115
156     	547685258313	75
156     	986065693858	150
156     	839518983686	111
156     	159425007904	134
156     	750886611187	116
156     	274761600136	75
156     	330700905340	87
156     	364745567029	116
156     	718971287692	119
156     	554521191996	61
156     	453357640486	92
156     	108649313374	93
156     	194144382996	139
156     	189470486214	125
156     	578705048123	139
156     	536851950801	73
156     	174237001203	105
156     	775611741635	141
156     	836900805029	56
156     	603333456348	125
156     	873640709962	99
156     	176404904473	130
156     	322758894316	81
156     	923237099384	57
156     	899657914264	93
156     	916984241291	78
156     	740581174440	73
156     	144568875894	96
156     	103362565865	91
156     	869112308003	64
156     	998040421944	125
156     	925173129386	132
156     	420756960291	58
156     	849681336901	143
157     	567657950596	125
157     	568658660566	112
157     	508818965558	145
157     	435122760857	80
157     	882152991390	57
157     	334425348148	135
157     	516495915668	141
157     	127026679653	103
157     	139669412174	97
157     	154554749200	60
157     	556388862616	92
157     	998040421944	101
157     	349435998924	93
157     	722946564026	93
157     	364745567029	138
157     	379942304309	98
157     	702830548447	143
157     	839518983686	130
157     	775611741635	110
157     	483738463713	127
157     	769357296879	51
157     	457459442332	121
157     	873640709962	88
157     	904647940449	86
157     	518329844939	73
157     	205930062465	104
157     	467615168772	84
157     	941976384328	112
157     	330700905340	100
157     	828509049873	51
157     	558886167633	143
157     	274761600136	117
157     	272121204465	97
157     	962728896848	145
157     	770565227675	102
157     	862174790606	144
157     	380734371410	92
157     	317663070530	69
157     	113476782830	100
157     	103362565865	149
157     	771137437634	64
157     	994411186239	74
157     	286243122717	148
157     	528771298719	90
157     	339589987290	97
157     	375276903331	73
157     	933914210509	116
157     	308792010934	146
157     	525199185853	102
157     	923237099384	130
157     	833663232208	82
157     	863129185304	51
157     	132954606361	137
157     	172950643766	81
157     	732970729968	123
157     	414652410482	66
157     	569219762080	103
157     	576518370019	60
157     	203262278452	148
157     	859109096191	121
157     	697814031389	146
157     	945312847530	70
157     	117431954043	133
157     	126834215166	98
157     	384468659793	57
157     	411067277447	146
157     	314482481265	125
157     	316871031375	150
157     	389169531271	90
157     	398900612810	74
157     	861348595761	52
157     	529831629045	100
157     	902956788286	56
157     	516286957430	55
157     	134390993040	67
157     	199968033019	76
157     	630929030795	67
157     	765572003296	94
157     	67014520356 	100
157     	140903716305	139
157     	261188186216	91
157     	618570550236	108
157     	467986934495	71
157     	418604295928	140
157     	381299535788	112
157     	207178796787	95
157     	187272692439	121
157     	108326062706	147
157     	590034051433	82
157     	633320411611	59
157     	152614854189	150
157     	400930079611	104
157     	322758894316	85
157     	444797600349	83
157     	877194198700	146
157     	511511692317	149
157     	534109743798	111
157     	718971287692	112
157     	349330324726	75
157     	673737891943	92
158     	108326062706	61
158     	770565227675	69
158     	375276903331	118
158     	252522255166	92
158     	919197823026	59
158     	649921994715	136
158     	334425348148	83
158     	430946284790	111
158     	877194198700	89
158     	67014520356 	79
158     	167742802915	140
158     	568658660566	125
158     	549746556299	103
158     	411067277447	89
158     	339589987290	69
158     	839518983686	83
158     	861348595761	127
158     	982079076090	66
158     	330700905340	123
158     	516495915668	87
158     	998040421944	71
158     	364745567029	101
158     	250617599940	123
158     	146051347589	122
158     	862174790606	91
158     	409542246104	127
158     	525199185853	131
158     	453357640486	80
158     	776538360607	134
158     	435122760857	76
158     	875125493289	106
158     	740581174440	139
158     	290827207620	71
158     	716818652888	67
158     	962728896848	79
158     	765572003296	50
158     	849681336901	66
158     	979700065093	98
158     	722946564026	107
158     	721857506010	125
158     	482340522139	68
158     	208174494479	64
158     	692492393712	116
158     	194144382996	59
158     	308440276732	111
158     	400127531270	63
158     	527453991710	111
158     	180531962334	62
158     	894482053097	75
158     	904647940449	91
158     	836900805029	119
158     	384468659793	126
158     	103362565865	121
158     	572878568883	93
158     	159425007904	103
158     	805966823208	109
158     	488529033803	138
158     	420756960291	139
158     	775611741635	64
158     	873640709962	66
158     	875605607431	58
158     	923237099384	60
158     	398900612810	75
158     	294993047536	65
158     	132186536765	85
158     	608852371253	94
158     	750886611187	96
158     	566877828296	101
158     	816260222588	103
158     	412348931569	111
158     	419446364450	102
158     	516286957430	110
158     	274761600136	125
158     	679453075525	141
158     	933914210509	64
158     	702830548447	112
158     	334074319971	58
158     	132954606361	102
158     	871701186034	99
158     	113476782830	102
158     	589814450967	96
158     	400930079611	106
158     	199968033019	103
158     	205930062465	127
158     	576518370019	50
158     	383476286895	68
159     	398900612810	92
159     	411067277447	72
159     	722946564026	130
159     	509762284879	100
159     	547244118460	65
159     	696368469198	68
159     	534109743798	130
159     	549746556299	72
159     	569219762080	117
159     	317663070530	88
159     	144568875894	135
159     	618570550236	107
159     	925484684473	105
159     	887528437482	69
159     	400930079611	144
159     	117431954043	58
159     	525199185853	121
159     	669515708071	149
159     	893005812666	122
159     	590034051433	138
159     	389169531271	108
159     	859109096191	57
159     	877194198700	70
159     	721857506010	90
159     	563144943925	122
159     	146051347589	51
159     	803607788754	51
159     	945012228482	87
159     	264132323061	130
159     	600770885624	104
159     	765572003296	123
159     	558886167633	115
159     	126834215166	129
159     	962728896848	121
159     	414652410482	92
159     	775611741635	59
159     	697814031389	131
159     	419446364450	138
159     	916984241291	126
159     	172950643766	50
159     	154554749200	103
159     	435583017631	105
159     	103362565865	122
159     	939369924082	125
159     	578705048123	80
159     	996103067914	99
159     	308440276732	118
159     	925173129386	122
159     	430946284790	123
159     	413227470171	52
159     	679453075525	53
159     	388403878360	76
159     	861348595761	142
159     	252522255166	95
159     	994411186239	91
159     	702830548447	113
159     	134390993040	120
159     	272121204465	96
159     	194144382996	108
159     	176404904473	134
159     	646511826677	110
159     	805966823208	78
159     	174237001203	109
159     	862174790606	146
159     	948543507361	149
159     	941976384328	87
159     	527453991710	144
159     	418604295928	137
159     	330700905340	82
159     	740581174440	128
159     	383476286895	54
159     	227635917829	121
159     	364745567029	112
159     	814141265887	147
159     	234646454745	99
159     	127026679653	137
159     	207178796787	117
159     	863129185304	58
159     	771137437634	135
159     	868744054130	103
159     	435122760857	62
159     	770565227675	59
159     	189470486214	72
159     	316871031375	94
159     	516495915668	118
159     	875125493289	68
159     	314482481265	55
159     	660310920540	123
159     	654563447110	78
159     	384179652400	108
159     	952550789390	137
159     	982079076090	141
159     	167742802915	75
159     	159425007904	94
159     	381299535788	120
159     	769357296879	139
160     	264132323061	117
160     	199968033019	54
160     	518787417161	75
160     	483738463713	110
160     	444797600349	89
160     	882152991390	134
160     	996103067914	57
160     	529831629045	96
160     	859109096191	62
160     	721857506010	115
160     	419446364450	102
160     	514254550616	78
160     	467615168772	102
160     	636021875565	140
160     	941976384328	128
160     	261188186216	68
160     	252522255166	147
160     	375276903331	74
160     	547244118460	56
160     	952550789390	132
160     	875125493289	50
160     	702830548447	71
160     	418604295928	73
160     	176404904473	124
160     	140903716305	114
160     	646511826677	62
160     	873640709962	101
160     	948543507361	61
160     	578147508823	81
160     	828509049873	73
160     	208174494479	86
160     	945312847530	115
160     	194144382996	139
160     	642234808130	146
160     	339589987290	69
160     	839518983686	69
160     	649921994715	68
160     	660310920540	99
160     	400127531270	149
160     	308792010934	145
160     	388403878360	124
160     	933914210509	132
160     	871701186034	110
160     	633320411611	104
160     	509762284879	72
160     	207178796787	98
160     	189470486214	101
160     	272121204465	104
160     	578705048123	133
160     	414652410482	143
160     	488529033803	93
160     	563144943925	126
160     	982079076090	139
160     	775611741635	92
160     	643925479319	64
160     	945012228482	68
160     	919197823026	127
160     	127026679653	115
160     	409542246104	92
160     	629919786056	149
160     	203262278452	64
160     	749193678427	128
160     	692492393712	133
160     	297083512852	121
160     	838962966418	91
160     	925173129386	91
160     	893005812666	101
160     	364745567029	146
160     	317663070530	78
160     	379942304309	71
160     	939369924082	60
160     	420756960291	146
160     	334425348148	76
160     	999543417737	118
160     	435122760857	72
160     	453357640486	135
160     	869112308003	64
160     	167742802915	125
160     	868744054130	91
160     	849681336901	110
160     	718971287692	119
160     	516286957430	61
160     	205930062465	133
160     	482429892907	127
160     	630929030795	93
160     	556388862616	59
160     	608852371253	104
160     	803607788754	89
160     	467986934495	83
160     	435583017631	140
160     	722946564026	98
160     	154554749200	90
160     	716818652888	126
160     	732970729968	89
160     	146051347589	90
160     	518329844939	106
160     	527453991710	113
160     	349330324726	116
160     	234646454745	133
160     	300475101700	130
160     	108326062706	65
160     	473186595371	53
160     	380734371410	81
160     	290827207620	73
160     	139669412174	82
160     	771137437634	89
160     	330700905340	126
160     	862174790606	60
160     	709229053555	132
160     	511511692317	56
160     	805966823208	96
160     	534109743798	149
160     	508818965558	138
160     	210526151030	59
160     	126834215166	54
160     	334074319971	58
160     	569219762080	123
160     	776538360607	64
160     	896919583724	147
160     	589814450967	125
160     	875605607431	109
160     	654563447110	140
160     	547685258313	115
160     	902956788286	133
160     	457459442332	129
160     	979700065093	73
160     	490997846898	115
160     	412348931569	114
160     	187272692439	76
160     	925484684473	97
160     	180531962334	85
160     	152614854189	145
160     	482340522139	67
160     	750886611187	134
160     	159425007904	109
160     	590034051433	145
161     	923237099384	79
161     	274761600136	123
161     	572878568883	115
161     	590034051433	53
161     	129753980851	51
161     	749625390019	77
161     	132954606361	127
161     	146051347589	114
161     	944472664850	86
161     	300475101700	140
161     	873640709962	68
161     	654563447110	117
161     	108326062706	74
161     	380734371410	65
161     	199968033019	147
161     	528771298719	90
161     	514254550616	88
161     	373709485267	118
161     	144568875894	150
161     	509762284879	102
161     	557899454410	94
161     	578705048123	51
161     	875125493289	71
161     	180531962334	137
161     	649921994715	140
161     	996103067914	75
161     	381299535788	147
161     	419481071217	73
161     	630929030795	75
161     	828509049873	116
161     	167742802915	150
161     	227635917829	89
161     	284083366181	113
161     	297083512852	71
161     	108649313374	64
161     	692492393712	146
161     	525199185853	129
161     	250617599940	133
161     	716818652888	50
161     	608852371253	94
161     	838962966418	62
161     	511511692317	116
161     	702830548447	71
161     	833663232208	122
161     	308792010934	117
161     	127026679653	66
161     	389169531271	138
161     	904647940449	105
161     	412348931569	53
161     	899657914264	71
161     	558886167633	82
161     	887528437482	95
161     	740581174440	142
161     	576518370019	70
161     	483738463713	149
161     	709229053555	109
161     	173672457176	115
161     	986202008726	55
161     	962728896848	102
161     	264132323061	150
161     	314482481265	149
161     	152614854189	73
161     	334074319971	97
162     	771137437634	72
162     	167742802915	142
162     	697814031389	92
162     	814141265887	71
162     	264132323061	61
162     	569219762080	146
162     	589814450967	59
162     	139669412174	137
162     	566877828296	91
162     	284083366181	148
162     	173672457176	122
162     	518787417161	140
162     	103362565865	62
162     	716818652888	92
162     	425456990082	52
162     	272121204465	131
162     	740581174440	118
162     	144568875894	84
162     	265444172694	72
162     	590034051433	106
162     	176404904473	133
162     	482429892907	145
162     	877194198700	57
162     	749625390019	65
162     	383476286895	134
162     	786975743876	78
162     	525199185853	147
162     	274761600136	95
162     	633320411611	107
162     	673737891943	127
162     	467986934495	86
162     	838962966418	81
162     	558886167633	89
162     	568658660566	59
162     	308792010934	131
162     	859109096191	74
162     	998040421944	100
162     	702421087613	50
162     	536851950801	150
162     	450659382698	50
162     	421337093409	116
162     	765572003296	60
162     	518329844939	114
162     	941976384328	134
162     	861348595761	100
162     	816260222588	131
162     	199968033019	57
162     	457459442332	59
162     	495776106616	51
162     	286243122717	57
162     	317663070530	70
162     	803607788754	128
162     	250617599940	80
162     	409542246104	135
162     	875605607431	58
162     	556388862616	105
162     	669515708071	84
162     	749193678427	114
162     	168074802141	83
162     	187272692439	87
162     	132954606361	120
162     	508818965558	78
162     	388403878360	127
162     	654563447110	86
162     	919197823026	147
162     	904647940449	73
162     	126834215166	59
162     	411067277447	121
162     	312237459250	98
162     	527453991710	148
162     	572878568883	102
162     	453357640486	123
162     	754664511022	128
162     	660310920540	66
162     	246144606961	95
162     	805966823208	68
162     	769357296879	96
162     	893005812666	60
162     	375276903331	149
162     	636021875565	118
162     	718971287692	60
162     	140903716305	62
162     	384179652400	108
162     	629919786056	146
162     	696368469198	143
162     	894482053097	129
162     	869112308003	131
162     	418604295928	107
162     	721857506010	67
162     	741544174664	85
162     	702830548447	85
162     	839518983686	54
162     	514254550616	148
162     	523196696835	110
162     	698718941817	92
162     	509762284879	51
162     	67014520356 	124
162     	630929030795	79
162     	642234808130	86
162     	234646454745	50
162     	618570550236	100
162     	999543417737	106
162     	413227470171	113
162     	159425007904	122
162     	863129185304	120
162     	836900805029	111
162     	732970729968	65
162     	483738463713	140
162     	467615168772	57
162     	154554749200	60
162     	420756960291	107
162     	899657914264	129
162     	127026679653	80
162     	300475101700	50
162     	227635917829	51
162     	982079076090	135
162     	381299535788	144
163     	518787417161	60
163     	839518983686	133
163     	882152991390	89
163     	444797600349	147
163     	349330324726	64
163     	944472664850	88
163     	749625390019	127
163     	673737891943	71
163     	210526151030	60
163     	146051347589	107
163     	418604295928	53
163     	994411186239	66
163     	871701186034	122
163     	482429892907	124
163     	528771298719	119
163     	692492393712	69
163     	381299535788	134
163     	786975743876	92
163     	152614854189	52
163     	203262278452	101
163     	894482053097	87
163     	578705048123	59
163     	716818652888	141
163     	877194198700	122
163     	771137437634	96
163     	618570550236	84
163     	702421087613	65
163     	999543417737	63
163     	893005812666	130
163     	816260222588	64
163     	873640709962	129
163     	467615168772	66
163     	568658660566	58
163     	863129185304	96
163     	527453991710	87
163     	308792010934	131
163     	557899454410	141
163     	523196696835	53
163     	643925479319	57
163     	154554749200	62
163     	506298714832	129
163     	414652410482	144
163     	572878568883	95
163     	875605607431	62
163     	861348595761	131
163     	290827207620	77
163     	529831629045	141
163     	603333456348	95
163     	176404904473	68
163     	754664511022	71
163     	697814031389	89
163     	159425007904	102
163     	317663070530	149
163     	741544174664	135
163     	679453075525	59
163     	750886611187	143
163     	389169531271	89
163     	698718941817	109
163     	509762284879	109
163     	334425348148	66
163     	400127531270	137
163     	576518370019	68
163     	483738463713	145
163     	518329844939	120
163     	896919583724	86
163     	173672457176	131
163     	836900805029	106
163     	933914210509	126
163     	419481071217	134
163     	453357640486	91
163     	380734371410	75
163     	646511826677	73
163     	600770885624	105
163     	261188186216	96
163     	421337093409	60
163     	706236730898	146
163     	547685258313	59
163     	939369924082	135
163     	805966823208	62
163     	411067277447	61
163     	511511692317	144
163     	776538360607	57
163     	486804801433	117
163     	868744054130	106
163     	336491915536	131
163     	425456990082	116
163     	709229053555	79
163     	508818965558	106
163     	696368469198	118
163     	284083366181	149
163     	948543507361	90
163     	887528437482	93
163     	982079076090	105
163     	902956788286	107
163     	144568875894	54
163     	482340522139	136
163     	400930079611	150
163     	377848719039	100
163     	412348931569	129
163     	252522255166	126
163     	608852371253	68
164     	208174494479	68
164     	679453075525	76
164     	388403878360	104
164     	334425348148	141
164     	716818652888	107
164     	925484684473	134
164     	982079076090	144
164     	482429892907	137
164     	400930079611	96
164     	882152991390	121
164     	516286957430	130
164     	444797600349	139
164     	312237459250	115
164     	103362565865	63
164     	814141265887	66
164     	803607788754	143
164     	227635917829	64
164     	608852371253	65
164     	377848719039	98
164     	67014520356 	76
164     	654563447110	63
164     	495776106616	96
164     	776538360607	114
164     	979700065093	100
164     	194144382996	79
164     	126834215166	106
164     	896919583724	55
164     	473186595371	136
164     	618570550236	80
164     	205930062465	88
164     	308440276732	79
164     	172950643766	83
164     	490997846898	111
164     	547685258313	149
164     	941976384328	115
164     	261188186216	99
164     	290827207620	64
164     	418604295928	57
164     	419481071217	141
164     	453357640486	115
164     	569219762080	63
164     	589814450967	97
164     	199753522658	121
164     	916984241291	92
164     	144568875894	142
164     	518329844939	52
164     	189470486214	87
164     	986202008726	119
164     	272121204465	145
164     	381299535788	108
164     	899657914264	108
164     	525199185853	89
164     	996103067914	68
164     	568658660566	125
164     	174237001203	64
164     	159425007904	57
164     	999543417737	80
164     	167742802915	98
164     	816260222588	116
164     	316871031375	91
164     	317663070530	61
164     	849681336901	65
164     	945012228482	70
164     	108326062706	131
164     	933914210509	102
164     	176404904473	118
164     	450659382698	110
164     	771137437634	77
164     	514254550616	78
164     	234646454745	96
164     	863129185304	127
164     	722946564026	54
164     	696368469198	74
164     	534109743798	110
164     	482340522139	95
164     	134390993040	93
164     	246144606961	54
164     	330700905340	111
164     	467615168772	147
164     	483738463713	129
164     	633320411611	131
164     	389169531271	56
164     	380734371410	50
164     	769357296879	64
164     	308792010934	145
164     	173672457176	120
164     	547244118460	150
164     	894482053097	142
164     	643925479319	83
164     	373709485267	143
164     	132186536765	68
164     	467986934495	94
164     	566877828296	75
164     	754664511022	84
164     	578147508823	115
164     	154554749200	62
164     	294993047536	61
164     	869112308003	58
164     	741544174664	102
164     	379942304309	94
164     	286243122717	75
164     	702830548447	59
164     	630929030795	58
164     	127026679653	107
164     	265444172694	75
164     	210526151030	110
164     	274761600136	64
164     	862174790606	123
164     	400127531270	125
164     	877194198700	88
164     	861348595761	84
164     	384468659793	94
164     	749193678427	115
164     	563144943925	55
164     	642234808130	107
164     	986065693858	88
164     	558886167633	55
164     	859109096191	97
164     	556388862616	99
164     	875125493289	105
164     	740581174440	74
164     	284083366181	110
164     	113476782830	58
164     	421337093409	106
164     	511511692317	150
164     	383476286895	83
164     	576518370019	60
164     	414652410482	117
164     	425456990082	138
164     	887528437482	74
164     	557899454410	143
164     	300475101700	98
164     	132954606361	128
164     	948543507361	63
164     	364745567029	87
164     	775611741635	94
165     	308792010934	77
165     	117431954043	59
165     	770565227675	53
165     	453357640486	141
165     	194144382996	93
165     	754664511022	120
165     	558886167633	78
165     	925173129386	130
165     	400930079611	75
165     	419481071217	104
165     	375276903331	53
165     	863129185304	95
165     	132186536765	150
165     	660310920540	90
165     	894482053097	78
165     	578705048123	98
165     	698718941817	110
165     	380734371410	55
165     	203262278452	125
165     	250617599940	89
165     	721857506010	100
165     	435122760857	106
165     	473186595371	76
165     	952550789390	73
165     	741544174664	122
165     	740581174440	98
165     	722946564026	81
165     	336491915536	78
165     	126834215166	57
165     	696368469198	57
165     	294993047536	104
165     	252522255166	135
165     	103362565865	82
165     	536851950801	62
165     	925484684473	123
165     	882152991390	86
165     	567657950596	77
165     	887528437482	120
165     	765572003296	88
165     	409542246104	63
165     	838962966418	77
165     	467986934495	97
165     	962728896848	139
165     	425456990082	88
165     	859109096191	100
165     	718971287692	135
165     	629919786056	69
165     	444797600349	76
165     	389169531271	87
165     	877194198700	148
165     	511511692317	101
165     	776538360607	77
165     	706236730898	109
165     	388403878360	113
165     	516495915668	133
165     	172950643766	62
165     	314482481265	67
165     	373709485267	59
165     	861348595761	60
165     	383476286895	88
165     	154554749200	61
165     	286243122717	93
165     	589814450967	71
165     	330700905340	129
165     	377848719039	149
165     	600770885624	98
165     	518329844939	79
165     	673737891943	121
165     	630929030795	124
165     	129753980851	52
165     	173672457176	118
165     	786975743876	124
165     	168074802141	72
165     	176404904473	50
165     	875605607431	106
165     	557899454410	73
165     	923237099384	58
165     	400127531270	110
165     	144568875894	115
165     	490997846898	68
165     	167742802915	79
165     	486804801433	88
165     	869112308003	51
165     	732970729968	107
165     	945312847530	121
165     	547244118460	102
165     	566877828296	94
165     	563144943925	134
165     	697814031389	110
165     	902956788286	93
165     	134390993040	50
165     	998040421944	143
165     	649921994715	87
165     	495776106616	112
165     	274761600136	109
165     	234646454745	56
165     	246144606961	136
165     	979700065093	144
165     	180531962334	116
165     	413227470171	110
165     	516286957430	106
165     	208174494479	85
165     	646511826677	112
165     	418604295928	59
165     	529831629045	104
165     	108649313374	127
165     	749625390019	139
165     	118389501460	66
165     	576518370019	84
165     	933914210509	142
165     	839518983686	65
165     	312237459250	97
165     	590034051433	71
165     	514254550616	55
165     	132954606361	132
165     	174237001203	95
165     	527453991710	62
165     	308440276732	147
165     	207178796787	115
165     	608852371253	74
166     	418604295928	124
166     	134390993040	109
166     	948543507361	73
166     	836900805029	126
166     	234646454745	115
166     	558886167633	76
166     	486804801433	106
166     	633320411611	53
166     	384468659793	58
166     	770565227675	122
166     	882152991390	79
166     	849681336901	107
166     	381299535788	73
166     	384179652400	65
166     	833663232208	148
166     	692492393712	59
166     	297083512852	121
166     	749625390019	124
166     	330700905340	52
166     	400127531270	126
166     	902956788286	139
166     	923237099384	74
166     	749193678427	64
166     	618570550236	144
166     	669515708071	95
166     	400930079611	93
166     	152614854189	80
166     	567657950596	114
166     	962728896848	104
166     	413227470171	87
166     	308440276732	88
166     	563144943925	78
166     	312237459250	60
166     	435583017631	72
166     	516286957430	65
166     	514254550616	72
166     	875125493289	63
166     	861348595761	72
166     	144568875894	110
166     	473186595371	89
166     	741544174664	125
166     	108649313374	145
166     	569219762080	108
166     	838962966418	144
166     	547244118460	111
166     	336491915536	85
166     	706236730898	75
166     	702830548447	105
166     	518329844939	139
166     	173672457176	116
166     	117431954043	127
166     	444797600349	57
166     	364745567029	97
166     	187272692439	84
166     	210526151030	145
166     	159425007904	108
166     	630929030795	60
166     	425456990082	125
166     	518787417161	113
166     	873640709962	127
166     	578147508823	52
166     	566877828296	96
166     	205930062465	68
166     	375276903331	107
166     	420756960291	112
166     	771137437634	102
166     	286243122717	92
166     	673737891943	56
166     	875605607431	102
166     	534109743798	138
166     	389169531271	121
166     	868744054130	148
166     	649921994715	116
166     	642234808130	85
166     	246144606961	84
166     	411067277447	51
167     	467986934495	116
167     	740581174440	71
167     	180531962334	89
167     	419446364450	147
167     	108326062706	57
167     	154554749200	130
167     	525199185853	65
167     	948543507361	82
167     	925484684473	79
167     	411067277447	121
167     	642234808130	134
167     	414652410482	101
167     	294993047536	135
167     	334425348148	142
167     	523196696835	132
167     	364745567029	137
167     	567657950596	150
167     	322758894316	143
167     	194144382996	142
167     	887528437482	79
167     	709229053555	60
167     	572878568883	75
167     	576518370019	130
167     	859109096191	54
167     	875605607431	103
167     	528771298719	55
167     	630929030795	129
167     	721857506010	92
167     	998040421944	60
167     	718971287692	73
167     	803607788754	96
167     	252522255166	129
167     	939369924082	87
167     	527453991710	117
167     	444797600349	122
167     	409542246104	117
167     	770565227675	88
167     	749193678427	119
167     	425456990082	72
167     	945312847530	56
167     	578705048123	66
167     	941976384328	94
167     	828509049873	60
167     	660310920540	93
167     	205930062465	60
167     	568658660566	118
167     	669515708071	136
167     	776538360607	149
167     	814141265887	120
167     	103362565865	145
167     	547685258313	148
167     	868744054130	126
167     	349435998924	66
167     	117431954043	122
167     	511511692317	124
167     	716818652888	135
167     	400127531270	87
167     	849681336901	72
167     	916984241291	61
167     	618570550236	103
167     	722946564026	75
167     	589814450967	89
167     	833663232208	76
167     	902956788286	145
167     	187272692439	76
167     	486804801433	99
167     	420756960291	147
167     	308792010934	76
167     	388403878360	112
167     	349330324726	96
167     	132186536765	106
167     	284083366181	137
167     	547244118460	89
167     	334074319971	59
167     	982079076090	90
167     	400930079611	55
167     	923237099384	62
167     	152614854189	84
167     	896919583724	102
167     	377848719039	106
167     	636021875565	86
167     	482429892907	80
167     	805966823208	122
167     	264132323061	121
167     	473186595371	76
167     	67014520356 	132
167     	203262278452	142
167     	435583017631	63
167     	996103067914	86
167     	418604295928	144
167     	375276903331	67
167     	140903716305	59
167     	979700065093	137
167     	265444172694	102
167     	732970729968	84
167     	159425007904	104
167     	129753980851	137
168     	673737891943	149
168     	286243122717	52
168     	873640709962	93
168     	994411186239	92
168     	839518983686	70
168     	833663232208	58
168     	859109096191	129
168     	297083512852	54
168     	948543507361	98
168     	721857506010	73
168     	199753522658	90
168     	118389501460	108
168     	630929030795	51
168     	765572003296	72
168     	290827207620	145
168     	364745567029	98
168     	168074802141	59
168     	578147508823	136
168     	572878568883	125
168     	486804801433	146
168     	490997846898	60
168     	252522255166	115
168     	518787417161	117
168     	227635917829	122
168     	511511692317	135
168     	590034051433	66
168     	506298714832	140
168     	117431954043	142
168     	381299535788	107
168     	173672457176	80
168     	642234808130	55
168     	412348931569	60
168     	986202008726	110
168     	649921994715	79
168     	265444172694	71
168     	702421087613	129
168     	108326062706	119
168     	775611741635	98
168     	567657950596	57
168     	339589987290	126
168     	384468659793	145
168     	996103067914	77
168     	159425007904	109
168     	999543417737	63
168     	126834215166	107
168     	816260222588	139
168     	925484684473	61
168     	528771298719	95
168     	509762284879	87
168     	716818652888	87
168     	556388862616	66
168     	875125493289	69
168     	718971287692	134
168     	419446364450	128
168     	893005812666	94
168     	377848719039	63
168     	945012228482	127
168     	334425348148	110
168     	549746556299	118
168     	769357296879	73
168     	167742802915	147
168     	527453991710	110
168     	180531962334	92
168     	205930062465	76
168     	203262278452	85
168     	400930079611	150
168     	660310920540	150
168     	557899454410	103
168     	421337093409	58
168     	786975743876	108
168     	274761600136	135
168     	576518370019	143
168     	603333456348	65
168     	998040421944	83
168     	702830548447	133
168     	317663070530	140
168     	294993047536	114
168     	482429892907	113
168     	375276903331	124
168     	272121204465	138
168     	945312847530	64
168     	875605607431	85
168     	234646454745	58
168     	633320411611	52
168     	207178796787	58
168     	419481071217	122
168     	566877828296	99
168     	389169531271	56
168     	174237001203	116
168     	129753980851	133
168     	435583017631	129
168     	982079076090	94
168     	979700065093	117
168     	146051347589	136
168     	113476782830	93
168     	194144382996	111
168     	654563447110	98
168     	525199185853	137
168     	608852371253	94
168     	939369924082	122
168     	246144606961	50
168     	709229053555	61
168     	264132323061	76
168     	986065693858	130
168     	643925479319	90
168     	568658660566	122
168     	697814031389	85
168     	941976384328	100
168     	523196696835	69
168     	861348595761	147
168     	894482053097	61
168     	882152991390	149
168     	896919583724	106
168     	750886611187	73
168     	944472664850	59
168     	629919786056	143
168     	103362565865	103
168     	698718941817	118
168     	838962966418	108
168     	589814450967	138
168     	741544174664	74
168     	411067277447	99
168     	409542246104	140
168     	814141265887	134
168     	862174790606	134
168     	473186595371	91
168     	771137437634	73
168     	154554749200	82
168     	868744054130	64
168     	420756960291	90
168     	722946564026	147
168     	696368469198	125
168     	450659382698	74
168     	127026679653	144
168     	189470486214	134
168     	373709485267	109
168     	776538360607	100
168     	187272692439	137
168     	322758894316	51
169     	996103067914	146
169     	557899454410	109
169     	646511826677	134
169     	388403878360	141
169     	419446364450	60
169     	919197823026	62
169     	419481071217	75
169     	518329844939	59
169     	384179652400	135
169     	420756960291	145
169     	600770885624	86
169     	103362565865	129
169     	945012228482	92
169     	618570550236	104
169     	117431954043	142
169     	608852371253	50
169     	457459442332	149
169     	904647940449	147
169     	330700905340	78
169     	435122760857	108
169     	893005812666	82
169     	894482053097	94
169     	234646454745	147
169     	167742802915	87
169     	660310920540	60
169     	994411186239	109
169     	569219762080	130
169     	495776106616	102
169     	941976384328	59
169     	527453991710	134
169     	284083366181	55
169     	999543417737	127
169     	786975743876	147
169     	849681336901	135
169     	962728896848	77
169     	316871031375	131
169     	453357640486	98
169     	199968033019	118
169     	863129185304	51
169     	199753522658	66
169     	134390993040	136
169     	979700065093	93
169     	722946564026	68
169     	322758894316	110
169     	118389501460	73
169     	816260222588	88
169     	629919786056	69
169     	174237001203	89
169     	673737891943	80
169     	413227470171	78
169     	509762284879	110
169     	435583017631	98
169     	207178796787	101
169     	154554749200	54
169     	828509049873	142
169     	529831629045	59
169     	871701186034	69
169     	563144943925	72
169     	839518983686	141
169     	998040421944	89
169     	389169531271	145
169     	264132323061	73
169     	741544174664	78
169     	208174494479	143
169     	769357296879	111
169     	294993047536	94
169     	679453075525	125
169     	308440276732	89
169     	108649313374	91
169     	67014520356 	55
169     	467615168772	72
169     	556388862616	94
169     	765572003296	62
169     	308792010934	93
170     	642234808130	59
170     	698718941817	93
170     	334074319971	108
170     	702830548447	99
170     	547685258313	117
170     	692492393712	96
170     	529831629045	93
170     	805966823208	64
170     	490997846898	97
170     	702421087613	148
170     	180531962334	136
170     	384468659793	120
170     	899657914264	101
170     	380734371410	109
170     	482429892907	128
170     	199753522658	120
170     	154554749200	133
170     	528771298719	92
170     	264132323061	138
170     	549746556299	127
170     	411067277447	78
170     	994411186239	54
170     	400127531270	132
170     	877194198700	60
170     	887528437482	61
170     	129753980851	58
170     	933914210509	74
170     	859109096191	51
170     	205930062465	54
170     	108649313374	131
170     	132186536765	50
170     	769357296879	78
170     	457459442332	92
170     	740581174440	139
170     	383476286895	60
170     	518329844939	85
170     	572878568883	112
170     	412348931569	65
170     	944472664850	69
170     	453357640486	81
170     	511511692317	100
170     	518787417161	52
170     	373709485267	131
170     	697814031389	59
170     	172950643766	131
170     	590034051433	123
170     	986202008726	89
170     	294993047536	106
170     	467615168772	56
170     	696368469198	114
170     	435122760857	81
170     	776538360607	102
170     	516286957430	145
170     	189470486214	141
170     	176404904473	146
170     	948543507361	138
170     	633320411611	143
170     	379942304309	56
170     	207178796787	80
170     	998040421944	106
170     	893005812666	144
170     	336491915536	54
170     	833663232208	136
170     	741544174664	68
170     	467986934495	66
170     	272121204465	111
170     	509762284879	83
170     	419446364450	91
170     	265444172694	53
170     	603333456348	99
170     	578147508823	129
170     	630929030795	138
170     	649921994715	84
170     	290827207620	82
170     	999543417737	51
170     	199968033019	89
170     	862174790606	107
170     	414652410482	70
170     	334425348148	108
170     	159425007904	56
170     	398900612810	105
170     	775611741635	111
170     	246144606961	66
170     	986065693858	148
170     	312237459250	55
170     	419481071217	77
170     	300475101700	134
170     	716818652888	116
170     	118389501460	101
170     	486804801433	58
170     	925484684473	101
170     	167742802915	96
170     	317663070530	69
170     	568658660566	55
170     	322758894316	50
170     	732970729968	63
170     	643925479319	60
170     	375276903331	110
170     	814141265887	97
170     	425456990082	149
170     	208174494479	59
170     	941976384328	149
170     	945312847530	138
170     	384179652400	50
170     	919197823026	102
170     	234646454745	58
170     	534109743798	125
170     	660310920540	57
170     	882152991390	130
170     	203262278452	107
170     	709229053555	71
170     	923237099384	139
170     	495776106616	81
170     	314482481265	116
170     	945012228482	80
170     	786975743876	121
170     	718971287692	65
170     	152614854189	150
170     	904647940449	127
170     	525199185853	101
170     	871701186034	83
170     	364745567029	138
170     	514254550616	72
170     	896919583724	139
170     	902956788286	86
170     	636021875565	50
170     	482340522139	82
170     	108326062706	133
170     	556388862616	89
170     	669515708071	127
170     	679453075525	51
170     	600770885624	73
170     	894482053097	123
170     	418604295928	141
170     	523196696835	128
170     	508818965558	146
170     	558886167633	70
170     	330700905340	95
170     	869112308003	67
170     	567657950596	131
170     	435583017631	78
170     	982079076090	134
170     	527453991710	86
170     	286243122717	123
170     	839518983686	139
170     	828509049873	103
171     	706236730898	58
171     	996103067914	88
171     	412348931569	117
171     	566877828296	65
171     	523196696835	109
171     	702421087613	62
171     	210526151030	68
171     	589814450967	81
171     	868744054130	107
171     	176404904473	83
171     	189470486214	105
171     	633320411611	60
171     	894482053097	80
171     	786975743876	122
171     	389169531271	83
171     	833663232208	119
171     	945012228482	73
171     	578147508823	101
171     	536851950801	117
171     	384468659793	72
171     	482429892907	108
171     	873640709962	99
171     	334074319971	67
171     	525199185853	56
171     	194144382996	87
171     	364745567029	134
171     	558886167633	143
171     	916984241291	101
171     	286243122717	121
171     	516495915668	101
171     	933914210509	85
171     	208174494479	89
171     	420756960291	98
171     	317663070530	78
171     	146051347589	134
171     	297083512852	55
171     	250617599940	124
171     	384179652400	93
171     	636021875565	56
171     	144568875894	94
171     	108326062706	112
171     	274761600136	98
171     	859109096191	132
171     	140903716305	97
171     	944472664850	114
171     	284083366181	56
171     	490997846898	144
171     	554521191996	148
171     	877194198700	106
171     	770565227675	100
171     	418604295928	74
171     	749625390019	112
171     	129753980851	124
171     	803607788754	120
171     	265444172694	143
171     	483738463713	59
171     	187272692439	95
171     	925484684473	86
171     	134390993040	114
171     	453357640486	126
171     	316871031375	126
171     	630929030795	50
171     	816260222588	105
171     	375276903331	127
171     	108649313374	145
171     	103362565865	68
171     	838962966418	51
171     	899657914264	114
171     	863129185304	147
171     	697814031389	116
171     	660310920540	109
171     	419446364450	77
171     	805966823208	81
171     	400127531270	134
171     	557899454410	148
171     	740581174440	53
171     	495776106616	88
171     	339589987290	51
171     	754664511022	137
171     	547685258313	118
171     	765572003296	91
171     	300475101700	82
171     	600770885624	108
171     	373709485267	95
171     	887528437482	140
171     	722946564026	100
171     	383476286895	58
171     	308440276732	94
171     	199968033019	122
171     	199753522658	120
171     	529831629045	116
171     	875605607431	54
171     	322758894316	125
171     	264132323061	69
171     	444797600349	129
171     	547244118460	94
171     	839518983686	124
171     	435122760857	57
171     	388403878360	101
171     	941976384328	117
171     	590034051433	117
171     	205930062465	115
171     	896919583724	105
171     	549746556299	73
171     	702830548447	144
171     	308792010934	96
171     	67014520356 	102
171     	904647940449	50
171     	272121204465	147
171     	132186536765	94
171     	569219762080	83
171     	948543507361	149
171     	207178796787	127
171     	654563447110	79
171     	749193678427	147
172     	859109096191	139
172     	814141265887	56
172     	660310920540	116
172     	986065693858	77
172     	948543507361	69
172     	208174494479	118
172     	419446364450	138
172     	146051347589	119
172     	199968033019	85
172     	207178796787	101
172     	411067277447	72
172     	740581174440	143
172     	144568875894	110
172     	514254550616	132
172     	547244118460	83
172     	939369924082	116
172     	495776106616	56
172     	261188186216	109
172     	702421087613	72
172     	925173129386	79
172     	923237099384	102
172     	508818965558	110
172     	642234808130	134
172     	893005812666	75
172     	286243122717	78
172     	578147508823	95
172     	189470486214	101
172     	805966823208	100
172     	506298714832	69
172     	334425348148	54
172     	528771298719	110
172     	589814450967	124
172     	636021875565	140
172     	388403878360	61
172     	381299535788	109
172     	649921994715	140
172     	132186536765	80
172     	398900612810	56
172     	152614854189	55
172     	167742802915	66
172     	839518983686	96
172     	210526151030	149
172     	750886611187	55
172     	629919786056	76
172     	633320411611	99
172     	467615168772	102
172     	563144943925	80
172     	444797600349	57
172     	697814031389	84
172     	770565227675	114
172     	769357296879	57
172     	117431954043	73
172     	317663070530	68
173     	692492393712	73
173     	189470486214	106
173     	252522255166	74
173     	702830548447	69
173     	894482053097	80
173     	349330324726	116
173     	569219762080	52
173     	523196696835	67
173     	103362565865	131
173     	482429892907	51
173     	140903716305	85
173     	740581174440	141
173     	265444172694	68
173     	805966823208	81
173     	384468659793	56
173     	643925479319	108
173     	877194198700	106
173     	506298714832	83
173     	467615168772	127
173     	732970729968	101
173     	203262278452	133
173     	836900805029	130
173     	400127531270	93
173     	741544174664	93
173     	187272692439	93
173     	308440276732	87
173     	816260222588	96
173     	875605607431	67
173     	420756960291	50
173     	132954606361	97
173     	916984241291	115
173     	849681336901	71
173     	776538360607	68
173     	377848719039	97
173     	696368469198	112
173     	316871031375	57
173     	838962966418	75
173     	334074319971	75
173     	786975743876	146
173     	941976384328	78
173     	126834215166	76
173     	205930062465	75
173     	159425007904	64
173     	590034051433	53
173     	516286957430	117
173     	567657950596	78
173     	925173129386	97
173     	554521191996	134
173     	547244118460	101
173     	862174790606	69
173     	833663232208	101
173     	527453991710	57
173     	261188186216	51
173     	412348931569	116
173     	118389501460	73
173     	566877828296	110
173     	697814031389	94
173     	765572003296	57
173     	383476286895	59
173     	875125493289	122
173     	547685258313	70
173     	486804801433	67
173     	375276903331	139
173     	698718941817	140
173     	549746556299	114
173     	871701186034	58
173     	839518983686	76
173     	488529033803	108
173     	457459442332	91
173     	568658660566	111
173     	771137437634	81
173     	129753980851	89
173     	887528437482	107
173     	642234808130	85
173     	168074802141	110
173     	578705048123	59
173     	379942304309	50
173     	425456990082	96
173     	861348595761	85
173     	869112308003	62
173     	630929030795	144
173     	435583017631	123
173     	264132323061	108
173     	286243122717	101
173     	529831629045	70
173     	923237099384	75
173     	600770885624	119
173     	435122760857	77
173     	339589987290	90
173     	679453075525	75
173     	67014520356 	149
173     	556388862616	147
173     	775611741635	145
173     	227635917829	68
173     	770565227675	82
173     	749625390019	113
173     	925484684473	149
173     	557899454410	140
173     	330700905340	94
173     	654563447110	118
173     	636021875565	72
173     	250617599940	56
173     	419446364450	129
173     	450659382698	65
173     	754664511022	88
173     	108649313374	148
173     	518329844939	110
173     	364745567029	73
173     	284083366181	71
173     	511511692317	105
173     	421337093409	107
173     	948543507361	70
173     	608852371253	74
173     	152614854189	122
173     	863129185304	77
173     	322758894316	147
173     	154554749200	52
173     	982079076090	56
173     	618570550236	130
173     	132186536765	55
173     	384179652400	143
173     	994411186239	90
173     	134390993040	148
173     	199968033019	136
173     	483738463713	97
173     	419481071217	95
173     	127026679653	54
173     	660310920540	82
173     	750886611187	101
173     	516495915668	85
173     	398900612810	61
173     	919197823026	117
173     	979700065093	57
173     	558886167633	150
173     	409542246104	64
173     	430946284790	63
173     	482340522139	135
173     	172950643766	60
173     	814141265887	95
173     	199753522658	127
174     	435122760857	108
174     	234646454745	128
174     	349435998924	73
174     	749193678427	72
174     	643925479319	69
174     	566877828296	56
174     	654563447110	58
174     	518329844939	102
174     	590034051433	69
174     	534109743798	129
174     	919197823026	145
174     	483738463713	102
174     	833663232208	75
174     	373709485267	81
174     	294993047536	65
174     	375276903331	67
174     	893005812666	92
174     	509762284879	100
174     	636021875565	89
174     	925484684473	142
174     	516286957430	123
174     	814141265887	148
174     	126834215166	54
174     	67014520356 	59
174     	274761600136	95
174     	339589987290	139
174     	284083366181	54
174     	418604295928	108
174     	862174790606	141
174     	569219762080	61
174     	252522255166	145
174     	709229053555	86
174     	572878568883	139
174     	630929030795	76
174     	400930079611	60
174     	132186536765	135
174     	558886167633	142
174     	706236730898	146
174     	902956788286	109
174     	608852371253	73
174     	334425348148	67
174     	679453075525	121
174     	419446364450	69
174     	986202008726	114
174     	869112308003	83
174     	871701186034	122
174     	941976384328	73
174     	207178796787	102
174     	250617599940	54
174     	673737891943	133
175     	516495915668	145
175     	716818652888	142
175     	803607788754	127
175     	167742802915	87
175     	194144382996	71
175     	384179652400	124
175     	828509049873	144
175     	877194198700	120
175     	749625390019	76
175     	839518983686	62
175     	117431954043	106
175     	482340522139	81
175     	189470486214	61
175     	633320411611	51
175     	527453991710	123
175     	904647940449	87
175     	982079076090	97
175     	933914210509	107
175     	490997846898	122
175     	882152991390	60
175     	108326062706	62
175     	300475101700	142
175     	919197823026	60
175     	709229053555	125
175     	207178796787	139
175     	126834215166	101
175     	418604295928	80
175     	435583017631	83
175     	861348595761	58
175     	873640709962	112
175     	246144606961	145
175     	567657950596	92
175     	962728896848	143
175     	721857506010	80
175     	590034051433	115
175     	180531962334	100
175     	578705048123	53
175     	673737891943	97
175     	453357640486	87
175     	706236730898	67
175     	816260222588	93
175     	139669412174	52
175     	400127531270	117
175     	511511692317	82
175     	986065693858	72
175     	388403878360	92
175     	398900612810	67
175     	127026679653	113
175     	925484684473	95
175     	308792010934	77
175     	67014520356 	99
175     	509762284879	50
175     	589814450967	104
175     	210526151030	120
175     	467986934495	87
175     	805966823208	55
175     	547244118460	50
175     	998040421944	100
175     	765572003296	146
175     	568658660566	98
175     	435122760857	127
175     	199753522658	86
175     	749193678427	89
175     	473186595371	56
175     	618570550236	112
175     	172950643766	130
175     	152614854189	64
175     	159425007904	96
175     	425456990082	129
175     	740581174440	134
175     	697814031389	83
175     	349435998924	135
175     	144568875894	127
176     	314482481265	109
176     	508818965558	134
176     	506298714832	55
176     	600770885624	103
176     	569219762080	64
176     	962728896848	135
176     	252522255166	139
176     	769357296879	51
176     	833663232208	135
176     	740581174440	84
176     	187272692439	140
176     	144568875894	91
176     	377848719039	50
176     	902956788286	70
176     	312237459250	127
176     	250617599940	150
176     	375276903331	126
176     	168074802141	138
176     	698718941817	89
176     	516286957430	129
176     	603333456348	89
176     	875605607431	127
176     	265444172694	105
176     	554521191996	97
176     	409542246104	148
176     	108326062706	93
176     	518329844939	94
176     	420756960291	121
176     	330700905340	69
176     	836900805029	77
176     	945012228482	78
176     	316871031375	86
176     	945312847530	78
176     	692492393712	126
176     	132186536765	57
176     	999543417737	90
176     	467986934495	76
176     	139669412174	64
176     	547685258313	52
176     	770565227675	105
176     	509762284879	148
176     	814141265887	115
176     	948543507361	131
176     	673737891943	70
176     	630929030795	144
176     	364745567029	120
176     	146051347589	110
176     	941976384328	60
176     	904647940449	142
176     	916984241291	144
176     	629919786056	103
176     	486804801433	116
176     	234646454745	113
176     	996103067914	75
176     	272121204465	112
176     	450659382698	133
176     	453357640486	94
176     	590034051433	120
176     	702830548447	98
176     	633320411611	141
176     	227635917829	57
176     	722946564026	101
176     	418604295928	73
176     	261188186216	81
176     	706236730898	119
176     	411067277447	91
176     	127026679653	58
176     	863129185304	72
176     	896919583724	73
176     	308440276732	83
176     	709229053555	110
176     	482340522139	128
176     	208174494479	75
176     	568658660566	65
176     	129753980851	86
176     	154554749200	69
176     	558886167633	65
176     	482429892907	129
176     	113476782830	121
176     	384468659793	76
176     	172950643766	119
176     	207178796787	93
176     	435583017631	64
176     	516495915668	136
176     	167742802915	86
176     	297083512852	80
176     	444797600349	105
176     	527453991710	73
176     	660310920540	147
176     	578705048123	133
176     	919197823026	138
176     	572878568883	95
176     	349330324726	133
176     	180531962334	56
176     	557899454410	113
176     	718971287692	126
176     	567657950596	109
176     	894482053097	91
176     	339589987290	137
176     	264132323061	76
176     	576518370019	52
176     	986202008726	90
176     	430946284790	72
176     	563144943925	116
176     	944472664850	81
176     	373709485267	136
176     	669515708071	108
176     	771137437634	119
176     	925484684473	56
176     	317663070530	113
176     	117431954043	80
176     	414652410482	97
176     	643925479319	144
176     	775611741635	75
177     	108326062706	129
177     	208174494479	129
177     	816260222588	58
177     	467986934495	143
177     	246144606961	122
177     	334425348148	129
177     	167742802915	136
177     	518329844939	84
177     	569219762080	136
177     	514254550616	130
177     	709229053555	60
177     	869112308003	102
177     	377848719039	122
177     	339589987290	110
177     	413227470171	150
177     	199968033019	54
177     	482429892907	124
177     	833663232208	60
177     	194144382996	126
177     	409542246104	141
177     	568658660566	88
177     	916984241291	122
177     	203262278452	136
177     	411067277447	75
177     	375276903331	141
177     	127026679653	136
177     	642234808130	84
177     	629919786056	122
177     	187272692439	89
177     	633320411611	139
177     	925173129386	76
177     	643925479319	105
177     	336491915536	101
177     	875605607431	81
177     	400930079611	109
177     	899657914264	60
177     	511511692317	117
177     	836900805029	126
177     	765572003296	51
177     	769357296879	63
177     	669515708071	128
177     	508818965558	108
177     	159425007904	88
177     	284083366181	143
177     	227635917829	106
177     	152614854189	84
177     	556388862616	130
177     	589814450967	132
177     	919197823026	101
177     	649921994715	149
177     	67014520356 	126
177     	108649313374	122
177     	234646454745	69
177     	948543507361	100
177     	168074802141	134
178     	603333456348	135
178     	925173129386	144
178     	435122760857	126
178     	803607788754	136
178     	450659382698	78
178     	706236730898	133
178     	716818652888	108
178     	566877828296	127
178     	457459442332	125
178     	933914210509	61
178     	144568875894	138
178     	482429892907	68
178     	203262278452	59
178     	420756960291	126
178     	828509049873	55
178     	939369924082	53
178     	412348931569	61
178     	833663232208	126
178     	630929030795	94
178     	419446364450	110
178     	284083366181	131
178     	409542246104	127
178     	146051347589	125
178     	139669412174	148
178     	336491915536	97
178     	578705048123	59
178     	996103067914	87
178     	316871031375	144
178     	381299535788	130
178     	495776106616	129
178     	140903716305	69
178     	814141265887	143
178     	618570550236	142
178     	334425348148	130
178     	776538360607	149
178     	227635917829	137
178     	205930062465	59
178     	536851950801	132
178     	421337093409	144
178     	722946564026	130
178     	389169531271	56
178     	373709485267	131
178     	882152991390	73
178     	430946284790	97
178     	377848719039	114
178     	339589987290	56
178     	770565227675	86
178     	322758894316	77
178     	419481071217	52
178     	994411186239	150
178     	979700065093	147
178     	896919583724	86
178     	836900805029	120
178     	529831629045	123
178     	334074319971	122
178     	899657914264	74
178     	297083512852	117
178     	286243122717	51
178     	473186595371	61
178     	246144606961	58
178     	199968033019	124
178     	199753522658	127
178     	633320411611	105
178     	919197823026	68
179     	108649313374	86
179     	457459442332	51
179     	904647940449	120
179     	421337093409	52
179     	173672457176	97
179     	803607788754	126
179     	547685258313	82
179     	721857506010	98
179     	679453075525	96
179     	698718941817	112
179     	771137437634	132
179     	154554749200	139
179     	435583017631	85
179     	873640709962	92
179     	261188186216	142
179     	450659382698	110
179     	312237459250	75
179     	923237099384	64
179     	159425007904	113
179     	317663070530	84
179     	750886611187	88
179     	129753980851	95
179     	205930062465	103
179     	419481071217	143
179     	398900612810	52
179     	453357640486	83
179     	875125493289	93
179     	199968033019	138
179     	649921994715	90
179     	556388862616	113
179     	578147508823	100
179     	869112308003	140
179     	509762284879	150
179     	529831629045	132
179     	859109096191	104
179     	536851950801	105
179     	589814450967	107
179     	642234808130	118
179     	732970729968	60
179     	775611741635	51
179     	696368469198	70
179     	420756960291	111
179     	578705048123	88
179     	887528437482	143
179     	483738463713	65
179     	308792010934	107
179     	566877828296	139
179     	945312847530	95
179     	643925479319	104
179     	849681336901	148
179     	167742802915	133
179     	435122760857	83
179     	265444172694	111
179     	805966823208	122
179     	384468659793	80
179     	189470486214	61
179     	740581174440	55
179     	379942304309	141
179     	925484684473	139
179     	375276903331	110
179     	525199185853	118
179     	126834215166	138
179     	816260222588	141
179     	444797600349	129
179     	925173129386	144
179     	473186595371	89
179     	389169531271	85
179     	982079076090	127
179     	600770885624	93
179     	554521191996	54
179     	380734371410	82
179     	516286957430	146
179     	274761600136	68
179     	418604295928	110
179     	208174494479	68
179     	660310920540	148
179     	776538360607	138
179     	518329844939	106
179     	297083512852	116
179     	986065693858	69
179     	893005812666	101
179     	877194198700	81
180     	939369924082	150
180     	786975743876	134
180     	925484684473	148
180     	379942304309	144
180     	334074319971	125
180     	132954606361	67
180     	904647940449	131
180     	718971287692	52
180     	572878568883	61
180     	509762284879	58
180     	113476782830	51
180     	554521191996	107
180     	618570550236	98
180     	377848719039	108
180     	578147508823	126
180     	400930079611	149
180     	643925479319	113
180     	312237459250	125
180     	740581174440	106
180     	649921994715	89
180     	375276903331	149
180     	636021875565	52
180     	252522255166	93
180     	284083366181	51
180     	871701186034	107
180     	873640709962	142
180     	173672457176	128
180     	425456990082	139
180     	999543417737	111
180     	373709485267	91
180     	945012228482	110
180     	629919786056	77
180     	154554749200	64
180     	364745567029	137
180     	317663070530	120
180     	590034051433	98
180     	339589987290	53
180     	566877828296	58
180     	203262278452	81
180     	557899454410	73
180     	172950643766	104
180     	174237001203	60
180     	518787417161	92
180     	923237099384	70
180     	859109096191	133
180     	176404904473	130
180     	986202008726	68
180     	549746556299	142
180     	702830548447	62
180     	899657914264	52
180     	721857506010	137
180     	944472664850	80
180     	467986934495	58
180     	205930062465	130
180     	765572003296	130
180     	398900612810	53
180     	146051347589	130
180     	654563447110	72
180     	152614854189	67
180     	483738463713	50
180     	589814450967	107
180     	140903716305	62
180     	814141265887	110
180     	749193678427	143
180     	467615168772	61
180     	803607788754	140
180     	159425007904	106
180     	749625390019	150
180     	322758894316	67
180     	108649313374	141
180     	838962966418	146
180     	875125493289	114
180     	234646454745	107
180     	286243122717	129
180     	144568875894	101
180     	673737891943	61
180     	833663232208	101
180     	334425348148	61
180     	877194198700	108
180     	199753522658	50
180     	603333456348	112
180     	732970729968	72
180     	568658660566	95
180     	536851950801	61
180     	529831629045	113
180     	919197823026	74
180     	506298714832	121
180     	316871031375	67
180     	189470486214	141
180     	418604295928	71
180     	516495915668	75
180     	473186595371	79
180     	849681336901	107
180     	875605607431	63
180     	167742802915	60
180     	902956788286	135
180     	127026679653	64
180     	516286957430	107
180     	380734371410	140
180     	633320411611	130
180     	696368469198	95
180     	495776106616	115
180     	523196696835	121
180     	896919583724	100
180     	770565227675	79
180     	868744054130	123
180     	952550789390	124
180     	986065693858	142
180     	389169531271	115
180     	750886611187	141
180     	300475101700	73
180     	126834215166	71
180     	168074802141	69
180     	836900805029	83
180     	349435998924	59
180     	702421087613	133
180     	525199185853	133
180     	180531962334	129
180     	642234808130	115
180     	435583017631	119
180     	706236730898	62
180     	698718941817	104
180     	187272692439	51
180     	265444172694	136
180     	349330324726	52
180     	413227470171	55
180     	384179652400	105
180     	421337093409	59
180     	297083512852	136
180     	722946564026	82
180     	567657950596	105
180     	117431954043	62
180     	336491915536	58
180     	716818652888	131
180     	103362565865	66
180     	916984241291	128
180     	134390993040	127
180     	979700065093	55
180     	208174494479	85
180     	129753980851	63
180     	444797600349	111
181     	174237001203	93
181     	567657950596	123
181     	467986934495	131
181     	495776106616	108
181     	697814031389	98
181     	998040421944	141
181     	633320411611	115
181     	557899454410	137
181     	692492393712	53
181     	919197823026	105
181     	483738463713	109
181     	207178796787	116
181     	444797600349	88
181     	420756960291	87
181     	379942304309	108
181     	146051347589	102
181     	894482053097	61
181     	750886611187	84
181     	274761600136	85
181     	290827207620	109
181     	589814450967	112
181     	549746556299	146
181     	334425348148	124
181     	630929030795	73
181     	962728896848	69
181     	364745567029	50
181     	805966823208	141
181     	418604295928	54
181     	994411186239	86
181     	576518370019	126
181     	629919786056	140
181     	227635917829	150
181     	139669412174	77
181     	430946284790	146
181     	923237099384	135
181     	869112308003	145
181     	172950643766	111
181     	578147508823	59
181     	132954606361	67
181     	414652410482	120
181     	482429892907	97
181     	529831629045	60
181     	167742802915	95
181     	871701186034	130
181     	132186536765	131
181     	925173129386	132
181     	316871031375	133
181     	511511692317	144
181     	863129185304	125
181     	899657914264	119
181     	194144382996	82
181     	168074802141	63
181     	210526151030	67
181     	896919583724	53
181     	749625390019	101
181     	516495915668	62
181     	803607788754	74
181     	409542246104	88
181     	547244118460	108
181     	696368469198	134
181     	380734371410	113
181     	154554749200	137
181     	518329844939	84
182     	516495915668	79
182     	173672457176	148
182     	554521191996	52
182     	709229053555	99
182     	923237099384	124
182     	380734371410	138
182     	384179652400	145
182     	643925479319	127
182     	482429892907	72
182     	508818965558	54
182     	189470486214	121
182     	646511826677	82
182     	933914210509	80
182     	692492393712	134
182     	775611741635	135
182     	523196696835	51
182     	140903716305	126
182     	488529033803	74
182     	862174790606	71
182     	669515708071	64
182     	207178796787	91
182     	317663070530	106
182     	998040421944	106
182     	486804801433	117
182     	411067277447	127
182     	589814450967	50
182     	944472664850	93
182     	982079076090	131
182     	994411186239	62
182     	103362565865	107
182     	509762284879	125
182     	294993047536	103
182     	419446364450	128
182     	127026679653	98
182     	108649313374	119
182     	187272692439	65
182     	194144382996	89
182     	129753980851	68
182     	467986934495	59
182     	286243122717	82
182     	576518370019	101
182     	373709485267	146
182     	721857506010	125
182     	421337093409	105
182     	749625390019	56
182     	108326062706	136
182     	250617599940	139
182     	887528437482	133
182     	776538360607	119
182     	814141265887	59
182     	578705048123	51
182     	364745567029	147
182     	265444172694	143
182     	272121204465	88
182     	805966823208	96
183     	649921994715	122
183     	486804801433	148
183     	154554749200	149
183     	207178796787	148
183     	290827207620	86
183     	467986934495	102
183     	297083512852	132
183     	875125493289	125
183     	567657950596	96
183     	272121204465	91
183     	314482481265	114
183     	944472664850	71
183     	986065693858	114
183     	384179652400	145
183     	709229053555	76
183     	702421087613	59
183     	534109743798	67
183     	578705048123	124
183     	308792010934	122
183     	547244118460	121
183     	506298714832	76
183     	316871031375	58
183     	776538360607	138
183     	986202008726	106
183     	527453991710	107
183     	603333456348	50
183     	722946564026	116
183     	887528437482	145
183     	453357640486	92
183     	330700905340	109
183     	495776106616	91
183     	925484684473	115
183     	117431954043	94
183     	863129185304	111
183     	132186536765	118
183     	566877828296	56
183     	525199185853	99
183     	419446364450	139
183     	816260222588	65
183     	284083366181	58
183     	373709485267	73
183     	516495915668	136
183     	996103067914	131
183     	557899454410	74
183     	554521191996	142
183     	868744054130	86
183     	563144943925	96
183     	893005812666	56
183     	511511692317	55
183     	702830548447	88
183     	769357296879	77
183     	227635917829	77
183     	590034051433	132
183     	377848719039	149
183     	859109096191	85
183     	750886611187	106
183     	962728896848	113
183     	669515708071	104
183     	189470486214	77
183     	899657914264	127
183     	805966823208	79
183     	312237459250	130
183     	322758894316	83
183     	398900612810	74
183     	246144606961	71
183     	904647940449	91
183     	380734371410	106
183     	873640709962	71
183     	732970729968	58
183     	375276903331	110
183     	600770885624	54
183     	618570550236	135
183     	982079076090	81
183     	923237099384	108
183     	176404904473	111
183     	871701186034	86
183     	205930062465	140
183     	945312847530	51
183     	749625390019	76
183     	425456990082	130
183     	180531962334	66
183     	144568875894	68
183     	833663232208	63
183     	250617599940	146
183     	771137437634	138
183     	518787417161	102
183     	146051347589	67
183     	473186595371	127
183     	126834215166	83
183     	568658660566	89
183     	199753522658	138
183     	706236730898	138
183     	173672457176	137
183     	509762284879	92
183     	152614854189	148
183     	103362565865	125
183     	999543417737	94
183     	692492393712	134
183     	896919583724	146
183     	140903716305	73
183     	413227470171	91
183     	646511826677	52
183     	174237001203	82
183     	168074802141	145
183     	939369924082	76
183     	482429892907	62
183     	265444172694	137
183     	529831629045	148
183     	882152991390	87
183     	803607788754	108
183     	139669412174	146
183     	108649313374	70
183     	828509049873	98
183     	654563447110	123
183     	490997846898	144
183     	388403878360	124
183     	409542246104	74
183     	516286957430	57
183     	836900805029	53
183     	979700065093	123
183     	411067277447	65
183     	383476286895	128
183     	457459442332	84
183     	488529033803	63
183     	294993047536	124
183     	127026679653	65
183     	718971287692	95
183     	167742802915	104
183     	998040421944	101
183     	264132323061	99
183     	483738463713	75
183     	518329844939	141
183     	569219762080	59
183     	994411186239	52
183     	414652410482	107
183     	334425348148	84
183     	364745567029	59
183     	849681336901	81
183     	925173129386	135
183     	467615168772	66
183     	418604295928	95
184     	173672457176	121
184     	467986934495	50
184     	511511692317	97
184     	887528437482	91
184     	203262278452	96
184     	979700065093	106
184     	636021875565	144
184     	721857506010	109
184     	308792010934	88
184     	375276903331	126
184     	875605607431	74
184     	945012228482	94
184     	483738463713	140
184     	316871031375	68
184     	566877828296	125
184     	952550789390	102
184     	420756960291	95
184     	527453991710	65
184     	618570550236	146
184     	127026679653	58
184     	389169531271	97
184     	849681336901	89
184     	444797600349	88
184     	871701186034	111
184     	933914210509	130
184     	679453075525	108
184     	600770885624	133
184     	569219762080	116
184     	803607788754	111
184     	673737891943	94
184     	411067277447	84
184     	741544174664	118
184     	589814450967	130
184     	322758894316	103
184     	814141265887	50
184     	923237099384	58
184     	144568875894	69
184     	697814031389	64
184     	893005812666	105
184     	698718941817	122
184     	414652410482	98
184     	174237001203	112
184     	770565227675	80
184     	765572003296	125
184     	669515708071	76
184     	716818652888	97
184     	246144606961	71
184     	833663232208	50
184     	272121204465	68
184     	388403878360	114
184     	649921994715	127
184     	108326062706	141
184     	709229053555	74
184     	508818965558	64
184     	603333456348	51
184     	706236730898	89
184     	568658660566	52
184     	373709485267	99
184     	189470486214	89
184     	702830548447	82
184     	425456990082	139
184     	998040421944	128
184     	103362565865	136
184     	330700905340	82
184     	506298714832	71
184     	419481071217	140
184     	108649313374	146
184     	776538360607	61
184     	982079076090	79
184     	646511826677	116
184     	467615168772	73
184     	384468659793	66
184     	996103067914	100
184     	816260222588	68
184     	836900805029	137
184     	409542246104	56
184     	749193678427	59
184     	528771298719	116
184     	944472664850	76
184     	549746556299	137
184     	113476782830	146
184     	473186595371	106
184     	364745567029	129
184     	732970729968	107
184     	412348931569	69
184     	140903716305	74
184     	567657950596	79
184     	904647940449	76
184     	261188186216	51
184     	692492393712	51
184     	400127531270	150
184     	516286957430	136
184     	948543507361	58
184     	435583017631	97
184     	234646454745	113
184     	486804801433	82
184     	199753522658	101
184     	578147508823	103
184     	534109743798	89
184     	877194198700	56
184     	916984241291	96
184     	207178796787	103
184     	265444172694	76
184     	556388862616	58
184     	134390993040	114
184     	578705048123	145
184     	334074319971	101
184     	786975743876	105
184     	418604295928	51
184     	518787417161	138
185     	816260222588	130
185     	558886167633	77
185     	252522255166	146
185     	919197823026	142
185     	692492393712	83
185     	646511826677	89
185     	643925479319	52
185     	697814031389	134
185     	654563447110	109
185     	210526151030	110
185     	600770885624	64
185     	388403878360	53
185     	547685258313	81
185     	603333456348	87
185     	941976384328	71
185     	636021875565	80
185     	578147508823	89
185     	514254550616	94
185     	108326062706	72
185     	425456990082	145
185     	272121204465	112
185     	563144943925	71
185     	986065693858	122
185     	933914210509	143
185     	765572003296	130
185     	290827207620	75
185     	473186595371	85
185     	176404904473	106
185     	894482053097	129
185     	882152991390	111
185     	986202008726	75
185     	435583017631	60
185     	308792010934	105
185     	771137437634	139
185     	567657950596	120
185     	679453075525	98
185     	261188186216	148
185     	377848719039	148
185     	467615168772	76
185     	334425348148	142
185     	998040421944	141
185     	400930079611	63
185     	118389501460	137
185     	863129185304	139
185     	379942304309	149
185     	529831629045	145
185     	511511692317	101
185     	418604295928	52
185     	373709485267	65
185     	450659382698	88
185     	925484684473	146
185     	516495915668	52
185     	868744054130	122
185     	167742802915	101
185     	945012228482	134
185     	483738463713	104
185     	589814450967	60
185     	527453991710	93
185     	873640709962	112
185     	173672457176	94
185     	154554749200	123
185     	566877828296	60
185     	836900805029	108
185     	108649313374	122
185     	127026679653	94
185     	375276903331	143
185     	875125493289	74
185     	902956788286	87
185     	871701186034	136
185     	168074802141	112
185     	159425007904	89
185     	629919786056	71
185     	786975743876	72
185     	383476286895	149
185     	925173129386	143
185     	297083512852	127
185     	948543507361	109
185     	547244118460	110
185     	205930062465	67
185     	893005812666	149
185     	839518983686	79
185     	833663232208	143
185     	194144382996	58
186     	234646454745	147
186     	572878568883	55
186     	373709485267	90
186     	568658660566	53
186     	875125493289	130
186     	871701186034	137
186     	749625390019	136
186     	389169531271	108
186     	925173129386	97
186     	558886167633	51
186     	868744054130	119
186     	384468659793	113
186     	786975743876	116
186     	536851950801	94
186     	144568875894	124
186     	252522255166	145
186     	294993047536	78
186     	159425007904	100
186     	300475101700	82
186     	986202008726	63
186     	578147508823	107
186     	146051347589	112
186     	414652410482	126
186     	420756960291	53
186     	308792010934	136
186     	297083512852	81
186     	770565227675	111
186     	418604295928	108
186     	364745567029	54
186     	528771298719	121
186     	679453075525	68
186     	227635917829	116
186     	483738463713	136
186     	646511826677	102
186     	490997846898	112
186     	549746556299	149
186     	814141265887	117
186     	167742802915	123
186     	750886611187	142
186     	189470486214	102
186     	518329844939	88
186     	203262278452	140
186     	669515708071	106
186     	776538360607	70
186     	547685258313	64
186     	435583017631	97
186     	962728896848	62
186     	154554749200	142
186     	274761600136	148
186     	805966823208	85
186     	67014520356 	78
186     	882152991390	62
186     	506298714832	108
186     	590034051433	94
186     	250617599940	84
186     	126834215166	119
186     	264132323061	145
186     	698718941817	148
186     	511511692317	122
186     	529831629045	115
186     	400930079611	54
186     	509762284879	144
186     	948543507361	85
186     	696368469198	85
186     	749193678427	73
186     	377848719039	65
186     	702830548447	114
186     	210526151030	134
186     	488529033803	102
186     	384179652400	103
186     	388403878360	131
186     	180531962334	118
186     	589814450967	93
186     	495776106616	58
186     	467986934495	115
186     	176404904473	118
186     	838962966418	101
186     	923237099384	125
186     	400127531270	144
186     	816260222588	97
186     	108649313374	138
186     	317663070530	91
186     	692492393712	82
186     	862174790606	142
186     	630929030795	61
186     	208174494479	78
186     	207178796787	102
186     	482340522139	57
186     	654563447110	72
186     	272121204465	116
186     	336491915536	92
186     	421337093409	60
186     	508818965558	95
186     	828509049873	86
186     	265444172694	126
186     	152614854189	96
186     	873640709962	135
186     	775611741635	68
186     	261188186216	97
187     	718971287692	89
187     	771137437634	124
187     	933914210509	71
187     	227635917829	144
187     	508818965558	128
187     	384468659793	68
187     	877194198700	60
187     	435122760857	117
187     	814141265887	127
187     	334425348148	106
187     	234646454745	65
187     	400930079611	88
187     	529831629045	117
187     	925484684473	114
187     	400127531270	112
187     	863129185304	99
187     	875605607431	83
187     	473186595371	78
187     	836900805029	101
187     	754664511022	108
187     	274761600136	83
187     	603333456348	115
187     	189470486214	141
187     	643925479319	117
187     	203262278452	105
187     	944472664850	93
187     	265444172694	55
187     	894482053097	146
187     	349330324726	138
187     	998040421944	130
187     	486804801433	145
187     	174237001203	77
187     	536851950801	134
187     	514254550616	83
187     	608852371253	76
187     	996103067914	79
187     	334074319971	104
187     	979700065093	116
187     	127026679653	59
187     	450659382698	142
187     	572878568883	82
187     	576518370019	129
187     	838962966418	114
187     	264132323061	83
187     	132186536765	104
187     	261188186216	85
187     	516286957430	71
187     	398900612810	124
187     	134390993040	140
187     	948543507361	114
187     	129753980851	138
187     	139669412174	78
187     	630929030795	81
187     	144568875894	70
187     	986065693858	134
187     	316871031375	86
187     	859109096191	57
187     	412348931569	69
187     	379942304309	121
187     	173672457176	62
187     	862174790606	94
187     	467986934495	52
187     	925173129386	111
187     	882152991390	129
187     	308440276732	140
187     	420756960291	116
187     	317663070530	118
187     	769357296879	55
187     	495776106616	51
187     	126834215166	140
187     	210526151030	117
187     	547685258313	55
187     	549746556299	101
187     	547244118460	72
187     	902956788286	73
187     	952550789390	110
187     	765572003296	150
187     	868744054130	55
187     	457459442332	110
187     	419481071217	113
187     	413227470171	55
187     	312237459250	105
187     	567657950596	135
187     	199968033019	54
187     	916984241291	123
187     	590034051433	124
187     	534109743798	129
187     	421337093409	129
187     	132954606361	52
187     	887528437482	77
187     	740581174440	68
187     	828509049873	79
187     	646511826677	70
187     	945012228482	53
187     	467615168772	116
187     	986202008726	124
187     	419446364450	71
187     	284083366181	61
187     	172950643766	50
187     	108649313374	96
187     	176404904473	62
187     	154554749200	90
187     	381299535788	132
187     	569219762080	55
187     	117431954043	112
187     	506298714832	106
187     	159425007904	89
187     	568658660566	51
187     	246144606961	123
187     	252522255166	108
187     	696368469198	110
187     	488529033803	68
187     	490997846898	51
187     	199753522658	64
187     	636021875565	68
187     	67014520356 	96
187     	482429892907	146
187     	414652410482	107
187     	716818652888	61
187     	839518983686	101
187     	982079076090	109
187     	339589987290	120
187     	618570550236	62
187     	805966823208	50
187     	770565227675	128
187     	893005812666	142
187     	749625390019	67
187     	554521191996	101
187     	578147508823	65
187     	557899454410	83
187     	314482481265	74
187     	873640709962	102
187     	633320411611	119
187     	669515708071	105
187     	294993047536	121
187     	380734371410	127
187     	194144382996	68
187     	523196696835	148
187     	425456990082	111
187     	999543417737	123
187     	330700905340	83
187     	709229053555	128
187     	673737891943	115
187     	600770885624	128
187     	511511692317	66
187     	904647940449	54
188     	982079076090	54
188     	159425007904	79
188     	549746556299	141
188     	706236730898	117
188     	208174494479	76
188     	994411186239	77
188     	877194198700	66
188     	154554749200	119
188     	334425348148	150
188     	814141265887	93
188     	698718941817	94
188     	899657914264	91
188     	660310920540	110
188     	425456990082	86
188     	317663070530	57
188     	702830548447	113
188     	322758894316	144
188     	718971287692	84
188     	786975743876	122
188     	709229053555	64
188     	349435998924	68
188     	508818965558	118
188     	286243122717	115
188     	669515708071	123
188     	132186536765	149
188     	250617599940	99
188     	523196696835	104
188     	630929030795	108
188     	467986934495	97
188     	495776106616	117
188     	473186595371	64
188     	506298714832	116
188     	525199185853	65
188     	187272692439	138
188     	603333456348	67
188     	265444172694	87
188     	948543507361	52
188     	384179652400	113
188     	600770885624	140
188     	103362565865	72
188     	419481071217	88
188     	919197823026	133
188     	750886611187	66
188     	294993047536	87
188     	692492393712	81
188     	732970729968	58
188     	862174790606	94
188     	896919583724	143
188     	308792010934	72
188     	996103067914	137
188     	536851950801	50
188     	140903716305	100
188     	904647940449	99
188     	696368469198	95
188     	979700065093	138
188     	435583017631	121
188     	925484684473	141
188     	646511826677	54
188     	514254550616	55
188     	413227470171	82
188     	144568875894	66
188     	527453991710	115
188     	297083512852	57
188     	839518983686	117
188     	400127531270	60
188     	418604295928	56
188     	176404904473	123
188     	518787417161	95
188     	117431954043	135
188     	578147508823	121
188     	419446364450	132
188     	765572003296	147
188     	770565227675	145
188     	875605607431	104
188     	572878568883	61
188     	516286957430	134
188     	608852371253	64
188     	805966823208	55
188     	411067277447	97
188     	381299535788	85
188     	916984241291	138
188     	740581174440	128
188     	126834215166	149
188     	444797600349	50
188     	859109096191	73
188     	334074319971	74
188     	939369924082	128
188     	246144606961	71
188     	569219762080	66
188     	336491915536	75
188     	868744054130	113
188     	467615168772	107
188     	528771298719	90
188     	388403878360	75
188     	389169531271	67
188     	199968033019	126
188     	518329844939	71
188     	833663232208	102
188     	828509049873	115
188     	749625390019	102
188     	509762284879	74
188     	629919786056	54
188     	274761600136	92
188     	450659382698	50
188     	882152991390	112
188     	775611741635	79
188     	673737891943	127
188     	999543417737	97
188     	383476286895	115
188     	871701186034	119
188     	129753980851	146
188     	113476782830	91
188     	643925479319	116
188     	836900805029	122
188     	210526151030	88
188     	590034051433	144
188     	194144382996	91
188     	207178796787	124
188     	409542246104	72
188     	557899454410	150
188     	722946564026	50
188     	875125493289	139
188     	998040421944	96
188     	986065693858	138
188     	205930062465	105
188     	933914210509	141
188     	803607788754	71
188     	873640709962	145
188     	869112308003	140
188     	490997846898	135
188     	380734371410	66
188     	642234808130	90
188     	849681336901	76
188     	400930079611	79
188     	127026679653	91
188     	384468659793	58
188     	547244118460	133
188     	679453075525	82
188     	962728896848	93
189     	948543507361	61
189     	805966823208	119
189     	490997846898	107
189     	375276903331	66
189     	849681336901	79
189     	339589987290	81
189     	272121204465	93
189     	549746556299	135
189     	349330324726	90
189     	412348931569	102
189     	334425348148	130
189     	146051347589	130
189     	567657950596	60
189     	642234808130	135
189     	380734371410	111
189     	482340522139	116
189     	435122760857	102
189     	250617599940	51
189     	816260222588	92
189     	875605607431	93
189     	859109096191	115
189     	167742802915	140
189     	205930062465	107
189     	945012228482	149
189     	430946284790	67
189     	511511692317	89
189     	127026679653	75
189     	554521191996	99
189     	868744054130	135
189     	578147508823	109
189     	364745567029	54
189     	317663070530	91
189     	129753980851	146
189     	999543417737	52
189     	732970729968	56
189     	994411186239	65
189     	529831629045	76
189     	590034051433	81
189     	488529033803	54
189     	669515708071	121
189     	709229053555	120
189     	862174790606	85
189     	916984241291	70
189     	698718941817	114
189     	863129185304	87
189     	608852371253	96
189     	528771298719	70
189     	776538360607	103
189     	294993047536	91
189     	457459442332	60
189     	234646454745	142
189     	482429892907	62
189     	749625390019	144
189     	786975743876	70
189     	941976384328	148
189     	576518370019	144
189     	527453991710	120
189     	557899454410	93
189     	450659382698	115
189     	702421087613	115
189     	919197823026	60
189     	547685258313	111
189     	349435998924	98
189     	411067277447	109
189     	996103067914	62
189     	875125493289	89
189     	722946564026	112
189     	389169531271	106
189     	508818965558	68
189     	495776106616	140
189     	425456990082	65
189     	979700065093	115
189     	697814031389	110
189     	986202008726	99
189     	377848719039	127
189     	419481071217	107
189     	208174494479	121
189     	117431954043	102
189     	514254550616	57
189     	572878568883	84
189     	297083512852	65
189     	252522255166	136
189     	400930079611	112
189     	600770885624	52
189     	633320411611	135
189     	692492393712	109
189     	473186595371	63
189     	316871031375	52
189     	679453075525	56
189     	483738463713	107
189     	509762284879	67
189     	534109743798	90
189     	673737891943	82
189     	420756960291	66
189     	925173129386	89
189     	525199185853	75
189     	523196696835	104
189     	998040421944	147
189     	902956788286	150
189     	568658660566	120
189     	381299535788	126
189     	770565227675	75
189     	312237459250	126
189     	264132323061	69
189     	749193678427	142
189     	643925479319	116
189     	227635917829	65
189     	636021875565	50
189     	923237099384	129
189     	172950643766	50
189     	629919786056	146
189     	384468659793	128
189     	894482053097	55
189     	603333456348	102
189     	873640709962	84
189     	741544174664	97
189     	261188186216	83
189     	194144382996	103
189     	176404904473	99
189     	187272692439	107
190     	702830548447	79
190     	264132323061	87
190     	904647940449	150
190     	673737891943	120
190     	875605607431	90
190     	646511826677	55
190     	679453075525	86
190     	518787417161	74
190     	377848719039	121
190     	754664511022	80
190     	312237459250	97
190     	330700905340	85
190     	636021875565	76
190     	916984241291	127
190     	172950643766	51
190     	384179652400	89
190     	769357296879	112
190     	129753980851	135
190     	979700065093	58
190     	473186595371	69
190     	180531962334	100
190     	117431954043	116
190     	453357640486	70
190     	514254550616	55
190     	805966823208	53
190     	558886167633	103
190     	375276903331	60
190     	945312847530	89
190     	629919786056	58
190     	547685258313	106
190     	732970729968	114
190     	749193678427	77
190     	300475101700	80
190     	839518983686	120
190     	718971287692	140
190     	569219762080	106
190     	649921994715	76
190     	414652410482	112
190     	803607788754	50
190     	722946564026	138
190     	721857506010	142
190     	986065693858	80
190     	925173129386	143
190     	572878568883	132
190     	400930079611	146
190     	261188186216	90
190     	210526151030	83
190     	286243122717	113
190     	749625390019	68
190     	556388862616	109
190     	529831629045	122
190     	868744054130	88
190     	696368469198	127
190     	568658660566	88
190     	765572003296	110
190     	227635917829	79
190     	833663232208	114
190     	126834215166	82
190     	132954606361	135
190     	566877828296	116
190     	508818965558	79
190     	388403878360	138
190     	836900805029	131
190     	576518370019	142
190     	894482053097	86
190     	944472664850	134
190     	941976384328	102
190     	618570550236	102
190     	488529033803	97
190     	716818652888	99
190     	776538360607	87
190     	152614854189	77
190     	349435998924	60
190     	457459442332	95
190     	692492393712	108
190     	578705048123	76
190     	411067277447	82
190     	775611741635	133
190     	383476286895	141
190     	608852371253	71
190     	495776106616	115
190     	467615168772	81
190     	483738463713	59
190     	998040421944	81
190     	173672457176	148
190     	702421087613	75
190     	816260222588	143
190     	896919583724	149
190     	450659382698	135
190     	139669412174	71
190     	518329844939	139
190     	384468659793	133
190     	265444172694	56
190     	144568875894	139
190     	290827207620	76
190     	962728896848	96
190     	923237099384	58
190     	308792010934	78
190     	549746556299	139
190     	862174790606	80
190     	536851950801	71
190     	528771298719	73
190     	322758894316	69
190     	902956788286	124
190     	379942304309	138
190     	159425007904	131
190     	590034051433	57
190     	859109096191	81
190     	297083512852	60
190     	380734371410	56
190     	435583017631	108
190     	199968033019	125
190     	103362565865	77
190     	317663070530	122
190     	861348595761	81
190     	490997846898	125
190     	642234808130	148
190     	334074319971	65
190     	412348931569	74
190     	140903716305	87
190     	127026679653	64
190     	873640709962	67
190     	118389501460	107
190     	67014520356 	102
190     	849681336901	83
190     	314482481265	99
190     	999543417737	95
190     	600770885624	77
190     	419446364450	66
190     	925484684473	76
190     	316871031375	89
190     	373709485267	149
190     	603333456348	144
190     	194144382996	73
190     	982079076090	112
190     	234646454745	147
190     	557899454410	132
190     	887528437482	52
190     	547244118460	74
190     	250617599940	99
190     	877194198700	110
190     	336491915536	123
190     	418604295928	57
191     	749193678427	61
191     	692492393712	75
191     	566877828296	67
191     	862174790606	125
191     	199753522658	66
191     	568658660566	58
191     	250617599940	94
191     	419446364450	81
191     	389169531271	143
191     	916984241291	126
191     	527453991710	79
191     	132954606361	56
191     	227635917829	115
191     	409542246104	125
191     	836900805029	139
191     	721857506010	115
191     	381299535788	83
191     	698718941817	127
191     	982079076090	102
191     	308440276732	90
191     	994411186239	103
191     	174237001203	95
191     	873640709962	113
191     	473186595371	130
191     	180531962334	139
191     	525199185853	72
191     	117431954043	101
191     	127026679653	55
191     	629919786056	104
191     	887528437482	63
191     	923237099384	53
191     	187272692439	85
191     	863129185304	96
191     	418604295928	65
191     	869112308003	81
191     	741544174664	80
191     	696368469198	101
191     	986065693858	96
191     	349330324726	149
191     	420756960291	118
191     	608852371253	139
191     	547244118460	147
191     	765572003296	122
191     	902956788286	66
191     	482340522139	120
191     	264132323061	123
191     	486804801433	115
191     	113476782830	56
191     	646511826677	113
191     	534109743798	105
191     	189470486214	55
191     	554521191996	149
191     	384179652400	118
191     	290827207620	74
191     	375276903331	77
191     	108649313374	56
192     	534109743798	143
192     	154554749200	121
192     	849681336901	83
192     	572878568883	55
192     	698718941817	86
192     	210526151030	52
192     	176404904473	112
192     	274761600136	146
192     	373709485267	93
192     	435583017631	111
192     	490997846898	117
192     	227635917829	115
192     	129753980851	146
192     	578147508823	129
192     	916984241291	132
192     	716818652888	52
192     	630929030795	148
192     	894482053097	56
192     	527453991710	75
192     	679453075525	113
192     	349435998924	77
192     	939369924082	146
192     	199753522658	101
192     	418604295928	118
192     	265444172694	64
192     	518329844939	52
192     	896919583724	95
192     	189470486214	116
192     	741544174664	127
192     	608852371253	56
192     	838962966418	68
192     	558886167633	87
192     	286243122717	60
192     	144568875894	80
192     	172950643766	138
192     	649921994715	115
192     	322758894316	111
192     	250617599940	59
192     	117431954043	116
192     	998040421944	148
192     	962728896848	113
192     	113476782830	97
192     	264132323061	76
192     	400930079611	110
192     	702421087613	132
192     	486804801433	111
192     	284083366181	88
192     	457459442332	130
192     	982079076090	122
192     	308440276732	88
192     	380734371410	142
192     	863129185304	137
192     	330700905340	94
192     	805966823208	53
192     	925484684473	88
192     	871701186034	54
192     	127026679653	65
192     	518787417161	107
192     	173672457176	71
192     	948543507361	84
192     	919197823026	92
192     	411067277447	112
192     	861348595761	90
192     	945312847530	117
192     	453357640486	146
192     	140903716305	78
192     	749193678427	68
192     	933914210509	141
192     	384179652400	120
193     	765572003296	58
193     	558886167633	57
193     	126834215166	54
193     	208174494479	137
193     	814141265887	80
193     	566877828296	81
193     	636021875565	122
193     	473186595371	86
193     	246144606961	84
193     	805966823208	106
193     	264132323061	69
193     	902956788286	139
193     	941976384328	85
193     	384179652400	67
193     	660310920540	74
193     	669515708071	110
193     	722946564026	88
193     	904647940449	141
193     	567657950596	142
193     	132186536765	71
193     	261188186216	58
193     	308440276732	127
193     	877194198700	56
193     	534109743798	142
193     	140903716305	66
193     	871701186034	90
193     	557899454410	129
193     	646511826677	133
193     	117431954043	106
193     	144568875894	150
193     	467986934495	63
193     	418604295928	85
193     	916984241291	148
193     	349330324726	57
193     	316871031375	116
193     	308792010934	115
193     	568658660566	93
193     	381299535788	113
193     	945012228482	121
193     	435122760857	64
193     	210526151030	59
193     	547685258313	150
193     	986202008726	89
193     	999543417737	101
193     	290827207620	149
193     	578147508823	142
193     	590034051433	131
193     	199968033019	108
193     	67014520356 	130
193     	159425007904	150
193     	919197823026	98
193     	572878568883	105
193     	578705048123	106
193     	994411186239	145
193     	134390993040	127
193     	754664511022	107
193     	168074802141	128
193     	398900612810	146
193     	770565227675	69
193     	741544174664	94
193     	996103067914	141
193     	274761600136	139
193     	379942304309	146
193     	421337093409	132
193     	589814450967	87
193     	250617599940	75
193     	152614854189	64
193     	189470486214	55
193     	297083512852	102
193     	702830548447	144
193     	833663232208	66
193     	556388862616	139
193     	776538360607	71
194     	129753980851	86
194     	132186536765	76
194     	467986934495	101
194     	435583017631	97
194     	108649313374	55
194     	450659382698	68
194     	516495915668	105
194     	527453991710	105
194     	132954606361	104
194     	127026679653	79
194     	952550789390	100
194     	349435998924	89
194     	511511692317	116
194     	629919786056	102
194     	805966823208	59
194     	740581174440	114
194     	556388862616	150
194     	875605607431	124
194     	925173129386	118
194     	875125493289	132
194     	490997846898	123
194     	336491915536	120
194     	314482481265	150
194     	375276903331	77
194     	274761600136	121
194     	838962966418	56
194     	716818652888	79
194     	732970729968	148
194     	316871031375	126
194     	721857506010	117
194     	558886167633	136
194     	941976384328	66
194     	654563447110	60
194     	373709485267	138
194     	312237459250	91
194     	168074802141	71
194     	457459442332	138
194     	483738463713	96
194     	413227470171	139
194     	173672457176	60
194     	986065693858	79
194     	630929030795	91
194     	174237001203	120
194     	996103067914	147
194     	948543507361	89
194     	833663232208	108
194     	140903716305	147
194     	144568875894	53
194     	453357640486	55
194     	871701186034	135
194     	208174494479	106
194     	284083366181	98
194     	506298714832	140
194     	869112308003	88
194     	536851950801	120
194     	108326062706	100
194     	113476782830	57
194     	118389501460	96
194     	994411186239	56
194     	482340522139	76
194     	702830548447	108
194     	203262278452	139
194     	146051347589	145
194     	859109096191	66
194     	482429892907	74
194     	334074319971	114
194     	234646454745	55
194     	754664511022	130
194     	300475101700	137
194     	643925479319	118
194     	816260222588	108
194     	702421087613	115
194     	317663070530	64
194     	199968033019	97
194     	999543417737	100
194     	444797600349	106
194     	636021875565	107
194     	246144606961	54
194     	709229053555	130
195     	152614854189	101
195     	982079076090	149
195     	380734371410	89
195     	642234808130	52
195     	250617599940	138
195     	210526151030	57
195     	506298714832	99
195     	629919786056	70
195     	373709485267	52
195     	140903716305	81
195     	308440276732	136
195     	919197823026	137
195     	702421087613	73
195     	814141265887	101
195     	146051347589	83
195     	290827207620	135
195     	939369924082	114
195     	444797600349	59
195     	113476782830	72
195     	568658660566	127
195     	771137437634	91
195     	265444172694	85
195     	556388862616	110
195     	523196696835	130
195     	264132323061	55
195     	508818965558	74
195     	875605607431	98
195     	450659382698	65
195     	750886611187	59
195     	67014520356 	57
195     	654563447110	119
195     	600770885624	119
195     	536851950801	133
195     	199968033019	147
195     	873640709962	113
195     	412348931569	88
195     	534109743798	146
195     	839518983686	148
195     	578705048123	110
195     	398900612810	131
195     	696368469198	79
195     	384179652400	54
195     	203262278452	107
195     	869112308003	139
195     	702830548447	51
195     	208174494479	132
195     	859109096191	76
195     	706236730898	95
195     	207178796787	119
195     	933914210509	74
195     	483738463713	111
195     	863129185304	107
195     	103362565865	78
195     	899657914264	91
195     	117431954043	68
195     	294993047536	112
195     	334425348148	67
195     	435583017631	125
195     	261188186216	86
195     	176404904473	72
195     	749625390019	101
195     	528771298719	119
195     	473186595371	90
195     	430946284790	67
195     	838962966418	65
195     	770565227675	114
195     	272121204465	123
195     	514254550616	147
195     	227635917829	105
195     	776538360607	68
195     	941976384328	97
195     	364745567029	65
195     	894482053097	61
195     	952550789390	64
195     	511511692317	117
195     	589814450967	141
195     	134390993040	109
195     	284083366181	101
195     	709229053555	86
195     	925173129386	147
195     	916984241291	56
195     	132186536765	57
195     	300475101700	62
195     	488529033803	98
195     	127026679653	69
196     	923237099384	125
196     	334074319971	73
196     	450659382698	77
196     	669515708071	86
196     	134390993040	130
196     	139669412174	146
196     	473186595371	56
196     	180531962334	97
196     	294993047536	139
196     	482429892907	135
196     	776538360607	102
196     	290827207620	65
196     	113476782830	134
196     	982079076090	61
196     	168074802141	120
196     	646511826677	78
196     	336491915536	113
196     	199753522658	71
196     	557899454410	112
196     	339589987290	63
196     	412348931569	85
196     	986065693858	66
196     	419446364450	137
196     	673737891943	142
196     	129753980851	75
196     	274761600136	112
196     	208174494479	113
196     	398900612810	150
196     	741544174664	128
196     	740581174440	68
196     	250617599940	90
196     	696368469198	62
196     	388403878360	84
196     	227635917829	94
196     	414652410482	99
196     	698718941817	73
196     	297083512852	63
196     	702830548447	79
196     	549746556299	78
196     	418604295928	104
196     	862174790606	88
196     	887528437482	57
196     	754664511022	144
196     	364745567029	142
196     	308792010934	136
196     	945012228482	105
196     	849681336901	102
196     	590034051433	142
196     	108326062706	51
196     	246144606961	132
196     	979700065093	72
196     	383476286895	87
196     	349330324726	78
196     	933914210509	103
196     	506298714832	118
196     	925484684473	58
196     	284083366181	150
196     	265444172694	131
196     	467615168772	87
196     	996103067914	53
196     	529831629045	108
196     	444797600349	133
196     	643925479319	125
196     	330700905340	135
196     	308440276732	65
196     	875605607431	105
196     	518787417161	98
196     	117431954043	67
196     	833663232208	74
196     	952550789390	61
196     	749625390019	142
196     	679453075525	114
196     	511511692317	130
196     	769357296879	107
196     	569219762080	94
196     	516495915668	97
196     	375276903331	96
196     	873640709962	103
196     	877194198700	70
196     	563144943925	88
196     	629919786056	142
196     	603333456348	70
196     	692492393712	87
196     	945312847530	104
196     	322758894316	103
196     	379942304309	85
196     	421337093409	127
196     	312237459250	135
196     	618570550236	119
196     	948543507361	74
196     	706236730898	109
196     	868744054130	134
196     	380734371410	125
196     	172950643766	95
196     	264132323061	91
196     	839518983686	53
196     	805966823208	85
196     	896919583724	146
196     	998040421944	85
196     	457459442332	128
196     	252522255166	82
196     	554521191996	114
196     	381299535788	72
196     	488529033803	149
196     	608852371253	70
196     	203262278452	61
196     	630929030795	94
196     	176404904473	96
196     	660310920540	68
196     	518329844939	116
196     	419481071217	72
196     	547244118460	113
196     	528771298719	133
196     	514254550616	137
196     	999543417737	149
196     	118389501460	123
196     	103362565865	71
196     	286243122717	142
196     	576518370019	120
196     	941976384328	87
196     	962728896848	86
196     	146051347589	53
196     	944472664850	83
196     	67014520356 	102
196     	205930062465	133
196     	863129185304	132
196     	400127531270	67
196     	654563447110	140
196     	409542246104	139
196     	272121204465	53
196     	400930079611	70
196     	523196696835	56
196     	420756960291	59
196     	871701186034	57
196     	702421087613	97
196     	349435998924	106
196     	558886167633	88
196     	373709485267	59
196     	589814450967	79
196     	207178796787	60
196     	649921994715	60
196     	836900805029	116
196     	140903716305	84
196     	859109096191	92
196     	334425348148	75
196     	925173129386	64
196     	435583017631	148
197     	400930079611	100
197     	383476286895	120
197     	805966823208	52
197     	490997846898	71
197     	838962966418	148
197     	861348595761	141
197     	557899454410	61
197     	775611741635	102
197     	996103067914	82
197     	207178796787	104
197     	765572003296	110
197     	833663232208	112
197     	660310920540	95
197     	871701186034	86
197     	952550789390	98
197     	172950643766	79
197     	636021875565	147
197     	525199185853	52
197     	986202008726	128
197     	986065693858	140
197     	999543417737	86
197     	904647940449	98
197     	435583017631	56
197     	495776106616	116
197     	558886167633	148
197     	411067277447	145
197     	868744054130	93
197     	381299535788	96
197     	176404904473	80
197     	741544174664	78
197     	380734371410	138
197     	721857506010	103
197     	887528437482	69
197     	769357296879	54
197     	194144382996	135
197     	576518370019	115
197     	199968033019	109
197     	488529033803	50
197     	998040421944	121
197     	603333456348	51
197     	698718941817	128
197     	770565227675	61
197     	722946564026	66
197     	572878568883	89
197     	849681336901	74
197     	529831629045	117
197     	673737891943	96
197     	199753522658	132
197     	252522255166	72
197     	786975743876	82
197     	322758894316	63
197     	516495915668	111
197     	692492393712	99
197     	413227470171	124
197     	414652410482	62
197     	518787417161	101
197     	308440276732	59
197     	154554749200	116
197     	894482053097	109
197     	312237459250	113
197     	933914210509	128
197     	167742802915	116
197     	547244118460	94
197     	732970729968	106
197     	284083366181	91
197     	608852371253	72
197     	334074319971	129
197     	718971287692	146
197     	173672457176	107
197     	875125493289	56
197     	633320411611	89
197     	384179652400	90
197     	375276903331	126
197     	893005812666	145
197     	750886611187	103
197     	896919583724	129
197     	420756960291	51
197     	839518983686	56
197     	146051347589	143
197     	400127531270	88
197     	994411186239	56
197     	419446364450	68
197     	925484684473	54
197     	300475101700	81
197     	925173129386	122
197     	364745567029	68
197     	203262278452	134
197     	246144606961	90
197     	418604295928	101
197     	210526151030	60
197     	330700905340	137
197     	669515708071	64
197     	234646454745	139
197     	740581174440	109
197     	486804801433	66
197     	902956788286	118
197     	514254550616	88
197     	754664511022	116
197     	945012228482	68
197     	642234808130	125
197     	511511692317	82
197     	814141265887	124
197     	630929030795	137
197     	294993047536	143
197     	979700065093	145
197     	389169531271	134
197     	409542246104	73
197     	152614854189	97
198     	861348595761	75
198     	194144382996	129
198     	749625390019	95
198     	944472664850	93
198     	203262278452	146
198     	698718941817	103
198     	444797600349	130
198     	339589987290	74
198     	199753522658	143
198     	873640709962	88
198     	421337093409	115
198     	511511692317	134
198     	118389501460	148
198     	962728896848	66
198     	578705048123	90
198     	849681336901	111
198     	986202008726	110
198     	172950643766	96
198     	816260222588	67
198     	103362565865	113
198     	418604295928	87
198     	828509049873	70
198     	692492393712	139
198     	869112308003	67
198     	425456990082	123
198     	294993047536	84
198     	261188186216	89
198     	887528437482	143
198     	923237099384	79
198     	754664511022	133
198     	741544174664	114
198     	174237001203	115
198     	569219762080	55
198     	400930079611	103
198     	400127531270	55
198     	732970729968	139
198     	939369924082	80
198     	697814031389	70
198     	654563447110	77
198     	554521191996	131
198     	336491915536	105
198     	286243122717	65
198     	696368469198	96
198     	264132323061	108
198     	896919583724	112
198     	316871031375	141
198     	643925479319	92
198     	839518983686	139
198     	383476286895	142
198     	859109096191	106
198     	771137437634	133
198     	527453991710	51
198     	933914210509	81
198     	409542246104	57
198     	952550789390	119
198     	534109743798	113
198     	636021875565	113
198     	986065693858	127
198     	514254550616	100
198     	603333456348	115
198     	129753980851	134
198     	67014520356 	115
198     	706236730898	120
198     	568658660566	125
198     	547244118460	139
198     	776538360607	118
198     	814141265887	147
198     	272121204465	110
198     	805966823208	99
198     	297083512852	65
198     	284083366181	85
198     	916984241291	134
198     	167742802915	72
198     	132954606361	65
198     	576518370019	60
198     	509762284879	85
198     	482429892907	68
198     	349330324726	94
198     	314482481265	132
198     	549746556299	80
198     	718971287692	76
198     	868744054130	133
198     	227635917829	62
198     	334425348148	102
198     	312237459250	56
198     	660310920540	150
198     	600770885624	92
198     	572878568883	118
198     	435583017631	140
198     	996103067914	64
198     	265444172694	143
198     	893005812666	70
198     	252522255166	110
198     	467986934495	80
198     	722946564026	98
198     	322758894316	130
198     	558886167633	76
198     	740581174440	88
198     	364745567029	109
198     	488529033803	131
198     	127026679653	90
198     	208174494479	114
198     	308440276732	149
198     	349435998924	74
198     	482340522139	145
198     	894482053097	69
198     	435122760857	102
198     	716818652888	150
198     	673737891943	132
198     	457459442332	96
198     	998040421944	107
198     	902956788286	53
198     	176404904473	82
198     	589814450967	89
198     	420756960291	98
198     	904647940449	50
198     	486804801433	54
198     	375276903331	95
198     	630929030795	112
198     	679453075525	112
198     	398900612810	103
198     	566877828296	90
198     	838962966418	149
198     	769357296879	61
198     	941976384328	55
198     	518787417161	102
198     	140903716305	52
198     	875605607431	142
198     	317663070530	65
198     	388403878360	145
199     	572878568883	91
199     	113476782830	66
199     	896919583724	116
199     	430946284790	118
199     	117431954043	83
199     	495776106616	65
199     	642234808130	77
199     	925173129386	137
199     	144568875894	85
199     	118389501460	140
199     	698718941817	139
199     	334074319971	150
199     	547685258313	88
199     	643925479319	90
199     	203262278452	68
199     	207178796787	95
199     	400127531270	124
199     	933914210509	114
199     	557899454410	123
199     	660310920540	98
199     	859109096191	69
199     	425456990082	85
199     	862174790606	126
199     	873640709962	126
199     	154554749200	136
199     	129753980851	96
199     	511511692317	116
199     	312237459250	89
199     	869112308003	135
199     	706236730898	71
199     	776538360607	143
199     	330700905340	57
199     	261188186216	141
199     	400930079611	129
199     	199968033019	97
199     	308440276732	149
199     	419481071217	60
199     	384468659793	99
199     	389169531271	135
199     	508818965558	67
199     	409542246104	90
199     	996103067914	50
199     	189470486214	79
199     	833663232208	105
199     	549746556299	87
199     	786975743876	70
199     	986065693858	51
199     	567657950596	59
199     	750886611187	132
199     	172950643766	60
199     	140903716305	89
199     	375276903331	142
199     	518329844939	124
199     	168074802141	103
199     	986202008726	104
199     	297083512852	129
199     	805966823208	127
199     	749193678427	150
199     	944472664850	88
199     	234646454745	116
199     	948543507361	145
199     	771137437634	150
199     	923237099384	107
199     	899657914264	95
199     	839518983686	60
199     	380734371410	135
199     	518787417161	117
199     	450659382698	129
199     	199753522658	147
199     	294993047536	99
199     	692492393712	103
199     	939369924082	83
199     	702830548447	93
199     	349330324726	50
199     	453357640486	109
199     	529831629045	134
199     	227635917829	143
199     	999543417737	84
199     	669515708071	132
199     	875125493289	65
199     	272121204465	120
199     	749625390019	110
199     	979700065093	50
199     	473186595371	90
199     	882152991390	125
199     	861348595761	89
199     	769357296879	53
199     	828509049873	148
199     	941976384328	123
199     	506298714832	69
199     	67014520356 	66
199     	418604295928	65
199     	421337093409	140
199     	998040421944	102
199     	103362565865	115
199     	412348931569	76
199     	536851950801	60
199     	134390993040	70
199     	894482053097	118
199     	486804801433	139
199     	316871031375	56
199     	945312847530	123
199     	554521191996	77
199     	600770885624	60
199     	732970729968	69
199     	132186536765	51
199     	849681336901	102
199     	569219762080	120
199     	264132323061	98
199     	420756960291	111
199     	863129185304	119
199     	444797600349	79
199     	286243122717	100
199     	246144606961	97
199     	167742802915	133
199     	413227470171	148
199     	566877828296	118
199     	696368469198	129
199     	314482481265	56
199     	205930062465	84
199     	252522255166	136
199     	457459442332	85
199     	284083366181	60
200     	67014520356 	112
200     	339589987290	50
200     	528771298719	66
200     	419481071217	114
200     	250617599940	134
200     	419446364450	74
200     	816260222588	110
200     	771137437634	72
200     	400930079611	68
200     	994411186239	70
200     	199753522658	52
200     	786975743876	112
200     	314482481265	107
200     	982079076090	83
200     	383476286895	136
200     	556388862616	94
200     	923237099384	86
200     	297083512852	120
200     	919197823026	96
200     	473186595371	73
200     	180531962334	117
200     	600770885624	145
200     	234646454745	62
200     	486804801433	99
200     	509762284879	116
200     	154554749200	69
200     	117431954043	59
200     	420756960291	141
200     	836900805029	50
200     	132954606361	122
200     	862174790606	101
200     	529831629045	113
200     	557899454410	142
200     	578705048123	115
200     	384179652400	78
200     	227635917829	63
200     	567657950596	98
200     	336491915536	71
200     	490997846898	128
200     	375276903331	75
200     	643925479319	55
200     	590034051433	80
200     	828509049873	128
200     	187272692439	144
200     	467986934495	103
200     	272121204465	141
200     	118389501460	146
200     	103362565865	113
200     	322758894316	136
200     	173672457176	143
200     	805966823208	96
200     	722946564026	99
200     	453357640486	56
200     	718971287692	142
200     	108326062706	102
200     	508818965558	85
200     	925484684473	139
200     	349330324726	58
200     	411067277447	100
200     	814141265887	147
200     	608852371253	133
200     	400127531270	137
200     	126834215166	123
200     	986065693858	76
200     	706236730898	76
200     	838962966418	104
200     	925173129386	120
200     	413227470171	139
200     	576518370019	61
200     	769357296879	102
200     	630929030795	107
201     	118389501460	80
201     	334425348148	102
201     	488529033803	84
201     	208174494479	70
201     	167742802915	142
201     	741544174664	88
201     	669515708071	57
201     	849681336901	90
201     	450659382698	114
201     	509762284879	90
201     	174237001203	52
201     	467615168772	82
201     	246144606961	134
201     	272121204465	138
201     	514254550616	142
201     	740581174440	125
201     	205930062465	126
201     	339589987290	63
201     	398900612810	69
201     	925173129386	65
201     	836900805029	69
201     	749193678427	52
201     	317663070530	117
201     	418604295928	75
201     	529831629045	115
201     	508818965558	139
201     	430946284790	74
201     	649921994715	60
201     	775611741635	52
201     	894482053097	98
201     	916984241291	54
201     	952550789390	131
201     	945012228482	109
201     	375276903331	103
201     	411067277447	135
201     	871701186034	58
201     	557899454410	128
201     	132954606361	144
201     	389169531271	135
201     	516286957430	136
201     	654563447110	103
201     	336491915536	139
201     	776538360607	94
201     	722946564026	62
201     	265444172694	129
201     	882152991390	106
201     	868744054130	123
201     	490997846898	78
201     	536851950801	84
201     	873640709962	117
201     	511511692317	138
201     	473186595371	64
201     	108649313374	101
201     	875125493289	116
201     	294993047536	134
201     	556388862616	91
201     	409542246104	105
201     	861348595761	102
201     	839518983686	100
201     	979700065093	107
201     	400127531270	74
201     	252522255166	62
201     	384468659793	85
201     	187272692439	108
201     	421337093409	131
201     	547244118460	86
201     	754664511022	83
201     	696368469198	89
201     	290827207620	54
201     	534109743798	138
201     	103362565865	104
201     	377848719039	139
201     	330700905340	139
201     	887528437482	90
201     	805966823208	147
201     	549746556299	131
201     	578147508823	131
201     	904647940449	149
201     	769357296879	62
201     	554521191996	134
201     	144568875894	73
201     	698718941817	66
201     	199968033019	82
201     	673737891943	55
201     	518787417161	133
201     	486804801433	102
201     	308440276732	65
201     	944472664850	111
201     	199753522658	143
201     	525199185853	103
201     	250617599940	93
201     	264132323061	63
201     	516495915668	137
201     	709229053555	145
201     	108326062706	112
201     	716818652888	136
201     	152614854189	135
201     	765572003296	144
201     	506298714832	110
201     	126834215166	130
201     	998040421944	76
201     	589814450967	50
201     	814141265887	82
201     	180531962334	109
201     	482340522139	66
201     	117431954043	76
201     	129753980851	90
202     	490997846898	109
202     	702421087613	136
202     	600770885624	72
202     	925484684473	92
202     	300475101700	115
202     	765572003296	72
202     	414652410482	80
202     	482429892907	115
202     	421337093409	135
202     	986202008726	146
202     	803607788754	141
202     	563144943925	106
202     	483738463713	119
202     	203262278452	134
202     	590034051433	60
202     	495776106616	88
202     	982079076090	130
202     	132186536765	78
202     	467615168772	75
202     	364745567029	68
202     	902956788286	150
202     	308792010934	117
202     	706236730898	92
202     	944472664850	91
202     	139669412174	95
202     	514254550616	61
202     	816260222588	107
202     	134390993040	104
202     	576518370019	54
202     	205930062465	147
202     	679453075525	71
202     	176404904473	137
202     	536851950801	105
202     	159425007904	85
202     	383476286895	64
202     	996103067914	139
202     	994411186239	97
202     	154554749200	126
202     	316871031375	74
202     	398900612810	90
202     	999543417737	91
202     	786975743876	69
202     	567657950596	113
202     	775611741635	114
202     	923237099384	131
202     	754664511022	124
202     	108326062706	142
202     	769357296879	119
202     	444797600349	108
202     	265444172694	71
202     	941976384328	50
202     	380734371410	94
202     	388403878360	125
202     	411067277447	115
202     	67014520356 	107
202     	508818965558	125
203     	741544174664	78
203     	608852371253	110
203     	557899454410	121
203     	473186595371	131
203     	534109743798	135
203     	227635917829	83
203     	336491915536	89
203     	383476286895	74
203     	208174494479	122
203     	618570550236	59
203     	944472664850	74
203     	948543507361	122
203     	732970729968	145
203     	509762284879	58
203     	814141265887	112
203     	252522255166	125
203     	786975743876	55
203     	754664511022	57
203     	673737891943	54
203     	765572003296	76
203     	547685258313	150
203     	67014520356 	147
203     	643925479319	92
203     	998040421944	76
203     	297083512852	145
203     	933914210509	88
203     	862174790606	117
203     	887528437482	111
203     	839518983686	92
203     	187272692439	109
203     	174237001203	103
203     	506298714832	133
203     	430946284790	134
203     	349435998924	145
203     	919197823026	107
203     	696368469198	143
203     	566877828296	104
203     	409542246104	94
203     	716818652888	60
203     	308440276732	58
203     	117431954043	116
203     	250617599940	99
203     	589814450967	88
203     	334074319971	117
203     	925484684473	106
203     	603333456348	71
203     	718971287692	62
203     	316871031375	99
203     	450659382698	115
203     	140903716305	77
203     	482340522139	82
203     	877194198700	107
203     	896919583724	97
203     	899657914264	53
203     	679453075525	141
203     	205930062465	138
203     	630929030795	135
203     	152614854189	83
203     	569219762080	125
203     	486804801433	67
203     	146051347589	56
203     	159425007904	132
203     	536851950801	60
203     	629919786056	60
203     	925173129386	95
203     	775611741635	79
203     	549746556299	90
203     	132954606361	114
203     	945312847530	97
203     	414652410482	136
203     	108326062706	57
203     	525199185853	59
203     	523196696835	63
203     	750886611187	141
203     	118389501460	136
203     	669515708071	149
203     	272121204465	83
203     	692492393712	125
203     	572878568883	64
203     	435122760857	98
204     	384179652400	118
204     	108326062706	117
204     	803607788754	119
204     	649921994715	95
204     	696368469198	77
204     	646511826677	58
204     	702830548447	59
204     	336491915536	114
204     	896919583724	75
204     	643925479319	131
204     	944472664850	150
204     	103362565865	80
204     	814141265887	78
204     	608852371253	104
204     	698718941817	65
204     	317663070530	59
204     	518787417161	77
204     	308792010934	86
204     	775611741635	95
204     	113476782830	65
204     	576518370019	72
204     	414652410482	124
204     	495776106616	53
204     	523196696835	120
204     	600770885624	59
204     	388403878360	115
204     	642234808130	51
204     	547685258313	83
204     	979700065093	50
204     	945012228482	118
204     	389169531271	73
204     	952550789390	92
204     	486804801433	50
204     	563144943925	68
204     	457459442332	95
204     	250617599940	104
204     	828509049873	108
204     	836900805029	57
204     	483738463713	120
204     	373709485267	87
204     	420756960291	131
204     	330700905340	85
204     	272121204465	108
204     	199968033019	117
204     	514254550616	132
204     	618570550236	65
204     	660310920540	106
204     	547244118460	52
204     	899657914264	58
204     	771137437634	97
204     	400930079611	84
204     	722946564026	67
204     	274761600136	112
204     	144568875894	59
204     	945312847530	92
205     	770565227675	115
205     	518787417161	74
205     	732970729968	103
205     	154554749200	77
205     	172950643766	149
205     	419481071217	86
205     	473186595371	90
205     	816260222588	55
205     	941976384328	148
205     	590034051433	126
205     	388403878360	65
205     	134390993040	150
205     	264132323061	102
205     	418604295928	111
205     	349330324726	106
205     	698718941817	129
205     	176404904473	99
205     	139669412174	74
205     	297083512852	116
205     	144568875894	99
205     	127026679653	148
205     	103362565865	147
205     	203262278452	92
205     	199753522658	125
205     	453357640486	55
205     	887528437482	119
205     	952550789390	145
205     	979700065093	111
205     	450659382698	91
205     	649921994715	144
205     	875125493289	52
205     	435583017631	50
205     	836900805029	136
205     	308440276732	88
205     	945012228482	52
205     	933914210509	103
205     	129753980851	62
205     	412348931569	110
205     	490997846898	125
205     	180531962334	58
205     	383476286895	58
205     	948543507361	89
205     	413227470171	74
205     	227635917829	77
205     	679453075525	73
205     	126834215166	92
205     	444797600349	110
205     	132186536765	85
205     	118389501460	72
205     	516286957430	136
205     	234646454745	121
205     	839518983686	116
205     	996103067914	120
205     	375276903331	55
205     	205930062465	76
205     	379942304309	106
205     	159425007904	71
205     	636021875565	90
205     	776538360607	59
205     	849681336901	116
205     	400930079611	80
205     	643925479319	55
205     	557899454410	101
205     	316871031375	60
205     	210526151030	140
205     	828509049873	84
205     	483738463713	66
205     	944472664850	93
205     	246144606961	132
205     	290827207620	76
205     	261188186216	128
206     	608852371253	82
206     	364745567029	64
206     	528771298719	98
206     	482340522139	139
206     	861348595761	140
206     	334074319971	122
206     	483738463713	81
206     	146051347589	62
206     	775611741635	123
206     	199753522658	76
206     	722946564026	80
206     	839518983686	122
206     	412348931569	116
206     	646511826677	146
206     	286243122717	63
206     	473186595371	63
206     	523196696835	97
206     	261188186216	68
206     	979700065093	135
206     	776538360607	54
206     	566877828296	107
206     	246144606961	131
206     	849681336901	85
206     	210526151030	137
206     	578705048123	110
206     	272121204465	68
206     	925173129386	130
206     	863129185304	119
206     	435122760857	93
206     	630929030795	87
206     	996103067914	81
206     	264132323061	53
206     	518787417161	97
206     	227635917829	135
206     	152614854189	146
206     	308792010934	62
206     	322758894316	117
206     	527453991710	143
206     	189470486214	80
206     	994411186239	123
206     	803607788754	69
206     	554521191996	138
206     	234646454745	144
206     	467615168772	141
206     	525199185853	142
206     	887528437482	108
206     	172950643766	106
206     	875605607431	84
206     	859109096191	96
206     	300475101700	64
206     	103362565865	98
206     	334425348148	115
206     	495776106616	109
206     	118389501460	139
206     	629919786056	80
206     	420756960291	51
206     	383476286895	97
206     	636021875565	63
206     	159425007904	57
206     	904647940449	61
206     	126834215166	85
206     	568658660566	82
206     	749625390019	126
206     	816260222588	53
206     	572878568883	145
206     	380734371410	95
206     	375276903331	52
206     	770565227675	63
206     	923237099384	138
206     	679453075525	90
206     	873640709962	83
206     	805966823208	59
206     	721857506010	124
206     	869112308003	140
206     	643925479319	136
206     	187272692439	145
206     	740581174440	82
206     	786975743876	115
206     	127026679653	76
206     	933914210509	110
206     	450659382698	61
206     	919197823026	69
206     	384468659793	115
206     	877194198700	87
206     	290827207620	135
206     	696368469198	139
206     	702830548447	115
206     	838962966418	96
207     	284083366181	107
207     	869112308003	109
207     	199968033019	79
207     	765572003296	114
207     	919197823026	106
207     	297083512852	129
207     	775611741635	112
207     	180531962334	146
207     	722946564026	56
207     	534109743798	50
207     	873640709962	130
207     	986202008726	55
207     	490997846898	138
207     	979700065093	76
207     	383476286895	65
207     	294993047536	131
207     	205930062465	109
207     	556388862616	111
207     	518329844939	81
207     	129753980851	89
207     	803607788754	104
207     	409542246104	81
207     	495776106616	102
207     	252522255166	51
207     	146051347589	94
207     	986065693858	125
207     	649921994715	83
207     	349435998924	52
207     	887528437482	91
207     	776538360607	63
207     	264132323061	108
207     	435122760857	141
207     	563144943925	123
207     	527453991710	74
207     	375276903331	102
207     	411067277447	131
207     	944472664850	145
207     	308440276732	78
207     	696368469198	144
207     	861348595761	146
207     	430946284790	120
207     	272121204465	92
207     	317663070530	61
207     	569219762080	95
207     	893005812666	96
207     	896919583724	133
207     	67014520356 	101
207     	400127531270	125
207     	923237099384	145
207     	444797600349	118
207     	154554749200	141
207     	514254550616	136
207     	168074802141	90
207     	488529033803	136
207     	673737891943	97
207     	882152991390	139
207     	654563447110	79
207     	566877828296	123
207     	453357640486	104
207     	194144382996	146
207     	389169531271	122
207     	589814450967	147
207     	771137437634	60
207     	199753522658	98
207     	945312847530	90
207     	450659382698	71
207     	103362565865	64
207     	838962966418	72
207     	998040421944	79
207     	839518983686	76
207     	741544174664	51
208     	869112308003	83
208     	871701186034	98
208     	264132323061	115
208     	234646454745	141
208     	419481071217	99
208     	776538360607	134
208     	996103067914	50
208     	547685258313	65
208     	722946564026	137
208     	419446364450	146
208     	896919583724	54
208     	529831629045	144
208     	308792010934	101
208     	252522255166	57
208     	168074802141	65
208     	398900612810	78
208     	199968033019	62
208     	923237099384	100
208     	308440276732	79
208     	556388862616	98
208     	608852371253	111
208     	139669412174	55
208     	696368469198	131
208     	284083366181	84
208     	882152991390	96
208     	207178796787	100
208     	314482481265	111
208     	173672457176	115
208     	697814031389	60
208     	567657950596	129
208     	334074319971	87
208     	117431954043	95
208     	557899454410	96
208     	286243122717	70
208     	861348595761	97
208     	654563447110	59
208     	450659382698	131
208     	523196696835	61
208     	569219762080	82
208     	998040421944	110
208     	473186595371	56
208     	144568875894	90
208     	902956788286	149
208     	118389501460	145
208     	167742802915	150
208     	836900805029	146
208     	159425007904	101
208     	862174790606	141
208     	754664511022	117
208     	839518983686	72
208     	518329844939	135
208     	132954606361	138
208     	887528437482	52
208     	373709485267	143
208     	330700905340	84
208     	716818652888	58
208     	741544174664	113
208     	566877828296	90
208     	838962966418	70
208     	453357640486	88
208     	389169531271	82
208     	421337093409	110
208     	400930079611	113
208     	770565227675	81
208     	893005812666	78
208     	381299535788	90
208     	941976384328	131
208     	698718941817	113
208     	261188186216	128
208     	435583017631	145
208     	962728896848	117
208     	187272692439	60
208     	749625390019	53
208     	740581174440	104
208     	108649313374	96
208     	673737891943	120
208     	833663232208	80
208     	482340522139	96
208     	547244118460	132
208     	919197823026	114
208     	706236730898	53
208     	534109743798	51
208     	154554749200	94
208     	527453991710	144
208     	379942304309	125
209     	608852371253	112
209     	572878568883	70
209     	776538360607	120
209     	265444172694	76
209     	172950643766	136
209     	108649313374	125
209     	511511692317	132
209     	430946284790	97
209     	536851950801	110
209     	716818652888	74
209     	132186536765	59
209     	567657950596	102
209     	506298714832	113
209     	527453991710	120
209     	126834215166	116
209     	525199185853	80
209     	400127531270	113
209     	435583017631	146
209     	518787417161	76
209     	297083512852	117
209     	945012228482	80
209     	697814031389	130
209     	168074802141	56
209     	775611741635	110
209     	272121204465	82
209     	516286957430	82
209     	649921994715	59
209     	629919786056	91
209     	174237001203	91
209     	316871031375	137
209     	252522255166	118
209     	887528437482	79
209     	534109743798	119
209     	380734371410	71
209     	384468659793	85
209     	377848719039	68
209     	952550789390	103
209     	349330324726	102
209     	312237459250	88
209     	945312847530	129
209     	828509049873	145
209     	334425348148	131
209     	411067277447	91
209     	308792010934	106
209     	154554749200	117
209     	893005812666	89
209     	875125493289	150
209     	210526151030	77
209     	290827207620	107
209     	139669412174	118
209     	127026679653	136
209     	894482053097	147
209     	205930062465	92
209     	999543417737	136
209     	679453075525	72
209     	740581174440	127
209     	375276903331	80
209     	176404904473	63
209     	948543507361	74
209     	709229053555	125
209     	486804801433	59
209     	873640709962	123
209     	754664511022	105
209     	589814450967	124
209     	986202008726	132
209     	421337093409	141
209     	398900612810	124
209     	654563447110	114
209     	444797600349	86
209     	875605607431	94
209     	979700065093	112
209     	994411186239	75
209     	419481071217	83
209     	902956788286	130
209     	547244118460	56
209     	467986934495	65
209     	558886167633	70
209     	482429892907	128
209     	482340522139	112
209     	140903716305	122
209     	803607788754	132
209     	134390993040	132
209     	646511826677	64
209     	833663232208	120
209     	590034051433	149
209     	933914210509	137
209     	349435998924	92
209     	523196696835	68
209     	814141265887	106
209     	207178796787	90
209     	868744054130	147
209     	314482481265	58
209     	805966823208	87
209     	916984241291	119
209     	578147508823	66
209     	383476286895	54
209     	203262278452	60
209     	630929030795	90
209     	786975743876	105
209     	379942304309	114
209     	108326062706	137
209     	118389501460	105
209     	600770885624	103
209     	453357640486	117
209     	633320411611	112
209     	706236730898	108
209     	862174790606	67
209     	996103067914	99
209     	490997846898	135
209     	554521191996	129
209     	152614854189	75
209     	117431954043	123
209     	334074319971	143
209     	603333456348	90
209     	264132323061	134
209     	294993047536	98
209     	412348931569	133
209     	702830548447	127
209     	488529033803	53
209     	129753980851	76
209     	859109096191	108
209     	702421087613	92
209     	939369924082	69
209     	435122760857	57
209     	569219762080	137
209     	732970729968	73
209     	769357296879	120
209     	816260222588	117
209     	199968033019	145
209     	234646454745	136
210     	630929030795	57
210     	600770885624	70
210     	506298714832	118
210     	875125493289	138
210     	349435998924	71
210     	172950643766	73
210     	518329844939	63
210     	312237459250	50
210     	108326062706	119
210     	749193678427	92
210     	709229053555	92
210     	414652410482	59
210     	572878568883	117
210     	557899454410	124
210     	566877828296	76
210     	435122760857	102
210     	113476782830	94
210     	660310920540	103
210     	483738463713	104
210     	718971287692	92
210     	430946284790	147
210     	349330324726	53
210     	939369924082	122
210     	776538360607	119
210     	117431954043	64
210     	509762284879	52
210     	941976384328	67
210     	473186595371	125
210     	721857506010	59
210     	421337093409	135
210     	569219762080	138
210     	750886611187	116
210     	398900612810	123
210     	511511692317	134
210     	558886167633	113
210     	286243122717	91
210     	654563447110	145
210     	118389501460	87
210     	769357296879	67
210     	314482481265	82
210     	679453075525	64
210     	740581174440	132
210     	754664511022	99
210     	786975743876	82
210     	862174790606	95
210     	373709485267	101
210     	875605607431	55
210     	518787417161	63
210     	400127531270	85
210     	998040421944	136
210     	869112308003	114
210     	419446364450	130
210     	925484684473	82
210     	529831629045	52
210     	334425348148	65
210     	816260222588	126
210     	563144943925	69
210     	589814450967	83
210     	549746556299	79
210     	902956788286	71
210     	952550789390	132
210     	384468659793	103
210     	444797600349	55
210     	859109096191	147
210     	450659382698	109
210     	994411186239	150
210     	272121204465	64
210     	673737891943	58
210     	199753522658	138
210     	578147508823	124
210     	722946564026	90
210     	380734371410	122
210     	199968033019	102
210     	643925479319	122
210     	152614854189	150
210     	871701186034	70
210     	805966823208	129
210     	923237099384	91
210     	567657950596	92
210     	576518370019	62
210     	308440276732	103
210     	132186536765	68
210     	384179652400	130
210     	534109743798	120
210     	146051347589	107
210     	873640709962	101
210     	732970729968	88
210     	265444172694	148
210     	317663070530	84
210     	861348595761	73
210     	547685258313	108
210     	996103067914	137
210     	877194198700	134
210     	180531962334	55
210     	425456990082	67
210     	435583017631	110
210     	833663232208	92
210     	999543417737	59
210     	322758894316	104
210     	896919583724	101
210     	411067277447	131
210     	618570550236	72
210     	290827207620	88
210     	375276903331	102
210     	330700905340	85
210     	590034051433	56
210     	836900805029	89
210     	134390993040	97
210     	982079076090	60
210     	207178796787	116
210     	765572003296	112
210     	400930079611	129
210     	419481071217	118
210     	208174494479	79
210     	887528437482	66
210     	294993047536	149
210     	775611741635	87
210     	919197823026	96
210     	770565227675	126
210     	250617599940	111
210     	933914210509	138
210     	828509049873	92
211     	467615168772	125
211     	482429892907	59
211     	916984241291	51
211     	349435998924	122
211     	944472664850	53
211     	894482053097	86
211     	941976384328	116
211     	732970729968	95
211     	721857506010	133
211     	673737891943	147
211     	334425348148	56
211     	129753980851	71
211     	234646454745	123
211     	435583017631	115
211     	414652410482	115
211     	412348931569	86
211     	167742802915	86
211     	199968033019	110
211     	547244118460	73
211     	882152991390	100
211     	775611741635	137
211     	982079076090	53
211     	495776106616	89
211     	154554749200	75
211     	286243122717	110
211     	702830548447	113
211     	589814450967	113
211     	839518983686	69
211     	509762284879	119
211     	132954606361	57
211     	805966823208	69
211     	314482481265	118
211     	919197823026	103
211     	490997846898	134
211     	384179652400	134
211     	118389501460	63
211     	816260222588	121
211     	411067277447	83
211     	419481071217	142
211     	444797600349	114
211     	893005812666	104
211     	722946564026	54
211     	833663232208	86
211     	400127531270	63
211     	389169531271	81
211     	643925479319	120
211     	467986934495	117
211     	379942304309	98
211     	669515708071	133
211     	146051347589	117
211     	316871031375	56
211     	180531962334	143
211     	887528437482	59
211     	516495915668	53
211     	547685258313	150
211     	375276903331	70
211     	457459442332	114
211     	176404904473	64
211     	297083512852	119
211     	925484684473	145
211     	194144382996	126
211     	527453991710	113
211     	482340522139	110
211     	771137437634	66
211     	875605607431	113
211     	134390993040	115
211     	578705048123	150
211     	425456990082	69
211     	227635917829	143
211     	569219762080	136
211     	633320411611	139
211     	608852371253	137
211     	210526151030	128
211     	523196696835	126
211     	534109743798	62
211     	863129185304	135
211     	716818652888	79
211     	518329844939	145
211     	979700065093	94
211     	706236730898	107
211     	127026679653	78
211     	187272692439	107
211     	999543417737	142
211     	698718941817	70
211     	152614854189	93
211     	261188186216	130
211     	803607788754	54
211     	525199185853	137
211     	300475101700	62
211     	377848719039	146
211     	140903716305	116
211     	290827207620	134
211     	511511692317	63
211     	317663070530	70
212     	518787417161	68
212     	482429892907	82
212     	816260222588	69
212     	982079076090	107
212     	495776106616	75
212     	836900805029	104
212     	444797600349	84
212     	718971287692	110
212     	127026679653	122
212     	203262278452	139
212     	696368469198	128
212     	654563447110	121
212     	590034051433	137
212     	322758894316	137
212     	167742802915	143
212     	473186595371	107
212     	749625390019	138
212     	205930062465	105
212     	569219762080	86
212     	272121204465	113
212     	869112308003	95
212     	199753522658	70
212     	887528437482	52
212     	578705048123	137
212     	375276903331	132
212     	944472664850	75
212     	380734371410	65
212     	979700065093	54
212     	435583017631	111
212     	862174790606	122
212     	740581174440	85
212     	336491915536	120
212     	945012228482	150
212     	506298714832	119
212     	194144382996	71
212     	771137437634	137
212     	722946564026	118
212     	261188186216	86
212     	534109743798	78
212     	467615168772	108
212     	558886167633	103
212     	896919583724	93
212     	902956788286	89
212     	923237099384	118
212     	264132323061	122
212     	511511692317	90
212     	490997846898	147
212     	697814031389	51
212     	187272692439	68
212     	925484684473	86
212     	483738463713	148
212     	173672457176	60
212     	317663070530	89
212     	152614854189	120
212     	250617599940	105
212     	103362565865	145
212     	939369924082	90
212     	919197823026	99
212     	467986934495	146
212     	568658660566	97
212     	419481071217	74
212     	741544174664	83
212     	146051347589	146
212     	833663232208	74
212     	527453991710	122
212     	377848719039	77
212     	603333456348	115
212     	567657950596	97
212     	529831629045	77
212     	873640709962	136
212     	435122760857	133
212     	108649313374	119
212     	284083366181	138
212     	803607788754	128
212     	962728896848	81
212     	998040421944	140
212     	859109096191	131
212     	430946284790	79
212     	457459442332	99
212     	134390993040	110
212     	899657914264	50
212     	948543507361	83
212     	549746556299	62
212     	765572003296	71
212     	642234808130	83
212     	139669412174	90
212     	547244118460	140
212     	702830548447	85
212     	294993047536	54
212     	274761600136	62
212     	132954606361	103
212     	863129185304	134
212     	721857506010	109
212     	643925479319	145
212     	199968033019	129
212     	379942304309	50
212     	412348931569	122
212     	400930079611	77
212     	252522255166	108
212     	861348595761	85
212     	754664511022	91
212     	126834215166	100
212     	514254550616	149
212     	383476286895	136
212     	132186536765	79
212     	849681336901	124
212     	629919786056	130
212     	572878568883	133
212     	523196696835	113
212     	314482481265	56
212     	67014520356 	61
212     	384468659793	112
212     	925173129386	127
212     	805966823208	54
212     	933914210509	116
212     	702421087613	83
212     	411067277447	52
212     	732970729968	112
212     	578147508823	144
212     	388403878360	81
212     	630929030795	121
212     	986202008726	138
212     	769357296879	92
212     	828509049873	130
212     	589814450967	136
212     	453357640486	107
212     	814141265887	133
212     	286243122717	81
212     	660310920540	88
212     	557899454410	122
212     	554521191996	147
212     	646511826677	141
212     	636021875565	71
212     	297083512852	86
212     	129753980851	59
212     	692492393712	114
212     	381299535788	142
212     	419446364450	123
212     	508818965558	141
212     	389169531271	143
212     	364745567029	115
212     	600770885624	138
212     	875125493289	120
212     	330700905340	135
212     	414652410482	125
213     	508818965558	148
213     	660310920540	76
213     	152614854189	76
213     	444797600349	115
213     	435122760857	92
213     	603333456348	83
213     	939369924082	113
213     	490997846898	131
213     	384468659793	96
213     	629919786056	106
213     	933914210509	75
213     	716818652888	127
213     	722946564026	75
213     	457459442332	150
213     	154554749200	128
213     	740581174440	149
213     	750886611187	106
213     	308440276732	71
213     	875605607431	129
213     	203262278452	100
213     	168074802141	118
213     	379942304309	137
213     	528771298719	119
213     	873640709962	138
213     	180531962334	93
213     	518329844939	139
213     	642234808130	66
213     	419481071217	93
213     	420756960291	89
213     	509762284879	148
213     	558886167633	79
213     	669515708071	110
213     	194144382996	90
213     	210526151030	59
213     	314482481265	91
213     	176404904473	100
213     	208174494479	133
213     	286243122717	117
213     	902956788286	125
213     	589814450967	137
213     	506298714832	58
213     	775611741635	103
213     	899657914264	52
213     	868744054130	71
213     	205930062465	50
213     	996103067914	106
213     	134390993040	131
213     	578147508823	70
213     	986065693858	82
213     	568658660566	104
213     	998040421944	71
213     	948543507361	88
213     	554521191996	142
213     	982079076090	148
213     	630929030795	110
213     	297083512852	132
213     	636021875565	112
213     	770565227675	65
213     	534109743798	98
213     	861348595761	96
213     	274761600136	69
213     	525199185853	84
213     	894482053097	123
213     	732970729968	111
213     	383476286895	95
213     	814141265887	145
213     	994411186239	125
213     	511511692317	66
213     	174237001203	110
213     	875125493289	94
213     	828509049873	130
213     	654563447110	131
213     	132954606361	71
213     	916984241291	65
213     	698718941817	104
213     	569219762080	138
213     	567657950596	142
213     	999543417737	123
213     	330700905340	128
213     	419446364450	78
213     	411067277447	93
213     	227635917829	74
213     	322758894316	72
213     	482429892907	148
213     	836900805029	114
213     	749625390019	131
213     	786975743876	81
213     	412348931569	69
214     	869112308003	145
214     	419481071217	126
214     	261188186216	140
214     	590034051433	128
214     	828509049873	61
214     	308792010934	129
214     	108649313374	61
214     	300475101700	140
214     	425456990082	99
214     	578147508823	101
214     	771137437634	56
214     	916984241291	120
214     	945012228482	54
214     	118389501460	138
214     	642234808130	80
214     	925173129386	66
214     	873640709962	97
214     	508818965558	53
214     	384468659793	103
214     	132954606361	122
214     	152614854189	74
214     	887528437482	62
214     	939369924082	107
214     	568658660566	127
214     	803607788754	85
214     	67014520356 	78
214     	556388862616	137
214     	167742802915	71
214     	636021875565	122
214     	435122760857	65
214     	740581174440	134
214     	749625390019	136
214     	770565227675	123
214     	875125493289	68
214     	103362565865	85
214     	234646454745	108
214     	308440276732	85
214     	863129185304	87
214     	486804801433	76
214     	741544174664	130
214     	986202008726	132
214     	721857506010	83
214     	203262278452	58
214     	527453991710	134
214     	919197823026	68
214     	566877828296	56
214     	430946284790	149
214     	557899454410	54
214     	902956788286	119
214     	554521191996	72
214     	979700065093	137
214     	875605607431	76
214     	398900612810	127
214     	572878568883	109
214     	563144943925	145
214     	208174494479	149
214     	400930079611	126
214     	467986934495	84
214     	144568875894	99
214     	274761600136	128
214     	154554749200	135
214     	420756960291	106
214     	600770885624	118
214     	696368469198	77
214     	380734371410	144
214     	414652410482	133
214     	722946564026	70
214     	923237099384	148
215     	754664511022	127
215     	896919583724	85
215     	349435998924	125
215     	384468659793	102
215     	836900805029	83
215     	435122760857	81
215     	418604295928	50
215     	400127531270	122
215     	558886167633	79
215     	482429892907	130
215     	816260222588	108
215     	118389501460	99
215     	317663070530	73
215     	297083512852	56
215     	205930062465	109
215     	457459442332	72
215     	590034051433	118
215     	576518370019	121
215     	482340522139	150
215     	679453075525	73
215     	569219762080	89
215     	274761600136	126
215     	314482481265	124
215     	139669412174	142
215     	849681336901	139
215     	828509049873	51
215     	861348595761	109
215     	603333456348	102
215     	986202008726	64
215     	199968033019	55
215     	339589987290	136
215     	805966823208	117
215     	516286957430	108
215     	264132323061	112
215     	284083366181	70
215     	467615168772	134
215     	698718941817	77
215     	450659382698	58
215     	127026679653	102
215     	527453991710	106
215     	838962966418	84
215     	529831629045	105
215     	600770885624	61
215     	718971287692	116
215     	877194198700	149
215     	578705048123	96
215     	398900612810	147
215     	803607788754	67
215     	706236730898	117
215     	572878568883	137
215     	375276903331	61
215     	414652410482	65
215     	899657914264	83
215     	986065693858	88
215     	618570550236	83
215     	199753522658	54
215     	862174790606	62
215     	871701186034	80
215     	998040421944	111
215     	413227470171	109
215     	490997846898	146
215     	709229053555	134
215     	765572003296	126
215     	506298714832	103
215     	649921994715	65
215     	629919786056	128
215     	732970729968	51
215     	999543417737	53
215     	775611741635	147
215     	692492393712	143
215     	893005812666	125
215     	473186595371	82
215     	420756960291	67
215     	523196696835	87
215     	578147508823	68
215     	923237099384	67
215     	882152991390	66
215     	425456990082	85
215     	146051347589	102
215     	154554749200	92
215     	869112308003	71
215     	568658660566	132
215     	134390993040	78
215     	518787417161	103
215     	400930079611	138
215     	939369924082	102
215     	265444172694	99
215     	721857506010	125
215     	919197823026	101
215     	322758894316	51
215     	516495915668	139
215     	444797600349	64
215     	290827207620	82
215     	419446364450	108
215     	210526151030	146
215     	388403878360	64
215     	549746556299	113
215     	740581174440	123
215     	996103067914	135
215     	556388862616	111
215     	380734371410	139
215     	839518983686	129
215     	308440276732	139
215     	859109096191	79
215     	176404904473	59
215     	979700065093	135
215     	770565227675	128
215     	132186536765	130
215     	308792010934	65
215     	925484684473	131
215     	776538360607	116
215     	108649313374	102
215     	373709485267	100
215     	508818965558	113
215     	194144382996	62
215     	962728896848	110
215     	419481071217	129
215     	379942304309	125
215     	252522255166	67
215     	467986934495	83
215     	167742802915	143
215     	902956788286	139
215     	246144606961	130
215     	189470486214	147
215     	636021875565	106
215     	364745567029	131
215     	563144943925	51
215     	383476286895	124
215     	412348931569	91
215     	566877828296	75
215     	654563447110	61
215     	769357296879	134
215     	409542246104	110
215     	525199185853	98
215     	430946284790	130
215     	300475101700	77
215     	660310920540	79
215     	945312847530	100
215     	534109743798	120
215     	875125493289	120
215     	174237001203	121
215     	669515708071	68
215     	509762284879	74
215     	140903716305	84
215     	554521191996	88
215     	518329844939	109
215     	982079076090	51
215     	643925479319	142
216     	199968033019	61
216     	411067277447	118
216     	999543417737	90
216     	506298714832	62
216     	450659382698	51
216     	702421087613	120
216     	272121204465	118
216     	483738463713	129
216     	775611741635	93
216     	996103067914	105
216     	514254550616	108
216     	600770885624	141
216     	314482481265	112
216     	660310920540	83
216     	264132323061	133
216     	444797600349	78
216     	176404904473	61
216     	418604295928	80
216     	698718941817	125
216     	572878568883	122
216     	435122760857	110
216     	697814031389	135
216     	509762284879	147
216     	334425348148	121
216     	649921994715	55
216     	882152991390	83
216     	108649313374	146
216     	430946284790	83
216     	265444172694	101
216     	435583017631	108
216     	816260222588	79
216     	412348931569	52
216     	389169531271	103
216     	849681336901	147
216     	875125493289	66
216     	893005812666	129
216     	568658660566	94
216     	696368469198	92
216     	140903716305	149
216     	127026679653	61
216     	377848719039	115
216     	488529033803	121
216     	578147508823	139
216     	868744054130	120
216     	945312847530	130
216     	364745567029	87
216     	203262278452	114
216     	208174494479	115
216     	828509049873	124
216     	339589987290	125
216     	556388862616	105
216     	168074802141	106
216     	420756960291	70
216     	952550789390	120
216     	939369924082	119
216     	297083512852	68
216     	563144943925	67
216     	308792010934	139
216     	646511826677	102
216     	732970729968	111
216     	388403878360	77
216     	523196696835	75
216     	673737891943	145
216     	414652410482	82
216     	384468659793	87
216     	702830548447	55
216     	986202008726	87
216     	375276903331	54
216     	862174790606	137
216     	786975743876	98
216     	979700065093	71
216     	754664511022	135
216     	669515708071	140
216     	933914210509	137
216     	129753980851	65
216     	384179652400	64
217     	578705048123	98
217     	828509049873	124
217     	904647940449	140
217     	633320411611	116
217     	589814450967	125
217     	776538360607	142
217     	698718941817	66
217     	869112308003	130
217     	290827207620	50
217     	411067277447	128
217     	250617599940	76
217     	952550789390	133
217     	210526151030	93
217     	859109096191	133
217     	563144943925	107
217     	400930079611	150
217     	509762284879	68
217     	334425348148	82
217     	483738463713	101
217     	527453991710	139
217     	765572003296	64
217     	274761600136	136
217     	770565227675	83
217     	444797600349	137
217     	420756960291	110
217     	103362565865	92
217     	419446364450	116
217     	567657950596	79
217     	140903716305	66
217     	547685258313	95
217     	322758894316	123
217     	336491915536	88
217     	939369924082	129
217     	246144606961	64
217     	873640709962	98
217     	673737891943	139
217     	364745567029	85
217     	506298714832	75
217     	875125493289	71
217     	486804801433	56
217     	132954606361	83
217     	948543507361	132
217     	697814031389	71
217     	511511692317	130
217     	654563447110	135
217     	769357296879	113
217     	643925479319	124
217     	982079076090	50
217     	425456990082	96
217     	207178796787	80
217     	516495915668	52
217     	146051347589	83
217     	709229053555	64
217     	916984241291	93
217     	945012228482	96
217     	187272692439	139
217     	286243122717	127
217     	919197823026	146
217     	630929030795	67
217     	349435998924	80
217     	473186595371	75
217     	814141265887	94
217     	702421087613	125
217     	893005812666	64
217     	409542246104	115
217     	264132323061	142
217     	421337093409	95
217     	660310920540	125
217     	887528437482	69
217     	208174494479	61
217     	373709485267	90
217     	490997846898	90
217     	203262278452	105
217     	67014520356 	74
217     	642234808130	125
217     	805966823208	74
217     	838962966418	70
217     	508818965558	121
217     	398900612810	89
217     	375276903331	91
217     	933914210509	92
217     	863129185304	122
217     	430946284790	119
218     	334074319971	116
218     	339589987290	72
218     	375276903331	149
218     	589814450967	68
218     	863129185304	88
218     	67014520356 	140
218     	875125493289	137
218     	669515708071	106
218     	421337093409	78
218     	673737891943	70
218     	187272692439	71
218     	554521191996	100
218     	741544174664	90
218     	425456990082	51
218     	925484684473	80
218     	871701186034	142
218     	549746556299	55
218     	894482053097	128
218     	893005812666	88
218     	945312847530	141
218     	518787417161	55
218     	118389501460	55
218     	567657950596	134
218     	373709485267	61
218     	173672457176	119
218     	765572003296	112
218     	246144606961	82
218     	419446364450	116
218     	749625390019	56
218     	875605607431	86
218     	649921994715	113
218     	629919786056	111
218     	467986934495	130
218     	430946284790	59
218     	603333456348	78
218     	902956788286	60
218     	979700065093	63
218     	770565227675	148
218     	174237001203	51
218     	721857506010	114
218     	862174790606	146
218     	414652410482	110
218     	642234808130	66
218     	261188186216	53
218     	556388862616	96
218     	996103067914	88
218     	312237459250	142
218     	377848719039	54
218     	290827207620	124
218     	933914210509	123
218     	608852371253	68
218     	388403878360	130
218     	697814031389	89
218     	916984241291	144
218     	516286957430	87
218     	265444172694	81
218     	508818965558	140
218     	814141265887	128
218     	381299535788	93
218     	516495915668	84
218     	523196696835	67
218     	833663232208	66
218     	525199185853	104
218     	939369924082	78
218     	384179652400	148
218     	859109096191	56
218     	189470486214	57
218     	113476782830	50
218     	176404904473	142
218     	380734371410	85
218     	775611741635	59
218     	952550789390	104
218     	482429892907	126
218     	868744054130	128
218     	379942304309	146
218     	816260222588	131
218     	509762284879	111
218     	488529033803	133
218     	330700905340	123
218     	208174494479	146
218     	706236730898	88
218     	633320411611	114
218     	536851950801	79
218     	776538360607	144
218     	869112308003	82
218     	172950643766	89
218     	828509049873	142
218     	495776106616	114
218     	159425007904	105
218     	702421087613	104
218     	127026679653	87
218     	180531962334	127
218     	419481071217	72
218     	836900805029	58
218     	849681336901	130
218     	108649313374	98
218     	134390993040	106
218     	300475101700	53
218     	411067277447	78
218     	945012228482	149
218     	482340522139	120
218     	899657914264	139
218     	154554749200	125
218     	234646454745	78
218     	547244118460	51
218     	205930062465	97
218     	660310920540	110
218     	566877828296	58
218     	336491915536	86
218     	786975743876	103
218     	167742802915	53
218     	558886167633	148
218     	838962966418	104
218     	877194198700	59
218     	194144382996	96
218     	132954606361	58
218     	803607788754	109
218     	709229053555	114
218     	435122760857	120
218     	873640709962	74
218     	413227470171	141
218     	457459442332	139
218     	467615168772	128
218     	132186536765	85
218     	274761600136	72
218     	527453991710	87
218     	144568875894	148
218     	453357640486	62
218     	679453075525	116
218     	199753522658	115
218     	322758894316	105
218     	103362565865	117
218     	412348931569	130
218     	861348595761	143
218     	944472664850	80
218     	334425348148	124
218     	998040421944	133
218     	409542246104	108
218     	139669412174	109
219     	998040421944	81
219     	578705048123	75
219     	482340522139	115
219     	952550789390	122
219     	771137437634	70
219     	294993047536	73
219     	899657914264	121
219     	750886611187	51
219     	569219762080	103
219     	923237099384	104
219     	877194198700	148
219     	805966823208	70
219     	679453075525	88
219     	706236730898	113
219     	118389501460	123
219     	600770885624	135
219     	523196696835	105
219     	536851950801	74
219     	377848719039	73
219     	816260222588	64
219     	409542246104	108
219     	608852371253	120
219     	996103067914	51
219     	252522255166	68
219     	649921994715	130
219     	450659382698	131
219     	527453991710	98
219     	207178796787	66
219     	514254550616	51
219     	272121204465	76
219     	506298714832	138
219     	643925479319	74
219     	495776106616	99
219     	339589987290	62
219     	776538360607	120
219     	941976384328	87
219     	896919583724	145
219     	317663070530	63
219     	108326062706	67
219     	775611741635	73
219     	400930079611	99
219     	300475101700	148
219     	893005812666	71
219     	127026679653	131
219     	117431954043	137
219     	862174790606	141
219     	838962966418	88
219     	250617599940	93
219     	572878568883	69
219     	566877828296	64
219     	425456990082	150
219     	134390993040	62
219     	384179652400	76
219     	554521191996	50
219     	528771298719	116
219     	208174494479	65
219     	833663232208	150
219     	882152991390	72
219     	146051347589	75
219     	336491915536	51
219     	925484684473	131
219     	629919786056	141
219     	334074319971	145
219     	894482053097	149
219     	373709485267	130
219     	173672457176	83
219     	490997846898	81
219     	388403878360	138
219     	696368469198	68
219     	732970729968	119
219     	948543507361	65
219     	875605607431	53
219     	803607788754	150
219     	187272692439	136
219     	945012228482	71
219     	749193678427	102
219     	875125493289	142
219     	765572003296	96
219     	176404904473	123
219     	420756960291	122
219     	414652410482	146
219     	364745567029	125
219     	871701186034	113
219     	314482481265	88
219     	486804801433	135
219     	308440276732	81
219     	702830548447	150
219     	516495915668	85
219     	457459442332	69
219     	836900805029	92
219     	630929030795	64
219     	286243122717	127
219     	859109096191	98
219     	227635917829	147
219     	322758894316	61
219     	534109743798	99
219     	673737891943	103
219     	814141265887	136
219     	261188186216	71
219     	383476286895	57
219     	274761600136	100
219     	916984241291	133
219     	126834215166	129
219     	264132323061	112
219     	962728896848	77
219     	180531962334	50
219     	618570550236	145
219     	205930062465	59
219     	945312847530	69
219     	482429892907	57
219     	435583017631	57
219     	67014520356 	57
219     	234646454745	79
219     	411067277447	71
219     	769357296879	82
219     	297083512852	74
219     	152614854189	73
219     	979700065093	64
219     	330700905340	110
219     	467986934495	106
219     	194144382996	120
219     	384468659793	128
219     	129753980851	66
219     	749625390019	81
219     	567657950596	140
219     	549746556299	133
219     	349330324726	50
219     	646511826677	144
219     	189470486214	139
219     	547244118460	93
220     	919197823026	57
220     	127026679653	105
220     	925484684473	135
220     	203262278452	127
220     	721857506010	107
220     	172950643766	150
220     	246144606961	70
220     	630929030795	90
220     	578705048123	108
220     	518787417161	137
220     	894482053097	51
220     	600770885624	96
220     	140903716305	114
220     	317663070530	71
220     	375276903331	53
220     	300475101700	127
220     	420756960291	52
220     	418604295928	85
220     	868744054130	110
220     	569219762080	103
220     	495776106616	65
220     	568658660566	138
220     	702830548447	113
220     	398900612810	74
220     	189470486214	119
220     	589814450967	104
220     	529831629045	108
220     	603333456348	69
220     	400127531270	52
220     	379942304309	78
220     	718971287692	145
220     	945312847530	75
220     	994411186239	128
220     	419446364450	130
220     	146051347589	142
220     	673737891943	147
220     	786975743876	76
220     	435122760857	52
220     	482340522139	109
220     	118389501460	82
220     	698718941817	119
220     	554521191996	55
220     	334425348148	121
220     	896919583724	114
220     	765572003296	89
220     	144568875894	110
220     	450659382698	138
220     	308440276732	102
220     	590034051433	99
220     	642234808130	97
220     	364745567029	78
220     	709229053555	53
220     	108326062706	146
220     	457459442332	100
220     	516286957430	123
220     	272121204465	92
220     	435583017631	101
220     	749625390019	72
220     	488529033803	74
220     	509762284879	150
220     	861348595761	112
220     	316871031375	124
220     	740581174440	99
220     	828509049873	124
220     	473186595371	137
220     	769357296879	108
220     	654563447110	62
220     	999543417737	58
220     	576518370019	118
220     	873640709962	132
220     	425456990082	62
220     	776538360607	90
220     	578147508823	91
220     	286243122717	106
220     	925173129386	80
220     	108649313374	66
220     	839518983686	63
220     	154554749200	145
220     	549746556299	93
220     	534109743798	123
220     	998040421944	116
220     	882152991390	83
220     	887528437482	100
220     	159425007904	93
220     	152614854189	120
220     	941976384328	127
220     	572878568883	66
220     	732970729968	75
220     	339589987290	83
220     	697814031389	136
220     	308792010934	89
220     	902956788286	84
220     	421337093409	110
221     	144568875894	110
221     	419481071217	64
221     	339589987290	108
221     	740581174440	135
221     	869112308003	125
221     	419446364450	82
221     	816260222588	60
221     	833663232208	135
221     	919197823026	120
221     	749193678427	135
221     	146051347589	85
221     	916984241291	130
221     	894482053097	91
221     	998040421944	135
221     	511511692317	58
221     	875125493289	92
221     	536851950801	62
221     	435122760857	88
221     	646511826677	53
221     	578147508823	144
221     	246144606961	107
221     	697814031389	145
221     	679453075525	120
221     	334425348148	132
221     	547685258313	99
221     	250617599940	123
221     	444797600349	130
221     	749625390019	83
221     	633320411611	50
221     	649921994715	121
221     	227635917829	64
221     	132954606361	123
221     	180531962334	69
221     	554521191996	112
221     	979700065093	106
221     	702421087613	85
221     	486804801433	94
221     	375276903331	53
221     	839518983686	111
221     	893005812666	96
221     	549746556299	92
221     	669515708071	137
221     	453357640486	99
221     	108649313374	86
221     	482429892907	97
221     	381299535788	59
221     	490997846898	87
221     	457459442332	113
221     	875605607431	59
221     	896919583724	57
221     	388403878360	50
221     	312237459250	142
221     	873640709962	114
221     	134390993040	127
221     	568658660566	143
221     	450659382698	104
221     	364745567029	120
221     	569219762080	91
221     	754664511022	97
221     	173672457176	130
221     	716818652888	93
222     	925173129386	133
222     	849681336901	54
222     	776538360607	80
222     	261188186216	130
222     	741544174664	72
222     	411067277447	127
222     	873640709962	83
222     	467986934495	83
222     	816260222588	108
222     	208174494479	81
222     	234646454745	98
222     	127026679653	96
222     	556388862616	72
222     	250617599940	75
222     	775611741635	128
222     	384179652400	98
222     	868744054130	90
222     	718971287692	81
222     	388403878360	120
222     	425456990082	83
222     	174237001203	92
222     	633320411611	136
222     	308440276732	96
222     	557899454410	73
222     	554521191996	140
222     	636021875565	96
222     	168074802141	88
222     	108649313374	83
222     	749193678427	102
222     	660310920540	98
222     	833663232208	142
222     	518329844939	102
222     	139669412174	97
222     	923237099384	68
222     	862174790606	60
222     	67014520356 	103
222     	702830548447	134
222     	916984241291	67
222     	312237459250	148
222     	389169531271	128
222     	317663070530	112
222     	118389501460	137
222     	290827207620	60
222     	377848719039	129
222     	176404904473	107
222     	264132323061	129
222     	132186536765	136
222     	308792010934	79
222     	603333456348	64
222     	986202008726	148
222     	698718941817	50
222     	322758894316	135
222     	998040421944	90
222     	863129185304	52
222     	861348595761	99
222     	933914210509	83
222     	457459442332	54
222     	887528437482	148
222     	203262278452	75
222     	654563447110	96
222     	669515708071	115
222     	547685258313	82
222     	754664511022	143
222     	740581174440	140
222     	210526151030	112
222     	877194198700	114
222     	140903716305	111
222     	996103067914	143
222     	578147508823	111
222     	549746556299	150
222     	643925479319	58
222     	896919583724	125
222     	511511692317	100
222     	986065693858	141
222     	568658660566	131
222     	172950643766	138
222     	765572003296	99
222     	509762284879	109
222     	373709485267	116
222     	566877828296	147
222     	899657914264	66
222     	375276903331	143
222     	383476286895	65
223     	600770885624	65
223     	862174790606	142
223     	117431954043	108
223     	709229053555	132
223     	861348595761	125
223     	146051347589	94
223     	945312847530	69
223     	805966823208	117
223     	274761600136	145
223     	839518983686	145
223     	473186595371	124
223     	377848719039	81
223     	869112308003	80
223     	741544174664	75
223     	435122760857	92
223     	534109743798	105
223     	234646454745	95
223     	536851950801	107
223     	771137437634	132
223     	769357296879	93
223     	998040421944	136
223     	608852371253	114
223     	261188186216	126
223     	529831629045	131
223     	511511692317	107
223     	589814450967	149
223     	413227470171	85
223     	314482481265	141
223     	398900612810	106
223     	547244118460	105
223     	718971287692	149
223     	568658660566	103
223     	814141265887	113
223     	765572003296	116
223     	643925479319	148
223     	381299535788	83
223     	467986934495	76
223     	732970729968	66
223     	618570550236	149
223     	336491915536	62
223     	322758894316	114
223     	549746556299	52
223     	482340522139	117
223     	523196696835	60
223     	996103067914	149
223     	180531962334	110
223     	838962966418	77
223     	673737891943	148
223     	421337093409	103
223     	702830548447	99
223     	994411186239	150
223     	412348931569	86
223     	210526151030	119
223     	828509049873	99
223     	132954606361	70
223     	948543507361	122
223     	660310920540	136
223     	547685258313	124
223     	558886167633	107
223     	199968033019	121
223     	882152991390	134
223     	899657914264	103
223     	933914210509	110
223     	419446364450	72
223     	979700065093	128
223     	875605607431	125
223     	159425007904	104
223     	572878568883	137
223     	925484684473	103
223     	654563447110	87
223     	490997846898	132
223     	400127531270	70
223     	284083366181	65
223     	893005812666	114
223     	749193678427	120
223     	945012228482	64
223     	482429892907	74
223     	453357640486	103
223     	692492393712	61
223     	982079076090	52
223     	316871031375	53
223     	129753980851	78
223     	962728896848	96
223     	868744054130	119
223     	871701186034	92
223     	227635917829	76
223     	108649313374	91
223     	721857506010	92
223     	919197823026	75
223     	187272692439	143
223     	252522255166	134
223     	636021875565	121
223     	749625390019	109
223     	419481071217	116
223     	488529033803	71
223     	246144606961	135
223     	294993047536	115
223     	364745567029	86
223     	875125493289	134
223     	986065693858	89
223     	863129185304	86
223     	400930079611	82
223     	508818965558	51
223     	154554749200	66
223     	495776106616	54
223     	389169531271	85
223     	205930062465	97
223     	698718941817	86
223     	939369924082	102
223     	418604295928	85
223     	349330324726	91
223     	925173129386	77
223     	286243122717	81
223     	176404904473	112
223     	127026679653	114
223     	172950643766	136
223     	330700905340	111
223     	317663070530	125
223     	633320411611	143
223     	174237001203	105
224     	948543507361	80
224     	189470486214	128
224     	673737891943	134
224     	916984241291	123
224     	696368469198	50
224     	467986934495	85
224     	563144943925	150
224     	933914210509	64
224     	154554749200	86
224     	770565227675	68
224     	567657950596	134
224     	425456990082	131
224     	134390993040	120
224     	698718941817	107
224     	732970729968	83
224     	117431954043	63
224     	113476782830	111
224     	381299535788	123
224     	457459442332	130
224     	590034051433	147
224     	297083512852	73
224     	557899454410	81
224     	108326062706	59
224     	873640709962	72
224     	261188186216	114
224     	176404904473	115
224     	144568875894	91
224     	863129185304	55
224     	420756960291	104
224     	514254550616	113
224     	877194198700	51
224     	132186536765	101
224     	999543417737	58
224     	749193678427	62
224     	419446364450	107
224     	643925479319	62
224     	776538360607	85
224     	578705048123	52
224     	435583017631	57
224     	172950643766	82
224     	925484684473	70
224     	578147508823	50
224     	146051347589	84
224     	435122760857	150
224     	400930079611	86
224     	549746556299	145
224     	554521191996	115
224     	488529033803	103
224     	805966823208	70
224     	589814450967	148
224     	208174494479	144
224     	373709485267	95
224     	566877828296	68
224     	516495915668	147
224     	308440276732	68
224     	234646454745	66
224     	547685258313	131
224     	769357296879	99
224     	274761600136	88
224     	775611741635	104
224     	833663232208	61
224     	646511826677	51
224     	839518983686	84
224     	630929030795	87
224     	152614854189	104
224     	771137437634	119
224     	998040421944	102
224     	409542246104	88
224     	384179652400	100
224     	483738463713	70
224     	859109096191	93
224     	697814031389	73
224     	871701186034	92
224     	702421087613	148
224     	467615168772	64
224     	899657914264	50
224     	986065693858	64
224     	679453075525	90
224     	558886167633	95
224     	660310920540	122
224     	389169531271	128
224     	168074802141	63
224     	649921994715	83
224     	450659382698	101
224     	869112308003	83
224     	330700905340	89
224     	654563447110	109
224     	636021875565	136
224     	945012228482	88
224     	979700065093	144
224     	108649313374	140
224     	618570550236	61
224     	749625390019	99
224     	490997846898	123
224     	377848719039	78
224     	384468659793	78
224     	994411186239	124
224     	272121204465	113
224     	412348931569	66
225     	873640709962	147
225     	67014520356 	78
225     	227635917829	91
225     	316871031375	133
225     	871701186034	84
225     	948543507361	141
225     	473186595371	82
225     	776538360607	119
225     	578705048123	86
225     	996103067914	53
225     	861348595761	141
225     	234646454745	86
225     	334425348148	52
225     	896919583724	84
225     	413227470171	97
225     	919197823026	148
225     	134390993040	134
225     	838962966418	97
225     	308792010934	96
225     	314482481265	50
225     	388403878360	64
225     	381299535788	95
225     	816260222588	127
225     	261188186216	57
225     	167742802915	143
225     	863129185304	57
225     	509762284879	86
225     	375276903331	108
225     	409542246104	88
225     	923237099384	95
225     	482429892907	97
225     	168074802141	54
225     	563144943925	126
225     	294993047536	94
225     	199753522658	126
225     	412348931569	119
225     	925484684473	129
225     	103362565865	147
225     	698718941817	75
225     	383476286895	100
225     	400127531270	103
225     	999543417737	71
225     	608852371253	56
225     	264132323061	69
225     	450659382698	72
225     	297083512852	72
225     	660310920540	85
225     	982079076090	150
225     	300475101700	146
225     	284083366181	67
225     	679453075525	77
225     	117431954043	77
225     	722946564026	110
225     	618570550236	149
225     	572878568883	90
225     	836900805029	97
225     	875605607431	93
225     	421337093409	108
225     	600770885624	69
225     	373709485267	131
225     	108326062706	138
225     	246144606961	93
225     	692492393712	57
225     	558886167633	96
225     	176404904473	83
225     	159425007904	51
225     	741544174664	143
225     	146051347589	57
225     	419481071217	150
225     	944472664850	139
225     	839518983686	59
226     	490997846898	109
226     	297083512852	107
226     	467615168772	99
226     	547244118460	91
226     	568658660566	67
226     	172950643766	136
226     	457459442332	116
226     	398900612810	74
226     	654563447110	133
226     	702830548447	96
226     	516286957430	136
226     	771137437634	89
226     	290827207620	65
226     	511511692317	91
226     	749625390019	52
226     	642234808130	76
226     	339589987290	137
226     	140903716305	86
226     	770565227675	59
226     	108649313374	52
226     	706236730898	102
226     	334074319971	78
226     	139669412174	104
226     	308440276732	55
226     	732970729968	133
226     	168074802141	103
226     	413227470171	76
226     	210526151030	84
226     	698718941817	144
226     	525199185853	60
226     	152614854189	127
226     	952550789390	148
226     	381299535788	106
226     	317663070530	74
226     	618570550236	68
226     	769357296879	131
226     	189470486214	140
226     	557899454410	81
226     	336491915536	109
226     	882152991390	71
226     	103362565865	110
226     	523196696835	148
226     	144568875894	123
226     	893005812666	93
226     	118389501460	94
226     	805966823208	76
226     	836900805029	62
226     	816260222588	57
226     	173672457176	71
226     	765572003296	50
226     	776538360607	60
226     	435583017631	100
226     	862174790606	110
226     	488529033803	115
226     	948543507361	141
226     	159425007904	145
226     	414652410482	148
226     	349330324726	78
226     	859109096191	95
226     	849681336901	72
226     	868744054130	114
226     	364745567029	133
226     	187272692439	80
226     	600770885624	150
226     	294993047536	99
226     	554521191996	132
226     	412348931569	109
226     	646511826677	138
226     	516495915668	80
226     	509762284879	80
226     	925484684473	52
226     	453357640486	114
226     	962728896848	55
226     	308792010934	142
226     	421337093409	105
226     	286243122717	124
226     	669515708071	76
226     	314482481265	130
226     	709229053555	80
226     	630929030795	129
226     	430946284790	121
226     	534109743798	116
226     	649921994715	147
226     	67014520356 	77
226     	722946564026	102
226     	384468659793	51
226     	673737891943	140
226     	871701186034	138
226     	127026679653	109
226     	750886611187	98
226     	933914210509	147
226     	549746556299	99
226     	482340522139	66
226     	979700065093	130
226     	838962966418	122
226     	741544174664	69
226     	629919786056	69
226     	252522255166	66
226     	873640709962	134
226     	167742802915	70
226     	590034051433	64
226     	875125493289	123
226     	506298714832	149
226     	563144943925	78
226     	227635917829	142
226     	904647940449	70
226     	923237099384	118
226     	205930062465	113
226     	982079076090	75
226     	349435998924	68
226     	894482053097	134
226     	839518983686	85
226     	603333456348	63
226     	194144382996	125
226     	418604295928	63
226     	199968033019	76
226     	528771298719	107
226     	869112308003	120
226     	473186595371	117
226     	518787417161	148
226     	919197823026	95
226     	508818965558	130
226     	250617599940	95
226     	154554749200	106
227     	534109743798	96
227     	692492393712	50
227     	643925479319	137
227     	875605607431	103
227     	896919583724	117
227     	732970729968	97
227     	838962966418	84
227     	709229053555	124
227     	103362565865	104
227     	108326062706	84
227     	775611741635	132
227     	536851950801	72
227     	330700905340	50
227     	633320411611	76
227     	749625390019	82
227     	525199185853	136
227     	207178796787	82
227     	716818652888	150
227     	862174790606	80
227     	250617599940	141
227     	414652410482	134
227     	381299535788	142
227     	132954606361	86
227     	833663232208	76
227     	529831629045	67
227     	996103067914	140
227     	803607788754	65
227     	113476782830	58
227     	875125493289	102
227     	127026679653	150
227     	816260222588	116
227     	568658660566	141
227     	336491915536	67
227     	569219762080	141
227     	863129185304	70
227     	322758894316	128
227     	939369924082	83
227     	660310920540	72
227     	140903716305	104
227     	765572003296	121
227     	557899454410	137
227     	409542246104	106
227     	618570550236	145
227     	590034051433	54
227     	904647940449	115
227     	210526151030	140
227     	516495915668	69
227     	412348931569	60
227     	205930062465	126
227     	272121204465	88
227     	508818965558	128
227     	286243122717	77
227     	435122760857	70
227     	523196696835	149
227     	400930079611	90
227     	673737891943	139
227     	261188186216	58
227     	444797600349	94
227     	317663070530	77
227     	527453991710	136
227     	572878568883	140
227     	173672457176	61
227     	199753522658	51
227     	868744054130	80
227     	828509049873	53
227     	518329844939	56
227     	887528437482	110
227     	388403878360	79
227     	339589987290	62
227     	419446364450	128
227     	986202008726	133
227     	945312847530	126
227     	126834215166	109
227     	252522255166	103
227     	168074802141	84
227     	467615168772	87
227     	567657950596	142
227     	246144606961	125
227     	375276903331	150
227     	603333456348	112
227     	430946284790	89
227     	563144943925	72
227     	134390993040	75
227     	702421087613	53
227     	770565227675	56
227     	398900612810	92
227     	642234808130	122
227     	450659382698	67
227     	377848719039	132
227     	413227470171	106
227     	722946564026	141
227     	514254550616	137
227     	646511826677	68
227     	919197823026	69
227     	871701186034	97
227     	284083366181	101
227     	696368469198	99
227     	334074319971	126
227     	172950643766	140
227     	383476286895	76
227     	962728896848	92
227     	749193678427	101
227     	706236730898	110
227     	902956788286	71
227     	457459442332	143
227     	718971287692	97
228     	511511692317	120
228     	207178796787	124
228     	425456990082	125
228     	132954606361	138
228     	349330324726	51
228     	660310920540	59
228     	205930062465	75
228     	839518983686	86
228     	982079076090	78
228     	227635917829	79
228     	769357296879	135
228     	117431954043	50
228     	925484684473	126
228     	923237099384	63
228     	400127531270	126
228     	336491915536	57
228     	103362565865	119
228     	435583017631	120
228     	875125493289	63
228     	896919583724	82
228     	814141265887	123
228     	467615168772	98
228     	453357640486	139
228     	388403878360	60
228     	578147508823	106
228     	322758894316	68
228     	127026679653	115
228     	381299535788	72
228     	250617599940	76
228     	702830548447	111
228     	836900805029	134
228     	314482481265	130
228     	882152991390	89
228     	722946564026	131
228     	643925479319	103
228     	899657914264	133
228     	547244118460	100
228     	576518370019	120
228     	528771298719	81
228     	945312847530	133
228     	838962966418	50
228     	732970729968	105
228     	740581174440	108
228     	566877828296	104
228     	379942304309	104
228     	516286957430	80
228     	389169531271	56
228     	518329844939	87
228     	364745567029	106
228     	234646454745	99
228     	529831629045	60
228     	444797600349	136
228     	902956788286	136
228     	308792010934	86
228     	294993047536	99
228     	208174494479	108
228     	649921994715	114
228     	608852371253	104
228     	547685258313	148
228     	590034051433	109
228     	706236730898	146
228     	261188186216	83
228     	129753980851	92
228     	265444172694	134
228     	482429892907	148
228     	375276903331	75
228     	600770885624	127
228     	199753522658	112
228     	518787417161	58
228     	134390993040	71
228     	816260222588	124
228     	167742802915	101
228     	534109743798	64
228     	749625390019	120
228     	312237459250	62
228     	945012228482	144
228     	567657950596	121
228     	495776106616	116
228     	697814031389	110
228     	189470486214	136
228     	308440276732	73
228     	554521191996	51
228     	996103067914	122
228     	384179652400	63
228     	187272692439	65
228     	132186536765	121
228     	999543417737	113
228     	384468659793	146
228     	176404904473	53
228     	525199185853	53
228     	194144382996	123
228     	467986934495	127
228     	875605607431	51
228     	893005812666	52
228     	297083512852	104
228     	919197823026	95
228     	527453991710	101
228     	679453075525	69
228     	523196696835	143
228     	994411186239	146
228     	139669412174	96
228     	868744054130	147
228     	916984241291	65
228     	749193678427	133
228     	630929030795	106
228     	506298714832	116
229     	750886611187	60
229     	608852371253	128
229     	322758894316	118
229     	187272692439	150
229     	941976384328	67
229     	514254550616	54
229     	925484684473	102
229     	646511826677	133
229     	923237099384	118
229     	618570550236	142
229     	996103067914	137
229     	430946284790	137
229     	673737891943	96
229     	836900805029	140
229     	139669412174	140
229     	578705048123	104
229     	899657914264	122
229     	902956788286	110
229     	127026679653	113
229     	589814450967	98
229     	389169531271	141
229     	516286957430	147
229     	483738463713	50
229     	334074319971	76
229     	400930079611	125
229     	284083366181	142
229     	330700905340	93
229     	536851950801	82
229     	871701186034	68
229     	274761600136	142
229     	457459442332	62
229     	317663070530	74
229     	425456990082	56
229     	312237459250	89
229     	534109743798	145
229     	998040421944	56
229     	698718941817	124
229     	679453075525	56
229     	769357296879	129
229     	152614854189	112
229     	600770885624	122
229     	569219762080	80
229     	919197823026	136
229     	669515708071	129
229     	134390993040	75
229     	144568875894	148
229     	916984241291	114
229     	775611741635	70
229     	473186595371	148
229     	706236730898	133
229     	643925479319	117
229     	547685258313	106
229     	838962966418	70
229     	419481071217	91
229     	450659382698	112
229     	925173129386	147
229     	176404904473	53
229     	849681336901	65
229     	421337093409	60
229     	118389501460	104
229     	384179652400	142
229     	379942304309	86
229     	518787417161	99
229     	716818652888	139
229     	467986934495	52
229     	349330324726	109
229     	384468659793	91
229     	749193678427	145
229     	839518983686	104
229     	649921994715	112
229     	314482481265	85
229     	547244118460	145
229     	173672457176	70
229     	108326062706	105
229     	210526151030	109
230     	174237001203	58
230     	379942304309	140
230     	482340522139	84
230     	176404904473	124
230     	514254550616	134
230     	836900805029	63
230     	558886167633	100
230     	409542246104	92
230     	159425007904	108
230     	364745567029	114
230     	863129185304	76
230     	749193678427	100
230     	600770885624	117
230     	113476782830	105
230     	660310920540	85
230     	568658660566	73
230     	873640709962	80
230     	986065693858	137
230     	549746556299	89
230     	608852371253	69
230     	349435998924	117
230     	999543417737	101
230     	199753522658	63
230     	373709485267	104
230     	945312847530	81
230     	669515708071	143
230     	786975743876	50
230     	413227470171	92
230     	563144943925	145
230     	322758894316	57
230     	740581174440	54
230     	771137437634	111
230     	862174790606	124
230     	290827207620	87
230     	330700905340	50
230     	336491915536	76
230     	389169531271	59
230     	482429892907	68
230     	207178796787	145
230     	308440276732	70
230     	572878568883	54
230     	649921994715	61
230     	849681336901	104
230     	716818652888	140
230     	578147508823	79
230     	294993047536	95
230     	528771298719	64
230     	261188186216	145
230     	642234808130	108
230     	996103067914	64
230     	250617599940	105
230     	839518983686	135
230     	488529033803	108
230     	473186595371	92
230     	636021875565	132
230     	749625390019	141
230     	859109096191	95
230     	523196696835	83
230     	828509049873	91
230     	529831629045	74
230     	630929030795	149
230     	108649313374	101
230     	117431954043	116
230     	317663070530	71
230     	516286957430	74
230     	419481071217	88
230     	861348595761	130
230     	132186536765	104
230     	486804801433	96
230     	388403878360	83
231     	828509049873	64
231     	986065693858	77
231     	457459442332	66
231     	803607788754	64
231     	435583017631	138
231     	444797600349	71
231     	770565227675	130
231     	869112308003	60
231     	67014520356 	60
231     	600770885624	118
231     	654563447110	87
231     	861348595761	142
231     	511511692317	72
231     	117431954043	144
231     	871701186034	129
231     	567657950596	139
231     	330700905340	66
231     	814141265887	128
231     	132954606361	142
231     	514254550616	62
231     	139669412174	111
231     	994411186239	77
231     	419446364450	119
231     	516286957430	65
231     	740581174440	97
231     	862174790606	57
231     	669515708071	74
231     	629919786056	51
231     	893005812666	51
231     	482429892907	96
231     	998040421944	116
231     	679453075525	53
231     	721857506010	69
231     	643925479319	77
231     	189470486214	56
231     	381299535788	125
231     	205930062465	115
231     	709229053555	65
231     	899657914264	92
231     	108649313374	108
231     	227635917829	117
231     	274761600136	139
231     	349435998924	50
231     	749193678427	141
231     	375276903331	71
231     	982079076090	94
231     	467615168772	150
231     	608852371253	51
231     	400930079611	83
231     	618570550236	54
231     	336491915536	150
231     	272121204465	86
231     	418604295928	146
231     	435122760857	101
231     	836900805029	77
231     	649921994715	106
231     	944472664850	83
231     	419481071217	119
231     	569219762080	149
231     	483738463713	101
231     	547685258313	124
231     	578147508823	107
231     	516495915668	55
231     	873640709962	72
231     	152614854189	150
231     	486804801433	146
231     	373709485267	77
231     	420756960291	99
231     	134390993040	88
231     	180531962334	68
231     	300475101700	121
231     	868744054130	60
231     	576518370019	122
231     	534109743798	104
231     	859109096191	66
231     	349330324726	76
231     	129753980851	94
231     	334074319971	79
231     	979700065093	103
231     	473186595371	127
231     	389169531271	73
231     	589814450967	75
231     	697814031389	138
231     	379942304309	118
231     	642234808130	67
231     	383476286895	150
231     	168074802141	148
231     	692492393712	138
231     	234646454745	93
231     	527453991710	65
231     	882152991390	66
231     	933914210509	127
231     	986202008726	64
231     	509762284879	105
231     	172950643766	60
231     	103362565865	81
231     	482340522139	78
231     	176404904473	70
231     	490997846898	138
231     	749625390019	106
231     	558886167633	124
231     	413227470171	113
231     	290827207620	81
231     	488529033803	58
231     	430946284790	123
231     	904647940449	103
231     	518787417161	94
231     	167742802915	120
231     	557899454410	74
231     	308792010934	53
231     	384468659793	130
231     	863129185304	114
231     	702830548447	145
231     	849681336901	69
231     	765572003296	148
231     	568658660566	89
231     	261188186216	86
231     	203262278452	104
231     	732970729968	56
231     	425456990082	150
231     	894482053097	117
231     	113476782830	68
231     	529831629045	61
231     	528771298719	51
231     	252522255166	79
231     	722946564026	95
231     	696368469198	121
231     	384179652400	102
231     	877194198700	52
231     	380734371410	99
231     	398900612810	129
231     	154554749200	131
231     	536851950801	81
232     	887528437482	106
232     	649921994715	150
232     	435583017631	133
232     	986202008726	118
232     	814141265887	114
232     	642234808130	126
232     	297083512852	63
232     	660310920540	71
232     	547685258313	136
232     	506298714832	104
232     	274761600136	79
232     	871701186034	128
232     	126834215166	51
232     	523196696835	62
232     	904647940449	85
232     	384468659793	144
232     	205930062465	76
232     	308792010934	127
232     	741544174664	85
232     	264132323061	98
232     	425456990082	137
232     	558886167633	99
232     	168074802141	63
232     	869112308003	124
232     	272121204465	128
232     	450659382698	85
232     	482429892907	148
232     	316871031375	58
232     	380734371410	59
232     	618570550236	60
232     	375276903331	54
232     	529831629045	130
232     	875125493289	76
232     	322758894316	69
232     	899657914264	137
232     	152614854189	127
232     	108649313374	122
232     	146051347589	124
232     	488529033803	115
232     	411067277447	120
232     	349330324726	114
232     	578147508823	137
232     	722946564026	116
232     	246144606961	51
232     	384179652400	80
232     	673737891943	121
232     	261188186216	65
232     	554521191996	110
232     	805966823208	89
232     	925173129386	75
232     	862174790606	60
232     	569219762080	137
232     	578705048123	70
232     	134390993040	120
232     	453357640486	131
232     	467615168772	143
232     	919197823026	150
232     	364745567029	69
232     	486804801433	94
232     	290827207620	103
232     	771137437634	142
232     	557899454410	82
232     	636021875565	58
232     	140903716305	100
232     	838962966418	99
232     	697814031389	113
232     	419481071217	100
232     	516495915668	103
232     	654563447110	87
232     	998040421944	104
232     	803607788754	123
232     	483738463713	94
232     	430946284790	112
232     	996103067914	85
232     	473186595371	132
232     	534109743798	141
232     	379942304309	114
232     	948543507361	72
232     	509762284879	111
232     	849681336901	95
232     	952550789390	101
232     	67014520356 	129
232     	567657950596	96
232     	330700905340	54
232     	518787417161	96
232     	421337093409	93
232     	308440276732	110
232     	129753980851	107
233     	152614854189	91
233     	771137437634	122
233     	916984241291	132
233     	418604295928	123
233     	765572003296	131
233     	925484684473	132
233     	473186595371	72
233     	996103067914	57
233     	722946564026	74
233     	589814450967	147
233     	379942304309	145
233     	603333456348	126
233     	308440276732	149
233     	643925479319	83
233     	740581174440	50
233     	999543417737	95
233     	199968033019	117
233     	414652410482	116
233     	948543507361	125
233     	261188186216	73
233     	873640709962	59
233     	882152991390	61
233     	488529033803	50
233     	300475101700	144
233     	556388862616	119
233     	108649313374	128
233     	706236730898	134
233     	349330324726	103
233     	482429892907	92
233     	139669412174	147
233     	339589987290	80
233     	134390993040	133
233     	140903716305	52
233     	168074802141	66
233     	508818965558	60
233     	649921994715	68
233     	518787417161	89
233     	384179652400	52
233     	419481071217	64
233     	364745567029	62
233     	986202008726	56
233     	608852371253	96
233     	554521191996	62
233     	388403878360	99
233     	509762284879	113
233     	838962966418	128
233     	194144382996	144
233     	208174494479	125
233     	697814031389	112
233     	525199185853	52
233     	718971287692	144
233     	741544174664	131
233     	945312847530	61
233     	563144943925	80
233     	566877828296	130
233     	103362565865	108
233     	904647940449	135
233     	495776106616	60
233     	118389501460	84
233     	786975743876	134
233     	167742802915	129
233     	702830548447	57
233     	660310920540	147
233     	435122760857	121
233     	173672457176	97
233     	187272692439	92
233     	578147508823	69
233     	409542246104	74
233     	174237001203	76
233     	400930079611	56
233     	875605607431	71
233     	514254550616	65
233     	899657914264	79
233     	896919583724	69
233     	709229053555	64
233     	816260222588	128
233     	696368469198	81
233     	375276903331	67
233     	334425348148	123
233     	576518370019	126
233     	527453991710	148
233     	568658660566	94
233     	430946284790	83
233     	334074319971	100
234     	862174790606	129
234     	127026679653	68
234     	375276903331	85
234     	349330324726	148
234     	317663070530	61
234     	952550789390	143
234     	578705048123	150
234     	189470486214	97
234     	576518370019	53
234     	618570550236	112
234     	869112308003	117
234     	172950643766	99
234     	692492393712	139
234     	998040421944	76
234     	527453991710	86
234     	882152991390	89
234     	176404904473	89
234     	528771298719	148
234     	839518983686	102
234     	706236730898	126
234     	210526151030	142
234     	893005812666	99
234     	234646454745	78
234     	140903716305	54
234     	199753522658	130
234     	272121204465	77
234     	384179652400	146
234     	589814450967	108
234     	308440276732	60
234     	941976384328	80
234     	836900805029	99
234     	339589987290	62
234     	294993047536	64
234     	420756960291	50
234     	718971287692	95
234     	409542246104	74
234     	129753980851	113
234     	506298714832	111
234     	103362565865	114
234     	180531962334	142
234     	421337093409	148
234     	776538360607	77
234     	208174494479	110
234     	649921994715	102
234     	838962966418	116
234     	418604295928	148
234     	308792010934	119
234     	803607788754	140
234     	173672457176	83
234     	495776106616	131
234     	118389501460	121
234     	467986934495	91
234     	877194198700	147
234     	246144606961	105
234     	721857506010	52
234     	709229053555	82
234     	868744054130	117
234     	511511692317	104
234     	316871031375	115
234     	516286957430	142
234     	334425348148	133
234     	945012228482	103
234     	453357640486	63
234     	199968033019	128
234     	696368469198	128
234     	518329844939	117
234     	152614854189	79
234     	113476782830	73
234     	334074319971	114
234     	473186595371	86
234     	108326062706	135
234     	673737891943	137
234     	863129185304	110
234     	871701186034	101
234     	264132323061	89
234     	925484684473	96
234     	529831629045	101
234     	203262278452	56
234     	284083366181	76
234     	590034051433	71
234     	563144943925	50
234     	411067277447	120
234     	902956788286	117
234     	425456990082	90
234     	919197823026	145
234     	630929030795	85
234     	873640709962	77
234     	770565227675	133
234     	187272692439	121
234     	117431954043	97
234     	508818965558	75
234     	400127531270	148
234     	828509049873	120
234     	286243122717	76
234     	132954606361	108
234     	509762284879	57
234     	261188186216	57
234     	916984241291	103
234     	398900612810	53
234     	379942304309	74
234     	400930079611	56
234     	139669412174	108
234     	904647940449	126
234     	986202008726	75
234     	945312847530	143
234     	754664511022	75
234     	642234808130	56
234     	805966823208	99
234     	887528437482	71
234     	297083512852	133
234     	702830548447	83
234     	996103067914	136
234     	923237099384	132
235     	702830548447	61
235     	486804801433	66
235     	420756960291	88
235     	457459442332	140
235     	167742802915	92
235     	467615168772	132
235     	113476782830	150
235     	982079076090	125
235     	566877828296	82
235     	549746556299	94
235     	986202008726	69
235     	336491915536	103
235     	786975743876	132
235     	411067277447	144
235     	250617599940	115
235     	636021875565	60
235     	740581174440	108
235     	629919786056	139
235     	383476286895	56
235     	473186595371	117
235     	516286957430	124
235     	877194198700	64
235     	702421087613	107
235     	274761600136	60
235     	919197823026	77
235     	654563447110	111
235     	139669412174	87
235     	839518983686	96
235     	754664511022	81
235     	146051347589	95
235     	203262278452	138
235     	103362565865	142
235     	490997846898	118
235     	698718941817	62
235     	547244118460	56
235     	814141265887	53
235     	996103067914	90
235     	875125493289	134
235     	962728896848	68
235     	569219762080	68
235     	381299535788	134
235     	516495915668	87
235     	673737891943	145
235     	776538360607	118
235     	388403878360	85
235     	134390993040	123
235     	741544174664	134
235     	199753522658	130
235     	527453991710	91
235     	419481071217	53
235     	176404904473	52
235     	334074319971	123
235     	294993047536	86
235     	425456990082	131
235     	882152991390	72
235     	108326062706	66
235     	608852371253	148
235     	771137437634	119
235     	618570550236	96
235     	554521191996	101
235     	721857506010	101
235     	828509049873	145
235     	208174494479	150
235     	894482053097	65
235     	159425007904	80
235     	377848719039	99
235     	234646454745	74
235     	144568875894	148
235     	718971287692	94
235     	994411186239	73
235     	518787417161	72
235     	272121204465	80
235     	572878568883	147
235     	132186536765	75
235     	863129185304	113
235     	589814450967	88
236     	488529033803	104
236     	168074802141	74
236     	863129185304	127
236     	702830548447	143
236     	805966823208	63
236     	750886611187	72
236     	563144943925	132
236     	536851950801	147
236     	126834215166	116
236     	869112308003	127
236     	589814450967	85
236     	945312847530	61
236     	334425348148	132
236     	300475101700	91
236     	873640709962	67
236     	506298714832	123
236     	146051347589	94
236     	317663070530	87
236     	420756960291	129
236     	567657950596	101
236     	167742802915	121
236     	925173129386	76
236     	457459442332	99
236     	312237459250	90
236     	698718941817	66
236     	944472664850	131
236     	250617599940	133
236     	421337093409	143
236     	803607788754	74
236     	986065693858	80
236     	290827207620	80
236     	590034051433	129
236     	308792010934	72
236     	409542246104	112
236     	132186536765	59
236     	381299535788	136
236     	453357640486	90
236     	899657914264	91
236     	322758894316	90
236     	508818965558	138
236     	316871031375	123
236     	176404904473	136
236     	113476782830	60
236     	771137437634	52
236     	786975743876	147
236     	199753522658	64
236     	144568875894	94
236     	103362565865	56
236     	646511826677	126
236     	629919786056	92
236     	400930079611	106
236     	566877828296	116
236     	483738463713	101
236     	444797600349	82
236     	108649313374	60
236     	633320411611	91
236     	294993047536	53
236     	673737891943	120
236     	364745567029	147
236     	643925479319	52
237     	322758894316	108
237     	194144382996	130
237     	982079076090	62
237     	488529033803	128
237     	618570550236	77
237     	411067277447	84
237     	336491915536	123
237     	384179652400	136
237     	669515708071	55
237     	805966823208	89
237     	529831629045	133
237     	126834215166	90
237     	234646454745	61
237     	776538360607	95
237     	896919583724	93
237     	495776106616	122
237     	265444172694	136
237     	944472664850	120
237     	716818652888	96
237     	600770885624	93
237     	330700905340	136
237     	246144606961	114
237     	875125493289	126
237     	869112308003	70
237     	696368469198	122
237     	108649313374	79
237     	873640709962	88
237     	660310920540	79
237     	849681336901	81
237     	902956788286	69
237     	425456990082	93
237     	534109743798	74
237     	168074802141	147
237     	388403878360	121
237     	349435998924	65
237     	210526151030	78
237     	523196696835	140
237     	473186595371	80
237     	518329844939	121
237     	999543417737	80
237     	569219762080	87
237     	923237099384	92
237     	364745567029	124
237     	482340522139	70
237     	518787417161	94
237     	877194198700	62
237     	527453991710	115
237     	833663232208	130
237     	979700065093	150
237     	994411186239	77
237     	871701186034	93
237     	578147508823	67
237     	868744054130	84
237     	444797600349	85
237     	986065693858	127
237     	589814450967	88
237     	174237001203	83
237     	334074319971	71
237     	509762284879	108
237     	418604295928	149
237     	775611741635	83
237     	563144943925	103
237     	506298714832	115
237     	816260222588	65
237     	339589987290	64
237     	132186536765	149
237     	409542246104	68
237     	379942304309	145
237     	568658660566	97
237     	904647940449	133
237     	814141265887	145
237     	925484684473	131
237     	467615168772	129
237     	398900612810	95
237     	314482481265	83
237     	709229053555	72
237     	349330324726	90
237     	159425007904	78
237     	483738463713	87
237     	400127531270	122
237     	297083512852	143
237     	549746556299	75
237     	132954606361	79
237     	894482053097	60
237     	702421087613	141
237     	419446364450	94
237     	642234808130	62
237     	698718941817	78
237     	948543507361	101
237     	482429892907	50
237     	414652410482	53
237     	803607788754	102
237     	139669412174	74
237     	389169531271	147
237     	383476286895	84
237     	317663070530	136
237     	862174790606	128
237     	636021875565	144
237     	312237459250	112
237     	899657914264	144
237     	435122760857	55
237     	490997846898	138
237     	933914210509	89
237     	556388862616	90
237     	702830548447	145
237     	300475101700	133
237     	643925479319	89
237     	887528437482	132
237     	673737891943	114
237     	308440276732	140
237     	567657950596	95
237     	718971287692	109
237     	945012228482	136
237     	176404904473	68
237     	916984241291	115
237     	419481071217	145
237     	863129185304	60
237     	516286957430	146
237     	962728896848	57
237     	996103067914	135
237     	373709485267	79
237     	741544174664	117
237     	113476782830	127
237     	952550789390	113
237     	721857506010	132
237     	769357296879	62
237     	187272692439	120
237     	199968033019	139
237     	199753522658	145
237     	603333456348	74
237     	290827207620	119
237     	649921994715	58
237     	749625390019	67
237     	893005812666	109
237     	861348595761	65
237     	771137437634	53
237     	430946284790	98
237     	547244118460	109
237     	554521191996	79
237     	252522255166	128
237     	765572003296	65
237     	528771298719	79
237     	286243122717	94
237     	203262278452	131
238     	534109743798	111
238     	702421087613	58
238     	389169531271	77
238     	877194198700	83
238     	375276903331	132
238     	633320411611	74
238     	400930079611	79
238     	508818965558	139
238     	265444172694	146
238     	979700065093	140
238     	412348931569	89
238     	261188186216	125
238     	861348595761	105
238     	377848719039	109
238     	925173129386	117
238     	420756960291	65
238     	173672457176	117
238     	509762284879	68
238     	159425007904	74
238     	421337093409	61
238     	199968033019	73
238     	132954606361	127
238     	294993047536	131
238     	339589987290	123
238     	384468659793	137
238     	518787417161	70
238     	558886167633	115
238     	203262278452	119
238     	998040421944	109
238     	646511826677	104
238     	547685258313	70
238     	986065693858	73
238     	129753980851	57
238     	630929030795	65
238     	322758894316	127
238     	939369924082	96
238     	769357296879	51
238     	252522255166	76
238     	284083366181	146
238     	660310920540	90
238     	944472664850	84
238     	875605607431	140
238     	139669412174	73
238     	482340522139	90
238     	838962966418	106
238     	523196696835	61
238     	117431954043	147
238     	388403878360	150
238     	945012228482	63
238     	373709485267	55
238     	679453075525	55
238     	176404904473	65
238     	836900805029	114
238     	419481071217	109
238     	418604295928	108
238     	702830548447	69
238     	308440276732	103
238     	528771298719	70
238     	330700905340	73
238     	749625390019	125
238     	234646454745	55
238     	205930062465	68
238     	775611741635	90
238     	603333456348	72
238     	904647940449	79
238     	578705048123	55
238     	771137437634	97
238     	314482481265	55
238     	312237459250	113
239     	518329844939	149
239     	557899454410	136
239     	692492393712	59
239     	608852371253	123
239     	317663070530	146
239     	558886167633	146
239     	349435998924	148
239     	379942304309	113
239     	381299535788	123
239     	568658660566	145
239     	261188186216	99
239     	569219762080	65
239     	600770885624	106
239     	776538360607	121
239     	732970729968	65
239     	316871031375	130
239     	154554749200	98
239     	696368469198	85
239     	495776106616	58
239     	589814450967	121
239     	861348595761	89
239     	516286957430	103
239     	159425007904	60
239     	803607788754	94
239     	134390993040	51
239     	375276903331	114
239     	698718941817	75
239     	421337093409	107
239     	771137437634	64
239     	308792010934	53
239     	679453075525	115
239     	453357640486	62
239     	536851950801	70
239     	875605607431	128
239     	414652410482	138
239     	488529033803	96
239     	290827207620	96
239     	129753980851	107
239     	673737891943	117
239     	868744054130	106
239     	750886611187	149
239     	264132323061	112
239     	839518983686	99
239     	444797600349	101
239     	882152991390	103
239     	252522255166	131
239     	234646454745	135
239     	567657950596	85
239     	113476782830	51
239     	566877828296	138
239     	294993047536	139
239     	941976384328	78
239     	482340522139	57
239     	483738463713	55
239     	902956788286	125
239     	871701186034	143
239     	618570550236	52
239     	899657914264	103
239     	925484684473	70
239     	786975743876	126
239     	174237001203	129
239     	933914210509	140
239     	312237459250	96
239     	709229053555	129
239     	509762284879	125
239     	572878568883	130
239     	139669412174	133
239     	108326062706	98
239     	952550789390	139
239     	549746556299	67
239     	284083366181	142
239     	716818652888	115
239     	547244118460	150
239     	859109096191	128
239     	490997846898	63
239     	518787417161	91
239     	508818965558	105
239     	203262278452	52
240     	435583017631	77
240     	919197823026	116
240     	336491915536	111
240     	899657914264	57
240     	286243122717	101
240     	998040421944	115
240     	567657950596	131
240     	159425007904	124
240     	549746556299	81
240     	523196696835	74
240     	152614854189	112
240     	272121204465	100
240     	721857506010	139
240     	805966823208	78
240     	862174790606	69
240     	654563447110	92
240     	144568875894	106
240     	859109096191	71
240     	425456990082	125
240     	334074319971	149
240     	412348931569	71
240     	828509049873	132
240     	904647940449	61
240     	566877828296	128
240     	894482053097	55
240     	511511692317	68
240     	518329844939	147
240     	199968033019	109
240     	274761600136	59
240     	146051347589	144
240     	349330324726	83
240     	312237459250	90
240     	117431954043	133
240     	203262278452	93
240     	986202008726	63
240     	679453075525	69
240     	558886167633	73
240     	208174494479	122
240     	669515708071	89
240     	508818965558	81
240     	495776106616	66
240     	409542246104	73
240     	633320411611	79
240     	696368469198	140
240     	349435998924	110
240     	557899454410	81
240     	419481071217	118
240     	252522255166	81
240     	871701186034	126
240     	450659382698	127
240     	483738463713	125
240     	516286957430	96
240     	839518983686	103
240     	384468659793	79
240     	996103067914	92
240     	741544174664	132
240     	189470486214	146
240     	643925479319	126
240     	873640709962	142
240     	140903716305	135
240     	603333456348	137
240     	925484684473	51
240     	962728896848	145
240     	375276903331	113
240     	771137437634	124
240     	697814031389	77
240     	945012228482	122
240     	803607788754	79
240     	400127531270	88
240     	838962966418	76
240     	284083366181	96
240     	132954606361	146
240     	925173129386	109
240     	775611741635	121
240     	514254550616	66
240     	702830548447	85
240     	199753522658	128
240     	506298714832	77
240     	646511826677	85
240     	379942304309	133
240     	863129185304	139
240     	168074802141	67
240     	377848719039	110
240     	383476286895	85
240     	334425348148	96
240     	636021875565	76
240     	250617599940	59
240     	786975743876	113
240     	698718941817	139
240     	322758894316	111
240     	127026679653	125
240     	518787417161	123
240     	776538360607	118
240     	877194198700	83
240     	364745567029	89
240     	134390993040	123
240     	453357640486	61
240     	534109743798	89
240     	529831629045	82
240     	887528437482	82
240     	389169531271	123
240     	525199185853	62
240     	194144382996	145
240     	210526151030	108
240     	227635917829	92
240     	770565227675	144
240     	536851950801	126
240     	939369924082	61
240     	875605607431	138
240     	467986934495	86
240     	849681336901	119
240     	749625390019	51
240     	642234808130	146
240     	630929030795	79
240     	816260222588	103
240     	308792010934	97
240     	419446364450	50
240     	261188186216	138
240     	673737891943	86
240     	176404904473	101
240     	948543507361	133
240     	172950643766	138
240     	167742802915	63
240     	569219762080	89
240     	418604295928	147
240     	482340522139	103
240     	765572003296	132
240     	113476782830	88
240     	308440276732	94
240     	317663070530	142
240     	435122760857	133
240     	629919786056	147
240     	420756960291	121
240     	568658660566	57
240     	923237099384	79
240     	413227470171	129
240     	769357296879	131
240     	902956788286	98
240     	868744054130	109
240     	945312847530	91
240     	380734371410	53
241     	411067277447	66
241     	518329844939	71
241     	771137437634	76
241     	140903716305	99
241     	894482053097	128
241     	765572003296	106
241     	144568875894	108
241     	154554749200	126
241     	986065693858	59
241     	126834215166	77
241     	849681336901	65
241     	925173129386	93
241     	152614854189	148
241     	334425348148	76
241     	210526151030	141
241     	770565227675	70
241     	996103067914	147
241     	836900805029	80
241     	547685258313	142
241     	558886167633	149
241     	722946564026	51
241     	180531962334	83
241     	556388862616	51
241     	709229053555	137
241     	945012228482	54
241     	495776106616	91
241     	718971287692	150
241     	882152991390	145
241     	816260222588	137
241     	189470486214	140
241     	509762284879	109
241     	642234808130	143
241     	252522255166	80
241     	375276903331	111
241     	572878568883	145
241     	679453075525	136
241     	633320411611	89
241     	117431954043	55
241     	205930062465	86
241     	578705048123	146
241     	349330324726	76
241     	113476782830	147
241     	702830548447	104
241     	388403878360	150
241     	803607788754	54
241     	828509049873	148
241     	467615168772	50
241     	740581174440	84
241     	208174494479	132
241     	630929030795	130
241     	413227470171	69
241     	732970729968	59
241     	336491915536	74
241     	875125493289	148
241     	108326062706	115
241     	569219762080	88
241     	308792010934	139
241     	290827207620	81
241     	986202008726	98
241     	377848719039	60
241     	578147508823	117
241     	379942304309	53
241     	776538360607	80
241     	786975743876	120
241     	669515708071	143
241     	317663070530	71
241     	419481071217	77
241     	339589987290	92
241     	467986934495	109
241     	187272692439	115
241     	698718941817	95
241     	420756960291	127
241     	207178796787	94
241     	265444172694	74
241     	568658660566	83
241     	899657914264	135
241     	118389501460	111
241     	373709485267	77
241     	600770885624	67
241     	167742802915	72
241     	199753522658	122
241     	272121204465	119
241     	418604295928	98
241     	412348931569	71
241     	563144943925	102
241     	557899454410	55
241     	875605607431	84
241     	108649313374	88
241     	67014520356 	87
241     	536851950801	75
241     	696368469198	139
241     	904647940449	102
241     	419446364450	101
241     	176404904473	140
241     	859109096191	79
241     	334074319971	144
241     	814141265887	146
241     	863129185304	52
241     	516495915668	127
241     	172950643766	83
241     	877194198700	147
241     	246144606961	60
241     	871701186034	56
241     	692492393712	61
241     	982079076090	98
241     	721857506010	132
241     	534109743798	68
241     	933914210509	92
241     	199968033019	149
241     	919197823026	57
241     	549746556299	109
241     	952550789390	78
241     	603333456348	109
241     	873640709962	84
241     	528771298719	89
241     	893005812666	108
241     	554521191996	62
241     	384179652400	78
241     	453357640486	83
241     	805966823208	132
241     	364745567029	63
241     	490997846898	133
241     	654563447110	138
241     	896919583724	76
241     	923237099384	121
241     	636021875565	129
241     	174237001203	89
241     	998040421944	59
241     	146051347589	88
242     	146051347589	61
242     	509762284879	100
242     	284083366181	85
242     	833663232208	111
242     	557899454410	84
242     	547685258313	99
242     	379942304309	78
242     	863129185304	144
242     	721857506010	103
242     	227635917829	77
242     	669515708071	141
242     	384468659793	104
242     	383476286895	74
242     	274761600136	122
242     	174237001203	99
242     	234646454745	74
242     	894482053097	98
242     	450659382698	70
242     	994411186239	125
242     	419446364450	120
242     	349435998924	103
242     	203262278452	106
242     	805966823208	116
242     	568658660566	64
242     	514254550616	100
242     	875125493289	145
242     	523196696835	86
242     	199753522658	61
242     	698718941817	86
242     	939369924082	58
242     	144568875894	95
242     	173672457176	56
242     	945012228482	55
242     	414652410482	142
242     	108649313374	52
242     	534109743798	110
242     	869112308003	82
242     	899657914264	54
242     	117431954043	78
242     	536851950801	141
242     	816260222588	103
242     	643925479319	81
242     	187272692439	136
242     	308792010934	131
242     	722946564026	94
242     	118389501460	129
242     	210526151030	51
242     	154554749200	74
242     	660310920540	57
242     	941976384328	100
242     	706236730898	126
242     	590034051433	74
242     	718971287692	122
242     	435122760857	62
242     	208174494479	120
242     	473186595371	126
242     	999543417737	75
242     	529831629045	69
242     	750886611187	117
242     	771137437634	88
242     	194144382996	56
242     	962728896848	96
242     	246144606961	53
242     	875605607431	127
242     	389169531271	101
242     	349330324726	112
242     	139669412174	94
242     	786975743876	106
242     	339589987290	88
242     	129753980851	101
242     	420756960291	57
242     	495776106616	114
242     	589814450967	131
242     	554521191996	97
242     	205930062465	93
242     	642234808130	150
242     	384179652400	148
242     	868744054130	73
242     	629919786056	135
242     	741544174664	58
242     	264132323061	82
242     	836900805029	130
242     	132186536765	54
242     	250617599940	139
242     	172950643766	89
242     	749193678427	96
242     	572878568883	66
242     	849681336901	66
242     	986065693858	109
242     	482340522139	51
242     	709229053555	66
242     	702421087613	84
242     	103362565865	50
243     	234646454745	69
243     	467986934495	87
243     	286243122717	130
243     	194144382996	75
243     	322758894316	150
243     	547244118460	119
243     	566877828296	110
243     	945312847530	50
243     	527453991710	84
243     	523196696835	148
243     	453357640486	98
243     	722946564026	88
243     	702830548447	79
243     	589814450967	71
243     	698718941817	60
243     	629919786056	93
243     	948543507361	82
243     	916984241291	114
243     	863129185304	118
243     	113476782830	64
243     	741544174664	128
243     	771137437634	78
243     	702421087613	97
243     	633320411611	131
243     	549746556299	123
243     	996103067914	131
243     	673737891943	70
243     	375276903331	100
243     	250617599940	107
243     	986065693858	93
243     	514254550616	136
243     	336491915536	116
243     	398900612810	143
243     	899657914264	84
243     	528771298719	103
243     	430946284790	76
243     	769357296879	140
243     	893005812666	78
243     	838962966418	82
243     	418604295928	144
243     	839518983686	58
243     	962728896848	150
243     	495776106616	68
243     	207178796787	135
243     	608852371253	79
243     	199968033019	51
243     	554521191996	64
243     	294993047536	114
243     	945012228482	91
243     	349330324726	93
243     	828509049873	69
243     	994411186239	115
243     	600770885624	124
243     	308440276732	119
243     	706236730898	145
243     	290827207620	68
243     	563144943925	95
243     	176404904473	125
243     	414652410482	140
243     	568658660566	103
243     	679453075525	141
243     	630929030795	120
243     	578147508823	110
243     	300475101700	145
243     	770565227675	95
243     	490997846898	133
244     	558886167633	140
244     	140903716305	142
244     	536851950801	119
244     	274761600136	76
244     	603333456348	116
244     	173672457176	148
244     	899657914264	103
244     	994411186239	111
244     	467986934495	89
244     	349330324726	103
244     	702421087613	140
244     	203262278452	65
244     	261188186216	113
244     	168074802141	107
244     	312237459250	50
244     	633320411611	148
244     	457459442332	56
244     	108649313374	79
244     	473186595371	63
244     	483738463713	58
244     	944472664850	51
244     	754664511022	121
244     	234646454745	81
244     	933914210509	136
244     	948543507361	115
244     	706236730898	128
244     	418604295928	90
244     	419481071217	122
244     	250617599940	99
244     	925484684473	126
244     	144568875894	67
244     	180531962334	124
244     	430946284790	75
244     	534109743798	116
244     	334425348148	65
244     	349435998924	145
244     	189470486214	125
244     	373709485267	104
244     	716818652888	66
244     	698718941817	72
244     	364745567029	104
244     	506298714832	111
244     	925173129386	74
244     	982079076090	145
244     	979700065093	111
244     	527453991710	105
244     	945012228482	131
244     	765572003296	126
244     	654563447110	71
244     	649921994715	108
244     	525199185853	101
244     	904647940449	136
244     	199968033019	65
244     	750886611187	129
244     	563144943925	86
244     	697814031389	72
244     	839518983686	137
244     	199753522658	97
244     	400127531270	99
244     	316871031375	119
244     	998040421944	81
244     	210526151030	103
244     	871701186034	70
244     	514254550616	135
244     	509762284879	97
244     	103362565865	64
244     	873640709962	147
244     	608852371253	113
244     	709229053555	131
244     	572878568883	90
244     	488529033803	69
244     	67014520356 	120
244     	511511692317	137
244     	172950643766	96
244     	146051347589	57
244     	490997846898	82
244     	174237001203	125
244     	528771298719	128
244     	776538360607	57
244     	838962966418	145
244     	875125493289	138
244     	117431954043	76
244     	868744054130	144
244     	129753980851	51
244     	589814450967	137
244     	578147508823	64
244     	380734371410	77
244     	828509049873	102
244     	669515708071	90
244     	722946564026	149
244     	629919786056	150
244     	508818965558	66
244     	814141265887	143
244     	887528437482	121
244     	420756960291	70
244     	566877828296	66
244     	414652410482	62
244     	643925479319	124
244     	882152991390	117
244     	207178796787	59
244     	339589987290	131
244     	916984241291	144
244     	409542246104	92
244     	227635917829	69
244     	893005812666	111
244     	308792010934	96
245     	495776106616	87
245     	425456990082	102
245     	702421087613	107
245     	430946284790	143
245     	941976384328	138
245     	721857506010	57
245     	771137437634	88
245     	284083366181	68
245     	377848719039	99
245     	373709485267	101
245     	514254550616	98
245     	168074802141	128
245     	67014520356 	133
245     	132954606361	112
245     	868744054130	67
245     	740581174440	147
245     	572878568883	150
245     	547244118460	85
245     	618570550236	119
245     	558886167633	97
245     	488529033803	120
245     	467986934495	116
245     	118389501460	62
245     	838962966418	133
245     	413227470171	55
245     	398900612810	96
245     	154554749200	105
245     	902956788286	121
245     	384179652400	66
245     	435583017631	89
245     	308440276732	120
245     	300475101700	54
245     	234646454745	94
245     	414652410482	77
245     	893005812666	100
245     	317663070530	97
245     	450659382698	88
245     	875125493289	92
245     	882152991390	61
245     	566877828296	110
245     	750886611187	115
245     	692492393712	78
245     	862174790606	109
245     	388403878360	131
245     	925173129386	131
245     	509762284879	84
245     	600770885624	149
245     	875605607431	74
245     	516286957430	56
245     	923237099384	106
245     	702830548447	138
245     	952550789390	93
245     	457459442332	108
246     	264132323061	83
246     	979700065093	120
246     	250617599940	83
246     	516495915668	77
246     	636021875565	148
246     	308440276732	108
246     	132186536765	77
246     	600770885624	136
246     	173672457176	98
246     	576518370019	102
246     	152614854189	82
246     	159425007904	127
246     	702421087613	85
246     	572878568883	105
246     	952550789390	129
246     	590034051433	136
246     	518787417161	114
246     	547685258313	145
246     	994411186239	122
246     	945012228482	138
246     	948543507361	125
246     	896919583724	109
246     	308792010934	51
246     	529831629045	128
246     	414652410482	67
246     	388403878360	78
246     	786975743876	64
246     	523196696835	119
246     	457459442332	126
246     	506298714832	149
246     	194144382996	125
246     	383476286895	147
246     	706236730898	92
246     	419446364450	121
246     	732970729968	93
246     	986202008726	51
246     	490997846898	65
246     	814141265887	119
246     	290827207620	141
246     	525199185853	113
246     	939369924082	97
246     	375276903331	133
246     	776538360607	133
246     	899657914264	78
246     	861348595761	103
246     	549746556299	137
246     	199968033019	64
246     	556388862616	53
246     	916984241291	72
246     	482429892907	82
246     	919197823026	89
246     	400930079611	130
246     	805966823208	117
246     	421337093409	103
246     	420756960291	54
246     	887528437482	125
246     	649921994715	88
246     	435122760857	92
246     	316871031375	145
246     	722946564026	84
246     	284083366181	123
246     	294993047536	108
246     	127026679653	135
246     	486804801433	68
246     	380734371410	93
246     	199753522658	117
246     	274761600136	100
246     	384468659793	90
246     	803607788754	114
246     	986065693858	141
246     	509762284879	67
246     	317663070530	86
246     	514254550616	50
246     	982079076090	64
246     	108326062706	116
246     	547244118460	136
246     	869112308003	106
246     	557899454410	65
246     	379942304309	147
246     	567657950596	111
246     	741544174664	70
246     	716818652888	143
246     	999543417737	57
246     	453357640486	145
246     	167742802915	60
246     	923237099384	102
246     	234646454745	82
246     	117431954043	127
246     	875605607431	123
246     	418604295928	121
246     	339589987290	119
246     	103362565865	54
246     	698718941817	111
246     	400127531270	104
246     	139669412174	72
246     	265444172694	83
246     	207178796787	57
246     	134390993040	76
246     	618570550236	110
246     	945312847530	147
246     	902956788286	132
246     	172950643766	85
246     	718971287692	73
246     	569219762080	147
246     	633320411611	147
246     	669515708071	140
246     	578705048123	67
246     	863129185304	138
246     	483738463713	140
246     	389169531271	119
246     	568658660566	59
246     	816260222588	116
246     	868744054130	125
246     	933914210509	138
246     	882152991390	108
246     	749625390019	86
246     	679453075525	61
246     	862174790606	101
246     	495776106616	92
246     	336491915536	96
246     	566877828296	80
246     	770565227675	114
246     	409542246104	93
246     	558886167633	51
246     	859109096191	105
246     	873640709962	124
246     	129753980851	66
246     	381299535788	122
246     	769357296879	64
246     	126834215166	82
246     	998040421944	77
246     	252522255166	114
246     	702830548447	100
246     	398900612810	132
246     	208174494479	108
246     	833663232208	65
246     	412348931569	127
246     	132954606361	94
246     	673737891943	85
246     	516286957430	114
246     	189470486214	123
246     	875125493289	82
246     	118389501460	110
246     	168074802141	97
246     	430946284790	99
246     	536851950801	76
246     	330700905340	96
246     	749193678427	57
247     	986202008726	95
247     	139669412174	67
247     	603333456348	148
247     	146051347589	52
247     	882152991390	108
247     	904647940449	78
247     	567657950596	135
247     	126834215166	110
247     	771137437634	82
247     	152614854189	137
247     	660310920540	92
247     	308792010934	99
247     	702421087613	80
247     	749625390019	92
247     	284083366181	120
247     	108649313374	124
247     	450659382698	69
247     	862174790606	110
247     	642234808130	118
247     	633320411611	101
247     	129753980851	67
247     	549746556299	122
247     	740581174440	53
247     	488529033803	64
247     	716818652888	140
247     	576518370019	81
247     	383476286895	118
247     	770565227675	86
247     	925484684473	55
247     	696368469198	64
247     	941976384328	126
247     	108326062706	149
247     	483738463713	121
247     	511511692317	143
247     	887528437482	58
247     	207178796787	111
247     	741544174664	70
247     	199968033019	77
247     	600770885624	121
247     	568658660566	121
247     	718971287692	108
247     	589814450967	124
247     	750886611187	105
247     	894482053097	105
247     	265444172694	150
247     	572878568883	102
247     	646511826677	77
247     	859109096191	87
247     	203262278452	92
247     	629919786056	67
247     	375276903331	99
247     	994411186239	114
247     	814141265887	52
247     	590034051433	98
247     	893005812666	70
247     	336491915536	62
247     	506298714832	127
247     	482340522139	54
247     	176404904473	61
247     	334425348148	54
247     	509762284879	84
247     	134390993040	114
247     	467986934495	141
247     	421337093409	125
247     	765572003296	58
247     	208174494479	137
247     	556388862616	85
247     	473186595371	62
247     	264132323061	61
247     	523196696835	62
247     	986065693858	55
247     	803607788754	110
247     	518329844939	145
247     	290827207620	105
247     	836900805029	50
247     	286243122717	128
247     	754664511022	122
247     	167742802915	107
247     	118389501460	139
247     	875125493289	92
247     	314482481265	148
247     	349330324726	146
247     	557899454410	121
247     	673737891943	64
247     	435122760857	105
247     	706236730898	69
247     	435583017631	104
247     	749193678427	58
247     	776538360607	105
247     	697814031389	121
247     	168074802141	53
247     	364745567029	102
247     	234646454745	56
247     	425456990082	55
247     	919197823026	97
248     	207178796787	61
248     	859109096191	65
248     	805966823208	109
248     	334074319971	130
248     	702830548447	95
248     	132186536765	140
248     	838962966418	107
248     	566877828296	141
248     	139669412174	80
248     	312237459250	51
248     	925484684473	101
248     	863129185304	109
248     	749625390019	150
248     	336491915536	91
248     	803607788754	137
248     	770565227675	107
248     	430946284790	89
248     	696368469198	97
248     	590034051433	111
248     	698718941817	141
248     	129753980851	56
248     	67014520356 	116
248     	208174494479	95
248     	654563447110	103
248     	409542246104	72
248     	418604295928	91
248     	339589987290	94
248     	528771298719	82
248     	925173129386	127
248     	176404904473	125
248     	174237001203	62
248     	118389501460	83
248     	419481071217	125
248     	261188186216	92
248     	642234808130	110
248     	569219762080	106
248     	194144382996	74
248     	172950643766	91
248     	300475101700	150
248     	134390993040	60
248     	875605607431	74
248     	421337093409	119
248     	721857506010	105
248     	272121204465	55
248     	618570550236	117
248     	117431954043	108
248     	833663232208	102
248     	572878568883	143
248     	877194198700	134
248     	536851950801	111
248     	514254550616	98
248     	482340522139	57
248     	420756960291	134
248     	180531962334	70
248     	495776106616	117
248     	919197823026	77
248     	556388862616	57
249     	962728896848	92
249     	207178796787	51
249     	274761600136	92
249     	706236730898	80
249     	567657950596	67
249     	67014520356 	109
249     	875605607431	67
249     	430946284790	103
249     	603333456348	96
249     	816260222588	118
249     	172950643766	121
249     	146051347589	98
249     	523196696835	96
249     	488529033803	52
249     	649921994715	120
249     	113476782830	144
249     	925484684473	72
249     	381299535788	90
249     	384179652400	63
249     	839518983686	107
249     	322758894316	103
249     	516286957430	120
249     	250617599940	86
249     	569219762080	133
249     	933914210509	142
249     	776538360607	97
249     	467986934495	73
249     	152614854189	57
249     	435122760857	64
249     	740581174440	61
249     	284083366181	54
249     	636021875565	54
249     	941976384328	134
249     	308440276732	140
249     	803607788754	51
249     	411067277447	139
249     	227635917829	89
249     	986202008726	50
249     	945312847530	79
249     	421337093409	135
249     	159425007904	52
249     	869112308003	107
249     	527453991710	134
249     	132954606361	101
249     	398900612810	99
249     	894482053097	99
249     	702830548447	61
249     	836900805029	108
249     	904647940449	103
249     	364745567029	104
249     	290827207620	138
249     	566877828296	141
249     	414652410482	109
249     	118389501460	76
249     	722946564026	54
249     	444797600349	53
249     	379942304309	134
249     	608852371253	144
249     	380734371410	81
249     	838962966418	127
249     	349330324726	77
249     	286243122717	148
249     	180531962334	145
249     	127026679653	74
249     	750886611187	71
249     	849681336901	72
249     	868744054130	132
249     	294993047536	72
249     	103362565865	92
249     	453357640486	115
249     	419446364450	97
249     	108649313374	146
249     	457459442332	56
249     	568658660566	125
249     	578147508823	131
249     	349435998924	94
249     	246144606961	74
249     	999543417737	84
249     	698718941817	89
249     	420756960291	116
249     	786975743876	89
249     	721857506010	110
249     	833663232208	91
249     	525199185853	117
249     	334425348148	57
249     	770565227675	102
249     	205930062465	140
249     	902956788286	70
250     	290827207620	60
250     	572878568883	97
250     	618570550236	130
250     	146051347589	116
250     	435122760857	107
250     	409542246104	69
250     	384468659793	126
250     	316871031375	97
250     	349330324726	103
250     	566877828296	51
250     	814141265887	99
250     	608852371253	102
250     	205930062465	52
250     	556388862616	146
250     	312237459250	135
250     	805966823208	67
250     	336491915536	65
250     	679453075525	134
250     	716818652888	142
250     	741544174664	54
250     	246144606961	59
250     	199968033019	84
250     	925484684473	114
250     	286243122717	81
250     	167742802915	147
250     	250617599940	79
250     	482429892907	86
250     	547685258313	58
250     	113476782830	140
250     	945312847530	81
250     	839518983686	67
250     	749625390019	52
250     	187272692439	53
250     	945012228482	93
250     	944472664850	62
250     	108326062706	57
250     	786975743876	148
250     	696368469198	119
250     	349435998924	139
250     	567657950596	149
250     	389169531271	122
250     	330700905340	127
250     	702830548447	134
250     	916984241291	50
250     	649921994715	91
250     	483738463713	109
250     	563144943925	130
250     	877194198700	97
250     	508818965558	144
250     	893005812666	66
250     	948543507361	78
250     	134390993040	105
250     	412348931569	142
250     	514254550616	85
250     	118389501460	78
250     	803607788754	121
250     	633320411611	117
250     	709229053555	150
250     	952550789390	71
250     	339589987290	145
250     	528771298719	89
250     	660310920540	81
250     	400930079611	80
250     	419446364450	94
250     	473186595371	113
250     	998040421944	69
250     	536851950801	127
250     	103362565865	117
250     	430946284790	70
250     	642234808130	150
250     	828509049873	71
250     	527453991710	62
250     	776538360607	93
250     	450659382698	149
250     	698718941817	125
250     	227635917829	121
250     	750886611187	131
250     	862174790606	147
3       	234646454745	113
50      	523196696835	138
\.


--
-- Data for Name: store; Type: TABLE DATA; Schema: wegmans2; Owner: jaf9897
--

COPY wegmans2.store (id, address, state, opentime, closetime) FROM stdin;
1       	812 4th Parkway	MA	317	1824
2       	41374 Milwaukee Center	VA	359	1620
3       	7 Sunnyside Center	MN	533	1649
4       	1 CO Pass	CA	208	2132
5       	1 Buhler Road	FL	532	1807
6       	217 Carey Circle	NV	242	1842
7       	574 Gateway Circle	NY	342	2027
8       	06627 Lake View Drive	NC	556	1934
9       	133 Orin Alley	CA	242	1903
10      	912 Mockingbird Court	CA	217	1942
11      	646 Riverside Lane	DC	1207	2058
12      	03 Homewood Crossing	NC	457	1722
13      	8 Melody Circle	MD	256	2035
14      	34 Magdeline Trail	NY	1222	1609
15      	89085 Basil Center	WA	308	2033
16      	3 Farragut Terrace	CA	525	1857
17      	4454 2nd Road	KY	324	1715
18      	58052 Gerald Plaza	AZ	133	2154
19      	22 Sunnyside Hill	CA	1206	1611
20      	2 Warbler Road	MO	234	2006
21      	00182 Eagle Crest Avenue	HI	552	2052
22      	39320 Londonderry Park	CA	241	1957
23      	15 AZ Terrace	NE	145	1904
24      	324 Meadow Valley Park	MI	246	2343
25      	3411 Elgar Hill	MN	202	2236
26      	7 Truax Hill	AZ	213	2146
27      	0481 Eggendart Circle	AL	438	1638
28      	283 Mifflin Junction	CA	139	2051
29      	844 Annark Trail	WV	502	2003
30      	074 Jackson Terrace	FL	206	1843
31      	65321 Rusk Alley	TX	459	1602
32      	8 Eastlawn Trail	NY	420	1626
33      	067 Anhalt Road	CA	1236	1954
34      	8580 Pleasure Road	CA	248	2150
35      	61457 Lakeland Hill	OK	523	2112
36      	4 Memorial Avenue	GA	518	2325
37      	78836 Bultman Circle	MD	255	1820
38      	926 Sunbrook Lane	FL	454	2013
39      	3258 Welch Lane	MA	237	1856
40      	23579 Kinsman Court	KY	400	1726
41      	5 Hollow Ridge Trail	NY	210	1808
42      	9509 Kinsman Pass	MA	243	2155
43      	6872 Leroy Crossing	FL	106	2049
44      	136 Lakeland Trail	MI	1220	2008
45      	1298 Kim Park	TX	329	1948
46      	56648 Golf Course Hill	FL	452	2007
47      	221 Coleman Road	KY	1204	2009
48      	79 Graceland Alley	CA	312	1913
49      	00 Dottie Alley	IA	442	2315
50      	9745 Harper Street	CA	136	1919
51      	0948 Harper Junction	NY	436	2327
52      	5581 Schurz Terrace	KY	451	1838
53      	273 Granby Avenue	DC	502	1829
54      	1 Sachtjen Terrace	MN	1252	1931
55      	428 Walton Way	TX	440	2055
56      	9 Sunfield Place	CO	1233	2122
57      	0 Hazelcrest Park	VA	1208	1831
58      	983 Orin Trail	TX	248	1808
59      	43 Rigney Alley	TN	515	2219
60      	79792 Oriole Point	TX	1226	1629
61      	5 Messerschmidt Terrace	CA	431	1901
62      	755 Lyons Point	NY	448	1952
63      	8652 Pine View Circle	NE	307	1820
64      	04 Hazelcrest Point	IN	403	2303
65      	580 Lakeland Junction	CA	1240	2321
66      	15235 Forest Run Alley	NE	246	2131
67      	62 Florence Pass	NC	249	2020
68      	33 Jay Court	VA	328	2111
69      	368 Melvin Court	DC	1250	2058
70      	04 Stuart Hill	NJ	302	2226
71      	3 Village Green Way	TX	128	1731
72      	6 Bultman Circle	TN	153	1600
73      	05683 Fuller Park	MO	116	2240
74      	38 Hansons Circle	OH	210	2137
75      	29 Portage Alley	MI	108	2118
76      	9168 Tomscot Lane	CA	330	1717
77      	0 Transport Circle	FL	300	2150
78      	4 Kings Drive	CA	249	2208
79      	9906 Meadow Valley Drive	GA	1207	1944
80      	03220 Mandrake Avenue	PA	540	2149
81      	9756 Kropf Trail	NY	523	1624
82      	893 NV Pass	AZ	335	1920
83      	390 Harper Pass	TX	157	2157
84      	569 Sloan Place	VA	243	2344
85      	545 Summer Ridge Parkway	SC	427	2041
86      	46 Cottonwood Junction	OH	419	2138
87      	043 Elmside Hill	TX	127	1624
88      	1987 Darwin Way	SC	434	1843
89      	08119 Lyons Park	DC	511	2248
90      	46137 Declaration Alley	GA	338	2257
91      	0 Cody Place	GA	521	2148
92      	46 PA Pass	LA	115	1753
93      	17 Hanover Park	UT	1203	1715
94      	707 Sunbrook Avenue	VA	245	1624
95      	50 Debra Court	TX	139	1728
96      	579 Del Sol Alley	GA	131	2257
97      	337 Anzinger Court	TX	232	1747
98      	9764 Bonner Place	TN	344	2120
99      	1 Grim Way	GA	205	1752
100     	16 Division Center	IL	1244	1843
101     	9470 Dakota Trail	ID	448	2158
102     	978 Schlimgen Terrace	MT	331	2323
103     	4984 Cardinal Park	MO	538	2038
104     	7 Lillian Alley	VA	1215	1807
105     	91427 Algoma Avenue	CA	118	1950
106     	4 Westport Plaza	IN	1217	1719
107     	633 oth Circle	FL	323	1601
108     	0534 Almo Parkway	KS	1239	2005
109     	2820 Nobel Lane	NY	107	1713
110     	8209 Holy Cross Alley	MO	1256	1927
111     	863 Rieder Center	CA	535	2141
112     	855 Transport Pass	TX	212	2107
113     	25213 Victoria Hill	NY	342	2213
114     	251 Anthes Crossing	TN	457	2247
115     	365 Saint Paul Way	PA	533	1833
116     	02751 Northwestern Lane	TX	1202	2338
117     	9 Debs Center	CA	528	1646
118     	810 Village Court	VA	211	2031
119     	25 Trailsway Place	NC	234	1601
120     	603 AZ Street	CO	454	1747
121     	93 Mariners Cove Terrace	CA	1208	2308
122     	5504 Lake View Court	TX	102	1759
123     	3 Daystar Center	MO	1259	1919
124     	0856 Onsgard Pass	FL	140	1743
125     	9 Jay Lane	CO	549	2348
126     	0172 Starling Crossing	CO	1233	1935
127     	2 Burrows Junction	NY	519	1736
128     	62113 Debs Terrace	AZ	1223	1851
129     	09235 Charing Cross Court	TX	401	2055
130     	5 Graceland Crossing	OH	157	2031
131     	884 Hudson Court	DC	119	2027
132     	95 Banding Court	AL	116	1602
133     	56940 Merry Junction	LA	211	1942
134     	8 Buhler Trail	VA	105	1602
135     	6 Northfield Center	CO	454	2213
136     	30061 Lillian Hill	TX	445	2227
137     	54865 Bluejay Drive	CO	1242	2056
138     	8468 Reinke Park	WA	156	2004
139     	9140 Union Trail	CT	120	2318
140     	41 Pawling Junction	TN	309	2123
141     	1 Basil Plaza	NY	1242	1820
142     	42 Sachtjen Plaza	MO	331	1902
143     	91 Fisk Trail	CA	222	2220
144     	3207 Main Street	AL	121	1710
145     	6507 Luster Alley	FL	254	1933
146     	7070 Erie Terrace	LA	448	1947
147     	539 Straubel Drive	IN	203	2235
148     	313 Paget Street	CA	219	1600
149     	92 Ludington Plaza	AZ	1244	1743
150     	17 Glacier Hill Center	NM	120	2156
151     	447 Oriole Center	WA	1237	2142
152     	2850 Mifflin Place	NV	544	2027
153     	0056 Northland Terrace	NC	350	1959
154     	972 Carpenter Center	MD	551	2115
155     	53 Monument Way	CO	1215	1623
156     	17 Katie Drive	MS	147	1843
157     	2091 Carpenter Park	KS	511	2155
158     	32632 Basil Plaza	NY	244	1607
159     	66441 Bunker Hill Hill	WA	131	1828
160     	5 Kensington Terrace	CA	331	2123
161     	58295 Hallows Parkway	WA	437	2150
162     	78 Evergreen Park	FL	303	1733
163     	84 Mockingbird Circle	WA	236	1734
164     	8181 Claremont Avenue	TN	310	2148
165     	82 Prentice Place	CA	1234	2138
166     	19099 Quincy Point	LA	256	2118
167     	7869 Marcy Crossing	WA	308	1637
168     	2 Onsgard Road	IN	1232	2030
169     	5256 Longview Place	CA	140	2341
170     	25343 Ridge Oak Terrace	IN	212	2125
171     	393 Saint Paul Alley	IN	240	1759
172     	4 Pankratz Street	AL	134	1732
173     	10874 East Plaza	TX	400	1950
174     	884 Onsgard Court	DC	544	1942
175     	002 Kim Avenue	LA	348	2211
176     	7522 Susan Avenue	NY	1247	1746
177     	38895 Orin Alley	WA	308	1807
178     	219 Blue Bill Park Drive	VA	441	2057
179     	153 Service Drive	DC	123	1821
180     	0376 Spohn Trail	IN	352	2253
181     	19 Kipling Court	OH	1230	2041
182     	8669 Kedzie Road	UT	424	2158
183     	4253 Pond Plaza	FL	316	2209
184     	40 Farwell Street	NV	216	2332
185     	12677 Portage Alley	NY	339	2302
186     	451 Sherman Crossing	IL	300	1640
187     	1 Independence Trail	GA	230	1702
188     	0404 Kropf Circle	MO	100	1913
189     	65 Vidon Terrace	HI	312	2122
190     	03115 Algoma Road	PA	515	2118
191     	833 Hanson Center	CT	1231	2333
192     	5836 Hooker Plaza	LA	1231	2311
193     	6859 International Alley	MN	506	2142
194     	30968 Mandrake Center	KY	546	2251
195     	213 Service Lane	LA	218	2353
196     	7 Leroy Street	CO	227	2357
197     	3020 Stoughton Street	VA	425	1900
198     	4 Golf Course Court	CO	254	1720
199     	18 OH Trail	CA	536	1810
200     	07118 Truax Court	FL	1259	1904
201     	20 Kings Junction	VA	1237	2026
202     	20379 Prairieview Way	MI	517	1656
203     	59 Westerfield Street	CA	254	1741
204     	66321 Ridgeway Street	KY	357	2307
205     	98 Fremont Pass	HI	435	1816
206     	3 Pond Center	NV	148	1727
207     	067 Hudson Park	NY	318	1958
208     	3 Gale Lane	IL	520	2333
209     	361 Kedzie Court	WA	320	2119
210     	72286 Pierstorff Alley	DC	411	2227
211     	6 Bunting Drive	KY	150	2231
212     	81 Monica Court	GA	534	1900
213     	378 Ruskin Alley	CA	102	1643
214     	422 Prentice Parkway	NM	335	2147
215     	975 Larry Crossing	NC	115	1632
216     	06597 Claremont Court	AL	237	1953
217     	939 Artisan Avenue	MN	405	1624
218     	0 Prairie Rose Point	MN	110	1828
219     	79 Moulton Crossing	OH	328	1938
220     	80404 Blaine Crossing	WV	1253	1921
221     	3037 Luster Avenue	AZ	304	2142
222     	84 Mitchell Avenue	FL	450	2159
223     	28148 Hovde Lane	FL	1218	2228
224     	36 Warbler Junction	LA	544	2346
225     	51 Loeprich Parkway	CA	535	1856
226     	84010 Pawling Alley	OH	538	1604
227     	116 Clemons Way	MA	1208	1652
228     	93465 Weeping Birch Road	WV	243	1627
229     	3 Logan Crossing	CT	510	2037
230     	12 Moose Pass	PA	503	2115
231     	8492 NV Park	IN	328	1922
232     	0436 Barnett Parkway	MD	300	1908
233     	95488 Buhler Lane	NC	352	1913
234     	8138 Schurz Plaza	FL	1244	2200
235     	79 Fallview Center	CA	1250	2258
236     	7 Chinook Pass	DC	124	2017
237     	7 Waywood Hill	CA	459	1641
238     	863 Burning Wood Circle	NY	510	1703
239     	94336 Dakota Lane	PA	157	1728
240     	3 Schiller Way	WV	341	1615
241     	597 Rigney Avenue	MD	404	2303
242     	877 Stone Corner Hill	NV	354	1936
243     	05 Gerald Park	MI	248	2109
244     	3640 Loeprich Crossing	TX	244	1953
245     	88 Moose Court	IL	520	1957
246     	345 Waywood Circle	WA	103	2132
247     	863 Jenna Crossing	MD	418	1617
248     	9 Tennyson Parkway	IN	153	1836
249     	578 Claremont Avenue	DC	448	2106
250     	Online	OL	0	0
\.


--
-- Data for Name: vendor; Type: TABLE DATA; Schema: wegmans2; Owner: jaf9897
--

COPY wegmans2.vendor (name, homestate) FROM stdin;
Moo Corp.	TX
Penguin Incorporated	PN
MegaCorp	OH
ACME	CA
Brawndo	NC
Monsanto	OR
\.


--
-- Name: admin admin_pkey; Type: CONSTRAINT; Schema: wegmans2; Owner: jaf9897
--

ALTER TABLE ONLY wegmans2.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (username);


--
-- Name: brand brand_pkey; Type: CONSTRAINT; Schema: wegmans2; Owner: jaf9897
--

ALTER TABLE ONLY wegmans2.brand
    ADD CONSTRAINT brand_pkey PRIMARY KEY (name);


--
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: wegmans2; Owner: jaf9897
--

ALTER TABLE ONLY wegmans2.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (phonenumber);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: wegmans2; Owner: jaf9897
--

ALTER TABLE ONLY wegmans2.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (ordernumber);


--
-- Name: product product_pkey; Type: CONSTRAINT; Schema: wegmans2; Owner: jaf9897
--

ALTER TABLE ONLY wegmans2.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (upc);


--
-- Name: reorder reorders_pkey; Type: CONSTRAINT; Schema: wegmans2; Owner: jaf9897
--

ALTER TABLE ONLY wegmans2.reorder
    ADD CONSTRAINT reorders_pkey PRIMARY KEY (ordernumber);


--
-- Name: store stores_pkey; Type: CONSTRAINT; Schema: wegmans2; Owner: jaf9897
--

ALTER TABLE ONLY wegmans2.store
    ADD CONSTRAINT stores_pkey PRIMARY KEY (id);


--
-- Name: vendor vendor_pkey; Type: CONSTRAINT; Schema: wegmans2; Owner: jaf9897
--

ALTER TABLE ONLY wegmans2.vendor
    ADD CONSTRAINT vendor_pkey PRIMARY KEY (name);


--
-- Name: brand_ind; Type: INDEX; Schema: wegmans2; Owner: jaf9897
--

CREATE INDEX brand_ind ON wegmans2.product USING btree (brand);


--
-- Name: cust_index; Type: INDEX; Schema: wegmans2; Owner: jaf9897
--

CREATE INDEX cust_index ON wegmans2.orders USING btree (customer);


--
-- Name: reorder_by_date; Type: INDEX; Schema: wegmans2; Owner: jaf9897
--

CREATE INDEX reorder_by_date ON wegmans2.reorder USING btree (deliverydate);


--
-- Name: soldby_index; Type: INDEX; Schema: wegmans2; Owner: jaf9897
--

CREATE INDEX soldby_index ON wegmans2.soldby USING btree (productid, storeid);


--
-- Name: type_index; Type: INDEX; Schema: wegmans2; Owner: jaf9897
--

CREATE INDEX type_index ON wegmans2.product USING btree (type);


--
-- Name: brand brand_vendor_fkey; Type: FK CONSTRAINT; Schema: wegmans2; Owner: jaf9897
--

ALTER TABLE ONLY wegmans2.brand
    ADD CONSTRAINT brand_vendor_fkey FOREIGN KEY (vendor) REFERENCES wegmans2.vendor(name);


--
-- Name: carriedby carriedby_brand_fkey; Type: FK CONSTRAINT; Schema: wegmans2; Owner: jaf9897
--

ALTER TABLE ONLY wegmans2.carriedby
    ADD CONSTRAINT carriedby_brand_fkey FOREIGN KEY (brand) REFERENCES wegmans2.brand(name);


--
-- Name: carriedby carriedby_storeid_fkey; Type: FK CONSTRAINT; Schema: wegmans2; Owner: jaf9897
--

ALTER TABLE ONLY wegmans2.carriedby
    ADD CONSTRAINT carriedby_storeid_fkey FOREIGN KEY (storeid) REFERENCES wegmans2.store(id);


--
-- Name: distributedby distributedby_brand_fkey; Type: FK CONSTRAINT; Schema: wegmans2; Owner: jaf9897
--

ALTER TABLE ONLY wegmans2.distributedby
    ADD CONSTRAINT distributedby_brand_fkey FOREIGN KEY (brand) REFERENCES wegmans2.brand(name);


--
-- Name: distributedby distributedby_vendor_fkey; Type: FK CONSTRAINT; Schema: wegmans2; Owner: jaf9897
--

ALTER TABLE ONLY wegmans2.distributedby
    ADD CONSTRAINT distributedby_vendor_fkey FOREIGN KEY (vendor) REFERENCES wegmans2.vendor(name);


--
-- Name: orders orders_customer_fkey; Type: FK CONSTRAINT; Schema: wegmans2; Owner: jaf9897
--

ALTER TABLE ONLY wegmans2.orders
    ADD CONSTRAINT orders_customer_fkey FOREIGN KEY (customer) REFERENCES wegmans2.customer(phonenumber);


--
-- Name: orders orders_product_fkey; Type: FK CONSTRAINT; Schema: wegmans2; Owner: jaf9897
--

ALTER TABLE ONLY wegmans2.orders
    ADD CONSTRAINT orders_product_fkey FOREIGN KEY (product) REFERENCES wegmans2.product(upc);


--
-- Name: orders orders_store_fkey; Type: FK CONSTRAINT; Schema: wegmans2; Owner: jaf9897
--

ALTER TABLE ONLY wegmans2.orders
    ADD CONSTRAINT orders_store_fkey FOREIGN KEY (store) REFERENCES wegmans2.store(id);


--
-- Name: product product_brand_fkey; Type: FK CONSTRAINT; Schema: wegmans2; Owner: jaf9897
--

ALTER TABLE ONLY wegmans2.product
    ADD CONSTRAINT product_brand_fkey FOREIGN KEY (brand) REFERENCES wegmans2.brand(name);


--
-- Name: reorder reorder_fulfilledby_fkey; Type: FK CONSTRAINT; Schema: wegmans2; Owner: jaf9897
--

ALTER TABLE ONLY wegmans2.reorder
    ADD CONSTRAINT reorder_fulfilledby_fkey FOREIGN KEY (fulfilledby) REFERENCES wegmans2.vendor(name);


--
-- Name: reorder reorders_product_fkey; Type: FK CONSTRAINT; Schema: wegmans2; Owner: jaf9897
--

ALTER TABLE ONLY wegmans2.reorder
    ADD CONSTRAINT reorders_product_fkey FOREIGN KEY (product) REFERENCES wegmans2.product(upc);


--
-- Name: reorder reorders_store_fkey; Type: FK CONSTRAINT; Schema: wegmans2; Owner: jaf9897
--

ALTER TABLE ONLY wegmans2.reorder
    ADD CONSTRAINT reorders_store_fkey FOREIGN KEY (store) REFERENCES wegmans2.store(id);


--
-- Name: soldby soldby_productname_fkey; Type: FK CONSTRAINT; Schema: wegmans2; Owner: jaf9897
--

ALTER TABLE ONLY wegmans2.soldby
    ADD CONSTRAINT soldby_productname_fkey FOREIGN KEY (productid) REFERENCES wegmans2.product(upc);


--
-- Name: soldby soldby_storeid_fkey; Type: FK CONSTRAINT; Schema: wegmans2; Owner: jaf9897
--

ALTER TABLE ONLY wegmans2.soldby
    ADD CONSTRAINT soldby_storeid_fkey FOREIGN KEY (storeid) REFERENCES wegmans2.store(id);


--
-- Name: SCHEMA wegmans2; Type: ACL; Schema: -; Owner: jaf9897
--

REVOKE ALL ON SCHEMA wegmans2 FROM PUBLIC;
REVOKE ALL ON SCHEMA wegmans2 FROM jaf9897;
GRANT ALL ON SCHEMA wegmans2 TO jaf9897;
GRANT ALL ON SCHEMA wegmans2 TO rxc3202;
GRANT ALL ON SCHEMA wegmans2 TO jrg3321;


--
-- Name: TABLE admin; Type: ACL; Schema: wegmans2; Owner: jaf9897
--

REVOKE ALL ON TABLE wegmans2.admin FROM PUBLIC;
REVOKE ALL ON TABLE wegmans2.admin FROM jaf9897;
GRANT ALL ON TABLE wegmans2.admin TO jaf9897;
GRANT ALL ON TABLE wegmans2.admin TO rxc3202;
GRANT ALL ON TABLE wegmans2.admin TO jrg3321;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: wegmans2; Owner: jaf9897
--

ALTER DEFAULT PRIVILEGES FOR ROLE jaf9897 IN SCHEMA wegmans2 REVOKE ALL ON TABLES  FROM PUBLIC;
ALTER DEFAULT PRIVILEGES FOR ROLE jaf9897 IN SCHEMA wegmans2 REVOKE ALL ON TABLES  FROM jaf9897;
ALTER DEFAULT PRIVILEGES FOR ROLE jaf9897 IN SCHEMA wegmans2 GRANT ALL ON TABLES  TO rxc3202;
ALTER DEFAULT PRIVILEGES FOR ROLE jaf9897 IN SCHEMA wegmans2 GRANT ALL ON TABLES  TO jrg3321;


--
-- PostgreSQL database dump complete
--

