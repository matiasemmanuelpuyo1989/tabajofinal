
package ventasdao.controladores;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import ventasdao.dominio.Conexion;
import ventasdao.objetos.Categoria;
import ventasdao.objetos.Cliente;
import ventasdao.objetos.Factura;
import ventasdao.objetos.LineaFactura;
import ventasdao.objetos.Producto;

/**
 *
 * @author hchanampe
 */
public class LineaFacturaControlador implements ICrud<LineaFactura>{
    private Connection connection;
    
    private Statement stmt;
    
    private PreparedStatement ps;
    
    private ResultSet rs;
    
    private String sql;

    @Override
    public boolean crear(LineaFactura entidad) throws SQLException, Exception {
         connection = Conexion.obtenerConexion ();
         String sql = "INSERT INTO cantidad_productos (cantidad, id_factura, id_producto) VALUES (?,?,?)";
        
        try {
            ps = connection.prepareStatement(sql);
            ps.setDouble(1,entidad.getCantidad());
            ps.setInt(2, entidad.getFactura().getId());
            ps.setInt(3, entidad.getProducto().getId());
            ps.executeUpdate();
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(CategoriaControlador.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public boolean eliminar(LineaFactura entidad) throws SQLException, Exception {
                try {
            connection = Conexion.obtenerConexion ();
            this.sql = "DELETE FROM cantidad_factura WHERE id=?";

            ps = connection.prepareStatement(sql);
            ps.setInt(1, entidad.getId());

            ps.execute();
            connection.close();
            return true;
        } catch (SQLException ex) {
            //notifyListeners(ex.getMessage());
            //Logger.getLogger(CategoriaControlador.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public LineaFactura extraer(int id) throws SQLException, Exception {
            connection = Conexion.obtenerConexion();
            sql = "SELECT * FROM cantidad_facturas LEFT JOIN productos ON productos.id = cantidad_productos.id_producto LEFT JOIN facturas ON facturas.id= cantidad_productos=id_producto WHERE cantidad_productos.id = ?";
            ps = connection.prepareStatement(sql);
            
            ps.setInt(1, id);
            
            
            this.rs   = ps.executeQuery();
            
            connection.close();
            
            this.rs.next();
            
            Producto producto = new Producto();                
            producto.setNombre(rs.getString("nombre"));
            producto.setDescripcion(rs.getString("descripcion"));
            producto.setId(rs.getInt("productos.id"));
            producto.setPrecio (rs.getFloat("precio"));
            producto.setFechaCreacion(rs.getDate("fecha_creacion"));
            producto.setCategoriaId(rs.getInt("categoria_id"));
            
            Factura factura = new Factura();
            factura.setId(rs.getInt("factura.id"));
            factura.setDate(rs.getDate("Date"));
            factura.setObservacion(rs.getString("Observacion"));
            factura.setTotal(rs.getDouble("Total")); 
            
            LineaFactura lineaFactura = new LineaFactura();
            lineaFactura.setId(rs.getInt("cantidad_productos.id"));
            lineaFactura.setCantidad(rs.getDouble("cantidad"));
            lineaFactura.setFactura(factura);
            lineaFactura.setProducto(producto);
           
                    
            
            return lineaFactura;
    }

    @Override
    public boolean modificar(LineaFactura entidad) throws SQLException, Exception {
       connection = Conexion.obtenerConexion ();
       this.sql = "UPDATE cantidad_productos SET cantidad=?, id_producto=?, id_factura=? WHERE id=?";
        
       ps = connection.prepareStatement(sql);
       ps.setDouble(1, entidad.getCantidad());
       ps.setInt(2, entidad.getProducto().getId());
       ps.setInt(3, entidad.getFactura().getId());
       ps.setInt(4, entidad.getId());
       ps.executeUpdate();
       connection.close();
       return true;
    }

    @Override
    public ArrayList<LineaFactura> listar() throws SQLException, Exception {
     System.out.println("Listando");    
     connection = Conexion.obtenerConexion ();
        try{
            
            this.stmt = connection.createStatement();
            this.sql = "SELECT * FROM cantidad_facturas LEFT JOIN productos ON productos.id = cantidad_productos.id_producto LEFT JOIN facturas ON facturas.id= cantidad_productos=id_producto";
            this.rs   = stmt.executeQuery(sql);
            connection.close();
            
            ArrayList<LineaFactura> lineasFacturas = new ArrayList();
            
            while(rs.next()){                
                Producto producto = new Producto();                
                producto.setNombre(rs.getString("nombre"));
                producto.setDescripcion(rs.getString("descripcion"));
                producto.setId(rs.getInt("productos.id"));
                producto.setPrecio (rs.getFloat("precio"));
                producto.setFechaCreacion(rs.getDate("fecha_creacion"));
                producto.setCategoriaId(rs.getInt("categoria_id"));

                Factura factura = new Factura();
                factura.setId(rs.getInt("factura.id"));
                factura.setDate(rs.getDate("Date"));
                factura.setObservacion(rs.getString("Observacion"));
                factura.setTotal(rs.getDouble("Total")); 

                LineaFactura lineaFactura = new LineaFactura();
                lineaFactura.setId(rs.getInt("cantidad_productos.id"));
                lineaFactura.setCantidad(rs.getDouble("cantidad"));
                lineaFactura.setFactura(factura);
                lineaFactura.setProducto(producto);
                
                lineasFacturas.add(lineaFactura);                
            }
            //System.out.println(cont);
            //connection.close();
            return lineasFacturas;
        } catch(SQLException ex){
            ex.printStackTrace();
        }
        return null;
    }
    
}
