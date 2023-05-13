package Web;

import datos.Subir;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
@WebServlet("/SubirHorarios")
public class AgregarHorarios extends HttpServlet {
    private Subir subir;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        subir = new Subir();
        String idMedico = request.getParameter("IdMedico");

        String[] Hora1 = request.getParameterValues("Hora1[]");
         String[] Hora2 = request.getParameterValues("Hora2[]");

        for (int i = 0; i < Hora1.length; i++) {

            subir.Horario(idMedico,Hora1[i],Hora2[i]);
        }

    }
}
