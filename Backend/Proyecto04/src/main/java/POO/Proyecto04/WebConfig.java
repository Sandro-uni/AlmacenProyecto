package POO.Proyecto04;  // Asegúrate de que el paquete coincida con tu estructura

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Override
    public void addCorsMappings(CorsRegistry registry) {
        // Configura las rutas que quieres que acepten solicitudes CORS
        registry.addMapping("/**")  // Aceptar CORS en todas las rutas
                .allowedOrigins("http://localhost:3000")  // Permitir solo solicitudes desde http://localhost:3000
                .allowedMethods("GET", "POST", "PUT", "DELETE")  // Métodos permitidos
                .allowedHeaders("*")  // Permitir todos los encabezados
                .allowCredentials(true);  // Permitir credenciales si es necesario
    }
}
