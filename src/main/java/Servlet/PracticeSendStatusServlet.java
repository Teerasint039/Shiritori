/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Model.Category;
import Model.CategoryVocab;
import Model.PracticeModeResult;
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
public class PracticeSendStatusServlet extends HttpServlet {

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
        
        System.out.println("Show status servlet");
        CategoryVocab cv = new CategoryVocab();
        Vocab vocabulary = new Vocab();
        Category category = new Category();

        int categoryId = (int) request.getAttribute("categoryId");
        int gameId = (int) request.getAttribute("gameId");
        int userId = (int)(request.getAttribute("userid"));
        int score = (int) request.getAttribute("score");
        int time = (int) request.getAttribute("time");
        String vocab = (String) request.getAttribute("vocab");
        String status = (String) request.getAttribute("status");
        String answer = (String) request.getAttribute("answer");

        PracticeModeResult pmr = new PracticeModeResult();
        pmr.addAnswer(status, vocabulary.getVocabIdFromVocab(vocab), answer, gameId);

        List<Integer> vocabIds = cv.showAllVocabIdInCategory(categoryId);
        int randomIndex = (int) (Math.random() * (vocabIds.size() - 1) + 0);
        
        request.setAttribute("category", category.getCategoryNamebyId(categoryId).toLowerCase());
        request.setAttribute("categoryId", categoryId);
        request.setAttribute("gameId", gameId);
        request.setAttribute("userid", userId);
        request.setAttribute("score", score);
        request.setAttribute("vocab", vocabulary.getVocabFromId(vocabIds.get(randomIndex)));

        getServletContext().getRequestDispatcher("/FirstPracticeMode.jsp").forward(request, response);
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
