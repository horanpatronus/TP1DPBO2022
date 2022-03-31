/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package TP1DPBO2022;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;
import javax.swing.table.DefaultTableModel;


/**
 *
 * @author Rahma Maulida
 */
public class dbConnection {
    public static Connection con;
    public static Statement stm;
    
    public void connect(){//untuk membuka koneksi ke database
        try {
            String url = "jdbc:mysql://localhost/db_book";
            String user = "root";
            String pass = "";
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url,user,pass);
            stm = con.createStatement();
            System.out.println("koneksi berhasil;");
        } catch (Exception e) {
            System.err.println("koneksi gagal" +e.getMessage());
        }
    }
    
    public DefaultTableModel readTable(int mode){
        
        DefaultTableModel dataTabel = null;
        try{
            Object[] column = null;
            String sql = "";
            if(mode == 1){
                Object[] temp = {"No", "Title", "Photo", "Publisher", "Description"};
                column = temp;
                String tempSql = "Select title, photo_name, publisher, description from books";
                sql = tempSql;
            }
            else {
                Object[] temp = {"No", "Name", "Photo", "Nationality", "Book Count"};
                column = temp;
                String tempSql = "select name, photo_name, nationality, book_count from author";
                sql = tempSql;
            }
            
            connect();
            dataTabel = new DefaultTableModel(null, column);
            ResultSet res = stm.executeQuery(sql);
            
            int no = 1;
            while(res.next()){
                Object[] hasil = new Object[5];
                hasil[0] = no;
                if(mode == 1){
                    hasil[1] = res.getString("title");
                    hasil[2] = res.getString("photo_name");
                    hasil[3] = res.getString("publisher");
                    hasil[4] = res.getString("description");
                }
                else{
                    hasil[1] = res.getString("name");
                    hasil[2] = res.getString("photo_name");
                    hasil[3] = res.getString("nationality");
                    hasil[4] = res.getString("book_count");
                    
                }
                
                no++;
//                System.out.print(hasil[1]);
                dataTabel.addRow(hasil);
            }
        }catch(Exception e){
            System.err.println("Read gagal " +e.getMessage());
        }
        
        return dataTabel;
    }
    
    public void Query(String inputan){
        
        try{
            connect();
            String sql = inputan;
            stm.execute(sql);
            
        }catch(Exception e){
            System.err.println("Read gagal " +e.getMessage());
        }
        
    }
}
