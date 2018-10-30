/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Model.Room;
import Model.SingleModeGame;
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
public class ShowRoomDetailServlet extends HttpServlet {

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

        int userId = Integer.parseInt(request.getParameter("userid"));
        String userName = request.getParameter("username");
        String roomCode = request.getParameter("roomcode");

        Room rm = new Room();
        System.out.println("Roomcode: "+roomCode);

        if (rm.checkRoomCodeinDB(roomCode)) {
            System.out.println("in if block");
            rm = rm.showRoom(roomCode);

            request.setAttribute("userid", userId);
            request.setAttribute("level", rm.getLevel());
            request.setAttribute("comment", rm.getComment());
            request.setAttribute("username", userName);
            request.setAttribute("roomcode", roomCode);
            getServletContext().getRequestDispatcher("/Showcodedetail.jsp").forward(request, response);
        }
        System.out.println("Out of IF block");
        System.out.println("USERID: "+userId);
        System.out.println("UserName: "+userName);
        getServletContext().getRequestDispatcher("/Menusingle.jsp?userid="+userId+
                "&username="+userName+
                "&alert=Wrong Code!").forward(request, response);

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