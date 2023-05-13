/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Web;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;

/**
 *
 * @author angel
 */

@WebServlet("/indexServlet")
public class IndexServlet extends HttpServlet {
    
    
    
    


     
//     @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//   //     super.doPost(request, response); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
//
//
//   
//
//  
//    var out = response.getWriter();
//
//    String usuarioT=request.getParameter("usuarioT");
//    String passwordT=request.getParameter("passwordT");
//    
//    boolean acceder=datos.isLoginUT(usuarioT,passwordT);
//
//
//    out.print("<body>");
//    out.print("EL usuario es:" + usuarioT);
//    out.print("<br/>");
//    out.print("La contrasenia es:" + passwordT);
//    out.print("estado: "+acceder);
//    
//    out.print("</html>");
//   
//   
//   
//   
//    }

    private datosBD conexion= new datosBD();
    
   @Override
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     Connection connection =conexion.conectar();
       HttpSession sesion =request.getSession();
       sesion.setMaxInactiveInterval(3600);
       sesion.setAttribute("conexion",connection);

       response.sendRedirect("Principal.jsp");

   }

   
     
    
    
    
}
