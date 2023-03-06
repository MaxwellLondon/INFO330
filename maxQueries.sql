-- 5
-- How many hours did austenfan spend watching horror movies in 2022? (Administrator)

SELECT u.user_id, sum(m.runtime) FROM Rating r LEFT JOIN appUser u ON r.user_id = a.id LEFT JOIN Movies m ON r.movie_id = m.id WHERE u.user_id = 'austenfan' AND m.genre = 'horror';

-- 14
-- Who is the biggest hater on the app? (lowest average rating, min 10 ratings). (Administrator)

SELECT r.user_id, avg(score), count(*), FROM Rating r GROUP BY r.user_id HAVING count(*) > 10 ORDER BY avg(score) ASC;

-- 15
-- What are the top 5 highest reviewed genres on the app? (User)

SELECT m.genre, count(r.rating_id) FROM Rating r LEFT JOIN Movies m ON r.movie_id = m.id GROUP BY m.genre ORDER BY count(r.rating_id) DESC;

-- 18
-- What is the id of the longest movie watched by user austenfan? (Administrator)

SELECT r.user_id, m.runtime, m.movie_id FROM Rating r LEFT JOIN Movies m ON r.movie_id = m.id WHERE r.user_id = 'austenfan' GROUP BY r.user_id, m.runtime, m.movie_id HAVING max(m.runtime);