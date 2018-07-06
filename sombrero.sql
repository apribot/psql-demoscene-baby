

CREATE OR REPLACE FUNCTION public.goo()
 RETURNS void
 LANGUAGE plpgsql
AS $function$
  DECLARE
    _outp text;
    _flop_offset int;
    _flop_range int;
  BEGIN
    FOR flop IN 1..999 BY 1 LOOP

      _flop_range := (((ceil(flop::numeric / 2.0) % 2) * 2) - 1);
      _flop_offset := (flop % 2 - 1)*-1;

      _outp := '';
      _outp := (
        WITH grid0 AS (
          SELECT 
            b.x,
            CASE WHEN b.x = 3 * _flop_range THEN e'\n' ELSE '' END AS op
          FROM generate_series(-3 * _flop_range, 3 * _flop_range, 0.1 * _flop_range) b(x)
        ), grid AS (
          SELECT 
            b.x,
            a.y,
            (((sin(5 * b.x) * cos(5 * a.y))/5 ) * 25) + 6 + _flop_offset as v,
            b.op
          FROM generate_series(-3 * _flop_range, 3 * _flop_range, 0.1 * _flop_range) a(y)
          CROSS JOIN grid0 b
        )
        SELECT 
          array_to_string(
            array_agg( 
              coalesce(
                repeat(   
                  (regexp_split_to_array('█▓▒░░   ░░▒▓█', ''))[round(v)],
                  2
                ), 
                'x'
              ) || op
            ), '')
        FROM grid
      );

      raise notice '%', _outp;
      EXECUTE 'select pg_sleep(.25)';
    END LOOP;
  END;
$function$;
select goo();


--===============================================
--===============================================
--===============================================



WITH grid0 AS (
  SELECT 
    b.x,
    CASE WHEN b.x = 6 THEN e'\n' ELSE '' END AS op
  FROM generate_series(-6, 6, 0.3) b(x)
), grid AS (
  SELECT 
    b.x,
    a.y,
    round((sin(sqrt(b.x^2 + a.y^2))/sqrt(b.x^2+a.y^2)) * 10) + 3 as v,
    b.op
  FROM generate_series(-7, 5, 0.3) a(y)
  CROSS JOIN grid0 b
)
SELECT 
  array_to_string(
    array_agg( 
      coalesce(
        repeat(   
          (regexp_split_to_array('█▓▒░░   ░░▒▓█', ''))[round(v)],
          2
        ), 
        'x'
      ) || op
    ), '')
FROM grid;



