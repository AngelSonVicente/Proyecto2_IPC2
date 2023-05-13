package datos;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
public class Listar {
    static Connection conexion = ConexionBD.getInstancia().getConexion();
    public static ArrayList<Especialidades> Especialidades(){
        ArrayList<Especialidades> ListarEspecialidad = new ArrayList<>();
        // Crear la sentencia SQL para obtener todos los datos de la tabla de productos
        String sql = "SELECT * FROM especialidades";
        try{
            var statement = conexion.createStatement();
            var resultset = statement.executeQuery(sql);
            while (resultset.next()) {
                int codigo = resultset.getInt("ID");
                String nombre = resultset.getString("nombre");
                String descripcion = resultset.getString("descripcion");

                Especialidades Especialidad = new Especialidades(codigo,nombre,descripcion);
                ListarEspecialidad.add(Especialidad);
            }
            statement.close();
            resultset.close();
        }catch(SQLException e){
            System.out.println("Error al realizar la consulta"+ e.getMessage());
        }
        return ListarEspecialidad;
    }



    private static ArrayList<Laboratorios> Laboratorios(String sql){
        ArrayList<Laboratorios> Listar = new ArrayList<>();
          try{
            var statement = conexion.createStatement();
            var resultset = statement.executeQuery(sql);
            while (resultset.next()) {
                int ID = resultset.getInt("ID");
                String nombre = resultset.getString("nombre");
                String Direccion = resultset.getString("direccion");
                String CUI="";
              //  String CUI = String.valueOf(resultset.getInt("cui"));
                int Telefono = resultset.getInt("telefono");
                String correo = resultset.getString("correo");
                String Fundacion = resultset.getString("fecha_fundacion");

                Laboratorios lab = new Laboratorios(ID,nombre,Direccion,CUI,Telefono,correo,Fundacion);
                Listar.add(lab);
            }
            statement.close();
            resultset.close();
        }catch(SQLException e){
            System.out.println("Error al realizar la consulta"+ e.getMessage());
        }
        return Listar;
    }
    public static ArrayList<Laboratorios> ListarLaboratorios(){
  String sql="SELECT * FROM usuario_laboratorio";
        return Laboratorios(sql);
    }

    private static ArrayList<Consultas> SQLCOnsultas(String sql){

        ArrayList<Consultas> Listar = new ArrayList<>();

        try{
            var statement = conexion.createStatement();
            var resultset = statement.executeQuery(sql);
            while (resultset.next()) {
                int ID = resultset.getInt("ID");
                int IDPaciente = resultset.getInt("ID_paciente");
                int IDMedico = resultset.getInt("ID_medico");
                int IDEspecialidad = resultset.getInt("ID_especialidad");
                float porcentaje =resultset.getFloat("porcentaje");
                String FechaCreacion = resultset.getString("fecha_creacion");
                String FechaAgendada = resultset.getString("fecha_agendada");
                float precio =resultset.getFloat("precio");
                String informe = resultset.getString("informe");
                String estado = resultset.getString("estado");

                Consultas consulta = new Consultas(ID,IDPaciente,IDMedico,IDEspecialidad,porcentaje,FechaCreacion,FechaAgendada,precio,informe,estado);
                Listar.add(consulta);
            }
            statement.close();
            resultset.close();

        }catch(SQLException e){
            System.out.println("Error al realizar la consulta"+ e.getMessage());
        }


        return Listar;
    }




    public static ArrayList<Consultas> Consultas(String Fecha, String Estado){
        String sql="";
        ArrayList<Consultas> Listar = new ArrayList<>();
        if(Fecha.equals("todo")){
         sql = "SELECT * FROM consultas WHERE estado = '"+Estado+"'";
        }else{
         sql = "SELECT * FROM consultas WHERE CAST(fecha_agendada AS DATE) = '"+Fecha+"' AND estado = '"+Estado+"'";
        }

        return SQLCOnsultas(sql);
    }



    public static ArrayList<Consultas> ConsultasMF(String Fecha, String idMedico){
        ArrayList<Consultas> Listar = new ArrayList<>();
        String sql = "SELECT * FROM consultas WHERE CAST(fecha_agendada AS DATE) = '"+Fecha+"' AND ID_medico = '"+idMedico+"'";


        return SQLCOnsultas(sql);
    }


    public static ArrayList<Consultas> ConsultasPE(String idPaciente, String Estado){
        ArrayList<Consultas> Listar = new ArrayList<>();
        String sql = "SELECT * FROM consultas WHERE ID_paciente = '"+idPaciente+"' AND estado = '"+Estado+"'";

        return SQLCOnsultas(sql);
    }

