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
import food.table.Food;
import food.table.Member;

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
		ServletContext sc = this.getServletContext();
		FoodDao foodDao = (FoodDao)sc.getAttribute("foodDao");
		
		ArrayList<Food> selectFoods = (ArrayList<Food>)sc.getAttribute("foods");
		//Ǫ�� �Ӽ� ����� ���� ������ ��ƿ �Լ��� �Ӽ��� ������ ����Ʈ �ۼ�
		
		HttpSession session = request.getSession();
		Member user = (Member)session.getAttribute("member");
		
		
		//Iterator<Food> it = selectFoods.iterator();

		/*while(it.hasNext())
		{
			System.out.println(it.next().getFname());
		}*/
		//request.setAttribute("members", memberDao.selectList()); ������ ����
		
		System.out.println(user.getPw());
		
		RequestDispatcher rd = request.getRequestDispatcher("/FoodSelect.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
