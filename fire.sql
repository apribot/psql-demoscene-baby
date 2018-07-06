CREATE OR REPLACE FUNCTION public.fire()
 RETURNS void
 LANGUAGE plpgsql
AS $function$
  DECLARE
    _B int[];
    _J int;
    _acc text;
  BEGIN

  FOR _J IN 1..2082 BY 1 LOOP
    _B[_J] := 0;
  END LOOP;

  LOOP
    _acc := '';
    FOR _J IN 1..2082 BY 1 LOOP
      IF _J < 1840 THEN
        IF _J % 80 = 79 THEN
          _acc := concat(_acc, e'\n');
        ELSE
          _acc := concat(_acc, (ARRAY[' ','░','▒','▓', '█','█','█','█','█'])[ (_B[_J]>>6) +1 ] );
        END IF;
      END IF;
      IF _J < 2000 THEN
        _B[_J] = trunc((
                       _B[_J]    + _B[_J+1]
          +_B[_J+80] + _B[_J+81] + _B[_J+82])/5)-4;
      ELSIF trunc(random() * 100)::int < 60 THEN
        _B[_J] := 0;
      ELSE
        _B[_J] := 512;
      END IF;
    END LOOP;
  RAISE NOTICE e'\n%', _acc;
  EXECUTE 'select pg_sleep(0.1)';
  END LOOP;
END;
$function$;        