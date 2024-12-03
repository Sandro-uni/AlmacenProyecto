import React, { useState } from 'react';
import './Ventana.css';

//se recibe la funcion "cambiarOpcion" de Ventana base, 
//y se maneja como funcionrecibida

export const Menu = ({funcionrecibida}) => {
    const [activoSubmenu, setActivoSubmenu] = useState(null);

    const cambiarSubmenu = (submenu) => {
        setActivoSubmenu(activoSubmenu === submenu ? null : submenu);
    };
    
    /*formularioEscogido le manda el parametro a la funcion "funcionrecibida"
    que es "cambiarOpcion" en el padre*/

    const formularioEscogido=(e)=>{
        funcionrecibida(e);
    }

    return (
        <ul className='ListaPrincipal'>
            <li className='elementoPrincipal'>
                <span onClick={() => cambiarSubmenu('producto')}style={{padding: '10px 20px', cursor: 'pointer' }}>Producto</span>
            </li>
            <li className='submenuPrincipal'>
                {activoSubmenu === 'producto' && (
                        <ul className='ListaSecundaria'>
                            <li style={{  cursor: 'pointer' }} onClick={() => formularioEscogido('crearP')}>Crear Producto</li>
                            <li style={{  cursor: 'pointer' }} onClick={() => formularioEscogido('modificarP')}>Modificar Producto</li>
                            <li style={{  cursor: 'pointer' }}>Consultar Producto</li>
                            <li style={{  cursor: 'pointer' }}>Eliminar Producto</li>
                        </ul>
                )}
            </li>
            <li className='elementoPrincipal'>
                <span onClick={() => cambiarSubmenu('inventario')}style={{ padding: '10px 20px', cursor: 'pointer' }} >Inventario</span>
            </li>
            <li className='submenuPrincipal'>
                {activoSubmenu === 'inventario' && (
                        <ul className='ListaSecundaria'>
                            <li style={{  cursor: 'pointer' }}>Reporte Inventario</li>
                            <li style={{  cursor: 'pointer' }}>Modificar Inventario</li>
                            <li style={{  cursor: 'pointer' }}>Consultar Inventario</li>
                        </ul>
                )}
            </li>

            <li className='elementoPrincipal'>
                <span onClick={() => cambiarSubmenu('movimientos')}
                    style={{ padding: '10px 20px', cursor: 'pointer' }}>Movimientos</span>
            </li>
            <li className='submenuPrincipal'>
                {activoSubmenu === 'movimientos' && (
                    <ul className='ListaSecundaria'>
                        <li style={{  cursor: 'pointer' }}>Crear Movimientos</li>
                        <li style={{  cursor: 'pointer' }}>Modificar Movimientos</li>
                        <li style={{  cursor: 'pointer' }}>Consulta Movimientos</li>
                        <li style={{  cursor: 'pointer' }}>Eliminar Movimientos</li>
                    </ul>
                )}
            </li>
            <li className='elementoPrincipal'>
                <span onClick={() => cambiarSubmenu('usuarios')}
                    style={{ padding: '10px 20px', cursor: 'pointer' }}>Usuarios</span>
            </li>
            <li className='submenuPrincipal'>
                {activoSubmenu === 'usuarios' && (
                    <ul className='ListaSecundaria'>
                        <li style={{  cursor: 'pointer' }}>Crear Usuario</li>
                        <li style={{  cursor: 'pointer' }}>Modificar Usuario</li>
                        <li style={{  cursor: 'pointer' }}>Eliminar Usuario</li>
                    </ul>
                )}
            </li>
            <li className='elementoPrincipal'>
                <span onClick={() => cambiarSubmenu('auditoria')}
                    style={{ padding: '10px 20px', cursor: 'pointer' }}>Auditoria</span>
            </li>
            <li className='submenuPrincipal'>
                {activoSubmenu === 'auditoria' && (
                    <ul className='ListaSecundaria'>
                        <li>Consultar Auditoria</li>
                        <li>Modificar Auditoria</li>
                        <li>Costos por Almacenamiento</li>
                    </ul>
                )}
            </li>
        </ul>
    );
};