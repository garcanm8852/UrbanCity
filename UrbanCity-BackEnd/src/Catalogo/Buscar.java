package Catalogo;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Modelos.MCategoria;
import Modelos.MCliente;
import Modelos.MProducto;

/**
 * Servlet implementation class Buscar
 */
@WebServlet("/Buscar")
public class Buscar extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HttpSession sesion;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Buscar() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MCliente mCliente = new MCliente();
		CCategoria[] categorias = null;
		Cproducto[] listaProductos;
		int ContadorCategorias;
		int contadorProductos;
		int numeroPaginas = 0;
		MCategoria mCategoria = new MCategoria();
		MProducto mProducto = new MProducto();
		int numeroCategorias = 1;

		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		sesion = request.getSession(true);

		if (request.getAttribute("busqueda") != null) {
			request.setAttribute("termino", request.getAttribute("busqueda") + "");
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

			/**
			 * Control de estado de sesión.
			 */
			if (sesion.getAttribute("Iniciado") == null) {
				sesion.setAttribute("Iniciado", false);
			}

			try {
				/**
				 * Conteo y creación del número de páginas
				 */
				/*
				 * try { if (mProducto.numeroRegistros() % 12 == 0) { numeroPaginas =
				 * mProducto.numeroRegistros() / 12; } else { numeroPaginas =
				 * (mProducto.numeroRegistros() / 12) + 1; }
				 * 
				 * } catch (Exception e) {
				 * 
				 * e.printStackTrace(); }
				 */

				/**
				 * Carga de catálogo paginada - Página 0.
				 */
				sesion.setAttribute("NumeroPaginas", numeroPaginas);

				if (request.getParameter("Pagina") == null) {

					listaProductos = new Cproducto[12];
					mProducto.buscarProductosPaginadosModular(request.getAttribute("busqueda").toString(), 0, 12);
					contadorProductos = 0;
					try {
						if (mProducto.consultarSiguiente()) {
							do {
								listaProductos[contadorProductos] = new Cproducto(mProducto.getIdreferencia(),
										mProducto.getNombre(), mProducto.getTalla(), mProducto.getDescripcion(),
										mProducto.getPrecio(), mProducto.getStock(), mProducto.getSubcategoria());
								contadorProductos++;
							} while (mProducto.consultarSiguiente());
						} else {
							listaProductos = null;
						}

						if (contadorProductos % 12 == 0) {
							numeroPaginas = contadorProductos / 12;
						} else {
							if (contadorProductos < 12) {
								numeroPaginas = 1;
							} else {
								numeroPaginas = (contadorProductos / 12) + 1;
							}
						}

					} catch (Exception e) {

						e.printStackTrace();
					}

					sesion.setAttribute("Productos", listaProductos);

				} else {

					/**
					 * Carga de catálogo paginada - Página por parámetros.
					 */
					listaProductos = new Cproducto[12];
					mProducto.cargarProductosPaginadosModular(Integer.parseInt(request.getParameter("Pagina")), 12);
					contadorProductos = 0;
					try {
						if (mProducto.consultarSiguiente()) {

							do {
								listaProductos[contadorProductos] = new Cproducto(mProducto.getIdreferencia(),
										mProducto.getNombre(), mProducto.getTalla(), mProducto.getDescripcion(),
										mProducto.getPrecio(), mProducto.getStock(), mProducto.getSubcategoria());
								contadorProductos++;
							} while (mProducto.consultarSiguiente());
						}

						else {
							listaProductos = null;

						}
						if (contadorProductos % 12 == 0) {
							numeroPaginas = contadorProductos / 12;
						} else {
							if (contadorProductos < 12) {
								numeroPaginas = 1;
							} else {
								numeroPaginas = (contadorProductos / 12) + 1;
							}
						}

					} catch (Exception e) {

						e.printStackTrace();
					}

					sesion.setAttribute("Productos", listaProductos);
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
			request.getRequestDispatcher("WEB-INF/buscar.jsp").forward(request, response);

		} else {
			response.sendRedirect("Index");

		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (request.getParameter("termino") == null) {
			response.sendRedirect("Index");
		} else {
			request.setAttribute("busqueda", request.getParameter("termino") + "");
			doGet(request, response);

		}
	}

}