    public static ArrayList<Consultas> ConsultasIDP(String idPaciente){
        ArrayList<Consultas> Listar = new ArrayList<>();
        String sql = "SELECT * FROM consultas WHERE ID_paciente = '"+idPaciente+"'";

        return SQLCOnsultas(sql);
    }

    private static ArrayList<ExamenConsulta> ConExamenesConsulta(String sql){
        ArrayList<ExamenConsulta> Listar = new ArrayList<>();
        // Crear la sentencia SQL para obtener todos los datos de la tabla de productos

        System.out.println(sql);
        try{
            var statement = conexion.createStatement();
            var resultset = statement.executeQuery(sql);

            while (resultset.next()) {
                int ID = resultset.getInt("ID_consulta");
                int IDExamen = resultset.getInt("ID_examen");
                String nombre = resultset.getString("nombre");
                float precio =resultset.getFloat("precio");
                byte[] archivo =resultset.getBytes("archivo");
                String estado = resultset.getString("estado");

                ExamenConsulta examen = new ExamenConsulta(ID,IDExamen,nombre,precio,archivo,estado);
                Listar.add(examen);
            }

            statement.close();
            resultset.close();

        }catch(SQLException e){
            System.out.println("Error al realizar la consulta"+ e.getMessage());
        }


        return Listar;
    }


    public static ArrayList<ExamenConsulta> ExamenesConsulta(String IDConsulta){
        String sql = "SELECT * FROM examen_consulta WHERE ID_consulta = '"+IDConsulta+"'";
        return ConExamenesConsulta(sql);
    }
    public static ArrayList<ExamenConsulta> ExamenesConsultaIE(String IDConsulta, String Estado){
        String sql = "SELECT * FROM examen_consulta WHERE ID_consulta = '"+IDConsulta+"' AND estado = '"+Estado+"'";
        return ConExamenesConsulta(sql);
    }





    private static ArrayList<SolicitudesExamenes> sqlSolicitudesExamenes(String sql){
        ArrayList<SolicitudesExamenes> Listar = new ArrayList<>();
        // Crear la sentencia SQL para obtener todos los datos de la tabla de productos

        //System.out.println(sql);
        try{
            var statement = conexion.createStatement();
            var resultset = statement.executeQuery(sql);

            while (resultset.next()) {
                int ID = resultset.getInt("ID");
                int IDPaciente = resultset.getInt("ID_paciente");
                int IDLaboratorio = resultset.getInt("ID_laboratorio");
                float porcentaje =resultset.getFloat("porcentaje");
                String FechaSolicitud = resultset.getString("fecha_solicitud");
                String FechaFinalizado = resultset.getString("fecha_finalizado");
                float precio =resultset.getFloat("precio");
                String estado = resultset.getString("estado");

                SolicitudesExamenes examen = new SolicitudesExamenes(ID,IDPaciente,IDLaboratorio,porcentaje,FechaSolicitud,FechaFinalizado,precio,estado);
                Listar.add(examen);
            }

            statement.close();
            resultset.close();

        }catch(SQLException e){
            System.out.println("Error al realizar la consulta"+ e.getMessage());
        }


        return Listar;
    }


    public static ArrayList<SolicitudesExamenes> SolicitudesExamenes(String FechaSolicitud, String Estado){
        String sql="";
        if(FechaSolicitud.equals("todo")){
        sql = "SELECT * FROM solicitudes_examenes WHERE estado = '"+Estado+"'";

        }else{
        sql = "SELECT * FROM solicitudes_examenes WHERE fecha_solicitud = '"+FechaSolicitud+"' AND estado = '"+Estado+"'";

        }


        return sqlSolicitudesExamenes(sql);
    }

    public static ArrayList<SolicitudesExamenes> SolicitudesExamenesIEP(String IDPaciente, String Estado){
        String sql= "SELECT * FROM solicitudes_examenes WHERE ID_paciente = '"+IDPaciente+"' AND estado = '"+Estado+"'";
        return sqlSolicitudesExamenes(sql);
    }



