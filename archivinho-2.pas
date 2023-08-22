unit Arch_Comedores;

interface
type comedor = record
  nombre_institucion,nombre_encargado,programas_comedor:string;
  end;
  comedores= file of comedor;

PROCEDURE CREAR (VAR ARCH:comedores);
PROCEDURE ABRIR (VAR ARCH:comedores);
PROCEDURE CERRAR (VAR ARCH:comedores);
PROCEDURE LEER_REGISTRO (VAR ARCH:comedores; POS:INTEGER; VAR REG:comedor);
PROCEDURE GUARDAR_REGISTRO(VAR ARCH:comedores; POS:INTEGER; REG:comedor);
//PROCEDURE LISTAR1 (VAR ARCH:comedores);
//PROCEDURE LISTAR2 (VAR ARCH:comedores; pos:Integer);
PROCEDURE ORDEN_BURBUJA (VAR ARCH: comedores);
PROCEDURE BBIN (VAR ARCH:comedores; BUSCADO:string; VAR POS:LONGINT);

implementation
    //uses registrinho;
PROCEDURE CREAR (VAR ARCH:comedores);
BEGIN
ASSIGN(ARCH,'C:\ARCHIVO_COMEDORES.DAT');
REWRITE(ARCH);
END;
PROCEDURE ABRIR (VAR ARCH: comedores);
BEGIN
ASSIGN(ARCH,'C:\ARCHIVO_COMEDORES.DAT');
RESET(ARCH);
END;
PROCEDURE CERRAR (VAR ARCH: comedores);
BEGIN
CLOSE(ARCH);
END;
PROCEDURE LEER_REGISTRO (VAR ARCH:comedores; POS:INTEGER; VAR REG:comedor);
BEGIN
SEEK(ARCH, POS);
READ(ARCH, REG);
END;

PROCEDURE GUARDAR_REGISTRO (VAR ARCH:comedores; POS:INTEGER; REG:comedor);
BEGIN
SEEK(ARCH, POS);
WRITE(ARCH, REG);
END;

PROCEDURE ORDEN_BURBUJA (VAR ARCH: comedores);
VAR R1, R2:comedor;
LIM,I,J:INTEGER;
BEGIN
LIM:= FILESIZE(ARCH)-1;
FOR I:= 0 TO LIM - 1 DO

FOR J:= 0 TO LIM - I DO
BEGIN
SEEK (ARCH,J);
READ (ARCH,R1);
SEEK (ARCH,J+1);
READ (ARCH,R2);
IF R1.nombre_institucion > R2.nombre_institucion THEN
BEGIN
SEEK (ARCH,J+1);
WRITE(ARCH,R1);
SEEK (ARCH,J);
WRITE(ARCH,R2);
END;
END;
END;
PROCEDURE BBIN (VAR ARCH:comedores; BUSCADO:string; VAR POS:LONGINT);
VAR R1:comedor;
PRI,ULT,MED:LONGINT;
BEGIN
PRI:=0;
ULT:= FILESIZE (ARCH)-1;
POS := -1;
WHILE (POS = -1) AND (PRI<= ULT) DO

BEGIN
MED:= (PRI + ULT) DIV 2;
SEEK (ARCH,MED);
READ (ARCH,R1);
IF R1.nombre_institucion = BUSCADO THEN POS:= MED
ELSE
IF R1.nombre_institucion > BUSCADO THEN ULT:= MED -1
ELSE PRI:= MED +1;
END;
END;
//PROCEDURE LISTAR1(VAR ARCH:comedores);
//VAR
//REG:comedor;
//BEGIN
//RESET(ARCH);
//WHILE NOT(EOF(ARCH)) DO
//BEGIN
//READ(ARCH, REG);
//MOSTRAR_REGISTRO(REG);
//END;
//END;
//PROCEDURE LISTAR2 (VAR ARCH:comedores; pos:Integer);
//VAR

//REG:comedor;
//BEGIN
//BEGIN
//SEEK(ARCH,POS);
//READ(ARCH, REG);

//END;
//END;
END.

end.
