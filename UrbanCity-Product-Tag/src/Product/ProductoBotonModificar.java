package Product;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class ProductoBotonModificar extends SimpleTagSupport {

	String idreferencia;

	public void setIdreferencia(String sIdreferencia) {
		idreferencia = sIdreferencia;

	}

	@Override
	public void doTag() throws JspException, IOException {
		JspWriter out = getJspContext().getOut();
		out.println("<div class='col-6'>");
		out.println("<div class='w-100'>");
		out.println("<a href='ModificarProducto?idreferencia=" + idreferencia
				+ "' class='btn bg-success text-center text-white w-100'>Modificar Producto</a>");
		out.println("</div>");
		out.println("</div>");

	}
}