    private static ArrayList<ListaExamenes> ExamenesSoli(String sql){
        ArrayList<ListaExamenes> Listar = new ArrayList<>();

        // Crear la sentencia SQL para obtener todos los datos de la tabla de productos
        System.out.println(sql);
        try{
            var statement = conexion.createStatement();
            var resultset = statement.executeQuery(sql);
            while (resultset.next()) {
                int IDsolicitud = resultset.getInt("ID_solicitud");
                int IDExamen = resultset.getInt("ID_examen");
                String nombre = resultset.getString("nombre");
                float precio = resultset.getFloat("precio");
                String estado = resultset.getString("estado");
                byte[] archivo =resultset.getBytes("archivo");


                ListaExamenes examen = new ListaExamenes(IDsolicitud,IDExamen,nombre,precio,estado,archivo);
                Listar.add(examen);
            }
            statement.close();
            resultset.close();
        }catch(SQLException e){
            System.out.println("Error al realizar la consulta"+ e.getMessage());
        }
        return Listar;
    }
    public static ArrayList<ListaExamenes> ListaExamenesSoli(String IDSolicitud){

        // Crear la sentencia SQL para obtener todos los datos de la tabla de productos
        String sql = "SELECT * FROM lista_examenes WHERE ID_solicitud = '"+IDSolicitud+"'";

        return ExamenesSoli(sql);
    }



    public static ArrayList<TipoExamen> TipoExamen(){
        ArrayList<TipoExamen> Listar = new ArrayList<>();

        // Crear la sentencia SQL para obtener todos los datos de la tabla de productos
        String sql = "SELECT * FROM tipo_examen";
        System.out.println(sql);
        try{
            var statement = conexion.createStatement();
            var resultset = statement.executeQuery(sql);
            while (resultset.next()) {
                int ID = resultset.getInt("ID");
                 String nombre = resultset.getString("nombre");
                 String descripcion = resultset.getString("descripcion");

                TipoExamen examen = new TipoExamen(ID,nombre,descripcion);
                Listar.add(examen);
            }
            statement.close();
            resultset.close();
        }catch(SQLException e){
            System.out.println("Error al realizar la consulta"+ e.getMessage());
        }
        return Listar;
    }

    private static ArrayList<SolicitudEspecialidad> SolicitudesEspecialidad(String sql){
        ArrayList<SolicitudEspecialidad> Listar = new ArrayList<>();

        // Crear la sentencia SQL para obtener todos los datos de la tabla de productos

        System.out.println(sql);
        try{
            var statement = conexion.createStatement();
            var resultset = statement.executeQuery(sql);
            while (resultset.next()) {
                int ID = resultset.getInt("ID");
                int IDMedico = resultset.getInt("ID_medico");
                int IDespecialidad = resultset.getInt("ID_especialidad");
                float precio= resultset.getFloat("precio");
                 String estado = resultset.getString("estado");

                SolicitudEspecialidad soli = new SolicitudEspecialidad(ID,IDMedico,IDespecialidad,precio,estado);
                Listar.add(soli);
            }
            statement.close();
            resultset.close();
        }catch(SQLException e){
            System.out.println("Error al realizar la consulta"+ e.getMessage());
        }
        return Listar;
    }


    public static ArrayList<SolicitudEspecialidad> SolicitudesEspecialidadEME( String IDMedico, String Estado){
         String sql = "SELECT * FROM solicitud_medico WHERE ID_medico = '"+IDMedico+"' AND estado = '"+Estado+"'";
        return SolicitudesEspecialidad(sql);
    }





    private static ArrayList<SolicitudTipoExamen> SolicitudTipoExamenn(String sql){
        ArrayList<SolicitudTipoExamen> Listar = new ArrayList<>();

        // Crear la sentencia SQL para obtener todos los datos de la tabla de productos

        System.out.println(sql);
        try{
            var statement = conexion.createStatement();
            var resultset = statement.executeQuery(sql);
            while (resultset.next()) {
                int ID = resultset.getInt("ID");
                int IDlab = resultset.getInt("ID_laboratorio");
                int IDexamen = resultset.getInt("ID_examen");
                String nombre = resultset.getString("nombre");
                float precio= resultset.getFloat("precio");
                String estado = resultset.getString("estado");

                SolicitudTipoExamen soli = new SolicitudTipoExamen(ID,IDlab,IDexamen,nombre,precio,estado);
                Listar.add(soli);
            }
            statement.close();
            resultset.close();
        }catch(SQLException e){
            System.out.println("Error al realizar la consulta"+ e.getMessage());
        }
        return Listar;
    }

    public static ArrayList<SolicitudTipoExamen> SolicitudesTipoExamenIE( String IDLaboraotirio , String Estado){
        String sql = "SELECT * FROM solicitud_laboratorio WHERE ID_laboratorio = '"+IDLaboraotirio+"' AND estado = '"+Estado+"'";
        return SolicitudTipoExamenn(sql);
    }



