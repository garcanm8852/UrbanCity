package AccionesUsuario;

import java.io.IOException;

import javax.mail.SendFailedException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Modelos.MCategoria;
import Modelos.MCliente;

/**
 * Servlet implementation class IniciarSesion
 */
@WebServlet("/IniciarSesion")
public class IniciarSesion extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HttpSession sesion;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * Codificación en UTF-8
		 * */
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		/*
		 * Control de usuario.
		 * */
		sesion = request.getSession(true);
		sesion.setAttribute("Error", false);
		if (sesion.getAttribute("Iniciado") == null) {
			sesion.setAttribute("Iniciado", false);
		}
		/*
		 * Reenvio al JSP
		 * */
		request.getRequestDispatcher("WEB-INF/iniciarsesion.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * Inicialización de variables.
		 * */
		boolean estadoSesion;
		estadoSesion = false;
		MCategoria mCategoria = new MCategoria();
		MCliente mCliente = new MCliente();
		/*
		 * Codificación UTF-8.
		 * */
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		sesion = request.getSession(true);
		
		/*
		 * Código de Primer Inicio en caso de que sea el primer inicio.
		 * */
		sesion.setAttribute("PrimerInicio", (int) ((Math.random()*999999)+1));
		mCliente.DatosInicioSesion(request.getParameter("fEmail"), request.getParameter("fContrasena"));
		
		try {
			/*
			 * Comprobación usuario y contraseña
			 * */
			if (mCliente.getEmail().equals(request.getParameter("fEmail"))
					&& mCliente.getContrasena().equals(request.getParameter("fContrasena"))) {
				estadoSesion = true;
			}
			
			if (estadoSesion) {
				/*
				 * Reenvio a primer Inicio Sesión
				 * */
				if (!mCliente.getEstadoCliente().equals("Operativo") && !mCliente.getEstadoCliente().equals("Administrador")) {
					sesion.setAttribute("idcliente", mCliente.getIdcliente());
					sesion.setAttribute("email", mCliente.getEmail());
					sesion.setAttribute("NombreUsuario", mCliente.getNombre());
					sesion.setAttribute("contTemp", mCliente.getContrasena());
					response.sendRedirect("PrimerInicioSesion");
				} else {
					/*
					 * Inicio de sesión Correcto
					 * */
					sesion.setAttribute("Iniciado", true);
					sesion.setAttribute("NombreUsuario", mCliente.getNombre());
					sesion.setAttribute("idcliente", mCliente.getIdcliente());
					response.sendRedirect("Index");
				}

			} else {
				/*
				 * Inicio de sesión Fallido.
				 * */
				sesion.setAttribute("Iniciado", false);
				sesion.setAttribute("Error", true);
				request.getRequestDispatcher("WEB-INF/iniciarsesion.jsp").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
