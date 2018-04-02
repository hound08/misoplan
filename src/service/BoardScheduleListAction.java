/*package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.BoardDao;
import dao.BoardScheduleDao;
import dao.BoardScheduleDto;

public class BoardScheduleListAction implements CommandProcess {
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		BoardScheduleDao bsd = BoardScheduleDao.getInstance(); // 싱글톤
		  try {
			  int totCnt = bsd.getTotalCnt();  // 전체 Row 갯수
		         String pageNum = request.getParameter("pageNum");
		         if(pageNum==null || pageNum.equals("")){
		            pageNum = "1";
		         }
		         int currentPage = Integer.parseInt(pageNum);
		         int pageSize = 10, blockSize = 10;  // 페이지 사이즈 10개 이상이면 다음 페이지로 넘기는 방식 (밑 페이지 쪽수 개념 )
		         int startRow = (currentPage - 1) * pageSize + 1; // 1
		         int endRow = startRow + pageSize -1; 			  // 10
		         int startNum = totCnt - startRow + 1;  		  // 38
		         
		         List<BoardScheduleDto> list = bsd.list(startRow, endRow);
		         int pageCnt = (int)Math.ceil((double)totCnt/pageSize);				// 4 (3.8 보다 높은수에서 가장 작은 정수)
		         int startPage = (int)(currentPage - 1)/blockSize*blockSize + 1;	// 1
		         int endPage = startPage + blockSize -1;							// 10
		         if(endPage>pageCnt) endPage = pageCnt;
		         
		         request.setAttribute("totCnt", totCnt);
		         request.setAttribute("pageNum", pageNum);
		         request.setAttribute("currentPage", currentPage);
		         request.setAttribute("startNum", startNum);
		         request.setAttribute("list", list);
		         request.setAttribute("blockSize", blockSize);
		         request.setAttribute("pageCnt", pageCnt);
		         request.setAttribute("startPage", startPage);
		         request.setAttribute("endPage", endPage);
		         
		         System.out.println("--------------------------------------");
		         System.out.println("startNum-->" + startNum);
		         System.out.println("totCnt --> " + totCnt);
		         System.out.println("currntPage-->" + currentPage);
		         System.out.println("blockSize --> " + blockSize);
		         System.out.println("pageSize --> " + pageSize);
		         System.out.println("pageCnt --> " + pageCnt);
		         System.out.println("startPage -->" + startPage);
		         System.out.println("endPage --> " + endPage);
		      } catch (Exception e) {

		         e.printStackTrace();
		      }
		      
		      return "plan1.jsp";
		   }

		}*/