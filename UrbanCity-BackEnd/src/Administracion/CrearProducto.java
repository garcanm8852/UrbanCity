package Administracion;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;

import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.*;
import org.apache.commons.fileupload.servlet.*;
import org.apache.commons.io.output.*;

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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
		 */
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
				subcategorias[ContadorSubategorias] = new CCategoria(mSubcategoria.getId(),
						mSubcategoria.getnombreSubcategoria());
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

		if (sesion.getAttribute("idcliente") != null) {
			mCliente.cargarCliente((int) sesion.getAttribute("idcliente"));
			if (mCliente.getEstadoCliente().equals("Administrador")) {
				seguridad = true;
			}
		}

		if (seguridad) {
			request.getRequestDispatcher("WEB-INF/crearProductos.jsp").forward(request, response);

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
		// TODO Auto-generated method stub
		
		try {
	        MProducto mProducto = new MProducto();
	        File file = null;
	        int maxFileSize = 5000 * 1024;
	        int maxMemSize = 5000 * 1024;
	        ServletContext servletContext;
	        String filePath;
	        String contentType;
	        PrintWriter out;
	        FileItem fi;
	        List<FileItem> fileItems;
	        DiskFileItemFactory factory;
	        String fileName = null;

	        servletContext = getServletContext();
	        filePath = servletContext.getInitParameter("file-upload");
	        contentType = request.getContentType();

	        if ((contentType.indexOf("multipart/form-data") >= 0)) {
	            factory = new DiskFileItemFactory();
	            factory.setSizeThreshold(maxMemSize);
	            factory.setRepository(new File("."));
	            ServletFileUpload upload = new ServletFileUpload(factory);
	            upload.setSizeMax(maxFileSize);
	            try {
	                fileItems = upload.parseRequest(request);

	                Iterator<FileItem> i = fileItems.iterator();
	                while (i.hasNext()) {
	                    fi = (FileItem) i.next();
	                    if (!fi.isFormField()) {
	                        String fieldName = fi.getFieldName();
	                        fileName = fi.getName();
	                        boolean isInMemory = fi.isInMemory();
	                        long sizeInBytes = fi.getSize();
	                        if (fileName.lastIndexOf("/") >= 0) {
	                            file = new File(filePath + fileName.substring(fileName.lastIndexOf("/")));
	                        } else {
	                            file = new File(filePath + "/" + fileName.substring(fileName.lastIndexOf("/") + 1));
	                        }
	                        fi.write(file);
	                    }
	                }
	            } catch (Exception ex) {
	                System.out.println(ex);
	            }
	        } else {

	        }
	        
	        String rutaImagen;
	        FileInputStream fis;
	        rutaImagen = filePath + "/" + fileName;
	        
	        fis = new FileInputStream(file);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		try {

			System.out.println(request.getParameter("fidreferencia"));
			System.out.println(request.getParameter("fnombre"));
			System.out.println(request.getParameter("fdescripcion"));
			System.out.println(request.getParameter("fprecio"));
			System.out.println(request.getParameter("fsubcategoria"));
			// MProducto.crearProducto();
			doGet(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
