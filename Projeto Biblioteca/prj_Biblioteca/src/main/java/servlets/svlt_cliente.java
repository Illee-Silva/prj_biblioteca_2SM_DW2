package servlets;

import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "svlt_cliente", value = "/svlt_cliente")
public class svlt_cliente extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{

        String Nome_Cliente = request.getParameter("nome");
        String CPF = request.getParameter("cpf");
        String Telefone = request.getParameter("telefone");
        String endereco = request.getParameter("endereco");


        try{
            Class.forName("org.mariadb.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mariadb://localhost:3306/prj_biblioteca", "root", "");

            PreparedStatement preparedStatement = connection.prepareStatement(
                    "INSERT INTO cliente(CPF, Telefone, Endereco, Nome) VALUES (?, ?, ?, ?)");

            preparedStatement.setString(4, Nome_Cliente);
            preparedStatement.setString(1, CPF);
            preparedStatement.setString(2, Telefone);
            preparedStatement.setString(3, endereco);

            preparedStatement.executeUpdate();
            preparedStatement.close();

        }catch(Exception e){
            e.printStackTrace();
        }

        response.sendRedirect("/Biblioteca");
    }
}