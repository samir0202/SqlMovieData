CREATE DATABASE MoviesApp;

USE MoviesApp;

CREATE TABLE ACTOR(
ACTID integer,
ACT_FNAME VARCHAR(20),
ACT_LNAME VARCHAR(20),
ACTGENDER CHAR(1),
PRIMARY KEY (ACTID));


INSERT INTO ACTOR (ACTID, ACT_FNAME, ACT_LNAME, ACTGENDER) VALUES(101,'James', 'Stewart', 'M');
INSERT INTO ACTOR (ACTID, ACT_FNAME, ACT_LNAME, ACTGENDER) 
VALUES(102,'Deborah','Kerr','F'),
(103,'Peter','OToole', 'M'),
(104,'Robert','De Niro','M'),
(105,'F. Murray','Abraham','M'),
(106,'Harrison','Ford','M'),
(107,'Nicole','Kidman','F'),
(108,'Stephen','Baldwin','M'),
(109,'Jack', 'Nicholson','M'),
(110,'Mark','Wahlberg','M'),
(111, 'Woody','Allen','M'),
(112,'Claire','Danes','F'),
(113,'Tim','Robbins','M'),
(114,'Kevin','Spacey','M'),
(115,'Kate','Winslet','F'),
(116,'Robin','Williams','M'),
(117,'Jon','Voight','M'),
(118,'Ewan','McGregor','M'),
(119,'Christian','Bale','M'),
(120,'Maggie','Gyllenhaal','F'),
(121,'Dev','Patel','M'),
(122,'Sigourney','Weaver','F'),
(123,'David','Aston','M'),
(124,'Ali','Astin','F');

select * from ACTOR



CREATE TABLE MOVIES(
MOV_ID integer,
MOV_TITLE VARCHAR(50),
MOV_YEAR integer,
MOV_TIME integer,
MOV_LANG VARCHAR(50),
MOV_Dt_REL date,
MOV_REl_COUNTRY VARCHAR(50),
PRIMARY KEY (MOV_ID));


INSERT INTO MOVIES (MOV_ID, MOV_TITLE,MOV_YEAR,MOV_TIME,MOV_LANG,MOV_Dt_REL,MOV_REl_COUNTRY) VALUES
(901,'Vertigo', 1958,128,'English','1958-08-24','UK');
INSERT INTO MOVIES (MOV_ID, MOV_TITLE,MOV_YEAR,MOV_TIME,MOV_LANG,MOV_Dt_REL,MOV_REl_COUNTRY) VALUES
(902,'The Innocents',1961,100,'English','1962-02-19','SW'),
(903,'Lawrence of Arabia',1962,216,'English','1962-12-11','UK'),
(904,'The Deer Hunter',1978,183,'English','1979-03-08','UK'),
(905,'Amadeus',1984,160,'English','1985-01-07','UK'),
(906,'Blade Runner',1982,117,'English','1982-09-09','UK'),
(907,'Eyes Wide Shut',1999,159,'English','1999-07-16','UK'),
(908,'The Usual Suspects',1995,106,'English','1995-08-25','UK'),
(909,'Chinatown',1974,130,'English','1974-08-09','UK'),
(910,'Boogie Nights',1997,155,'English','1998-02-16','UK'),
(911,'Annie Hall',1977,93, 'English','1977-04-20','USA'),
(912,'Princess Mononoke',1997,134,'Japanese','2001-10-19','UK'),
(913,'The Shawshank Redemption',1994,142,'English','1995-02-17', 'UK'),
(914,'American Beauty',1999,122,'English','1998-04-12','UK'),
(915,'Titanic',1997,'194','English','1998-01-23','UK'),
(916,'Good Will Hunting',1997,126,'English','1998-06-03','UK'),
(917,'Deliverance',1972,109,' English','1982-10-05','UK'),
(918,'Trainspotting',1996,94,'English','1996-02-23','UK'),
(919,'The Prestige',2006,130,'English','2006-11-10','UK'),
(920,'Donnie Darko',2001,113,'English','2002-08-14','UK'),
(921,'Slumdog Millionaire',2008,120,'English','2009-01-09','UK'),
(922, 'Aliens',1986,137,'English','1986-08-29','UK'),
(923,'Beyond the Sea',2004,118,'English','2004-11-26','UK'),
(924,'Avatar',2009,162,'English','2009-12-17','UK'),
(926,'Seven Samurai',1954,207,'Japanese','1954-04-26','JP'),
(927,'Spirited Away',2001,125,'Japanese','2003-09-12','UK'),
(928,'Back to the Future',1985,116,'English','1985-12-04','UK'),
(925,'Braveheart',1995,178,'English','1995-09-08','UK');


