
import './Formulario.css'
import { CrearProducto } from './crearProducto';
import {ModificarProducto} from './modificarProducto'

export const Formulario = ({action}) => {
    let formEscogido;
    switch (action) {
        case 'crearP': formEscogido=<CrearProducto/>;break;
        case 'modificarP': formEscogido=<ModificarProducto />;break;
        default: return "No hay nada escojido";
    }
    return(
        <div>
            {formEscogido}
        </div>
    )
};
