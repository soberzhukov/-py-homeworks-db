SELECT genre.name, COUNT(group_id) FROM genre
JOIN genregroup gg ON genre_id = genre.id
GROUP BY genre.name;

SELECT a.name, COUNT(t.name) FROM album a
JOIN track t ON album_id = a.id
WHERE date between '2018-01-01' and '2020-12-31'
GROUP BY a.name;

SELECT a.name, ROUND(AVG(duration),2) FROM album a
JOIN track t ON album_id = a.id
GROUP BY a.name;

SELECT mg.name FROM music_group mg
JOIN groupalbum ON group_id = mg.id
JOIN album a ON album_id = a.id
WHERE date NOT between '2020-01-01' and '2020-12-31';

SELECT c.name FROM collection c
JOIN trackcollection ON collection_id = c.id
JOIN track t ON track_id = t.id
JOIN album a ON t.album_id = a.id
JOIN groupalbum ga ON ga.album_id = a.id
JOIN music_group mg ON group_id = mg.id
WHERE mg.name = 'rammstein';

SELECT DISTINCT a.name FROM album a
JOIN groupalbum ga ON album_id = a.id
JOIN music_group mg ON ga.group_id = mg.id
JOIN genregroup gg ON gg.group_id = mg.id
WHERE gg.group_id IN (
    SELECT group_id FROM genregroup
    GROUP BY group_id
    HAVING COUNT(genre_id) >= 2);

SELECT t.name FROM track t
LEFT JOIN trackcollection tc ON track_id = t.id
WHERE track_id IS NULL;

SELECT DISTINCT mg.name FROM music_group mg
JOIN groupalbum ga ON group_id = mg.id
JOIN album a ON ga.album_id = a.id
JOIN track t ON t.album_id = a.id
WHERE t.duration in (SELECT MIN(duration) FROM track);

SELECT DISTINCT album.name FROM album
JOIN track ON album.id = track.album_id
WHERE track.album_id IN (
    SELECT album_id FROM track
    GROUP BY album_id
    HAVING COUNT(name) = (
        SELECT COUNT(name) FROM track
        GROUP BY album_id
        ORDER BY COUNT(name)
        LIMIT 1))

