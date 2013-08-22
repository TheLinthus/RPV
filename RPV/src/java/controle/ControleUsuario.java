package controle;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;

public class ControleUsuario {
	
	private static Usuario usuarioAtual;
	
	
	public static Usuario criarUsuario(String nome, String login, String senha){
		Usuario usuario = new Usuario();
		
		
		return usuario;
		
	}
	
	public static void addUsuario(String nome, String login, String senha){
		Registro.addUsuario(criarUsuario(nome, login, senha));
	}
	
	public static void removerUsuario(String nome){
		Registro.removerUsuario(nome);
	}

	public static void setUsuarioAtual(Usuario usuarioAtual) {
		ControleUsuario.usuarioAtual = usuarioAtual;
	}

	public static Usuario getUsuarioAtual() {
		return usuarioAtual;
	}
	
	public static boolean logIn(String login, String senha) throws SQLException, ParseException{
		return false;// Registro.logIn(login, senha);
	}

}
