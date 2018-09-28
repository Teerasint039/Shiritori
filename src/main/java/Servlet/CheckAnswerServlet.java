
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
import java.sql.SQLException;
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
        String pchar = request.getParameter("pchar");
        int heart = Integer.parseInt(request.getParameter("heart"));
        int score = Integer.parseInt(request.getParameter("score"));
        int gameId = Integer.parseInt(request.getParameter("gameId"));
        int time = Integer.parseInt(request.getParameter("time"));
        int userId = Integer.parseInt(request.getParameter("userid"));
        int level = Integer.parseInt(request.getParameter("level"));
        String userName = request.getParameter("username");
        String previous = request.getParameter("previous");
        String status = request.getParameter("status");
        String lowCaseVocab = vocab.toLowerCase();

        Answer answer = new Answer();
        List<String> ansVocabs = answer.showAnswerVocabs(gameId); //มันมีเคสที่ไม่มีคำศัพท์เลย
        Vocab vocabulary = new Vocab();
        List<String> vocabs = vocabulary.showAllVocabLevel(level);

        /**
         * Check In Scope
         */
        if (status.equalsIgnoreCase("incorrect")) {
            character = pchar;
        }
        if (vocabs.indexOf(lowCaseVocab) >= 0) {// Check vocab in db
            if (ansVocabs != null) {//check answers of gameId is not null
                if (ansVocabs.indexOf(lowCaseVocab) >= 0) {//check repeat answer
                    getServletContext().getRequestDispatcher("/GetMeaningServlet?vocab" + vocab
                            + "&char=" + character
                            + "&pchar=" + pchar
                            + "&heart=" + heart
                            + "&score=" + score
                            + "&gameId=" + gameId
                            + "&userid=" + userId
                            + "&username=" + userName
                            + "&time=" + time
                            + "&status=Repeat").forward(request, response); // status repeat
                } else {
                    getServletContext().getRequestDispatcher("/GetMeaningServlet?vocab" + vocab
                            + "&char=" + character
                            + "&pchar=" + pchar
                            + "&heart=" + heart
                            + "&score=" + score
                            + "&gameId=" + gameId
                            + "&userid=" + userId
                            + "&username=" + userName
                            + "&time=" + time
                            + "&status" + status).forward(request, response);//status correct
                }
            }else{
                getServletContext().getRequestDispatcher("/GetMeaningServlet?vocab" + vocab
                            + "&char=" + character
                            + "&pchar=" + pchar
                            + "&heart=" + heart
                            + "&score=" + score
                            + "&gameId=" + gameId
                            + "&userid=" + userId
                            + "&username=" + userName
                            + "&time=" + time
                            + "&status" + status).forward(request, response);//status correct
            }
        } else {
            getServletContext().getRequestDispatcher("/Outscope.jsp?vocab" + vocab
                    + "&char=" + pchar
                    + "&heart=" + heart
                    + "&score=" + score
                    + "&gameId=" + gameId
                    + "&userid=" + userId
                    + "&username=" + userName
                    + "&time=" + time).forward(request, response);
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
