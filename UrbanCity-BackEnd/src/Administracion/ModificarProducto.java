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
 * Servlet implementation class ModificarProducto
 */
@WebServlet("/ModificarProducto")
public class ModificarProducto extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HttpSession sesion;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MCliente mCliente = new MCliente();
		MProducto mProducto = new MProducto();
		String idreferencia;
		Cproducto productoSolicitado;
		int ContadorCategorias;
		CCategoria[] categorias;
		int numeroCategorias = 1;
		int contadorProductos = 0;
		int numeroSubategorias = 1;
		int ContadorSubategorias;
		CCategoria[] subcategorias = null;
		MCategoria mCategoria = new MCategoria();
		MSubcategoria mSubcategoria = new MSubcategoria();
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		sesion = request.getSession(true);

		if (sesion.getAttribute("Iniciado") == null) {
			sesion.setAttribute("Iniciado", false);
			response.sendRedirect("IniciarSesion");
		} else {
			if (sesion.getAttribute("idcliente") != null) {
				mCliente.cargarCliente((int) sesion.getAttribute("idcliente"));
				if (!mCliente.getEstadoCliente().equals("Administrador")) {
					response.sendRedirect("Index");
				} else {

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
							categorias[ContadorCategorias] = new CCategoria(mCategoria.getId(),
									mCategoria.getnombreCategoria());
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
							subcategorias[ContadorSubategorias] = new CCategoria(mSubcategoria.getId(),
									mSubcategoria.getnombreSubcategoria());
							ContadorSubategorias++;
						} while (mSubcategoria.consultarSiguiente());
						sesion.setAttribute("Subcategorias", subcategorias);

					} catch (Exception e) {
						e.printStackTrace();
					}

					try {
						mProducto.consultarProducto(request.getParameter("idreferencia"));
						productoSolicitado = new Cproducto(mProducto.getIdreferencia(), mProducto.getNombre(),
								mProducto.getTalla(), mProducto.getDescripcion(), mProducto.getPrecio(),
								mProducto.getStock(), mProducto.getCategoria(), mProducto.getSubcategoria(),
								mProducto.getNombreCategoria(), mProducto.getNombreSubcategoria());
						sesion.setAttribute("ProductoImagen", mProducto.getIdreferencia());
						sesion.setAttribute("Producto", productoSolicitado);

					} catch (Exception e) {
						// TODO: handle exception
					}

					request.getRequestDispatcher("WEB-INF/modificarProducto.jsp").forward(request, response);

				}
			}
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			MProducto mProducto = new MProducto();
			mProducto.modificarProducto(request.getParameter("fidreferencia"), 
					request.getParameter("fnombre"), 
					request.getParameter("fdescripcion"), 
					Double.parseDouble(request.getParameter("fprecio")),
					Integer.parseInt(request.getParameter("fsubcategoria")),
					request.getParameter("ftalla")
					);

		} catch (Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect("AdministrarProductos");
	}

}
