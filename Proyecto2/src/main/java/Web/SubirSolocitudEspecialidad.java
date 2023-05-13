package Web;

import datos.Actualizar;
import datos.Subir;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
@WebServlet("/SubirSolocitudEspecialidad")
public class SubirSolocitudEspecialidad extends HttpServlet{

    private Subir subir;
    private  datosBD datos= new datosBD();
    private Actualizar actualizar = new Actualizar();
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        subir = new Subir();
        String idMedico = request.getParameter("IdMedico");
        String[] ids = request.getParameterValues("id[]");
      String[] costos = request.getParameterValues("costo[]");

        for (int i = 0; i < ids.length; i++) {
            String id = ids[i];
            String costo = costos[i];
           System.out.println(idMedico);
             subir.SolicitudEspecialidad(idMedico,ids[i],costos[i]);

        }

        String estado=datos.getDato("usuario_medico","ID","estado",idMedico);
        if(estado.equals("Pendiente")){
            actualizar.EstadoLabYmedico("usuario_medico",idMedico,"Activo");
        }
    }
}
