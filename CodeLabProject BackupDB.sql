PGDMP         8                x           StudentLibrary    10.13    10.13                 0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false                       1262    16400    StudentLibrary    DATABASE     �   CREATE DATABASE "StudentLibrary" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
     DROP DATABASE "StudentLibrary";
             postgres    false                       0    0    DATABASE "StudentLibrary"    COMMENT     A   COMMENT ON DATABASE "StudentLibrary" IS 'For Code Lab project ';
                  postgres    false    2833                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false                       0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12924    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false                       0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    16501 
   bookdetail    TABLE     �   CREATE TABLE public.bookdetail (
    bookid integer,
    bookdetailid integer NOT NULL,
    genre name,
    publisher name,
    isbn bigint
);
    DROP TABLE public.bookdetail;
       public         postgres    false    3            �            1259    16496    books    TABLE     \   CREATE TABLE public.books (
    bookid integer NOT NULL,
    title name,
    author name
);
    DROP TABLE public.books;
       public         postgres    false    3            �            1259    16517    checkout    TABLE     �   CREATE TABLE public.checkout (
    checkoutid integer NOT NULL,
    studentid integer,
    bookid integer,
    checkoutdate date
);
    DROP TABLE public.checkout;
       public         postgres    false    3            �            1259    16534    returns    TABLE     �   CREATE TABLE public.returns (
    returnid integer NOT NULL,
    checkoutid integer,
    returndate date,
    checkindate date
);
    DROP TABLE public.returns;
       public         postgres    false    3            �            1259    16512    students    TABLE     �   CREATE TABLE public.students (
    studentid integer NOT NULL,
    firstname name,
    lastname name,
    outstandingfee name,
    studentemail name
);
    DROP TABLE public.students;
       public         postgres    false    3                      0    16501 
   bookdetail 
   TABLE DATA               R   COPY public.bookdetail (bookid, bookdetailid, genre, publisher, isbn) FROM stdin;
    public       postgres    false    197   �                 0    16496    books 
   TABLE DATA               6   COPY public.books (bookid, title, author) FROM stdin;
    public       postgres    false    196   �!       
          0    16517    checkout 
   TABLE DATA               O   COPY public.checkout (checkoutid, studentid, bookid, checkoutdate) FROM stdin;
    public       postgres    false    199   n#                 0    16534    returns 
   TABLE DATA               P   COPY public.returns (returnid, checkoutid, returndate, checkindate) FROM stdin;
    public       postgres    false    200   �#       	          0    16512    students 
   TABLE DATA               `   COPY public.students (studentid, firstname, lastname, outstandingfee, studentemail) FROM stdin;
    public       postgres    false    198   .$       �
           2606    16505    bookdetail pk_book-detail 
   CONSTRAINT     c   ALTER TABLE ONLY public.bookdetail
    ADD CONSTRAINT "pk_book-detail" PRIMARY KEY (bookdetailid);
 E   ALTER TABLE ONLY public.bookdetail DROP CONSTRAINT "pk_book-detail";
       public         postgres    false    197            }
           2606    16500    books pk_books 
   CONSTRAINT     P   ALTER TABLE ONLY public.books
    ADD CONSTRAINT pk_books PRIMARY KEY (bookid);
 8   ALTER TABLE ONLY public.books DROP CONSTRAINT pk_books;
       public         postgres    false    196            �
           2606    16521    checkout pk_checkOut 
   CONSTRAINT     \   ALTER TABLE ONLY public.checkout
    ADD CONSTRAINT "pk_checkOut" PRIMARY KEY (checkoutid);
 @   ALTER TABLE ONLY public.checkout DROP CONSTRAINT "pk_checkOut";
       public         postgres    false    199            �
           2606    16538    returns pk_returns 
   CONSTRAINT     V   ALTER TABLE ONLY public.returns
    ADD CONSTRAINT pk_returns PRIMARY KEY (returnid);
 <   ALTER TABLE ONLY public.returns DROP CONSTRAINT pk_returns;
       public         postgres    false    200            �
           2606    16516    students pk_student 
   CONSTRAINT     X   ALTER TABLE ONLY public.students
    ADD CONSTRAINT pk_student PRIMARY KEY (studentid);
 =   ALTER TABLE ONLY public.students DROP CONSTRAINT pk_student;
       public         postgres    false    198            �
           1259    16527    fki_fk_book    INDEX     B   CREATE INDEX fki_fk_book ON public.checkout USING btree (bookid);
    DROP INDEX public.fki_fk_book;
       public         postgres    false    199            ~
           1259    16511    fki_fk_books    INDEX     E   CREATE INDEX fki_fk_books ON public.bookdetail USING btree (bookid);
     DROP INDEX public.fki_fk_books;
       public         postgres    false    197            �
           1259    16544    fki_fk_checkOut    INDEX     K   CREATE INDEX "fki_fk_checkOut" ON public.returns USING btree (checkoutid);
 %   DROP INDEX public."fki_fk_checkOut";
       public         postgres    false    200            �
           1259    16533    fki_fk_student    INDEX     H   CREATE INDEX fki_fk_student ON public.checkout USING btree (studentid);
 "   DROP INDEX public.fki_fk_student;
       public         postgres    false    199            �
           2606    16522    checkout fk_book    FK CONSTRAINT     r   ALTER TABLE ONLY public.checkout
    ADD CONSTRAINT fk_book FOREIGN KEY (bookid) REFERENCES public.books(bookid);
 :   ALTER TABLE ONLY public.checkout DROP CONSTRAINT fk_book;
       public       postgres    false    196    2685    199            �
           2606    16506    bookdetail fk_books    FK CONSTRAINT     u   ALTER TABLE ONLY public.bookdetail
    ADD CONSTRAINT fk_books FOREIGN KEY (bookid) REFERENCES public.books(bookid);
 =   ALTER TABLE ONLY public.bookdetail DROP CONSTRAINT fk_books;
       public       postgres    false    197    2685    196            �
           2606    16539    returns fk_checkOut    FK CONSTRAINT     �   ALTER TABLE ONLY public.returns
    ADD CONSTRAINT "fk_checkOut" FOREIGN KEY (checkoutid) REFERENCES public.checkout(checkoutid);
 ?   ALTER TABLE ONLY public.returns DROP CONSTRAINT "fk_checkOut";
       public       postgres    false    2694    199    200            �
           2606    16528    checkout fk_student    FK CONSTRAINT     ~   ALTER TABLE ONLY public.checkout
    ADD CONSTRAINT fk_student FOREIGN KEY (studentid) REFERENCES public.students(studentid);
 =   ALTER TABLE ONLY public.checkout DROP CONSTRAINT fk_student;
       public       postgres    false    199    2690    198               �  x���Mn�0���S���u�@]5�U7��$D����}ӡ�p)�$�{�7�7���$��8���4� �p��6|C߿S��l�ݵ�$��.<}���#P�)�Z�Br�ŔbZz�r������5��m��8�I��}|t)t��C�iT�+ΐN׶ۜ����|o�j�!ဤ5�l� a���o�`�B���($����H�5�R�B�:�&��x�H�}�ipcw�.�Fȳ$Jp��DY��z�U� u��Φ?.m�0�3J2l5��>=�ua:&�kP��|��}��T"�,(�VQVw��#dM���Ɔ���H5� )t]�6J	(	�y�\N�/��?�n���;��%5Ӭ��uk����8�/1�&�w_CbsZ4R�'֋Y�9hR�}��=.��L�#g��ҭ�hVK|�}q1�� �g�Q	��N��1����9R��B�4j�Q�"�~o���l6� �Ω�         �  x�]R�n�0<��b����G��l��[8�a	�F\��P���������u��r$g83;�r��ː	�ĝ�	~��G�H��ߢ\��^)�L�c��U��3<��O9j�\3֎��Q�~���%4��I�e���2�p=�^P���1�0^�y�XqfJP9#�n����x�u��'�ԣ�:��ӻ��v���~�Az���q����{����E�Ɯq��OGb�U�י����^��d��"y^���\�|��U��7�Q�oP�'YO���x����x���7�a�n��}Ԃt�`=�Rʙr��>�;p�M�Z�<����GH���RK��1��b0bq�}&�y?�uQ�&����N(�NчY�8m?L�qLW8k�x�(ք���(��	s��      
   M   x�U˹�0C���Eu9&�����J�T ���}�H5��1���Λ��E����Km����yx��������gv         S   x�M��	� ��g���r&�St���-�p���hC� :�{��X Tc���P�_�;�)u��DSJ�>`S��\�������^�S�      	   �   x�M��J�@F��<̐��;#�*�B��͘:$��n�����m�^���ٙ�,q-_l���z5����\?7$�\T�/�+�7��(RU��I���I�TB�3�La��4:�t���I�^e�1j���{޼ǹ�(P�����Ӷ���G|R�WY}���M�q+�غtYrtpك3�8n�w��9��'C;���h�FW��Hd��uX����D�01"E��%���'=�`�b%qHߨ(�?��9     