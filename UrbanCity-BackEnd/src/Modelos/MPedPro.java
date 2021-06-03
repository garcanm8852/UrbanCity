package Modelos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MPedPro {
	Connection Conexion;
	PreparedStatement ps;
	final String URL = "jdbc:postgresql://ns3034756.ip-91-121-81.eu/a20-mgarde";
	final String USER = "a20-mgarde";
	final String PASSW = "a20-mgarde";
	ResultSet cargaPedidoProductos;
	String idreferencia;
	boolean estado = false;

	public MPedPro() {

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

	public void AnadirRelacion(int pIdPedido, String pIdreferencia) {
		try {
			establecerConexion();

			ps = Conexion.prepareStatement("INSERT INTO luftgun.pedpro(idpedido, idreferencia)VALUES (?, ?)");
			ps.setInt(1, pIdPedido);
			ps.setString(2, pIdreferencia);
			ps.execute();

			cerrarConexion();
		} catch (Exception e) {
			// TODO: handle exception
		}

	}

	public void eliminarRelacion(int idpedido) {

		try {
			establecerConexion();
			ps = Conexion.prepareStatement("DELETE FROM luftgun.pedpro WHERE idpedido = ?");
			ps.setInt(1, idpedido);
			ps.execute();
			cerrarConexion();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public void consultarProductosPorPedido(int idpedido) {
		try {
			establecerConexion();
			ps = Conexion.prepareStatement("SELECT * FROM luftgun.pedpro WHERE idpedido = ?");
			ps.setInt(1, idpedido);
			cargaPedidoProductos = ps.executeQuery();
			cargaPedidoProductos.next();
			cerrarConexion();
		} catch (Exception e) {
			// TODO: handle exception

		}
	}
	
	
	public String getIDreferencia(){
		idreferencia = "";
		try {
			idreferencia = cargaPedidoProductos.getString(2);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return idreferencia;
	
	}
	
	public boolean consultarSiguiente() {
		estado = false;
		try {
			 estado = cargaPedidoProductos.next();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return estado;

	}
	
	
}
