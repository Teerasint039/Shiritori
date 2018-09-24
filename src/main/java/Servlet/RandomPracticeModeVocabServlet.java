/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Model.CategoryVocab;
import Model.Vocab;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Teerasint
 */
public class RandomPracticeModeVocabServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        System.out.println("Random servlet!");
        
//        int categoryId = (int)request.getAttribute("categoryId");        
//        int gameId = (int)request.getAttribute("gameId");
//        int time = (int) request.getAttribute("time");
//        if(true){
//        if(time > 0){
            int random = (int)(Math.random() * 14 + 0);

            String animals[] = {"bear","bird","buffalo","butterfly","camel","cat","chicken","cock","cow","crab","crocodile","deer","dog","dolphin","duck"};
            request.setAttribute("category", "animal");
            request.setAttribute("gameId", 1);
            request.setAttribute("userId", 1);
            request.setAttribute("vocab", animals[random]);

            getServletContext().getRequestDispatcher("/PracticeMode.jsp").forward(request, response);
//        }
//        else{
//            request.setAttribute("gameId", 1);
//            request.setAttribute("userId", 1);
//            getServletContext().getRequestDispatcher("/Summarizepractice.jsp").forward(request, response);
//        }
//        System.out.println(animals[1]);
        
//        CategoryVocab cv = new CategoryVocab();
//        List<Vocab> vocabs = cv.showAlivedVocabInGame(categoryId, gameId);

        
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
