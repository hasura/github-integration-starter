ALTER TABLE ONLY public.orders
    DROP CONSTRAINT orders_product_id_fkey;

ALTER TABLE ONLY public.orders
    DROP CONSTRAINT orders_user_id_fkey;

ALTER TABLE ONLY public.orders
    DROP CONSTRAINT orders_pkey;

ALTER TABLE ONLY public.products
    DROP CONSTRAINT products_pkey;

ALTER TABLE ONLY public.users
    DROP CONSTRAINT users_pkey;

DROP TABLE IF EXISTS public.orders;

DROP TABLE IF EXISTS public.products;

DROP TABLE IF EXISTS public.users;

DROP SEQUENCE IF EXISTS public.orders_id_seq;

DROP SEQUENCE IF EXISTS public.products_id_seq;

DROP SEQUENCE IF EXISTS public.users_id_seq;
