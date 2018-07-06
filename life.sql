CREATE OR REPLACE FUNCTION public.life()
RETURNS void
LANGUAGE plpgsql
AS $function$
  DECLARE
      _map int[][];
        _ix int;
        _iy int;
        _xsize int;
        _ysize int;
        _tempmap int[][];
        _outp text;
      BEGIN
      _map :=
          array_fill(0, array[14,20])
            || ARRAY[
              ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0],
                ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0],
                ARRAY[0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,1,1,1]
              ]
            || array_fill(0, array[3, 20]);
         
       _tempmap := array_fill(0, array[20, 20]);
     
     _xsize := array_length(_map, 1)-1;
        _ysize := array_length(_map, 1)-1;
     
     FOR nothing IN 1..99 BY 1 LOOP
          _outp := e'\n';
           FOR _iy IN 2.._ysize BY 2 LOOP
             FOR _ix IN 1.._xsize BY 1 LOOP
                  _outp := _outp ||
                      CASE (_map[_iy-1][_ix])::text || (_map[_iy][_ix])::text
                          WHEN '00' THEN ' '
                            WHEN '10' THEN '▀'
                            WHEN '01' THEN '▄'
                            WHEN '11' THEN '█'
                            ELSE 'x'
                          END;
                    END LOOP;
                _outp := _outp || e'\n';
              END LOOP;
       
       RAISE NOTICE '%', _outp;
       
       FOR _ix IN 1.._xsize BY 1 LOOP
              FOR _iy IN 1.._xsize BY 1 LOOP
                  _tempmap[_iy][_ix] = (
                      CASE
                          WHEN
                            _map[_iy][_ix] = 1
                            AND coalesce(_map[_iy-1][_ix-1], 0)
                            + coalesce(_map[_iy-1][_ix], 0)
                            + coalesce(_map[_iy-1][_ix+1], 0)
                            + coalesce(_map[_iy][_ix-1], 0)
                            + coalesce(_map[_iy][_ix+1], 0)
                            + coalesce(_map[_iy+1][_ix-1], 0)
                            + coalesce(_map[_iy+1][_ix], 0)
                            + coalesce(_map[_iy+1][_ix+1], 0)
                            < 2 THEN 0
                            WHEN
                            _map[_iy][_ix] = 1
                            AND coalesce(_map[_iy-1][_ix-1], 0)
                            + coalesce(_map[_iy-1][_ix], 0)
                            + coalesce(_map[_iy-1][_ix+1], 0)
                            + coalesce(_map[_iy][_ix-1], 0)
                            + coalesce(_map[_iy][_ix+1], 0)
                            + coalesce(_map[_iy+1][_ix-1], 0)
                            + coalesce(_map[_iy+1][_ix], 0)
                            + coalesce(_map[_iy+1][_ix+1], 0)
                            BETWEEN 2 AND 3 THEN 1
                            WHEN
                            _map[_iy][_ix] = 1
                            AND coalesce(_map[_iy-1][_ix-1], 0)
                            + coalesce(_map[_iy-1][_ix], 0)
                            + coalesce(_map[_iy-1][_ix+1], 0)
                            + coalesce(_map[_iy][_ix-1], 0)
                            + coalesce(_map[_iy][_ix+1], 0)
                            + coalesce(_map[_iy+1][_ix-1], 0)
                            + coalesce(_map[_iy+1][_ix], 0)
                            + coalesce(_map[_iy+1][_ix+1], 0)
                            > 3 THEN 0
                            WHEN
                            _map[_iy][_ix] = 0
                            AND coalesce(_map[_iy-1][_ix-1], 0)
                            + coalesce(_map[_iy-1][_ix], 0)
                            + coalesce(_map[_iy-1][_ix+1], 0)
                            + coalesce(_map[_iy][_ix-1], 0)
                            + coalesce(_map[_iy][_ix+1], 0)
                            + coalesce(_map[_iy+1][_ix-1], 0)
                            + coalesce(_map[_iy+1][_ix], 0)
                            + coalesce(_map[_iy+1][_ix+1], 0)
                            = 3 THEN 1
                            ELSE _map[_iy][_ix]
                          END
                      );
                  END LOOP;
              END LOOP;
            _map := _tempmap;
            EXECUTE 'select pg_sleep(0.1)';
          END LOOP;
      END;
      $function$;
  select life();
