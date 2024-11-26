package uni.edu.pe.AlmacenProyecto.Service;

public class UserContext {
	
	 private static final ThreadLocal<Integer> userRole = new ThreadLocal<>();

	    public static void setRole(int role) {
	        userRole.set(role);
	    }

	    public static int getRole() {
	        return userRole.get();
	    }

	    public static void clear() {
	        userRole.remove();
	    }

}
