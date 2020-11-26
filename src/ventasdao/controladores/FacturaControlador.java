
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

/**
 *
 * @author hchanampe
 */
public class FacturaControlador implements ICrud<Factura>{
    private Connection connection;
    
    private Statement stmt;
    
    private PreparedStatement ps;
    
    private ResultSet rs;
    
    private String sql;
    
    public Integer crearyRetornarId(Factura entidad) throws SQLException, Exception {
         connection = Conexion.obtenerConexion ();
         String sql = "INSERT INTO facturas (fecha, observacion, id_cliente, total) VALUES (?,?,?,?)";
        
        try {
           // ps = connection.prepareStatement(sql);
            ps = connection.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
            ps.setDate(1, new java.sql.Date(entidad.getDate().getTime()));
            ps.setString(2, entidad.getObservacion());
            ps.setInt(3, entidad.getCliente().getId());
            ps.setDouble(4, entidad.getTotal());
            ps.executeUpdate();
            connection.close();
            
            try (ResultSet generatedKeys = ps.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    return (int)generatedKeys.getLong(1);
                }
                else {
                    throw new SQLException("Creating user failed, no ID obtained.");
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoriaControlador.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    
    }

    @Override
    public boolean crear(Factura entidad) throws SQLException, Exception {
        
        
         connection = Conexion.obtenerConexion ();
         String sql = "INSERT INTO facturas (fecha, observacion, id_cliente, total) VALUES (?,?,?,?)";
        
        try {
            ps = connection.prepareStatement(sql);
            ps.setDate(1, new java.sql.Date(entidad.getDate().getTime()));
            ps.setString(2, entidad.getObservacion());
            ps.setInt(3, entidad.getCliente().getId());
            ps.setDouble(4, entidad.getTotal());
            ps.executeUpdate();
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(CategoriaControlador.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public boolean eliminar(Factura entidad) throws SQLException, Exception {
                try {
            connection = Conexion.obtenerConexion ();
            this.sql = "DELETE FROM facturas WHERE id=?";

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
    public Factura extraer(int id) throws SQLException, Exception {
            connection = Conexion.obtenerConexion();
            sql = "SELECT *, clientes.id AS clienteId, facturas.id AS facturaId FROM facturas LEFT JOIN clientes on clientes.id = facturas.id_cliente WHERE facturas.id = ?";
            ps = connection.prepareStatement(sql);
            
            ps.setInt(1, id);
            
            
            this.rs   = ps.executeQuery();
            
            connection.close();
            
            this.rs.next();
            
            Cliente cliente = new Cliente();
            cliente.setId(rs.getInt("clienteId"));
            cliente.setNombre(rs.getString("nombre"));
            cliente.setApellido(rs.getString("apellido"));
            cliente.setDocumento(rs.getString("cuil"));
            cliente.setFechaNacimiento(rs.getDate("fecha_nacimiento"));
            cliente.setTipoClienteId(rs.getInt("tipo_cliente_id"));            
            
            Factura factura = new Factura();
            factura.setId(rs.getInt("facturaId"));
            factura.setDate(rs.getDate("fecha"));
            factura.setObservacion(rs.getString("Observacion"));
            factura.setCliente(cliente);
            factura.setTotal(rs.getDouble("Total"));          
            
            return factura;
    }

    @Override
    public boolean modificar(Factura entidad) throws SQLException, Exception {
       connection = Conexion.obtenerConexion ();
       this.sql = "UPDATE factura SET fecha=?, observacion=?, id_cliente=?, total=? WHERE id=?";
        
       ps = connection.prepareStatement(sql);
       ps.setDate(1, new java.sql.Date(entidad.getDate().getTime()));
       ps.setString(2, entidad.getObservacion());
       ps.setInt(3, entidad.getCliente().getId());
       ps.setDouble(4, entidad.getTotal());
       ps.setInt(5,entidad.getId());
       ps.executeUpdate();
       connection.close();
       return true;
    }

    @Override
    public ArrayList<Factura> listar() throws SQLException, Exception {
     System.out.println("Listando");    
     connection = Conexion.obtenerConexion ();
        try{
            
            this.stmt = connection.createStatement();
            this.sql = "SELECT * FROM facturas LEFT JOIN clientes on clientes.id = facturas.id_cliente";
            this.rs   = stmt.executeQuery(sql);
            connection.close();
            
            ArrayList<Factura> facturas = new ArrayList();
            
            while(rs.next()){
                
            Cliente cliente = new Cliente();
            cliente.setId(rs.getInt("cliente.id"));
            cliente.setNombre(rs.getString("nombre"));
            cliente.setApellido(rs.getString("apellido"));
            cliente.setDocumento(rs.getString("cuil"));
            cliente.setFechaNacimiento(rs.getDate("fecha_nacimiento"));
            cliente.setTipoClienteId(rs.getInt("tipo_cliente"));            
            
            Factura factura = new Factura();
            factura.setId(rs.getInt("factura.id"));
            factura.setDate(rs.getDate("Date"));
            factura.setObservacion(rs.getString("Observacion"));
            factura.setCliente(cliente);
            factura.setTotal(rs.getDouble("Total"));  

            facturas.add(factura);
                
            }
            //System.out.println(cont);
            //connection.close();
            return facturas;
        } catch(SQLException ex){
            ex.printStackTrace();
        }
        return null;
    }
    
}
