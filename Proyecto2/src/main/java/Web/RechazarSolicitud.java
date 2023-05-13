package Web;

import datos.Actualizar;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
@WebServlet("/RechazarSolicitud")
public class RechazarSolicitud extends HttpServlet {
    private Actualizar actualizar = new Actualizar();
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String IDSOli = request.getParameter("IDSoli");
        String tipo = request.getParameter("Tipo");
         if(tipo.equals("Especialidad")){
             actualizar.EstadoSoliMedico(IDSOli,"Rechazado");


         }else{
             actualizar.EstadoSoliLab(IDSOli,"Rechazado");
         }



    }
}
