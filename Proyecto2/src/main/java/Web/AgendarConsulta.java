package Web;

import datos.Actualizar;
import datos.Subir;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/ConsultaAgendada")
public class AgendarConsulta extends HttpServlet {

    private datosBD datos = new datosBD();
    private Subir subir = new Subir();
    private Actualizar actualizar = new Actualizar();
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    String IDPaciente=     request.getParameter("IdPaciente");
    String IDEspecialidad= request.getParameter("especialidad");
    String IDMedico=       request.getParameter("medico");
    String Fecha=          request.getParameter("fechaa");
    String FechaActual=          request.getParameter("fechaActual");
    String Hora=           request.getParameter("horas");
    float Precio=         Float.parseFloat(request.getParameter("precio"));
    float SaldoPaciente=  Float.parseFloat(request.getParameter("saldoPaciente"));
    float SaldoAdmin =datos.getSaldoAdministrador();
    float SaldoMedico =datos.getSaldoMedico(IDMedico);
    float porcentaje = Float.parseFloat(datos.getPorcentaje());
    String FechaAgendada =Fecha+" "+Hora;

float SaldoPacienteNuevo =SaldoPaciente-Precio;
float SaldoAdminNuevo=SaldoAdmin+(Precio*porcentaje);
float SaldoMedicoNuevo=SaldoMedico+(Precio-(Precio*porcentaje));


subir.Consulta(IDPaciente,IDMedico,IDEspecialidad,porcentaje,FechaActual,FechaAgendada, Precio);
actualizar.Saldo("usuario_administrador","123",SaldoAdminNuevo);
actualizar.Saldo("usuario_medico",IDMedico,SaldoMedicoNuevo);
actualizar.Saldo("usuario_paciente",IDPaciente,SaldoPacienteNuevo);
    }

}
