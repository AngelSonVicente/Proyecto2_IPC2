package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Actualizar {
    Connection conexion = ConexionBD.getInstancia().getConexion();


    public void ActualizarDato(String sql){
        try {
            var statement = conexion.createStatement();
            var resultset = statement.executeUpdate(sql);
            statement.close();
        }catch(SQLException e){
            System.out.println("Error al realizar la actualizacion"+ e.getMessage());
        }
        System.out.println(sql);
    }
    public void Consulta(String Codigo, String Columna, String DatoActualizado){
        String sql="UPDATE consultas SET "+Columna+" ='"+  DatoActualizado +"' WHERE ID = '"+Codigo+"'";
        ActualizarDato(sql);
    }
    public void SolicitudExamenn(String Codigo, String Columna, String DatoActualizado){
        String sql="UPDATE solicitudes_examenes SET "+Columna+" ='"+  DatoActualizado +"' WHERE ID = '"+Codigo+"'";
        ActualizarDato(sql);
    }
    public void Saldo(String TipoUsuario, String ID, float SaldoNuevo){
        String sql="UPDATE "+TipoUsuario+" SET saldo ='"+  SaldoNuevo +"' WHERE ID = '"+ID+"'";
        ActualizarDato(sql);
    }
    public void EstadoExamenes(String IDConsulta, String IDExamen, String EstadoActualizado){
        String sql="UPDATE examen_consulta SET estado ='"+  EstadoActualizado +"' WHERE ID_consulta = '"+IDConsulta+"' AND ID_examen = '"+IDExamen+"'";
        ActualizarDato(sql);
    }

    public void EstadoExamenCOnsulta(String IDConsulta, String IDExamen, byte[] pdf){
        String sql = "UPDATE examen_consulta SET archivo = ? WHERE ID_consulta = ? AND ID_examen = ?";
        String sql1="UPDATE examen_consulta SET archivo = "+pdf+" WHERE ID_consulta = '"+IDConsulta+"' AND ID_examen = '"+IDExamen+"'";
      System.out.println(sql1);
        String sql2="UPDATE examen_consulta SET estado ='Examen_Completado' WHERE ID_consulta = '"+IDConsulta+"' AND ID_examen = '"+IDExamen+"'";

        try {
            PreparedStatement statement = conexion.prepareStatement(sql);
            statement.setBytes(1, pdf);
            statement.setString(2, IDConsulta);
            statement.setString(3, IDExamen);
            int rowsUpdated = statement.executeUpdate();
            if (rowsUpdated > 0) {
                System.out.println("El PDF se ha actualizado correctamente");
            } else {
                System.out.println("No se ha podido actualizar el PDF");
            }
        } catch (SQLException e) {
            System.out.println("Error al realizar la actualizacion: " + e.getMessage());
        }




        ActualizarDato(sql2);
    }



    public void PDFListaExamen(String IDsolicitud, String IDExamen, byte[] pdf){
            String sql = "UPDATE lista_examenes SET archivo = ? WHERE ID_solicitud = ? AND ID_examen = ?";
       // String sql1="UPDATE examen_consulta SET archivo = "+pdf+" WHERE ID_consulta = '"+IDsolicitud+"' AND ID_examen = '"+IDExamen+"'";
       // System.out.println(sql1);
        String sql2="UPDATE lista_examenes SET estado ='Examen_Completado' WHERE ID_solicitud = '"+IDsolicitud+"' AND ID_examen = '"+IDExamen+"'";

        try {
            PreparedStatement statement = conexion.prepareStatement(sql);
            statement.setBytes(1, pdf);
            statement.setString(2, IDsolicitud);
            statement.setString(3, IDExamen);
            int rowsUpdated = statement.executeUpdate();
            if (rowsUpdated > 0) {
                System.out.println("El PDF se ha actualizado correctamente");
            } else {
                System.out.println("No se ha podido actualizar el PDF");
            }
        } catch (SQLException e) {
            System.out.println("Error al realizar la actualizacion: " + e.getMessage());
        }




        ActualizarDato(sql2);
    }


    public void EstadoSoliMedico(String IDSolicitud, String EstadoActualizado){
        String sql="UPDATE solicitud_medico SET estado ='"+  EstadoActualizado +"' WHERE ID = '"+IDSolicitud+"'";
        ActualizarDato(sql);
    }
    public void EstadoSoliLab(String IDSolicitud, String EstadoActualizado){
        String sql="UPDATE solicitud_laboratorio SET estado ='"+  EstadoActualizado +"' WHERE ID = '"+IDSolicitud+"'";
        ActualizarDato(sql);
    }

    public void FechaFinalPorcentaje(String ID,String Fecha){
        String sql="UPDATE porcentaje SET fecha_final ='"+  Fecha +"' WHERE ID = '"+ID+"'";
        ActualizarDato(sql);
    }
    public void EstadoLabYmedico(String usuario, String ID,String estado){
        String sql="UPDATE "+usuario+" SET estado ='"+  estado +"' WHERE ID = '"+ID+"'";
        ActualizarDato(sql);
    }



}
