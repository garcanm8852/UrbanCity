package Product;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class ProductoNombre extends SimpleTagSupport {

	String nombre;

	public void setNombre(String snombre) {
		nombre = snombre;
	}

	@Override
	public void doTag() throws JspException, IOException {
		JspWriter out = getJspContext().getOut();
		out.println("<h6 class='text-center text-white p-3'>" + nombre + "</h6>");
	}
}