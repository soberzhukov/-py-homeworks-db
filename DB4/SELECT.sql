SELECT name, date FROM album
    WHERE date BETWEEN '2018-01-01' AND '2018-12-31';

SELECT name, duration FROM track
    ORDER BY duration DESC
    LIMIT 1;

SELECT name FROM track
    WHERE duration >= 210;

SELECT name FROM collection
    WHERE date BETWEEN '2018-01-01' AND '2020-12-31';

SELECT name FROM music_group
    WHERE name NOT LIKE '%% %%';

SELECT name FROM track
    WHERE name LIKE '%%мой%%' OR name LIKE '%%My%%';

