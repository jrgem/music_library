# Music Database Analysis

## Question Solutions

### 1. How many artists are present in the library?
```sql
SELECT COUNT (artist_id) AS artist_count
FROM   artist;
```

**Solution:**

<img width="100" alt="question1" src="https://github.com/jrgem/music_library/assets/145512344/c750c051-2141-4900-840e-89aac3e3249f">

There are 31 artists.
- - -

### 2. How many songs are in the library?
```sql
SELECT COUNT (title) AS song_count
FROM   song;
```
**Solution:**

<img width="99" alt="question1 5" src="https://github.com/jrgem/music_library/assets/145512344/b70e5c98-40d5-4ea0-be5d-2158b4ca17a3">

There are 692 total songs.
- - -

### 3. Show the stagename and origin of every artist from the United Kingdom.
```sql
SELECT stagename, origin
FROM   artist
WHERE  origin = 'UK';
```

**Solution:**

<img width="306" alt="question2" src="https://github.com/jrgem/music_library/assets/145512344/f1514e25-5263-49ff-a99e-2436c25ae7f4">

There are only 4 artists from the United Kingdom.
- - -

### 4. Find all the song titles containing "Blue".
```sql
SELECT title
FROM   song
WHERE  title LIKE '%Blue%';
```

**Solution:**

<img width="153" alt="question4" src="https://github.com/jrgem/music_library/assets/145512344/502b9339-fcf8-466e-b5a2-b4cf9be2077e">

3 songs out of 692 contain "Blue" in their title.
- - -

### 5. Show all columns for albums that have one of the following album_ids: 5, 10, 21, 100.
```sql
SELECT *
FROM   album
WHERE  album_id IN (5, 10, 21, 100);
```

**Solution:**

<img width="723" alt="question5" src="https://github.com/jrgem/music_library/assets/145512344/19817e84-2d86-4f52-b989-586e707fa724">

*King Of The Fall - Single* was assigned album_id 5, *Sea Change* album_id 10, *Watch The Throne* album_id 21, and *The Show* album_id 100.
- - -

### 6. How many albums by The Weeknd are in the library?
```sql
SELECT stagename, COUNT (album_title) AS total_albums
FROM   artist
INNER JOIN album
       ON  artist.artist_id = album.artist_id
GROUP BY  stagename
HAVING    stagename = 'The Weeknd';
```
**Solution:**

<img width="301" alt="question 6" src="https://github.com/jrgem/music_library/assets/145512344/0dbf1e62-2e3b-4b42-bbd8-7ea5b17a78c3">

The Weeknd has 8 albums in the library.
- - -

### 7. How many albums (excluding single albums) does every artist beginning with the letter 'B' have? Order in ascending.
```sql
SELECT stagename, COUNT (album_title) AS total_albums
FROM   artist
INNER JOIN album
       ON  artist.artist_id = album.artist_id
WHERE  album_title NOT LIKE '%Single%'
AND    stagename LIKE 'B%'
GROUP BY stagename
ORDER BY stagename ASC;
```

**Solution:**

<img width="299" alt="question6" src="https://github.com/jrgem/music_library/assets/145512344/72b1c3ea-7955-406e-9943-70e80af86c8f">

**B**eck has 6 albums, **B**igbang has  2, and **B**runo Mars has 4.
- - -

### 8. List all albums released between 2019 and 2020 including their total play count. Order by ascending release date.
```sql
SELECT album_title, release_date, SUM (song.plays) AS total_plays
FROM   album
INNER JOIN song
       ON  album.album_id = song.album_id
WHERE  release_date BETWEEN '2019-01-01'
     AND '2019-12-31'
     AND album_title NOT LIKE '%Single%'
GROUP BY album_title, release_date
ORDER BY release_date ASC;
```

**Solution:**

<img width="442" alt="question7" src="https://github.com/jrgem/music_library/assets/145512344/a04be37c-5d91-480b-a7a6-5f9518d168ab">

15 albums in the library released between 2019 and 2020.
- - -

### 9. Find the top 10 most played albums of all time.
```sql
SELECT album_title, SUM (plays) AS total_plays
FROM   album
INNER JOIN song
       ON album.album_id = song.album_id
GROUP BY album_title
ORDER BY total_plays DESC
LIMIT 10;
```

**Solution:**

<img width="348" alt="question 9" src="https://github.com/jrgem/music_library/assets/145512344/2a2168b9-65b2-4b4d-b07c-c6d97479c7af">

*Donda* by Kanye West is the most played album of all time.

Changing the `LIMIT` value to other integer like 20 would query the 20 most played albums instead of 10.
- - -

### 10. Find the top 10 most played songs of all time.
```sql
SELECT title, SUM (plays) AS total_plays
FROM   song
GROUP BY song_id
ORDER BY total_plays DESC
LIMIT 10;
```

