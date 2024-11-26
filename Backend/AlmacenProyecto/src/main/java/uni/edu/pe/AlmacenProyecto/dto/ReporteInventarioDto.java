package uni.edu.pe.AlmacenProyecto.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data @AllArgsConstructor @NoArgsConstructor @ToString
public class ReporteInventarioDto {
	private int idproducto;
	private String nombre;
	private int existencias;
	private String descripcion;
	private int precio;
}
