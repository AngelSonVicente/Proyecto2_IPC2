package Web;

import datos.Actualizar;
import datos.Subir;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
@WebServlet("/SubirSolicitudExamenLab")
public class SubirSolicitudExamenLab extends HttpServlet {
    private Subir subir = new Subir();
    private Actualizar actualizar = new Actualizar();
    private datosBD datos = new datosBD();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idLab = request.getParameter("IdLab");
        String[] ids = request.getParameterValues("id[]");
        String[] costos = request.getParameterValues("costo[]");
        String[] nombres = request.getParameterValues("nombre[]");

            System.out.println(idLab);
        for (int i = 0; i < ids.length; i++) {
            //String id = ids[i];
           // String costo = costos[i];

         //   System.out.println("ID:  "+ ids[i]+" nombre:  "+nombres[i]+ " costo: " +costos[i]);
              subir.SolicitudExamenlab(idLab,ids[i],nombres[i],costos[i]);

        }
        String estado=datos.getDato("usuario_laboratorio","ID","estado",idLab);
        if(estado.equals("Pendiente")){
            actualizar.EstadoLabYmedico("usuario_laboratorio",idLab,"Activo");
        }

    }
}
