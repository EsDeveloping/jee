package com.ocr.dao;

import java.sql.*;
import java.util.List;

import com.ocr.beans.Utilisateur;

public class UtilisateurDaoImpl implements UtilisateurDao {
	private DaoFactory daoFactory;
	
	UtilisateurDaoImpl(DaoFactory daoFactory){
		this.daoFactory = daoFactory;
	}
	
	// Ajout d'un utilisateur dans la bdd MySQL
	@Override
	public void ajouter(Utilisateur utilisateur) {
		// Cr�ation de l'objet connexion
		Connection connexion = null;
		// Cr�ation de l'objet prepareStatement
		PreparedStatement preparedStatement = null;
		
		// Traitement de la requ�te
		try {
			// Connexion
			connexion = daoFactory.getConnection();
			// Preparation de la requ�te de mani�re � �viter les injections SQL
			preparedStatement = connexion.prepareStatement("INSERT INTO noms(nom, prenom) VALUES(?,?);");
			
			// Injection des nom et prenom dans la requ�te
			preparedStatement.setString(1, utilisateur.getNom());
			preparedStatement.setString(2, utilisateur.getPrenom());
			
			// Execution de la requ�te
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
	}

	@Override
	public List<Utilisateur> lister() {
		List<Utilisateur> utilisateurs = new ArrayList<Utilisateur>();
		
		Connection connexion = null;
		Statement statement = null;
		ResulSet resultat = null;
		
		
		
		return null;
	}

}
