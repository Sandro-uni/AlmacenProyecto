
export const RangoDeUsuario=({idrol})=>{
    let stringRol = "";
    switch (idrol) {
        case 1:
            stringRol="Administrador";
            break;
        case 2:
            stringRol="Jefe";
            break;
        case 3:
            stringRol="Supervisor";
            break;
        case 4:
            stringRol="Vendedor";
            break;
        
            default:
            stringRol="No hay rol puesto";
    }
    return (
        stringRol
      );
}