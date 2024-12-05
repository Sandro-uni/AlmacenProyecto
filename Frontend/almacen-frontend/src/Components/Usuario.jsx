
import { useState } from "react"
import axios from "axios";
import { useNavigate } from 'react-router-dom';

export const Usuario = ({nombre, largo}) =>{
    const [usuario,setUsuario] = useState("");
    const [clave,setClave] = useState("");
    const [mensajeError, setmensajeError] = useState("");

    const navigate = useNavigate();
    
    function actualizarUsuario(e){
        setUsuario(e.target.value);
    }
    function actualizarClave(e){
        setClave(e.target.value);
    }
    //llamado a revisar si existe el login
    async function intentoLogin(e){
        e.preventDefault();
        
        try {
            //recordar mandar como json sin usar el param
            setmensajeError("...");
            const response = await axios.post('http://localhost:8080/Login/verificar', 
                 {usuario: usuario, pass: clave}
            );

            const id_rol=response.data; //almacenando el id rol obtenido
            console.log("esto seria el idrol "+id_rol);
            navigate(`/Principal/${id_rol}`);
            
        } catch (error) {
            //mensaje de testeo
            console.error("Error al verificar el usuario:", error);
            actualizarError("Error al ingresar los datos");
        }
    }
    function actualizarError(e){
        setmensajeError(e);
    }
    return <div className='usuario'>
        <h1>Inicio de sesion</h1>
        <form onSubmit={intentoLogin}>
            <div className="campo">
                <label className="label1">Usuario:</label> 
                <input className="input" type="text" value={usuario} onChange={actualizarUsuario} />
            </div>
            <div className="campo">
                <label className="label1">Clave:</label>
                <input className="input" type="password" value={clave} onChange={actualizarClave} />
            </div>
            <div>{mensajeError && <div className="error">{mensajeError}</div>}</div>
            <button type='submit'>Entrar </button>
        </form>
        
    </div>
}