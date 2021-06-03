package Compra;

import java.util.Date;

import Catalogo.Cproducto;

public class CPedido {
	int idpedido;
	Cproducto[] listaProductosPedido;
	Date fecha;
	String nombre;
	String calle;
	String provincia;
	String localidad;
	String cp;
	String pais;
	String tel;

	public CPedido(int pidpedido, Cproducto[] plistaProductosPedido, String pnombre, String pcalle, String pprovincia,
			String plocalidad, String pcp, String ppais, String ptel) {
		idpedido = pidpedido;
		listaProductosPedido = plistaProductosPedido;
		nombre = pnombre;
		calle = pcalle;
		provincia = pprovincia;
		localidad = plocalidad;
		cp = pcp;
		pais = ppais;
		tel = ptel;
	}

	public CPedido(int pidpedido, Cproducto[] plistaProductosPedido, Date pfecha, String pnombre, String pcalle,
			String pprovincia, String plocalidad, String pcp, String ppais, String ptel) {
		idpedido = pidpedido;
		listaProductosPedido = plistaProductosPedido;
		fecha = pfecha;
		nombre = pnombre;
		calle = pcalle;
		provincia = pprovincia;
		localidad = plocalidad;
		cp = pcp;
		pais = ppais;
		tel = ptel;
	}

	public int getIdpedido() {
		return idpedido;
	}

	public Cproducto[] getListaProductosPedido() {
		return listaProductosPedido;
	}

	public Date getFecha() {
		return fecha;
	}

	public String getNombre() {
		return nombre;
	}

	public String getCalle() {
		return calle;
	}

	public String getProvincia() {
		return provincia;
	}

	public String getLocalidad() {
		return localidad;
	}

	public String getCp() {
		return cp;
	}

	public String getPais() {
		return pais;
	}

	public String getTel() {
		return tel;
	}

}
