even odd

DECLARE
  n NUMBER := &n;
BEGIN
  IF (mod(n,2) = 0) THEN
    dbms_output.put_line('Even Number');
  ELSE
    dbms_output.put_line('Odd Number');
  END IF;
END;
/

Prime or Composi

DECLARE
  n NUMBER := &n;
  i NUMBER := 2;
  flag NUMBER := 1;
BEGIN
  FOR i in 2..n/2
  LOOP
    IF (mod(n,i) = 0) THEN
      flag := 0;
      exit;
    END IF;
  END LOOP;
  
  IF (flag = 1) THEN
    dbms_output.put_line('Prime Number');
  ELSE
    dbms_output.put_line('Composite Number');
  END IF;
END;
/

Factorial

DECLARE
  n NUMBER := &n;
  f NUMBER := 1;
BEGIN
  FOR i in 1..n
  LOOP
    f := f*i;
  END LOOP;
  dbms_output.put_line('Factorial is '|| f);
END;
/

Perfect Number

DECLARE
  n NUMBER:= &n;
  i NUMBER;
  t NUMBER := 0;
BEGIN
  FOR i in 1..n/2
  LOOP
    IF (n mod i = 0) THEN
      t := t + i;
    END IF;
  END LOOP;
  
  IF (n = t) THEN
    dbms_output.put_line('Perfect number');
  ELSE
    dbms_output.put_line('Not a Perfect number');
  END IF;
END;
/

Calculator

DECLARE
  n NUMBER := &n;
  m NUMBER := &m;
  op VARCHAR2(20) := '&op';
  rs number;
BEGIN
  IF (op = '+') THEN
    rs := n+m;
  ELSIF (op = '-') THEN
    rs := n-m;
  ELSIF (op = '*') THEN
    rs := n*m;
  ELSIF (op = '/') THEN
    rs := n/m;
  ELSE
    dbms_output.put_line('Error...');
  END IF;
  dbms_output.put_line(rs);
END;
/
