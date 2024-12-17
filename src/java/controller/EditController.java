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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import model.Student;
import java.sql.Date;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "EditController", urlPatterns = {"/edit"})
public class EditController extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        StudentDAO dao = new StudentDAO();
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String phoneNumber = request.getParameter("phoneNumber");
        String address = request.getParameter("address");
        String lop = request.getParameter("lop");
        String bod = request.getParameter("bod");

        Student st = dao.getStudentInClassChung(id);
        request.setAttribute("student", st);
        request.getRequestDispatcher("edit.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        StudentDAO dao = new StudentDAO();
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String phoneNumber = request.getParameter("phoneNumber");
        String bod = request.getParameter("BoD");
        String address = request.getParameter("address");
        String lop = request.getParameter("lop");

        // Set student attributes back to request scope to retain information in case of errors
        Student st = new Student(id, name, phoneNumber, bod, address, lop);
        request.setAttribute("student", st);

        if (id.isEmpty() || name.isEmpty() || phoneNumber.isEmpty() || bod.isEmpty() || address.isEmpty()) {
            request.setAttribute("blankError", "Không được để trống!!!");
            request.getRequestDispatcher("edit.jsp").forward(request, response);
            return;
        }
        if (!name.matches("^[a-zA-Z ]+$")) {
            session.setAttribute("nameErr", "Name cannot have digit character");
            request.getRequestDispatcher("edit.jsp").forward(request, response);
            return;
        }
        if (!phoneNumber.matches("^\\d{10}$")) {
            session.setAttribute("phoneErr", "Phone must have exact 10 characters of digit");
            request.getRequestDispatcher("edit.jsp").forward(request, response);
            return;
        }

        String oldClass = request.getParameter("oldClass");

        // Check for duplicate student in the new class
        if (dao.isDuplicateStudent(name, phoneNumber, lop)) {
            session.setAttribute("duplicateError", "Duplicate student found in the new class!");
            request.getRequestDispatcher("edit.jsp").forward(request, response);
            return;
        }

        Student s = new Student(id, name, phoneNumber, bod, address, lop);
        dao.update(s);

        if (oldClass.equalsIgnoreCase(lop)) {
            dao.updateSubClass(s, id);
        } else {
            dao.delete(oldClass, id);
            dao.insertToSubClass(s, Integer.parseInt(id));
        }

        response.sendRedirect("listClass");
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
