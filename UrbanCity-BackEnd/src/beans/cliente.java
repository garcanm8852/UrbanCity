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

	public cliente(int pidcliente, String pfNombre, String pfApellido, String pfCorreo, String pfContrasena,
			String pfCalle, String pfLocalidad, String pfProvincia, String pfCp, String pfPais, String pfTel) {
		fidcliente = pidcliente;
		fNombre = pfNombre;
		fApellido = pfApellido;
		fCorreo = pfCorreo;
		fContrasena = pfContrasena;
		fCalle = pfCalle;
		fLocalidad = pfLocalidad;
		fProvincia = pfProvincia;
		fCp = pfCp;
		fPais = pfPais;
		fTel = pfTel;
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

	public String getfCalle() {
		return fCalle;
	}

	public void setfCalle(String fCalle) {
		this.fCalle = fCalle;
	}

	public String getfLocalidad() {
		return fLocalidad;
	}

	public void setfLocalidad(String fLocalidad) {
		this.fLocalidad = fLocalidad;
	}

	public String getfProvincia() {
		return fProvincia;
	}

	public void setfProvincia(String fProvincia) {
		this.fProvincia = fProvincia;
	}

	public String getfCp() {
		return fCp;
	}

	public void setfCp(String fCp) {
		this.fCp = fCp;
	}

	public String getfPais() {
		return fPais;
	}

	public void setfPais(String fPais) {
		this.fPais = fPais;
	}

	public String getfTel() {
		return fTel;
	}

	public void setfTel(String fTel) {
		this.fTel = fTel;
	}

}
