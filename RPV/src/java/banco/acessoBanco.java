package banco;

import java.sql.*;

/**
 * 
 * @author Matheus
 */
import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public final class acessoBanco {
    
    private static Statement stm;
    private static boolean aux = false;
   // private static String JBDC_DRIVER = "org.Mysql.Driver";
//	private static String DATABASE_URL = "jdbc:mysql://localhost:5432/login";
    static String JBDC_DRIVER = "com.mysql.jdbc.Driver";
	static String DATABASE_URL = "jdbc:mysql://localhost:3306/rpv";
	private static String usuario = "root";
	private static String senha = "root";
	private static Connection con;
    
    public acessoBanco (String dataBaseURL, String usuario, String senha){
        
       /* this.dataBaseURL = dataBaseURL;
        this.usuario = usuario;
        this.senha = senha;
        */
    	
        if (aux) {
        	
    		System.out.println("Objeto j� foi criado!");
            System.exit(0);
            
        }
        aux = true;

    }

    acessoBanco() {
        
    }

    public void setUsuario(String usuario) {
        
        this.usuario = usuario;
    }

    public String getUsuario() {
        
        return this.usuario;
    }

    public void setSenha(String senha) {
        
        this.senha = senha;
    }

    public String getSenha() {
        
        return this.senha;
    }

    /**
     * Realiza conex�o com um banco de dados PostGres.
     * @return true se a conex�o foi realizado com sucesso, ou false caso contr�rio.
     */
    public static boolean connect() {
        
        try{
        	
            Class.forName(JBDC_DRIVER).getInterfaces();
            
            con = DriverManager.getConnection(DATABASE_URL, usuario, senha);
            
            
            return true;
            
        }catch (SQLException sqle){
            
            System.err.println("N�o foi poss�vel a conex�o com o Banco de Dados");
            sqle.printStackTrace();
            return false;
        }catch (ClassNotFoundException cnfe){
            
            cnfe.printStackTrace();
            return false;
        }
        
    }

    /**
     * Encerra a conex�o com o banco de dados.
     * @return true se a desconex�o foi conclu�da com sucesso, ou false caso contr�rio.
     */ 
    public static boolean disconnect() {
        
        try{
            
            con.close();
            return true;
        }catch (SQLException sqle){
            
            System.err.println("N�o foi poss�vel encerrar a conex�o");
            sqle.printStackTrace();
            return false;
        }
    }

    /**
     * Conecta-se ao banco de dados e executa uma instru��o SQL de consulta ao banco de dados.
     * Conclu�da com sucesso ou n�o a consulta, a conex�o com o banco de dados encerrada.
     * @param sql - Instru��o SQL de consulta ao banco de dados.
     * @return Um objeto ResultSet contendo os dados obtidos pela consulta.
     */
    public static ResultSet ListarBanco(String sql) {
        
        connect();
        try{
            
            stm = con.createStatement();
            ResultSet result = stm.executeQuery(sql);
            System.out.println("Logado com suscesso!");
            return result;
            
        }catch (SQLException sqle){
            
            System.err.println("SQL Inv�lido");
            sqle.printStackTrace();;
            return null;
        }
    }
    
    public static Connection conexaoRel() {
    	connect();
    	
    	return con;
    }

    /**
     * Conecta-se ao banco de dados e executa instru��es SQL sobre o mesmo.
     * Permite executar as instru��es insert, update e delete.
     * Tendo sida executada com sucesso a instru��o ou n�o a conex�o com o banco de dados � encerrada.
     * @param sql Instru��o SQL a ser executada.
     * @return true se a instru��o foi executada com sucesso ou false caso contr�rio.
     */
    public static  boolean AdicionarComandoNoBanco(String sql) {
        
        connect();
        try{
            
            stm = con.createStatement();
            stm.executeUpdate(sql);
            System.out.println("sql->"+sql);
            return true;
        } catch (SQLException sqle){
            
            System.err.println("SQL Inv�lida");
            sqle.printStackTrace();;
            return false;
        } finally{
            
            disconnect();
        }
    }

  
}
