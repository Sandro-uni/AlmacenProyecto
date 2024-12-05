import axios from 'axios';
import { useState } from 'react';

export const ConsultarProducto = () => {
    const [IdProducto, setIdProducto] = useState("");
    const [productoConsultado, setproductoConsultado] = useState(null);
    const [error, setError] = useState(null); // Para manejar errores

    // Funcion para actualizar el estado de cada campo
    function actualizarIdProducto(e) {
        setIdProducto(e.target.value);
    }

    // Función para actualizar el producto consultado
    function actualizarProducto(e) {
        setproductoConsultado(e);
    }

    // Envío del formulario
    async function envioConsultarProducto(e) {
        e.preventDefault();
        setError(null); // Reseteamos el error antes de realizar la nueva consulta
        try {
            const response = await axios.post('http://localhost:8080/Producto/consultaid', null, {
                params: { id: parseInt(IdProducto, 10) }
            });
            console.log('Respuesta:', response.data); // Recibimos la respuesta
            actualizarProducto(response.data);
        } catch (error) {
            console.error("Hubo un error ", error);
            setError('No se pudo encontrar el producto o hubo un error en la consulta.');
        }
    }

    return (
        <div>
            <form className='formConsultarProducto' onSubmit={envioConsultarProducto}>
                <div className="campo">
                    <label className="label1">Id del producto a Consultar:</label>
                    <input className="input" type="number" value={IdProducto} onChange={actualizarIdProducto} required/>
                </div>
                <button type='submit'>Enviar</button>
            </form>

            {error && <div style={{ color: 'red' }}>{error}</div>} {/* Mostrar mensaje de error si existe */}

            {productoConsultado && !error && (
                <table>
                    <thead>
                        <tr>
                            <th>ID Producto</th>
                            <th>Nombre</th>
                            <th>Descripción</th>
                            <th>Categoría</th>
                            <th>Precio</th>
                            <th>Costo almacenamiento</th>
                            <th>Stock Actual</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>{IdProducto}</td> 
                            <td>{productoConsultado.nombre}</td>
                            <td>{productoConsultado.descripcion}</td>
                            <td>{productoConsultado.categoria}</td>
                            <td>{productoConsultado.precio}</td>
                            <td>{productoConsultado.costoalmacen}</td>
                            <td>{productoConsultado.stock}</td>
                        </tr>
                    </tbody>
                </table>
            )}
        </div>
    );
};
