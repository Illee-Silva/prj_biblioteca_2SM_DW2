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
                    <a href="" class="link">Cadastrar Autor</a>
                    <a href="" class="link">Cadastrar Editora</a>
                    <a href="" class="link">Cadastrar Livros</a>
                    <a href="" class="link">Exibir</a>
                    <a href="" class="link">Deletar</a>
                </div>

            </div>

            <div class="dropdown-section">

                <div class="dropdown-links">
                    <h3 class="LinkLabel">Cadastrar Funcionarios</h3>
                    <a href="" class="link">Cadastrar Clientes</a>
                    <a href="" class="link">Funcionario</a>
                    <a href="" class="link">Funcionario</a>
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
        <form class="form" method="post" action="processa_formulario.php">
            <div class="form-control">
                <label>CPF</label>
                <input type=text name=nome placeholder="Digite o CPF do cliente..." />
            </div>

            <div class="form-control">
                <label>Telefone</label>
                <input type=date name=dataNascimento placeholder="Digite o telefone de contato..." />
            </div>

            <div class="form-control">
                <label>Endereço</label>
                <input type=text name=contato placeholder="Digite o endereço do cliente..." />
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