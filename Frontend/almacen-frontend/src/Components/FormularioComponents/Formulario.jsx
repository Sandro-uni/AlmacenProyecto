
import { ConsultarProducto } from './ConsultarProducto';
import './Formulario.css';
import { CrearProducto } from "./CrearProducto";
import {ModificarProducto} from './ModificarProducto';
import {ReporteInventario} from './ReporteInventario';

export const Formulario = ({action}) => {
    let formEscogido;
    switch (action) {
        case 'crearP': formEscogido=<CrearProducto/>;break;
        case 'modificarP': formEscogido=<ModificarProducto />;break;
        case 'consultarP' :formEscogido=<ConsultarProducto/>;break;
        case 'reporteI' :formEscogido=<ReporteInventario/>;break;
        default: return "No hay nada escojido";
    }
    return(
        <div>
            {formEscogido}
        </div>
    )
};
