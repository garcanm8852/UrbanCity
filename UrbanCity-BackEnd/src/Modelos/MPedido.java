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

	public void AnadirPedido(int pIdpedido, int pIdcliente, int pTelefono, String pCalle, String pProvincia,
			String pLocalidad, int pCp, String pPais) {
		try {
			establecerConexion();
			ps = Conexion.prepareStatement(
					"INSERT INTO luftgun.pedido(idpedido, idcliente, fecha, tel, calle, provincia, localidad, cp, pais) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
			ps.setInt(1, pIdpedido);
			ps.setInt(2, pIdcliente);
			ps.setDate(3, java.sql.Date.valueOf(java.time.LocalDate.now()));
			ps.setInt(4, pTelefono);
			ps.setString(5, pCalle);
			ps.setString(6, pProvincia);
			ps.setString(7, pLocalidad);
			ps.setInt(8, pCp);
			ps.setString(9, pPais);
			ps.execute();
			cerrarConexion();
		} catch (Exception e) {

			e.printStackTrace();
		}

	}

	public void getUltimoPedido() {
		try {
			establecerConexion();
			ps = Conexion.prepareStatement("SELECT MAX(idpedido) FROM luftgun.pedido");
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
			ps = Conexion.prepareStatement("SELECT * FROM luftgun.pedido where idcliente = ?");
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
			fecha = cargaPedido.getDate(3);
		} catch (Exception e) {
			// TODO: handle exception
		}

		return fecha;
	}
	
	public String getNombre(){
		nombre = null;
		try {
			nombre = cargaPedido.getString(4);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return nombre;
	}
	
	public String getCalle(){
		calle = null;
		try {
			calle = cargaPedido.getString(5);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return calle;
	}
	
	public String getProvincia(){
		provincia = null;
		try {
			provincia = cargaPedido.getString(6);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return provincia;
	}
	
	public String getLocalidad(){
		localidad = null;
		try {
			localidad = cargaPedido.getString(7);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return localidad;
	}
	
	public String getCP(){
		cp = null;
		try {
			cp = cargaPedido.getString(8);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cp;
	}
	
	public String getPais(){
		pais = null;
		try {
			pais = cargaPedido.getString(9);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return pais;
	}
	
	public String getTel(){
		tel = null;
		try {
			tel = cargaPedido.getString(10);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return tel;
	}
	
	
	
	

	public void eliminarPedido(int idpedido2) {
try {
	establecerConexion();
	ps = Conexion.prepareStatement("DELETE FROM luftgun.pedido where idpedido = ?");
	ps.setInt(1, idpedido2);
	ps.execute();
	cerrarConexion();
} catch (Exception e) {
	// TODO: handle exception
}
		
	}

}
