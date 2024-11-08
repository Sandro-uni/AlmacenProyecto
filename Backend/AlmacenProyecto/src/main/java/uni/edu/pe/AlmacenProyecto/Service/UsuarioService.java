package uni.edu.pe.AlmacenProyecto.Service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import uni.edu.pe.AlmacenProyecto.dto.UsuarioDTO;

@Service
public class UsuarioService {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public int verificar(UsuarioDTO bean) {
		//VERIFICAR QUE EXISTE
		String sql="SELECT COUNT(1)CONT FROM Usuario WHERE logUsuario=? and pass=? ";
		int cont=jdbcTemplate.queryForObject(sql,Integer.class,bean.getLog(),bean.getPass());
		if(cont!=1) {
			throw new RuntimeException("No existe el usuario");
		}
		//TOMANDO ROL
		String getrol="select id_rol from Usuario where logUsuario=? and pass=?  ";
		int rol=jdbcTemplate.queryForObject(getrol,Integer.class,bean.getLog(),bean.getPass());
		
		UserContext.setRole(rol);
		
		return rol;
		
	}

}
