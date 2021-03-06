PGDMP                         y            db_music_lessons    13.2    13.2     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16394    db_music_lessons    DATABASE     o   CREATE DATABASE db_music_lessons WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Colombia.1252';
     DROP DATABASE db_music_lessons;
                postgres    false            �            1259    16406 
   tbl_lesson    TABLE     �   CREATE TABLE public.tbl_lesson (
    id numeric NOT NULL,
    title character(250) NOT NULL,
    description character(250) NOT NULL
);
    DROP TABLE public.tbl_lesson;
       public         heap    dbuser    false            �            1259    16401    tbl_user    TABLE     i   CREATE TABLE public.tbl_user (
    email character(50) NOT NULL,
    password character(150) NOT NULL
);
    DROP TABLE public.tbl_user;
       public         heap    dbuser    false            �            1259    16548    tbl_user_lessons    TABLE     �   CREATE TABLE public.tbl_user_lessons (
    id_lesson numeric NOT NULL,
    email_user character(50) NOT NULL,
    status character(10)
);
 $   DROP TABLE public.tbl_user_lessons;
       public         heap    dbuser    false            �            1259    16615    tbl_user_notes    TABLE     �   CREATE TABLE public.tbl_user_notes (
    id_note bigint NOT NULL,
    id_lesson numeric NOT NULL,
    email_user character(50) NOT NULL,
    note character(250)
);
 "   DROP TABLE public.tbl_user_notes;
       public         heap    dbuser    false            �            1259    16613    tbl_user_notes_id_note_seq    SEQUENCE     �   CREATE SEQUENCE public.tbl_user_notes_id_note_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.tbl_user_notes_id_note_seq;
       public          dbuser    false    206            �           0    0    tbl_user_notes_id_note_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.tbl_user_notes_id_note_seq OWNED BY public.tbl_user_notes.id_note;
          public          dbuser    false    205            �            1259    16586    test    TABLE     O   CREATE TABLE public.test (
    id bigint NOT NULL,
    nombre character(19)
);
    DROP TABLE public.test;
       public         heap    dbuser    false            �            1259    16584    test_id_seq    SEQUENCE     t   CREATE SEQUENCE public.test_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.test_id_seq;
       public          dbuser    false    204            �           0    0    test_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.test_id_seq OWNED BY public.test.id;
          public          dbuser    false    203            8           2604    16618    tbl_user_notes id_note    DEFAULT     �   ALTER TABLE ONLY public.tbl_user_notes ALTER COLUMN id_note SET DEFAULT nextval('public.tbl_user_notes_id_note_seq'::regclass);
 E   ALTER TABLE public.tbl_user_notes ALTER COLUMN id_note DROP DEFAULT;
       public          dbuser    false    205    206    206            7           2604    16589    test id    DEFAULT     b   ALTER TABLE ONLY public.test ALTER COLUMN id SET DEFAULT nextval('public.test_id_seq'::regclass);
 6   ALTER TABLE public.test ALTER COLUMN id DROP DEFAULT;
       public          dbuser    false    203    204    204            �          0    16406 
   tbl_lesson 
   TABLE DATA                 public          dbuser    false    201   W!       �          0    16401    tbl_user 
   TABLE DATA                 public          dbuser    false    200   �!       �          0    16548    tbl_user_lessons 
   TABLE DATA                 public          dbuser    false    202   _"       �          0    16615    tbl_user_notes 
   TABLE DATA                 public          dbuser    false    206   �"       �          0    16586    test 
   TABLE DATA                 public          dbuser    false    204   �"       �           0    0    tbl_user_notes_id_note_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.tbl_user_notes_id_note_seq', 4, true);
          public          dbuser    false    205            �           0    0    test_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.test_id_seq', 1, true);
          public          dbuser    false    203            <           2606    16413    tbl_lesson tbl_lesson_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.tbl_lesson
    ADD CONSTRAINT tbl_lesson_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.tbl_lesson DROP CONSTRAINT tbl_lesson_pkey;
       public            dbuser    false    201            >           2606    16565 &   tbl_user_lessons tbl_user_lessons_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY public.tbl_user_lessons
    ADD CONSTRAINT tbl_user_lessons_pkey PRIMARY KEY (id_lesson, email_user);
 P   ALTER TABLE ONLY public.tbl_user_lessons DROP CONSTRAINT tbl_user_lessons_pkey;
       public            dbuser    false    202    202            B           2606    16623 "   tbl_user_notes tbl_user_notes_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.tbl_user_notes
    ADD CONSTRAINT tbl_user_notes_pkey PRIMARY KEY (id_note);
 L   ALTER TABLE ONLY public.tbl_user_notes DROP CONSTRAINT tbl_user_notes_pkey;
       public            dbuser    false    206            :           2606    16405    tbl_user tbl_user_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.tbl_user
    ADD CONSTRAINT tbl_user_pkey PRIMARY KEY (email);
 @   ALTER TABLE ONLY public.tbl_user DROP CONSTRAINT tbl_user_pkey;
       public            dbuser    false    200            @           2606    16591    test test_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.test
    ADD CONSTRAINT test_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.test DROP CONSTRAINT test_pkey;
       public            dbuser    false    204            D           2606    16559 1   tbl_user_lessons tbl_user_lessons_email_user_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tbl_user_lessons
    ADD CONSTRAINT tbl_user_lessons_email_user_fkey FOREIGN KEY (email_user) REFERENCES public.tbl_user(email);
 [   ALTER TABLE ONLY public.tbl_user_lessons DROP CONSTRAINT tbl_user_lessons_email_user_fkey;
       public          dbuser    false    2874    202    200            C           2606    16554 0   tbl_user_lessons tbl_user_lessons_id_lesson_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tbl_user_lessons
    ADD CONSTRAINT tbl_user_lessons_id_lesson_fkey FOREIGN KEY (id_lesson) REFERENCES public.tbl_lesson(id);
 Z   ALTER TABLE ONLY public.tbl_user_lessons DROP CONSTRAINT tbl_user_lessons_id_lesson_fkey;
       public          dbuser    false    201    202    2876            F           2606    16629 -   tbl_user_notes tbl_user_notes_email_user_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tbl_user_notes
    ADD CONSTRAINT tbl_user_notes_email_user_fkey FOREIGN KEY (email_user) REFERENCES public.tbl_user(email);
 W   ALTER TABLE ONLY public.tbl_user_notes DROP CONSTRAINT tbl_user_notes_email_user_fkey;
       public          dbuser    false    2874    206    200            E           2606    16624 ,   tbl_user_notes tbl_user_notes_id_lesson_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tbl_user_notes
    ADD CONSTRAINT tbl_user_notes_id_lesson_fkey FOREIGN KEY (id_lesson) REFERENCES public.tbl_lesson(id);
 V   ALTER TABLE ONLY public.tbl_user_notes DROP CONSTRAINT tbl_user_notes_id_lesson_fkey;
       public          dbuser    false    201    2876    206            �   w   x���v
Q���W((M��L�+Iʉ�I-.��Ss�	uV�0�QP�--�LV�H�*� ��}bR~i�����5�'Q��=����	0R���=ѩ�=����	0R���=0�pq v=�      �   q   x���v
Q���W((M��L�+Iʉ/-N-Rs�	uV�P��s3s���suuC#c"���kZsy�i#�=mjfnAs?�H�1ɞ��073��'H Osq |g~B      �   p   x���v
Q���W((M��L�+Iʉ/-N-��I-.��+Vs�	uV�0�QPI:��&f��%��*�@]�y)�y� ��5�'	vB�4 ;I��g�BQjYfj9�N.. .cZ�      �   
   x���          �   9   x���v
Q���W((M��L�+I-.Qs�	uV�0�QPO�LM�W@��\\\ "c
     