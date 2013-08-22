package banco;
import java.sql.ResultSet;
import java.sql.SQLException;
import controle.Usuario;
import controle.ControleUsuario;
public class ControleUsuarioBD {
	public static void addUsuarioBD(Usuario usuario) {
		String sql = "insert into pessoa (login,senha,nome) values ('"
				+ usuario.getLogin() + "','" + usuario.getSenha() + "','"
				+ usuario.getNome() + "')";
		acessoBanco.AdicionarComandoNoBanco(sql);
	}
	public static void removerUsuarioBD(String nome) {
	}
	public static boolean realizarLogIn(String login, String senha) throws SQLException {
		 String sql = "Select * from usuario where login = '" + login + "' and senha = '" + senha + "'";
		 ResultSet resultSet = acessoBanco.ListarBanco(sql);
                 System.out.println("sql->"+sql);
                 System.out.println("resultset"+resultSet);
                 
		if(resultSet.next()){
                    return true;
                }
		 return	false;
		 /*
		
		for (Usuario usuario : TestesCriarUsuario.usuarios) {
			if (usuario.getLogin().equals(login)
					&& usuario.getSenha().equals(senha)) {
				// ControleUsuario.setUsuarioAtual(usuario);
				return usuario;
			} else {
				return null;
			}
		}
		return null;
		*/
	}public static String verificaAut(String login, String senha, String usuario) throws SQLException {
            String retorno= "";
            ResultSet resultSet = null;
            if (usuario.equals("coordenador")){
		 String sql = "Select * from usuario inner join professor on professor.usuario_idusuario = usuario.idusuario inner join coordenador on coordenador.professor_idprofessor = professor.idprofessor where usuario.login = '" + login + "' and usuario.senha = '" + senha + "'";
		 resultSet = acessoBanco.ListarBanco(sql);
                 if (resultSet.next()) {
                 retorno = resultSet.getString("professor.idprofessor");
                 }
            }
            else if(usuario.equals("professor")) {
             String sql = "Select * from usuario inner join professor on professor.usuario_idusuario = usuario.idusuario where usuario.login = '" + login + "' and usuario.senha = '" + senha + "'";
             resultSet = acessoBanco.ListarBanco(sql);
            if (resultSet.next()) {
                 retorno = resultSet.getString("professor.idprofessor");
                 }
            }
                 return retorno;
		 /*
		
		for (Usuario usuario : TestesCriarUsuario.usuarios) {
			if (usuario.getLogin().equals(login)
					&& usuario.getSenha().equals(senha)) {
				// ControleUsuario.setUsuarioAtual(usuario);
				return usuario;
			} else {
				return null;
			}
		}
		return null;
		*/
	}
}