WITH w AS (
  SELECT (pi() / 2.0)::numeric AS p
), x AS (
  SELECT
    (to_char(now(),'24HH')::numeric % 12.0 / 3.0 * w.p + w.p)::numeric % (w.p * 4.0)::numeric AS h,
    (to_char(now(),'MI')::numeric / 15.0 * w.p + w.p)::numeric % (w.p * 4.0)::numeric AS m,
    (to_char(now(),'SS')::numeric / 15.0 * w.p + w.p)::numeric % (w.p * 4.0)::numeric AS s,
    49 as e,
    w.p
  FROM w
), y AS (
  SELECT
    q.c,
    x.*
  FROM 
    generate_series(0,99) q(c)
    CROSS JOIN x
), z AS (
 SELECT 
    q.r,
    y.*
  FROM
    generate_series(1,100,2) q(r)
    CROSS JOIN y
), click AS (
  SELECT
    z.*,
    |/ (((r - e) ^ 2) + ((c - e) ^ 2)) AS d,
    (atan2(e - r, e - c) + p * 4.0)::numeric % (p * 4.0)::numeric AS a
  FROM z
), clack AS (
  SELECT
    c.*,
    (
      d < e * 0.8 
      AND @ (m - a) * d < 0.5 
    ) OR (
      d < e * .5 
      AND @ (h - a) * d < .5
    ) OR (
      d < e * 1 
      AND @ (s - a) * d < .5
    ) AS idk
  FROM click c
), clock AS (
  SELECT
    concat(
      CASE WHEN 
        d - e > 0 
        OR d < 1 
        OR idk 
        THEN '█' 
      ELSE ' ' END,
      CASE WHEN c = 99 THEN e'\n' ELSE '' END
    ) AS o
  FROM clack
)
SELECT array_to_string(array_agg(o), '') as c FROM clock \watch 1
