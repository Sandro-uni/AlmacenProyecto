import { useState } from 'react';
import './Formulario.css'

export const ModificarProducto = () => {
    const [IdProducto,setIdProducto]=useState("");
    const [nombreP, setNombreP] = useState("");
    const [descripcionP, setDescripcionP] = useState("");
    const [categoriaP, setCategoriaP] = useState("");
    const [precioP, setPrecioP] = useState("");
    const [costoalmP, setCostoalmP] = useState("");

    //patrones para verificacion
    const patronPositivoDecimal = /^[+]?\d+(\.\d+)?$/;
    const patronPositivoEntero =/^[+]?\d+$/;

    // Funciones para actualizar el estado de cada campo
    function actualizarIdProducto(e) {
        setIdProducto(e.target.value);
    }

    function actualizarNombreP(e) {
        setNombreP(e.target.value);
    }

    function actualizarDescripcionP(e) {
        setDescripcionP(e.target.value);
    }

    function actualizarCategoriaP(e) {
        const value=e.target.value;
        if (patronPositivoEntero.test(value) || value === "") {
            setCategoriaP(value);
        }
    }

    function actualizarPrecioP(e) {
        const value=e.target.value;
        if (patronPositivoDecimal.test(value) || value === "") {
            setPrecioP(value);
        }
    }

    function actualizarCostoalmP(e) {
        const value=e.target.value;
        if (patronPositivoDecimal.test(value) || value === "") {
            setCostoalmP(value);
        }
    }

    //envio del formulario
    async function envioCrearProducto(e){
        e.preventDefault();
        try{

        }catch(error){

        }
    }

    return ( 
        <div>
            <form className='CrearProducto' onSubmit={envioCrearProducto}>
                <div className="campo">
                    <label className="label1">Id del producto a modificar:</label> 
                    <input className="input" type="number" value={IdProducto} onChange={actualizarIdProducto} />
                </div>
                <div className="campo">
                    <label className="label1">Nuevo nombre del Producto:</label> 
                    <input className="input" type="text" value={nombreP} onChange={actualizarNombreP} />
                </div>
                <div className="campo">
                    <label className="label1">Nueva descripcion del producto:</label> 
                    <input className="input" type="text" value={descripcionP} onChange={actualizarDescripcionP} />
                </div>
                <div className="campo">
                    <label className="label1">Nuevo IdCategoria del producto:</label> 
                    <input className="input" type="number" value={categoriaP} onChange={actualizarCategoriaP} />
                </div>
                <div className="campo">
                    <label className="label1">Nuevo precio del producto:</label> 
                    <input className="input" type="number" value={precioP} onChange={actualizarPrecioP} pattern="^[+]?\d+(\.\d+)?$"  // Solo números positivos con decimal opcional
                        title="Solo números positivos permitidos" />
                </div>
                <div className="campo">
                    <label className="label1">Nuevo costo de almacenamiento mensual:</label> 
                    <input className="input" type="number" value={costoalmP} onChange={actualizarCostoalmP} />
                </div>
                <button type='sybmit'>Enviar</button>
            </form> 
        </div>
    );
};
