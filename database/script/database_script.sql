--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4 (Ubuntu 16.4-1.pgdg22.04+1)
-- Dumped by pg_dump version 16.4 (Ubuntu 16.4-1.pgdg22.04+1)

-- Started on 2024-12-14 14:22:27 +07

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 234 (class 1259 OID 27044)
-- Name: cart; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cart (
    cartid integer NOT NULL,
    userid integer
);


--
-- TOC entry 233 (class 1259 OID 27043)
-- Name: cart_cartid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cart_cartid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3537 (class 0 OID 0)
-- Dependencies: 233
-- Name: cart_cartid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cart_cartid_seq OWNED BY public.cart.cartid;


--
-- TOC entry 236 (class 1259 OID 27056)
-- Name: cartitems; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cartitems (
    cartitemid integer NOT NULL,
    cartid integer,
    productid integer,
    quantity integer NOT NULL
);


--
-- TOC entry 235 (class 1259 OID 27055)
-- Name: cartitems_cartitemid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cartitems_cartitemid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3538 (class 0 OID 0)
-- Dependencies: 235
-- Name: cartitems_cartitemid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cartitems_cartitemid_seq OWNED BY public.cartitems.cartitemid;


--
-- TOC entry 218 (class 1259 OID 26925)
-- Name: categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.categories (
    categoryid integer NOT NULL,
    categoryname character varying(100) NOT NULL,
    parentcategoryid integer
);


--
-- TOC entry 217 (class 1259 OID 26924)
-- Name: categories_categoryid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.categories_categoryid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3539 (class 0 OID 0)
-- Dependencies: 217
-- Name: categories_categoryid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.categories_categoryid_seq OWNED BY public.categories.categoryid;


--
-- TOC entry 222 (class 1259 OID 26946)
-- Name: deliverymethods; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.deliverymethods (
    deliverymethodid integer NOT NULL,
    methodname character varying(100) NOT NULL,
    description text
);


--
-- TOC entry 221 (class 1259 OID 26945)
-- Name: deliverymethods_deliverymethodid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.deliverymethods_deliverymethodid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3540 (class 0 OID 0)
-- Dependencies: 221
-- Name: deliverymethods_deliverymethodid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.deliverymethods_deliverymethodid_seq OWNED BY public.deliverymethods.deliverymethodid;


--
-- TOC entry 240 (class 1259 OID 27090)
-- Name: discounts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.discounts (
    discountid integer NOT NULL,
    productid integer,
    discountpercentage numeric(5,2) NOT NULL,
    startdate date,
    enddate date
);


--
-- TOC entry 239 (class 1259 OID 27089)
-- Name: discounts_discountid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.discounts_discountid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3541 (class 0 OID 0)
-- Dependencies: 239
-- Name: discounts_discountid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.discounts_discountid_seq OWNED BY public.discounts.discountid;


--
-- TOC entry 242 (class 1259 OID 27102)
-- Name: hitproducts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.hitproducts (
    hitproductid integer NOT NULL,
    productid integer,
    categoryid integer,
    totalsales money NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 27101)
-- Name: hitproducts_hitproductid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.hitproducts_hitproductid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3542 (class 0 OID 0)
-- Dependencies: 241
-- Name: hitproducts_hitproductid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.hitproducts_hitproductid_seq OWNED BY public.hitproducts.hitproductid;


--
-- TOC entry 238 (class 1259 OID 27073)
-- Name: orderhistory; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.orderhistory (
    orderhistoryid integer NOT NULL,
    orderid integer,
    userid integer,
    orderdate timestamp without time zone NOT NULL,
    totalamount money NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 27072)
-- Name: orderhistory_orderhistoryid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.orderhistory_orderhistoryid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3543 (class 0 OID 0)
-- Dependencies: 237
-- Name: orderhistory_orderhistoryid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.orderhistory_orderhistoryid_seq OWNED BY public.orderhistory.orderhistoryid;


--
-- TOC entry 230 (class 1259 OID 27007)
-- Name: orderitems; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.orderitems (
    orderitemid integer NOT NULL,
    orderid integer,
    productid integer,
    quantity integer NOT NULL,
    price money NOT NULL
);


--
-- TOC entry 229 (class 1259 OID 27006)
-- Name: orderitems_orderitemid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.orderitems_orderitemid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3544 (class 0 OID 0)
-- Dependencies: 229
-- Name: orderitems_orderitemid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.orderitems_orderitemid_seq OWNED BY public.orderitems.orderitemid;


--
-- TOC entry 228 (class 1259 OID 26985)
-- Name: orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.orders (
    orderid integer NOT NULL,
    userid integer,
    orderdate timestamp without time zone NOT NULL,
    totalamount money NOT NULL,
    deliverymethodid integer,
    paymentmethodid integer
);


--
-- TOC entry 227 (class 1259 OID 26984)
-- Name: orders_orderid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.orders_orderid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3545 (class 0 OID 0)
-- Dependencies: 227
-- Name: orders_orderid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.orders_orderid_seq OWNED BY public.orders.orderid;


--
-- TOC entry 224 (class 1259 OID 26955)
-- Name: paymentmethods; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.paymentmethods (
    paymentmethodid integer NOT NULL,
    methodname character varying(100) NOT NULL,
    description text
);


--
-- TOC entry 223 (class 1259 OID 26954)
-- Name: paymentmethods_paymentmethodid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.paymentmethods_paymentmethodid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3546 (class 0 OID 0)
-- Dependencies: 223
-- Name: paymentmethods_paymentmethodid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.paymentmethods_paymentmethodid_seq OWNED BY public.paymentmethods.paymentmethodid;


--
-- TOC entry 226 (class 1259 OID 26964)
-- Name: products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products (
    productid integer NOT NULL,
    productname character varying(255) NOT NULL,
    sku character varying(50) NOT NULL,
    price money NOT NULL,
    stockquantity integer NOT NULL,
    description text,
    mainphoto character varying(255),
    additionalphoto1 character varying(255),
    additionalphoto2 character varying(255),
    additionalphoto3 character varying(255),
    additionalphoto4 character varying(255),
    additionalphoto5 character varying(255),
    additionalphoto6 character varying(255),
    categoryid integer,
    ishit boolean DEFAULT false,
    isnew boolean DEFAULT false,
    discountpercentage numeric(5,2),
    promotionid integer
);


--
-- TOC entry 225 (class 1259 OID 26963)
-- Name: products_productid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.products_productid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3547 (class 0 OID 0)
-- Dependencies: 225
-- Name: products_productid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.products_productid_seq OWNED BY public.products.productid;


