package servlets;

import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;


@WebServlet(name = "svlt_editar", value = "/svlt_editar")
public class svlt_editar extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("ID_Cliente");
        String nome = request.getParameter("Nome");
        String cpf = request.getParameter("CPF");
        String telefone = request.getParameter("Telefone");
        String endereco = request.getParameter("Endereco");

        String url = "jdbc:mariadb://localhost:3306/prj_biblioteca";
        String user = "root";
        String password = "";

        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            Class.forName("org.mariadb.jdbc.Driver");
            connection = DriverManager.getConnection(url, user, password);

            String sql = "UPDATE cliente SET Nome = ?, CPF = ?, Telefone = ?, Endereco = ? WHERE ID_Cliente = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, nome);
            preparedStatement.setString(2, cpf);
            preparedStatement.setString(3, telefone);
            preparedStatement.setString(4, endereco);
            preparedStatement.setString(5, id);

            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected > 0) {
                request.setAttribute("message", "Cliente atualizado com sucesso!");
            } else {
                request.setAttribute("message", "Cliente não encontrado!");
            }

            RequestDispatcher dispatcher = request.getRequestDispatcher("Editar.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Erro ao atualizar dados: " + e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
            dispatcher.forward(request, response);
        } finally {
            try {
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }
    }
}