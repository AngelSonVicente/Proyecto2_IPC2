package datos;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Connection;
public class Buscar  {
    static Connection conexion = ConexionBD.getInstancia().getConexion();
    public static ArrayList<Consultas> ListarDevoluciones(String CodTienda, String EstadoaBuscar){
        ArrayList<Consultas> listaincidencias= new ArrayList<>();
        // Crear la sentencia SQL para obtener todos los datos de la tabla de productos



        String   sql = "SELECT * FROM devoluciones WHERE codigo_tienda = '"+CodTienda+"' AND estado = '"+EstadoaBuscar+"'";




        //System.out.println(sql);



        try{
            var statement = conexion.createStatement();
            var resultset = statement.executeQuery(sql);

            while (resultset.next()) {

                int ID =resultset.getInt("id_devolucion");
                int IDenvio=resultset.getInt("id_envio");
                int IDTienda=resultset.getInt("codigo_tienda");
                int IDUT=resultset.getInt("codigo_ut");
                String FechaIncidencia=resultset.getString("fecha_devolucion");
                float Total =resultset.getFloat("total_devolucion");
                String Estado=resultset.getString("estado");





               // ListaDevoluciones incidencia = new ListaDevoluciones(ID,IDenvio,IDTienda,IDUT,FechaIncidencia,Total,Estado);
                //listaincidencias.add(incidencia);
            }

            statement.close();
            resultset.close();

        }catch(SQLException e){
            System.out.println("Error al realizar la consulta"+ e.getMessage());
        }


        return listaincidencias;
    }


}