/*
                                  array_to_string                                   
------------------------------------------------------------------------------------
 ▒▒▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒+
 ▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒▒+
 ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░+
 ░░░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░░░░░░░░░░░░░░░+
 ░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░░░░░░░░░░░+
 ░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░░░░░░░+
 ░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓██████████████████▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒░░░░░░░░░░░░░░+
 ░░░░░░░░░░░░▒▒▒▒▒▒▓▓▓▓▓▓▓▓██████████████████████████████▓▓▓▓▓▓▓▓▒▒▒▒▒▒░░░░░░░░░░░░+
 ░░░░░░░░░░▒▒▒▒▒▒▓▓▓▓▓▓██████████████████████████████████████▓▓▓▓▓▓▒▒▒▒▒▒░░░░░░░░░░+
 ░░░░░░░░▒▒▒▒▒▒▓▓▓▓▓▓██████████████████████████████████████████▓▓▓▓▓▓▒▒▒▒▒▒░░░░░░░░+
 ░░░░░░▒▒▒▒▒▒▓▓▓▓▓▓██████████████████████████████████████████████▓▓▓▓▓▓▒▒▒▒▒▒░░░░░░+
 ░░░░▒▒▒▒▒▒▓▓▓▓▓▓██████████████████████▓▓▓▓▓▓██████████████████████▓▓▓▓▓▓▒▒▒▒▒▒░░░░+
 ░░░░▒▒▒▒▓▓▓▓▓▓████████████████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓████████████████▓▓▓▓▓▓▒▒▒▒░░░░+
 ░░▒▒▒▒▓▓▓▓▓▓████████████████▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓████████████████▓▓▓▓▓▓▒▒▒▒░░+
 ░░▒▒▒▒▓▓▓▓██████████████▓▓▓▓▓▓▒▒▒▒░░░░░░░░░░░░░░▒▒▒▒▓▓▓▓▓▓██████████████▓▓▓▓▒▒▒▒░░+
 ▒▒▒▒▓▓▓▓▓▓████████████▓▓▓▓▒▒▒▒░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒▓▓▓▓████████████▓▓▓▓▓▓▒▒▒▒+
 ▒▒▒▒▓▓▓▓████████████▓▓▓▓▒▒▒▒░░░░░░              ░░░░░░▒▒▒▒▓▓▓▓████████████▓▓▓▓▒▒▒▒+
 ▒▒▒▒▓▓▓▓████████████▓▓▒▒▒▒░░░░                      ░░░░▒▒▒▒▓▓████████████▓▓▓▓▒▒▒▒+
 ▒▒▓▓▓▓████████████▓▓▓▓▒▒░░░░        ░░░░░░░░░░        ░░░░▒▒▓▓▓▓████████████▓▓▓▓▒▒+
 ▒▒▓▓▓▓████████████▓▓▒▒▒▒░░      ░░░░░░░░░░░░░░░░░░      ░░▒▒▒▒▓▓████████████▓▓▓▓▒▒+
 ▒▒▓▓▓▓██████████▓▓▓▓▒▒░░░░      ░░░░▒▒▒▒▒▒▒▒▒▒░░░░      ░░░░▒▒▓▓▓▓██████████▓▓▓▓▒▒+
 ▒▒▓▓▓▓██████████▓▓▓▓▒▒░░░░    ░░░░▒▒▓▓▓▓▓▓▓▓▓▓▒▒░░░░    ░░░░▒▒▓▓▓▓██████████▓▓▓▓▒▒+
 ▒▒▓▓▓▓██████████▓▓▓▓▒▒░░      ░░▒▒▒▒▓▓██████▓▓▒▒▒▒░░      ░░▒▒▓▓▓▓██████████▓▓▓▓▒▒+
 ▒▒▓▓▓▓██████████▓▓▒▒▒▒░░      ░░▒▒▓▓▓▓██████▓▓▓▓▒▒░░      ░░▒▒▒▒▓▓██████████▓▓▓▓▒▒+
 ▒▒▓▓▓▓██████████▓▓▒▒▒▒░░      ░░▒▒▓▓▓▓██████▓▓▓▓▒▒░░      ░░▒▒▒▒▓▓██████████▓▓▓▓▒▒+
 ▒▒▓▓▓▓██████████▓▓▓▓▒▒░░      ░░░░▒▒▓▓▓▓██▓▓▓▓▒▒░░░░      ░░▒▒▓▓▓▓██████████▓▓▓▓▒▒+
 ▒▒▓▓▓▓██████████▓▓▓▓▒▒░░░░    ░░░░▒▒▒▒▓▓▓▓▓▓▒▒▒▒░░░░    ░░░░▒▒▓▓▓▓██████████▓▓▓▓▒▒+
 ▒▒▓▓▓▓████████████▓▓▒▒░░░░      ░░░░▒▒▒▒▒▒▒▒▒▒░░░░      ░░░░▒▒▓▓████████████▓▓▓▓▒▒+
 ▒▒▓▓▓▓████████████▓▓▓▓▒▒░░░░      ░░░░░░░░░░░░░░      ░░░░▒▒▓▓▓▓████████████▓▓▓▓▒▒+
 ▒▒▓▓▓▓▓▓██████████▓▓▓▓▒▒░░░░░░        ░░░░░░        ░░░░░░▒▒▓▓▓▓██████████▓▓▓▓▓▓▒▒+
 ▒▒▒▒▓▓▓▓████████████▓▓▓▓▒▒░░░░░░                  ░░░░░░▒▒▓▓▓▓████████████▓▓▓▓▒▒▒▒+
 ▒▒▒▒▓▓▓▓██████████████▓▓▓▓▒▒░░░░░░              ░░░░░░▒▒▓▓▓▓██████████████▓▓▓▓▒▒▒▒+
 ▒▒▒▒▒▒▓▓▓▓██████████████▓▓▓▓▒▒▒▒░░░░░░░░░░░░░░░░░░▒▒▒▒▓▓▓▓██████████████▓▓▓▓▒▒▒▒▒▒+
 ░░▒▒▒▒▓▓▓▓▓▓██████████████▓▓▓▓▒▒▒▒▒▒░░░░░░░░░░▒▒▒▒▒▒▓▓▓▓██████████████▓▓▓▓▓▓▒▒▒▒░░+
 ░░▒▒▒▒▒▒▓▓▓▓████████████████▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓████████████████▓▓▓▓▒▒▒▒▒▒░░+
 ░░░░▒▒▒▒▓▓▓▓▓▓██████████████████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓██████████████████▓▓▓▓▓▓▒▒▒▒░░░░+
 ░░░░▒▒▒▒▒▒▓▓▓▓▓▓██████████████████████████████████████████████████▓▓▓▓▓▓▒▒▒▒▒▒░░░░+
 ░░░░░░▒▒▒▒▒▒▓▓▓▓▓▓██████████████████████████████████████████████▓▓▓▓▓▓▒▒▒▒▒▒░░░░░░+
 ░░░░░░░░▒▒▒▒▒▒▓▓▓▓▓▓██████████████████████████████████████████▓▓▓▓▓▓▒▒▒▒▒▒░░░░░░░░+
 ░░░░░░░░░░▒▒▒▒▒▒▓▓▓▓▓▓▓▓██████████████████████████████████▓▓▓▓▓▓▓▓▒▒▒▒▒▒░░░░░░░░░░+
 ░░░░░░░░░░░░▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓██████████████████████████▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒░░░░░░░░░░░░+
*/

