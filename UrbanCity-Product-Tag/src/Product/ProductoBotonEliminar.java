package Product;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class ProductoBotonEliminar extends SimpleTagSupport {

	String idreferencia;

	public void setIdreferencia(String sIdreferencia) {
		idreferencia = sIdreferencia;

	}

	@Override
	public void doTag() throws JspException, IOException {
		JspWriter out = getJspContext().getOut();
		out.println("<div class='col-6'>");
		out.println("<div class='w-100'>");
		out.println("<a href='EliminarProducto?idreferencia=" + idreferencia
				+ "' class='btn bg-danger text-center text-white w-100'>Eliminar Producto</a>");
		out.println("</div>");
		out.println("</div>");

	}
}