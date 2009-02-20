package venp.ibatis.mysql;

import java.util.ArrayList;
import java.util.HashMap;

import venp.beans.DetalleEscrutinioBean;
import venp.beans.EscrutinioBean;
import venp.beans.LocacionBean;
import venp.dao.entities.EscrutinioDAO;

import com.ibatis.dao.client.DaoManager;
import com.ibatis.dao.client.template.SqlMapDaoTemplate;

public class EscrutinioMySqlMapDAO extends SqlMapDaoTemplate implements
		EscrutinioDAO {

	public EscrutinioMySqlMapDAO(DaoManager daoManager) {
		super(daoManager);
	}

	ArrayList resultado = new ArrayList();

	public ArrayList listarDetalleEscrutinio(String strId) throws Exception {
		resultado = new ArrayList();
		ArrayList totalDatos = null;
		String strOperacion = "";
		ArrayList lista = new ArrayList();
		lista = detalleEscrutinio(strId);

		ArrayList listaa = null;
		
		for (int i = 0; i < lista.size(); i++) {
			listaa = new ArrayList();
			EscrutinioBean beanDetalle = null;
			beanDetalle = (EscrutinioBean) lista.get(i);

			ArrayList<DetalleEscrutinioBean> resultados = new ArrayList<DetalleEscrutinioBean>();
			
			resultados = listarVotoPaisLocacion(strId, beanDetalle.getLocacionId());

			contadorVotos(resultados, strOperacion);
		}

		strOperacion = null;

		return resultado;
	}

	public ArrayList listarDetalleLocacion(String strId) throws Exception {
		String strOperacion = "insertar";
		ArrayList totalDatos = null;

		ArrayList list = new ArrayList();
		list = detalleEscrutinio(strId);

		ArrayList listaa = null;
		
		for (int i = 0; i < list.size(); i++) {
			listaa = new ArrayList();
			EscrutinioBean beanDetalle = null;
			beanDetalle = (EscrutinioBean) list.get(i);
			listaa = listarVotoPorLocacion(strId, beanDetalle.getLocacionId());	
			contadorVotos(listaa, strOperacion);
		}

		strOperacion = " ";
		
		return resultado;
	}

	private void contadorVotos(ArrayList lista, String strInsertar) {
		int intTotalVotos = 0;
		int intVotosBlanco = 0;
		int intVotosValidos = 0;
		int intOpcion = 0;

		ArrayList listaDetalle = new ArrayList();
		DetalleEscrutinioBean beanResultadoDetalle = null;

		for (int a = 0; a < lista.size(); a++) {
			beanResultadoDetalle = (DetalleEscrutinioBean) lista.get(a);
			intTotalVotos = intTotalVotos + Integer.parseInt(beanResultadoDetalle.getVotos());				
			intOpcion = Integer.parseInt(beanResultadoDetalle.getOpcion());
			
			if (intOpcion == 0) {
				intVotosBlanco = Integer.parseInt(beanResultadoDetalle.getVotos());
				if (strInsertar.equals("insertar")) {
					insertaVotosEscrutinio("0", beanResultadoDetalle.getLocacionId(), intVotosBlanco);
				}
			} else {
				intVotosValidos = intVotosValidos + Integer.parseInt(beanResultadoDetalle.getVotos());
				if (strInsertar.equals("insertar")) {
					insertaVotosEscrutinio(beanResultadoDetalle.getOpcion(), beanResultadoDetalle.getLocacionId(), Integer.parseInt(beanResultadoDetalle.getVotos()));
				}
			}
		}
		
		beanResultadoDetalle.setVotosValidos(String.valueOf(intVotosValidos));
		beanResultadoDetalle.setTotalVotos(String.valueOf(intTotalVotos));
		beanResultadoDetalle.setVotosBlanco(String.valueOf(intVotosBlanco));

		resultado.add(beanResultadoDetalle);
	}

	private void insertaVotosEscrutinio(String strOpcion, String strIdLocacion,
			int intVotos) {
		try {
			insertaVoto(strOpcion, strIdLocacion, intVotos);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private ArrayList listarVotoPorLocacion(String strId, String strLocacion) {
		HashMap mapPais = new HashMap();
		mapPais.put("paisId", new Integer(strId));
		mapPais.put("locacionId", new Integer(strLocacion));

		ArrayList lista = new ArrayList();
		lista = (ArrayList<DetalleEscrutinioBean>) queryForList(
				"Escrutinio.listarVotoPaisLocacion", mapPais);
		return lista;
	}

	private ArrayList listarVotoPaisLocacion(String strId, String strLocacion) {
		HashMap mapPais = new HashMap();
		mapPais.put("paisId", new Integer(strId));
		mapPais.put("locacionId", new Integer(strLocacion));

		ArrayList listax = new ArrayList();
		listax = (ArrayList<DetalleEscrutinioBean>) queryForList(
				"Escrutinio.listarEscrutinioPaisLocacion", mapPais);
		return listax;
	}

	private ArrayList detalleEscrutinio(String strId) {
		HashMap map = new HashMap();
		map.put("id", strId);
		ArrayList lista = new ArrayList();
		lista = (ArrayList<LocacionBean>) queryForList(
				"Escrutinio.listarDetalleEscrutinio", map);
		return lista;
	}

	private void insertaVoto(String strOpcion, String strLocacion, int intVotos) {
		HashMap mapVotos = new HashMap();
		mapVotos.put("opcion", new Integer(strOpcion));
		mapVotos.put("locacion", new Integer(strLocacion));
		mapVotos.put("votos", new Integer(intVotos));

		this.insert("Escrutinio.insertaVotos", mapVotos);
	}
}