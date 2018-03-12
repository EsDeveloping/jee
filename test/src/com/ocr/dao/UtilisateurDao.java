package com.ocr.dao;

import java.util.List;

import com.ocr.beans.Utilisateur;

public interface UtilisateurDao {

		void ajouter ( Utilisateur utilisateur);
		List<Utilisateur> lister();
}
