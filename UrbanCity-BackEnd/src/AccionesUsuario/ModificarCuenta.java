package AccionesUsuario;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Modelos.MCliente;
import beans.cliente;

/**
 * Servlet implementation class ModificarCuenta
 */
@WebServlet("/ModificarCuenta")
public class ModificarCuenta extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HttpSession sesion;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		sesion = request.getSession();
		if (sesion.getAttribute("Iniciado") == null || (boolean) sesion.getAttribute("Iniciado") == false) {
			sesion.setAttribute("Iniciado", false);
			response.sendRedirect("IniciarSesion");

		} else {

			MCliente mCliente = new MCliente();
			try {
				mCliente.cargarCliente((int) sesion.getAttribute("idcliente"));
				cliente clienteModificar = new cliente(mCliente.getIdcliente(), mCliente.getNombre(),
						mCliente.getApellido(), mCliente.getEmail(), mCliente.getContrasena());
				sesion.setAttribute("DatosCliente", clienteModificar);
				request.getRequestDispatcher("WEB-INF/modificarPerfil.jsp").forward(request, response);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		sesion = request.getSession();
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		try {
			MCliente mCliente = new MCliente();
			mCliente.actualizarDatos(request.getParameter("fNombre"), request.getParameter("fApellido"),
					request.getParameter("fEmail"), request.getParameter("fContrasena"),
					(int) sesion.getAttribute("idcliente"));
			sesion.setAttribute("NombreUsuario", request.getParameter("fNombre"));

		} catch (Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect("ModificarCuenta");

	}

}
