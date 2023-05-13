package Web;

import datos.Actualizar;
import datos.Subir;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
@WebServlet("/AceptarSolicitud")
public class AceptarSolicitud extends HttpServlet {
    private datosBD datos = new datosBD();
    private Subir subir = new Subir();
    private Actualizar actualizar = new Actualizar();
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tipo = request.getParameter("Tipo");
        String IDsoli = request.getParameter("IDSoli");
        String precio = request.getParameter("precio");
        String nombre = request.getParameter("nombre");

        if(tipo.equals("Especialidad")){
        String IDMedico = request.getParameter("IDMedico");
        String IDEspecialidad = request.getParameter("IDEspecialidad");

        subir.EspecialidadMedico(IDMedico,IDEspecialidad,nombre,precio);
        actualizar.EstadoSoliMedico(IDsoli,"Aceptado");

        }else{
            String IDlab=request.getParameter("IDlab");
            String IDExamen=request.getParameter("IDExamen");
        subir.AgregarTipoExamenLab(IDlab,IDExamen,nombre,precio);
        actualizar.EstadoSoliLab(IDsoli,"Aceptado");

        }



    }
}
