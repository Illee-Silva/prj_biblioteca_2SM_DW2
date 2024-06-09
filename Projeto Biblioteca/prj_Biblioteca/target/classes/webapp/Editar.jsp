<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BTC Library</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/MainPage/Index.css">
    <script src="${pageContext.request.contextPath}/MainPage/index.js" defer></script>
</head>
<body>

<!-- Website Header -->
<div class="header">
    <div class="dropdown" data-dropdown>
        <button class="link DropdownButton" data-dropdown-button>☰ Menu</button>
        <div class="dropdown-menu information-grid">

            <div class="dropdown-section">

                <div class="dropdown-links">
                    <h3 class="LinkLabel">Livros</h3>
                    <a href="CadastrarAutor.jsp" class="link">Cadastrar Autor</a>
                    <a href="CadastrarEditora.jsp" class="link">Cadastrar Editora</a>
                    <a href="CadastrarLivro.jsp" class="link">Cadastrar Livros</a>
                    <a href="" class="link">Exibir</a>
                    <a href="" class="link">Deletar</a>
                </div>

            </div>

            <div class="dropdown-section">

                <div class="dropdown-links">
                    <h3 class="LinkLabel">Funcionarios</h3>
                    <a href="CadastrarFuncionario.jsp" class="link">Funcionario</a>
                    <a href="CadastrarCliente.jsp" class="link">Cliente</a>
                    <a href="CadastrarEmprestimo.jsp" class="link">Emprestimo</a>
                </div>

            </div>

        </div>
    </div>
    <h3 class="link"> Bruce The Cat</h3>
</div>

<!-- BackGround LOGO  -->

<div class="MainDiv">

    <!-- Div da Logo -->
    <div class="LogoDiv">
        <img src="${pageContext.request.contextPath}/MainPage/images/Logo.png" alt="teste" class="Logo">
    </div>

    <!-- Div de Conteudo -->
    <div class="ContentDiv">
        <form class="form" method="post" action="svlt_editar">
            <h2>Atualizar Cliente</h2>
            <div class="form-control">
                <label for="ID_Cliente">ID do Cliente:</label>
                <input type="text" id="ID_Cliente" name="ID_Cliente" required><br><br>
            </div>

            <div class="form-control">
                <label for="Nome">Nome:</label>
                <input type="text" id="Nome" name="Nome" required><br><br>
            </div>

            <div class="form-control">
                <label for="CPF">CPF:</label>
                <input type="text" id="CPF" name="CPF" required><br><br>
            </div>

            <div class="form-control">
                <label for="Telefone">Telefone:</label>
                <input type="text" id="Telefone" name="Telefone" required><br><br>
            </div>

            <div class="form-control">
                <<label for="Endereco">Endereço:</label>
                <input type="text" id="Endereco" name="Endereco" required><br><br>
            </div>

            <button type="submit">Editar</button>
        </form>
    </div>

</div>

<div class="Footer">
    <p class="txt_footer">Biblioteca Projeto P2 | Bruce The Cat | Todos os Direitos Reservados | Direitos Sobre o Gato(Talícia Pessoa)</p>
</div>


</body>
</html>