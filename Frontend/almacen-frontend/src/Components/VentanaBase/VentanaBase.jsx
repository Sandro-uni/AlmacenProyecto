
import { BrowserRouter, Route, Routes, useParams } from 'react-router-dom';
import { RangoDeUsuario } from './Rango';
import { Menu } from './Menu';
import './Ventana.css';

export const VentanaBase=()=>{
  //const { idrl } = 1;
  const { idrl } = useParams();
  const numero_id = parseInt(idrl, 10);
    return (
        <div className="MaxContenedor">
          
            <div className="Encabezado">
              <h1 className="text-3xl font-bold"><RangoDeUsuario idrol={numero_id} /></h1>
              <button className="botonCerrarSesion">Cerrar Sesión</button>
            </div>
            <div className="Contenido">
              <div className="Menu">
                <span >Texto de prueba en menu</span>
                <Menu />

              </div>
              <div className="Formularios">
                texto de prueba para Formularios un poco largo para probar como anda
              </div>
            </div>
          
        </div>
      );
}