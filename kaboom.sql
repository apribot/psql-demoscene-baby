
DO $$                                 
  DECLARE 
    rec record;  
    buffer text;
BEGIN
  FOR rec IN 
    SELECT r FROM generate_series(0, 48, 3) x(r) 
  LOOP
    buffer := (
      WITH core AS (
        SELECT 
          y, 
          x,
          ceil(sqrt(((x - 40) ^ 2) + (((y - 12) * 2) ^ 2)))::int AS d
        FROM 
          generate_series(0,80,1) xx(x) 
          CROSS JOIN generate_series(0,24,1) xy(y)
        ORDER BY 1,2
      ), refine AS (
        SELECT
          CASE 
            WHEN x = 0 THEN e'\n'
            WHEN d = rec.r THEN '*'
            WHEN d < rec.r THEN 
              CASE 
                WHEN rec.r > 35 THEN ' '
                WHEN rec.r > 25 AND d % 2 != 0 THEN '-'
                WHEN rec.r > 15 AND d % 2 = 0 THEN ' '
                ELSE (regexp_split_to_array('****#@', ''))[ (random() * 5) + 1] 
              END 
            ELSE ' ' 
          END as c 
        FROM core
      )
      SELECT array_to_string(array_agg(c),'') 
      FROM refine );

      RAISE NOTICE '%', buffer;
      PERFORM pg_sleep(0.1);

  END LOOP;
END$$;

