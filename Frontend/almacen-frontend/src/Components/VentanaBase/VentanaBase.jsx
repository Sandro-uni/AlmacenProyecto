
import { useParams } from 'react-router-dom';
import { RangoDeUsuario } from './Rango';
import {Formulario} from '../FormularioComponents/Formulario'
import { Menu } from './Menu';
import './Ventana.css';
import { useState } from 'react';

export const VentanaBase=()=>{
  const { idrl } = useParams();
  const numero_id = parseInt(idrl, 10);
  const [OpcionEscogida,setOpcionEscogida]=useState("");

  const cambiarOpcion=(e)=>{
    setOpcionEscogida(e);
  }
    return (
        <div className="MaxContenedor">
          
            <div className="Encabezado">
              <h1 className="text-3xl font-bold"><RangoDeUsuario idrol={numero_id} /></h1>
              <button className="botonCerrarSesion">Cerrar Sesión</button>
            </div>
            <div className="Contenido">
              <div className="Menu">
                <Menu funcionrecibida={cambiarOpcion}/> {/*pasando la funcion como parametro*/}
              </div>
              <div className="Formularios">
                <Formulario action={OpcionEscogida}/>
              </div>
            </div>
          
        </div>
      );
}