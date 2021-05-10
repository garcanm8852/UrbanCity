package Product;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class ProductoBoton extends SimpleTagSupport {

	String idreferencia;

	public void setIdreferencia(String sIdreferencia) {
		idreferencia = sIdreferencia;

	}

	@Override
	public void doTag() throws JspException, IOException {
		JspWriter out = getJspContext().getOut();
		out.println("<div class='col-8'>");
		out.println("<div class='w-100'>");
		out.println("<a href='Producto?idreferencia=" + idreferencia
				+ "' class='btn bg-Urban-2 text-center text-white w-100'>Ver Producto</a>");
		out.println("</div>");
		out.println("</div>");

	}
}
