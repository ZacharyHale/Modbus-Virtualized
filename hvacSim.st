PROGRAM hvac
  VAR
    TempSensor AT %MW0 : INT;
    Fan AT %QX0.0 : BOOL;
  END_VAR
  VAR
    GT1_OUT : BOOL;
    LT13_OUT : BOOL;
  END_VAR

  GT1_OUT := GT(TempSensor, 80);
  IF GT1_OUT THEN
    Fan := TRUE; (*set*)
  END_IF;
  LT13_OUT := LT(TempSensor, 70);
  IF LT13_OUT THEN
    Fan := FALSE; (*reset*)
  END_IF;
END_PROGRAM


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#20ms,PRIORITY := 0);
    PROGRAM instance0 WITH task0 : hvac;
  END_RESOURCE
END_CONFIGURATION
