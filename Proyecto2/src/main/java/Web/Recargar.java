package Web;

import datos.Actualizar;
import datos.Subir;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
@WebServlet("/Recarga")
public class Recargar extends HttpServlet {
Subir subir = new Subir();
Actualizar actualizar = new Actualizar();
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String IDpaciente = request.getParameter("IDPaciente");
        float SaldoPaciente = Float.parseFloat(request.getParameter("saldoactual"));
        float Monto = Float.parseFloat(request.getParameter("monto"));
        String FechaYHora = request.getParameter("fechaYhora");
         float SaldoNuevo = SaldoPaciente+Monto;

        subir.Recargar(IDpaciente,FechaYHora,Monto);
        actualizar.Saldo("usuario_paciente",IDpaciente,SaldoNuevo);

    }
}
