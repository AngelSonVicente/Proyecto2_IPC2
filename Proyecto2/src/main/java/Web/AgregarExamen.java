package Web;

import datos.Actualizar;
import datos.Subir;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
@WebServlet("/SubirExamenes")
public class AgregarExamen extends HttpServlet {

    private Subir subir;
    private Actualizar actualizar;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        subir = new Subir();
        actualizar=new Actualizar();

        //String idMedico = request.getParameter("IdMedico");
        String IDConsulta = request.getParameter("IDConsulta");
         String[] ids = request.getParameterValues("id[]");
         String[] nombres = request.getParameterValues("nombre[]");


        for (int i = 0; i < ids.length; i++) {
            System.out.println(nombres[i]);
            subir.ExamenesConsulta(IDConsulta,ids[i],nombres[i],"Examen_pendiente");
        }

        actualizar.Consulta(IDConsulta,"estado","Examen_Pendiente");
    }
}
