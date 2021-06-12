package Modelos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MProducto {
	Connection Conexion;
	ResultSet cargaProductos;
	ResultSet srcProducto;
	ResultSet cargaRegistros;
	String idreferencia;
	String nombre;
	String talla;
	String descripcion;
	Double precio;
	byte[] img;
	int stock;
	int subcategoria;
	byte[] src;
	String nombreCategoria;
	int categoria;
	String nombreSubcategoria;
	int numeroRegistros;
	int pagina;
	boolean estadoExiste;
	PreparedStatement ps;
	String Sentencia;
	boolean estado = false;
	final String URL = "jdbc:postgresql://ns3034756.ip-91-121-81.eu/a20-mgarde";
	final String USER = "a20-mgarde";
	final String PASSW = "a20-mgarde";

	public void establecerConexion() {
		try {
			Conexion = DriverManager.getConnection(URL, USER, PASSW);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void cerrarConexion() {
		try {
			Conexion.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void cargarProductos() {
		try {
			establecerConexion();
			ps = Conexion.prepareStatement("SELECT * FROM urbancity.producto");
			cargaProductos = ps.executeQuery();
			cargaProductos.next();
			cerrarConexion();
		} catch (SQLException e) {
		}
	}

	public void cargarProductosPaginados(int pPagina) {
		pagina = 8 * pPagina;
		try {
			establecerConexion();
			ps = Conexion.prepareStatement("SELECT * FROM urbancity.producto offset ? limit 8");
			ps.setInt(1, pagina);
			cargaProductos = ps.executeQuery();
			cargaProductos.next();
			cerrarConexion();
		} catch (SQLException e) {
		}
	}

	public void cargarProductosPaginadosModular(int pPagina, int RangoPaginacion) {
		pagina = RangoPaginacion * pPagina;
		try {
			establecerConexion();
			ps = Conexion.prepareStatement("SELECT * FROM urbancity.producto offset ? limit ?");
			ps.setInt(1, pagina);
			ps.setInt(2, RangoPaginacion);
			cargaProductos = ps.executeQuery();
			cargaProductos.next();
			cerrarConexion();
		} catch (SQLException e) {
		}
	}

	public void buscarProductosPaginadosModular(String termino, int pPagina, int RangoPaginacion) {
		pagina = RangoPaginacion * pPagina;
		try {
			establecerConexion();
			ps = Conexion.prepareStatement(
					"SELECT * FROM urbancity.producto WHERE nombre LIKE '" + termino + "%'  offset ? limit ?");
			ps.setInt(1, pagina);
			ps.setInt(2, RangoPaginacion);
			cargaProductos = ps.executeQuery();
			cargaProductos.next();
			cerrarConexion();
		} catch (SQLException e) {
		}
	}

	public int numeroRegistros() {
		numeroRegistros = 0;
		try {
			establecerConexion();
			ps = Conexion.prepareStatement("SELECT COUNT(idreferencia) from urbancity.producto");
			cargaRegistros = ps.executeQuery();
			cargaRegistros.next();
			numeroRegistros = cargaRegistros.getInt(1);
			cerrarConexion();
		} catch (Exception e) {
			// TODO: handle exception
		}

		return numeroRegistros;
	}

	public int numeroRegistrosPorCategoria(int idcategoria) {
		numeroRegistros = 0;
		try {
			establecerConexion();
			ps = Conexion.prepareStatement("SELECT COUNT(idreferencia) from urbancity.producto WHERE idcategoria=?");
			ps.setInt(idcategoria, 1);
			cargaRegistros = ps.executeQuery();
			cargaRegistros.next();
			numeroRegistros = cargaRegistros.getInt(1);
			cerrarConexion();
		} catch (Exception e) {
			// TODO: handle exception
		}

		return numeroRegistros;
	}

	public int numeroRegistrosPorSubcategoria(int idsubcategoria) {
		numeroRegistros = 0;
		try {
			establecerConexion();
			ps = Conexion.prepareStatement("SELECT COUNT(idreferencia) from urbancity.producto WHERE idsubcategoria=?");
			ps.setInt(idsubcategoria, 1);
			cargaRegistros = ps.executeQuery();
			cargaRegistros.next();
			numeroRegistros = cargaRegistros.getInt(1);
			cerrarConexion();
		} catch (Exception e) {
			// TODO: handle exception
		}

		return numeroRegistros;
	}

	public void cargarProductosPorCategorias(int pidCategoria) {
		try {
			establecerConexion();
			ps = Conexion.prepareStatement("SELECT * FROM urbancity.DatosProductosCompletoBusqueda(?);");
			ps.setInt(1, pidCategoria);
			cargaProductos = ps.executeQuery();
			cargaProductos.next();
			cerrarConexion();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public void cargarProductosPorCategoriasModular(int pidCategoria, int pPagina, int RangoPaginacion) {
		try {
			establecerConexion();
			ps = Conexion.prepareStatement("SELECT * FROM urbancity.DatosProductosCompletoBusqueda(?);");
			ps.setInt(1, pidCategoria);
			cargaProductos = ps.executeQuery();
			cargaProductos.next();
			cerrarConexion();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public void cargarProductosPorSubcategorias(int idSubcategoria) {
		try {
			establecerConexion();
			ps = Conexion.prepareStatement("SELECT * FROM urbancity.DatosProductoSubcategoria(?);");
			ps.setInt(1, idSubcategoria);
			cargaProductos = ps.executeQuery();
			cargaProductos.next();
			cerrarConexion();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public void cargarProductosPorSimilares(int idSubcategoria) {
		try {
			establecerConexion();
			ps = Conexion.prepareStatement("SELECT * FROM urbancity.DatosProductoSubcategoria(?) OFFSET 0 LIMIT 4;");
			ps.setInt(1, idSubcategoria);
			cargaProductos = ps.executeQuery();
			cargaProductos.next();
			cerrarConexion();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public byte[] cargarImagenProducto(String pidreferencia) {
		src = null;
		srcProducto = null;
		try {
			establecerConexion();
			ps = Conexion.prepareStatement("SELECT img FROM urbancity.producto WHERE idreferencia = ?");
			ps.setString(1, pidreferencia);
			srcProducto = ps.executeQuery();
			srcProducto.next();
			src = srcProducto.getBytes(1);
			cerrarConexion();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return src;
	}

	public void consultarProducto(String pidreferencia) {
		try {
			establecerConexion();
			ps = Conexion.prepareStatement("SELECT * FROM urbancity.DatosProductoBusqueda(?)");
			ps.setString(1, pidreferencia);
			cargaProductos = ps.executeQuery();
			cargaProductos.next();
			cerrarConexion();
		} catch (Exception e) {
			// TODO: handle exception
		}

	}

	public void insertarProducto(String pIdreferencia, String pNombre, String pDescripcion, Double pPrecio,
			int pIDsubcategoria, String pTalla) {
		try {
			establecerConexion();
			ps = Conexion.prepareStatement(
					"INSERT INTO urbancity.producto(	idreferencia, nombre, descripcion, precio, idsubcategoria, talla) VALUES (?, ?, ?, ?, ?, ?);");
			ps.setString(1, pIdreferencia);
			ps.setString(2, pNombre);
			ps.setString(3, pDescripcion);
			ps.setDouble(4, pPrecio);
			ps.setInt(5, pIDsubcategoria);
			ps.setString(6, pTalla);
			ps.execute();
			cerrarConexion();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public void modificarProducto(String pIdreferencia, String pNombre, String pDescripcion, Double pPrecio,
			int pIDsubcategoria, String pTalla) {
		try {
			establecerConexion();
			ps = Conexion.prepareStatement(
					"UPDATE urbancity.producto SET nombre=?, descripcion=?, precio=?, idsubcategoria=?, talla=? WHERE idreferencia = ?;");
			ps.setString(1, pNombre);
			ps.setString(2, pDescripcion);
			ps.setDouble(3, pPrecio);
			ps.setInt(4, pIDsubcategoria);
			ps.setString(5, pTalla);
			ps.setString(6, pIdreferencia);
			ps.execute();
			cerrarConexion();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	public void eliminarProducto(String pIdreferencia) {
try {
	establecerConexion();
	ps = Conexion.prepareStatement("DELETE FROM urbancity.producto WHERE idreferencia = ?");
	ps.setString(1, pIdreferencia);
	ps.execute();
	cerrarConexion();
	
		} catch (Exception e) {
	// TODO: handle exception
}		
	}

	public boolean consultarSiguiente() {
		estado = false;
		try {
			estado = cargaProductos.next();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return estado;

	}

	public boolean consultarAnterior() {
		estado = false;
		try {
			estado = cargaProductos.previous();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return estado;

	}

	public void cursorPrincipio() {
		try {
			cargaProductos.first();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void cursorFinal() {
		try {
			cargaProductos.last();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public String getIdreferencia() {
		idreferencia = "";
		try {
			idreferencia = cargaProductos.getString("idreferencia");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return idreferencia;
	}

	public String getNombre() {
		nombre = null;
		try {
			nombre = cargaProductos.getString("nombre");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return nombre;
	}

	// TODO CAMBIAR POR TALLA
	public String getTalla() {
		talla = null;
		try {
			talla = cargaProductos.getString("talla");
		} catch (Exception e) {
			// TODO: handle exception
		}
		return talla;
	}

	public String getDescripcion() {
		descripcion = null;
		try {
			descripcion = cargaProductos.getString("descripcion");
		} catch (Exception e) {
			// TODO: handle exception
		}
		return descripcion;
	}

	public Double getPrecio() {
		precio = null;
		try {
			precio = cargaProductos.getDouble("precio");
		} catch (Exception e) {
			// TODO: handle exception
		}
		return precio;
	}

	public byte[] getImg() {
		img = null;
		try {
			img = cargaProductos.getBytes("img");
		} catch (Exception e) {
			// TODO: handle exception
		}

		return img;
	}

	public int getStock() {
		stock = 0;
		try {
			stock = cargaProductos.getInt("stock");
		} catch (Exception e) {
			// TODO: handle exception
		}
		return stock;
	}

	public int getSubcategoria() {
		subcategoria = 0;
		try {
			subcategoria = cargaProductos.getInt("idsubcategoria");
		} catch (Exception e) {
			// TODO: handle exception
		}
		return subcategoria;
	}

	public String getNombreSubcategoria() {
		nombreSubcategoria = "";
		try {
			nombreSubcategoria = cargaProductos.getString("nombresubcategoria");
		} catch (Exception e) {
			// TODO: handle exception
		}

		return nombreSubcategoria;
	}

	public int getCategoria() {
		categoria = 0;
		try {
			categoria = cargaProductos.getInt("idcategoria");
		} catch (Exception e) {
			// TODO: handle exception
		}

		return categoria;
	}

	public String getNombreCategoria() {
		nombreCategoria = "";
		try {
			nombreCategoria = cargaProductos.getString("nombrecategoria");
		} catch (Exception e) {
			// TODO: handle exception
		}
		return nombreCategoria;
	}



}
