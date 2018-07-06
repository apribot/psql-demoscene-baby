CREATE OR REPLACE FUNCTION public.sky()
 RETURNS void
 LANGUAGE plpgsql
AS $function$
  DECLARE

    _map text[] := '{}';
    _ix int;
    _iy int;
    _outp text;
    _tmp text;
  BEGIN
    _outp := '';

    -- generate initial state
    FOR _iy IN 1..30 BY 1 LOOP
      FOR _ix IN 1..100 BY 1 LOOP
        _map[_iy] := coalesce(_map[_iy], '') || (array_fill(' '::text, array[70]) || array['·','.','.','˚'])[ceil(random()*74)];
      END LOOP;
    END LOOP;

    FOR _ix IN 1..25 BY 1 LOOP
      _map[31] := coalesce(_map[31], '') || (array_fill('____'::text, array[5]) || array['╱╲__', '----'])[ceil(random()*7)];
    END LOOP;

    FOR nothing IN 1..999 BY 1 LOOP
      _outp := '';
      FOR _iy IN 1..31 BY 1 LOOP
        _outp := _outp || _map[_iy] || e'\n';
      END LOOP;

      raise notice e'\n%', _outp;
      EXECUTE 'select pg_sleep(.2)';

      -- shift left & add new
      FOR _iy IN 1..30 BY 1 LOOP
        _map[_iy] := right(_map[_iy], (ceil((30.0 - ((_iy::numeric ) - 1.0)) / 10.0) * -1)::int) 
          || (array_fill(' '::text, array[70]) || array['·','.','.','˚'])[ceil(random()*74)]
          || repeat(' ', (ceil((30.0 - ((_iy::numeric ) - 1.0)) / 10.0))::int - 1);
      END LOOP;
    END LOOP;
  END;
$function$;

select sky();
