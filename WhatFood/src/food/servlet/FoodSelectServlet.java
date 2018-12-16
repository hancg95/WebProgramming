package food.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import food.dao.FoodDao;
import food.dao.MemberDao;
import food.table.Food;
import food.table.Member;
import food.util.MaterialSelecter;

/**
 * Servlet implementation class FoodSelectServlet
 */
@WebServlet("/FoodSelect")
public class FoodSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FoodSelectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			ServletContext sc = this.getServletContext();
			HttpSession session = request.getSession();
			
			FoodDao foodDao = (FoodDao)sc.getAttribute("foodDao");
			int count = (int)session.getAttribute("count");
			
			if(count<1) //처음 질문이라면
			{
				session.setAttribute("selects", foodDao.selectList()); //질문용 음식 목록 초기화
			}
			
			RequestDispatcher rd = request.getRequestDispatcher("/FoodSelect.jsp");
			rd.forward(request, response);
		}catch (Exception e) {
			e.printStackTrace();
		    request.setAttribute("error", e);
		    RequestDispatcher rd = request.getRequestDispatcher("/Error.jsp");
		    rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			  HttpSession session = request.getSession();
		      boolean answer = Boolean.parseBoolean(request.getParameter("answer")); //대답
		      String question = (String)session.getAttribute("question"); //질문
		      int count = (int)session.getAttribute("count");
		      
		      ArrayList<Food> selects = (ArrayList<Food>)session.getAttribute("selects"); //질문에 사용할 음식목록
		      //예상으로는 requset라 날라가는듯 데이터가 세션으로 해보기
		      
		      
		      
		      MaterialSelecter ms = new MaterialSelecter();
		      
		      selects = ms.select(selects,question,answer);
		      
		      if(selects.size()==1)
		      {
		    	  String result = selects.get(0).getFname();
		    	  
		    	  ServletContext sc = this.getServletContext();
		    	  MemberDao memberDao = (MemberDao)sc.getAttribute("memberDao");

		    	  /*request.setCharacterEncoding("UTF-8");
		    	  response.setContentType("text/html;charset=UTF-8");*/
			      
		    	  
		    	  Member member = (Member)session.getAttribute("member");
		    	  
		    	  member.setSelects(member.getSelects()+result+","); //결과값 넣기
		    	  session.setAttribute("member", member);
					
		    	  memberDao.update(new Member()
		    			  .setId(member.getId())
		    			  .setPw(member.getPw())
		    			  .setAge(member.getAge())
		    			  .setSex(member.getSex())
		    			  .setSelects(member.getSelects())); // 업데이트
		    	  
		    	  request.setAttribute("result", result); //결과 넘기기
		    	  
		    	  RequestDispatcher rd = request.getRequestDispatcher("FoodResult.jsp");
			      rd.forward(request, response);
		      }
		      else if(selects.size() == 0)
		      {
		    	  String result = "없";
		    	  request.setAttribute("result", result); //결과 넘기기
		    	  
		    	  RequestDispatcher rd = request.getRequestDispatcher("FoodResult.jsp");
			      rd.forward(request, response);
		      }
		      else 
		      {
		    	  question = ms.question(selects); // 질문 골라오기
		    	  count = count+1;
		    	  
		    	  
			      session.setAttribute("selects", selects); //질문용 음식 목록
			      session.setAttribute("question", question); //질문
			      session.setAttribute("count", count);
			      /*RequestDispatcher rd = request.getRequestDispatcher("/FoodSelect.jsp");
			      rd.forward(request, response);*/
			      
			      response.sendRedirect("FoodSelect"); // 반복  
		      }
		      

		    } catch (Exception e) {
		      e.printStackTrace();
		      request.setAttribute("error", e);
		      RequestDispatcher rd = request.getRequestDispatcher("/Error.jsp");
		      rd.forward(request, response);
		    }
	}

}
