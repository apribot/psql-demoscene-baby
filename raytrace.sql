CREATE OR REPLACE FUNCTION raytrace() RETURNS void AS
$$
  DECLARE 
    outp TEXT[];
    _n BIGINT DEFAULT 1;
  BEGIN
  LOOP
    _n := _n + 7;

    WITH base AS (
      SELECT 
        round(64.0 - ((1.0/64.0)*x), 16) as i,
        round( (64.0/(lag((64.0 - ((1.0/64.0)*x))  , 1) over ())), 16) as j
      FROM generate_series(0, 3840) q(x)
    )
    SELECT INTO outp array_agg(
      CASE WHEN (b.i % 2 != 0) THEN
        (array['█', '░' ]) [ 1+   ((abs(    ((b.i % 2) * b.j) - b.j + (_n::numeric / 64.0)    )::int # b.j::int) % 2 != 0 )::int ]
      ELSE 
        e'\n'
      END
    )
    FROM base b 
    WHERE b.j IS NOT NULL;

    RAISE NOTICE e'\n%', array_to_string( outp, '');
    EXECUTE pg_sleep(0.05);
  END LOOP;
END;
$$ language plpgsql;

