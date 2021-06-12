package Product;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class ProductoGuiaTalla extends SimpleTagSupport {

	String talla;
	final String URL = "jdbc:postgresql://ns3034756.ip-91-121-81.eu/a20-mgarde";
	final String USER = "a20-mgarde";
	final String PASSW = "a20-mgarde";
	Connection Conexion;
	PreparedStatement ps;
	ResultSet cargaTalla;

	public void setTalla(String stalla) {
		talla = stalla;
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

	public boolean cargarGuia(String pTalla) {
		try {
			establecerConexion();
			ps = Conexion.prepareStatement("SELECT * FROM urbancity.guiatalla where talla = ?");
			ps.setString(1, pTalla);
			cargaTalla = ps.executeQuery();
			cargaTalla.next();
			cerrarConexion();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	@Override
	public void doTag() throws JspException, IOException {
		try {
			JspWriter out = getJspContext().getOut();
			cargarGuia(talla);
			out.print("<div class='container'>");
			out.print("<div class='row'>");
			out.print("<div class='col-3 p-3 bg-Urban-1 text-white text-center'>Talla</div>");
			out.print("<div class='col-3 p-3 bg-Urban-1 text-white text-center'>Pecho</div>");
			out.print("<div class='col-3 p-3 bg-Urban-1 text-white text-center'>Cintura</div>");
			out.print("<div class='col-3 p-3 bg-Urban-1 text-white text-center'>Cadera</div>");
			out.print("</div>");
			out.print("<div class='row'>");
			out.print("<div class='col-3 p-3 text-center'> " + cargaTalla.getString(2) +"</div>");
			out.print("<div class='col-3 p-3 text-center'> " + cargaTalla.getString(3) +"</div>");
			out.print("<div class='col-3 p-3 text-center'> " + cargaTalla.getString(4) +"</div>");
			out.print("<div class='col-3 p-3 text-center'> " + cargaTalla.getString(5) +"</div>");
			out.print("</div>");
			out.print("</div>");

		} catch (Exception e) {
			// TODO: handle exception
		}

	}
}