WITH grid0 AS (
  SELECT 
    b.x,
    CASE WHEN b.x = 3 THEN e'\n' ELSE '' END AS op
  FROM generate_series(-3, 3, 0.1) b(x)
), grid AS (
  SELECT 
    b.x,
    a.y,
    (((sin(5 * b.x) * cos(5 * a.y))/5 ) * 25) + 6 as v,
    b.op
  FROM generate_series(-3, 3, 0.1) a(y)
  CROSS JOIN grid0 b
)
SELECT 
  array_to_string(
    array_agg( 
      coalesce(
        repeat(   
          (regexp_split_to_array('█▓▒░░   ░░▒▓█', ''))[round(v)],
          2
        ), 
        'x'
      ) || op
    ), '')
FROM grid;

/*
                                                      array_to_string                                                       
----------------------------------------------------------------------------------------------------------------------------
   ░░░░░░    ░░▒▒▓▓▒▒░░    ░░░░░░    ░░▒▒▓▓▓▓▒▒░░    ░░░░░░    ░░▒▒▓▓▒▒░░░░  ░░░░░░░░  ░░░░▓▓▓▓▒▒░░    ░░░░░░    ░░▒▒▓▓▓▓░░+
             ░░░░░░░░░░                ░░░░░░░░░░              ░░░░░░░░░░                ░░░░░░░░░░              ░░░░░░░░░░+
   ░░░░░░                  ░░░░░░                    ░░░░░░                  ░░░░░░                    ░░░░░░              +
 ░░▒▒▒▒░░░░    ░░░░░░    ░░░░▒▒▒▒░░░░    ░░░░      ░░▒▒▒▒▒▒░░    ░░░░░░    ░░░░▒▒▒▒░░░░    ░░░░      ░░▒▒▒▒▒▒░░      ░░░░  +
 ▒▒▓▓▓▓▓▓░░    ░░▒▒░░    ░░▓▓▓▓▓▓▒▒░░  ░░░░░░░░  ░░▒▒▓▓██▓▓░░    ░░▒▒░░░░  ░░▒▒▓▓▓▓▒▒░░  ░░░░░░░░    ░░▓▓██▓▓░░    ░░░░░░░░+
 ▒▒████▓▓░░  ░░░░▒▒░░░░  ░░▓▓████▒▒░░  ░░▒▒▒▒░░  ░░▒▒████▓▓░░    ░░▒▒▒▒░░  ░░▓▓████▓▓░░  ░░▒▒▒▒░░    ▒▒▓▓██▓▓▒▒    ░░▒▒▒▒░░+
 ▒▒▓▓▓▓▒▒░░    ░░░░░░    ░░▒▒▓▓▓▓▒▒░░  ░░░░░░░░  ░░▒▒▓▓▓▓▓▓░░    ░░░░░░░░  ░░▒▒▓▓▓▓▒▒░░  ░░░░░░░░    ░░▓▓▓▓▓▓░░    ░░░░░░░░+
 ░░░░░░░░░░              ░░░░░░░░░░░░              ░░░░░░░░░░              ░░░░░░░░░░░░              ░░░░░░░░░░            +
                                                                                                                           +
             ░░░░░░░░░░              ░░░░░░░░░░░░              ░░░░░░░░░░              ░░░░░░░░░░░░              ░░░░░░░░░░+
 ░░░░░░░░    ░░▓▓▓▓▓▓░░    ░░░░░░░░  ░░▒▒▓▓▓▓▒▒░░  ░░░░░░░░    ░░▓▓▓▓▓▓▒▒░░  ░░░░░░░░  ░░▒▒▓▓▓▓▒▒░░    ░░░░░░    ░░▒▒▓▓▓▓▒▒+
 ░░▒▒▒▒░░    ▒▒▓▓██▓▓▒▒    ░░▒▒▒▒░░  ░░▓▓████▓▓░░  ░░▒▒▒▒░░    ░░▓▓████▒▒░░  ░░▒▒▒▒░░  ░░▒▒████▓▓░░  ░░░░▒▒░░░░  ░░▓▓████▒▒+
 ░░░░▒▒░░    ░░▓▓██▓▓░░    ░░▒▒░░░░  ░░▒▒▓▓▓▓▒▒░░  ░░░░▒▒░░    ░░▓▓██▓▓▒▒░░  ░░░░░░░░  ░░▒▒▓▓██▓▓░░    ░░▒▒░░    ░░▓▓██▓▓▒▒+
   ░░░░      ░░▒▒▒▒▒▒░░      ░░░░    ░░░░▒▒▒▒░░░░    ░░░░░░    ░░▒▒▒▒▒▒░░      ░░░░    ░░░░▒▒▒▒░░░░    ░░░░░░    ░░░░▒▒▒▒░░+
               ░░░░░░                  ░░░░░░░░                  ░░░░░░                    ░░░░░░                  ░░░░░░  +
 ░░░░░░░░░░              ░░░░░░░░░░                ░░░░░░░░░░              ░░░░░░░░░░                ░░░░░░░░░░            +
 ░░▓▓▓▓▒▒░░    ░░░░░░    ░░▒▒▓▓▓▓░░░░  ░░░░░░░░  ░░░░▒▒▓▓▒▒░░    ░░░░░░    ░░▒▒▓▓▓▓▒▒░░    ░░░░░░    ░░▒▒▓▓▒▒░░    ░░░░░░  +
 ▒▒████▓▓░░  ░░░░▒▒░░░░  ░░▓▓████▒▒░░  ░░▒▒▒▒░░  ░░▒▒▓▓██▓▓░░    ░░▒▒░░░░  ░░▓▓████▒▒░░  ░░▒▒▒▒░░    ▒▒▓▓██▓▓▒▒    ░░▒▒▒▒░░+
 ▒▒▓▓██▓▓░░  ░░░░▒▒░░░░  ░░▓▓████▒▒░░  ░░▒▒▒▒░░  ░░▒▒▓▓██▓▓░░    ░░▒▒░░░░  ░░▓▓████▒▒░░  ░░▒▒▒▒░░    ▒▒▓▓██▓▓▒▒    ░░▒▒░░░░+
 ░░▒▒▓▓▒▒░░    ░░░░░░    ░░▒▒▓▓▒▒░░░░    ░░░░░░  ░░░░▒▒▓▓▒▒░░    ░░░░░░    ░░▒▒▒▒▒▒░░░░    ░░░░░░    ░░▒▒▓▓▒▒░░    ░░░░░░  +
 ░░░░░░░░░░              ░░░░░░░░░░                ░░░░░░░░░░                ░░░░░░░░                ░░░░░░░░░░            +
             ░░░░░░░░░░                ░░░░░░░░                ░░░░░░░░░░                ░░░░░░░░                  ░░░░░░░░+
   ░░░░░░    ░░▒▒▒▒▒▒░░    ░░░░░░    ░░░░▒▒▒▒░░░░    ░░░░░░    ░░▒▒▒▒▒▒░░      ░░░░    ░░░░▒▒▒▒▒▒░░    ░░░░░░    ░░▒▒▒▒▒▒░░+
 ░░░░▒▒░░    ▒▒▓▓██▓▓▒▒    ░░▒▒░░░░  ░░▒▒▓▓██▓▓░░  ░░░░▒▒░░    ░░▓▓██▓▓▒▒░░  ░░▒▒░░░░  ░░▒▒▓▓██▓▓░░  ░░░░▒▒░░░░  ░░▓▓██▓▓▒▒+
 ░░▒▒▒▒░░    ▒▒▓▓██▓▓▒▒    ░░▒▒▒▒░░  ░░▒▒████▓▓░░  ░░▒▒▒▒░░    ░░▓▓████▒▒░░  ░░▒▒▒▒░░  ░░▒▒████▓▓░░  ░░░░▒▒░░░░  ░░▓▓████▒▒+
 ░░░░░░░░    ░░▓▓▓▓▓▓░░    ░░░░░░░░  ░░▒▒▓▓▓▓▒▒░░    ░░░░░░    ░░▒▒▓▓▓▓░░░░  ░░░░░░░░  ░░▒▒▓▓▓▓▒▒░░    ░░░░░░    ░░▒▒▓▓▓▓▒▒+
             ░░░░░░░░░░              ░░░░░░░░░░░░              ░░░░░░░░░░                ░░░░░░░░░░              ░░░░░░░░░░+
                                                                                                                           +
 ░░▒▒▒▒░░░░      ░░      ░░░░▒▒▒▒░░░░    ░░░░      ░░░░▒▒░░░░      ░░      ░░░░▒▒▒▒░░░░    ░░░░      ░░░░▒▒░░░░      ░░░░  +
 ▒▒▓▓▓▓▓▓░░    ░░░░░░    ░░▓▓▓▓▓▓▒▒░░  ░░░░░░░░  ░░▒▒▓▓▓▓▓▓░░    ░░░░░░░░  ░░▒▒▓▓▓▓▒▒░░  ░░░░░░░░    ░░▓▓▓▓▓▓░░    ░░░░░░░░+
 ▒▒████▓▓░░  ░░░░▒▒░░░░  ░░▓▓████▒▒░░  ░░▒▒▒▒░░  ░░▒▒████▓▓░░    ░░▒▒▒▒░░  ░░▓▓████▓▓░░  ░░▒▒▒▒░░    ▒▒▓▓██▓▓▒▒    ░░▒▒▒▒░░+
 ▒▒▓▓▓▓▓▓░░    ░░░░░░    ░░▓▓▓▓▓▓▒▒░░  ░░░░░░░░  ░░▒▒▓▓▓▓▓▓░░    ░░░░░░░░  ░░▒▒▓▓▓▓▒▒░░  ░░░░░░░░    ░░▓▓▓▓▓▓░░    ░░░░░░░░+
 ░░▒▒▒▒░░░░      ░░      ░░░░▒▒▒▒░░░░    ░░░░      ░░░░▒▒░░░░      ░░      ░░░░▒▒▒▒░░░░    ░░░░      ░░░░▒▒░░░░      ░░░░  +
                                                                                                                           +
             ░░░░░░░░░░              ░░░░░░░░░░░░              ░░░░░░░░░░                ░░░░░░░░░░              ░░░░░░░░░░+
 ░░░░░░░░    ░░▓▓▓▓▓▓░░    ░░░░░░░░  ░░▒▒▓▓▓▓▒▒░░    ░░░░░░    ░░▒▒▓▓▓▓░░░░  ░░░░░░░░  ░░▒▒▓▓▓▓▒▒░░    ░░░░░░    ░░▒▒▓▓▓▓▒▒+
 ░░▒▒▒▒░░    ▒▒▓▓██▓▓▒▒    ░░▒▒▒▒░░  ░░▒▒████▓▓░░  ░░▒▒▒▒░░    ░░▓▓████▒▒░░  ░░▒▒▒▒░░  ░░▒▒████▓▓░░  ░░░░▒▒░░░░  ░░▓▓████▒▒+
 ░░░░▒▒░░    ▒▒▓▓██▓▓▒▒    ░░▒▒░░░░  ░░▒▒▓▓██▓▓░░  ░░░░▒▒░░    ░░▓▓██▓▓▒▒░░  ░░▒▒░░░░  ░░▒▒▓▓██▓▓░░  ░░░░▒▒░░░░  ░░▓▓██▓▓▒▒+
   ░░░░░░    ░░▒▒▒▒▒▒░░    ░░░░░░    ░░░░▒▒▒▒░░░░    ░░░░░░    ░░▒▒▒▒▒▒░░      ░░░░    ░░░░▒▒▒▒▒▒░░    ░░░░░░    ░░▒▒▒▒▒▒░░+
             ░░░░░░░░░░                ░░░░░░░░                ░░░░░░░░░░                ░░░░░░░░                  ░░░░░░░░+
 ░░░░░░░░░░              ░░░░░░░░░░                ░░░░░░░░░░                ░░░░░░░░                ░░░░░░░░░░            +
 ░░▒▒▓▓▒▒░░    ░░░░░░    ░░▒▒▓▓▒▒░░░░    ░░░░░░  ░░░░▒▒▓▓▒▒░░    ░░░░░░    ░░▒▒▒▒▒▒░░░░    ░░░░░░    ░░▒▒▓▓▒▒░░    ░░░░░░  +
 ▒▒▓▓██▓▓░░  ░░░░▒▒░░░░  ░░▓▓████▒▒░░  ░░▒▒▒▒░░  ░░▒▒▓▓██▓▓░░    ░░▒▒░░░░  ░░▓▓████▒▒░░  ░░▒▒▒▒░░    ▒▒▓▓██▓▓▒▒    ░░▒▒░░░░+
 ▒▒████▓▓░░  ░░░░▒▒░░░░  ░░▓▓████▒▒░░  ░░▒▒▒▒░░  ░░▒▒▓▓██▓▓░░    ░░▒▒░░░░  ░░▓▓████▒▒░░  ░░▒▒▒▒░░    ▒▒▓▓██▓▓▒▒    ░░▒▒▒▒░░+
 ░░▓▓▓▓▒▒░░    ░░░░░░    ░░▒▒▓▓▓▓░░░░  ░░░░░░░░  ░░░░▒▒▓▓▒▒░░    ░░░░░░    ░░▒▒▓▓▓▓▒▒░░    ░░░░░░    ░░▒▒▓▓▒▒░░    ░░░░░░  +
 ░░░░░░░░░░              ░░░░░░░░░░                ░░░░░░░░░░              ░░░░░░░░░░                ░░░░░░░░░░            +
               ░░░░░░                  ░░░░░░░░                  ░░░░░░                    ░░░░░░                  ░░░░░░  +
   ░░░░      ░░▒▒▒▒▒▒░░      ░░░░    ░░░░▒▒▒▒░░░░    ░░░░░░    ░░▒▒▒▒▒▒░░      ░░░░    ░░░░▒▒▒▒░░░░    ░░░░░░    ░░░░▒▒▒▒░░+
 ░░░░▒▒░░    ░░▓▓██▓▓░░    ░░▒▒░░░░  ░░▒▒▓▓▓▓▒▒░░  ░░░░▒▒░░    ░░▓▓██▓▓▒▒░░  ░░░░░░░░  ░░▒▒▓▓██▓▓░░    ░░▒▒░░    ░░▓▓██▓▓▒▒+
 ░░▒▒▒▒░░    ▒▒▓▓██▓▓▒▒    ░░▒▒▒▒░░  ░░▓▓████▓▓░░  ░░▒▒▒▒░░    ░░▓▓████▒▒░░  ░░▒▒▒▒░░  ░░▒▒████▓▓░░  ░░░░▒▒░░░░  ░░▓▓████▒▒+
 ░░░░░░░░    ░░▓▓▓▓▓▓░░    ░░░░░░░░  ░░▒▒▓▓▓▓▒▒░░  ░░░░░░░░    ░░▓▓▓▓▓▓▒▒░░  ░░░░░░░░  ░░▒▒▓▓▓▓▒▒░░    ░░░░░░    ░░▒▒▓▓▓▓▒▒+
             ░░░░░░░░░░              ░░░░░░░░░░░░              ░░░░░░░░░░              ░░░░░░░░░░░░              ░░░░░░░░░░+
                                                                                                                           +
 ░░░░░░░░░░              ░░░░░░░░░░░░              ░░░░░░░░░░              ░░░░░░░░░░░░              ░░░░░░░░░░            +
 ▒▒▓▓▓▓▒▒░░    ░░░░░░    ░░▒▒▓▓▓▓▒▒░░  ░░░░░░░░  ░░▒▒▓▓▓▓▓▓░░    ░░░░░░░░  ░░▒▒▓▓▓▓▒▒░░  ░░░░░░░░    ░░▓▓▓▓▓▓░░    ░░░░░░░░+
 ▒▒████▓▓░░  ░░░░▒▒░░░░  ░░▓▓████▒▒░░  ░░▒▒▒▒░░  ░░▒▒████▓▓░░    ░░▒▒▒▒░░  ░░▓▓████▓▓░░  ░░▒▒▒▒░░    ▒▒▓▓██▓▓▒▒    ░░▒▒▒▒░░+
 ▒▒▓▓▓▓▓▓░░    ░░▒▒░░    ░░▓▓▓▓▓▓▒▒░░  ░░░░░░░░  ░░▒▒▓▓██▓▓░░    ░░▒▒░░░░  ░░▒▒▓▓▓▓▒▒░░  ░░░░░░░░    ░░▓▓██▓▓░░    ░░░░░░░░+
 ░░▒▒▒▒░░░░    ░░░░░░    ░░░░▒▒▒▒░░░░    ░░░░      ░░▒▒▒▒▒▒░░    ░░░░░░    ░░░░▒▒▒▒░░░░    ░░░░      ░░▒▒▒▒▒▒░░      ░░░░  +
   ░░░░░░                  ░░░░░░                    ░░░░░░                  ░░░░░░                    ░░░░░░              +
             ░░░░░░░░░░                ░░░░░░░░░░              ░░░░░░░░░░                ░░░░░░░░░░              ░░░░░░░░░░+
   ░░░░░░    ░░▒▒▓▓▒▒░░    ░░░░░░    ░░▒▒▓▓▓▓▒▒░░    ░░░░░░    ░░▒▒▓▓▒▒░░░░  ░░░░░░░░  ░░░░▓▓▓▓▒▒░░    ░░░░░░    ░░▒▒▓▓▓▓░░+


*/

