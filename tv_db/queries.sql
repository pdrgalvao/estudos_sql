SELECT
    title,
    rating
FROM
    series
    JOIN reviews ON reviews.series_id = series.id;

SELECT
    title,
    round(AVG(rating), 1) AS avg_rating
FROM
    series
    JOIN reviews ON series.id = reviews.series_id
GROUP BY
    title
ORDER BY
    avg_rating ASC;

SELECT
    first_name,
    last_name,
    rating
FROM
    reviewers
    JOIN reviews ON reviewers.id = reviews.reviewer_id;

SELECT
    series.id,
    title,
    rating
FROM
    series
    LEFT JOIN reviews ON series.id = reviews.series_id
WHERE
    rating IS NULL;

SELECT
    genre,
    ROUND(AVG(rating), 1) AS avg_rating
FROM
    series
    JOIN reviews ON series.id = reviews.series_id
GROUP BY
    genre;



SELECT
    first_name,
    last_name,
    COUNT(rating) AS COUNT,
    IFNULL(MIN(rating), 0) AS MIN,
    IFNULL(MAX(rating), 0) AS MAX,
    ROUND(IFNULL(AVG(rating), 0), 1) AS AVG,
    CASE
        WHEN COUNT(rating) > 0 THEN 'ACTIVE'
        ELSE 'INACTIVE'
    END AS status
FROM
    REVIEWERS
    LEFT JOIN reviews ON reviewers.id = reviews.reviewer_id
GROUP BY
    first_name,
    last_name;

SELECT
    title,
    rating,
    CONCAT(first_name, ' ', last_name) AS reviewer
FROM
    reviews
    JOIN series ON reviews.series_id = series.id
    JOIN reviewers ON reviews.reviewer_id = reviewers.id
ORDER BY
    title ASC;