package AccionesUsuario;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	EnvioCorreo OutMail = new EnvioCorreo();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		sesion = request.getSession();
		sesion.setAttribute("Validacion", (int) (Math.random() * 999999 + 1));

		try {
			OutMail.enviar("luftgunmail@gmail.com", "Luftgun20$", (String) sesion.getAttribute("vEmail"),
					(String) sesion.getAttribute("vNombre") + " C�digo de validaci�n LuftGun",
					"Su código de eliminación de registro de LuftGun es: " + (int) sesion.getAttribute("Validacion"));

		} catch (Exception e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher("WEB-INF/eliminarCuenta.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		if (request.getParameter("fValidacion").equals(sesion.getAttribute("Validacion").toString())) {
			MCliente mCliente = new MCliente();
			MPedido mPedido = new MPedido();
			MPedPro mPedPro = new MPedPro();
			mPedido.pedidosClientes((int)sesion.getAttribute("idcliente"));
			while (mPedido.consultarSiguiente()) {
				mPedPro.eliminarRelacion(mPedido.getIdpedido());
				mPedido.eliminarPedido(mPedido.getIdpedido());
			}
			
			mCliente.EliminarCuenta((int)sesion.getAttribute("idcliente"));
			sesion.setAttribute("Iniciado", false);
		} else {
			doGet(request, response);
		}

	}
}