<?php
include("lib/conexao.php");
include("lib/enviar_arquivo.php");
include('lib/protect.php');
protect(1);
$id = intval($_GET['id']);
if(isset($_POST['enviar'])) {

    $nome = $mysqli->escape_string($_POST['nome']);
    $email = $mysqli->escape_string($_POST['email']);
    $senha = $mysqli->escape_string($_POST['senha']);
    $rsenha = $mysqli->escape_string($_POST['rsenha']);
    $admin = $mysqli->escape_string($_POST['admin']);

    $erro = array();
    if(empty($nome))
        $erro[] = "Preencha o nome";

    if(empty($email))
        $erro[] = "Preencha o e-mail";

    if($rsenha != $senha)
        $erro[] = "As senhas não batem";

    if(count($erro) == 0) {

        $sql_code = "UPDATE usuarios 
        SET nome = '$nome',
        email = '$email',
        admin = '$admin'
        WHERE id = '$id'";

        if(!empty($senha)) {
            $senha = password_hash($senha, PASSWORD_DEFAULT);
            $sql_code = "UPDATE usuarios 
            SET senha = '$senha'
            WHERE id = '$id'";
        }

        $mysqli->query($sql_code) or die($mysqli->error);
        die("<script>location.href=\"index.php?p=gerenciar_usuarios\";</script>");

    }
}

$sql_query = $mysqli->query("SELECT * FROM usuarios WHERE id = '$id'") or die($mysqli->error);
$usuario = $sql_query->fetch_assoc();

?>

<h4>Cadastrar Usuário</h4>
<span>Preencha as informações e clique em Salvar</span>

<p>
    <a href="index.php?p=gerenciar_usuarios">
        Gerenciar Usuário
    </a>
</p>

<?php if(isset($erro) && count($erro) > 0) {
    ?>
    <div class="alert alert-danger" role="alert">
        <?php foreach($erro as $e) { echo "$e<br>"; } ?>
    </div>
    <?php
}
?>

<div class="card">
    <div class="card-header">
        <h5>Formulário de Cadastro</h5>
    </div>
    <div class="card-block">
        <form action="" method="POST">
            <div class="row">
                <div class="col-lg-4">
                    <div class="form-group">
                        <label for="">Nome</label>
                        <input type="text" value="<?php echo $usuario['nome']; ?>" name="nome" class="form-control">
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="form-group">
                        <label for="">E-mail</label>
                        <input type="text" value="<?php echo $usuario['email']; ?>" name="email" class="form-control">
                    </div>
                </div>

                <div class="col-lg-4">
                    <div class="form-group">
                        <label for="">Senha</label>
                        <input type="text" name="senha" class="form-control">
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="form-group">
                        <label for="">Repita a senha</label>
                        <input type="text" name="rsenha" class="form-control">
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="form-group">
                        <label for="">Tipo</label>
                        <select name="admin" class="form-control">
                            <option  value="0">Usuário</option>
                            <option <?php if($usuario['admin']) echo 'selected'; ?> value="1">Admin</option>
                        </select>
                    </div>
                </div>

                <div class="col-lg-12">
                    <a href="index.php?p=gerenciar_usuarios" class="btn btn-primary btn-round"><i class="ti-arrow-left"></i> Voltar</a>
                    <button type="submit" name="enviar" value="1" class="btn btn-success btn-round float-right"><i class="ti-save"></i> Salvar</button>
                </div>
            </div>
        </form>

    </div>
</div>