
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Model.PracticeModeResult;
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
public class PracticeCheckAnswerServlet extends HttpServlet {

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
        System.out.println("Check Answer servlet");
        
//        int userId = (int) request.getAttribute("userId");
        String status = request.getParameter("status");
//        System.out.println("status: "+status);
        int gameId = Integer.parseInt(request.getParameter("gameId"));
//        System.out.println("gameId: "+gameId);
        int userId = Integer.parseInt(request.getParameter("userid"));
//        System.out.println("userId: "+userId);
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
//        System.out.println("categoryId: "+categoryId);
        int score = Integer.parseInt(request.getParameter("score"));
//        System.out.println("score: "+score);
        int time = Integer.parseInt(request.getParameter("time")); 
//        System.out.println("time: "+time);       
        String vocab = request.getParameter("vocab");
//        System.out.println("vocab: "+vocab);
        String answer = request.getParameter("answer");
//        System.out.println("answer: "+answer);
        
        
        
//        PracticeModeResult pmr = new PracticeModeResult();
//        String status = pmr.checkAnswer(answer,vocab);
//        
//        if (status.equalsIgnoreCase("correct")) {
//            score += 1;
//        }
        
        System.out.println("status: "+status);
        System.out.println("score: "+score);
        
        request.setAttribute("gameId", gameId);
        request.setAttribute("userid", userId);
        request.setAttribute("categoryId", categoryId);
        request.setAttribute("answer", answer);
        request.setAttribute("vocab", vocab);
        request.setAttribute("score", score);
        request.setAttribute("time", time);
        request.setAttribute("status", status);
        
//        getServletContext().getRequestDispatcher("/TestStatusPracticeMode.jsp").forward(request, response);
        getServletContext().getRequestDispatcher("/PracticeSendStatusServlet").forward(request, response);
        
        
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
