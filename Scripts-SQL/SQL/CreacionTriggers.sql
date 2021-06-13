create function ComprobacionDatos() returns Trigger
as
$$
begin
select * from urbancity.producto;
return new;
End
$$
Language plpgsql;

create trigger ComprobarDatos after Update on urbancity.producto
for each row
execute procedure ComprobacionDatos();

create function ComprobacionDatosClientes() returns Trigger
as
$$
begin
select * from urbancity.cliente;
End
$$
Language plpgsql;

create trigger ComprobarDatosCliente after Update on urbancity.cliente
execute procedure ComprobacionDatosClientes();