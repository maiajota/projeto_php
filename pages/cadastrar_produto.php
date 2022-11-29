<?php
include("lib/conexao.php");
include("lib/enviar_arquivo.php");
include('lib/protect.php');
protect(1);


if(isset($_POST['nome'])) {

    $nome = $mysqli->escape_string($_POST['nome']);
    $descricao = $mysqli->escape_string($_POST['descricao']);
    $preco = $mysqli->escape_string($_POST['preco']);
    $estoque = $mysqli->escape_string($_POST['estoque']);
    $categoria = $mysqli->escape_string($_POST['categoria']);
    
    $erro = array();
    if(empty($nome))
        $erro[] = "Preencha o nome do produto";
    
    if(empty($descricao))
        $erro[] = "Preencha a descrição";

    if(empty($preco))
        $erro[] = "Preencha o preço";

    if(!isset($_FILES) || !isset($_FILES['imagem']) || $_FILES['imagem']['size'] == 0)
        $erro[] = "Selecione uma imagem para o conteúdo";

    if(count($erro) == 0) {

        $deu_certo = enviarArquivo($_FILES['imagem']['error'], $_FILES['imagem']['size'], $_FILES['imagem']['name'], $_FILES['imagem']['tmp_name']);
        if($deu_certo !== false) {

            $sql_code = "INSERT INTO produtos (nome, descricao, valor, data_cadastro, imagem, estoque, categoria) VALUES(
                '$nome',
                '$descricao',
                '$preco',
                NOW(),
                '$deu_certo',
                '$estoque',
                '$categoria'
            )";
            $inserido = $mysqli->query($sql_code);
            if(!$inserido)
                echo "Falha ao inserir no banco de dados: " . $mysqli->error;
            else {
                die("<script>location.href=\"index.php?p=gerenciar_produtos\";</script>");
            }

        } else 
            $erro[] = "Falha ao enviar a imagem";

    }
}

?>
<div class="page-wrapper">
    <div class="content-box">
        <form action="" method="POST" enctype="multipart/form-data">
            <p>
                Nome do produto: 
                <input type="text" name="nome">
            </p>
            <p>
                Descrição: 
                <textarea name="descricao" cols="30" rows="10" required></textarea>
            </p>
            <p>
                Preço: 
                <input type="number" min="0.00" max="10000.00" step="0.01" name="preco"/>
            </p>
            <p>
                Imagem: 
                <input type="file" name="imagem">
            </p>
            <p>
                Estoque: 
                <input type="number" name="estoque" step="1">
            </p>
            <p>
                Categoria: 
                <select name="categoria">
                    <option value=""></option>
                    <option value="destaque">Destaque</option>
                    <option value="lancamento">Lancamento</option>
                    <option value="pre-venda">pre-venda</option>
                </select>
            </p>
            <?php if(isset($erro) && count($erro) > 0) {
                ?>
                <div class="alert alert-danger" role="alert">
                    <?php foreach($erro as $e) { echo "$e<br>"; } ?>
                </div>
                <?php
            }
            ?>
            
            <input type="submit" value="enviar">
        </form>
    </div>
</div>