SELECT * FROM MOVIES



CREATE TABLE MOVIECAST(
ACTID INTEGER,
MOV_ID INTEGER,
ROLE VARCHAR(30),
FOREIGN KEY (ACTID) REFERENCES ACTOR(ACTID),
FOREIGN KEY (MOV_ID) REFERENCES MOVIES(MOV_ID));


INSERT INTO MOVIECAST(ACTID,MOV_ID,ROLE) VALUES
(101,901,'John Scottie Ferguson'),
(102,902,'Miss Giddens'),
(103,903,'T.E. Lawrence'),
(104,904,'Michael'),
(105,905,'Antonio Salieri'),
(106,906,'Rick Deckard'),
(107,907,'Alice Harford'),
(108,908,'McManus'),
(110,910,'Eddie Adams'),
(111,911,'Alvy Singer'),
(112,912,'San'),
(113,913,'Andy Dufresne'),
(114,914,'Lester Burnham'),
(115,915,'Rose DeWitt Bukater'),
(116,916,'Sean Maguire'),
(117,917,'Ed'),
(118,918,'Renton'),
(120,920,'Elizabeth Darko'),
(121,921,'Older Jamal'),
(122,922,'Ripley'),
(114,923,'Bobby Darin'),
(109,909,'J.J. Gittes'),
(119,919,' Alfred Borden');


SELECT * FROM MOVIECAST


CREATE TABLE DIRECTOR(
DIRID Integer,
DIR_FNAME VARCHAR(20),
DIR_LNAME VARCHAR(50),
PRIMARY KEY (DIRID));


INSERT INTO DIRECTOR (DIRID, DIR_FNAME, DIR_LNAME) VALUES
(201,' Alfred','Hitchcock'),
(202,'Jack','Clayton'),
(203,'David','Lean'),
(204,'Michael','Cimino'),
(205,'Milos','Forman'),
(206,'Ridley','Scott'),
(207,'Stanle','Kubrick'),
(208 ,'Bryan','Singer'),
(209,'Roman','Polanski'),
(210,'Paul','Thomas Anderson'),
(211,'Woody',' Allen'),
(212,'Hayao','Miyazaki'),
(213,'Frank','Darabont'),
(214,'Sam','Mendes'),
(215,'James','Cameron'),
(216,'Gus','Van Sant'),
(217,'John','Boorman'),
(218,'Danny','Boyle'),
(219,'Christopher','Nolan'),
(220,'Richard','Kelly'),
(221,'Kevin','Spacey'),
(222,'Andrei','Tarkovsky'),
(223,'Peter','Jackson');


SELECT * FROM DIRECTOR;


CREATE TABLE MOVIE_DIRECTION(
DIRID INTEGER,
MOV_ID INTEGER,
FOREIGN KEY (DIRID) REFERENCES DIRECTOR(DIRID),
FOREIGN KEY (MOV_ID) REFERENCES MOVIES(MOV_ID));


