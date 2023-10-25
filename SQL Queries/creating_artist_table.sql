--------------------------------------
-- Music Library Database Creation  --
--------------------------------------

-- Creating Artist Table

CREATE TABLE artist (
	artist_id SERIAL PRIMARY KEY,
	stagename VARCHAR(40) NOT NULL,
	genre VARCHAR(20) NOT NULL,
	label VARCHAR(25) NOT NULL,
	origin VARCHAR(5) NOT NULL
);


---> PRIMARY KEY : Auto-incrementing unique value identifier.
---> VARCHAR : Established character variable length limit.
---> NOT NULL : Column values cannot be empty.


-- Manually inserting data (rows) into Artist Table 

INSERT INTO artist (stagename, genre, label, origin)
VALUES
	('The Weeknd', 'R&B', 'Republic', 'CAN'),
	('Beck', 'Alternative', 'Interscope', 'USA'),
	('Kanye West', 'Hip-Hop/Rap', 'Def Jam', 'USA'),
	('Dua Lipa', 'Pop', 'Warner', 'UK'),
	('Bruno Mars', 'Pop', 'Atlantic', 'USA'),
	('Lady Gaga', 'Pop', 'Interscope', 'USA'),
	('Drake', 'Hip-Hop/Rap', 'Republic', 'CAN'),
	('Miley Cyrus', 'Pop', 'Columbia', 'USA'),
	('Kid Cudi', 'Hip-Hop/Rap', 'Republic', 'USA'),
	('Kendrick Lamar', 'Hip-Hop/Rap', 'Interscope', 'USA'),
	('Katy Perry', 'Pop', 'Capitol', 'USA'),
	('Post Malone', 'Hip-Hop/Rap', 'Republic', 'USA'),
	('Linkin Park', 'Alternative Rock', 'Warner', 'USA'),
	('Travis Scott', 'Hip-Hop/Rap', 'Epic', 'USA'),
	('Lily Allen', 'Pop', 'Independent', 'UK'),
	('Coldplay', 'Alternative Rock', 'Warner', 'UK'),
	('Selena Gomez', 'Pop', 'Interscope', 'USA'),
	('Michael Jackson', 'Pop', 'Epic', 'USA'),
	('Mac Miller', 'Hip-Hop/Rap', 'Warner', 'USA'),
	('J Balvin', 'Reggae', 'Universal', 'COL'),
	('Niall Horan', 'Pop', 'Capitol', 'IRE'),
	('Charles Perry', 'Pop', 'Independent', 'USA'),
	('LMFAO', 'Pop', 'Interscope', 'USA'),
	('Pharrell Williams', 'Pop', 'Columbia', 'USA'),
	('Rick Astley', 'Pop', 'RCA', 'UK'),
	('Mario', 'R&B', 'J Records', 'USA'),
	('USHER', 'Pop', 'RCA', 'USA'),
	('f(x)', 'K-Pop', 'SM', 'KOR'),
	('BIGBANG', 'K-Pop', 'YG', 'KOR'),
	('T-ara', 'K-Pop', 'MBK', 'KOR'),
	('PSY', 'K-Pop', 'YG', 'KOR'),
	('David Guetta', 'Electronic', 'Parlophone', 'FR')
