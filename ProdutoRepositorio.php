<?php
class ProdutoRepositorio
{
    private $conn; // Sua conexão com o banco de dados
    public function __construct($conn)
    {
        $this->conn = $conn;
    }
    public function cadastrar(Produto $produto)
    {

        $sql = "INSERT INTO produtos (tipo, 
    nome, descricao, imagem, preco) VALUES (?,?,?,?,?)";
        $stmt = $this->conn->prepare($sql);
        $stmt->bind_param(
            "ssssd",
            $produto->getPrato(),
            $produto->getIngredientes(),
            $produto->getImagem(),
            $produto->getValor()
        );
       // Executa a consulta preparada e verifica o sucesso
       $success = $stmt->execute();

       // Fecha a declaração
       $stmt->close();

       // Retorna um indicador de sucesso
       return $success;
    }

    public function listarPrato()
    {
        $sql = "SELECT * FROM produtos where 'Prato' ORDER BY valor";
        $result = $this->conn->query($sql);

        $produtos = array();

        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $produto = new Produto(
                    $row['id'],
                    $row['prato'],
                    $row['ingredientes'],
                    $row['imagem'],
                    $row['valor']
                );
                $produtos[] = $produto;
            }
        }

        return $produtos;
    }
    public function atualizarProduto(Produto $produto)
    {
        $imagem = $produto->getImagem();
        if (empty($imagem)) {
            // Prepara a declaração SQL
            $sql = "UPDATE produtos SET tipo = ?, nome = ?,
            descricao = ?,  preco = ? WHERE id = ?";
            $stmt = $this->conn->prepare($sql);

            // Extrai os atributos do objeto Produto
            $prato = $produto->getPrato();
            $ingredientes = $produto->getIngredientes();
            $valor = $produto->getValor();
            $id = $produto->getId();

            // Vincula os parâmetros
            $stmt->bind_param(
                'sssdi',
                $prato,
                $ingredientes,
                $valor,
                $id
            );

            // Executa a declaração preparada
            $resultado = $stmt->execute();

            // Fecha a declaração
            $stmt->close();

            return $resultado;
        } else {
            // Prepara a declaração SQL
            $sql = "UPDATE produtos SET prato = ?,
            ingredientes = ?, imagem = ?, valor = ? WHERE id = ?";
            $stmt = $this->conn->prepare($sql);

            // Extrai os atributos do objeto Produto
        
            $produto->getPrato();
            $ingredientes = $produto->getIngredientes();
            $valor = $produto->getValor();
            $imagem = $produto->getImagem();
            $id = $produto->getId();

            // Vincula os parâmetros
            $stmt->bind_param(
                'ssssdi',
                $prato,
                $ingredientes,
                $valor,
                $id
            );
            // Executa a declaração preparada
            $resultado = $stmt->execute();

            // Fecha a declaração
            $stmt->close();

            return $resultado;
        }
    }

    public function listarPratoPorId($id)
    {
        $sql = "SELECT * FROM produtos WHERE prato
            AND id = ? ORDER BY preco LIMIT 1";

        // Prepara a declaração SQL
        $stmt = $this->conn->prepare($sql);

        // Vincula o parâmetro
        $stmt->bind_param('i', $id);

        // Executa a consulta preparada
        $stmt->execute();

        // Obtém os resultados
        $result = $stmt->get_result();

        $produto = null;

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();

            $produto = new Produto(
                $row['id'],
                $row['prato'],
                $row['ingredientes'],
                $row['valor'],
                $row['imagem']
                
            );
        }

        // Fecha a declaração
        $stmt->close();

        return $produto;
    }
   

    public function excluirProdutoPorId($id)
    {
        $sql = "DELETE FROM produtos WHERE  
             id = ?";

        // Prepara a declaração SQL
        $stmt = $this->conn->prepare($sql);

        // Vincula o parâmetro
        $stmt->bind_param('i', $id);

        // Executa a consulta preparada
        $success = $stmt->execute();

        // Fecha a declaração
        $stmt->close();

        return $success;
    }



    public function buscarTodos()
    {
        $sql = "SELECT * FROM produtos ORDER BY tipo, preco";
        $result = $this->conn->query($sql);

        $produtos = array();

        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $produto = new Produto(
                    $row['id'],
                    $row['prato'],
                    $row['ingredientes'],$row['valor'],
                    $row['imagem']
                    
                );
                $produtos[] = $produto;
            }
        }

        return $produtos;
    }
}
