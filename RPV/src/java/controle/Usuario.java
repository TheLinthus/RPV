package controle;

import java.util.ArrayList;



/**
 * @author Mk
 *
 */
public class Usuario {
	
	
 
	private String nome;
	 
	private ArrayList<Informacao> informacoes;
	 
	private String senha;
	
	private String login;
	
	
	public String getNome() {
		return nome;
	}

	public ArrayList<Informacao> getInformacoes() {
		return informacoes;
	}

	

	public void setNome(String nome) {
		this.nome = nome;
	}

	public void setInformacoes(ArrayList<Informacao> informacoes) {
		this.informacoes = informacoes;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public String getSenha() {
		return senha;
	}





	public void setLogin(String login) {
		this.login = login;
	}





	public String getLogin() {
		return login;
	}
	
	
	 
}
 
