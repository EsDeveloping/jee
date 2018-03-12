package com.ocr.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ocr.beans.Noms;
import com.ocr.beans.Utilisateur;

/**
 * Servlet implementation class Test
 */
@WebServlet("/Test")
public class Test extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Test() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		showView(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String name = request.getParameter("name");
		String firstName = request.getParameter("firstName");
		
		if(name !=null && firstName != null && !name.equals("") && !firstName.equals("")) {
			
			// -------------------------------------------------------------
			//          SESSION		
			// Initialisation du systeme de session
			HttpSession session = request.getSession();
			// Ajout d'un attibut nameUser dans les sessions
			session.setAttribute("nameUser", name);
			
			
			// --------------------------------------------------------------
			//           COOKIES

			// Initialisation du system de cookies
			Cookie cookie = new Cookie("nameUser", name);
		    cookie.setMaxAge( 60 * 60 * 24 ); 
			response.addCookie(cookie);
			
			// --------------------------------------------------------------
			//           Ajout dans SQL
			// Appel de la fonction qui va gérer les opérations
			checkUserAndAdd(new Utilisateur(firstName, name));
			
		}
		
		showView(request, response);
	}
	
	private void checkUserAndAdd(Utilisateur user) {
		Noms tableNoms = new Noms();
		List<Utilisateur> users = tableNoms.recupererUtilisateurs();
		
		if (!users.contains(users)) {
			tableNoms.ajouterUtilisateur(user);
		}
		
	}
	
	private void showView(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		Cookie[] cookies = request.getCookies();
		
		if (cookies != null) {
			for (Cookie cookie: cookies) {
				if(cookie.getName().equals("nameUser")) {
					request.setAttribute("nom", cookie.getValue());
				}
			}
		}
		
		Noms tableNoms = new Noms();
		request.setAttribute("Utilisateurs", tableNoms.recupererUtilisateurs());
		
		this.getServletContext().getRequestDispatcher("/WEB-INF/bonjour.jsp").forward(request, response);
	}

}
