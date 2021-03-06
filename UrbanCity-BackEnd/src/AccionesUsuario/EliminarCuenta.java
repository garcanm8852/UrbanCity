package AccionesUsuario;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Modelos.MCarrito;
import Modelos.MCliente;
import Modelos.MPedPro;
import Modelos.MPedido;
import Utilidades.EnvioCorreo;

/**
 * Servlet implementation class EliminarCuenta
 */
@WebServlet("/EliminarCuenta")
public class EliminarCuenta extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HttpSession sesion;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		EnvioCorreo OutMail = new EnvioCorreo();
		/*
		 * Utilizaci?n de la codificaci?n UTF-8
		 */
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		sesion = request.getSession();

		/*
		 * Control de errores en caso de que el usuario no est? iniciado.
		 */
		if (sesion.getAttribute("Iniciado") == null || (boolean) sesion.getAttribute("Iniciado") == false) {
			sesion.setAttribute("Iniciado", false);
			response.sendRedirect("IniciarSesion");

		} else {
			/*
			 * Env?o del mensaje por correo al usuario.
			 * */
			sesion.setAttribute("Validacion", (int) (Math.random() * 999999 + 1));

			MCliente mCliente = new MCliente();

			try {
				mCliente.cargarCliente((int) sesion.getAttribute("idcliente"));

				OutMail.enviar("urbancitynoreply@gmail.com", "6T482g8#W$7@9H@kt$#S", mCliente.getEmail(),
						mCliente.getContrasena() + " C�digo de validaci�n Urban City",
						"Su código de eliminación de registro de Urban City es: "
								+ (int) sesion.getAttribute("Validacion"));

			} catch (Exception e) {
				e.printStackTrace();
			}
			
			/*
			 * Reenvio al JSP.
			 * */
			request.getRequestDispatcher("WEB-INF/eliminarCuenta.jsp").forward(request, response);

		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		if (request.getParameter("fValidacion").equals(sesion.getAttribute("Validacion").toString())) {
			/*
			 * Inicializaci?n de variables.
			 */
			MCliente mCliente = new MCliente();
			MPedido mPedido = new MPedido();
			MPedPro mPedPro = new MPedPro();
			MCarrito mCarrito = new MCarrito();
			/*
			 * Eliminaci?n de datos y relaciones en base al usuario.
			 */
			mPedido.pedidosClientes((int) sesion.getAttribute("idcliente"));
			mCarrito.vaciarCarrito((int) sesion.getAttribute("idcliente"));
			while (mPedido.consultarSiguiente()) {
				mPedPro.eliminarRelacion(mPedido.getIdpedido());
				mPedido.eliminarPedido(mPedido.getIdpedido());
			}
			/*
			 * Eliminaci?n del usuario en la base de datos.
			 */
			mCliente.EliminarCuenta((int) sesion.getAttribute("idcliente"));
			/*
			 * Control de Sesi?n para finalizar la cuenta.
			 */
			sesion.setAttribute("Iniciado", false);
			request.setAttribute("idcliente", null);
		} else {
			/*
			 * En caso de que el c?digo no sea el mismo se volver? a pedir la petici?n con
			 * otro c?digo nuevo.
			 */
			doGet(request, response);
		}

	}
}