package POO.Proyecto04.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data @AllArgsConstructor @NoArgsConstructor @ToString
public class ProductoReporteMasVentasDTO {
	private String producto;
	private int total_vendido;

}
