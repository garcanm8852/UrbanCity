package Catalogo;

public class Cproducto {

	String idreferencia;
	String nombre;
	String talla;
	String descripcion;
	Double precio;
	byte[] img;
	int stock;
	int subcategoria;
	int categoria;
	String nombreCategoria;
	String nombreSubcategoria;

	public Cproducto(String pidreferencia, String pnombre, String ptalla, String pdescripcion, Double pprecio,
			byte[] pimg, int pstock, int psubcategoria) {
		idreferencia = pidreferencia;
		nombre = pnombre;
		talla = ptalla;
		descripcion = pdescripcion;
		precio = pprecio;
		img = pimg;
		stock = pstock;
		subcategoria = psubcategoria;
	}
	
	
	
	public Cproducto(String pidreferencia, String pnombre, String ptalla, String pdescripcion, Double pprecio,
		int pstock, int psubcategoria) {
		idreferencia = pidreferencia;
		nombre = pnombre;
		talla = ptalla;
		descripcion = pdescripcion;
		precio = pprecio;
		stock = pstock;
		subcategoria = psubcategoria;
	}
	
	public Cproducto(String pidreferencia, String pnombre, String pdescripcion, Double pprecio
			) {
			idreferencia = pidreferencia;
			nombre = pnombre;
			descripcion = pdescripcion;
			precio = pprecio;
		}

	public Cproducto(String pidreferencia, String pnombre, String ptalla, String pdescripcion, Double pprecio,
			int pstock, int pcategoria, int psubcategoria, String pnombreCategoria, String pnombreSubcategoria) {
		idreferencia = pidreferencia;
		nombre = pnombre;
		talla = ptalla;
		descripcion = pdescripcion;
		precio = pprecio;
		stock = pstock;
		categoria = pcategoria;
		subcategoria = psubcategoria;
		nombreCategoria = pnombreCategoria;
		nombreSubcategoria = pnombreSubcategoria;
	}

	public String getIdreferencia() {
		return idreferencia;
	}

	public String getNombre() {
		return nombre;
	}

	public String getTalla() {
		return talla;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public Double getPrecio() {
		return precio;
	}

	public byte[] getImg() {
		return img;
	}

	public int getStock() {
		return stock;
	}

	public int getSubcategoria() {
		return subcategoria;
	}
	
	public int getCategoria() {
		return categoria;
	}

	public String getNombreCategoria() {
		return nombreCategoria;
	}

	public String getNombreSubcategoria() {
		return nombreSubcategoria;
	}

}
