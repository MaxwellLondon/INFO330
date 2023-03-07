--8
SELECT a.id, a.firstName, a.lastName
FROM Actors a, Role r, Movies m
WHERE a.id = r.actor_id
AND m.id = r.movie_id
AND m.release >= '03-06-2018'
GROUP BY a.id, a.firstName, a.lastName
ORDER BY count(m.id) DESC
LIMIT 1;

--10
SELECT d.id, d.firstName, d.lastName, avg(r.score)
FROM Directors d, Directs s, Movies m, Rating r
WHERE d.id = s.director_id
AND m.id = s.movie_id
AND m.id = r.movie_id
GROUP BY d.id, d.firstName, d.lastName
ORDER BY avg(r.score) DESC
LIMIT 5;

--11
SELECT a.id, a.firstName, a.lastName, avg(r.score)
FROM actors a, movies m, Rating r, role o
WHERE a.id = o.actor_id
AND m.id = o.movie_id
AND m.id = r.movie_id
GROUP BY a.id, a.firstName, a.lastName
ORDER BY avg(r.score) ASC
LIMIT 5;

--18
SELECT m.id, m.title, m.runtime
FROM Movies m, appUser u, Rating r
WHERE m.id = r.movie_id
AND u.id = r.user_id
ORDER BY cast(m.runtime as INTEGER) desc;