INSERT INTO MOVIE_DIRECTION (DIRID,MOV_ID) VALUES
(201,901),
(202,902),
(203,903),
(204,904),
(205,905),
(206,906),
(207,907),
(208,908),
(209,909),
(210,910),
(211,911),
(212,912),
(213,913),
(214,914),
(215,915),
(216,916),
(217,917),
(218,918),
(219,919),
(220,920),
(218,921),
(215,922),
(221,923);


SELECT * FROM MOVIE_DIRECTION


CREATE TABLE REVIEWER(
REV_ID INTEGER,
REV_NAME VARCHAR(30),
PRIMARY KEY (REV_ID));



INSERT INTO REVIEWER (REV_ID, REV_NAME) VALUES
(9001,'Righty Sock'),
(9002,'Jack Malvern'),
(9003,'Flagrant Baronessa'),
(9004,'Alec Shaw'),
(9005, NULL),
(9006,'Victor Woeltjen'),
(9007,'Simon Wright'),
(9008,'Neal Wruck'),
(9009,'Paul Monks'),
(9010,'Mike Salvati'),
(9011,NULL),
(9012,'Wesley S. Walker'),
(9013,'Sasha Goldshtein'),
(9014,' Josh Cates'),
(9015,'Krug Stillo'),
(9016,'Scott LeBrun'),
(9017,'Hannah Steele'),
(9018,'Vincent Cadena'),
(9019,'Brandt Sponseller'),
(9020,'Richard Adams');


SELECT * FROM REVIEWER;


CREATE TABLE Genre(
Genre_ID INTEGER NOT NULL PRIMARY KEY,
Genre_Title varchar(20) NOT NULL
);


INSERT INTO Genre(Genre_ID, Genre_Title) VALUES
(1001,'Action'),
(1002,'Adventure'),
(1003,'Animation'),
(1004,'Biography'),
(1005,'Comedy'),
(1006,'Crime'),
(1007,'Drama'),
(1008,'Horror'),
(1009,'Music'),
(1010,'Mystery'),
(1011,'Romance'),
(1012,'Thriller'),
(1013,'War');


SELECT * FROM Genre;


CREATE TABLE RATING(
MOV_ID INTEGER,
REV_ID INTEGER,
REV_STARS INTEGER,
NUM_O_RATING INTEGER,
FOREIGN KEY (MOV_ID) REFERENCES MOVIES(MOV_ID),
FOREIGN KEY (REV_ID) REFERENCES REVIEWER(REV_ID));


INSERT INTO RATING (MOV_ID, REV_ID, REV_STARS, NUM_O_RATING) VALUES
(901,9001, 8.40, 263575),
(902,9002, 7.90, 20207),
(903,9003,8.30,202778),
(906,9005,8.20,484746),
(924,9006,7.30,NULL),
(908,9007,8.60,779489),
(909,9008,NULL ,227235),
(910,9009,3.00,195961),
(911,9010,8.10,203875),
(912,9011,8.40,NULL),
(914,9013,7.00,862618),
(915,9001,7.70,830095),
(916,9014,4.00,642132),
(925,9015,7.70,81328),
(918,9016,NULL,580301),
(920,9017,8.10,609451),
(921,9018,8.00,667758),
(922,9019,8.40,511613),
(923,9020,6.70,13091);


SELECT * FROM RATING;



CREATE TABLE MOVIE_GENRES(
MOV_ID INTEGER,
Genre_ID INTEGER,
FOREIGN KEY (MOV_ID) REFERENCES MOVIES(MOV_ID),
FOREIGN KEY (Genre_ID) REFERENCES Genre(Genre_ID));



INSERT INTO MOVIE_GENRES (MOV_ID, Genre_ID) VALUES
(922,1001),
(917,1002),
(903,1002),
(912,1003),
(911,1005),
(908,1006),
(913,1006),
(926,1007),
(928,1007),
(918,1007),
(921,1007),
(902,1008),
(923,1009),
(907,1010),
(927,1010),
(901,1010),
(914,1011),
(906,1012),
(904,1013);

SELECT * from  MOVIE_GENRES;