package Catalogo;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Modelos.MCategoria;
import Modelos.MProducto;

/**
 * Servlet implementation class Catalogo
 */
@WebServlet("/Catalogo")
public class Catalogo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HttpSession sesion;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

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

		/* Obetenci�n del n�mero de categorias y Categor�as */
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
		 * Control de estado de sesi�n.
		 */
		if (sesion.getAttribute("Iniciado") == null) {
			sesion.setAttribute("Iniciado", false);
		}

		/*
		 * Carga de cat�logo por categar�a
		 */
		if (request.getParameter("idcategoria") != null) {
			/**
			 * Conteo y creaci�n del n�mero de p�ginas
			 */
			try {
				if (mProducto.numeroRegistrosPorCategoria(
						Integer.parseInt(request.getParameter("idcategoria"))) % 12 == 0) {

					if (mProducto.numeroRegistrosPorCategoria(
							Integer.parseInt(request.getParameter("idcategoria"))) < 12) {
						numeroPaginas = 1;

					} else {
						numeroPaginas = mProducto.numeroRegistrosPorCategoria(
								Integer.parseInt(request.getParameter("idcategoria"))) / 12;
					}

				} else {
					numeroPaginas = (mProducto.numeroRegistrosPorCategoria(
							Integer.parseInt(request.getParameter("idcategoria"))) / 12) + 1;

				}
				sesion.setAttribute("NumeroPaginas", numeroPaginas);

			} catch (Exception e) {

				e.printStackTrace();
			}

			/**
			 * Carga de cat�logo con b�squeda por categorias
			 */
			listaProductos = new Cproducto[8];
			mProducto.cargarProductosPorCategorias(Integer.parseInt(request.getParameter("idcategoria")));

			contadorProductos = 0;
			try {
				do {
					listaProductos[contadorProductos] = new Cproducto(mProducto.getIdreferencia(),
							mProducto.getNombre(), mProducto.getMarca(), mProducto.getDescripcion(),
							mProducto.getPrecio(), mProducto.getStock(), mProducto.getCategoria(),
							mProducto.getSubcategoria(), mProducto.getNombreCategoria(),
							mProducto.getNombreSubcategoria());
					;
					contadorProductos++;
				} while (mProducto.consultarSiguiente());
				sesion.setAttribute("Productos", listaProductos);

			} catch (Exception e) {
				// TODO: handle exception
			}

		} else {
			/**
			 * Carga de cat�logo con b�squeda por subcategorias
			 */
			if (request.getParameter("idsubcategoria") != null) {
				/**
				 * Conteo y creaci�n del n�mero de p�ginas
				 */
				try {
					if (mProducto.numeroRegistrosPorSubcategoria(
							Integer.parseInt(request.getParameter("idsubcategoria"))) % 12 == 0) {

						if (mProducto.numeroRegistrosPorSubcategoria(
								Integer.parseInt(request.getParameter("idsubcategoria"))) < 12) {
							numeroPaginas = 1;

						} else {
							numeroPaginas = mProducto.numeroRegistrosPorSubcategoria(
									Integer.parseInt(request.getParameter("idsubcategoria"))) / 12;
						}

					} else {
						numeroPaginas = (mProducto.numeroRegistrosPorSubcategoria(
								Integer.parseInt(request.getParameter("idsubcategoria"))) / 12) + 1;

					}
					sesion.setAttribute("NumeroPaginas", numeroPaginas);

				} catch (Exception e) {

					e.printStackTrace();
				}

				listaProductos = new Cproducto[12];
				mProducto.cargarProductosPorSubcategorias(Integer.parseInt(request.getParameter("idsubcategoria")));

				contadorProductos = 0;
				try {
					do {
						listaProductos[contadorProductos] = new Cproducto(mProducto.getIdreferencia(),
								mProducto.getNombre(), mProducto.getMarca(), mProducto.getDescripcion(),
								mProducto.getPrecio(), mProducto.getStock(), mProducto.getCategoria(),
								mProducto.getSubcategoria(), mProducto.getNombreCategoria(),
								mProducto.getNombreSubcategoria());
						;
						contadorProductos++;
					} while (mProducto.consultarSiguiente());

				} catch (Exception e) {
					// TODO: handle exception
				}
				sesion.setAttribute("Productos", listaProductos);

			} else {
				/**
				 * Conteo y creaci�n del n�mero de p�ginas
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
				 * Carga de cat�logo paginada - P�gina 0.
				 */
				sesion.setAttribute("NumeroPaginas", numeroPaginas);

				if (request.getParameter("Pagina") == null) {

					listaProductos = new Cproducto[12];
					mProducto.cargarProductosPaginadosModular(0, 12);
					contadorProductos = 0;
					try {
						do {
							listaProductos[contadorProductos] = new Cproducto(mProducto.getIdreferencia(),
									mProducto.getNombre(), mProducto.getMarca(), mProducto.getDescripcion(),
									mProducto.getPrecio(), mProducto.getStock(), mProducto.getSubcategoria());
							contadorProductos++;
						} while (mProducto.consultarSiguiente());
					} catch (Exception e) {

						e.printStackTrace();
					}

					sesion.setAttribute("Productos", listaProductos);

				} else {
					/**
					 * Conteo y creaci�n del n�mero de p�ginas
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
					 * Carga de cat�logo paginada - P�gina por par�metros.
					 */
					listaProductos = new Cproducto[12];
					mProducto.cargarProductosPaginadosModular(Integer.parseInt(request.getParameter("Pagina")), 12);
					contadorProductos = 0;
					try {
						do {
							listaProductos[contadorProductos] = new Cproducto(mProducto.getIdreferencia(),
									mProducto.getNombre(), mProducto.getMarca(), mProducto.getDescripcion(),
									mProducto.getPrecio(), mProducto.getStock(), mProducto.getSubcategoria());
							contadorProductos++;
						} while (mProducto.consultarSiguiente());
					} catch (Exception e) {

						e.printStackTrace();
					}

					sesion.setAttribute("Productos", listaProductos);
				}
			}
		}

		request.getRequestDispatcher("WEB-INF/catalogo.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
