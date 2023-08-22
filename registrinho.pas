unit Registrinho;
interface
type
  comedor = record
  nombre_institucion,nombre_encargado,programas_comedor:string;
  end;
PROCEDURE CARGAR_REGISTRO (VAR r: comedor);
PROCEDURE MOSTRAR_REGISTRO (r: comedor);

implementation
PROCEDURE CARGAR_registro (VAR r: comedor);
begin
with r do
begin
WRITE('INGRESE Nombre de la institucion');
READLN (nombre_institucion);
WRITE('INGRESE nombre completo del encargado del comedor: ');
READLN (nombre_encargado);
write('Ingrese el o los programas de los cuales recibe el comedor, separados por una coma');
READln(programas_comedor);

end;
end;
PROCEDURE MOSTRAR_REGISTRO (r: comedor);
begin
with r do
begin
write (nombre_institucion);
write (nombre_encargado);
write (programas_comedor);
end;
end;
end.

