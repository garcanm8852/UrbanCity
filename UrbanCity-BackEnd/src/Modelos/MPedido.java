package Modelos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

public class MPedido {
	Connection Conexion;
	PreparedStatement ps;
	ResultSet cargaPedido;
	ResultSet cargaCantidad;
	
	final String URL = "jdbc:postgresql://ns3034756.ip-91-121-81.eu/a20-mgarde";
	final String USER = "a20-mgarde";
	final String PASSW = "a20-mgarde";
	int idpedido;
	
	boolean estado;
	Date fecha;
	String nombre;
	String calle;
	String provincia;
	String localidad;
	String cp;
	String pais;
	String tel;
	int cantidad;

	public MPedido() {
	}

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

	public void AnadirPedido(int pIdpedido, int pIdcliente, String pNombre,int pTelefono, String pCalle, String pProvincia,
			String pLocalidad, int pCp, String pPais) {
		try {
			establecerConexion();
			ps = Conexion.prepareStatement(
					"INSERT INTO urbancity.pedido(idpedido, idcliente, fecha, nombre, tel, calle, provincia, localidad, cp, pais) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
			ps.setInt(1, pIdpedido);
			ps.setInt(2, pIdcliente);
			ps.setDate(3, java.sql.Date.valueOf(java.time.LocalDate.now()));
			ps.setString(4, pNombre);
			ps.setInt(5, pTelefono);
			ps.setString(6, pCalle);
			ps.setString(7, pProvincia);
			ps.setString(8, pLocalidad);
			ps.setInt(9, pCp);
			ps.setString(10, pPais);
			ps.execute();
			cerrarConexion();
		} catch (Exception e) {

			e.printStackTrace();
		}

	}

	public void getUltimoPedido() {
		try {
			establecerConexion();
			ps = Conexion.prepareStatement("SELECT MAX(idpedido) FROM urbancity.pedido");
			cargaPedido = ps.executeQuery();
			cargaPedido.next();
			cerrarConexion();
		} catch (Exception e) {
			// TODO: handle exception
		}

	}

	public void pedidosClientes(int pIdcliente) {
		try {
			establecerConexion();
			ps = Conexion.prepareStatement("SELECT * FROM urbancity.pedido where idcliente = ?");
			ps.setInt(1, pIdcliente);
			cargaPedido = 
			ps.executeQuery();
			cerrarConexion();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public boolean consultarSiguiente() {
		 estado = false;
		try {
			estado =  cargaPedido.next();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return estado;
	}
	
	public void consultarCantidadPedidosPorCliente(int idpedido) {
		try {
			establecerConexion();
			ps = Conexion.prepareStatement("SELECT COUNT(idpedido) FROM urbancity.pedido WHERE idcliente = ?");
			ps.setInt(1, idpedido);
			cargaCantidad = ps.executeQuery();
			cargaCantidad.next();
			cerrarConexion();
		} catch (Exception e) {
			// TODO: handle exception

		}
	}
	
	public int getCantidad() {
		cantidad = 0;
		try {
			cantidad = cargaCantidad.getInt(1);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return cantidad;
	}

	public int getIdpedido() {
		idpedido = 0;
		try {
			idpedido = cargaPedido.getInt(1);
		} catch (Exception e) {
			// TODO: handle exception
		}

		return idpedido;
	}
	
	public Date getFecha() {
		fecha = null;
		try {
			fecha = cargaPedido.getDate("fecha");
		} catch (Exception e) {
			// TODO: handle exception
		}

		return fecha;
	}
	
	public String getNombre(){
		nombre = null;
		try {
			nombre = cargaPedido.getString("nombre");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return nombre;
	}
	
	public String getCalle(){
		calle = null;
		try {
			calle = cargaPedido.getString("calle");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return calle;
	}
	
	public String getProvincia(){
		provincia = null;
		try {
			provincia = cargaPedido.getString("provincia");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return provincia;
	}
	
	public String getLocalidad(){
		localidad = null;
		try {
			localidad = cargaPedido.getString("localidad");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return localidad;
	}
	
	public String getCP(){
		cp = null;
		try {
			cp = cargaPedido.getString("cp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cp;
	}
	
	public String getPais(){
		pais = null;
		try {
			pais = cargaPedido.getString("pais");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return pais;
	}
	
	public String getTel(){
		tel = null;
		try {
			tel = cargaPedido.getString("tel");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return tel;
	}
	
	
	
	

	public void eliminarPedido(int idpedido2) {
try {
	establecerConexion();
	ps = Conexion.prepareStatement("DELETE FROM urbancity.pedido where idpedido = ?");
	ps.setInt(1, idpedido2);
	ps.execute();
	cerrarConexion();
} catch (Exception e) {
	// TODO: handle exception
}
		
	}

}