**Solution:**

<img width="293" alt="question9" src="https://github.com/jrgem/music_library/assets/145512344/9b6ff40e-1e39-4d6b-936c-2d1280bca6c0">

'Blinding Lights' by The Weeknd is the most played song at 632 plays.
- - -

### 11. What is the length of 'The Void' by Kid Cudi in minutes in seconds?
```sql
SELECT title, TO_CHAR ((length_sec || 'second')::interval, 'MI:SS') AS length
FROM   song
WHERE  title = 'The Void';
```

**Solution:**

<img width="278" alt="question9 5" src="https://github.com/jrgem/music_library/assets/145512344/6c565da5-ea5a-4322-b330-c6324c0a712b">

'The Void' is 5 minutes and 25 seconds long after converting from 325 seconds.
- - -

### 12. What is the total playtime of 'The Fear' by Lily Allen in hours, minutes, and seconds?
```sql
SELECT title, TO_CHAR ((length_sec * plays || 'second')::interval, 'HH24:MI:SS') AS length
FROM   song
WHERE  title = 'The Fear';
```

**Solution:**

<img width="277" alt="question 12" src="https://github.com/jrgem/music_library/assets/145512344/df072fff-3e32-46a4-a0cb-540c7b59f3d3">

'The Fear' has a total playtime of 30 hours and 54 seconds. It has 552 plays and song length of 3:45.

Multiplied total plays by song length and converted total in seconds to hours, minutes, and seconds.
- - -

### 13. How many hours of music were heard in all albums individually released in 2020?
```sql
SELECT album.album_id,
       album.album_title,
       album.release_date,
       ROUND ( SUM (length_sec * plays) / 60 / 60::numeric, 2) AS playtime
FROM   album
INNER JOIN song
       ON  album.album_id = song.album_id
WHERE  release_date BETWEEN '2020-01-01' AND '2020-12-31'
GROUP BY   album.album_id
ORDER BY   playtime DESC;
```

**Solution:**

<img width="525" alt="question10" src="https://github.com/jrgem/music_library/assets/145512344/03bfa7f8-0dbb-4f00-8696-f4cd596078a1">

*Future Nostalgia* has the highest playtime of 101 hours.
- - - 

### 14. How many plays does *Graduation* by Kanye West have? Show album title and plays concatenated into one column.
```sql
SELECT CONCAT (album.album_title, ' ',
              (SELECT SUM (plays) FROM song
               WHERE album.album_id = song.album_id)) AS total_plays
FROM   album
GROUP BY album_id
     HAVING album_title = 'Graduation'
ORDER BY total_plays;
```

**Solution:**

<img width="157" alt="question13" src="https://github.com/jrgem/music_library/assets/145512344/2579f658-ab80-4a0d-9d6d-c282f247e45f">

Ran a sub-query within main query and concatenated results into the same column using `CONCAT`.

*Graduation* has 1,893 plays.
- - -

### 15. Who are the most and least played artists in the library?
```sql
SELECT stagename,
       (SELECT SUM (plays) FROM song
       WHERE artist.artist_id = song.artist_id) AS total_plays
FROM   song
WHERE stagename = 'Kanye West'
  OR  stagename = 'Charles Perry'
ORDER BY total_plays DESC;
```

**Solution:**

<img width="288" alt="question15" src="https://github.com/jrgem/music_library/assets/145512344/9469d658-0916-4fae-9173-669f0d507ecf">

Kanye West is the most played artist with 10,200 total plays across all songs while Charles Perry is the least played with 273 plays.
- - - 

### 16. Who is the 5th most played pop artist in the library?
```sql
SELECT stagename,
       (SELECT SUM (plays) FROM song
       WHERE artist.artist_id = song.artist_id) AS total_plays
FROM   artist
WHERE  artist.genre = 'Pop'
ORDER BY total_plays DESC
LIMIT 1 OFFSET 4;
```

**Solution:**

<img width="288" alt="question 16" src="https://github.com/jrgem/music_library/assets/145512344/2d8d9189-9906-4557-a448-23dcfa710d2a">

Dua Lipa is the 5th most played pop artist at 2,251 plays after ordering `total_plays` descending. The query limits to 1 result while beginning filtering on the 4th row.
- - -

### 17. How many songs share the same title? Like the title and count.
```sql
SELECT title, COUNT (title) AS total
FROM   song
GROUP BY title
HAVING   COUNT (title) > 1;
```

**Solution:**

<img width="278" alt="question 17" src="https://github.com/jrgem/music_library/assets/145512344/aa9f0b9c-f4a9-4fa3-8a94-2d0f23abf782">

7 song titles are shared by 2 songs each making it 14.
- - - 
