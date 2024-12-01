import React, { useState } from 'react';

export const Menu = () => {
    const [activoSubmenu, setActiveSubmenu] = useState(null);

    const cambiarSubmenu = (submenu) => {
        setActiveSubmenu(activoSubmenu === submenu ? null : submenu);
    };

    return (
        <div>
            <ul  className='ListaPrincipal'>
                <li>
                    <span onClick={()=>cambiarSubmenu('producto')}>Producto</span>
                    {activoSubmenu === 'producto' && (
                        <ul  className='ListaSecundaria'>
                            <li>Crear Producto</li>
                            <li>Modificar Producto</li>
                            <li>Eliminar Producto</li>
                        </ul>
                    )}
                </li>
                <li>
                    <span onClick={()=>cambiarSubmenu('registro')}>Registro</span>
                    {activoSubmenu === 'registro' && (
                        <ul>
                            <li>Crear Registro</li>
                            <li>Modificar Registro</li>
                            <li>Eliminar Registro</li>
                        </ul>
                    )}
                </li>
                <li>
                    <span onClick={()=>cambiarSubmenu('usuarios')}>Usuarios</span>
                    {activoSubmenu === 'usuarios' && (
                        <ul>
                            <li>Crear Usuario</li>
                            <li>Modificar Usuario</li>
                            <li>Eliminar Usuario</li>
                        </ul>
                    )}
                </li>
            </ul>
        </div>
    );
};