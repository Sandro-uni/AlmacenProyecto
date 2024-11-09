package uni.edu.pe.AlmacenProyecto.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data @AllArgsConstructor @NoArgsConstructor @ToString
public class InventarioDto {
	private int id_producto;
	private int existencias;
	private int max_existencias;
	private int min_existencias;
}