    public static ArrayList<HorarioMedico> HorarioMedico(String IDMedico){
        ArrayList<HorarioMedico> Listar = new ArrayList<>();
        // Crear la sentencia SQL para obtener todos los datos de la tabla de productos
        String sql = "SELECT * FROM horario_medico WHERE ID_medico = '"+IDMedico+"'";
        System.out.println(sql);
        try{
            var statement = conexion.createStatement();
            var resultset = statement.executeQuery(sql);
            while (resultset.next()) {
                int ID = resultset.getInt("ID");
                int ID_medico = resultset.getInt("ID_medico");
                 String HoraInicio = resultset.getString("HoraInicio1");
                 String HoraFinal = resultset.getString("HoraFin1");
                HorarioMedico horario = new HorarioMedico(ID,ID_medico,HoraInicio,HoraFinal);
                Listar.add(horario);
            }
            statement.close();
            resultset.close();
        }catch(SQLException e){
            System.out.println("Error al realizar la consulta"+ e.getMessage());
        }
        return Listar;
    }
    public static ArrayList<EspecialidadesMedico> EspecialidadesMedico(String IDEspecialidad){
        ArrayList<EspecialidadesMedico> Listar = new ArrayList<>();

        // Crear la sentencia SQL para obtener todos los datos de la tabla de productos
        String sql = "SELECT * FROM especialida_medico WHERE ID_especialidad = '"+IDEspecialidad+"'";
        try{
            var statement = conexion.createStatement();
            var resultset = statement.executeQuery(sql);
            while (resultset.next()) {
                int ID_medico = resultset.getInt("ID_medico");
                int ID_especialidad = resultset.getInt("ID_especialidad");
                String nombre = resultset.getString("nombre");
                float precio= resultset.getFloat("precio");
                EspecialidadesMedico Especialidad = new EspecialidadesMedico(ID_medico,ID_especialidad,nombre,precio);
                Listar.add(Especialidad);
            }
            statement.close();
            resultset.close();
        }catch(SQLException e){
            System.out.println("Error al realizar la consulta"+ e.getMessage());
        }
        return Listar;
    }


    public static ArrayList<Medicos> Medicos(){
        ArrayList<Medicos> Listar = new ArrayList<>();

        // Crear la sentencia SQL para obtener todos los datos de la tabla de productos
        String sql = "SELECT * FROM usuario_medico";
        try{
            var statement = conexion.createStatement();
            var resultset = statement.executeQuery(sql);
            while (resultset.next()) {
                int ID = resultset.getInt("ID");
                String nombre = resultset.getString("nombre");
                String direccion = resultset.getString("direccion");
                String cui = resultset.getString("cui");
                String correo = resultset.getString("correo");
                String Nacimiento = resultset.getString("fecha_nacimiento");
                Medicos medico = new Medicos(ID,nombre,direccion,cui,Nacimiento,correo);
                Listar.add(medico);
            }
            statement.close();
            resultset.close();
        }catch(SQLException e){
            System.out.println("Error al realizar la consulta"+ e.getMessage());
        }
        return Listar;
    }


    private static ArrayList<ExamenesLaboratorio> ExamenesLaboratorio(String sql){
        ArrayList<ExamenesLaboratorio> Listar = new ArrayList<>();
        // Crear la sentencia SQL para obtener todos los datos de la tabla de productos

     //   String sql = "SELECT * FROM examen_consulta WHERE ID_consulta = '"+IDConsulta+"'";
        System.out.println(sql);
        try{
            var statement = conexion.createStatement();
            var resultset = statement.executeQuery(sql);
            while (resultset.next()) {
                int IDLaboratorio = resultset.getInt("ID_laboratorio");
                int IDExamen = resultset.getInt("ID_examen");
                String nombre = resultset.getString("nombre");
                float precio =resultset.getFloat("precio");
                ExamenesLaboratorio examen = new ExamenesLaboratorio(IDLaboratorio,IDExamen,nombre,precio);
                Listar.add(examen);
            }
            statement.close();
            resultset.close();
        }catch(SQLException e){
            System.out.println("Error al realizar la consulta"+ e.getMessage());
        }

        return Listar;
    }
    public static ArrayList<ExamenesLaboratorio> ExamenesLaboratorioIE(String IDExamen){
      //  ArrayList<ExamenesLaboratorio> Listar = new ArrayList<>();
        // Crear la sentencia SQL para obtener todos los datos de la tabla de productos

           String sql = "SELECT * FROM examenes_laboratorio WHERE ID_Examen = '"+IDExamen+"'";


        return ExamenesLaboratorio(sql);
    }


}
