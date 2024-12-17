/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.StudentDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Student;

/**
 *
 * @author ADMIN
 */
@WebServlet(name="AdminAddStudentController", urlPatterns={"/addStudent"})
public class AdminAddStudentController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AdminAddStudentController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminAddStudentController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.sendRedirect("addStudent.jsp");
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
         HttpSession session = request.getSession();
        String name = request.getParameter("name");
        String phoneNum = request.getParameter("phoneNumber");
        String bod = request.getParameter("bod");
        String address = request.getParameter("address");
        String classes = request.getParameter("lop");

        Student st = new Student(name, phoneNum, bod, address, classes);
        StudentDAO dao = new StudentDAO();

        for (Student student : dao.getAll()) {
            if (name.equalsIgnoreCase(student.getName().trim())
                    && phoneNum.equalsIgnoreCase(student.getPhoneNumber().trim())
                    && classes.equalsIgnoreCase(student.getLop().trim())) {

                session.setAttribute("loi", "Duplicated Student");
                response.sendRedirect("addStudent.jsp");
                return; // Exit after detecting a duplicate
            }
        }
        if (!name.matches("^[a-zA-Z ]+$")) {
            session.setAttribute("loi", "Name can not have digit character");
             response.sendRedirect("addStudent.jsp");
            return; // Exit after detecting a duplicate
        }
        if (!phoneNum.matches("^\\d{10}$")) {
            session.setAttribute("loi", "Phone must have exact 10 characters of digit");
             response.sendRedirect("addStudent.jsp");
            return; // Exit after detecting a duplicate
        }

        dao.insert(st);
        session.setAttribute("loi", "");
         response.sendRedirect("listClass");
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
