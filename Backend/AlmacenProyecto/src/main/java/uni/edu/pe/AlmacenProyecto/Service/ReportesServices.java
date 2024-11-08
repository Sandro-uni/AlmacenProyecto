package uni.edu.pe.AlmacenProyecto.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import uni.edu.pe.AlmacenProyecto.dto.ReporteProductosDto;
import uni.edu.pe.AlmacenProyecto.dto.ReporteInventarioDto;



@Service
public class ReportesServices {
	@Autowired
	private JdbcTemplate jdbcTempla;
	
	public List<ReporteProductosDto> reporteProductos(){
		String sql="Select * From Producto";
		return jdbcTempla.query(sql, new BeanPropertyRowMapper<>(ReporteProductosDto.class));
	}
	
	public List<ReporteInventarioDto> reporteInventario(){
		String sql="select I.id_producto,nombre,I.existencias,P.descripcion,P.precio ";
		sql+="from Inventario I join Producto P ON I.id_producto=P.id_producto";
		return jdbcTempla.query(sql, new BeanPropertyRowMapper<>(ReporteInventarioDto.class));
	}
	
	
}
