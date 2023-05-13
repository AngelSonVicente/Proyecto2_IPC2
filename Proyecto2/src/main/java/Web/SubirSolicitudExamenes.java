package Web;

import datos.Actualizar;
import datos.Subir;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
@WebServlet("/SubirSolicitudExamen")
public class SubirSolicitudExamenes extends HttpServlet {
    private datosBD datos = new datosBD();
    private Subir subir = new Subir();
    private Actualizar actualizar = new Actualizar();
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        //String idMedico = request.getParameter("IdMedico");
        String IDConsulta = request.getParameter("IDConsulta");
        String IDLab = request.getParameter("IDLab");
        String IDPaciente = request.getParameter("IDPaciente");
        String FechaActual = request.getParameter("Fecha");
        float total = Float.parseFloat(request.getParameter("precio"));
        float SaldoPaciente =Float.parseFloat(request.getParameter("SaldoPaciente"));

        String[] ids = request.getParameterValues("id[]");
        String[] nombres = request.getParameterValues("nombre[]");
        String[] Costo = request.getParameterValues("costo[]");


        float porcentaje =Float.parseFloat(datos.getPorcentaje());
        float SaldoLab=datos.getSaldoLaboratorio(IDLab);
        float SaldoAdmin=datos.getSaldoAdministrador();

        float SaldoLabNuevo=(SaldoLab+(total-(total*porcentaje)));
        float SaldoPacienteNuevo = (SaldoPaciente-total);
        float SaldoAdminNuevo=(SaldoAdmin+(total*porcentaje));

        System.out.println(total);
        actualizar.Saldo("usuario_laboratorio",IDLab,SaldoLabNuevo);
        actualizar.Saldo("usuario_paciente",IDPaciente,SaldoPacienteNuevo);
        actualizar.Saldo("usuario_administrador","1",SaldoAdminNuevo);

       int IDSolicitud = subir.SolicitudExamen(IDPaciente,IDLab,porcentaje,FechaActual,total,"Pendiente");

        for (int i = 0; i < ids.length; i++) {


             System.out.println("ID: " + ids[i] + " Nombre: "+ nombres[i]+" Precio: "+Costo[i]);
            actualizar.EstadoExamenes(IDConsulta,ids[i],"Examen_solicitado");

            subir.ListaExamenes(String.valueOf(IDSolicitud),ids[i],nombres[i],Float.parseFloat(Costo[i]));



        }


    }




    }

