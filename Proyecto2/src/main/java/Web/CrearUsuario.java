package Web;

import datos.Subir;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
@WebServlet("/UsuarioCreado")
public class CrearUsuario extends HttpServlet {
Subir subir = new Subir();
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String tipo =request.getParameter("tipooo");
    String Nombre =request.getParameter("Nombre");
    String Usuario =request.getParameter("Usuario");
    String contra =request.getParameter("contra");
    String Correo =request.getParameter("correo");
    String Direccion =request.getParameter("direccion");
    String CUI =request.getParameter("CUI");
    String Telefono =request.getParameter("telefono");
    String nacimiento =request.getParameter("nacimiento");
   // String estado =request.getParameter("estado");

    if(tipo.equals("paciente")){

        subir.UsuarioPaciente(Nombre,Usuario,contra,Direccion,CUI,Telefono,Correo,nacimiento);
    }
    if(tipo.equals("medico")){
        subir.UsuarioMedico(Nombre,Usuario,contra,Direccion,CUI,Telefono,Correo,nacimiento);
    }
    if(tipo.equals("laboratorio")){
        subir.UsuarioLab(Nombre,Usuario,contra,Direccion,CUI,Telefono,Correo,nacimiento);
    }

    }
}
