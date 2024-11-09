package uni.edu.pe.AlmacenProyecto.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data @AllArgsConstructor @NoArgsConstructor @ToString
public class ProductoGuardarDto  {
	//atributos de producto
	private int id_producto;
	private String nombre;
	private String descripcion;
	private int id_categoria;
	private int precio;
	private int costo_almacen;
	//atributos de inventario
		//no se pone el id_producto por que se asume que es el mismo que el de producto
	private int existencias;
	private int max_existencias;
	private int min_existencias;
}
