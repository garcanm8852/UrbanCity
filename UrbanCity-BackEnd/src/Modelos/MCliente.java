package Modelos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MCliente {
	Connection Conexion;
	PreparedStatement ps;
	ResultSet cargaCliente;
	ResultSet cargaID;
	int idCliente;
	String Nombre;
	String Apellido;
	String Email;
	String Contrasena;
	String EstadoCliente;
	String calle;
	String localidad;
	String provincia;
	String cp;
	String pais;
	String tel;
	int ultimoID;
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

	public void DatosInicioSesion(String pEmail, String pContrasena) {
		try {
			establecerConexion();
			ps = Conexion.prepareStatement("SELECT * FROM urbancity.cliente WHERE email = ? AND contrasena = ?");
			ps.setString(1, pEmail);
			ps.setString(2, pContrasena);
			cargaCliente = ps.executeQuery();
			cargaCliente.next();
			cerrarConexion();
		} catch (Exception e) {
		}
	}

	public boolean ExisteCliente(String pEmail) {
		try {
			establecerConexion();
			ps = Conexion.prepareStatement("SELECT * FROM urbancity.cliente where email = ?");
			ps.setString(1, pEmail);
			cargaCliente = ps.executeQuery();
			cargaCliente.next();
			cerrarConexion();

		} catch (Exception e) {
			// TODO: handle exception
		}

		return false;
	}
	
	public boolean cargarCliente(int pIdcliente) {
		try {
			establecerConexion();
			ps = Conexion.prepareStatement("SELECT * FROM urbancity.cliente where idcliente = ?");
			ps.setInt(1, pIdcliente);
			cargaCliente = ps.executeQuery();
			cargaCliente.next();
			cerrarConexion();

		} catch (Exception e) {
			// TODO: handle exception
		}

		return false;
	}

	public int nextID() {
		ultimoID = 0;
		cargaID = null;
		try {
			establecerConexion();
			ps = Conexion.prepareStatement("SELECT MAX(idcliente) FROM urbancity.cliente");
			cargaID = ps.executeQuery();
			cargaID.next();
			cerrarConexion();

			ultimoID = cargaID.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return ultimoID;
	}

	public void insertarCliente(int pIdcliente, String pnombre, String pApellido, String pEmail, String pContrasena, String pCalle, String pLocalidad, String pProvincia, String pCp, String pais, String pTel) {
		try {
			establecerConexion();
			ps = Conexion.prepareStatement(
					"INSERT INTO urbancity.cliente(idcliente, nombre, apellido, email, contrasena, estado, calle, localidad, provincia, cp, pais, tel) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);");
			ps.setInt(1, pIdcliente);
			ps.setString(2, pnombre);
			ps.setString(3, pApellido);
			ps.setString(4, pEmail);
			ps.setString(5, pContrasena);
			ps.setString(6, "No Operativo");
			ps.setString(7, pCalle);
			ps.setString(8, pLocalidad);
			ps.setString(9, pProvincia);
			ps.setString(10, pCp);
			ps.setString(11, pProvincia);
			ps.setString(12, pTel);
			ps.execute();
			cerrarConexion();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void CambiarEstado(int pIdcliente, String pEstado) {

		try {
			establecerConexion();
			ps = Conexion.prepareStatement("UPDATE urbancity.cliente SET estado=?	WHERE idcliente =?");
			ps.setString(1, pEstado);
			ps.setInt(2, pIdcliente);
			ps.execute();
			cerrarConexion();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public void EliminarCuenta(int pIdcuenta) {
		try {
			establecerConexion();
			ps = Conexion.prepareStatement("DELETE FROM urbancity.cliente WHERE idcliente = ?;");
			ps.setInt(1, pIdcuenta);
			ps.execute();
			cerrarConexion();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void actualizarDatos(String pNombre, String pApellido, String pEmail, String pContrasena, String pCalle, String pLocalidad, String pProvincia, String pCp, String pPais, String pTel, int pIdcliente) {
		try {
			establecerConexion();
			ps = Conexion.prepareStatement("UPDATE urbancity.cliente SET nombre=?, apellido=?, email=?, contrasena=?, calle=?, localidad=?, provincia=?, cp=?, pais=?, tel=? WHERE idcliente = ?;");
			ps.setInt(1, pIdcliente);
			ps.setString(1, pNombre);
			ps.setString(2, pApellido);
			ps.setString(3, pEmail);
			ps.setString(4, pContrasena);
			ps.setString(5, pCalle);
			ps.setString(6, pLocalidad);
			ps.setString(7, pProvincia);
			ps.setString(8, pCp);
			ps.setString(9, pProvincia);
			ps.setString(10, pTel);
			ps.setInt(11, pIdcliente);
			ps.execute();
			cerrarConexion();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public int getIdcliente() {
		idCliente = 0;
		try {
			idCliente = cargaCliente.getInt(1);
		} catch (Exception e) {
			// TODO: handle exception
		}

		return idCliente;
	}

	public String getNombre() {
		Nombre = "";
		try {
			Nombre = cargaCliente.getString(2);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return Nombre;
	}

	public String getApellido() {
		Apellido = "";
		try {
			Apellido = cargaCliente.getString(3);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return Apellido;
	}

	public String getEmail() {
		Email = "";
		try {
			Email = cargaCliente.getString(4);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
		}
		return Email;
	}

	public String getContrasena() {
		Contrasena = "";
		try {
			Contrasena = cargaCliente.getString(5);
		} catch (Exception e) {
			// TODO: handle exception
		}

		return Contrasena;
	}
	
	public String getEstadoCliente() {
		EstadoCliente = "";
		try {
			EstadoCliente = cargaCliente.getString(6);
		} catch (Exception e) {
			// TODO: handle exception
		}

		return EstadoCliente;
	}
	
	public String getCalle() {
		calle = "";
		try {
			calle = cargaCliente.getString(7);
		} catch (Exception e) {
			// TODO: handle exception
		}

		return calle;	}

	public String getLocalidad() {
		localidad = "";
		try {
			localidad = cargaCliente.getString(8);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return localidad;
	}

	public String getProvincia() {
		provincia = "";
		try {
			provincia = cargaCliente.getString(9);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return provincia;
	}

	public String getCp() {
		cp = "";
		try {
			cp = cargaCliente.getString(10);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return cp;
	}

	public String getPais() {
		pais = "";
		try {
			pais = cargaCliente.getString(11);
		} catch (Exception e) {
			// TODO: handle exception
		
		}
		return pais;
	}



	public String getTel() {
		tel = "";
		try {
			tel = cargaCliente.getString(12);
		} catch (Exception e) {
			// TODO: handle exception
		
		}
		return tel;
	}



}