--
-- TOC entry 220 (class 1259 OID 26937)
-- Name: promotions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.promotions (
    promotionid integer NOT NULL,
    promotionname character varying(100) NOT NULL,
    description text,
    startdate date,
    enddate date
);


--
-- TOC entry 219 (class 1259 OID 26936)
-- Name: promotions_promotionid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.promotions_promotionid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3548 (class 0 OID 0)
-- Dependencies: 219
-- Name: promotions_promotionid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.promotions_promotionid_seq OWNED BY public.promotions.promotionid;


--
-- TOC entry 232 (class 1259 OID 27024)
-- Name: reviews; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reviews (
    reviewid integer NOT NULL,
    productid integer,
    userid integer,
    reviewtext text NOT NULL,
    reviewdate timestamp without time zone NOT NULL,
    isapproved boolean DEFAULT false
);


--
-- TOC entry 231 (class 1259 OID 27023)
-- Name: reviews_reviewid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.reviews_reviewid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3549 (class 0 OID 0)
-- Dependencies: 231
-- Name: reviews_reviewid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.reviews_reviewid_seq OWNED BY public.reviews.reviewid;


--
-- TOC entry 244 (class 1259 OID 27119)
-- Name: saleproducts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.saleproducts (
    saleproductid integer NOT NULL,
    productid integer,
    discountpercentage numeric(5,2) NOT NULL,
    startdate date,
    enddate date
);


--
-- TOC entry 243 (class 1259 OID 27118)
-- Name: saleproducts_saleproductid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.saleproducts_saleproductid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3550 (class 0 OID 0)
-- Dependencies: 243
-- Name: saleproducts_saleproductid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.saleproducts_saleproductid_seq OWNED BY public.saleproducts.saleproductid;


--
-- TOC entry 216 (class 1259 OID 26916)
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    userid integer NOT NULL,
    usersurname character varying(15) NOT NULL,
    username character varying(20) NOT NULL,
    userpatronymic character varying(25) NOT NULL,
    password character varying(255) NOT NULL,
    email character varying(100) NOT NULL,
    address character varying(255),
    phonenumber character varying(20)
);


--
-- TOC entry 215 (class 1259 OID 26915)
-- Name: users_userid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_userid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3551 (class 0 OID 0)
-- Dependencies: 215
-- Name: users_userid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_userid_seq OWNED BY public.users.userid;


--
-- TOC entry 3304 (class 2604 OID 27047)
-- Name: cart cartid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cart ALTER COLUMN cartid SET DEFAULT nextval('public.cart_cartid_seq'::regclass);


--
-- TOC entry 3305 (class 2604 OID 27059)
-- Name: cartitems cartitemid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cartitems ALTER COLUMN cartitemid SET DEFAULT nextval('public.cartitems_cartitemid_seq'::regclass);


--
-- TOC entry 3293 (class 2604 OID 26928)
-- Name: categories categoryid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories ALTER COLUMN categoryid SET DEFAULT nextval('public.categories_categoryid_seq'::regclass);


--
-- TOC entry 3295 (class 2604 OID 26949)
-- Name: deliverymethods deliverymethodid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.deliverymethods ALTER COLUMN deliverymethodid SET DEFAULT nextval('public.deliverymethods_deliverymethodid_seq'::regclass);


--
-- TOC entry 3307 (class 2604 OID 27093)
-- Name: discounts discountid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.discounts ALTER COLUMN discountid SET DEFAULT nextval('public.discounts_discountid_seq'::regclass);


--
-- TOC entry 3308 (class 2604 OID 27105)
-- Name: hitproducts hitproductid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hitproducts ALTER COLUMN hitproductid SET DEFAULT nextval('public.hitproducts_hitproductid_seq'::regclass);


--
-- TOC entry 3306 (class 2604 OID 27076)
-- Name: orderhistory orderhistoryid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orderhistory ALTER COLUMN orderhistoryid SET DEFAULT nextval('public.orderhistory_orderhistoryid_seq'::regclass);


--
-- TOC entry 3301 (class 2604 OID 27010)
-- Name: orderitems orderitemid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orderitems ALTER COLUMN orderitemid SET DEFAULT nextval('public.orderitems_orderitemid_seq'::regclass);


--
-- TOC entry 3300 (class 2604 OID 26988)
-- Name: orders orderid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders ALTER COLUMN orderid SET DEFAULT nextval('public.orders_orderid_seq'::regclass);


--
-- TOC entry 3296 (class 2604 OID 26958)
-- Name: paymentmethods paymentmethodid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.paymentmethods ALTER COLUMN paymentmethodid SET DEFAULT nextval('public.paymentmethods_paymentmethodid_seq'::regclass);


--
-- TOC entry 3297 (class 2604 OID 26967)
-- Name: products productid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products ALTER COLUMN productid SET DEFAULT nextval('public.products_productid_seq'::regclass);


--
-- TOC entry 3294 (class 2604 OID 26940)
-- Name: promotions promotionid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.promotions ALTER COLUMN promotionid SET DEFAULT nextval('public.promotions_promotionid_seq'::regclass);


--
-- TOC entry 3302 (class 2604 OID 27027)
-- Name: reviews reviewid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reviews ALTER COLUMN reviewid SET DEFAULT nextval('public.reviews_reviewid_seq'::regclass);


--
-- TOC entry 3309 (class 2604 OID 27122)
-- Name: saleproducts saleproductid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.saleproducts ALTER COLUMN saleproductid SET DEFAULT nextval('public.saleproducts_saleproductid_seq'::regclass);


--
-- TOC entry 3292 (class 2604 OID 26919)
-- Name: users userid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN userid SET DEFAULT nextval('public.users_userid_seq'::regclass);


--
-- TOC entry 3521 (class 0 OID 27044)
-- Dependencies: 234
-- Data for Name: cart; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cart (cartid, userid) VALUES (1, 1);
INSERT INTO public.cart (cartid, userid) VALUES (2, 2);
INSERT INTO public.cart (cartid, userid) VALUES (3, 3);
INSERT INTO public.cart (cartid, userid) VALUES (4, 4);
INSERT INTO public.cart (cartid, userid) VALUES (5, 5);
INSERT INTO public.cart (cartid, userid) VALUES (6, 6);
INSERT INTO public.cart (cartid, userid) VALUES (7, 7);
INSERT INTO public.cart (cartid, userid) VALUES (8, 8);
INSERT INTO public.cart (cartid, userid) VALUES (9, 9);
INSERT INTO public.cart (cartid, userid) VALUES (10, 10);


