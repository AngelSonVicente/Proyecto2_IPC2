package Web;
import datos.*;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
//import org.mindrot.jbcrypt.BCrypt;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class datosBD {
    private static Connection conexion =null;

    private String url = "jdbc:mysql://localhost:3306/clinica";

    private String user="root";

    private String password="ASV30885";
    
    
        




    public Connection conectar(){


        try{
    Class.forName("com.mysql.cj.jdbc.Driver");
            conexion = DriverManager.getConnection(url,user,password);

            System.out.println("Conectado a la base de datos");
        }catch(SQLException | ClassNotFoundException e){
            System.out.println("error al conectar a la base de datos");
        }


        return null;
    }

    public void desconectar(){

        if(conexion != null ){

            try {
                conexion.close();
                System.out.println("Conexion cerrada");
            }catch(SQLException e){
                System.out.println("Error al cerrar la Conexion");
            }



        }
    }

     public boolean isLoginUT(String tabla,String Columna, String UsuarioIngresado, String ContraIngresada){

        boolean IsLogin=false;
        String usuario="";
        String contra="";
        String sql ="SELECT * FROM "+tabla+" WHERE "+Columna+" = '" +UsuarioIngresado+"'";



        try{
   var statement = conexion.createStatement();
            var resultset = statement.executeQuery(sql);
            
            if(resultset.next()){

                usuario = resultset.getString("usuario");
                    contra = resultset.getString("contrasena");





            }

         statement.close();
         resultset.close();

        }catch(SQLException e){
            System.out.println("Error al realizar la consulta"+ e.getMessage());
        }
        if(UsuarioIngresado.equals(usuario) && ContraIngresada.equals(contra) ){
            IsLogin=true;
            System.out.println("Ingresado");

        }

        System.out.println("usuario" + usuario+"     contra "+ contra);

        return IsLogin;
    }


    public String getDato(String tabla,String columna, String DatoaBucar,String BuscarCon){

        String Nombre="";

        String sql ="SELECT * FROM "+tabla+" WHERE "+columna+" = '" +BuscarCon+"'";

        try{
            var statement = conexion.createStatement();
            var resultset = statement.executeQuery(sql);

            if(resultset.next()){
                Nombre = resultset.getString(DatoaBucar);
            }

            statement.close();
            resultset.close();

        }catch(SQLException e){
            System.out.println("Error al realizar la consulta"+ e.getMessage());
        }
        return Nombre;
    }

    public String getDato2(String tabla,String columna, String DatoaBucar,String BuscarCon, String Columna2, String BuscarCon2){
        String Nombre="";
        String sql ="SELECT * FROM "+tabla+" WHERE "+columna+" = '" +BuscarCon+"' AND "+Columna2+" = '"+BuscarCon2+"'";
        try{
            var statement = conexion.createStatement();
            var resultset = statement.executeQuery(sql);
            if(resultset.next()){
                Nombre = resultset.getString(DatoaBucar);
            }
            statement.close();
            resultset.close();

        }catch(SQLException e){
            System.out.println("Error al realizar la consulta"+ e.getMessage());
        }
        return Nombre;
    }

    public String getPorcentaje(){
        String Porcentaje="";
        String sql ="SELECT * FROM porcentaje ORDER BY ID DESC LIMIT 1";
        try{
            var statement = conexion.createStatement();
            var resultset = statement.executeQuery(sql);
            if(resultset.next()){
                Porcentaje = resultset.getString("porcentaje");
            }
            statement.close();
            resultset.close();

        }catch(SQLException e){
            System.out.println("Error al realizar la consulta"+ e.getMessage());
        }
        return Porcentaje;
    }
    public int getIDUltimoPorcentaje(){

        int ID=0;
        String sql ="SELECT * FROM porcentaje ORDER BY ID DESC LIMIT 1";
        try{
            var statement = conexion.createStatement();
            var resultset = statement.executeQuery(sql);
            if(resultset.next()){
                ID = resultset.getInt("ID");
            }
            statement.close();
            resultset.close();

        }catch(SQLException e){
            System.out.println("Error al realizar la consulta"+ e.getMessage());
        }
        return ID;
    }

    public float getSaldoAdministrador(){
        float saldo=Float.parseFloat(getDato("usuario_administrador","ID","saldo","123"));
        return saldo;
    }


    public float getSaldoMedico(String ID){
        float saldo=Float.parseFloat(getDato("usuario_medico","ID","saldo",ID));
        return saldo;
    }

 public float getSaldoLaboratorio(String ID){
        float saldo=Float.parseFloat(getDato("usuario_laboratorio","ID","saldo",ID));
        return saldo;
    }




    public byte[] inputStreamToByteArray(InputStream inputStream) throws IOException {
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        byte[] buffer = new byte[4096];
        int bytesRead = -1;
        while ((bytesRead = inputStream.read(buffer)) != -1) {
            outputStream.write(buffer, 0, bytesRead);
        }
        return outputStream.toByteArray();
    }









    public void EliminarProductos(String CodigoPedido){



String sql="DELETE FROM listado_pedido WHERE id_pedido = '"+CodigoPedido+"'";
        try {

            var statement = conexion.createStatement();

            var resultset = statement.executeUpdate(sql);


            statement.close();



        }catch(SQLException e){
            System.out.println("Error al realizar la actualizacion"+ e.getMessage());
        }

        // System.out.println(sql);


    }


    public static ArrayList<ExamenesLaboratorio> ExamenesDisponibles(ArrayList<Integer> IDExamen, int IDLAB){
        ArrayList<ExamenesLaboratorio> Listar = new ArrayList<>();

        for(int i=0;i<IDExamen.size();i++){

            String sql = "SELECT * FROM examenes_laboratorio WHERE ID_laboratorio = '"+IDLAB+"' AND ID_examen = '"+IDExamen.get(i)+"'";

            try{
                var statement = conexion.createStatement();
                var resultset = statement.executeQuery(sql);


                if(resultset.next()){
                    int IDLab=resultset.getInt("ID_laboratorio");
                    int IDexamen=resultset.getInt("ID_examen");
                    String nombre=resultset.getString("nombre");
                    float precio=resultset.getFloat("precio");

                    ExamenesLaboratorio examen= new ExamenesLaboratorio(IDLab,IDexamen,nombre,precio);
                    Listar.add(examen);
                }

                statement.close();
                resultset.close();
            }catch(SQLException e){
                System.out.println("Error al realizar la consulta"+ e.getMessage());
            }
        }





        return Listar;
    }



    public void  CrearUsuario(String TipoUsuario, String Codigo,  String Nombre, String CodigoTienda, String Usuario, String Contrasena,String Correo,String Estado ){
String query="";
if(TipoUsuario.equals("tienda")){
         query = "INSERT INTO usuario_tienda (codigo_ut,nombre_ut,codigo_tienda,usuario_ut,contrasena_ut,correo_ut,estado)" +
                " VALUES ("+Codigo+",'"+Nombre+"','"+CodigoTienda+"','"+Usuario+"','"+Contrasena+"','"+Correo+"','"+Estado+"')";
}
if(TipoUsuario.equals("bodega")){

         query = "INSERT INTO usuario_bodega (codigo_ub,nombre_ub,usuario_ub,contrasena_ub,correo_ub,estado)" +
                " VALUES ("+Codigo+",'"+Nombre+"','"+Usuario+"','"+Contrasena+"','"+Correo+"','"+Estado+"')";
        }

if(TipoUsuario.equals("supervisor")){

         query = "INSERT INTO usuario_supervisor (codigo_us,nombre_us,usuario_us,contrasena_us,correo_us,estado)" +
                " VALUES ("+Codigo+",'"+Nombre+"','"+Usuario+"','"+Contrasena+"','"+Correo+"','"+Estado+"')";

}

System.out.println(query);

        try (var statement =conexion.createStatement()){
            statement.execute(query);
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }




    }















}
