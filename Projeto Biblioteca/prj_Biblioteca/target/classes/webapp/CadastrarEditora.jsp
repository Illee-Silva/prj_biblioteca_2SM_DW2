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
                    <a href="CadastrarEditora.jsp.jsp" class="link">Cadastrar Editora</a>
                    <a href="CadastrarLivro.jsp" class="link">Cadastrar Livros</a>
                    <a href="" class="link">Exibir</a>
                    <a href="" class="link">Deletar</a>
                </div>

            </div>

            <div class="dropdown-section">

                <div class="dropdown-links">
                    <h3 class="LinkLabel">Funcionarios</h3>
                    <a href="" class="link">Funcionario</a>
                    <a href="" class="link">Funcionario</a>
                    <a href="" class="link">Funcionario</a>
                </div>

            </div>


        </div>
    </div>

    <a href="MainPage/index.jsp">
        <h3 class="link"> Bruce The Cat</h3>
    </a>

</div>

<!-- BackGround LOGO  -->

<div class="MainDiv">

    <!-- Div da Logo -->
    <div class="LogoDiv">
        <img src="${pageContext.request.contextPath}/MainPage/images/Logo.png" alt="teste" class="Logo">
    </div>

    <!-- Div de Conteudo -->
    <div class="ContentDiv">
        <form class="form" method="post" action="processa_formulario.php">
            <div class="form-control">
                <label>Nome da Editora</label>
                <input type=text name=nome placeholder="Digite o nome da Editora..." />
            </div>

            <div class="form-control">
                <label>Ano da Fundação</label>
                <input type=date name=dataNascimento placeholder="Digite sua data de nascimento..." />
            </div>

            <div class="form-control">
                <label>Principal Publicação</label>
                <input type=text name=contato placeholder="Digite a obra da editora..." />
            </div>

            <button type="submit">Cadastrar</button>
        </form>
    </div>

</div>

<div class="Footer">
    <p class="txt_footer">Biblioteca Projeto P2 | Bruce The Cat | Todos os Direitos Reservados | Direitos Sobre o Gato(Talícia Pessoa)</p>
</div>


</body>
</html>