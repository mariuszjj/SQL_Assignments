-- Assignment – SQL One to Many Relationships

-- In this assignment, we’ll practice working with one-to-many relationships in SQL. Suppose you are tasked with keeping track of a database that contain the best “how-to” videos on MySQL. 

-- You may want to first create a new database (schema) for this assignment.
CREATE SCHEMA `videos` DEFAULT CHARACTER SET utf8mb4 ;

-- 1. Videos table. Create one table to keep track of the videos. This table should include a unique ID, the title of the video, the length in minutes, and the URL. Populate the table with at least three related videos from YouTube or other publicly available resources.
DROP TABLE reviewer;
DROP TABLE video;
CREATE TABLE video(
	v_id varchar(11) not null unique, 
    title varchar(30) not null, 
    length time,
    URL varchar(100) not null,
    primary key(v_id)
);
INSERT INTO video 
	VALUES
		('EBxS9CAgc8Y', 'HOW TO KISS (TUTORIAL)', '00:04:49', 'https://www.youtube.com/watch?v=EBxS9CAgc8Y'),
		('0BQzsNatQOY', 'How To Survive a Shark Attack', '00:02:13', 'https://www.youtube.com/watch?v=0BQzsNatQOY'),
		('B9SptdjpJBQ', 'How To Learn Faster', '00:04:07', 'https://www.youtube.com/watch?v=B9SptdjpJBQ')
;

-- 2. Create and populate Reviewers table. Create a second table that provides at least two user reviews for each of at least two of the videos. These should be imaginary reviews that include columns for the user’s name (“Asher”, “Cyd”, etc.), the rating (which could be NULL, or a number between 0 and 5), and a short text review (“Loved it!”). There should be a column that links back to the ID column in the table of videos.
CREATE TABLE reviewer(
	r_id varchar(11) not null unique,
    user varchar(20) not null, 
    v_id varchar(11) not null, 
    rating int(6), 
    review varchar(40),
    primary key(r_id),
    foreign key(v_id) references video(v_id)
);
INSERT INTO reviewer
	VALUES
		('EBxS9CAgc81', 'Adilene Fdz', 'EBxS9CAgc8Y', '4', 'Her eyes so beautiful'), 
        ('EBxS9CAgc82', 'Arohi Gujjar', 'EBxS9CAgc8Y', '4', 'Thnxxx for teaching'),
        ('EBxS9CAgc83', 'Ashster !', 'EBxS9CAgc8Y', '3', 'So when the sex tutorial coming?﻿'),
        ('EBxS9CAgc84', 'Sohel Khan', 'EBxS9CAgc8Y', '2', 'Rule no.1 get a girlfriend﻿'),
        ('0BQzsNatQO1', 'Jerome Harley Joker', '0BQzsNatQOY', '0', 'Where r the eggs?????'), 
        ('0BQzsNatQO2', 'Terex', '0BQzsNatQOY', '1', 'Thanks'),
        ('0BQzsNatQO3', 'Anas Nebulous', '0BQzsNatQOY', '3', 'What if im bald? :v'),
        ('B9SptdjpJB1', 'Megan McCann', 'B9SptdjpJBQ', '5', 'I''ve been waiting for this...'), 
        ('B9SptdjpJB2', 'potatoe gal 05', 'B9SptdjpJBQ', '1', 'Is Beyonce actually alien lol'),
        ('B9SptdjpJB3', 'Gowtham S', 'B9SptdjpJBQ', '3', 'I''m gonna try this at home!')
;

-- 3. Report on Video Reviews. Write a JOIN statement that shows information from both tables.
SELECT reviewer.user, reviewer.rating, video.title, video.length, reviewer.review, video.URL
	FROM reviewer
	INNER JOIN video ON reviewer.v_id=video.v_id
    ORDER BY reviewer.rating DESC, video.title;
        

