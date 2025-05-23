PGDMP  0        	    	        }            dev_exam    17.4    17.4 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    16408    dev_exam    DATABASE     n   CREATE DATABASE dev_exam WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'fr-FR';
    DROP DATABASE dev_exam;
                     postgres    false            �            1259    16409    e_classe_id_seq    SEQUENCE     x   CREATE SEQUENCE public.e_classe_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.e_classe_id_seq;
       public               postgres    false            �            1259    16410    e_classe    TABLE     �   CREATE TABLE public.e_classe (
    id integer DEFAULT nextval('public.e_classe_id_seq'::regclass) NOT NULL,
    nom character varying(255) NOT NULL
);
    DROP TABLE public.e_classe;
       public         heap r       postgres    false    217            �            1259    16414    e_coefficient_id_seq    SEQUENCE     }   CREATE SEQUENCE public.e_coefficient_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.e_coefficient_id_seq;
       public               postgres    false            �            1259    16415    e_coefficient    TABLE     �   CREATE TABLE public.e_coefficient (
    id integer DEFAULT nextval('public.e_coefficient_id_seq'::regclass) NOT NULL,
    id_matiere integer NOT NULL,
    coefficient integer NOT NULL,
    note_max integer NOT NULL,
    options integer NOT NULL
);
 !   DROP TABLE public.e_coefficient;
       public         heap r       postgres    false    219            �            1259    16419    e_etablissement_id_seq    SEQUENCE        CREATE SEQUENCE public.e_etablissement_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.e_etablissement_id_seq;
       public               postgres    false            �            1259    16420    e_etablissement    TABLE     j  CREATE TABLE public.e_etablissement (
    id integer DEFAULT nextval('public.e_etablissement_id_seq'::regclass) NOT NULL,
    id_liste_centre_examen integer NOT NULL,
    code_etab integer NOT NULL,
    code_def character varying,
    code_etab_def character varying,
    flag_informatise integer,
    sigle character varying(50),
    code_etab_rattache text
);
 #   DROP TABLE public.e_etablissement;
       public         heap r       postgres    false    221            �            1259    16426    e_liste_candidat_id_seq    SEQUENCE     �   CREATE SEQUENCE public.e_liste_candidat_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.e_liste_candidat_id_seq;
       public               postgres    false            �            1259    16427    e_liste_candidat    TABLE     �  CREATE TABLE public.e_liste_candidat (
    id integer DEFAULT nextval('public.e_liste_candidat_id_seq'::regclass) NOT NULL,
    code_dren integer NOT NULL,
    code_cisco integer NOT NULL,
    options integer NOT NULL,
    id_annee_scolaire integer,
    id_etablissement_ecrit integer NOT NULL,
    id_etablissement_origine integer NOT NULL,
    id_etablissement_demande integer,
    id_centre_correction integer,
    id_salle integer,
    id_classe integer,
    id_nationalite integer,
    matricule character varying(255) NOT NULL,
    nom_prenom text NOT NULL,
    sexe character varying(50) NOT NULL,
    adresse text,
    pere text,
    mere text,
    nee_vers integer,
    lieu_naissance character varying(255) NOT NULL,
    date_naissance date,
    observation text,
    flag_verrouillage_inscription integer,
    flag_verrouillage_transcription integer,
    sequence integer,
    code_examen integer NOT NULL
);
 $   DROP TABLE public.e_liste_candidat;
       public         heap r       postgres    false    223            �            1259    16433    e_liste_centre_examen_id_seq    SEQUENCE     �   CREATE SEQUENCE public.e_liste_centre_examen_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.e_liste_centre_examen_id_seq;
       public               postgres    false            �            1259    16434    e_liste_centre_examen    TABLE     �   CREATE TABLE public.e_liste_centre_examen (
    id integer DEFAULT nextval('public.e_liste_centre_examen_id_seq'::regclass) NOT NULL,
    libelle_centre_examen character varying NOT NULL
);
 )   DROP TABLE public.e_liste_centre_examen;
       public         heap r       postgres    false    225            �            1259    16440    e_liste_groupe_examen_id_seq    SEQUENCE     �   CREATE SEQUENCE public.e_liste_groupe_examen_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.e_liste_groupe_examen_id_seq;
       public               postgres    false            �            1259    16441    e_liste_groupe_examen    TABLE     �   CREATE TABLE public.e_liste_groupe_examen (
    id integer DEFAULT nextval('public.e_liste_groupe_examen_id_seq'::regclass) NOT NULL,
    libelle character varying NOT NULL,
    code_examen character varying
);
 )   DROP TABLE public.e_liste_groupe_examen;
       public         heap r       postgres    false    227            �            1259    16447    e_liste_nationalite_id_seq    SEQUENCE     �   CREATE SEQUENCE public.e_liste_nationalite_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.e_liste_nationalite_id_seq;
       public               postgres    false            �            1259    16448    e_liste_nationalite    TABLE     �   CREATE TABLE public.e_liste_nationalite (
    id integer DEFAULT nextval('public.e_liste_nationalite_id_seq'::regclass) NOT NULL,
    nationalite character varying(255) NOT NULL
);
 '   DROP TABLE public.e_liste_nationalite;
       public         heap r       postgres    false    229            �            1259    16452    e_liste_option_examen_id_seq    SEQUENCE     �   CREATE SEQUENCE public.e_liste_option_examen_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.e_liste_option_examen_id_seq;
       public               postgres    false            �            1259    16453    e_liste_option_examen    TABLE     �   CREATE TABLE public.e_liste_option_examen (
    id integer DEFAULT nextval('public.e_liste_option_examen_id_seq'::regclass) NOT NULL,
    id_liste_examen integer,
    libelle character varying NOT NULL
);
 )   DROP TABLE public.e_liste_option_examen;
       public         heap r       postgres    false    231            �            1259    16459    e_matiere_id_seq    SEQUENCE     y   CREATE SEQUENCE public.e_matiere_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.e_matiere_id_seq;
       public               postgres    false            �            1259    16460 	   e_matiere    TABLE       CREATE TABLE public.e_matiere (
    id integer DEFAULT nextval('public.e_matiere_id_seq'::regclass) NOT NULL,
    matiere character varying(255),
    id_annee_scolaire integer NOT NULL,
    order_champ integer NOT NULL,
    avec_sous_matiere integer,
    code_examen integer
);
    DROP TABLE public.e_matiere;
       public         heap r       postgres    false    233            �            1259    16464    e_notes_seq    SEQUENCE     u   CREATE SEQUENCE public.e_notes_seq
    START WITH 10
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.e_notes_seq;
       public               postgres    false            �            1259    16465    e_notes    TABLE     �  CREATE UNLOGGED TABLE public.e_notes (
    id integer DEFAULT nextval('public.e_notes_seq'::regclass) NOT NULL,
    matiere_id integer NOT NULL,
    candidat_id integer NOT NULL,
    flag_absent smallint,
    notes double precision,
    create_uid integer,
    create_date timestamp without time zone,
    write_uid integer,
    write_date timestamp without time zone,
    flag_sous_matiers integer
);
    DROP TABLE public.e_notes;
       public         heap r       postgres    false    235            �            1259    16469    e_salle_id_seq    SEQUENCE     w   CREATE SEQUENCE public.e_salle_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.e_salle_id_seq;
       public               postgres    false            �            1259    16470    e_salle    TABLE     �   CREATE TABLE public.e_salle (
    id integer DEFAULT nextval('public.e_salle_id_seq'::regclass) NOT NULL,
    id_etablissement integer,
    salle character varying,
    capacite_salle integer NOT NULL,
    nbre_place_libre integer NOT NULL
);
    DROP TABLE public.e_salle;
       public         heap r       postgres    false    237            �            1259    16476    e_type_examen_id_seq    SEQUENCE     }   CREATE SEQUENCE public.e_type_examen_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.e_type_examen_id_seq;
       public               postgres    false            �            1259    16477    e_type_examen    TABLE     �   CREATE TABLE public.e_type_examen (
    id integer DEFAULT nextval('public.e_type_examen_id_seq'::regclass) NOT NULL,
    examen character varying,
    code_examen character varying
);
 !   DROP TABLE public.e_type_examen;
       public         heap r       postgres    false    239            �            1259    16483    f_annee_scolaire_id_seq    SEQUENCE     �   CREATE SEQUENCE public.f_annee_scolaire_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.f_annee_scolaire_id_seq;
       public               postgres    false            �            1259    16484    f_annee_scolaire    TABLE     �   CREATE TABLE public.f_annee_scolaire (
    id integer DEFAULT nextval('public.f_annee_scolaire_id_seq'::regclass) NOT NULL,
    libele character varying(255) NOT NULL
);
 $   DROP TABLE public.f_annee_scolaire;
       public         heap r       postgres    false    241            �            1259    16488    f_liste_secteur_id_seq    SEQUENCE        CREATE SEQUENCE public.f_liste_secteur_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.f_liste_secteur_id_seq;
       public               postgres    false            �            1259    16489    f_liste_secteur    TABLE     �   CREATE TABLE public.f_liste_secteur (
    id integer DEFAULT nextval('public.f_liste_secteur_id_seq'::regclass) NOT NULL,
    secteur character varying
);
 #   DROP TABLE public.f_liste_secteur;
       public         heap r       postgres    false    243                       1259    16794    ref_etablissement    TABLE     �  CREATE TABLE public.ref_etablissement (
    id integer NOT NULL,
    dren character varying(255) NOT NULL,
    cisco character varying(255) NOT NULL,
    centreecrit boolean DEFAULT false,
    souscentre boolean DEFAULT false,
    centrecorrection boolean DEFAULT false,
    nombresalles integer,
    totalcentreaccueil integer,
    c_dren integer,
    c_cisco integer,
    c_zap integer,
    zap character varying(255),
    code_etab integer,
    nom_etab character varying(255)
);
 %   DROP TABLE public.ref_etablissement;
       public         heap r       postgres    false                       1259    16793    ref_etablissement_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ref_etablissement_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.ref_etablissement_id_seq;
       public               postgres    false    259            �           0    0    ref_etablissement_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.ref_etablissement_id_seq OWNED BY public.ref_etablissement.id;
          public               postgres    false    258            �            1259    16495    t_application_id_seq    SEQUENCE     }   CREATE SEQUENCE public.t_application_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.t_application_id_seq;
       public               postgres    false            �            1259    16496    t_application    TABLE     
  CREATE TABLE public.t_application (
    id integer DEFAULT nextval('public.t_application_id_seq'::regclass) NOT NULL,
    libelle character varying NOT NULL,
    descriptif character varying NOT NULL,
    code_appli character varying NOT NULL,
    active integer
);
 !   DROP TABLE public.t_application;
       public         heap r       postgres    false    245            �            1259    16502    t_cisco    TABLE     �   CREATE TABLE public.t_cisco (
    code_cisco integer NOT NULL,
    code_dren integer NOT NULL,
    cisco character varying NOT NULL,
    flag_export integer,
    resp_maj integer
);
    DROP TABLE public.t_cisco;
       public         heap r       postgres    false            �            1259    16507 	   t_commune    TABLE     �   CREATE TABLE public.t_commune (
    code_commune integer NOT NULL,
    code_cisco integer NOT NULL,
    commune character varying NOT NULL,
    flag_export integer,
    id_liste_categorie_commune integer,
    resp_maj integer,
    urbaine integer
);
    DROP TABLE public.t_commune;
       public         heap r       postgres    false            �            1259    16512    t_dren    TABLE     �   CREATE TABLE public.t_dren (
    code_dren integer NOT NULL,
    dren character varying NOT NULL,
    code_province integer,
    flag_export integer,
    resp_maj integer
);
    DROP TABLE public.t_dren;
       public         heap r       postgres    false            �            1259    16517    t_etab    TABLE     l  CREATE TABLE public.t_etab (
    code_etab integer NOT NULL,
    code_dren integer,
    code_cisco integer,
    code_commune integer,
    zap integer,
    code_fokontany integer,
    id_liste_secteur integer,
    type_etab integer,
    code_province integer,
    code_affiliation integer,
    etab_nif character varying,
    etab_email character varying,
    etab_tel character varying,
    etab_adresse text,
    etab_communal character varying,
    etab_dommanial character varying,
    etab_dom_autre character varying,
    etab_dom_men character varying,
    num_arrete_dom character varying,
    etab_jum_oui character varying,
    etab_jum character varying,
    etab_dir_affil character varying,
    etab_contr_pgm integer,
    etab_presco integer,
    etab_niveau1 integer,
    etab_niveau2 integer,
    etab_niveau3 integer,
    annee_ouvert integer,
    fonctionnel integer,
    annee_ferme integer,
    ancien_nom character varying,
    ancien_code character varying,
    serv_fac integer,
    dir_dept character varying,
    nom_etab character varying,
    zone integer,
    flag_export integer,
    resp_maj integer
);
    DROP TABLE public.t_etab;
       public         heap r       postgres    false            �            1259    16522    t_fokontany    TABLE     �   CREATE TABLE public.t_fokontany (
    code_fokontany integer NOT NULL,
    code_commune integer NOT NULL,
    fokontany character varying NOT NULL,
    flag_export integer,
    resp_maj integer
);
    DROP TABLE public.t_fokontany;
       public         heap r       postgres    false                       1259    16773    t_inscription    TABLE     �  CREATE TABLE public.t_inscription (
    id integer NOT NULL,
    code_dren character varying(255),
    code_cisco character varying(255) NOT NULL,
    id_centre_correction character varying(255) NOT NULL,
    id_etablissement_ecrit character varying(255) NOT NULL,
    nom_prenom character varying(255) NOT NULL,
    genre character(1) NOT NULL,
    adresse character varying(255) NOT NULL,
    date_naissance date,
    nee_vers boolean DEFAULT false,
    lieu_naissance character varying(255) NOT NULL,
    fils_de character varying(255) NOT NULL,
    et_de character varying(255),
    id_etablissement_origine character varying(255) NOT NULL,
    classe character varying(50) NOT NULL,
    option character varying(50) NOT NULL,
    id_etablissement_demande character varying(255) NOT NULL,
    nationalite character varying(50) NOT NULL,
    observation text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 !   DROP TABLE public.t_inscription;
       public         heap r       postgres    false                        1259    16772    t_inscription_id_seq    SEQUENCE     �   CREATE SEQUENCE public.t_inscription_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.t_inscription_id_seq;
       public               postgres    false    257            �           0    0    t_inscription_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.t_inscription_id_seq OWNED BY public.t_inscription.id;
          public               postgres    false    256                       1259    16809    t_salles    TABLE     s   CREATE TABLE public.t_salles (
    id integer NOT NULL,
    code_etab integer,
    salle character varying(255)
);
    DROP TABLE public.t_salles;
       public         heap r       postgres    false                       1259    16808    t_salles_id_seq    SEQUENCE     �   CREATE SEQUENCE public.t_salles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.t_salles_id_seq;
       public               postgres    false    261                        0    0    t_salles_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.t_salles_id_seq OWNED BY public.t_salles.id;
          public               postgres    false    260            �            1259    16527    t_users_id_seq    SEQUENCE     w   CREATE SEQUENCE public.t_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.t_users_id_seq;
       public               postgres    false            �            1259    16528    t_users    TABLE     -  CREATE TABLE public.t_users (
    id integer DEFAULT nextval('public.t_users_id_seq'::regclass) NOT NULL,
    code_dren integer NOT NULL,
    code_cisco integer NOT NULL,
    im character varying(255) NOT NULL,
    user_nom text NOT NULL,
    user_prenom text,
    sexe character varying(50) NOT NULL,
    adresse text,
    email character varying(50) NOT NULL,
    tel character varying(50) NOT NULL,
    username character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    roles character varying(50) NOT NULL,
    last_login timestamp without time zone,
    date_login timestamp without time zone,
    date_logout timestamp without time zone,
    enabled integer,
    create_date timestamp without time zone,
    write_date timestamp without time zone,
    examen_id integer NOT NULL
);
    DROP TABLE public.t_users;
       public         heap r       postgres    false    252            �            1259    16534    t_zap    TABLE     �   CREATE TABLE public.t_zap (
    code_zap integer NOT NULL,
    code_cisco integer NOT NULL,
    zap character varying NOT NULL,
    flag_export integer,
    resp_maj integer
);
    DROP TABLE public.t_zap;
       public         heap r       postgres    false            �            1259    16539    user_id_sequence    SEQUENCE     {   CREATE SEQUENCE public.user_id_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 1000
    CACHE 1;
 '   DROP SEQUENCE public.user_id_sequence;
       public               postgres    false            �           2604    16797    ref_etablissement id    DEFAULT     |   ALTER TABLE ONLY public.ref_etablissement ALTER COLUMN id SET DEFAULT nextval('public.ref_etablissement_id_seq'::regclass);
 C   ALTER TABLE public.ref_etablissement ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    258    259    259            �           2604    16776    t_inscription id    DEFAULT     t   ALTER TABLE ONLY public.t_inscription ALTER COLUMN id SET DEFAULT nextval('public.t_inscription_id_seq'::regclass);
 ?   ALTER TABLE public.t_inscription ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    257    256    257            �           2604    16812    t_salles id    DEFAULT     j   ALTER TABLE ONLY public.t_salles ALTER COLUMN id SET DEFAULT nextval('public.t_salles_id_seq'::regclass);
 :   ALTER TABLE public.t_salles ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    261    260    261            �          0    16410    e_classe 
   TABLE DATA           +   COPY public.e_classe (id, nom) FROM stdin;
    public               postgres    false    218   ��       �          0    16415    e_coefficient 
   TABLE DATA           W   COPY public.e_coefficient (id, id_matiere, coefficient, note_max, options) FROM stdin;
    public               postgres    false    220   �       �          0    16420    e_etablissement 
   TABLE DATA           �   COPY public.e_etablissement (id, id_liste_centre_examen, code_etab, code_def, code_etab_def, flag_informatise, sigle, code_etab_rattache) FROM stdin;
    public               postgres    false    222   -�       �          0    16427    e_liste_candidat 
   TABLE DATA           �  COPY public.e_liste_candidat (id, code_dren, code_cisco, options, id_annee_scolaire, id_etablissement_ecrit, id_etablissement_origine, id_etablissement_demande, id_centre_correction, id_salle, id_classe, id_nationalite, matricule, nom_prenom, sexe, adresse, pere, mere, nee_vers, lieu_naissance, date_naissance, observation, flag_verrouillage_inscription, flag_verrouillage_transcription, sequence, code_examen) FROM stdin;
    public               postgres    false    224   ��       �          0    16434    e_liste_centre_examen 
   TABLE DATA           J   COPY public.e_liste_centre_examen (id, libelle_centre_examen) FROM stdin;
    public               postgres    false    226   �       �          0    16441    e_liste_groupe_examen 
   TABLE DATA           I   COPY public.e_liste_groupe_examen (id, libelle, code_examen) FROM stdin;
    public               postgres    false    228   r�       �          0    16448    e_liste_nationalite 
   TABLE DATA           >   COPY public.e_liste_nationalite (id, nationalite) FROM stdin;
    public               postgres    false    230   ��       �          0    16453    e_liste_option_examen 
   TABLE DATA           M   COPY public.e_liste_option_examen (id, id_liste_examen, libelle) FROM stdin;
    public               postgres    false    232   ��       �          0    16460 	   e_matiere 
   TABLE DATA           p   COPY public.e_matiere (id, matiere, id_annee_scolaire, order_champ, avec_sous_matiere, code_examen) FROM stdin;
    public               postgres    false    234   �       �          0    16465    e_notes 
   TABLE DATA           �   COPY public.e_notes (id, matiere_id, candidat_id, flag_absent, notes, create_uid, create_date, write_uid, write_date, flag_sous_matiers) FROM stdin;
    public               postgres    false    236   e�       �          0    16470    e_salle 
   TABLE DATA           `   COPY public.e_salle (id, id_etablissement, salle, capacite_salle, nbre_place_libre) FROM stdin;
    public               postgres    false    238   ��       �          0    16477    e_type_examen 
   TABLE DATA           @   COPY public.e_type_examen (id, examen, code_examen) FROM stdin;
    public               postgres    false    240   ��       �          0    16484    f_annee_scolaire 
   TABLE DATA           6   COPY public.f_annee_scolaire (id, libele) FROM stdin;
    public               postgres    false    242   ��       �          0    16489    f_liste_secteur 
   TABLE DATA           6   COPY public.f_liste_secteur (id, secteur) FROM stdin;
    public               postgres    false    244   ��       �          0    16794    ref_etablissement 
   TABLE DATA           �   COPY public.ref_etablissement (id, dren, cisco, centreecrit, souscentre, centrecorrection, nombresalles, totalcentreaccueil, c_dren, c_cisco, c_zap, zap, code_etab, nom_etab) FROM stdin;
    public               postgres    false    259   �       �          0    16496    t_application 
   TABLE DATA           T   COPY public.t_application (id, libelle, descriptif, code_appli, active) FROM stdin;
    public               postgres    false    246   X�       �          0    16502    t_cisco 
   TABLE DATA           V   COPY public.t_cisco (code_cisco, code_dren, cisco, flag_export, resp_maj) FROM stdin;
    public               postgres    false    247   ��       �          0    16507 	   t_commune 
   TABLE DATA           �   COPY public.t_commune (code_commune, code_cisco, commune, flag_export, id_liste_categorie_commune, resp_maj, urbaine) FROM stdin;
    public               postgres    false    248   ��       �          0    16512    t_dren 
   TABLE DATA           W   COPY public.t_dren (code_dren, dren, code_province, flag_export, resp_maj) FROM stdin;
    public               postgres    false    249   ��       �          0    16517    t_etab 
   TABLE DATA           	  COPY public.t_etab (code_etab, code_dren, code_cisco, code_commune, zap, code_fokontany, id_liste_secteur, type_etab, code_province, code_affiliation, etab_nif, etab_email, etab_tel, etab_adresse, etab_communal, etab_dommanial, etab_dom_autre, etab_dom_men, num_arrete_dom, etab_jum_oui, etab_jum, etab_dir_affil, etab_contr_pgm, etab_presco, etab_niveau1, etab_niveau2, etab_niveau3, annee_ouvert, fonctionnel, annee_ferme, ancien_nom, ancien_code, serv_fac, dir_dept, nom_etab, zone, flag_export, resp_maj) FROM stdin;
    public               postgres    false    250   ~�       �          0    16522    t_fokontany 
   TABLE DATA           e   COPY public.t_fokontany (code_fokontany, code_commune, fokontany, flag_export, resp_maj) FROM stdin;
    public               postgres    false    251   ��       �          0    16773    t_inscription 
   TABLE DATA           <  COPY public.t_inscription (id, code_dren, code_cisco, id_centre_correction, id_etablissement_ecrit, nom_prenom, genre, adresse, date_naissance, nee_vers, lieu_naissance, fils_de, et_de, id_etablissement_origine, classe, option, id_etablissement_demande, nationalite, observation, created_at, updated_at) FROM stdin;
    public               postgres    false    257   �       �          0    16809    t_salles 
   TABLE DATA           8   COPY public.t_salles (id, code_etab, salle) FROM stdin;
    public               postgres    false    261   ��       �          0    16528    t_users 
   TABLE DATA           �   COPY public.t_users (id, code_dren, code_cisco, im, user_nom, user_prenom, sexe, adresse, email, tel, username, password, roles, last_login, date_login, date_logout, enabled, create_date, write_date, examen_id) FROM stdin;
    public               postgres    false    253   ��       �          0    16534    t_zap 
   TABLE DATA           Q   COPY public.t_zap (code_zap, code_cisco, zap, flag_export, resp_maj) FROM stdin;
    public               postgres    false    254   e�                  0    0    e_classe_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.e_classe_id_seq', 4, true);
          public               postgres    false    217                       0    0    e_coefficient_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.e_coefficient_id_seq', 1, false);
          public               postgres    false    219                       0    0    e_etablissement_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.e_etablissement_id_seq', 4, true);
          public               postgres    false    221                       0    0    e_liste_candidat_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.e_liste_candidat_id_seq', 12, true);
          public               postgres    false    223                       0    0    e_liste_centre_examen_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.e_liste_centre_examen_id_seq', 1, false);
          public               postgres    false    225                       0    0    e_liste_groupe_examen_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.e_liste_groupe_examen_id_seq', 2, true);
          public               postgres    false    227                       0    0    e_liste_nationalite_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.e_liste_nationalite_id_seq', 2, true);
          public               postgres    false    229                       0    0    e_liste_option_examen_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.e_liste_option_examen_id_seq', 5, true);
          public               postgres    false    231            	           0    0    e_matiere_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.e_matiere_id_seq', 12, true);
          public               postgres    false    233            
           0    0    e_notes_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.e_notes_seq', 29, true);
          public               postgres    false    235                       0    0    e_salle_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.e_salle_id_seq', 1, false);
          public               postgres    false    237                       0    0    e_type_examen_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.e_type_examen_id_seq', 2, true);
          public               postgres    false    239                       0    0    f_annee_scolaire_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.f_annee_scolaire_id_seq', 1, true);
          public               postgres    false    241                       0    0    f_liste_secteur_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.f_liste_secteur_id_seq', 1, false);
          public               postgres    false    243                       0    0    ref_etablissement_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.ref_etablissement_id_seq', 124, true);
          public               postgres    false    258                       0    0    t_application_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.t_application_id_seq', 1, false);
          public               postgres    false    245                       0    0    t_inscription_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.t_inscription_id_seq', 10, true);
          public               postgres    false    256                       0    0    t_salles_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.t_salles_id_seq', 1, true);
          public               postgres    false    260                       0    0    t_users_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.t_users_id_seq', 14, true);
          public               postgres    false    252                       0    0    user_id_sequence    SEQUENCE SET     >   SELECT pg_catalog.setval('public.user_id_sequence', 2, true);
          public               postgres    false    255            �           2606    16541    e_classe e_classe_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.e_classe
    ADD CONSTRAINT e_classe_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.e_classe DROP CONSTRAINT e_classe_pkey;
       public                 postgres    false    218            �           2606    16543     e_coefficient e_coefficient_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.e_coefficient
    ADD CONSTRAINT e_coefficient_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.e_coefficient DROP CONSTRAINT e_coefficient_pkey;
       public                 postgres    false    220            �           2606    16545 $   e_etablissement e_etablissement_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.e_etablissement
    ADD CONSTRAINT e_etablissement_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.e_etablissement DROP CONSTRAINT e_etablissement_pkey;
       public                 postgres    false    222            �           2606    16547 &   e_liste_candidat e_liste_candidat_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.e_liste_candidat
    ADD CONSTRAINT e_liste_candidat_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.e_liste_candidat DROP CONSTRAINT e_liste_candidat_pkey;
       public                 postgres    false    224            �           2606    16549 0   e_liste_centre_examen e_liste_centre_examen_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.e_liste_centre_examen
    ADD CONSTRAINT e_liste_centre_examen_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.e_liste_centre_examen DROP CONSTRAINT e_liste_centre_examen_pkey;
       public                 postgres    false    226            �           2606    16551 0   e_liste_groupe_examen e_liste_groupe_examen_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.e_liste_groupe_examen
    ADD CONSTRAINT e_liste_groupe_examen_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.e_liste_groupe_examen DROP CONSTRAINT e_liste_groupe_examen_pkey;
       public                 postgres    false    228            �           2606    16553 ,   e_liste_nationalite e_liste_nationalite_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.e_liste_nationalite
    ADD CONSTRAINT e_liste_nationalite_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.e_liste_nationalite DROP CONSTRAINT e_liste_nationalite_pkey;
       public                 postgres    false    230            �           2606    16555 0   e_liste_option_examen e_liste_option_examen_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.e_liste_option_examen
    ADD CONSTRAINT e_liste_option_examen_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.e_liste_option_examen DROP CONSTRAINT e_liste_option_examen_pkey;
       public                 postgres    false    232            �           2606    16557    e_matiere e_matiere_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.e_matiere
    ADD CONSTRAINT e_matiere_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.e_matiere DROP CONSTRAINT e_matiere_pkey;
       public                 postgres    false    234            �           2606    16559    e_notes e_notes_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.e_notes
    ADD CONSTRAINT e_notes_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.e_notes DROP CONSTRAINT e_notes_pkey;
       public                 postgres    false    236            �           2606    16561    e_salle e_salle_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.e_salle
    ADD CONSTRAINT e_salle_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.e_salle DROP CONSTRAINT e_salle_pkey;
       public                 postgres    false    238            �           2606    16563     e_type_examen e_type_examen_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.e_type_examen
    ADD CONSTRAINT e_type_examen_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.e_type_examen DROP CONSTRAINT e_type_examen_pkey;
       public                 postgres    false    240            �           2606    16565 &   f_annee_scolaire f_annee_scolaire_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.f_annee_scolaire
    ADD CONSTRAINT f_annee_scolaire_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.f_annee_scolaire DROP CONSTRAINT f_annee_scolaire_pkey;
       public                 postgres    false    242            �           2606    16567 $   f_liste_secteur f_liste_secteur_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.f_liste_secteur
    ADD CONSTRAINT f_liste_secteur_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.f_liste_secteur DROP CONSTRAINT f_liste_secteur_pkey;
       public                 postgres    false    244                       2606    16802 (   ref_etablissement ref_etablissement_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.ref_etablissement
    ADD CONSTRAINT ref_etablissement_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.ref_etablissement DROP CONSTRAINT ref_etablissement_pkey;
       public                 postgres    false    259                        2606    16569 +   t_application t_application_code_appli_uniq 
   CONSTRAINT     l   ALTER TABLE ONLY public.t_application
    ADD CONSTRAINT t_application_code_appli_uniq UNIQUE (code_appli);
 U   ALTER TABLE ONLY public.t_application DROP CONSTRAINT t_application_code_appli_uniq;
       public                 postgres    false    246                       2606    16571     t_application t_application_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.t_application
    ADD CONSTRAINT t_application_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.t_application DROP CONSTRAINT t_application_pkey;
       public                 postgres    false    246                       2606    16573    t_cisco t_cisco_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.t_cisco
    ADD CONSTRAINT t_cisco_pkey PRIMARY KEY (code_cisco);
 >   ALTER TABLE ONLY public.t_cisco DROP CONSTRAINT t_cisco_pkey;
       public                 postgres    false    247                       2606    16575    t_commune t_commune_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.t_commune
    ADD CONSTRAINT t_commune_pkey PRIMARY KEY (code_commune);
 B   ALTER TABLE ONLY public.t_commune DROP CONSTRAINT t_commune_pkey;
       public                 postgres    false    248                       2606    16577    t_dren t_dren_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.t_dren
    ADD CONSTRAINT t_dren_pkey PRIMARY KEY (code_dren);
 <   ALTER TABLE ONLY public.t_dren DROP CONSTRAINT t_dren_pkey;
       public                 postgres    false    249            
           2606    16579    t_etab t_etab_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.t_etab
    ADD CONSTRAINT t_etab_pkey PRIMARY KEY (code_etab);
 <   ALTER TABLE ONLY public.t_etab DROP CONSTRAINT t_etab_pkey;
       public                 postgres    false    250                       2606    16581    t_fokontany t_fokontany_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.t_fokontany
    ADD CONSTRAINT t_fokontany_pkey PRIMARY KEY (code_fokontany);
 F   ALTER TABLE ONLY public.t_fokontany DROP CONSTRAINT t_fokontany_pkey;
       public                 postgres    false    251                       2606    16783     t_inscription t_inscription_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.t_inscription
    ADD CONSTRAINT t_inscription_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.t_inscription DROP CONSTRAINT t_inscription_pkey;
       public                 postgres    false    257                       2606    16814    t_salles t_salles_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.t_salles
    ADD CONSTRAINT t_salles_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.t_salles DROP CONSTRAINT t_salles_pkey;
       public                 postgres    false    261                       2606    16583    t_users t_users_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.t_users
    ADD CONSTRAINT t_users_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.t_users DROP CONSTRAINT t_users_pkey;
       public                 postgres    false    253                       2606    16585    t_zap t_zap_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.t_zap
    ADD CONSTRAINT t_zap_pkey PRIMARY KEY (code_zap);
 :   ALTER TABLE ONLY public.t_zap DROP CONSTRAINT t_zap_pkey;
       public                 postgres    false    254                       2606    16587    t_users unique_username 
   CONSTRAINT     V   ALTER TABLE ONLY public.t_users
    ADD CONSTRAINT unique_username UNIQUE (username);
 A   ALTER TABLE ONLY public.t_users DROP CONSTRAINT unique_username;
       public                 postgres    false    253                       2606    16588 +   e_coefficient e_coefficient_id_matiere_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.e_coefficient
    ADD CONSTRAINT e_coefficient_id_matiere_fkey FOREIGN KEY (id_matiere) REFERENCES public.e_matiere(id) ON DELETE SET NULL;
 U   ALTER TABLE ONLY public.e_coefficient DROP CONSTRAINT e_coefficient_id_matiere_fkey;
       public               postgres    false    220    4852    234                       2606    16593 .   e_etablissement e_etablissement_code_etab_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.e_etablissement
    ADD CONSTRAINT e_etablissement_code_etab_fkey FOREIGN KEY (code_etab) REFERENCES public.t_etab(code_etab) ON DELETE SET NULL;
 X   ALTER TABLE ONLY public.e_etablissement DROP CONSTRAINT e_etablissement_code_etab_fkey;
       public               postgres    false    4874    222    250                       2606    16598 ;   e_etablissement e_etablissement_id_liste_centre_examen_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.e_etablissement
    ADD CONSTRAINT e_etablissement_id_liste_centre_examen_fkey FOREIGN KEY (id_liste_centre_examen) REFERENCES public.e_liste_centre_examen(id) ON DELETE SET NULL;
 e   ALTER TABLE ONLY public.e_etablissement DROP CONSTRAINT e_etablissement_id_liste_centre_examen_fkey;
       public               postgres    false    4844    222    226                       2606    16603 1   e_liste_candidat e_liste_candidat_code_cisco_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.e_liste_candidat
    ADD CONSTRAINT e_liste_candidat_code_cisco_fkey FOREIGN KEY (code_cisco) REFERENCES public.t_cisco(code_cisco) ON DELETE SET NULL;
 [   ALTER TABLE ONLY public.e_liste_candidat DROP CONSTRAINT e_liste_candidat_code_cisco_fkey;
       public               postgres    false    4868    224    247                       2606    16608 0   e_liste_candidat e_liste_candidat_code_dren_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.e_liste_candidat
    ADD CONSTRAINT e_liste_candidat_code_dren_fkey FOREIGN KEY (code_dren) REFERENCES public.t_dren(code_dren) ON DELETE SET NULL;
 Z   ALTER TABLE ONLY public.e_liste_candidat DROP CONSTRAINT e_liste_candidat_code_dren_fkey;
       public               postgres    false    4872    224    249                       2606    16613 8   e_liste_candidat e_liste_candidat_id_annee_scolaire_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.e_liste_candidat
    ADD CONSTRAINT e_liste_candidat_id_annee_scolaire_fkey FOREIGN KEY (id_annee_scolaire) REFERENCES public.f_annee_scolaire(id) ON DELETE SET NULL;
 b   ALTER TABLE ONLY public.e_liste_candidat DROP CONSTRAINT e_liste_candidat_id_annee_scolaire_fkey;
       public               postgres    false    4860    224    242                       2606    16618 ;   e_liste_candidat e_liste_candidat_id_centre_correction_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.e_liste_candidat
    ADD CONSTRAINT e_liste_candidat_id_centre_correction_fkey FOREIGN KEY (id_centre_correction) REFERENCES public.t_etab(code_etab) ON DELETE SET NULL;
 e   ALTER TABLE ONLY public.e_liste_candidat DROP CONSTRAINT e_liste_candidat_id_centre_correction_fkey;
       public               postgres    false    4874    224    250                        2606    16623 0   e_liste_candidat e_liste_candidat_id_classe_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.e_liste_candidat
    ADD CONSTRAINT e_liste_candidat_id_classe_fkey FOREIGN KEY (id_classe) REFERENCES public.e_classe(id) ON DELETE SET NULL;
 Z   ALTER TABLE ONLY public.e_liste_candidat DROP CONSTRAINT e_liste_candidat_id_classe_fkey;
       public               postgres    false    4836    224    218            !           2606    16628 ?   e_liste_candidat e_liste_candidat_id_etablissement_demande_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.e_liste_candidat
    ADD CONSTRAINT e_liste_candidat_id_etablissement_demande_fkey FOREIGN KEY (id_etablissement_demande) REFERENCES public.t_etab(code_etab) ON DELETE SET NULL;
 i   ALTER TABLE ONLY public.e_liste_candidat DROP CONSTRAINT e_liste_candidat_id_etablissement_demande_fkey;
       public               postgres    false    4874    224    250            "           2606    16633 =   e_liste_candidat e_liste_candidat_id_etablissement_ecrit_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.e_liste_candidat
    ADD CONSTRAINT e_liste_candidat_id_etablissement_ecrit_fkey FOREIGN KEY (id_etablissement_ecrit) REFERENCES public.t_etab(code_etab) ON DELETE SET NULL;
 g   ALTER TABLE ONLY public.e_liste_candidat DROP CONSTRAINT e_liste_candidat_id_etablissement_ecrit_fkey;
       public               postgres    false    4874    224    250            #           2606    16638 ?   e_liste_candidat e_liste_candidat_id_etablissement_origine_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.e_liste_candidat
    ADD CONSTRAINT e_liste_candidat_id_etablissement_origine_fkey FOREIGN KEY (id_etablissement_origine) REFERENCES public.t_etab(code_etab) ON DELETE SET NULL;
 i   ALTER TABLE ONLY public.e_liste_candidat DROP CONSTRAINT e_liste_candidat_id_etablissement_origine_fkey;
       public               postgres    false    224    4874    250            $           2606    16643 5   e_liste_candidat e_liste_candidat_id_nationalite_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.e_liste_candidat
    ADD CONSTRAINT e_liste_candidat_id_nationalite_fkey FOREIGN KEY (id_nationalite) REFERENCES public.e_liste_nationalite(id) ON DELETE SET NULL;
 _   ALTER TABLE ONLY public.e_liste_candidat DROP CONSTRAINT e_liste_candidat_id_nationalite_fkey;
       public               postgres    false    224    4848    230            %           2606    16648 /   e_liste_candidat e_liste_candidat_id_salle_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.e_liste_candidat
    ADD CONSTRAINT e_liste_candidat_id_salle_fkey FOREIGN KEY (id_salle) REFERENCES public.e_salle(id) ON DELETE SET NULL;
 Y   ALTER TABLE ONLY public.e_liste_candidat DROP CONSTRAINT e_liste_candidat_id_salle_fkey;
       public               postgres    false    238    224    4856            &           2606    16653 .   e_liste_candidat e_liste_candidat_options_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.e_liste_candidat
    ADD CONSTRAINT e_liste_candidat_options_fkey FOREIGN KEY (options) REFERENCES public.e_liste_option_examen(id) ON DELETE SET NULL;
 X   ALTER TABLE ONLY public.e_liste_candidat DROP CONSTRAINT e_liste_candidat_options_fkey;
       public               postgres    false    4850    224    232            '           2606    16658 *   e_matiere e_matiere_id_annee_scolaire_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.e_matiere
    ADD CONSTRAINT e_matiere_id_annee_scolaire_fkey FOREIGN KEY (id_annee_scolaire) REFERENCES public.f_annee_scolaire(id) ON DELETE SET NULL;
 T   ALTER TABLE ONLY public.e_matiere DROP CONSTRAINT e_matiere_id_annee_scolaire_fkey;
       public               postgres    false    4860    234    242            (           2606    16663     e_notes e_notes_candidat_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.e_notes
    ADD CONSTRAINT e_notes_candidat_id_fkey FOREIGN KEY (candidat_id) REFERENCES public.e_liste_candidat(id) ON DELETE SET NULL;
 J   ALTER TABLE ONLY public.e_notes DROP CONSTRAINT e_notes_candidat_id_fkey;
       public               postgres    false    4842    236    224            )           2606    16668    e_notes e_notes_create_uid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.e_notes
    ADD CONSTRAINT e_notes_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES public.t_users(id) ON DELETE SET NULL;
 I   ALTER TABLE ONLY public.e_notes DROP CONSTRAINT e_notes_create_uid_fkey;
       public               postgres    false    4878    236    253            *           2606    16673    e_notes e_notes_matiere_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.e_notes
    ADD CONSTRAINT e_notes_matiere_id_fkey FOREIGN KEY (matiere_id) REFERENCES public.e_matiere(id) ON DELETE SET NULL;
 I   ALTER TABLE ONLY public.e_notes DROP CONSTRAINT e_notes_matiere_id_fkey;
       public               postgres    false    4852    236    234            +           2606    16678    e_notes e_notes_write_uid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.e_notes
    ADD CONSTRAINT e_notes_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES public.t_users(id) ON DELETE SET NULL;
 H   ALTER TABLE ONLY public.e_notes DROP CONSTRAINT e_notes_write_uid_fkey;
       public               postgres    false    4878    236    253            ,           2606    16683 %   e_salle e_salle_id_etablissement_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.e_salle
    ADD CONSTRAINT e_salle_id_etablissement_fkey FOREIGN KEY (id_etablissement) REFERENCES public.t_etab(code_etab) ON DELETE SET NULL;
 O   ALTER TABLE ONLY public.e_salle DROP CONSTRAINT e_salle_id_etablissement_fkey;
       public               postgres    false    4874    238    250            -           2606    16688    t_cisco t_cisco_code_dren_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.t_cisco
    ADD CONSTRAINT t_cisco_code_dren_fkey FOREIGN KEY (code_dren) REFERENCES public.t_dren(code_dren) ON DELETE SET NULL;
 H   ALTER TABLE ONLY public.t_cisco DROP CONSTRAINT t_cisco_code_dren_fkey;
       public               postgres    false    247    249    4872            .           2606    16693 #   t_commune t_commune_code_cisco_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.t_commune
    ADD CONSTRAINT t_commune_code_cisco_fkey FOREIGN KEY (code_cisco) REFERENCES public.t_cisco(code_cisco) ON DELETE SET NULL;
 M   ALTER TABLE ONLY public.t_commune DROP CONSTRAINT t_commune_code_cisco_fkey;
       public               postgres    false    248    247    4868            /           2606    16698    t_etab t_etab_code_cisco_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.t_etab
    ADD CONSTRAINT t_etab_code_cisco_fkey FOREIGN KEY (code_cisco) REFERENCES public.t_cisco(code_cisco) ON DELETE SET NULL;
 G   ALTER TABLE ONLY public.t_etab DROP CONSTRAINT t_etab_code_cisco_fkey;
       public               postgres    false    247    4868    250            0           2606    16703    t_etab t_etab_code_commune_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.t_etab
    ADD CONSTRAINT t_etab_code_commune_fkey FOREIGN KEY (code_commune) REFERENCES public.t_commune(code_commune) ON DELETE SET NULL;
 I   ALTER TABLE ONLY public.t_etab DROP CONSTRAINT t_etab_code_commune_fkey;
       public               postgres    false    248    4870    250            1           2606    16708    t_etab t_etab_code_dren_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.t_etab
    ADD CONSTRAINT t_etab_code_dren_fkey FOREIGN KEY (code_dren) REFERENCES public.t_dren(code_dren) ON DELETE SET NULL;
 F   ALTER TABLE ONLY public.t_etab DROP CONSTRAINT t_etab_code_dren_fkey;
       public               postgres    false    250    4872    249            2           2606    16713 !   t_etab t_etab_code_fokontany_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.t_etab
    ADD CONSTRAINT t_etab_code_fokontany_fkey FOREIGN KEY (code_fokontany) REFERENCES public.t_fokontany(code_fokontany) ON DELETE SET NULL;
 K   ALTER TABLE ONLY public.t_etab DROP CONSTRAINT t_etab_code_fokontany_fkey;
       public               postgres    false    4876    250    251            3           2606    16718 #   t_etab t_etab_id_liste_secteur_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.t_etab
    ADD CONSTRAINT t_etab_id_liste_secteur_fkey FOREIGN KEY (id_liste_secteur) REFERENCES public.f_liste_secteur(id) ON DELETE SET NULL;
 M   ALTER TABLE ONLY public.t_etab DROP CONSTRAINT t_etab_id_liste_secteur_fkey;
       public               postgres    false    4862    250    244            4           2606    16723    t_etab t_etab_zap_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.t_etab
    ADD CONSTRAINT t_etab_zap_fkey FOREIGN KEY (zap) REFERENCES public.t_zap(code_zap) ON DELETE SET NULL;
 @   ALTER TABLE ONLY public.t_etab DROP CONSTRAINT t_etab_zap_fkey;
       public               postgres    false    4882    250    254            5           2606    16728 )   t_fokontany t_fokontany_code_commune_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.t_fokontany
    ADD CONSTRAINT t_fokontany_code_commune_fkey FOREIGN KEY (code_commune) REFERENCES public.t_commune(code_commune) ON DELETE SET NULL;
 S   ALTER TABLE ONLY public.t_fokontany DROP CONSTRAINT t_fokontany_code_commune_fkey;
       public               postgres    false    248    251    4870            6           2606    16733    t_users t_users_code_cisco_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.t_users
    ADD CONSTRAINT t_users_code_cisco_fkey FOREIGN KEY (code_cisco) REFERENCES public.t_cisco(code_cisco) ON DELETE SET NULL;
 I   ALTER TABLE ONLY public.t_users DROP CONSTRAINT t_users_code_cisco_fkey;
       public               postgres    false    253    4868    247            7           2606    16738    t_users t_users_code_dren_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.t_users
    ADD CONSTRAINT t_users_code_dren_fkey FOREIGN KEY (code_dren) REFERENCES public.t_dren(code_dren) ON DELETE SET NULL;
 H   ALTER TABLE ONLY public.t_users DROP CONSTRAINT t_users_code_dren_fkey;
       public               postgres    false    249    253    4872            8           2606    16743    t_users t_users_examen_id_key    FK CONSTRAINT     �   ALTER TABLE ONLY public.t_users
    ADD CONSTRAINT t_users_examen_id_key FOREIGN KEY (examen_id) REFERENCES public.e_type_examen(id);
 G   ALTER TABLE ONLY public.t_users DROP CONSTRAINT t_users_examen_id_key;
       public               postgres    false    4858    253    240            9           2606    16748    t_zap t_zap_code_cisco_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.t_zap
    ADD CONSTRAINT t_zap_code_cisco_fkey FOREIGN KEY (code_cisco) REFERENCES public.t_cisco(code_cisco) ON DELETE SET NULL;
 E   ALTER TABLE ONLY public.t_zap DROP CONSTRAINT t_zap_code_cisco_fkey;
       public               postgres    false    4868    254    247            �   "   x�3�1�2�1�2�4I�M�2�4Q1z\\\ S��      �      x������ � �      �   H   x�M��� D���b�2�Rp�	C��Q�9���������W�vb��$iq�Z�L�����#�a�ff7$:�      �   �   x�34�4�440�4��1�����24��̑d�J����1%ū4ç "�2$5�����,��֖3���?��1�3��ǟ�7�8�4'3�3���*��dE9�Er��B9��uLt�V��s��W� ��&�      �   G   x�3�tv�2�tv�2���,�`��`gW�� W.SN�G'W_G?W.3�Z�21s�Vt�=... ��      �      x�3�tvp\F�N��`�+F��� Z��      �   %   x�3��M�ILO,��2�t-)J�K?��(�+F��� �G	      �   1   x�3�4�tvp�2�2��RsS��9�8�L���)�t����� ��      �   ?   x�3�p�4�?NC.NgG�PW��DȒ38,��Ѐ��38�����ƈ+F��� �Wp      �      x������ � �      �      x������ � �      �      x�3�tvp\F�N��`�+F��� Z��      �      x�3�4202����� B�      �      x������ � �      �   :  x���ݎ�:ǯ�S�	��~s�4Am��^�'��ױ�)C:�c��J;[�?I��$�J(q�P�9�oJ�q��B�տ���?��x���,]M��$��>i��n�&J;|�3��z�էS��&g0�&���^�@��=+��v�W��aK�4[��s�������Sk�߈I���K����;0�v`��/U(o
{	�~��`�K�
=�Q��_'�K r��&'���}�`y^9������ӯ�_[��(vR�Ƴ���:t�ҶM�PfMĠ���>eC�{1�R`$���ۗ�_��1m��o[� ��1�_�ie5��㔈񱻑��e,P/D�	��)QQq+��G�ߜ���<����1�2�G@��2J�G��9�YF���D:�H�%�c�~#��Yۉ�`)�� �g0|�2
"By���U�=��!6�U�m��R�j�3����]�X�n��1�,�;0a�h��^��<�; a�wlON�	��p�m&�b�U�YND��V�Vb(�]�1��:DT���rN!�s��
N|�v0&
"crP�w��>9�ʌ&����H��U��@�B����V��}J�G���K"��
J�7dTRV��W�L�@A@\g�>����@ .�b�V��(���a*eߞ4��q1��,���E�߹��=�FE�Ay���������<��VP��y��1+(�X�[��3((�X���:h�P�!%K��4e�YI�ǂ�M��0.0�~l�^))�BE����{<�w�%"Q��<�&�8+),�k�&�ڙ��� %>�?�����N����X�XN�ś�S �c�Q�+)؈�d���8��IG��4��FE�N���r�[�����XE�ED�ߊ�����`}�7J��XePj-�Ԧ������?xҬ��(6��>lm�GXE!Ql���ɓ讬�`���^D�!ܤU�����N�9�U� �� ��R�<���5z6�<W�Ac���PQ��\&ܱw[\����5 H��sA��0q���<����I�`�YS@��Ǚ1Y��[d��[V���+�z�2�M}u�n0�2�Md|������t�N0,ǃ��X��	�t 
�"�S�uAMaA�R߭�`}<0G~7%�hͶ�Ϧ�	HXPz(�M� <�	<XP��jJ<4��}C�Ò�}�O�5�oC`ĒRXi�c�P8��ZEPh�2�! b���oړ����iC|��.Y�Mp�`����YC��or�~�墴+�b>��&�37r�"N�)��) Y�~`S�M�6g�#�hַ�İ��:&�^S������z/�`��klU`/a�zJ>![S���4Oz�51��b�u`|����~�|�y�s���p�*�^��(��~������V������C�0p�]�5�9��ks�(z9�0)�Y��ͼb1�G�̲�� ��
����Yω[�<�-˫v�p!3i���ey`�+�i;��.�[����8�#.,�z~�`�	P�PeY1��̟:��}ly�q�q:�FWOw�nV����'��$��;�<}P܅C�q��b&&Az�&����(܈��6�Är4��7��E�IT��3���8�Jh\Ȧ4�ߡ�Q[� ������|Z��h\�o��n�.�(�D�Z�c�� ��R)WG�z�Y�*0�(���䏕�?��Q=��M��Sn��EJ'2��pS���^c�_k�to��Y�n���%#��j0O�Ai�/@�k�=ToM�������wC���o������lE����y�9B��<�#��c�?b
�      �   ,   x�3���v����Cc;srq�9"���@��b���� �OU      �   �  x�eSю�0|N�b`O)�>%I��C����;n��S+E��홌�g�.�|"�_�[����1�IU�|���'��j]�}$�c��l�;�jE��r���5׹��Mm��t�Z_�4��B� `����^Ѝ��;���0}���F�+�~G\)��oYڀ�����VQ?�VW5>��I�#�4�/KŔn0�Y�����ڀ��o��j��zۋ���1�ޤB��x�d�s�H����R�LA.;b��BhgC�¹f �BS����>?���ʽ�¹��Us�{KƋ���
CmXt����0�]�B�E�m���ZJ��0B.�R�c�i9��	�2q|�����
��0���9�����!\Ks(3�k�A����5�MA��`&��Va/\g?���A7��
�|i
�lc�mY��=�=?�?��7�������Fw��>~Sif��� ��_�����P      �   �  x�m��n�0���S�	&B�n�4j(.O!B���?��qB�t>�slW���E|�p�x�Ha����_wb����#D0�fʑ�;"���婖���z��r���@��0A-�<�� ����":��˪�`� J��tw�<8j(�s�|nH����(_;�e�6�W��[�d]�2�hv�����`miɐ��Ú���0��k��e<���ccH���k���BK�q�޻If��*�\]�Pt�nVq�O|�}o3����U�.;�M�^�p �$��Yr�W6W�e�El9@��Y��шOn^ŉ����PJ�ͅg���x�r:&�#�c5��u�&���0��(�"�9G�<M��HF�Y�����;�r?W9N%~���F��za\t��f9$�ӳ��R\��|$5���#��b+l�!��~�R���~�"�Y�ר����+��'�_��"k��Uވ�H^z�[藿����t:�5W?�      �   �   x�MQA��0;O_��+��ǩH!�vFj��"��w�4A�!c;[1ts,L5=����ZƆ\`�|�A<��r�����e��R��z��N�q���upL��|��J��z��u,s��N<�1��e��E�v�jb N���\~ݢ×�f<����	���i����ݫW�:4��w��%m��>��z�
���ν-����t�7���;$�̡;@�AeQ_��OUU��tj�      �   #  x��W[��:�N����g�5p�l�$PK��Y�l�VBB3CG�˧�O�*3��E2·���S����k�"�x��<QT��R���A�8�n[9���]�VE��Cq�_1:}lŘ4���g�t�춂���{�������y��C�<�� ����8����$�vM�!��ıX��<RD�La�ؒmʺ0���G��]�upu�t�q%�J�����4<�2�?n����+�u�L}�Inxn]TkLH�X�4���� ��=��њ.��I���F
}u{�T>F�sI��4}w�3H��{߁���
BeL�)���%�4twR���$�*#�j�!�����@r���"�i�q{w����Bǲޑ=�Ta)z:��P�	7ś�ҩ�P.~�^ևu�ƚ�����q�抮��=!�����ԢK���=��1G��E<c8�*U��J8�r��ߔ�:��N�O�{�̩T	�T'��d����Ԥ�h����KE>��n؀5'�VfVM����`#8��z�Ă�M}�"R�4����q�uD)^���2���ozR2E�LD'�N`���/��O�k7p��;���� �Z&����ň{uU�����,fe��n��KFc��Ժ.wu�t�]�s%���D�E�H>�o�l���z�,�N�*ӄ�d��pB�m<��Ç��"bx؂���ظdR��!�И=NE�I�_�����^BeVt,ޡT<����P�~׍���� �r.��_ul�\8r��#�|��bJ�z��]�/l��^�(o�v�4��B�����ME�jf	VXg�[���K��z	b�!*vA!��	��M
ņ+b��2��\X�C7�?��ˡ��L�p��`���I��֚đ�ic�?�{���"ab����S��#�GPw�x�*������hkz�뇈陆/|�Ų4ß��(R_�aRpeC=��ɪw��9/����6�*�b#���(�*�����i�C�r��l	»�	lbI&9��n]��:���o��7��항p�k����	�{����?���2      �   L  x������0���S�6�
3Gw��$U!�����[
14T�J��|q����4I��4�p�F��v�~���<-%�!N+�@}���Eg��?؆l�aD����aYW�`O�Z��2���7Pt��3�`��k-�&��@1@X����+T��w�����?��@*�4���k��*:}�'�అ],�i��hE�/���-��,����[�	� ��1*�����ћ��Q�b�K����<bv^���ng��w�p���n
��ː|W���者���ƹ�x�[�.�(����8�◗n� �-�h0p�e��E���0zue�%׺C�������?bn���^��[MC���!�)JR�ˣn�۞�؆]&�,͓�Q��/=�ݱ���n�ޅ�RL�L��6��-f5o���4�6Y�/U�!��l�b��L�Os�Y��{����sĘ�c֦R�4O"�rn�͵�]�2*��<��/3&�/�O݂��َ��]BGkKO�H�a��v��\I������Y�$w�S���"���_.�GTM��d�ŧ��?���?}V�      �   �  x����N�0ǯۧ�@���]�v����D�EI6A_����lA�9���-�����1 U�O� �A��Y�nmr�� ˛n��xg2��T[]8�(�ۢ*I� J��}ڼ�S)�����.""�N��M	��3 AL�Y���<�e<��\%��15�ouͶUV�R����,�"��|�P=@d�jC)�Ti�����*��n^��TcX���Y7�~���pB�; A�O��*���m����@0c�co@�ޯ�p9Y ��a"/f(<~O+մ�[z��fiM�Lh?>�`ty'f���:�����9����/j� ��k�.�g�y�i֙�:��<��E��-��> Am�l�����CĞ�����{�	Bǃ�vm�1b@�kB�q=�      �   !   x�3�44060440��N��IU0����� A��      �   �   x�5��
�0�/S��d(Dq��Z�.��1ؤ�����"�� p�C�$����v}<c�����hJL�0�M|/�oݐ]G�}$�M ?�p�e�謍�s's}I�����˔b��+γ�_�d��о'      �   �  x�u�Q��0���)8��$��>5��G!����9�!���P%��c��hD`=Xz�	X�JV͉�F@��2>��i�/ex9�{a��,+�;�  f]f�c����0��#����c��������II#�]J��+�?���x��k&V�,�v�x��>D4	�;��b���	�ӈ,�q�̔:�t�7;�g���6#�H�`\���F�3I.tz�ף2I6���Ŭ'h���,�ɲlv9^�Lc�u���&�u�d3�zqTE�,T��}���^���͔��i�7d��Ĵ}��Ɨ�q��^��4�	-g^7���s�67��z�;\��į��x���j��C�a����Y�vZ�W抋��f�_̌��%l3�߻���E�7�k��\��o�dre2B�YǦLy��mA���l�LNyZ��: ���z3C��v�dX0��?��t����t�q�!�     