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
	HttpSession sesion;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		EnvioCorreo OutMail = new EnvioCorreo();
		/*
		 * Codificación UTF-8.
		 */
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		sesion = request.getSession();
		try {
			/*
			 * Envío de código de verificación.
			 */
			OutMail.enviar("urbancitynoreply@gmail.com", "6T482g8#W$7@9H@kt$#S", (String) sesion.getAttribute("vEmail"),
					(String) sesion.getAttribute("vNombre") + " Cï¿½digo de validaciï¿½n Urban City",
					"Su cï¿½digo de validaciï¿½n de registro de UrbanCity es: "
							+ (int) sesion.getAttribute("Validacion"));

		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("" + (int) sesion.getAttribute("Validacion"));
		request.getRequestDispatcher("WEB-INF/VerificarCuenta.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		sesion = request.getSession();
		/*
		 * Codificación UTF-8.
		 */
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		/*
		 * 
		 * */
		MCliente mCliente = new MCliente();
		/*
		 * Comprobación y añadido del usuario a la BD.
		 */
		if (request.getParameter("fValidacion").equals(sesion.getAttribute("Validacion").toString())) {
			mCliente.insertarCliente((mCliente.nextID() + 1), request.getParameter("fNombre"),
					request.getParameter("fApellido"), request.getParameter("fEmail"),
					request.getParameter("fContrasena"));
			response.sendRedirect("Index");

		} else {
			doGet(request, response);
		}

	}

}
