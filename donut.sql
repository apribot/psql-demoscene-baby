CREATE OR REPLACE FUNCTION public.donut()
 RETURNS void
 LANGUAGE plpgsql
AS $function$
  DECLARE
    _A float8;
    _B float8;
    b text[];
    z float8[];
    cA float8;
    sA float8;
    cB float8;
    sB float8;

    data text[] default regexp_split_to_array('.,-~:;="%#@','');

    sintable float8[];
    costable float8[];

    timer TIMESTAMPTZ default now();

  BEGIN
  _A := 1;
  _B := 1;

  FOR k IN 1..728 LOOP
    sintable[k] = sin(k/100.0);
    costable[k] = cos(k/100.0);
  END LOOP;

  LOOP
    _A := _A + 0.07;
    _B := _B + 0.07;

    cA := cos( _A );
    sA := sin( _A );
    cB := cos( _B );
    sB := sin( _B );

    SELECT INTO b array_agg(CASE WHEN N > 0 THEN data[N]
      ELSE blank END ORDER BY k)
    FROM
    (
      SELECT
        k,
        CASE WHEN k % 80 = 79 THEN e'\n' ELSE ' ' END AS blank
      FROM generate_series(1, 1761) k
    ) p
    LEFT JOIN
    (
      SELECT
        o,
        max(N) AS N
      FROM
      (
        SELECT
          *,
          x + 80 * y AS o,
          0 | (8*((m3-sp*m4)*cB-sp*m5-m6-cp*ct*sB))::int AS N
        FROM
        (
          SELECT
            *,
            0 | (40 + 30 * D *(cp * m8 - t * sB))::int AS X,
            0 | (12 + 15 * D *(cp * m7 + t * cB))::int AS Y
          FROM
          (
            SELECT
              *,
              1 / (sp * m1 + m6 + 5) AS D,
              sp * m2 - m3 AS t
            FROM
            (
              SELECT
                *,
                h * sA AS m1,
                h  * cA AS m2,
                st * SA AS m3,
                ct * cA AS m4,
                ct * sA AS m5,
                st * cA AS m6,
                h * sB AS m7,
                h * cB AS m8
              FROM
              (
                SELECT
                  sintable[i] as sp,
                  costable[i] as cp,
                  ct + 2 AS h,
                  ct,
                  st
                FROM generate_series(100, 728, 2) i
                CROSS JOIN
                (
                  SELECT
                    costable[j] AS ct,
                    sintable[j] AS st
                  FROM generate_series(100, 728, 7) j
                ) q
              ) q
            ) q
          ) q
        ) q
      ) q GROUP BY o
    ) q ON q.o = p.k;

    RAISE NOTICE '%', array_to_string( b, '')
      || (clock_timestamp() - timer)::INTERVAL(2);

    timer := clock_timestamp();
  END LOOP;
END;
$function$