--
-- TOC entry 3523 (class 0 OID 27056)
-- Dependencies: 236
-- Data for Name: cartitems; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cartitems (cartitemid, cartid, productid, quantity) VALUES (1, 1, 1, 1);
INSERT INTO public.cartitems (cartitemid, cartid, productid, quantity) VALUES (2, 2, 2, 1);
INSERT INTO public.cartitems (cartitemid, cartid, productid, quantity) VALUES (3, 3, 3, 1);
INSERT INTO public.cartitems (cartitemid, cartid, productid, quantity) VALUES (4, 4, 4, 1);
INSERT INTO public.cartitems (cartitemid, cartid, productid, quantity) VALUES (5, 5, 5, 1);
INSERT INTO public.cartitems (cartitemid, cartid, productid, quantity) VALUES (6, 6, 6, 1);
INSERT INTO public.cartitems (cartitemid, cartid, productid, quantity) VALUES (7, 7, 7, 1);
INSERT INTO public.cartitems (cartitemid, cartid, productid, quantity) VALUES (8, 8, 8, 1);
INSERT INTO public.cartitems (cartitemid, cartid, productid, quantity) VALUES (9, 9, 9, 1);
INSERT INTO public.cartitems (cartitemid, cartid, productid, quantity) VALUES (10, 10, 10, 1);


--
-- TOC entry 3505 (class 0 OID 26925)
-- Dependencies: 218
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.categories (categoryid, categoryname, parentcategoryid) VALUES (1, 'Electronics', NULL);
INSERT INTO public.categories (categoryid, categoryname, parentcategoryid) VALUES (2, 'Computers', 1);
INSERT INTO public.categories (categoryid, categoryname, parentcategoryid) VALUES (3, 'Laptops', 2);
INSERT INTO public.categories (categoryid, categoryname, parentcategoryid) VALUES (4, 'Desktops', 2);
INSERT INTO public.categories (categoryid, categoryname, parentcategoryid) VALUES (5, 'Smartphones', 1);
INSERT INTO public.categories (categoryid, categoryname, parentcategoryid) VALUES (6, 'Accessories', 1);
INSERT INTO public.categories (categoryid, categoryname, parentcategoryid) VALUES (7, 'Headphones', 6);
INSERT INTO public.categories (categoryid, categoryname, parentcategoryid) VALUES (8, 'Chargers', 6);
INSERT INTO public.categories (categoryid, categoryname, parentcategoryid) VALUES (9, 'Home Appliances', NULL);
INSERT INTO public.categories (categoryid, categoryname, parentcategoryid) VALUES (10, 'Kitchen Appliances', 9);
INSERT INTO public.categories (categoryid, categoryname, parentcategoryid) VALUES (11, 'Cleaning Appliances', 9);


--
-- TOC entry 3509 (class 0 OID 26946)
-- Dependencies: 222
-- Data for Name: deliverymethods; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.deliverymethods (deliverymethodid, methodname, description) VALUES (1, 'Standard Delivery', 'Delivery within 5-7 business days');
INSERT INTO public.deliverymethods (deliverymethodid, methodname, description) VALUES (2, 'Express Delivery', 'Delivery within 1-2 business days');
INSERT INTO public.deliverymethods (deliverymethodid, methodname, description) VALUES (3, 'Same Day Delivery', 'Delivery on the same day');
INSERT INTO public.deliverymethods (deliverymethodid, methodname, description) VALUES (4, 'Pickup', 'Pickup from the store');
INSERT INTO public.deliverymethods (deliverymethodid, methodname, description) VALUES (5, 'International Delivery', 'Delivery to international locations');
INSERT INTO public.deliverymethods (deliverymethodid, methodname, description) VALUES (6, 'Overnight Delivery', 'Delivery by the next business day');
INSERT INTO public.deliverymethods (deliverymethodid, methodname, description) VALUES (7, 'Weekend Delivery', 'Delivery on Saturday or Sunday');
INSERT INTO public.deliverymethods (deliverymethodid, methodname, description) VALUES (8, 'Local Delivery', 'Delivery within the local area');
INSERT INTO public.deliverymethods (deliverymethodid, methodname, description) VALUES (9, 'Drone Delivery', 'Delivery by drone');
INSERT INTO public.deliverymethods (deliverymethodid, methodname, description) VALUES (10, 'Bike Delivery', 'Delivery by bike');


--
-- TOC entry 3527 (class 0 OID 27090)
-- Dependencies: 240
-- Data for Name: discounts; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.discounts (discountid, productid, discountpercentage, startdate, enddate) VALUES (1, 1, 10.00, '2023-11-01', '2023-11-30');
INSERT INTO public.discounts (discountid, productid, discountpercentage, startdate, enddate) VALUES (2, 2, 5.00, '2023-11-01', '2023-11-30');
INSERT INTO public.discounts (discountid, productid, discountpercentage, startdate, enddate) VALUES (3, 3, 15.00, '2023-11-01', '2023-11-30');
INSERT INTO public.discounts (discountid, productid, discountpercentage, startdate, enddate) VALUES (4, 4, 20.00, '2023-11-01', '2023-11-30');
INSERT INTO public.discounts (discountid, productid, discountpercentage, startdate, enddate) VALUES (5, 5, 10.00, '2023-11-01', '2023-11-30');
INSERT INTO public.discounts (discountid, productid, discountpercentage, startdate, enddate) VALUES (6, 6, 25.00, '2023-11-01', '2023-11-30');
INSERT INTO public.discounts (discountid, productid, discountpercentage, startdate, enddate) VALUES (7, 7, 15.00, '2023-11-01', '2023-11-30');
INSERT INTO public.discounts (discountid, productid, discountpercentage, startdate, enddate) VALUES (8, 8, 10.00, '2023-11-01', '2023-11-30');
INSERT INTO public.discounts (discountid, productid, discountpercentage, startdate, enddate) VALUES (9, 9, 5.00, '2023-11-01', '2023-11-30');
INSERT INTO public.discounts (discountid, productid, discountpercentage, startdate, enddate) VALUES (10, 10, 15.00, '2023-11-01', '2023-11-30');


