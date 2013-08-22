package controle;

import java.sql.SQLException;
import java.text.ParseException;

import controle.ControleUsuario;

import banco.ControleUsuarioBD;


public class Registro {
 

	public static void addUsuario(Usuario usuario) {
		ControleUsuarioBD.addUsuarioBD(usuario);
	}
	 
	public static void removerUsuario(String nome) {
		ControleUsuarioBD.removerUsuarioBD(nome);
	}
	 
	public void alterarUsuario(String nome) {
		
	}
	 
	public void getUsuario(String nome) {
		
	}
	
	/**
	 * Tem a funcionalidade de verificar se o usu�rio j� esta cadastrado no sistema e realizar o login no sistema caso seja confimada a sua identidade.
	 * @param login
	 * @param senha
	 * @throws SQLException
	 * @throws ParseException
	 */
        /*
	public static boolean logIn(String login, String senha) throws SQLException, ParseException{
		//Usuario usuarioLogado = ControleUsuarioBD.realizarLogIn(login, senha);
		if (usuarioLogado != null){ 
			ControleUsuario.setUsuarioAtual(usuarioLogado);
			//ControleUsuario.getUsuarioAtual().getAgenda().notificarCompromissos(Calendar.getInstance());
			//TestesAgenda.print();
			return true;
		} else {
			
			return false;
		}
		
	}
	
	
	public static void logOut(){
		ControleUsuario.setUsuarioAtual(null);
	}

	
	*/
	 
}
 
