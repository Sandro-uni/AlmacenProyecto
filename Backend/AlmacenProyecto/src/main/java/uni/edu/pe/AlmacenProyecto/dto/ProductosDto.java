package uni.edu.pe.AlmacenProyecto.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data @AllArgsConstructor @NoArgsConstructor @ToString
public class ProductosDto {
	private int id_producto;
	private String nombre;
	private String descripcion;
	private int id_categoria;
	private int precio;
	private int costo_almacen;
}
