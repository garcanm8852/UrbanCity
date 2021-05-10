package AccionesUsuario;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Modelos.MCliente;
import Utilidades.EnvioCorreo;

/**
 * Servlet implementation class VerificarCuenta
 */
@WebServlet("/VerificarCuenta")
public class VerificarCuenta extends HttpServlet {
	private static final long serialVersionUID = 1L;
	EnvioCorreo OutMail = new EnvioCorreo();
	HttpSession sesion;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		sesion = request.getSession();
		  try {
			    OutMail.enviar("luftgunmail@gmail.com",
			            "Luftgun20$",
			           (String) sesion.getAttribute("vEmail") ,
			           (String) sesion.getAttribute("vNombre") + " C�digo de validaci�n LuftGun",
			          "Su c�digo de validaci�n de registro de LuftGun es: " + (int) sesion.getAttribute("Validacion"));

			} catch (Exception e) {
			    e.printStackTrace();
			}
		request.getRequestDispatcher("WEB-INF/VerificarCuenta.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		sesion = request.getSession();
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		MCliente mCliente = new MCliente();
		if (request.getParameter("fValidacion").equals( sesion.getAttribute("Validacion").toString())) {
		    mCliente.insertarCliente((mCliente.nextID() + 1),
		    	request.getParameter("fNombre"),
				request.getParameter("fApellido"),
				request.getParameter("fEmail"),
				request.getParameter("fContrasena"),
				request.getParameter("fCalle"),
				request.getParameter("fLocalidad"),
				request.getParameter("fProvincia"),
				request.getParameter("fCp"),
				request.getParameter("fPais"),
				request.getParameter("fTel"));
		    request.getRequestDispatcher("Catalogo").forward(request, response);

		}else {
			doGet(request, response);
		}

			}

}
