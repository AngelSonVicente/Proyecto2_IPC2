package datos;

import java.sql.Connection;
import java.sql.SQLException;

public class Subir {
    Connection conexion = ConexionBD.getInstancia().getConexion();


    private void  Subir(String sql ){
        try (var statement =conexion.createStatement()){
            statement.execute(sql);
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
    }

    private int SubirRegresandoID(String sql) {
        try (var statement = conexion.createStatement()) {
            statement.executeUpdate(sql, statement.RETURN_GENERATED_KEYS);
           var resultset  = statement.getGeneratedKeys();
            if (resultset.next()) {
                return resultset.getInt(1);
            } else {
                return -1;
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
            return -1;
        }
    }
    public void  SolicitudEspecialidad(String idMedico, String idEspecialidad, String costo ){
        String query = "INSERT INTO solicitud_medico (ID_medico,ID_especialidad,precio)" +
                " VALUES ("+idMedico+",'"+idEspecialidad+"','"+costo+"','Pendiente')";
        Subir(query);
    }

    public void  SolicitudExamenlab(String IDLaboratorio, String IDExamen,String Nombre, String costo ){
        String query = "INSERT INTO solicitud_laboratorio (ID_laboratorio,ID_examen,nombre,precio,estado)" +
                " VALUES ("+IDLaboratorio+",'"+IDExamen+"','"+Nombre+"','"+costo+"','Pendiente')";
        Subir(query);
    }
    public void  ExamenesConsulta(String IDConsulta,String IDExamen, String Nombre, String Estado ){
        String query = "INSERT INTO examen_consulta (ID_consulta,ID_examen,nombre,estado)" +
                " VALUES ("+IDConsulta+",'"+IDExamen+"','"+Nombre+"','"+Estado+"')";
    Subir(query);
    }
    public void  Horario(String IDMedico,String HoraInicio, String HoraFinal){
        String query = "INSERT INTO horario_medico (ID_medico,HoraInicio1,HoraFin1)" +
                " VALUES ("+IDMedico+",'"+HoraInicio+"','"+HoraFinal+"')";
    Subir(query);
    }
    public void  Consulta(String IDPaciente, String IDMedico, String IDespecialidad,float porcentaje, String FechaCreacion, String FechaAgendada, float Precio){
        String query = "INSERT INTO consultas (ID_paciente,ID_medico,ID_especialidad,porcentaje,fecha_creacion,fecha_agendada,precio,estado)" +
                " VALUES ("+IDPaciente+",'"+IDMedico+"','"+IDespecialidad+"','"+porcentaje+"','"+FechaCreacion+"','"+FechaAgendada+"','"+Precio+"','Agendada')";
    Subir(query);

    }

    public int      SolicitudExamen(String IDPaciente,String IDLaboratorio, float porcentaje, String FechaSolicitud, float Precio,String Estado){
        String query = "INSERT INTO solicitudes_examenes (ID_paciente,ID_laboratorio,porcentaje,fecha_solicitud,precio,estado)" +
                " VALUES ("+IDPaciente+",'"+IDLaboratorio+"','"+porcentaje+"','"+FechaSolicitud+"','"+Precio+"','"+Estado+"')";
        return SubirRegresandoID(query);
    }
    public void  ListaExamenes(String IDSolicitud, String IDExamen, String Nombre, float Precio){
        String query = "INSERT INTO lista_examenes (ID_solicitud,ID_examen,nombre,precio)" +
                " VALUES ("+IDSolicitud+",'"+IDExamen+"','"+Nombre+"','"+Precio+"')";

        Subir(query);
        System.out.println(query);
    }

    public void  EspecialidadMedico(String IDMEdico, String IDEspecialidad, String Nombre, String Precio){
        String query = "INSERT INTO especialida_medico (ID_medico,ID_especialidad,nombre,precio)" +
                " VALUES ("+IDMEdico+",'"+IDEspecialidad+"','"+Nombre+"','"+Precio+"')";

        Subir(query);
        System.out.println(query);
    }
    public void  AgregarTipoExamenLab(String IDlaboratorio, String IDExamen, String Nombre, String Precio){
        String query = "INSERT INTO examenes_laboratorio (ID_laboratorio,ID_examen,nombre,precio)" +
                " VALUES ("+IDlaboratorio+",'"+IDExamen+"','"+Nombre+"','"+Precio+"')";

        Subir(query);
        System.out.println(query);
    }

    public void cambiarPorcentaje(String porcentaje, String Fecha){
        String query = "INSERT INTO porcentaje (porcentaje,fecha_inicial)" +
                " VALUES ("+porcentaje+",'"+Fecha+"')";
        Subir(query);
        System.out.println(query);
    }
    public void Recargar(String ID_paciente, String FechaYhora, float monto){
        String query = "INSERT INTO recargas (ID_paciente,FechaHora,Monto)" +
                " VALUES ("+ID_paciente+",'"+FechaYhora+"','"+monto+"')";
        Subir(query);
        System.out.println(query);
    }


    public void UsuarioPaciente(String Nombre, String usuario, String Contra,String direccion, String CUI, String telefono,String correo,String nacimiento){
        String query = "INSERT INTO usuario_paciente (nombre,usuario,contrasena,direccion,cui,telefono,correo,fecha_nacimiento,saldo)" +
                " VALUES ('"+Nombre+"','"+usuario+"','"+Contra+"','"+direccion+"','"+CUI+"','"+telefono+"','"+correo+"','"+nacimiento+"','0.0')";
        Subir(query);
        System.out.println(query);
    }
    public void UsuarioLab(String Nombre, String usuario, String Contra,String direccion, String CUI, String telefono, String correo, String fundacion){
        String query = "INSERT INTO usuario_laboratorio (nombre,usuario,contrasena,direccion,cui,telefono,correo,fecha_fundacion,saldo,estado)" +
                " VALUES ('"+Nombre+"','"+usuario+"','"+Contra+"','"+direccion+"','"+CUI+"','"+telefono+"','"+correo+"','"+fundacion+"','0.0','Pendiente')";
        Subir(query);
        System.out.println(query);

    }   public void UsuarioMedico(String Nombre, String usuario, String Contra,String direccion, String CUI, String telefono,String correo,String nacimiento){
        String query = "INSERT INTO usuario_medico (nombre,usuario,contrasena,direccion,cui,telefono,correo,fecha_nacimiento,saldo,estado)" +
                " VALUES ('"+Nombre+"','"+usuario+"','"+Contra+"','"+direccion+"','"+CUI+"','"+telefono+"','"+correo+"','"+nacimiento+"','0.0','Pendiente')";
        Subir(query);
        System.out.println(query);
    }









}
