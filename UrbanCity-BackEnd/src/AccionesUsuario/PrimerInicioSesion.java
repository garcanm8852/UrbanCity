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
 * Servlet implementation class PrimerInicioSesion
 */
@WebServlet("/PrimerInicioSesion")
public class PrimerInicioSesion extends HttpServlet {
	private static final long serialVersionUID = 1L;
	EnvioCorreo OutMail = new EnvioCorreo();
	HttpSession sesion;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		sesion = request.getSession();
		sesion.setAttribute("CodigoInvalido", false);
		try {
			OutMail.enviar("urbancitynoreply@gmail.com", "6T482g8#W$7@9H@kt$#S", (String) sesion.getAttribute("email"),
					(String) sesion.getAttribute("NombreUsuario ") + " C�digo de validaci�n LuftGun",
					"Su c�digo de validaci�n de registro de Urban City es: " + (int) sesion.getAttribute("PrimerInicio"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher("WEB-INF/primerinicio.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		sesion = request.getSession();
		MCliente mCliente = new MCliente();

		if (Integer.parseInt(request.getParameter("fValidacion")) == (int) sesion.getAttribute("PrimerInicio")) {
			mCliente.CambiarEstado((int) sesion.getAttribute("idcliente"), "Operativo");
			sesion.setAttribute("email", null);
			sesion.setAttribute("contTemp", null);
			sesion.setAttribute("Iniciado", true);
			response.sendRedirect("Index");
		} else {
			sesion.setAttribute("CodigoInvalido", true);

		}
	}

}
