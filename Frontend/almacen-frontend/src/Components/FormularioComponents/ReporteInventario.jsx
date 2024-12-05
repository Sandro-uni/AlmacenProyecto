import React, { useEffect, useState } from 'react';
import axios from 'axios';
import './Formulario.css'; // Si los estilos están definidos aquí.

export const ReporteInventario = () => {
    const [reporte, setReporte] = useState([]);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState(null);

    // Función para obtener el reporte desde el backend
    const fetchReporteInventario = async () => {
        try {
            const response = await axios.get('http://localhost:8080/Reporte/inventario'); // Cambia la URL si es necesario.
            setReporte(response.data);
        } catch (err) {
            setError(err.message);
        } finally {
            setLoading(false);
        }
    };

    useEffect(() => {
        fetchReporteInventario();
    }, []);

    if (loading) {
        return <p>Cargando reporte...</p>;
    }

    if (error) {
        return <p>Error: {error}</p>;
    }

    return (
        <div className="reporte-inventario">
            <h2>Reporte de Inventario</h2>
            <table className="tabla-reporte">
                <thead>
                    <tr>
                        <th>Nombre</th>
                        <th>Stock Actual</th>
                        <th>Nro. Movimientos Venta</th>
                        <th>Nro. Movimientos Compra</th>
                        <th>Nro. Devoluciones Cliente</th>
                        <th>Nro. Devoluciones Proveedor</th>
                    </tr>
                </thead>
                <tbody>
                    {reporte.map((item, index) => (
                        <tr key={index}>
                            <td>{item.nombre}</td>
                            <td>{item.stock_actual}</td>
                            <td>{item.nro_mov_venta}</td>
                            <td>{item.nro_mov_compra}</td>
                            <td>{item.nro_mov_dev_cliente}</td>
                            <td>{item.nro_mov_dev_proveedor}</td>
                        </tr>
                    ))}
                </tbody>
            </table>
        </div>
    );
}
