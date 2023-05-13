package Web;

import datos.Actualizar;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;

@WebServlet("/SubirPDF")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 15, // 15 MB
        maxFileSize = 1024 * 1024 * 50, // 50 MB
        maxRequestSize = 1024 * 1024 * 50 // 50 MB
)
public class EnviarPDF extends HttpServlet {

    private Actualizar actualizar = new Actualizar();
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//Recibir parametros
        String IDConsulta =request.getParameter("IDConsulta");
        String IDExamen =request.getParameter("IDExamen");
        Part pdfPart = request.getPart("archivoPDF");
        InputStream inputStream = pdfPart.getInputStream();

// Convertir el InputStream del archivo PDF en un byte array
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        byte[] buffer = new byte[4096];
        int bytesRead;
        while ((bytesRead = inputStream.read(buffer)) != -1) {
            byteArrayOutputStream.write(buffer, 0, bytesRead);
        }
        byte[] pdfBytes = byteArrayOutputStream.toByteArray();

        actualizar.EstadoExamenCOnsulta(IDConsulta,IDExamen,pdfBytes);

        request.setAttribute("IDConulta", IDConsulta);

//  página JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher("subirpdf.jsp");
        dispatcher.forward(request, response);
    }
}
