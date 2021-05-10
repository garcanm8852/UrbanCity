package Product;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class ProductoImagen extends SimpleTagSupport {
	String idreferencia;

	public void setIdreferencia(String sIdreferencia) {
		idreferencia = sIdreferencia;
	}

	@Override
	public void doTag() throws JspException, IOException {
		JspWriter out = getJspContext().getOut();
		out.println("<img src='/UrbanCity/DecodificarImagen?idreferencia=" + idreferencia
				+ "' alt='' class='w-100 d-block'>");
	}
}