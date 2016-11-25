package sgr;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class AlterarProdutoDao {
	
	private static final String URL = "jdbc:derby:bd;create=true";
	
	public static void alterar(int codigo, String nomeProduto, double valor,
                               int quantidadePessoas, String contem) throws SQLException {
		// Abrir uma conexão com o banco de dados.
		Connection conn = DriverManager.getConnection(URL);
		// Executar instrução SQL.
		String sql = "update produto set nome_produto = ?, valor = ?," +
                " quantidade_pessoas = ?, contem = ?  where codigo = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		//Passa as informações para a instrução SQL.
		pstmt.setString(1, nomeProduto);
		pstmt.setDouble(2, valor);
		pstmt.setInt(3, quantidadePessoas);
		pstmt.setString(4, contem);
		pstmt.setInt(5, codigo);
		pstmt.executeUpdate();
		// Fechar sentença.
		pstmt.close();
		// Fechar conexão.
		conn.close();
	}
}