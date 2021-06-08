package Product;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class SelectorTalla extends SimpleTagSupport {

	String talla;

	public void setTalla(String stalla) {
		talla = stalla;
	}

	@Override
	public void doTag() throws JspException, IOException {

		JspWriter out = getJspContext().getOut();
		switch (talla) {
		case "xs":
			out.println("             <div class=\"container\">\r\n" + 
					"                        <div class=\"row mt-4 text-center justify-content-center\">\r\n" + 
					"                            <div class=\"col no-padding\">\r\n" + 
					"                                <div class=\"page-item active no-border-radius\">\r\n" + 
					"                                    <a class=\"page-link\">XS</a>\r\n" + 
					"                                </div>\r\n" + 
					"                            </div>\r\n" + 
					"                            <div class=\"col no-padding\">\r\n" + 
					"                                <div class=\"page-item no-border-radius\">\r\n" + 
					"                                    <a class=\"page-link\">S</a>\r\n" + 
					"                                </div>\r\n" + 
					"                            </div>\r\n" + 
					"                            <div class=\"col no-padding\">\r\n" + 
					"                                <div class=\"page-item  no-border-radius\">\r\n" + 
					"                                    <a class=\"page-link\">M</a>\r\n" + 
					"                                </div>\r\n" + 
					"                            </div>\r\n" + 
					"                            <div class=\"col no-padding \">\r\n" + 
					"                                <div class=\"page-item no-border-radius\">\r\n" + 
					"                                    <a class=\"page-link\">L</a>\r\n" + 
					"                                </div>\r\n" + 
					"                            </div>\r\n" + 
					"                            <div class=\"col no-padding\">\r\n" + 
					"                                <div class=\"page-item no-border-radius\">\r\n" + 
					"                                    <a class=\"page-link\">XL</a>\r\n" + 
					"                                </div>\r\n" + 
					"                            </div>\r\n" + 
					"\r\n" + 
					"\r\n" + 
					"                        </div>\r\n" + 
					"                    </div>");
			break;

		case "s":
			out.println("                    <div class=\"container\">\r\n" + 
					"                        <div class=\"row mt-4 text-center justify-content-center\">\r\n" + 
					"                            <div class=\"col no-padding\">\r\n" + 
					"                                <div class=\"page-item no-border-radius\">\r\n" + 
					"                                    <a class=\"page-link\">XS</a>\r\n" + 
					"                                </div>\r\n" + 
					"                            </div>\r\n" + 
					"                            <div class=\"col no-padding\">\r\n" + 
					"                                <div class=\"page-item active no-border-radius\">\r\n" + 
					"                                    <a class=\"page-link\">S</a>\r\n" + 
					"                                </div>\r\n" + 
					"                            </div>\r\n" + 
					"                            <div class=\"col no-padding\">\r\n" + 
					"                                <div class=\"page-item no-border-radius\">\r\n" + 
					"                                    <a class=\"page-link\">M</a>\r\n" + 
					"                                </div>\r\n" + 
					"                            </div>\r\n" + 
					"                            <div class=\"col no-padding \">\r\n" + 
					"                                <div class=\"page-item no-border-radius\">\r\n" + 
					"                                    <a class=\"page-link\">L</a>\r\n" + 
					"                                </div>\r\n" + 
					"                            </div>\r\n" + 
					"                            <div class=\"col no-padding\">\r\n" + 
					"                                <div class=\"page-item no-border-radius\">\r\n" + 
					"                                    <a class=\"page-link\">XL</a>\r\n" + 
					"                                </div>\r\n" + 
					"                            </div>\r\n" + 
					"\r\n" + 
					"\r\n" + 
					"                        </div>\r\n" + 
					"                    </div>");
			break;

		case "m":
			out.println("            <div class=\"container\">\r\n" + 
					"                        <div class=\"row mt-4 text-center justify-content-center\">\r\n" + 
					"                            <div class=\"col no-padding\">\r\n" + 
					"                                <div class=\"page-item no-border-radius\">\r\n" + 
					"                                    <a class=\"page-link\">XS</a>\r\n" + 
					"                                </div>\r\n" + 
					"                            </div>\r\n" + 
					"                            <div class=\"col no-padding\">\r\n" + 
					"                                <div class=\"page-item no-border-radius\">\r\n" + 
					"                                    <a class=\"page-link\">S</a>\r\n" + 
					"                                </div>\r\n" + 
					"                            </div>\r\n" + 
					"                            <div class=\"col no-padding\">\r\n" + 
					"                                <div class=\"page-item active no-border-radius\">\r\n" + 
					"                                    <a class=\"page-link\">M</a>\r\n" + 
					"                                </div>\r\n" + 
					"                            </div>\r\n" + 
					"                            <div class=\"col no-padding \">\r\n" + 
					"                                <div class=\"page-item no-border-radius\">\r\n" + 
					"                                    <a class=\"page-link\">L</a>\r\n" + 
					"                                </div>\r\n" + 
					"                            </div>\r\n" + 
					"                            <div class=\"col no-padding\">\r\n" + 
					"                                <div class=\"page-item no-border-radius\">\r\n" + 
					"                                    <a class=\"page-link\">XL</a>\r\n" + 
					"                                </div>\r\n" + 
					"                            </div>\r\n" + 
					"\r\n" + 
					"\r\n" + 
					"                        </div>\r\n" + 
					"                    </div>");
			break;

		case "l":
			
			out.print("                  <div class=\"container\">\r\n" + 
					"                        <div class=\"row mt-4 text-center justify-content-center\">\r\n" + 
					"                            <div class=\"col no-padding\">\r\n" + 
					"                                <div class=\"page-item no-border-radius\">\r\n" + 
					"                                    <a class=\"page-link\">XS</a>\r\n" + 
					"                                </div>\r\n" + 
					"                            </div>\r\n" + 
					"                            <div class=\"col no-padding\">\r\n" + 
					"                                <div class=\"page-item no-border-radius\">\r\n" + 
					"                                    <a class=\"page-link\">S</a>\r\n" + 
					"                                </div>\r\n" + 
					"                            </div>\r\n" + 
					"                            <div class=\"col no-padding\">\r\n" + 
					"                                <div class=\"page-item no-border-radius\">\r\n" + 
					"                                    <a class=\"page-link\">M</a>\r\n" + 
					"                                </div>\r\n" + 
					"                            </div>\r\n" + 
					"                            <div class=\"col no-padding \">\r\n" + 
					"                                <div class=\"page-item active no-border-radius\">\r\n" + 
					"                                    <a class=\"page-link\">L</a>\r\n" + 
					"                                </div>\r\n" + 
					"                            </div>\r\n" + 
					"                            <div class=\"col no-padding\">\r\n" + 
					"                                <div class=\"page-item no-border-radius\">\r\n" + 
					"                                    <a class=\"page-link\">XL</a>\r\n" + 
					"                                </div>\r\n" + 
					"                            </div>\r\n" + 
					"\r\n" + 
					"\r\n" + 
					"                        </div>\r\n" + 
					"                    </div>");
			break;

		case "xl":
			out.println("\r\n" + 
					"                    <div class=\"container\">\r\n" + 
					"                        <div class=\"row mt-4 text-center justify-content-center\">\r\n" + 
					"                            <div class=\"col no-padding\">\r\n" + 
					"                                <div class=\"page-item no-border-radius\">\r\n" + 
					"                                    <a class=\"page-link\">XS</a>\r\n" + 
					"                                </div>\r\n" + 
					"                            </div>\r\n" + 
					"                            <div class=\"col no-padding\">\r\n" + 
					"                                <div class=\"page-item no-border-radius\">\r\n" + 
					"                                    <a class=\"page-link\">S</a>\r\n" + 
					"                                </div>\r\n" + 
					"                            </div>\r\n" + 
					"                            <div class=\"col no-padding\">\r\n" + 
					"                                <div class=\"page-item no-border-radius\">\r\n" + 
					"                                    <a class=\"page-link\">M</a>\r\n" + 
					"                                </div>\r\n" + 
					"                            </div>\r\n" + 
					"                            <div class=\"col no-padding \">\r\n" + 
					"                                <div class=\"page-item no-border-radius\">\r\n" + 
					"                                    <a class=\"page-link\">L</a>\r\n" + 
					"                                </div>\r\n" + 
					"                            </div>\r\n" + 
					"                            <div class=\"col no-padding\">\r\n" + 
					"                                <div class=\"page-item active no-border-radius\">\r\n" + 
					"                                    <a class=\"page-link\">XL</a>\r\n" + 
					"                                </div>\r\n" + 
					"                            </div>\r\n" + 
					"\r\n" + 
					"\r\n" + 
					"                        </div>\r\n" + 
					"                    </div>");
			break;

		default:
			out.println("                  <div class=\"container\">\r\n" + 
					"                        <div class=\"row mt-4 text-center justify-content-center\">\r\n" + 
					"                            <div class=\"col no-padding\">\r\n" + 
					"                                <div class=\"page-item no-border-radius\">\r\n" + 
					"                                    <a class=\"page-link\">XS</a>\r\n" + 
					"                                </div>\r\n" + 
					"                            </div>\r\n" + 
					"                            <div class=\"col no-padding\">\r\n" + 
					"                                <div class=\"page-item no-border-radius\">\r\n" + 
					"                                    <a class=\"page-link\">S</a>\r\n" + 
					"                                </div>\r\n" + 
					"                            </div>\r\n" + 
					"                            <div class=\"col no-padding\">\r\n" + 
					"                                <div class=\"page-item no-border-radius\">\r\n" + 
					"                                    <a class=\"page-link\">M</a>\r\n" + 
					"                                </div>\r\n" + 
					"                            </div>\r\n" + 
					"                            <div class=\"col no-padding \">\r\n" + 
					"                                <div class=\"page-item no-border-radius\">\r\n" + 
					"                                    <a class=\"page-link\">L</a>\r\n" + 
					"                                </div>\r\n" + 
					"                            </div>\r\n" + 
					"                            <div class=\"col no-padding\">\r\n" + 
					"                                <div class=\"page-item no-border-radius\">\r\n" + 
					"                                    <a class=\"page-link\">XL</a>\r\n" + 
					"                                </div>\r\n" + 
					"                            </div>\r\n" + 
					"\r\n" + 
					"\r\n" + 
					"                        </div>\r\n" + 
					"                    </div>");
			break;
		}

	}
}