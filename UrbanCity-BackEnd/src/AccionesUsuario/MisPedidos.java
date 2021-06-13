package AccionesUsuario;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Catalogo.CCategoria;
import Catalogo.Cproducto;
import Compra.CPedido;
import Modelos.MCategoria;
import Modelos.MPedPro;
import Modelos.MPedido;
import Modelos.MProducto;
import etiqueta.producto;

/**
 * Servlet implementation class MisPedidos
 */
@WebServlet("/MisPedidos")
public class MisPedidos extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HttpSession sesion;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MisPedidos() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * Inicialización de variables.
		 */
		CCategoria[] categorias = null;
		Cproducto[] listaProductos;
		CPedido[] listaPedidos;

		int ContadorCategorias;
		int contadorProductos;
		int numeroPaginas = 0;
		MCategoria mCategoria = new MCategoria();
		MProducto mProducto = new MProducto();
		MPedido mPedido = new MPedido();
		MPedPro mPedpro = new MPedPro();
		int numeroCategorias = 1;
		/*
		 * Codificación UTF-8.
		 */
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
		if (sesion.getAttribute("Iniciado") == null || (boolean) sesion.getAttribute("Iniciado") == false) {
			sesion.setAttribute("Iniciado", false);
			response.sendRedirect("IniciarSesion");
		} else {
			try {
				mPedido.pedidosClientes((int) sesion.getAttribute("idcliente"));
				if (mPedido.consultarSiguiente()) {
					// Caso: Existen Pedidos
					int contadorPedidos = 0;
					mPedido.consultarCantidadPedidosPorCliente((int) sesion.getAttribute("idcliente"));
					listaPedidos = new CPedido[mPedido.getCantidad()];
					do {
						mPedpro.consultarCantidadProductosPorPedido(mPedido.getIdpedido());
						mPedpro.consultarProductosPorPedido(mPedido.getIdpedido());
						// TODO PASAR A DECLARACIONES
						contadorProductos = 0;

						listaProductos = new Cproducto[mPedpro.CantidadProductos()];

						while (mPedpro.consultarSiguiente()) {
							mProducto.consultarProducto(mPedpro.getIDreferencia());
							// TODO QUITAR STOCK, MARCA
							listaProductos[contadorProductos] = new Cproducto(mProducto.getIdreferencia(),
									mProducto.getNombre(), mProducto.getDescripcion(), mProducto.getPrecio());

							contadorProductos++;
						}

						listaPedidos[contadorPedidos] = new CPedido(mPedido.getIdpedido(), listaProductos,
								mPedido.getFecha(), mPedido.getNombre(), mPedido.getCalle(), mPedido.getProvincia(),
								mPedido.getLocalidad(), mPedido.getCP(), mPedido.getPais(), mPedido.getTel() // TODO
																												// CAMBIAR
																												// POR
																												// TEL
																												// QUE
																												// SINO
																												// PETA
																												// CAMBIAR
																												// SINO
																												// PETA
						);
						contadorPedidos++;

					} while (mPedido.consultarSiguiente());

					request.setAttribute("listaPedidos", listaPedidos);

					request.getRequestDispatcher("WEB-INF/misPedidos.jsp").forward(request, response);

				} else {

					// Caso: No Existen Pedidos
					listaPedidos = null;
					request.getRequestDispatcher("WEB-INF/misPedidos.jsp").forward(request, response);

				}

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
		doGet(request, response);
	}

}
