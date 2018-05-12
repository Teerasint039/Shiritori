
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Model.Answer;
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
public class CheckAnswerServlet extends HttpServlet {

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

        String vocab = request.getParameter("vocab");
        String character = request.getParameter("char");
        int heart = Integer.parseInt(request.getParameter("heart"));
        int score = Integer.parseInt(request.getParameter("score"));
        int gameId = Integer.parseInt(request.getParameter("gameId"));
        int time = Integer.parseInt(request.getParameter("time"));

        Answer answer = new Answer();
        List<String> ansVocabs = answer.showAnswerVocabs(gameId);
        Vocab vocabulary = new Vocab();
        List<String> vocabs = vocabulary.showAllVocab();

        /**
         * Check In Scope
         */
        if (vocabs.indexOf(vocab) >= 0) {
            if (ansVocabs.indexOf(vocab) >= 0) {
                getServletContext().getRequestDispatcher("/GetMeaningServlet?vocab"+vocab
                    +"&char="+character
                    +"&heart="+heart
                    +"&score="+score
                    +"&gameId="+gameId
                    +"&time="+time
                    +"&status=repeat").forward(request, response); // status repeat
            } else {
                getServletContext().getRequestDispatcher("/GetMeaningServlet?vocab"+vocab
                    +"&char="+character
                    +"&heart="+heart
                    +"&score="+score
                    +"&gameId="+gameId
                    +"&time="+time
                    +"&status=correct").forward(request, response);//status correct
            }
        } else {
            getServletContext().getRequestDispatcher("OutScope.jsp?vocab"+vocab
                    +"&char="+character
                    +"&heart="+heart
                    +"&score="+score
                    +"&gameId="+gameId
                    +"&time="+time).forward(request, response);
        }

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
