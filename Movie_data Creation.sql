use movie;
CREATE TABLE actor(
act_id			integer			NOT NULL,			
act_fname		Char(20)		NOT NULL,			
act_lname		Char(20)		NOT NULL,
act_gender		Char(1)			NULL,
CONSTRAINT		 actor_PK		PRIMARY KEY(act_id)
);

CREATE TABLE director(
dir_id			integer				NOT NULL,			
dir_fname		Char(20)			NOT NULL,			
dir_lname		Char(20)			NOT NULL,
CONSTRAINT		director_PK			PRIMARY KEY(dir_id)
);

CREATE TABLE movie(
mov_id			Integer				NOT NULL,			
mov_title		varChar(30)			NOT NULL,			
mov_year		integer				NOT NULL,
mov_time		integer				NULL,
mov_lang		varChar(20)			NULL,
mov_dt_rel		integer				NOT NULL,
CONSTRAINT		movie_pk			PRIMARY KEY(mov_id)
);

CREATE TABLE reviewer(
rev_id			integer				NOT NULL,			
rev_name		Char(30)			NOT NULL,			
CONSTRAINT		reviewer_PK			PRIMARY KEY(rev_id)
);

CREATE TABLE genres(
gen_id			Integer				NOT NULL,			
gen_title		Char(20)			NOT NULL,			
CONSTRAINT		gen_PK			PRIMARY KEY(gen_id)
);

CREATE TABLE movie_direction(
dir_id			integer				NOT NULL,			
mov_id			integer			    NOT NULL,
CONSTRAINT 		movie_direction_PK	PRIMARY KEY (dir_id, mov_id),
CONSTRAINT 		movie_direction_FK1		FOREIGN KEY (dir_id)
							REFERENCES             director(dir_id),
CONSTRAINT 	movie_direction_FK2		FOREIGN KEY (mov_id)
								REFERENCES           movie(mov_id)
);

CREATE TABLE movie_cast(
act_id			integer			    NOT NULL,			
mov_id			integer			    NOT NULL,
movie_role		Char(30)			NOT NULL,
CONSTRAINT 		movie_cast_pK		PRIMARY KEY (act_id, mov_id),
CONSTRAINT     	movie_cast_FK1		FOREIGN KEY(act_id)
							REFERENCES     	actor(act_id),
CONSTRAINT    	 movie_cast_FK2         FOREIGN KEY (mov_id)
							REFERENCES		 movie(mov_id)
);


CREATE TABLE movie_genres(
mov_id			Integer				NOT NULL,			
gen_id			integer				NOT NULL,
CONSTRAINT 		movie_genres_pK		PRIMARY KEY (mov_id, gen_id),			
CONSTRAINT		movie_genres_FK1		FOREIGN KEY(mov_id)
									REFERENCES movie(mov_id),
CONSTRAINT		movie_genres_FK2		FOREIGN KEY(gen_id)
									REFERENCES genres(gen_id)
);

CREATE TABLE rating(
mov_id			integer			NOT NULL,			
rev_id			integer			NOT NULL,			
rev_stars   	integer			NOT NULL,
num_o_ratings 	integer			NOT NULL,
CONSTRAINT 		rating_PK		PRIMARY KEY (rev_id, mov_id),
CONSTRAINT		rating_FK1		FOREIGN KEY(mov_id)
								REFERENCES movie(mov_id),
CONSTRAINT		rating_FK2		FOREIGN KEY(REV_id)
								REFERENCES reviewer(rev_id)
);
