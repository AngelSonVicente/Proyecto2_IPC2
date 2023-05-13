package Web;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
@WebServlet("/LoginT_Servlet")
public class LoginT_Servlet extends HttpServlet {


    private datosBD datos;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        datos = new datosBD();
        datos.conectar();

        String usuarioT=request.getParameter("usuarioT");
        String passwordT=request.getParameter("passwordT");
        String Nombre="";
        String estado="";
       String  ID="";

        var out = response.getWriter();
        HttpSession session = request.getSession();
        Connection connection = (Connection) session.getAttribute("conexion");

        if(datos.isLoginUT("usuario_administrador","usuario",usuarioT,passwordT)){
            Nombre= datos.getDato("usuario_administrador","usuario","nombre",usuarioT);
           ID= datos.getDato("usuario_administrador","usuario","ID",usuarioT);
            session.setAttribute("usuario", Nombre);
           session.setAttribute("ID", ID );


            response.sendRedirect("ModuloAdministrador.jsp");


        }
        else{

            if(datos.isLoginUT("usuario_medico","usuario",usuarioT,passwordT)){

               Nombre= datos.getDato("usuario_medico","usuario","nombre",usuarioT);
           ID= datos.getDato("usuario_medico","usuario","ID",usuarioT);

            session.setAttribute("usuario", Nombre);
           session.setAttribute("ID", ID );
                estado=datos.getDato("usuario_medico","usuario","estado",usuarioT);

            //System.out.println(ID);
                if(estado.equals("Pendiente")){

                response.sendRedirect("AgregarEspecialidad.jsp");
                }else {
                response.sendRedirect("ModuloMedico.jsp");

                }






            }else{

                if(datos.isLoginUT("usuario_paciente","usuario",usuarioT,passwordT)){
                    Nombre= datos.getDato("usuario_paciente","usuario","nombre",usuarioT);
                    ID= datos.getDato("usuario_paciente","usuario","ID",usuarioT);
                    String saldo =datos.getDato("usuario_paciente","usuario","saldo",usuarioT);
                    session.setAttribute("usuario", Nombre);
                    session.setAttribute("ID", ID );
                    session.setAttribute("saldo",saldo );
                    response.sendRedirect("ModuloPaciente.jsp");



                }else{
                    if(datos.isLoginUT("usuario_laboratorio","usuario",usuarioT,passwordT)){
                        Nombre= datos.getDato("usuario_laboratorio","usuario","nombre",usuarioT);
                        ID= datos.getDato("usuario_laboratorio","usuario","ID",usuarioT);
                        String saldo =datos.getDato("usuario_laboratorio","usuario","saldo",usuarioT);
                        session.setAttribute("usuario", Nombre);
                        session.setAttribute("ID", ID );
                        session.setAttribute("saldo",saldo );

                        estado=datos.getDato("usuario_laboratorio","usuario","estado",usuarioT);
                        if(estado.equals("Pendiente")){

                        response.sendRedirect("AgregarExamenes.jsp");

                        }else{

                        response.sendRedirect("ModuloLaboratorio.jsp");
                        }


                    }else{


            request.setAttribute("error", "Usuario o contraseña Incorrecta");
            request.getRequestDispatcher("Login.jsp").forward(request,response);

                    }






                }





            }




        }



    }
}
