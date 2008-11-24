package venp.dao.factory;

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
import venp.dao.entities.ProcesoElectoralDAO;
import venp.dao.entities.UsuarioDAO;
import venp.dao.entities.ZonaHorariaDAO;

public abstract class DAOFactory {

	public static final int DB_MY_SQL = 1;
	public static final int DB_ORACLE = 2;
	public static final int DB_SQL_SERVER = 3;

    public abstract PerfilDAO getPerfilDAO();
    public abstract PaisDAO getPaisDAO();
    public abstract UsuarioDAO getUsuarioDAO();
    public abstract CentroVotacionDAO getCentroVotacionDAO();
    public abstract ZonaHorariaDAO getZonaHorariaDAO();
    public abstract LogDAO getLogDAO();
    public abstract LocacionDAO getLocacionDAO();
    public abstract ProcesoElectoralDAO getProcesoElectoralDAO();
    public abstract ElectorDAO getElectorDAO();
    public abstract EscrutinioDAO getEscrutinioDAO();
    public abstract ConsolidacionDAO getConsolidacionDAO();
    public abstract PartidoPoliticoDAO getPartidoPoliticoDAO();
    public abstract CandidatoDAO getCandidatoDAO();
	 
	public static DAOFactory getFactory(int dbType) {
		switch (dbType) {
        	case DB_MY_SQL:
        		return new MySQLDAOFactory();
		}
		
		return null;
	}
	
}