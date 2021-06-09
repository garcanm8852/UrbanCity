package Catalogo;
import Modelos.MCategoria;
import Modelos.MProducto;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Index
 */
@WebServlet("/Index")
public class Index extends HttpServlet {
	private static final long serialVersionUID = 1L;
     HttpSession sesion;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		CCategoria[] categorias = null;
		Cproducto[] listaProductos;
		int contadorProductos;
		MCategoria mCategoria = new MCategoria();
		MProducto mProducto = new MProducto();
		int numeroCategorias = 1;
		int ContadorCategorias;

		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		sesion = request.getSession(true);

		
		try {
			mCategoria.cargarCategorias();
			while (mCategoria.consultarSiguiente()) {
				numeroCategorias++;
			}

			categorias = new CCategoria[numeroCategorias];
			mCategoria.cargarCategorias();
			ContadorCategorias = 0;
			do {
				categorias[ContadorCategorias] = new CCategoria(mCategoria.getId(),mCategoria.getnombreCategoria());
				ContadorCategorias++;
			} while (mCategoria.consultarSiguiente());
			sesion.setAttribute("Categorias", categorias);

		} catch (Exception e) {
			e.printStackTrace();
		}

		/**
		 * Control de estado de sesión.
		 * */
		if (sesion.getAttribute("Iniciado") == null) {
			sesion.setAttribute("Iniciado", false);
		}
		
		try {
			
			listaProductos = new Cproducto[8];
			mProducto.cargarProductosPaginados(0);
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
		} catch (Exception e) {
			// TODO: handle exception
		}
		

		
		request.getRequestDispatcher("WEB-INF/index.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
