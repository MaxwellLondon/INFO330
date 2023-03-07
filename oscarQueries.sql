-- 1. Show all five star ratings from a user
-- select username, id, r.score
-- from appuser u
-- join rating r on u.id = r.user_id 
-- 	and r.score > 4;

-- 3. What genre of movies does user austenfan review the most?

-- select username, id, r.score
-- from appuser u
-- join rating r on u.id = r.user_id 