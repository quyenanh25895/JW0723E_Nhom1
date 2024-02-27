/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.DAO;
import entity.Account;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Random;
import javax.jws.WebService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.Response;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author my computer
 */
@WebServlet("/xuatExcelAccountControl")
public class XuatExcelAccountControl extends HttpServlet {

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
    DAO dao = new DAO();
    List<Account> list = dao.getAllAccount();
    int maximum=2147483647;
    int minimum=1;
    
    Random rn = new Random();
    int range = maximum - minimum + 1;
    int randomNum = rn.nextInt(range)+ minimum;
    FileOutputStream file = new FileOutputStream("D:\\ITPLUS\\"+"Excel\\"+"tai-khoan"+Integer.toString(randomNum)+".xlsx");
    XSSFWorkbook workbook = new XSSFWorkbook();
    XSSFSheet workSheet = workbook.createSheet("1");
    XSSFRow row;
    XSSFCell cell0;
    XSSFCell cell1;
    XSSFCell cell2;
    XSSFCell cell3;
    XSSFCell cell4;
    
    row = workSheet.createRow(0);
    cell0 = row.createCell(0);
    cell0.setCellValue("ID");
    cell1 = row.createCell(1);
    cell1.setCellValue("Username");
    cell2 = row.createCell(2);
    cell2.setCellValue("Là người bán hàng");
    cell3 = row.createCell(3);
    cell3.setCellValue("Là Admin");
    cell4 = row.createCell(4);
    cell4.setCellValue("Email");
    
    int i = 0;
    for (Account acc : list){
        i = i + 1;
            row = workSheet.createRow(i);
            cell0 = row.createCell(0);
            cell0.setCellValue(acc.getId());
            cell1 = row.createCell(1);
            cell1.setCellValue(acc.getUser());
            cell2 = row.createCell(2);
            cell2.setCellValue(acc.getIsSell());
            cell3 = row.createCell(3);
            cell3.setCellValue(acc.getIsAdmin());
            cell4 = row.createCell(4);
            cell4.setCellValue(acc.getEmail());
        }
    
    workbook.write(file);
    workbook.close();
    file.close();
    request.setAttribute("mess", "Đã xuất file Excell thành công!");
    request.getRequestDispatcher("managerAccount").forward(request, response);
    }
  
    
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
