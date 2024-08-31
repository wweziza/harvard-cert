SELECT DISTINCT p.name
FROM people p
JOIN stars s1 ON p.id = s1.person_id
JOIN movies m ON s1.movie_id = m.id
JOIN stars s2 ON m.id = s2.movie_id
JOIN people k ON s2.person_id = k.id
WHERE k.name = 'Kevin Bacon' AND k.birth = 1958 AND p.name != 'Kevin Bacon';
