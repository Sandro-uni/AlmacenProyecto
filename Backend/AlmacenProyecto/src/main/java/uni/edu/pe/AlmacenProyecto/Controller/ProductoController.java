package uni.edu.pe.AlmacenProyecto.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import uni.edu.pe.AlmacenProyecto.Service.ProductoService;
import uni.edu.pe.AlmacenProyecto.dto.ProductoGuardarDto;

import org.springframework.web.bind.annotation.RequestBody;


@RestController
@RequestMapping("/Producto")
public class ProductoController {
	@Autowired
	private ProductoService service;
	
	@PostMapping("/agregar")
	public void agregar(@RequestBody ProductoGuardarDto bean) {
		service.agregarProducto(bean);
	}
	
}