--
-- TOC entry 3529 (class 0 OID 27102)
-- Dependencies: 242
-- Data for Name: hitproducts; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.hitproducts (hitproductid, productid, categoryid, totalsales) VALUES (1, 1, 3, '19 999,80 ₽');
INSERT INTO public.hitproducts (hitproductid, productid, categoryid, totalsales) VALUES (2, 2, 5, '9 999,90 ₽');
INSERT INTO public.hitproducts (hitproductid, productid, categoryid, totalsales) VALUES (3, 3, 7, '4 999,90 ₽');
INSERT INTO public.hitproducts (hitproductid, productid, categoryid, totalsales) VALUES (4, 4, 4, '14 999,90 ₽');
INSERT INTO public.hitproducts (hitproductid, productid, categoryid, totalsales) VALUES (5, 5, 8, '2 999,90 ₽');
INSERT INTO public.hitproducts (hitproductid, productid, categoryid, totalsales) VALUES (6, 6, 10, '14 999,90 ₽');
INSERT INTO public.hitproducts (hitproductid, productid, categoryid, totalsales) VALUES (7, 7, 11, '24 999,90 ₽');
INSERT INTO public.hitproducts (hitproductid, productid, categoryid, totalsales) VALUES (8, 8, 3, '12 999,90 ₽');
INSERT INTO public.hitproducts (hitproductid, productid, categoryid, totalsales) VALUES (9, 9, 5, '6 999,90 ₽');
INSERT INTO public.hitproducts (hitproductid, productid, categoryid, totalsales) VALUES (10, 10, 7, '14 999,90 ₽');


--
-- TOC entry 3525 (class 0 OID 27073)
-- Dependencies: 238
-- Data for Name: orderhistory; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.orderhistory (orderhistoryid, orderid, userid, orderdate, totalamount) VALUES (1, 1, 1, '2023-10-01 10:00:00', '1 999,98 ₽');
INSERT INTO public.orderhistory (orderhistoryid, orderid, userid, orderdate, totalamount) VALUES (2, 2, 2, '2023-10-02 11:00:00', '999,99 ₽');
INSERT INTO public.orderhistory (orderhistoryid, orderid, userid, orderdate, totalamount) VALUES (3, 3, 3, '2023-10-03 12:00:00', '499,99 ₽');
INSERT INTO public.orderhistory (orderhistoryid, orderid, userid, orderdate, totalamount) VALUES (4, 4, 4, '2023-10-04 13:00:00', '149,99 ₽');
INSERT INTO public.orderhistory (orderhistoryid, orderid, userid, orderdate, totalamount) VALUES (5, 5, 5, '2023-10-05 14:00:00', '249,99 ₽');
INSERT INTO public.orderhistory (orderhistoryid, orderid, userid, orderdate, totalamount) VALUES (6, 6, 6, '2023-10-06 15:00:00', '1 299,99 ₽');
INSERT INTO public.orderhistory (orderhistoryid, orderid, userid, orderdate, totalamount) VALUES (7, 7, 7, '2023-10-07 16:00:00', '699,99 ₽');
INSERT INTO public.orderhistory (orderhistoryid, orderid, userid, orderdate, totalamount) VALUES (8, 8, 8, '2023-10-08 17:00:00', '149,99 ₽');
INSERT INTO public.orderhistory (orderhistoryid, orderid, userid, orderdate, totalamount) VALUES (9, 9, 9, '2023-10-09 18:00:00', '249,99 ₽');
INSERT INTO public.orderhistory (orderhistoryid, orderid, userid, orderdate, totalamount) VALUES (10, 10, 10, '2023-10-10 19:00:00', '199,99 ₽');


--
-- TOC entry 3517 (class 0 OID 27007)
-- Dependencies: 230
-- Data for Name: orderitems; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.orderitems (orderitemid, orderid, productid, quantity, price) VALUES (1, 1, 1, 2, '999,99 ₽');
INSERT INTO public.orderitems (orderitemid, orderid, productid, quantity, price) VALUES (2, 1, 2, 1, '499,99 ₽');
INSERT INTO public.orderitems (orderitemid, orderid, productid, quantity, price) VALUES (3, 2, 3, 3, '99,99 ₽');
INSERT INTO public.orderitems (orderitemid, orderid, productid, quantity, price) VALUES (4, 3, 4, 1, '1 499,99 ₽');
INSERT INTO public.orderitems (orderitemid, orderid, productid, quantity, price) VALUES (5, 4, 5, 5, '29,99 ₽');
INSERT INTO public.orderitems (orderitemid, orderid, productid, quantity, price) VALUES (6, 5, 6, 2, '149,99 ₽');
INSERT INTO public.orderitems (orderitemid, orderid, productid, quantity, price) VALUES (7, 6, 7, 1, '249,99 ₽');
INSERT INTO public.orderitems (orderitemid, orderid, productid, quantity, price) VALUES (8, 7, 8, 1, '1 299,99 ₽');
INSERT INTO public.orderitems (orderitemid, orderid, productid, quantity, price) VALUES (9, 8, 9, 1, '699,99 ₽');
INSERT INTO public.orderitems (orderitemid, orderid, productid, quantity, price) VALUES (10, 9, 10, 2, '149,99 ₽');
INSERT INTO public.orderitems (orderitemid, orderid, productid, quantity, price) VALUES (11, 10, 1, 1, '999,99 ₽');


--
-- TOC entry 3515 (class 0 OID 26985)
-- Dependencies: 228
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.orders (orderid, userid, orderdate, totalamount, deliverymethodid, paymentmethodid) VALUES (1, 1, '2023-10-01 10:00:00', '1 999,98 ₽', 1, 1);
INSERT INTO public.orders (orderid, userid, orderdate, totalamount, deliverymethodid, paymentmethodid) VALUES (2, 2, '2023-10-02 11:00:00', '999,99 ₽', 2, 2);
INSERT INTO public.orders (orderid, userid, orderdate, totalamount, deliverymethodid, paymentmethodid) VALUES (3, 3, '2023-10-03 12:00:00', '499,99 ₽', 3, 3);
INSERT INTO public.orders (orderid, userid, orderdate, totalamount, deliverymethodid, paymentmethodid) VALUES (4, 4, '2023-10-04 13:00:00', '149,99 ₽', 4, 4);
INSERT INTO public.orders (orderid, userid, orderdate, totalamount, deliverymethodid, paymentmethodid) VALUES (5, 5, '2023-10-05 14:00:00', '249,99 ₽', 5, 5);
INSERT INTO public.orders (orderid, userid, orderdate, totalamount, deliverymethodid, paymentmethodid) VALUES (6, 6, '2023-10-06 15:00:00', '1 299,99 ₽', 6, 6);
INSERT INTO public.orders (orderid, userid, orderdate, totalamount, deliverymethodid, paymentmethodid) VALUES (7, 7, '2023-10-07 16:00:00', '699,99 ₽', 7, 7);
INSERT INTO public.orders (orderid, userid, orderdate, totalamount, deliverymethodid, paymentmethodid) VALUES (8, 8, '2023-10-08 17:00:00', '149,99 ₽', 8, 8);
INSERT INTO public.orders (orderid, userid, orderdate, totalamount, deliverymethodid, paymentmethodid) VALUES (9, 9, '2023-10-09 18:00:00', '249,99 ₽', 9, 9);
INSERT INTO public.orders (orderid, userid, orderdate, totalamount, deliverymethodid, paymentmethodid) VALUES (10, 10, '2023-10-10 19:00:00', '199,99 ₽', 10, 10);


