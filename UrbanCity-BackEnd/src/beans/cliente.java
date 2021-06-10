package beans;

public class cliente {
	int fidcliente;
	String fNombre;
	String fApellido;
	String fCorreo;
	String fContrasena;
	String fCalle;
	String fLocalidad;
	String fProvincia;
	String fCp;
	String fPais;
	String fTel;

	public cliente(int pidcliente, String pfNombre, String pfApellido, String pfCorreo, String pfContrasena) {
		fidcliente = pidcliente;
		fNombre = pfNombre;
		fApellido = pfApellido;
		fCorreo = pfCorreo;
		fContrasena = pfContrasena;
	}

	public String getfNombre() {
		return fNombre;
	}

	public void setfNombre(String fNombre) {
		this.fNombre = fNombre;
	}

	public String getfApellido() {
		return fApellido;
	}

	public void setfApellido(String fApellido) {
		this.fApellido = fApellido;
	}

	public String getfCorreo() {
		return fCorreo;
	}

	public void setfCorreo(String fCorreo) {
		this.fCorreo = fCorreo;
	}

	public String getfContrasena() {
		return fContrasena;
	}

	public void setfContrasena(String fContrasena) {
		this.fContrasena = fContrasena;
	}


}
