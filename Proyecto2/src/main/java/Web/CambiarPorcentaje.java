package Web;

import datos.Actualizar;
import datos.Subir;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
@WebServlet("/CambiarPorcentaje")
public class CambiarPorcentaje extends HttpServlet {
Subir subir = new Subir();
Actualizar actualizar = new Actualizar();

    @Override

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     String NuevoPorcentaje = request.getParameter("PorcentajeNuevo");
     String Fecha = request.getParameter("FechaActual");
    String IDPorcentaje = request.getParameter("IDporcentaje");
     subir.cambiarPorcentaje(NuevoPorcentaje,Fecha);
    actualizar.FechaFinalPorcentaje(IDPorcentaje,Fecha);




    }
}