--
-- TOC entry 3511 (class 0 OID 26955)
-- Dependencies: 224
-- Data for Name: paymentmethods; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.paymentmethods (paymentmethodid, methodname, description) VALUES (1, 'Credit Card', 'Pay with your credit card');
INSERT INTO public.paymentmethods (paymentmethodid, methodname, description) VALUES (2, 'Debit Card', 'Pay with your debit card');
INSERT INTO public.paymentmethods (paymentmethodid, methodname, description) VALUES (3, 'PayPal', 'Pay with PayPal');
INSERT INTO public.paymentmethods (paymentmethodid, methodname, description) VALUES (4, 'Cash on Delivery', 'Pay cash upon delivery');
INSERT INTO public.paymentmethods (paymentmethodid, methodname, description) VALUES (5, 'Bank Transfer', 'Pay via bank transfer');
INSERT INTO public.paymentmethods (paymentmethodid, methodname, description) VALUES (6, 'Apple Pay', 'Pay with Apple Pay');
INSERT INTO public.paymentmethods (paymentmethodid, methodname, description) VALUES (7, 'Google Pay', 'Pay with Google Pay');
INSERT INTO public.paymentmethods (paymentmethodid, methodname, description) VALUES (8, 'Cryptocurrency', 'Pay with cryptocurrency');
INSERT INTO public.paymentmethods (paymentmethodid, methodname, description) VALUES (9, 'Gift Card', 'Pay with a gift card');
INSERT INTO public.paymentmethods (paymentmethodid, methodname, description) VALUES (10, 'Store Credit', 'Pay with store credit');


--
-- TOC entry 3513 (class 0 OID 26964)
-- Dependencies: 226
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.products (productid, productname, sku, price, stockquantity, description, mainphoto, additionalphoto1, additionalphoto2, additionalphoto3, additionalphoto4, additionalphoto5, additionalphoto6, categoryid, ishit, isnew, discountpercentage, promotionid) VALUES (1, 'Laptop A', 'SKU001', '999,99 ₽', 50, 'High performance laptop', 'main_photo1.jpg', 'add_photo1.jpg', 'add_photo2.jpg', 'add_photo3.jpg', 'add_photo4.jpg', 'add_photo5.jpg', 'add_photo6.jpg', 3, true, true, 10.00, 1);
INSERT INTO public.products (productid, productname, sku, price, stockquantity, description, mainphoto, additionalphoto1, additionalphoto2, additionalphoto3, additionalphoto4, additionalphoto5, additionalphoto6, categoryid, ishit, isnew, discountpercentage, promotionid) VALUES (2, 'Smartphone B', 'SKU002', '499,99 ₽', 100, 'Latest smartphone model', 'main_photo2.jpg', 'add_photo1.jpg', 'add_photo2.jpg', 'add_photo3.jpg', 'add_photo4.jpg', 'add_photo5.jpg', 'add_photo6.jpg', 5, false, true, 5.00, 2);
INSERT INTO public.products (productid, productname, sku, price, stockquantity, description, mainphoto, additionalphoto1, additionalphoto2, additionalphoto3, additionalphoto4, additionalphoto5, additionalphoto6, categoryid, ishit, isnew, discountpercentage, promotionid) VALUES (3, 'Headphones C', 'SKU003', '99,99 ₽', 200, 'Wireless headphones', 'main_photo3.jpg', 'add_photo1.jpg', 'add_photo2.jpg', 'add_photo3.jpg', 'add_photo4.jpg', 'add_photo5.jpg', 'add_photo6.jpg', 7, true, false, 15.00, 3);
INSERT INTO public.products (productid, productname, sku, price, stockquantity, description, mainphoto, additionalphoto1, additionalphoto2, additionalphoto3, additionalphoto4, additionalphoto5, additionalphoto6, categoryid, ishit, isnew, discountpercentage, promotionid) VALUES (4, 'Desktop D', 'SKU004', '1 499,99 ₽', 30, 'Powerful desktop computer', 'main_photo4.jpg', 'add_photo1.jpg', 'add_photo2.jpg', 'add_photo3.jpg', 'add_photo4.jpg', 'add_photo5.jpg', 'add_photo6.jpg', 4, false, false, 20.00, 4);
INSERT INTO public.products (productid, productname, sku, price, stockquantity, description, mainphoto, additionalphoto1, additionalphoto2, additionalphoto3, additionalphoto4, additionalphoto5, additionalphoto6, categoryid, ishit, isnew, discountpercentage, promotionid) VALUES (5, 'Charger E', 'SKU005', '29,99 ₽', 500, 'Fast charging charger', 'main_photo5.jpg', 'add_photo1.jpg', 'add_photo2.jpg', 'add_photo3.jpg', 'add_photo4.jpg', 'add_photo5.jpg', 'add_photo6.jpg', 8, false, true, 10.00, 5);
INSERT INTO public.products (productid, productname, sku, price, stockquantity, description, mainphoto, additionalphoto1, additionalphoto2, additionalphoto3, additionalphoto4, additionalphoto5, additionalphoto6, categoryid, ishit, isnew, discountpercentage, promotionid) VALUES (6, 'Blender F', 'SKU006', '149,99 ₽', 150, 'High-speed blender', 'main_photo6.jpg', 'add_photo1.jpg', 'add_photo2.jpg', 'add_photo3.jpg', 'add_photo4.jpg', 'add_photo5.jpg', 'add_photo6.jpg', 10, true, false, 25.00, 6);
INSERT INTO public.products (productid, productname, sku, price, stockquantity, description, mainphoto, additionalphoto1, additionalphoto2, additionalphoto3, additionalphoto4, additionalphoto5, additionalphoto6, categoryid, ishit, isnew, discountpercentage, promotionid) VALUES (7, 'Vacuum G', 'SKU007', '249,99 ₽', 100, 'Powerful vacuum cleaner', 'main_photo7.jpg', 'add_photo1.jpg', 'add_photo2.jpg', 'add_photo3.jpg', 'add_photo4.jpg', 'add_photo5.jpg', 'add_photo6.jpg', 11, false, true, 15.00, 7);
INSERT INTO public.products (productid, productname, sku, price, stockquantity, description, mainphoto, additionalphoto1, additionalphoto2, additionalphoto3, additionalphoto4, additionalphoto5, additionalphoto6, categoryid, ishit, isnew, discountpercentage, promotionid) VALUES (8, 'Laptop H', 'SKU008', '1 299,99 ₽', 40, 'Ultra-thin laptop', 'main_photo8.jpg', 'add_photo1.jpg', 'add_photo2.jpg', 'add_photo3.jpg', 'add_photo4.jpg', 'add_photo5.jpg', 'add_photo6.jpg', 3, true, false, 10.00, 8);
INSERT INTO public.products (productid, productname, sku, price, stockquantity, description, mainphoto, additionalphoto1, additionalphoto2, additionalphoto3, additionalphoto4, additionalphoto5, additionalphoto6, categoryid, ishit, isnew, discountpercentage, promotionid) VALUES (9, 'Smartphone I', 'SKU009', '699,99 ₽', 80, 'Premium smartphone', 'main_photo9.jpg', 'add_photo1.jpg', 'add_photo2.jpg', 'add_photo3.jpg', 'add_photo4.jpg', 'add_photo5.jpg', 'add_photo6.jpg', 5, false, true, 5.00, 9);
INSERT INTO public.products (productid, productname, sku, price, stockquantity, description, mainphoto, additionalphoto1, additionalphoto2, additionalphoto3, additionalphoto4, additionalphoto5, additionalphoto6, categoryid, ishit, isnew, discountpercentage, promotionid) VALUES (10, 'Headphones J', 'SKU010', '149,99 ₽', 180, 'Noise-cancelling headphones', 'main_photo10.jpg', 'add_photo1.jpg', 'add_photo2.jpg', 'add_photo3.jpg', 'add_photo4.jpg', 'add_photo5.jpg', 'add_photo6.jpg', 7, true, false, 15.00, 10);


