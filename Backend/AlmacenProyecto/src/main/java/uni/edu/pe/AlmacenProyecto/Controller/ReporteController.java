package uni.edu.pe.AlmacenProyecto.Controller;

import org.springframework.web.bind.annotation.RestController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import uni.edu.pe.AlmacenProyecto.Service.ReportesServices;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import uni.edu.pe.AlmacenProyecto.dto.ReporteProductosDto;

@RestController
@RequestMapping("/Reporte")
public class ReporteController {
	@Autowired
	private ReportesServices service;
	
	@GetMapping("/productos")
	public List<ReporteProductosDto> productos(){
		return service.reporteProductos();
	}
	
}
