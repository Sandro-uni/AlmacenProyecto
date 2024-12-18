package uni.edu.pe.AlmacenProyecto.Service;

import java.util.List;

import javax.swing.tree.RowMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
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
	
	public void actualizarProducto(ProductosDto bean) {
		String sql="update Producto ";
		sql+="Set nombre=?,descripcion=?,id_categoria=?,precio=?,costo_almacen=? ";
		sql+="where id_producto=?;";
		jdbctempla.update(sql,bean.getNombre(),bean.getDescripcion(),bean.getId_categoria(),bean.getPrecio(),bean.getCosto_almacen(),bean.getId_producto());
		
	}
	//eliminar productos recibiendo su id del producto
	public void eliminarProducto(int id_producto) {
		String sql="DELETE FROM Producto WHERE id_producto=?;";
		jdbctempla.update(sql,id_producto);
	}
	
	//consultar producto
	public ProductosDto consultar(int id_producto){
		String sql="SELECT id_producto, nombre, descripcion, id_categoria, precio, costo_almacen FROM Producto Where id_producto=?";
		return jdbctempla.queryForObject(sql,new BeanPropertyRowMapper<>(ProductosDto.class),id_producto);
	}
	
	//conseguir lista de productos
	public List<ProductosDto> lista(){
		String sql="Select id_producto, nombre, descripcion, id_categoria, precio, costo_almacen FROM Producto";
		return jdbctempla.query(sql, new BeanPropertyRowMapper<>(ProductosDto.class));
	}
}






