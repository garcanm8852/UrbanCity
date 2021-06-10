package Catalogo;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Modelos.MCategoria;
import Modelos.MProducto;

/**
 * Servlet implementation class Producto
 */
@WebServlet("/Producto")
public class Producto extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HttpSession sesion;


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MProducto mProducto = new MProducto();
		String idreferencia;
		Cproducto productoSolicitado, productosSimilares[];
		int ContadorCategorias;
		CCategoria[] categorias;
		int numeroCategorias=1;
		int contadorProductos = 0;
		MCategoria mCategoria = new MCategoria();

		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		sesion = request.getSession(true);

		if (sesion.getAttribute("Iniciado") == null) {
			sesion.setAttribute("Iniciado", false);
		}

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

		try {
			mProducto.consultarProducto(request.getParameter("idreferencia"));
			productoSolicitado = new Cproducto(mProducto.getIdreferencia(), mProducto.getNombre(), mProducto.getTalla(),
					mProducto.getDescripcion(), mProducto.getPrecio(), mProducto.getStock(), mProducto.getCategoria(),
					mProducto.getSubcategoria(), mProducto.getNombreCategoria(), mProducto.getNombreSubcategoria());
			sesion.setAttribute("Producto", productoSolicitado);
			
			mProducto.cargarProductosPorSimilares(mProducto.getSubcategoria());
			productosSimilares  = new Cproducto[4];
			do {
				productosSimilares[contadorProductos] = new Cproducto(mProducto.getIdreferencia(),
						mProducto.getNombre(), mProducto.getTalla(), mProducto.getDescripcion(),
						mProducto.getPrecio(), mProducto.getStock(), mProducto.getCategoria(),
						mProducto.getSubcategoria(), mProducto.getNombreCategoria(),
						mProducto.getNombreSubcategoria());
				;
				contadorProductos++;
			} while (mProducto.consultarSiguiente());			
			sesion.setAttribute("ProductosSimilares", productosSimilares);

			
		} catch (Exception e) {
			// TODO: handle exception
		}

		request.getRequestDispatcher("WEB-INF/producto.jsp").forward(request, response);
	}

}
