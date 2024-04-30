package adminController;

import dao.ProductDAO;
import dao.ProductDAOImpl;
import models.Product;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

/**
 *
 * @author Devin
 */
@MultipartConfig
public class addProductServlet extends HttpServlet {
    
    private String uploadDirectory;

    @Override
    public void init() throws ServletException {
        uploadDirectory = getServletContext().getInitParameter("UPLOAD_DIRECTORY");
        if (uploadDirectory == null) {
            throw new ServletException("Upload directory not set in web.xml.");
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/admin/add_product.jsp");
        dispatcher.include(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        if (ServletFileUpload.isMultipartContent(request)) {
            DiskFileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            String title = null, description = null, filePath = null;
            double price = 0;
            int quantity = 0;

            try {
                List<FileItem> formItems = upload.parseRequest(request);

                for (FileItem item : formItems) {
                    if (item.isFormField()) {
                        String fieldName = item.getFieldName();
                        String fieldValue = item.getString();

                        switch (fieldName) {
                            case "title":
                                title = fieldValue;
                                break;
                            case "description":
                                description = fieldValue;
                                break;
                            case "price":
                                price = Double.parseDouble(fieldValue);
                                break;
                            case "qty":
                                quantity = Integer.parseInt(fieldValue);
                                break;
                        }
                    } else {
                        String fieldName = item.getFieldName();
                        String fileName = FilenameUtils.getName(item.getName());

                        if ("file".equals(fieldName) && fileName != null && !fileName.isEmpty()) {
                            String timeStamp = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
                            String modifiedFileName = timeStamp + "_" + fileName;
                            File uploadDir = new File(uploadDirectory);
                            if (!uploadDir.exists()) {
                                uploadDir.mkdirs();
                            }
                            File storeFile = new File(uploadDir, modifiedFileName);
                            item.write(storeFile);
                            filePath = storeFile.getName();
                            System.out.println("File uploaded successfully. File path: " + filePath);
                        }
                    }
                }

                if (title != null && filePath != null) {
                    Product product = new Product(title, description, price, quantity);
                    ProductDAO productDAO = new ProductDAOImpl();
                    productDAO.addProduct(product, filePath);
                    System.out.println("Product and image added successfully.");
                } else {
                    System.out.println("Required fields are missing.");
                }
            } catch (Exception ex) {
                System.err.println("Error in processing upload: " + ex.getMessage());
                request.setAttribute("errorMessage", "Error in processing upload: " + ex.getMessage());
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }
        } else {
            request.setAttribute("message", "Request Content-Type is not multipart/form-data.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
        response.sendRedirect("/pages/admin/products.jsp");
    }

}
