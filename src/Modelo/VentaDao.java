/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author EDGARD INFANTE
 */
public class VentaDao {
    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement  ps;
    ResultSet rs;
    int r;
   public int RegistrarVenta(Venta v){
       String sql = "INSERT INTO venta (cliente, total, fecha) VALUES (?,?,?)";
       try{
         con = cn.getConnection();
         ps = con.prepareStatement(sql);
         ps.setString(1, v.getCliente());
         ps.setDouble(2, v.getTotal());
         ps.setString(3, v.getFecha());
         ps.execute();
         
       }catch(SQLException e){
           System.out.println(e.toString());
       }finally{
           try {
               con.close();
           }catch(SQLException e){
              System.out.println(e.toString()); 
           }
       }
       return r;
   }
   public int RegistrarDetalle(Detalle Dv){
       String sql = "INSERT INTO detalleventa (idproductos,cantidad,total, idventa) VALUES (?,?,?,?)";
       try{
         con = cn.getConnection();   
         ps = con.prepareStatement(sql);
         ps.setString(1, Dv.getCod_pro());
         ps.setInt(2, Dv.getCantidad());
         ps.setDouble(3, Dv.getPrecio());
         ps.setInt(4, Dv.getId());
         ps.execute();
        }catch(SQLException e){
           System.out.println(e.toString());
        }finally{
           try {
               con.close();
           }catch(SQLException e){
              System.out.println(e.toString()); 
           }
       }
       return r;
   }
   
   public boolean ActualizarStock(int cant, String cod){
      String sql = "UPDATE productos SET stock = ? WHERE idproductos =?";
      try{
          con = cn.getConnection();   
         ps = con.prepareStatement(sql);
         ps.setInt(1, cant);
         ps.setString(2,cod);
         ps.execute();
         return true;
      }catch (SQLException e){
          System.out.println(e.toString());  
          return false; 
      }
   }
   
   public int IdVenta(){
        int id = 0;
        String sql = "SELECT MAX(idventa) FROM venta";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                id = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e.toString());
        }
        return id;
    }
   
   public List Listarventas(){
       List<Venta> ListaVenta = new ArrayList();
       String sql = "SELECT * FROM venta";
       try {
           con = cn.getConnection();
           ps = con.prepareStatement(sql);
           rs = ps.executeQuery();
           while (rs.next()) {               
               Venta vent = new Venta();
               vent.setId(rs.getInt("idventa"));
               vent.setCliente(rs.getString("cliente"));
               vent.setFecha(rs.getString("fecha"));
               vent.setTotal(rs.getDouble("total"));
               ListaVenta.add(vent);
           }
       } catch (SQLException e) {
           System.out.println(e.toString());
       }
       return ListaVenta;
   }
   
}

