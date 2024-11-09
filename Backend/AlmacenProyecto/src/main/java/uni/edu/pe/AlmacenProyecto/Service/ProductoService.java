package uni.edu.pe.AlmacenProyecto.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import uni.edu.pe.AlmacenProyecto.dto.ProductoGuardarDto;
import uni.edu.pe.AlmacenProyecto.dto.ProductosDto;

@Service
public class ProductoService {
	
	@Autowired
	private JdbcTemplate jdbctempla;
	
	public void agregarProducto(ProductoGuardarDto bean) {
		String sql = "INSERT INTO Producto (nombre, descripcion, id_categoria, precio, costo_almacen) ";
		sql+="VALUES (?, ?, ?, ?, ?)";
	    
		jdbctempla.update(sql,bean.getNombre(),bean.getDescripcion(),bean.getId_categoria(),bean.getPrecio(),bean.getCosto_almacen());
		
		sql="SELECT id_producto FROM Producto Where nombre=?";
		int id=jdbctempla.queryForObject(sql, Integer.class,bean.getNombre());
		
		sql="INSERT INTO Inventario (id_producto, existencias, max_existencias, min_existencias) ";
		sql+="VALUES (?, ?, ?, ?)";
		
		jdbctempla.update(sql,id,bean.getExistencias(),bean.getMax_existencias(),bean.getMin_existencias());
	}
}
