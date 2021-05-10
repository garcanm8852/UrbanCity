package Catalogo;

public class CCategoria {
	int idcategoria;
	String nombre;

	public CCategoria(int idcategoria, String nombre) {
		this.idcategoria = idcategoria;
		this.nombre = nombre;
	}

	public String getNombre() {
		return nombre;
	}

	public int getIdcategoria() {
		return idcategoria;
	}



}