--
-- TOC entry 3507 (class 0 OID 26937)
-- Dependencies: 220
-- Data for Name: promotions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.promotions (promotionid, promotionname, description, startdate, enddate) VALUES (1, 'Black Friday', 'Big discounts on all electronics', '2023-11-24', '2023-11-27');
INSERT INTO public.promotions (promotionid, promotionname, description, startdate, enddate) VALUES (2, 'Cyber Monday', 'Special deals on computers and laptops', '2023-11-28', '2023-11-28');
INSERT INTO public.promotions (promotionid, promotionname, description, startdate, enddate) VALUES (3, 'Christmas Sale', 'Holiday discounts on home appliances', '2023-12-20', '2023-12-25');
INSERT INTO public.promotions (promotionid, promotionname, description, startdate, enddate) VALUES (4, 'New Year Sale', 'Start the new year with new gadgets', '2023-12-26', '2024-01-01');
INSERT INTO public.promotions (promotionid, promotionname, description, startdate, enddate) VALUES (5, 'Summer Sale', 'Beat the heat with cool deals', '2023-07-01', '2023-07-31');
INSERT INTO public.promotions (promotionid, promotionname, description, startdate, enddate) VALUES (6, 'Back to School', 'Get ready for school with great deals', '2023-08-01', '2023-08-31');
INSERT INTO public.promotions (promotionid, promotionname, description, startdate, enddate) VALUES (7, 'Mother`s Day', 'Special gifts for mom', '2023-05-01', '2023-05-14');
INSERT INTO public.promotions (promotionid, promotionname, description, startdate, enddate) VALUES (8, 'Father`s Day', 'Great deals for dad', '2023-06-01', '2023-06-18');
INSERT INTO public.promotions (promotionid, promotionname, description, startdate, enddate) VALUES (9, 'Valentine`s Day', 'Spread love with special discounts', '2023-02-01', '2023-02-14');
INSERT INTO public.promotions (promotionid, promotionname, description, startdate, enddate) VALUES (10, 'Easter Sale', 'Hop into spring with amazing deals', '2023-04-01', '2023-04-16');


--
-- TOC entry 3519 (class 0 OID 27024)
-- Dependencies: 232
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.reviews (reviewid, productid, userid, reviewtext, reviewdate, isapproved) VALUES (1, 1, 1, 'Great laptop!', '2023-10-01 10:00:00', true);
INSERT INTO public.reviews (reviewid, productid, userid, reviewtext, reviewdate, isapproved) VALUES (2, 2, 2, 'Awesome smartphone!', '2023-10-02 11:00:00', true);
INSERT INTO public.reviews (reviewid, productid, userid, reviewtext, reviewdate, isapproved) VALUES (3, 3, 3, 'Comfortable headphones.', '2023-10-03 12:00:00', true);
INSERT INTO public.reviews (reviewid, productid, userid, reviewtext, reviewdate, isapproved) VALUES (4, 4, 4, 'Powerful desktop.', '2023-10-04 13:00:00', true);
INSERT INTO public.reviews (reviewid, productid, userid, reviewtext, reviewdate, isapproved) VALUES (5, 5, 5, 'Fast charger.', '2023-10-05 14:00:00', true);
INSERT INTO public.reviews (reviewid, productid, userid, reviewtext, reviewdate, isapproved) VALUES (6, 6, 6, 'Great blender!', '2023-10-06 15:00:00', true);
INSERT INTO public.reviews (reviewid, productid, userid, reviewtext, reviewdate, isapproved) VALUES (7, 7, 7, 'Powerful vacuum.', '2023-10-07 16:00:00', true);
INSERT INTO public.reviews (reviewid, productid, userid, reviewtext, reviewdate, isapproved) VALUES (8, 8, 8, 'Ultra-thin laptop.', '2023-10-08 17:00:00', true);
INSERT INTO public.reviews (reviewid, productid, userid, reviewtext, reviewdate, isapproved) VALUES (9, 9, 9, 'Premium smartphone.', '2023-10-09 18:00:00', true);
INSERT INTO public.reviews (reviewid, productid, userid, reviewtext, reviewdate, isapproved) VALUES (10, 10, 10, 'Noise-cancelling headphones.', '2023-10-10 19:00:00', true);


