package banco;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;


public class Arquivos extends JDBC {

    public static final int PROJETO = 0;
    public static final int ATA1 = 1;
    public static final int ATA2 = 2;

    /**
     *
     * @param idProjeto int, numero de identificação do projeto do qual deseja
     * @return arquivo que estava no banco de dados, <i>null</i> caso arquivo
     * não seja encontrado, e FileError caso concontre erro na conexão
     */
    public File resgatarArquivo(int idArquivo) {
        File f = null;
        try {
            connect();

            Statement com = con.createStatement();
            ResultSet rs = com.executeQuery(
                    "SELECT * FROM rpv.arquivos WHERE idarquivos = "
                    + idArquivo);
            if (rs.next()) {
                byte[] bytes = rs.getBytes("dados");
                String nome = rs.getString("nome");
                f = new File("C:/temp/" + nome);
                FileOutputStream fos = new FileOutputStream(f);
                fos.write(bytes);
                fos.close();
            }
        } catch (Exception e) {
            disconnect();
            return null;
        } finally {
            disconnect();
        }
        return f;
    }

    public boolean inserirArquivo(int idProjeto, File f, int tipo) {
        try {
            connect();
            
            String coluna = "";
            
            switch (tipo) {
                case PROJETO:
                    coluna = "arquivos_idarquivos";
                    break;
                case ATA1:
                    coluna = "ata1_idarquivos";
                    break;
                case ATA2:
                    coluna = "ata2_idarquivos";
                    break;
            }
            ResultSet rs = con.createStatement().executeQuery("SELECT "+coluna+" FROM rpv.projeto WHERE idprojeto = " + idProjeto);
            if (rs.next()) {
                int id = rs.getInt(coluna);

                PreparedStatement com;

                if (id != 0) {
                    com = con.prepareStatement("UPDATE rpv.arquivos SET nome = ?, dados = ? WHERE idarquivos = " + id);
                } else {
                    com = con.prepareStatement("INSERT INTO rpv.arquivos(nome, dados) VALUES (?, ?)");
                }

                com.setString(1, f.getName());
                com.setBytes(2, getBytes(f));

                com.execute();

                
                if (id == 0) {
                    com.execute("UPDATE rpv.projeto SET "+coluna+" = last_insert_id() WHERE idprojeto = " + idProjeto);
                }
            }

            disconnect();
            return true;

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            disconnect();
        }
        return false;
    }
    public boolean inserirEdital(String nome, int eixo,Date inicio,Date fim,int idEdital, File f, int tipo) throws IOException {
        String name = f.getName();
        byte[] b = getBytes(f);
        try {
            SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
           
            acessoBanco banco = new acessoBanco();
            
            PreparedStatement com;
            
           banco.AdicionarComandoNoBanco("INSERT INTO rpv.arquivos(nome, dados) VALUES ('"+name+"', '"+getBytes(f)+"')");
            
           banco.AdicionarComandoNoBanco("insert into rpv.edital(nomeEdital,dataInicioEdital,dataFimEdital,eixo_ideixo,arquivos_idarquivos) "
                   +                                    "values ('"+nome+"','"+formater.format(inicio)+"','"+formater.format(fim)+"',"+eixo+",(select max(idarquivos) from arquivos))");
                   

               // com.setString(1, f.getName());
               // com.setBytes(2, getBytes(f));

                

              disconnect();
            return true;  
                
            

            

        } catch (Exception ex) {
            ex.printStackTrace();
            
            
        } finally {
            
        }
        return false;
    }

    private byte[] getBytes(File f) throws IOException {
        InputStream is = new FileInputStream(f);
        byte[] bytes = new byte[(int) f.length()];
        int offset = 0;
        int numRead = 0;
        while (offset < bytes.length
                && (numRead = is.read(bytes, offset, bytes.length - offset)) >= 0) {
            offset += numRead;
        }
        return bytes;
    }
}
