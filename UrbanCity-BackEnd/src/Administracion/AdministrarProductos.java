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

/**
 * Servlet implementation class ListarProductos
 */
@WebServlet("/AdministrarProductos")
public class AdministrarProductos extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HttpSession sesion;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * Inicialización de Variables.
		 * */
		MCliente mCliente = new MCliente();
		CCategoria[] categorias = null;
		Cproducto[] listaProductos;
		int ContadorCategorias;
		int contadorProductos;
		int numeroPaginas = 0;
		MCategoria mCategoria = new MCategoria();
		MProducto mProducto = new MProducto();
		int numeroCategorias = 1;
		boolean seguridad = false;
		/*
		 * Codificación UTF-8.
		 * */
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		sesion = request.getSession(true);
		
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

		try {
			/**
			 * Conteo y creación del número de páginas
			 */
			try {
				if (mProducto.numeroRegistros() % 12 == 0) {
					numeroPaginas = mProducto.numeroRegistros() / 12;
				} else {
					numeroPaginas = (mProducto.numeroRegistros() / 12) + 1;
				}

			} catch (Exception e) {

				e.printStackTrace();
			}
			/**
			 * Carga de catálogo paginada - Página 0.
			 */
			sesion.setAttribute("NumeroPaginas", numeroPaginas);

			if (request.getParameter("Pagina") == null) {

				listaProductos = new Cproducto[12];
				mProducto.cargarProductosPaginadosModular(0, 12);
				contadorProductos = 0;
				try {
					do {
						listaProductos[contadorProductos] = new Cproducto(mProducto.getIdreferencia(),
								mProducto.getNombre(), mProducto.getTalla(), mProducto.getDescripcion(),
								mProducto.getPrecio(), mProducto.getStock(), mProducto.getSubcategoria());
						contadorProductos++;
					} while (mProducto.consultarSiguiente());
				} catch (Exception e) {

					e.printStackTrace();
				}

				sesion.setAttribute("Productos", listaProductos);

			} else {
				/**
				 * Conteo y creación del número de páginas
				 */
				try {
					if (mProducto.numeroRegistros() % 12 == 0) {
						numeroPaginas = mProducto.numeroRegistros() / 12;
					} else {
						numeroPaginas = (mProducto.numeroRegistros() / 12) + 1;
					}

				} catch (Exception e) {

					e.printStackTrace();
				}

				/**
				 * Carga de catálogo paginada - Página por parámetros.
				 */
				listaProductos = new Cproducto[12];
				mProducto.cargarProductosPaginadosModular(Integer.parseInt(request.getParameter("Pagina")), 12);
				contadorProductos = 0;
				try {
					do {
						listaProductos[contadorProductos] = new Cproducto(mProducto.getIdreferencia(),
								mProducto.getNombre(), mProducto.getTalla(), mProducto.getDescripcion(),
								mProducto.getPrecio(), mProducto.getStock(), mProducto.getSubcategoria());
						contadorProductos++;
					} while (mProducto.consultarSiguiente());
				} catch (Exception e) {

					e.printStackTrace();
				}

				sesion.setAttribute("Productos", listaProductos);}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		if (seguridad) {
			request.getRequestDispatcher("WEB-INF/administrarProductos.jsp").forward(request, response);

		}else {
			response.sendRedirect("Index");
		}
		

	}
	


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
