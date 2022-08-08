package web.jsp11.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


//	어노테이션으로 요청 주소 매핑한 방법
@WebServlet("/HelloServlet")
public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
    public HelloServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	
    //	HelloServlet 주소로 요청이 들어올때마다 호출되는 메서드
    //	오버라이딩 -> doGet() , doPost 는 자동호출 X
    //	Get , Post 상관없이 service 를 거쳐감 
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	PrintWriter pw = response.getWriter();
    	pw.print("<html>");
    	pw.print("<body>");
    	pw.print("<h2>Hello servlet !!!!</h2>");
    	pw.print("</body>");
    	pw.print("</html>");
    	
    	
    	
    	
    }
    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("doGet!!!");
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
























