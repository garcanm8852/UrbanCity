package Product;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class ProductoPrecio  extends SimpleTagSupport {
	
	String precio;
	
	public void setPrecio(String sprecio) {
		precio = sprecio;
	}
	
	@Override
	public void doTag() throws JspException, IOException {
		JspWriter out = getJspContext().getOut();
		out.println("<div class='col-4 text-white text-center fw-b btn'>" + precio + "€</div>");
	}
}