--
-- TOC entry 3531 (class 0 OID 27119)
-- Dependencies: 244
-- Data for Name: saleproducts; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.saleproducts (saleproductid, productid, discountpercentage, startdate, enddate) VALUES (1, 1, 10.00, '2023-11-01', '2023-11-30');
INSERT INTO public.saleproducts (saleproductid, productid, discountpercentage, startdate, enddate) VALUES (2, 2, 5.00, '2023-11-01', '2023-11-30');
INSERT INTO public.saleproducts (saleproductid, productid, discountpercentage, startdate, enddate) VALUES (3, 3, 15.00, '2023-11-01', '2023-11-30');
INSERT INTO public.saleproducts (saleproductid, productid, discountpercentage, startdate, enddate) VALUES (4, 4, 20.00, '2023-11-01', '2023-11-30');
INSERT INTO public.saleproducts (saleproductid, productid, discountpercentage, startdate, enddate) VALUES (5, 5, 10.00, '2023-11-01', '2023-11-30');
INSERT INTO public.saleproducts (saleproductid, productid, discountpercentage, startdate, enddate) VALUES (6, 6, 25.00, '2023-11-01', '2023-11-30');
INSERT INTO public.saleproducts (saleproductid, productid, discountpercentage, startdate, enddate) VALUES (7, 7, 15.00, '2023-11-01', '2023-11-30');
INSERT INTO public.saleproducts (saleproductid, productid, discountpercentage, startdate, enddate) VALUES (8, 8, 10.00, '2023-11-01', '2023-11-30');
INSERT INTO public.saleproducts (saleproductid, productid, discountpercentage, startdate, enddate) VALUES (9, 9, 5.00, '2023-11-01', '2023-11-30');
INSERT INTO public.saleproducts (saleproductid, productid, discountpercentage, startdate, enddate) VALUES (10, 10, 15.00, '2023-11-01', '2023-11-30');


--
-- TOC entry 3503 (class 0 OID 26916)
-- Dependencies: 216
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users (userid, usersurname, username, userpatronymic, password, email, address, phonenumber) VALUES (1, 'Ivanov', 'Ivan', 'Ivanovich', 'password1', 'ivanov1@example.com', '123 Main St', '123-456-7890');
INSERT INTO public.users (userid, usersurname, username, userpatronymic, password, email, address, phonenumber) VALUES (2, 'Petrov', 'Petr', 'Petrovich', 'password2', 'petrov2@example.com', '456 Elm St', '234-567-8901');
INSERT INTO public.users (userid, usersurname, username, userpatronymic, password, email, address, phonenumber) VALUES (3, 'Sidorov', 'Sergey', 'Sidorovich', 'password3', 'sidorov3@example.com', '789 Oak St', '345-678-9012');
INSERT INTO public.users (userid, usersurname, username, userpatronymic, password, email, address, phonenumber) VALUES (4, 'Kuznetsov', 'Kirill', 'Konstantinovich', 'password4', 'kuznetsov4@example.com', '101 Pine St', '456-789-0123');
INSERT INTO public.users (userid, usersurname, username, userpatronymic, password, email, address, phonenumber) VALUES (5, 'Popov', 'Pavel', 'Pavlovich', 'password5', 'popov5@example.com', '202 Cedar St', '567-890-1234');
INSERT INTO public.users (userid, usersurname, username, userpatronymic, password, email, address, phonenumber) VALUES (6, 'Morozov', 'Mark', 'Maratovich', 'password6', 'morozov6@example.com', '303 Maple St', '678-901-2345');
INSERT INTO public.users (userid, usersurname, username, userpatronymic, password, email, address, phonenumber) VALUES (7, 'Smirnov', 'Semyon', 'Semyonovich', 'password7', 'smirnov7@example.com', '404 Birch St', '789-012-3456');
INSERT INTO public.users (userid, usersurname, username, userpatronymic, password, email, address, phonenumber) VALUES (8, 'Kuznetsova', 'Karina', 'Kirillovna', 'password8', 'kuznetsova8@example.com', '505 Spruce St', '890-123-4567');
INSERT INTO public.users (userid, usersurname, username, userpatronymic, password, email, address, phonenumber) VALUES (9, 'Vasiliev', 'Vasily', 'Vasilievich', 'password9', 'vasiliev9@example.com', '606 Fir St', '901-234-5678');
INSERT INTO public.users (userid, usersurname, username, userpatronymic, password, email, address, phonenumber) VALUES (10, 'Sokolov', 'Alexander', 'Sergeevich', 'password10', 'sokolov10@example.com', '707 Pine St', '012-345-6789');


--
-- TOC entry 3552 (class 0 OID 0)
-- Dependencies: 233
-- Name: cart_cartid_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cart_cartid_seq', 10, true);


--
-- TOC entry 3553 (class 0 OID 0)
-- Dependencies: 235
-- Name: cartitems_cartitemid_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cartitems_cartitemid_seq', 10, true);


--
-- TOC entry 3554 (class 0 OID 0)
-- Dependencies: 217
-- Name: categories_categoryid_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.categories_categoryid_seq', 11, true);


--
-- TOC entry 3555 (class 0 OID 0)
-- Dependencies: 221
-- Name: deliverymethods_deliverymethodid_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.deliverymethods_deliverymethodid_seq', 10, true);


--
-- TOC entry 3556 (class 0 OID 0)
-- Dependencies: 239
-- Name: discounts_discountid_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.discounts_discountid_seq', 10, true);


--
-- TOC entry 3557 (class 0 OID 0)
-- Dependencies: 241
-- Name: hitproducts_hitproductid_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.hitproducts_hitproductid_seq', 10, true);


--
-- TOC entry 3558 (class 0 OID 0)
-- Dependencies: 237
-- Name: orderhistory_orderhistoryid_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.orderhistory_orderhistoryid_seq', 10, true);


--
-- TOC entry 3559 (class 0 OID 0)
-- Dependencies: 229
-- Name: orderitems_orderitemid_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.orderitems_orderitemid_seq', 11, true);


--
-- TOC entry 3560 (class 0 OID 0)
-- Dependencies: 227
-- Name: orders_orderid_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.orders_orderid_seq', 10, true);


--
-- TOC entry 3561 (class 0 OID 0)
-- Dependencies: 223
-- Name: paymentmethods_paymentmethodid_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.paymentmethods_paymentmethodid_seq', 10, true);


--
-- TOC entry 3562 (class 0 OID 0)
-- Dependencies: 225
-- Name: products_productid_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_productid_seq', 10, true);


--
-- TOC entry 3563 (class 0 OID 0)
-- Dependencies: 219
-- Name: promotions_promotionid_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.promotions_promotionid_seq', 10, true);


--
-- TOC entry 3564 (class 0 OID 0)
-- Dependencies: 231
-- Name: reviews_reviewid_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.reviews_reviewid_seq', 10, true);


--
-- TOC entry 3565 (class 0 OID 0)
-- Dependencies: 243
-- Name: saleproducts_saleproductid_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.saleproducts_saleproductid_seq', 10, true);


--
-- TOC entry 3566 (class 0 OID 0)
-- Dependencies: 215
-- Name: users_userid_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_userid_seq', 10, true);


