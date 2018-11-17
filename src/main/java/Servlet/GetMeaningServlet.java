/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Model.Vocab;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Teerasint
 */
public class GetMeaningServlet extends HttpServlet {

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
        
        System.out.println("getMeaning Servlet");
        
        String vocab = (String) request.getAttribute("vocab");//
        String character = (String) request.getAttribute("char");//
        String pchar = (String) request.getAttribute("pchar");//
        int level = (int) request.getAttribute("level");//
        int heart =(int) request.getAttribute("heart");//
        int score = (int) request.getAttribute("score");//
        int gameId = (int) request.getAttribute("gameId");//
        int userId = (int) request.getAttribute("userid");//
//        String userName = request.getParameter("username");//
        String status = (String) request.getAttribute("status");//
        String roomCode = (String) request.getAttribute("roomcode");//
        int time = (int) request.getAttribute("time");
        String previous = (String) request.getAttribute("previous");
        
        String meaning = null;
        Vocab vocabModel = new Vocab();
        meaning = vocabModel.showVocabDetail(vocab).getMeaning();
        
        request.setAttribute("meaning", meaning);
        request.setAttribute("vocab", vocab);
        request.setAttribute("char", character);
        request.setAttribute("pchar", pchar);
        request.setAttribute("heart", heart);
        request.setAttribute("level", level);
        request.setAttribute("roomCode", roomCode);
        request.setAttribute("score", score);
        request.setAttribute("gameId", gameId);
        request.setAttribute("userid", userId);
//        request.setAttribute("username", userName);
        request.setAttribute("status", status);
        request.setAttribute("time", time);
        request.setAttribute("previous", previous);
        
        getServletContext().getRequestDispatcher("/GetMeaning.jsp").forward(request, response);
//        getServletContext().getRequestDispatcher("/Final.jsp").forward(request, response);


        
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
