package com.project.sellerre.user;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.sellerre.product.Product;
import com.project.sellerre.product.ProductService;
import com.project.sellerre.wish.WishService;

@Controller
public class UserController {

	public static String basePath = "C:\\SellerReImg\\";

	@Autowired
	private UserService user_Service;

	@Autowired
	private ProductService product_Service;
	
	@Autowired
	private WishService wish_Service;

	// ==================== ▼ Page Control ▼ ====================

	// index로 이동
	@RequestMapping(value = "/index")
	public ModelAndView index() {

		System.out.println("처음 시작 index text");
		ModelAndView mav = new ModelAndView("/index");

		ArrayList<Product> list = (ArrayList<Product>) product_Service.selectProductAll();
		Product p = new Product();
		ArrayList<Product> indexList = new ArrayList<Product>();
		System.out.println("list = " + list);

		ArrayList<String> fileList = new ArrayList<String>();
		String path = "";

		try {
			// 첫 메인페이제 상품 4개만 가져온다
			System.out.println("list.size : " + list.size());
			for (int i = 0; i < 4; i++) {
				System.out.println("반복문 i : " + i);
				// 전체 상품수가 4개 미만일 때
				if (list.size() < 4) {
					// 마지막 상품으로 채운다
					if (i < list.size()) {
						p = list.get(i);
						System.out.println("반복문 if list.get(i) : " + i + " " + p);
					} else {
						p = list.get(list.size() - 1);
						System.out.println("반복문 else list.get(i) : " + i + " " + p);
					}
					path = basePath + p.getProduct_num() + "\\";
					File imgDir = new File(path);

					if (imgDir.exists()) {
						String[] files = imgDir.list();
						fileList.add(files[0]);
					}
					indexList.add(p);
					System.out.println("if문 p = " + p);
				} else {
					p = list.get(i);
					path = basePath + p.getProduct_num() + "\\";
					File imgDir = new File(path);

					if (imgDir.exists()) {
						String[] files = imgDir.list();
						fileList.add(files[0]);
					}
					System.out.println("p = " + p);
					indexList.add(p);
					System.out.println("indexList에 add 성공" + i + "번쨰");
				}
			}
			System.out.println(indexList);
			System.out.println("fileList : " + fileList);
			mav.addObject("fileList", fileList);
			mav.addObject("indexList", indexList);

		} catch (IndexOutOfBoundsException e) {
			e.printStackTrace();
		}
		return mav;
	}

	// loginForm으로 이동
	@GetMapping(value = "/user/login")
	public void login() {

	}

	// registerAgree로 이동
	@RequestMapping(value = "/user/registerAgree")
	public void registerAgree() {

	}

	// registerForm로 이동
	@RequestMapping(value = "/user/registerForm")
	public void registerForm() {

	}

	// find_pwForm으로 이동
	@RequestMapping(value = "/user/find_pw")
	public void findPwForm() {

	}

	// userProfile로 이동
//	@GetMapping(value = "/user/userProfile")
//	public void profileForm() {
//		
//	}

	// ==================== ▲ Page Control ▲ ====================

	// 회원가입 Service 실행 후 로그인 페이지로 이동
	@RequestMapping(value = "/user/register")
	public String join(User u) {

		user_Service.addUser(u);

		return "redirect:/user/login";
	}

	// 로그인 후 메인페이지로 이동
	@RequestMapping(value = "/user/login")
	public String loginOk(HttpServletRequest request, @RequestParam(value = "user_id") String user_id) {

		User u = user_Service.checkUserId(user_id);
		HttpSession session = request.getSession();
		session.setAttribute("user_id", u.getUser_id());
		session.setAttribute("user_nickname", u.getUser_nickname());
		session.setAttribute("user_type", u.getUser_type());

		if (u.getUser_type() == 1) {
			return "redirect:/index";
		} else if (u.getUser_type() == 2) {
			return "/admin/adminMain";
		}

		return null;
	}

	// 회원검색하여 수정창을 띄우는 메소드
	@RequestMapping(value = "/user/userEdit")
	public ModelAndView userEdit(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView("/user/userEdit");
		HttpSession session = request.getSession(false);
		String user_id = (String) session.getAttribute("user_id");

		User u = user_Service.checkUserId(user_id);
		mav.addObject("u", u);

		return mav;
	}

