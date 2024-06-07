package servlets;

import java.io.*;
import java.sql.*;
import java.text.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "svlt_autor", value = "/svlt_autor")
public class svlt_autor extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException{

        String Nome_Autor = request.getParameter("nome");
        String Data_Nascimento_Autor = request.getParameter("dataNascimento");
        String Telefone_Autor = request.getParameter("nacionalidade");
        String Obra_Principal_Autor = request.getParameter("obra_principal");
        String Estilo_Literario_Autor = request.getParameter("estilo_literario");


        try{
            Class.forName("org.mariadb.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mariadb://localhost:3306/prj_biblioteca", "root", "");

            PreparedStatement preparedStatement = connection.prepareStatement(
                    "INSERT INTO autor(Nome_Completo, DT_Nascimento, Nacionalidade, Principal_Obra, Estilo_literario) VALUES (?, ?, ?, ?, ?)");

            preparedStatement.setString(1, Nome_Autor);
            preparedStatement.setString(2, Data_Nascimento_Autor);
            preparedStatement.setString(3, Telefone_Autor);
            preparedStatement.setString(4, Obra_Principal_Autor);
            preparedStatement.setString(5, Estilo_Literario_Autor);

            preparedStatement.executeUpdate();
            preparedStatement.close();

        }catch(Exception e){
            e.printStackTrace();
        }

        response.sendRedirect("/Biblioteca");
    }

}