--
-- TOC entry 3329 (class 2606 OID 27049)
-- Name: cart cart_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pkey PRIMARY KEY (cartid);


--
-- TOC entry 3331 (class 2606 OID 27061)
-- Name: cartitems cartitems_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cartitems
    ADD CONSTRAINT cartitems_pkey PRIMARY KEY (cartitemid);


--
-- TOC entry 3313 (class 2606 OID 26930)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (categoryid);


--
-- TOC entry 3317 (class 2606 OID 26953)
-- Name: deliverymethods deliverymethods_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.deliverymethods
    ADD CONSTRAINT deliverymethods_pkey PRIMARY KEY (deliverymethodid);


--
-- TOC entry 3335 (class 2606 OID 27095)
-- Name: discounts discounts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.discounts
    ADD CONSTRAINT discounts_pkey PRIMARY KEY (discountid);


--
-- TOC entry 3337 (class 2606 OID 27107)
-- Name: hitproducts hitproducts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hitproducts
    ADD CONSTRAINT hitproducts_pkey PRIMARY KEY (hitproductid);


--
-- TOC entry 3333 (class 2606 OID 27078)
-- Name: orderhistory orderhistory_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orderhistory
    ADD CONSTRAINT orderhistory_pkey PRIMARY KEY (orderhistoryid);


--
-- TOC entry 3325 (class 2606 OID 27012)
-- Name: orderitems orderitems_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orderitems
    ADD CONSTRAINT orderitems_pkey PRIMARY KEY (orderitemid);


--
-- TOC entry 3323 (class 2606 OID 26990)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (orderid);


--
-- TOC entry 3319 (class 2606 OID 26962)
-- Name: paymentmethods paymentmethods_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.paymentmethods
    ADD CONSTRAINT paymentmethods_pkey PRIMARY KEY (paymentmethodid);


--
-- TOC entry 3321 (class 2606 OID 26973)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (productid);


--
-- TOC entry 3315 (class 2606 OID 26944)
-- Name: promotions promotions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.promotions
    ADD CONSTRAINT promotions_pkey PRIMARY KEY (promotionid);


--
-- TOC entry 3327 (class 2606 OID 27032)
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (reviewid);


--
-- TOC entry 3339 (class 2606 OID 27124)
-- Name: saleproducts saleproducts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.saleproducts
    ADD CONSTRAINT saleproducts_pkey PRIMARY KEY (saleproductid);


--
-- TOC entry 3311 (class 2606 OID 26923)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (userid);


--
-- TOC entry 3350 (class 2606 OID 27050)
-- Name: cart cart_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(userid);


--
-- TOC entry 3351 (class 2606 OID 27062)
-- Name: cartitems cartitems_cartid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cartitems
    ADD CONSTRAINT cartitems_cartid_fkey FOREIGN KEY (cartid) REFERENCES public.cart(cartid);


--
-- TOC entry 3352 (class 2606 OID 27067)
-- Name: cartitems cartitems_productid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cartitems
    ADD CONSTRAINT cartitems_productid_fkey FOREIGN KEY (productid) REFERENCES public.products(productid);


--
-- TOC entry 3340 (class 2606 OID 26931)
-- Name: categories categories_parentcategoryid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_parentcategoryid_fkey FOREIGN KEY (parentcategoryid) REFERENCES public.categories(categoryid);


--
-- TOC entry 3355 (class 2606 OID 27096)
-- Name: discounts discounts_productid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.discounts
    ADD CONSTRAINT discounts_productid_fkey FOREIGN KEY (productid) REFERENCES public.products(productid);


--
-- TOC entry 3356 (class 2606 OID 27113)
-- Name: hitproducts hitproducts_categoryid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hitproducts
    ADD CONSTRAINT hitproducts_categoryid_fkey FOREIGN KEY (categoryid) REFERENCES public.categories(categoryid);


--
-- TOC entry 3357 (class 2606 OID 27108)
-- Name: hitproducts hitproducts_productid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hitproducts
    ADD CONSTRAINT hitproducts_productid_fkey FOREIGN KEY (productid) REFERENCES public.products(productid);


--
-- TOC entry 3353 (class 2606 OID 27079)
-- Name: orderhistory orderhistory_orderid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orderhistory
    ADD CONSTRAINT orderhistory_orderid_fkey FOREIGN KEY (orderid) REFERENCES public.orders(orderid);


--
-- TOC entry 3354 (class 2606 OID 27084)
-- Name: orderhistory orderhistory_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orderhistory
    ADD CONSTRAINT orderhistory_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(userid);


--
-- TOC entry 3346 (class 2606 OID 27013)
-- Name: orderitems orderitems_orderid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orderitems
    ADD CONSTRAINT orderitems_orderid_fkey FOREIGN KEY (orderid) REFERENCES public.orders(orderid);


--
-- TOC entry 3347 (class 2606 OID 27018)
-- Name: orderitems orderitems_productid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orderitems
    ADD CONSTRAINT orderitems_productid_fkey FOREIGN KEY (productid) REFERENCES public.products(productid);


--
-- TOC entry 3343 (class 2606 OID 26996)
-- Name: orders orders_deliverymethodid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_deliverymethodid_fkey FOREIGN KEY (deliverymethodid) REFERENCES public.deliverymethods(deliverymethodid);


--
-- TOC entry 3344 (class 2606 OID 27001)
-- Name: orders orders_paymentmethodid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_paymentmethodid_fkey FOREIGN KEY (paymentmethodid) REFERENCES public.paymentmethods(paymentmethodid);


--
-- TOC entry 3345 (class 2606 OID 26991)
-- Name: orders orders_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(userid);


--
-- TOC entry 3341 (class 2606 OID 26974)
-- Name: products products_categoryid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_categoryid_fkey FOREIGN KEY (categoryid) REFERENCES public.categories(categoryid);


--
-- TOC entry 3342 (class 2606 OID 26979)
-- Name: products products_promotionid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_promotionid_fkey FOREIGN KEY (promotionid) REFERENCES public.promotions(promotionid);


--
-- TOC entry 3348 (class 2606 OID 27033)
-- Name: reviews reviews_productid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_productid_fkey FOREIGN KEY (productid) REFERENCES public.products(productid);


--
-- TOC entry 3349 (class 2606 OID 27038)
-- Name: reviews reviews_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(userid);


--
-- TOC entry 3358 (class 2606 OID 27125)
-- Name: saleproducts saleproducts_productid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.saleproducts
    ADD CONSTRAINT saleproducts_productid_fkey FOREIGN KEY (productid) REFERENCES public.products(productid);


-- Completed on 2024-12-14 14:22:27 +07

--
-- PostgreSQL database dump complete
--

