package venp.dao.factory;

import java.sql.Connection;

import venp.dao.entities.CandidatoDAO;
import venp.dao.entities.CentroVotacionDAO;
import venp.dao.entities.ConsolidacionDAO;
import venp.dao.entities.ElectorDAO;
import venp.dao.entities.EscrutinioDAO;
import venp.dao.entities.LocacionDAO;
import venp.dao.entities.LogDAO;
import venp.dao.entities.PaisDAO;
import venp.dao.entities.PartidoPoliticoDAO;
import venp.dao.entities.PerfilDAO;
import venp.dao.entities.UsuarioDAO;
import venp.dao.entities.ProcesoElectoralDAO;
import venp.dao.entities.ZonaHorariaDAO;
import venp.dao.mysql.MySqlCandidatoDAO;
import venp.dao.mysql.MySqlCentroVotacionDAO;
import venp.dao.mysql.MySqlConsolidacionDAO;
import venp.dao.mysql.MySqlElectorDAO;
import venp.dao.mysql.MySqlEscrutinioDAO;
import venp.dao.mysql.MySqlLocacionDAO;
import venp.dao.mysql.MySqlLogDAO;
import venp.dao.mysql.MySqlPaisDAO;
import venp.dao.mysql.MySqlPartidoPoliticoDAO;
import venp.dao.mysql.MySqlPerfilDAO;
import venp.dao.mysql.MySqlProcesoElectoralDAO;
import venp.dao.mysql.MySqlUsuarioDAO;
import venp.dao.mysql.MySqlZonaHorariaDAO;
import venp.drivers.db.MySQLConnection;

public class MySQLDAOFactory extends DAOFactory {

	private Connection getDBConnection() {
		MySQLConnection db = new MySQLConnection();
		return db.getConnection();
	}

	public PaisDAO getPaisDAO() {
		Connection conn = getDBConnection();
		return new MySqlPaisDAO(conn);
	}

	public PerfilDAO getPerfilDAO() {
		Connection conn = getDBConnection();
		return new MySqlPerfilDAO(conn);
	}

	public UsuarioDAO getUsuarioDAO() {
		Connection conn = getDBConnection();
		return new MySqlUsuarioDAO(conn);
	}

	public CentroVotacionDAO getCentroVotacionDAO() {
		Connection conn = getDBConnection();
		return new MySqlCentroVotacionDAO(conn);
	}

	public ZonaHorariaDAO getZonaHorariaDAO() {
		Connection conn = getDBConnection();
		return new MySqlZonaHorariaDAO(conn);
	}
	
	public LogDAO getLogDAO() {
		Connection conn = getDBConnection();
		return new MySqlLogDAO(conn);
	}

	public LocacionDAO getLocacionDAO() {
		Connection conn = getDBConnection();	
		return new MySqlLocacionDAO(conn);
	}
	
	public ProcesoElectoralDAO getProcesoElectoralDAO() {
		Connection conn = getDBConnection();
		return new  MySqlProcesoElectoralDAO(conn);
	}
	
	public EscrutinioDAO getEscrutinioDAO() {
		Connection conn = getDBConnection();
		return new  MySqlEscrutinioDAO(conn);
	}
	
	public ConsolidacionDAO getConsolidacionDAO() {
		Connection conn = getDBConnection();	
		return new MySqlConsolidacionDAO(conn);
	}

	public ElectorDAO getElectorDAO() {
		Connection conn = getDBConnection();	
		return new MySqlElectorDAO(conn);
	}
	
	public CandidatoDAO getCandidatoDAO() {
		Connection conn = getDBConnection();	
		return new MySqlCandidatoDAO(conn);
	}

	public PartidoPoliticoDAO getPartidoPoliticoDAO() {
		Connection conn = getDBConnection();	
		return new MySqlPartidoPoliticoDAO(conn);
	}
	
}