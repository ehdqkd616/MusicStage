package com.musicstage.spring.member.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.musicstage.spring.board.model.service.BoardService;
import com.musicstage.spring.board.model.vo.Board;
import com.musicstage.spring.board.model.vo.BoardFile;
import com.musicstage.spring.member.model.exception.MemberException;
import com.musicstage.spring.member.model.service.MemberService;
import com.musicstage.spring.member.model.vo.AuthorityType;
import com.musicstage.spring.member.model.vo.Interest;
import com.musicstage.spring.member.model.vo.KakaoProfile;
import com.musicstage.spring.member.model.vo.KakaoToken;
import com.musicstage.spring.member.model.vo.Member;
import com.musicstage.spring.member.model.vo.register_Pro;
import com.musicstage.spring.member.model.vo.register_file;

@Controller
@SessionAttributes({"loginUser", "registerUser","registerUser_Pro","list"})
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private BoardService bService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@ModelAttribute("registerUser")
	public Member setEmptyMember() {
		
		return new Member();
	}
	
	@RequestMapping(value="join1.me", method=RequestMethod.POST)
	public String MemberJoin1() {
		
		return "membership_Agreement_1";
	}
	
	@RequestMapping(value="join2.me", method=RequestMethod.POST)
	public String MemberJoin2(@RequestParam(value="kakaoToken", required = false) String kakaoToken, Model model) {
		
		model.addAttribute("kakaoToken", kakaoToken);
		return "membership_Agreement_2";
	}
	
	@ResponseBody
	@RequestMapping("isExistID.me")
	public void isExistID(@RequestParam ("userId") String userId, HttpServletResponse response) throws IOException {
		
		boolean isUsable = 	mService.isExistMember(userId, "userId") == 0 ? true : false;
		response.getWriter().print(isUsable);
	}
	
	@RequestMapping("address.me")
	public String address() {
		return "jusoPopup";
	}
	
	@ResponseBody
	@RequestMapping(value="api/join.me", method=RequestMethod.POST)
	public void joinForm(@ModelAttribute("registerUser") Member m, @RequestParam String birth, HttpServletResponse response) {
		
		Date birthday = Date.valueOf(birth);
		m.setBirthDay(birthday);
		m.setAuthority(AuthorityType.AMATEUR_ROLL.getValue());
		
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			
			response.getWriter().print(mapper.writeValueAsString(m));
			
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	
	@ResponseBody
	@RequestMapping(value="join3.me", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView MemberJoin3(ModelAndView mv) {
		
		mv.addObject("open", 1);
		mv.setViewName("redirect:home.do");
		
		return mv;
	}
	
	@RequestMapping(value="insertMember.me", method=RequestMethod.POST)
	public void interestForm(@ModelAttribute("registerUser") Member m, @RequestParam String[] list, HttpServletResponse response) {
		
		String encPwd = bcryptPasswordEncoder.encode(m.getPassword());
		
		m.setPassword(encPwd);
		
		
		int result = mService.insertMember(m);
		
		int interest = 0;
		
		if(result > 0) {
			interest = mService.insertInterest(list, m.getUserId());
		}
		
		try {
			PrintWriter out = response.getWriter();
			
			if(interest > 0) {
				out.append("ok");
			} else {
				out.append("fail");
			}
			
			out.flush();
			out.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	@RequestMapping(value="join4.me", method=RequestMethod.POST)
	public ModelAndView MemberJoin4(ModelAndView mv) {
		mv.addObject("open", 2);
		mv.setViewName("redirect:home.do");
	
		return mv;
	}
	
	@RequestMapping("regiFinal.me")
	public String regiFinal(SessionStatus sessionStatus) {

		sessionStatus.setComplete();
		return "redirect:home.do";
	}
	
	@ResponseBody
	@RequestMapping(value="callback.me", method=RequestMethod.GET)
	public ModelAndView kakaoCallback(String code, @ModelAttribute("registerUser") Member m, ModelAndView mv) {
		
		RestTemplate rt = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		String grant_type = "authorization_code";
		String client_id = "55976a0aa11f05310aaba03e7fd32700";
		String redirect_uri = "http://localhost:8747/spring/callback.me";
		
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("grant_type", grant_type);
		params.add("client_id", client_id);
		params.add("redirect_uri", redirect_uri);
		params.add("code", code);
		
		HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest = new HttpEntity<>(params, headers);
		
		ResponseEntity<String> response = rt.exchange(
			"https://kauth.kakao.com/oauth/token", // URL
			HttpMethod.POST, // Method
			kakaoTokenRequest, // data(req)
			String.class // responseType
		);
		
		ObjectMapper obj = new ObjectMapper();
		KakaoToken kakaoToken = null;
		
		try {
			kakaoToken = obj.readValue(response.getBody(), KakaoToken.class);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		RestTemplate rt2 = new RestTemplate();
		
		HttpHeaders headers2 = new HttpHeaders();
		headers2.add("Authorization", "Bearer " + kakaoToken.getAccess_token());
		headers2.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		HttpEntity<MultiValueMap<String, String>> kakaoProfileRequest = new HttpEntity<>(headers2);
		
		ResponseEntity<String> response2 = rt2.exchange(
			"https://kapi.kakao.com/v2/user/me",
			HttpMethod.POST,
			kakaoProfileRequest,
			String.class
		);
		
		ObjectMapper obj2 = new ObjectMapper();
		KakaoProfile kakaoProfile = null;
		
		try {
			kakaoProfile = obj2.readValue(response2.getBody(), KakaoProfile.class);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}	
		
		String kakaoId = kakaoProfile.getKakao_account().getEmail();
		String kakaoName = kakaoProfile.getProperties().getNickname();
		
		int result = mService.isExistMember(kakaoId, "userId");

		
		if(result >= 1) {
			mv.addObject("msg", "이미 가입된 아이디입니다");
			mv.setViewName("redirect:home.do");
		} else {
			m.setUserId(kakaoId);
			m.setUserName(kakaoName);
			mv.addObject("registerUser", m);
			mv.addObject("kakaoToken", kakaoToken);
			mv.setViewName("membership_Agreement_1");
		
		}
		
		return mv;
	}
	
	@RequestMapping(value="login.me", method=RequestMethod.POST)
	public ModelAndView login(Member m, HttpSession session, ModelAndView mv) {
		
		if(session.getAttribute("loginUser") != null) {
			session.removeAttribute("loginUser");
		}
		
		Member loginUser = mService.memberLogin(m);
		
	
		if(bcryptPasswordEncoder.matches(m.getPassword(), loginUser.getPassword()) || m.getPassword().equals(loginUser.getPassword())) {
			
			String userid = loginUser.getUserId();
			System.out.println(userid);
			List<register_Pro> rp1 =(List<register_Pro>)mService.register_pro(userid);
			List<register_file> rf = null;
			register_Pro tb = null;
			if(rp1.size() != 0) {
				String user = rp1.get(0).getRegister_user();
				rf = mService.userfileName(user);
				System.out.println("rp : "+ rp1);
				int numd = rp1.size();
				System.out.println(rf);
					tb = (register_Pro)rp1.get(numd-1);
					tb.setRegister_approve('X');
			}else {
				System.out.println("gege");
					rf = null;
					tb = null;
			}
			
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("list", rf);
			session.setAttribute("registerUser_Pro", tb);
			
			ArrayList<Member> followList = mService.getFollower(userid, 1, 100000000);
			session.setAttribute("followList", followList);
			
			mv.setViewName("redirect:board.fo");

		} else {
			mv.addObject("message", "로그인에 실패했습니다");
			mv.setViewName("../common/errorPage");
		}
		
		return mv;
	}
	
	@RequestMapping("logout.me")
	public String logout(SessionStatus status) {
		
		status.setComplete();

		return "redirect:home.do";
	}
	
	@RequestMapping("goStage.st")
	public String goProfile(@ModelAttribute("loginUser") Member m, Model model) {
		
		model.addAttribute("loginUser", m);
		
		return "Account_Setting";
	}
	
	@RequestMapping("goPwd.st")
	public String goPwd() {
		
		return "Account_Pwd";
	}
	
	@RequestMapping("goInterest.st")
	public ModelAndView goInterest(@ModelAttribute("loginUser") Member m, ModelAndView mv) {
		
		ArrayList<Interest> Interest = mService.lookupInterest(m.getUserId());
		
		mv.addObject("interest", Interest);
		mv.setViewName("Account_Interesting");
		
		return mv;
	}
		
	@RequestMapping("goBreak.st")
	public String goBreak() {
		
		return "Account_Break";
	}
	
	@ResponseBody
	@RequestMapping(value = "profile/uploadImg.st", method=RequestMethod.POST)
	public void uploadImg(MultipartRequest request, HttpServletResponse response, @ModelAttribute("loginUser") Member loginUser) {
		
		String userId = loginUser.getUserId();
		
		Iterator<String> itr = request.getFileNames();
		MultipartFile uploadFile = null;
		while(itr.hasNext()) {
			uploadFile = request.getFile(itr.next());
		}
		
		if(uploadFile != null && !uploadFile.isEmpty()) {
			saveProfile(uploadFile, request, userId);
		}
		
		String profile_pic = uploadFile.getOriginalFilename();
		
		int result = mService.uploadImg(profile_pic, userId);
		
		if(result > 0) {			
			loginUser.setProfile_pic(profile_pic);
		}
		
	}

	private String saveProfile(MultipartFile uploadFile, MultipartRequest request, String userId) {

		String root = ((HttpServletRequest) request).getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/userProfile/" + userId;
		
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
//		String fullPath = folder + "/" + uploadFile.getOriginalFilename().substring(0, uploadFile.getOriginalFilename().lastIndexOf("."));
		String fullPath = folder + "/" + uploadFile.getOriginalFilename();		
		
		try {
			uploadFile.transferTo(new File(fullPath));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return fullPath;
	}
	
	@ResponseBody
	@RequestMapping("isExistNickName.st")
	public void isExistNickName(@RequestParam("nickName") String nickName, HttpServletResponse response) throws IOException {
		
		boolean isUsable = 	mService.isExistMember(nickName, "nickName") == 0 ? true : false;
		
		response.getWriter().print(isUsable);
	}
	
	@RequestMapping(value = "updateMember.st", method=RequestMethod.POST)
	public String updateMember(@ModelAttribute Member m, Model model) {
		
		int result = mService.updateMember(m);
		
		if(result > 0) {
			Member loginUser = mService.memberLogin(m);
			model.addAttribute("loginUser", loginUser);
			return "redirect:goStage.st";
		} else {
			throw new MemberException("회원 정보 수정에 실패했습니다!!");
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "encodingPwd.st", method=RequestMethod.POST)
	public String encodingPwd(@RequestBody JSONObject obj) {

		String encPwd = (String)obj.get("encPwd");
		String originPwd = (String)obj.get("originPwd");
		
		if(bcryptPasswordEncoder.matches(originPwd, encPwd) || encPwd.equals(originPwd)) {
			return "ok";
		} else {
			return "false";
		}
	}
	
	@RequestMapping(value = "updatePwd.st", method=RequestMethod.POST)
	public String updatePwd(@ModelAttribute("loginUser") Member m, @RequestParam("password") String password, SessionStatus sessionStatus) {
		
		String encPwd = bcryptPasswordEncoder.encode(password);
		
		m.setPassword(encPwd);	
		
		int result = mService.updatePwd(m);
		
		if(result > 0) {
			sessionStatus.setComplete();
			return "redirect:home.do";
		} else {
			throw new MemberException("비밀번호 수정에 실패했습니다!!");
		}
	}
	
	@RequestMapping("updateInterest.st")
	public String updateInterest(@ModelAttribute("loginUser") Member m, @RequestParam("interests") String[] newInterest) {
			
//		String createSql = "CREATE OR REPLACE VIEW like_interests_view_" +  m.getUserId() + "\n" +
//						"AS\n" + 
//						"SELECT ROWNUM RNUM, LIKE_INTEREST, LIKE_INTEREST_NAME, LIKE_INTEREST_USER\n" + 
//						"FROM(select * from like_interests_management\n" + 
//						"JOIN like_interests USING(LIKE_INTEREST)\n" + 
//						"WHERE LIKE_INTEREST_USER ='" + m.getUserId() + "')";
//		
//		mService.createInterestView(createSql);
//
//		int result = mService.updateInterest(m.getUserId(), interests);
//		
//		String dropSql = "DROP VIEW like_interests_view";
//		
//		mService.dropInterestView(dropSql);
		
		ArrayList<Interest> originInterest = mService.lookupInterest(m.getUserId());
		
		ArrayList<Integer> originArr = new ArrayList<>();
		
		for(Interest i : originInterest) {
			originArr.add(i.getLike_interest());
		}
		
		System.out.println("originInterest : " + originInterest);
		System.out.println("originArr : " + originArr);
		
		ArrayList<Integer> newArr = new ArrayList<>();
		
		for(int i = 0; i < newInterest.length; i++) {
			newArr.add(Integer.parseInt(newInterest[i]));
		}
		
		int result = mService.updateInterest(m.getUserId(), originArr, newArr);
		
		if(originArr.equals(newArr) || result > 0 ) {
			
			return "redirect:allFeed.bo";
		} else {
			return "redirect:Account_Interesting";
		}
		
	}
	
	@RequestMapping("deleteMember.st")
	public String deleteMember(@ModelAttribute("loginUser") Member m, SessionStatus sessionStatus) {
		
		int result = mService.deleteMember(m);
		
		if(result > 0) {
			sessionStatus.setComplete();
			return "redirect:home.do";
		}
		
		return "redirect:goBreak.st";
		
	}
	
	@RequestMapping("goMyStage.st")
	public String goMyStage(@ModelAttribute("loginUser") Member m, Model model) {
		
		int boardCount = bService.countBoard(m.getUserId());
		
		model.addAttribute("boardCount", boardCount);
		
		ArrayList<Member> followingList  = mService.getFollowing(m.getUserId(), 1, 20); // 占쎄땀揶쏉옙 占쎈솋嚥≪뮇�뒭占쎈립 占쎄텢占쎌뿺占쎈굶
		ArrayList<Member> followerList = mService.getFollower(m.getUserId(), 1, 20); // 占쎄돌�몴占� 占쎈솋嚥≪뮇�뒭占쎈립 占쎄텢占쎌뿺占쎈굶
		
		int followingAllCount = mService.getFollowingAllCount(m.getUserId());
		int followerAllCount = mService.getFollowerAllCount(m.getUserId());
		
		register_Pro proInfo = mService.getProInfoShow(m.getUserId());

		ArrayList<Board> socialList = bService.getBoardList(m.getUserId(), 1, 6, 1);
		ArrayList<Board> searchList = bService.getBoardList(m.getUserId(), 1, 6, 2);
		ArrayList<Board> columnList = bService.getBoardList(m.getUserId(), 1, 6, 3);
		ArrayList<Board> reviewList = bService.getBoardList(m.getUserId(), 1, 6, 4);
		
		int socialCount = bService.getboardAllCount(m.getUserId(), 1);
		int searchCount = bService.getboardAllCount(m.getUserId(), 2);
		int columnCount = bService.getboardAllCount(m.getUserId(), 3);
		int reviewCount = bService.getboardAllCount(m.getUserId(), 4);
		
		model.addAttribute("followingList", followingList);
		model.addAttribute("followerList", followerList);
		model.addAttribute("followingAllCount", followingAllCount);
		model.addAttribute("followerAllCount", followerAllCount);
		model.addAttribute("proInfo", proInfo);
		model.addAttribute("socialList", socialList);
		model.addAttribute("searchList", searchList);
		model.addAttribute("columnList", columnList);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("socialCount", socialCount);
		model.addAttribute("searchCount", searchCount);
		model.addAttribute("columnCount", columnCount);
		model.addAttribute("reviewCount", reviewCount);
		
		return "My_Stage";
	}
	
	@ResponseBody
	@RequestMapping(value="getFollowingList.st", method=RequestMethod.POST)
	public void getFollowingList(@ModelAttribute("loginUser") Member m, @RequestBody JSONObject obj, HttpServletResponse response) {
		
		response.setContentType("application/json; charset=UTF-8");
		
		int lastMemberCount = Integer.parseInt((String) obj.get("memberCount")) + 1;
		int count = lastMemberCount / 20;
		int start = (20 * count) + 1;
		int end = (20 * count) + 20;

		ArrayList<Member> followingList = mService.getFollowing(m.getUserId(), start, end);
		
		JSONArray jArr = new JSONArray();
		for(Member member : followingList) {
			JSONObject jMember = new JSONObject();
			jMember.put("userId", member.getUserId());
			jMember.put("nickName", member.getNickName());
			jMember.put("profile_pic", member.getProfile_pic());
			jMember.put("index", lastMemberCount++);
			
			jArr.add(jMember);
		}
		
		try {
			PrintWriter out = response.getWriter();
			out.println(jArr);
			out.flush();
			out.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value="getFollowerList.st", method=RequestMethod.POST)
	public void getFollowerList(@ModelAttribute("loginUser") Member m, @RequestBody JSONObject obj, HttpServletResponse response) {
		
		response.setContentType("application/json; charset=UTF-8");
		
		int lastMemberCount = Integer.parseInt((String) obj.get("memberCount")) + 1;
		int count = lastMemberCount / 20;
		int start = (20 * count) + 1;
		int end = (20 * count) + 20;

		ArrayList<Member> followerList = mService.getFollower(m.getUserId(), start, end);
		
		JSONArray jArr = new JSONArray();
		for(Member member : followerList) {
			JSONObject jMember = new JSONObject();
			jMember.put("userId", member.getUserId());
			jMember.put("nickName", member.getNickName());
			jMember.put("profile_pic", member.getProfile_pic());
			jMember.put("index", lastMemberCount++);
			
			jArr.add(jMember);
		}
		
		try {
			PrintWriter out = response.getWriter();
			out.println(jArr);
			out.flush();
			out.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping("goYouStage.st")
	public ModelAndView goYouStage(@ModelAttribute("loginUser") Member m, @RequestParam("targetId") String targetId, ModelAndView mv) {
		
		Member member = mService.getMemberInfo(targetId);
		
		int boardCount = bService.countBoard(targetId);
		
		String userId = m.getUserId();
		String followCheck = mService.getFollowCheck(userId, targetId);
		
		register_Pro proInfo = mService.getProInfoShow(targetId);
		
		ArrayList<Board> socialList = bService.getBoardList(targetId, 1, 6, 1);
		ArrayList<Board> searchList = bService.getBoardList(targetId, 1, 6, 2);
		ArrayList<Board> columnList = bService.getBoardList(targetId, 1, 6, 3);
		ArrayList<Board> reviewList = bService.getBoardList(targetId, 1, 6, 4);
		
		int socialCount = bService.getboardAllCount(targetId, 1);
		int searchCount = bService.getboardAllCount(targetId, 2);
		int columnCount = bService.getboardAllCount(targetId, 3);
		int reviewCount = bService.getboardAllCount(targetId, 4);
		
		if(member != null) {
			mv.addObject("member", member);
			mv.addObject("boardCount", boardCount);
			mv.addObject("followCheck", followCheck);
			mv.addObject("proInfo", proInfo);
			mv.addObject("socialList", socialList);
			mv.addObject("searchList", searchList);
			mv.addObject("columnList", columnList);
			mv.addObject("reviewList", reviewList);
			mv.addObject("socialCount", socialCount);
			mv.addObject("searchCount", searchCount);
			mv.addObject("columnCount", columnCount);
			mv.addObject("reviewCount", reviewCount);
			mv.setViewName("You_Stage");
		}
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value = "follow.st", method=RequestMethod.POST)
	public void follow(@ModelAttribute("loginUser") Member m, @RequestBody JSONObject obj, HttpServletResponse response) {
		
		String userId = m.getUserId();
		String targetId = (String) obj.get("userId");
		
		int count = mService.isExistFollow(userId, targetId);

		if(count <= 0) {
			mService.insertFollow(userId, targetId);
		} else {
			int followCode = mService.getFollowCode(userId, targetId);
			mService.updateFollow(followCode);
		}
		
		int result = mService.doFollow(userId, targetId);
		
		try {
			PrintWriter out = response.getWriter();
			
			if(result == 2) {
				out.append("ok");
			} else {
				out.append("fail");
			}
			
			out.flush();
			out.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "cancleFollow.st", method=RequestMethod.POST)
	public void cancleFollow(@ModelAttribute("loginUser") Member m, @RequestBody JSONObject obj, HttpServletResponse response) {
		
		String userId = m.getUserId();
		String targetId = (String) obj.get("userId");
		
		int followCode = mService.getFollowCode(userId, targetId);
		
		mService.deleteFollow(followCode);
		int result = mService.cancleFollow(userId, targetId);
		
		try {
			PrintWriter out = response.getWriter();
			
			if(result == 2) {
				out.append("ok");
			} else {
				out.append("fail");
			}
			
			out.flush();
			out.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@ResponseBody
	@RequestMapping(value="reportMember.st", method=RequestMethod.POST)
	public String reportMember(@RequestBody JSONObject obj) {
		
		int category = Integer.parseInt((String) obj.get("category"));
		String content = (String) obj.get("content");
		String report_from = (String) obj.get("report_from");
		String report_to = (String) obj.get("report_to");
		
		int result = mService.reportMember(category, content, report_from, report_to);
		
		if(result > 0) {
			return "ok";
		} else {
			return "false";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="getBoardList.st", method=RequestMethod.POST)
	public void getBoardList(@RequestBody JSONObject obj, HttpServletResponse response, HttpServletRequest request) {
		
		response.setContentType("application/json; charset=UTF-8");
		
		String userId = (String) obj.get("userId");
		
		int lastBoardCount = Integer.parseInt((String) obj.get("boardCount")) + 1;
		int count = lastBoardCount / 6;
		int start = (6 * count) + 1;
		int end = (6 * count) + 20;
		
		int category = Integer.parseInt((String) obj.get("boardCategory"));
		
		ArrayList<Board> boardList = bService.getBoardList(userId, start, end, category);
		
		JSONArray jArr = new JSONArray();
		for(Board board : boardList) {
			JSONObject jBoard = new JSONObject();
			jBoard.put("board_title", board.getBoard_title());
			jBoard.put("board_number", board.getBoard_number());
			jBoard.put("board_category", board.getBoard_category());
			jBoard.put("index", lastBoardCount++);
			
			String file_path = "";
			int index = 0;
			int length = 0;
			String contextPath = request.getContextPath();
			
			ArrayList<BoardFile> boardFile = board.getBoardFile();
			for(BoardFile bf : boardFile) {				
				index = bf.getFile_path().indexOf("/resources");
				length = bf.getFile_path().length();
				file_path = contextPath + "/" + bf.getFile_path().substring(index, length) + "/" + bf.getFile_change_name();
				
				jBoard.put("file_path", file_path);
			}
			
			jArr.add(jBoard);
		}	
		
		try {
			PrintWriter out = response.getWriter();
			out.println(jArr);
			out.flush();
			out.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}
