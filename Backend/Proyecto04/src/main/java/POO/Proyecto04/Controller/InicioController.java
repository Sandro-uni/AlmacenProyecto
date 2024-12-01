package POO.Proyecto04.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import POO.Proyecto04.Service.InicioService;
import POO.Proyecto04.dto.InicioDTO;

@RestController
@RequestMapping("/Login")
public class InicioController {
	@Autowired
	private InicioService service;
	@PostMapping("/verificar")
	public int agregar(@RequestBody InicioDTO bean) {
		//depuracion para verificar el bean sea correcto
		//System.out.println("Recibiendo JSON: " + bean);
		return service.obtenerIdrol(bean);
	}
	
}
