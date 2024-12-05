import { useState } from 'react';
import './Formulario.css'
import axios from 'axios';

export const CrearProducto = () => {
    const [nombreP, setNombreP] = useState("");
    const [descripcionP, setDescripcionP] = useState("");
    const [categoriaP, setCategoriaP] = useState("");
    const [precioP, setPrecioP] = useState("");
    const [costoalmP, setCostoalmP] = useState("");
    const [stockI, setStockI] = useState("");
    const [stockMax, setStockMax] = useState("");
    const [stockMin, setStockMin] = useState("");

    const [mensajeError, setmensajeError] = useState("");

    //patrones para verificacion
    const patronPositivoDecimal = /^[+]?\d+(\.\d+)?$/;
    const patronPositivoEntero =/^[+]?\d+$/;

    
    
    // Funciones para actualizar el estado de cada campo
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

    function actualizarStockI(e) {
        const value=e.target.value;
        if (patronPositivoEntero.test(value) || value === "") {
            setStockI(value);
        }
    }

    function actualizarStockMax(e) {
        const value=e.target.value;
        if (patronPositivoEntero.test(value) || value === "") {
            setStockMax(value);
        }
    }

    function actualizarStockMin(e) {
        const value=e.target.value;
        if (patronPositivoEntero.test(value) || value === "") {
            setStockMin(value);
        }
    }

    //envio del formulario
    async function envioCrearProducto(e){
        e.preventDefault();
        try{
            const response = await axios.post('http://localhost:8080/Producto/agregar',
                {idproducto:5,nombre:nombreP, descripcion:descripcionP, idcategoria: categoriaP, precio:precioP, costoalmacen:costoalmP });
            setmensajeError("Producto agregado con exito");
        }catch(error){
            console.error("Error al registrar el producto:", error);
            setmensajeError("Error al agregar producto");
        }
    }

    return ( 
        <div>
            <form className='CrearProducto' onSubmit={envioCrearProducto}>
                <div className="campo">
                    <label className="label1">Nombre del Producto:</label> 
                    <input className="input" type="text" value={nombreP} onChange={actualizarNombreP} required/>
                </div>
                <div className="campo">
                    <label className="label1">Descripcion del producto:</label> 
                    <input className="input" type="text" value={descripcionP} onChange={actualizarDescripcionP} required/>
                </div>
                <div className="campo">
                    <label className="label1">IdCategoria del producto:</label> 
                    <input className="input" type="number" value={categoriaP} onChange={actualizarCategoriaP} required/>
                </div>
                <div className="campo">
                    <label className="label1">Precio del producto:</label> 
                    <input className="input" type="number" value={precioP} onChange={actualizarPrecioP} pattern="^[+]?\d+(\.\d+)?$"  // Solo números positivos con decimal opcional
                        title="Solo números positivos permitidos" required/>
                </div>
                <div className="campo">
                    <label className="label1">Costo de almacenamiento mensual:</label> 
                    <input className="input" type="number" value={costoalmP} onChange={actualizarCostoalmP} required/>
                </div>
                <div className="campo">
                    <label className="label1">Stock Inicial:</label> 
                    <input className="input" type="number" value={stockI} onChange={actualizarStockI} required/>
                </div>
                <div className="campo">
                    <label className="label1">Minimo Stock aceptable:</label> 
                    <input className="input" type="number" value={stockMax} onChange={actualizarStockMax} required/>
                </div>
                <div className="campo">
                    <label className="label1">Maximo Stock aceptable:</label> 
                    <input className="input" type="number" value={stockMin} onChange={actualizarStockMin} required/>
                </div>
                <button type='submit'>Enviar</button>
            </form> 
            {mensajeError}
        </div>
    );
};
