package DAO;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;

@WebServlet(name = "ClienteDAO", value = "/ClienteDAO")
public class ClienteDAO extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        puxarDadosDB(request, response);
    }

    public void puxarDadosDB(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "jdbc:mariadb://localhost:3306/prj_biblioteca";
        String user = "root";
        String password = "";

        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

        try {
            Class.forName("org.mariadb.jdbc.Driver");
            connection = DriverManager.getConnection(url, user, password);
            statement = connection.createStatement();
            resultSet = statement.executeQuery("SELECT * FROM cliente ORDER BY ID_Cliente");

            ArrayList<String> col_ID_Cliente = new ArrayList<>();
            ArrayList<String> col_CPF = new ArrayList<>();
            ArrayList<String> col_Telefone = new ArrayList<>();
            ArrayList<String> col_Endereco = new ArrayList<>();
            ArrayList<String> col_Nome = new ArrayList<>();

            while (resultSet.next()) {
                col_ID_Cliente.add(resultSet.getString("ID_Cliente"));
                col_CPF.add(resultSet.getString("CPF"));
                col_Telefone.add(resultSet.getString("Telefone"));
                col_Endereco.add(resultSet.getString("Endereco"));
                col_Nome.add(resultSet.getString("Nome"));
            }

            request.setAttribute("ID_Cliente", col_ID_Cliente);
            request.setAttribute("CPF", col_CPF);
            request.setAttribute("Telefone", col_Telefone);
            request.setAttribute("Endereco", col_Endereco);
            request.setAttribute("Nome", col_Nome);

            RequestDispatcher dispatcher = request.getRequestDispatcher("Exibir.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            // Log error and forward to an error page or set error message
            request.setAttribute("errorMessage", "Erro ao recuperar dados: " + e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
            dispatcher.forward(request, response);
        } finally {
            try {
                if (resultSet != null) resultSet.close();
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
