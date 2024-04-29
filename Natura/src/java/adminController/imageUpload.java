
package adminController;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@MultipartConfig
public class imageUpload extends HttpServlet {

    public static String extractImagePath(String fullPath) {
        Path path = Paths.get(fullPath);
        Path relativePath = path.subpath(path.getNameCount() -1, path.getNameCount());
        return "\\" + relativePath.toString();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            System.out.println("Helo");
    }

private static final String UPLOAD_DIRECTORY = "F:\\Projects\\JavaEE\\DEA\\E-Commerce-Project\\Natura\\shared\\images";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (ServletFileUpload.isMultipartContent(request)) {
            try {
                List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);

                for (FileItem item : multiparts) {
                    if (!item.isFormField()) {
                        String name = new File(item.getName()).getName();
                        String timeStamp = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
                        String fileName = timeStamp + "_" + name;
                        File uploadDir = new File(UPLOAD_DIRECTORY);
                        if (!uploadDir.exists()) {
                            uploadDir.mkdirs();
                        }
                        File storeFile = new File(uploadDir, fileName);
                        item.write(storeFile);

                        response.setContentType("text/html");
                        PrintWriter out = response.getWriter();
                        out.println("File uploaded successfully. File name: " + storeFile.getName());
                        out.flush();
                        return;
                    }
                }
            } catch (Exception ex) {
                request.setAttribute("message", "File upload failed due to: " + ex.getMessage());
            }
        } else {
            request.setAttribute("message", "Sorry, this Servlet only handles file upload requests.");
        }
    }


}
