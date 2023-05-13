package Web;

import datos.Actualizar;
import datos.Subir;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
@WebServlet("/ConsultaFinalizada")
public class ConsultaFinalizada extends HttpServlet {

    private Actualizar actualizar;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

     actualizar = new Actualizar();

     String CodigoCOnsulta =request.getParameter("IDConsulta");
     String informe=request.getParameter("informe");
        informe = informe.replace("'", "");
     actualizar.Consulta(CodigoCOnsulta,"informe",informe);
     actualizar.Consulta(CodigoCOnsulta,"estado","Finalizado");

System.out.println(informe);

    }
}
