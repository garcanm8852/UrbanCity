package Modelos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MSubcategoria {
	
	Connection Conexion;
	ResultSet cargaSubcategorias;
	int id;
	String nombreSubcategoria;
	PreparedStatement ps;
	String Sentencia;
	boolean estado = false;
	final String URL = "jdbc:postgresql://ns3034756.ip-91-121-81.eu/a20-mgarde";
	final String USER = "a20-mgarde";
	final String PASSW = "a20-mgarde";
	
	public MSubcategoria() {
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
	

	public void cargarSubcategorias() {
		try {
			establecerConexion();
			ps = Conexion.prepareStatement("SELECT * FROM urbancity.subcategoria");
			cargaSubcategorias = ps.executeQuery();
			cargaSubcategorias.next();
			cerrarConexion();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public boolean consultarSiguiente() {
		estado = false;
		try {
			 estado = cargaSubcategorias.next();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return estado;

	}
	
	public boolean consultarAnterior() {
		estado = false;
		try {
			 estado = cargaSubcategorias.previous();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return estado;

	}
	
	public void cursorPrincipio() {
		try {
			cargaSubcategorias.first();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void cursorFinal() {
		try {
			cargaSubcategorias.last();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public int getId(){
		id = 0;
		try {
			id = cargaSubcategorias.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return id;
	}
	
	public String getnombreSubcategoria(){
		nombreSubcategoria = null;
		try {
			nombreSubcategoria = cargaSubcategorias.getString(2);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return nombreSubcategoria;
	}
}
