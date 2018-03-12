package com.ocr.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ocr.beans.Auteur;

/**
 * Servlet implementation class Accueil
 */
@WebServlet("/Accueil")
public class Accueil extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Accueil() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		Auteur auteur = new Auteur();
		
		auteur.setName("Salmon");
		auteur.setFirstName("Emerick");
		auteur.setActive(true);
		
		request.setAttribute("auteur", auteur);
		
		String name = request.getParameter("name");
		request.setAttribute("name", name);
		
		String[] noms = {"kiki", "Edi", "Le gros"};
		request.setAttribute("names", noms);
		
		String[] news = {"Accident sur la A6", "Suppression des impots l.", "Ouverture d'une école de programmation"}; 
		request.setAttribute("news", news);
		
		this.getServletContext().getRequestDispatcher("/WEB-INF/Accueil.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
