ALTER TABLE ONLY public.product_reviews
    DROP CONSTRAINT product_reviews_product_id_fkey;

ALTER TABLE ONLY public.product_reviews
    DROP CONSTRAINT product_reviews_user_id_fkey;

DROP TABLE IF EXISTS public.product_reviews;

DROP SEQUENCE IF EXISTS public.product_reviews_id_seq;