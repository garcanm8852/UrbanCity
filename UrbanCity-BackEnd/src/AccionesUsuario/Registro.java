package AccionesUsuario;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Modelos.MCliente;

/**
 * Servlet implementation class Registro
 */
@WebServlet("/Registro")
public class Registro extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HttpSession sesion;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * Codificaci�n UTF-8
		 */
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		sesion = request.getSession();
		/*
		 * Control de sesi�n
		 * */
		if (sesion.getAttribute("Error") == null) {
			sesion.setAttribute("Error", false);

		}
		if (sesion.getAttribute("Contrasena") == null) {
			sesion.setAttribute("Contrasena", false);
		}

		if (sesion.getAttribute("Correo") == null) {
			sesion.setAttribute("Correo", false);
		}
		/*
		 * Reenvio al JSP.
		 */
		request.getRequestDispatcher("WEB-INF/registro.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * Codificaci�n UTF-8.
		 * */
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		/*
		 * Inicializaci�n de variables.
		 * */
		boolean estadoRegistro;
		boolean existeCorreo;
		MCliente mCliente = new MCliente();

		sesion.setAttribute("Validacion", (int) (Math.random() * 999999 + 1));
		estadoRegistro = true;

		/*
		 * Comprobaci�n son la misma contrase�a.
		 * */
		if (!request.getParameter("fContrasena").equals(request.getParameter("fContasenaRep"))) {
			sesion.setAttribute("Contrasena", true);
			estadoRegistro = false;
		}
		/*
		 * Comprobaci�n el correo ya existe.
		 * */
		existeCorreo = false;
		mCliente.ExisteCliente(request.getParameter("fEmail"));
		try {
			if (request.getParameter("fEmail").equals(mCliente.getEmail())) {
				existeCorreo = true;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}

		if (existeCorreo) {
			sesion.setAttribute("Correo", true);
			estadoRegistro = false;
		}
		/*
		 * Reenvio a Verificar Cuenta.
		 * */
		if (estadoRegistro == true) {
			sesion.setAttribute("vNombre", request.getParameter("fNombre"));
			sesion.setAttribute("vApellido", request.getParameter("fApellido"));
			sesion.setAttribute("vEmail", request.getParameter("fEmail"));
			sesion.setAttribute("vContrasena", request.getParameter("fContrasena"));
			response.sendRedirect("VerificarCuenta");
		} else {
			request.getRequestDispatcher("WEB-INF/registro.jsp").forward(request, response);

		}
	}

}