	// 회원정보 수정을 실행하는 메소드
	@RequestMapping(value = "user/edit")
	public String edit(HttpServletRequest request, RedirectAttributes redirect, User u,
						@RequestParam(value = "user_id") String user_id) {

		HttpSession session = request.getSession(false);
		session.setAttribute("user_nickname", u.getUser_nickname());

		user_Service.editUser(u);

		redirect.addAttribute("user_id", user_id);

		return "redirect:/user/userProfile";
	}

	// 로그아웃 후 메인페이지로 이동
	@RequestMapping(value = "/user/logout")
	public String logout(HttpServletRequest request) {

		HttpSession session = request.getSession(false);
		session.removeAttribute("user_id");
		session.invalidate();

		return "redirect:/index";
	}

	// 회원 탈퇴를 실행하는 메소드
	@RequestMapping(value = "/user/userDelete")
	public String userDelete(HttpServletRequest request) {

		HttpSession session = request.getSession(false);
		String user_id = (String) session.getAttribute("user_id");
		wish_Service.delwishAll(user_id);
		user_Service.deleteUser(user_id);

		session.removeAttribute("user_id");
		session.invalidate();

		return "redirect:/index";
	}

	// 회원 평가 메소드
	@RequestMapping(value = "/user/userScore")
	public String userScore(RedirectAttributes redirect, @RequestParam(value = "user_score") int user_score,
							@RequestParam(value = "user_id") String user_id) {

		System.out.println("스코어 컨트롤러 ============ " + user_id);
		User u = user_Service.checkUserId(user_id);
		System.out.println("스코어 컨트롤러 ============ " + user_score);
		user_Service.updateUserScore(user_id, u.getUser_score() + user_score);
		user_Service.updateUserScoreCount(user_id);

		redirect.addAttribute("user_id", user_id);

		return "redirect:/user/userProfile";
	}

	// 아이디 중복 검사
	@RequestMapping(value = "/user/IdCheck")
	@ResponseBody
	public String checkId(@RequestParam(value = "user_id") String user_id) {
		
		int id_result = user_Service.idCheck(user_id);
		
		if (id_result != 0) {
			return "fail"; // 중복될 때
		} else {
			return "success"; // 중복되지 않을 때
		}
	}

	// 닉네임 중복 검사
	@RequestMapping(value = "/user/nicknameCheck")
	@ResponseBody
	public String checkName(@RequestParam(value = "user_nickname") String user_nickname) {
		
		int name_result = user_Service.nicknameCheck(user_nickname);
		
		if (name_result != 0) {
			return "fail";
		} else {
			return "success";
		}
	}

	// 이메일 중복 검사
	@RequestMapping(value = "/user/emailCheck")
	@ResponseBody
	public String checkEmail(@RequestParam(value = "user_email") String user_email) {
		
		int name_result = user_Service.emailCheck(user_email);
		
		if (name_result != 0) {
			return "fail";
		} else {
			return "success";
		}
	}

	// 임시 비밀번호찾기
	@RequestMapping(value = "/user/pwCheck")
	public ModelAndView findPw(@RequestParam(value = "user_email") String user_email) {
		
		ModelAndView mav = new ModelAndView("/user/pwCheck");
		String result = "";
		User u = user_Service.selectUserEmail(user_email);

		if (u == null) {
			result = "유효하지않은 이메일";
		} else {
			result = u.getUser_nickname() + " 님의 비밀번호는 " + u.getUser_pw() + " 입니다.";
		}
		mav.addObject("result", result);

		return mav;
	}
	
	// 로그인 시 아이디 & 비밀번호 체크
	@RequestMapping(value = "/user/userLoginCheck")
	public ModelAndView loginCheck(@RequestParam(value = "user_id") String user_id, @RequestParam(value = "user_pw") String user_pw) {
		
		ModelAndView mav = new ModelAndView("user/userLoginCheckJSON");
		User u = user_Service.checkUserId(user_id);
		String pwd2 = u.getUser_pw();
		String result = "";
		
		if (!user_pw.equals(pwd2)) {
			result = "비밀번호가 맞지 않습니다";
			mav.addObject("result", result);
		} else {
			mav.addObject("result", result);
			mav.addObject("user_id", user_id);
		}
		
		return mav;
	}

}
