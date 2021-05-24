package Administracion;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Catalogo.CCategoria;
import Catalogo.Cproducto;
import Modelos.MCategoria;
import Modelos.MCliente;
import Modelos.MProducto;
import Modelos.MSubcategoria;

/**
 * Servlet implementation class CrearProducto
 */
@WebServlet("/CrearProducto")
public class CrearProducto extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HttpSession sesion;

	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		MCliente mCliente = new MCliente();
		CCategoria[] categorias = null;
		CCategoria[] subcategorias = null;
		int ContadorCategorias;
		int ContadorSubategorias;
		MCategoria mCategoria = new MCategoria();
		MSubcategoria mSubcategoria = new MSubcategoria();
		MProducto mProducto = new MProducto();
		int numeroCategorias = 1;
		int numeroSubategorias = 1;
		boolean seguridad = false;


		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		sesion = request.getSession(true);

		/**
		 * TODO QUITAR ACCESO OBLIGATORIO IMPORTANTE!!!!
		 * */
		sesion.setAttribute("idcliente", 1);

		/* Obetención del número de categorias y Categorías */
		try {
			mCategoria.cargarCategorias();
			while (mCategoria.consultarSiguiente()) {
				numeroCategorias++;
			}

			categorias = new CCategoria[numeroCategorias];
			mCategoria.cargarCategorias();
			ContadorCategorias = 0;
			do {
				categorias[ContadorCategorias] = new CCategoria(mCategoria.getId(), mCategoria.getnombreCategoria());
				ContadorCategorias++;
			} while (mCategoria.consultarSiguiente());
			sesion.setAttribute("Categorias", categorias);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		/* Obetención del número de Subcategorias y Subcategorías */
		try {
			mSubcategoria.cargarSubcategorias();
			while (mSubcategoria.consultarSiguiente()) {
				numeroSubategorias++;
			}

			subcategorias = new CCategoria[numeroSubategorias];
			mSubcategoria.cargarSubcategorias();
			ContadorSubategorias = 0;
			do {
				subcategorias[ContadorSubategorias] = new CCategoria(mSubcategoria.getId(), mSubcategoria.getnombreSubcategoria());
				ContadorSubategorias++;
			} while (mSubcategoria.consultarSiguiente());
			sesion.setAttribute("Subcategorias", subcategorias);

		} catch (Exception e) {
			e.printStackTrace();
		}

		/**
		 * Control de estado de sesión.
		 */
		if (sesion.getAttribute("Iniciado") == null) {
			sesion.setAttribute("Iniciado", false);
		}
		
		if (sesion.getAttribute("idcliente")!=null) {
			mCliente.cargarCliente((int) sesion.getAttribute("idcliente"));
			if (mCliente.getEstadoCliente().equals("Administrador")) {
				seguridad = true;
			}
		}
		
		if (seguridad) {
			request.getRequestDispatcher("WEB-INF/crearProductos.jsp").forward(request, response);

		}else {
			response.sendRedirect("Index");
		}
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
