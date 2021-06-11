package Utilidades;

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

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class SubirImagen
 */
@WebServlet("/SubirImagen")
public class SubirImagen extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HttpSession sesion;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		sesion = request.getSession(true);

		if (sesion.getAttribute("Iniciado") == null) {
			sesion.setAttribute("Iniciado", false);
		}
		sesion.setAttribute("idSubida", request.getParameter("idreferencia"));
		request.getRequestDispatcher("WEB-INF/subirImagen.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

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

		out = response.getWriter();

		// Mis más sinceros agradecimientos al grupo de desarrollo de HTML5 por
		// solucionar con simpleza un problema recurrente :C :C
//**************************************************** Recibe el archivo	   
		// Verify the content type
		contentType = request.getContentType();
		if ((contentType.indexOf("multipart/form-data") >= 0)) {

			factory = new DiskFileItemFactory();
			// maximum size that will be stored in memory
			factory.setSizeThreshold(maxMemSize);
			// Location to save data that is larger than maxMemSize.
			factory.setRepository(new File("."));

			// Create a new file upload handler
			ServletFileUpload upload = new ServletFileUpload(factory);
			// maximum file size to be uploaded.
			upload.setSizeMax(maxFileSize);
			try {
				// Parse the request to get file items.
				fileItems = upload.parseRequest(request);

				// Process the uploaded file items
				Iterator<FileItem> i = fileItems.iterator();

				out.println("<html>");
				out.println("<head>");
				out.println("<title>JSP File upload</title>");
				out.println("</head>");
				out.println("<body>");
				while (i.hasNext()) {
					fi = (FileItem) i.next();
					if (!fi.isFormField()) {
						// Get the uploaded file parameters
						String fieldName = fi.getFieldName();
						fileName = fi.getName();
						boolean isInMemory = fi.isInMemory();
						long sizeInBytes = fi.getSize();
						// Write the file
						if (fileName.lastIndexOf("/") >= 0) {
							file = new File(filePath + fileName.substring(fileName.lastIndexOf("/")));
						} else {
							file = new File(filePath + "/" + fileName.substring(fileName.lastIndexOf("/") + 1));
						}
						fi.write(file);
						out.println("Uploaded Filename: " + filePath + "/" + fileName + "<br>");
					}
				}
				out.println("</body>");
				out.println("</html>");
			} catch (Exception ex) {
				System.out.println(ex);
			}
		} else {
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Servlet upload</title>");
			out.println("</head>");
			out.println("<body>");
			out.println("<p>No file uploaded</p>");
			out.println("</body>");
			out.println("</html>");
		}
		out.close();

		// ****************************************************** Lo inserta en la BBDD
		// A temporary buffer - this can be as large as you like
		byte buf[];
		int s, t;
		String rutaImagen;
		FileInputStream fis;
		SerialBlob campoImagen;
		Connection db;

		rutaImagen = filePath + "/" + fileName;
		// File file=new File(rutaImagen);

		try {

			// Open the file
			fis = new FileInputStream(file);

			// Método uno ************************************
			/*
			 * buf = new byte[fis.available()]; fis.read(buf, 0, buf.length);
			 * campoImagen=new SerialBlob(buf); fis.close();
			 */
			// Método dos **********************
			/*
			 * Más correcto, pero ignorado de momento s=t = 0; while ((s = fis.read(buf, 0,
			 * buf.length)) > 0) { t += s; // blob.write(buf, 0, s);
			 * campoImagen.setBytes(t,buf); System.err.println(t); }
			 * 
			 */
			// Close the object
//       blob.close();

			// Método otro, más actual *******************************
// No hago nada aquí, más abajo

			// Load the driver
			Class.forName("org.postgresql.Driver");
			System.err.println("1");
//      Class.forName("org.firebirdsql.jdbc.FBDriver");

			// Connect to database
			db = DriverManager.getConnection("jdbc:postgresql://ns3034756.ip-91-121-81.eu/a20-mgarde", "a20-mgarde",
					"a20-mgarde");
			System.err.println("2");
//      db = DriverManager.getConnection("jdbc:firebirdsql:/l.IV.g/prf.gdb", "sysdba", "masterkey");
			// Método 1 y 2 db.setAutoCommit(false); // Obligatorio para blob, hay que
			// cerrar para commit
			System.err.println("3");
			PreparedStatement pstmt = db
					.prepareStatement("UPDATE urbancity.producto SET img = ? where idreferencia = ?;");
			// pstmt.setInt(1, 1);
			/*
			 * Método 1 y 2 pstmt.setBlob(2, campoImagen); pstmt.execute();
			 */

			pstmt.setBinaryStream(1, fis, (int) file.length());
			pstmt.setString(2, (String) sesion.getAttribute("idSubida"));
			pstmt.executeUpdate();

			pstmt.close();
			db.close();

			System.out.println("4");
		}

		catch (Exception ex) {
			System.err.println("excepcion" + ex);
		}

	}
}
