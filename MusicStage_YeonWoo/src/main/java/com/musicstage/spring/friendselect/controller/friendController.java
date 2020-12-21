package com.musicstage.spring.friendselect.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.TreeSet;
import java.util.stream.Stream;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.musicstage.spring.friendselect.service.friendService;
import com.musicstage.spring.friendselect.vo.fPageInfo;
import com.musicstage.spring.friendselect.vo.getPageInfo;
import com.musicstage.spring.friendselect.vo.selecVo;
import com.musicstage.spring.friendselect.vo.upda;
import com.musicstage.spring.member.model.service.MemberService;
import com.musicstage.spring.member.model.vo.Member;
import com.musicstage.spring.member.model.vo.register_Pro;
import com.musicstage.spring.member.model.vo.register_file;

import oracle.net.aso.*;
@Controller
@SessionAttributes({"Rv","loginUser","registerUser_Pro","list","total"})
public class friendController {
   
   private Logger logger = LoggerFactory.getLogger(friendController.class);
   
   @Autowired
   private friendService fService;
   
   @Autowired
   private MemberService mService;
   
   @RequestMapping("board.fo")
   public ModelAndView header( HttpSession session,@RequestParam(value = "page", required = false, defaultValue ="1")Integer page, ModelAndView mv ) {
      
      Member rv  = (Member)session.getAttribute("loginUser");
      String id = rv.getUserId();
      System.out.println("id : "+id);
      List<selecVo> arr = fService.selectInt1(id);
      System.out.println(arr+"sdfds");
      
   
         
         int resultarr[] = new int [4];
         int fir= 0;
         int sce= 0;
         int thi= 0;
         int fourth= 0;
         
         for(int i=0; i<arr.size(); i ++) {
            selecVo ssv =   arr.get(i);
            resultarr[i] =  ssv.getLike_interest();
         }
         fir = resultarr[0];
         sce = resultarr[1];
         thi = resultarr[2];
         fourth = resultarr[3];
         
         
         
         selecVo sv = new  selecVo(fir,sce,thi,fourth,id);
         
         List<String> firstM = fService.useridList(sv);
         List<String> firsta = null;
         if(firstM.size() == 1) {
            firsta = null;
         }else {
            firsta = firstM;
         }
         List<String> secound = fService.useridList1(sv);
         List<String> firstb = null;
         if(secound.size() == 1) {
            firstb = null;
         }else {
            firstb = secound;
         }
         List<String> third = fService.useridList2(sv);
         List<String> firstc = null;
         if(third.size() == 1) {
            firstc = null;
         }else {
            firstc = third;
         }
         List<String> four = fService.useridList3(sv);
         List<String> firstd = null;
         if(four.size() == 1) {
            firstd = null;
         }else {
            firstd = four;
         }
         
         ArrayList<String> lii= new ArrayList<String>();
         if(firstd == null) {
         }else {
            for(int z= 0; z<firstd.size(); z++) {
               lii.add(firstd.get(z));
            }
         }
         if(firstc == null) {
         }else {
            for(int z= 0; z<firstc.size(); z++) {
               lii.add(firstc.get(z));
            }

         }
         
         if(firstb == null) {
         }else {
            for(int z= 0; z<firstb.size(); z++) {
               lii.add(firstb.get(z));
            }

         }
         
         if(firsta == null) {
         }else {
            for(int z= 0; z<firsta.size(); z++) {
               lii.add(firsta.get(z));
            }

         }
         System.out.println("제거전 :"+lii);
         ArrayList<String> li= new ArrayList<String>();
         
         for(String item : lii) {
            if(!li.contains(item)) {
               li.add(item);
            }
         }
         
      System.out.println("제거 :"+li);
         if(li.get(0) != null || li.get(1) != null ||li.get(2) != null || li.get(3) != null) {
      
            ArrayList<Member> Rv1= new ArrayList<Member>(); 
         for(int i=0;i<li.size();i++) {
                  String ga =(String)   li.get(i);
                  Member text =(Member) fService.selectListList(ga);
                  Rv1.add(text);
         }
         
         int total =    Rv1.size();
         System.out.println("RV입니다 : " + Rv1);
         System.out.println(total);
            mv.addObject("Rv", Rv1);
            mv.addObject("total", total);
            mv.setViewName("redirect:allFeed.bo");
         
         }else {
            mv.addObject("Rv", null);
            mv.addObject("total", 0);
            mv.setViewName("home");
         }
      return mv;
      
   }
   
   @RequestMapping("testyoustage.fo")
   public String youstage(  HttpServletRequest request) {
   String userid =    request.getParameter("userid");
   ModelAndView mv =   new ModelAndView();
   System.out.println("userid : "+userid);
   Member Qv = (Member)fService.selectInfo(userid);
   Member select = null;
   register_Pro rpq = null;
   System.out.println(Qv.getPro_approve());
   if(Qv.getPro_approve() == 'Y') {
      ArrayList<register_Pro>    arpq = (ArrayList<register_Pro>) fService.pro(userid);
      rpq =   arpq.get(arpq.size()-1);
      select = (Member)fService.selectInfo(userid);
   }else {
      select = (Member)fService.selectInfo(userid);
      
   }
   request.setAttribute("member", select);
   request.setAttribute("proInfo",rpq );
   return "stage/You_Stage";
   }
   
   
   @RequestMapping("userid.fo")
   public String userid_pwd_select() {
      return "member/userid_pwd_select";
      
   }
   
   @RequestMapping("userSelect.fo")
   @ResponseBody
   public String dupId(@RequestParam ("userName") String userName, @RequestParam ("emailAdress")String emailAdress, HttpServletResponse response) throws IOException {
      JSONObject obj = new JSONObject();
      Member isUsable = (Member)fService.checkIdDup(userName,emailAdress);
      obj.put("name", isUsable.getNickName());
      obj.put("id", isUsable.getUserId());
      
      
      return obj.toJSONString();
   }
   
   @RequestMapping("filedelect.fo")
   @ResponseBody
   public JSONObject filedelect(@RequestParam ("num") String num1, HttpServletResponse response) throws IOException {
      JSONObject obj = new JSONObject();
      int num = Integer.parseInt(num1);
      int isUsable = (int)fService.filedelect(num);
      obj.put("num", isUsable);
      
      return  obj;
   }
   
   
   @RequestMapping("update.fo")
   public String expert(MultipartHttpServletRequest multipartRequest,
         HttpSession session,Model model,SessionStatus sessiond,@ModelAttribute register_Pro rp ,HttpServletResponse response, HttpServletRequest request, SessionStatus sessionStatus) {
      register_Pro reP = (register_Pro)session.getAttribute("registerUser_Pro");
      if(rp.getSpecialrt_field().isEmpty() || "".equals(rp.getSpecialrt_field())) {
      rp.setSpecialrt_field(null);
      }else {
         reP.getSpecialrt_field();
      }
      
      Member mem = (Member)session.getAttribute("loginUser");
      String userId = mem.getUserId();
      int ipNo =    reP.getRegister_no();
      rp.setRegister_no(ipNo);
      rp.setRegister_user(userId);
      
      Iterator<String> fileNames =    multipartRequest.getFileNames();

      String fileName = fileNames.next();
      List<String> fileList = fileProcess(userId, multipartRequest, request,rp);
      
      
      String tsc = null;
      String cate = rp.getTop_special_category();
      if(cate.isEmpty() || "".equals(cate)) {
         tsc = rp.getTop_special_category();
      }else {
         tsc = reP.getTop_special_category();
      }
      String msc = rp.getMiddle_special_category();
      String cate2 = null;
      
      if(msc.isEmpty() || "".equals(msc)) {
         rp.setMiddle_special_category(null);
          cate2 =   "/"+rp.getMiddle_special_category();
      }else {
         cate2 =   "/"+rp.getMiddle_special_category();
      }
      String catego = tsc.concat(cate2);
      rp.setTop_special_category(catego);
      
      String Ss= rp.getService_type();
      String ggg = null;
      if(Ss.isEmpty() || Ss.equals("")) {
      String st =    reP.getService_type();
         rp.setService_type(st);
      ggg = rp.getService_type();
      }else {
         ggg = rp.getService_type();
      }
      
      String aaa= rp.getForm_of_provision();
      String ggsg = null;
      if(aaa.isEmpty() || aaa.equals("")) {
      String st =    reP.getForm_of_provision();
         rp.setForm_of_provision(st);
         ggsg = "/"+rp.getForm_of_provision();
      }else {
         ggsg = "/"+rp.getForm_of_provision();
      }
      
      String eee= rp.getAdditional_options();
      String ao = null;
      if(eee.isEmpty() || eee.equals("")) {
      String st =    reP.getAdditional_options();
         rp.setAdditional_options(st);
         ao = "/"+rp.getAdditional_options();
      }else {
         ao = "/"+rp.getAdditional_options();
      }
      
      
      String St = ggg.concat(ggsg).concat(ao);
      
      rp.setService_type(St);

      rp.setRegister_approve('W');
      
      String fdg ="W";
      String id =    mem.getUserId();
      
      upda d =   new upda(fdg,id);
      
      int resultNum =    mService.updateW(d);
      if(resultNum >0 ) {
         System.out.println("멤버 ?  ?   ?   ?");
      }
   
      int result = fService.updatePro(rp);
      System.out.println(result);
      if(result >0) {
         Member m = (Member)session.getAttribute("loginUser");
         String userid = m.getUserId();
         Member upMember = mService.getMemberInfo(userid);
         List<register_Pro> rp1 =(List<register_Pro>)mService.register_pro(userid);
         String user = rp1.get(0).getRegister_user();
         List<register_file> rf = mService.userfileName(user);
         System.out.println("rp : "+ rp1);
         int numd = rp1.size();
         System.out.println(rf);
         register_Pro tb = null;
         if(rp1.size()>0) {
            tb = (register_Pro)rp1.get(numd-1);
         }else {
            tb = null;
         }
         model.addAttribute("list", rf);
         model.addAttribute("fileName", null);
         model.addAttribute("registerUser_Pro", tb);
         model.addAttribute("loginUser", upMember);
         return "redirect:home.do";   
      }else {
         return "errorPage";
      }
   }
   

   private List<String> fileProcess(String userId, MultipartHttpServletRequest multipartRequest,HttpServletRequest request, register_Pro rp) {
      List<String> fileList = new ArrayList<String>();
      Iterator<String> fileNames = multipartRequest.getFileNames();
      while(fileNames.hasNext()) {
         register_file ff =    new register_file();
         int id = rp.getRegister_no();
         String uu =   rp.getRegister_user();
         ff.setfile_upload(uu);
         int fnum = mService.checkfirstNumber();
          int aaa = mService.checkLast(id);
           if(fnum == 0) {
              ff.setFile_number(1);
           }else {
            int gg = mService.fileNumber();
               int re = gg+1;
               ff.setFile_number(re);
         }
         
         String fileName = fileNames.next();
         
         MultipartFile mFile = multipartRequest.getFile(fileName);
         String originFileName=mFile.getOriginalFilename();
         ff.setFile_origin_name(originFileName);

         fileList.add(originFileName);
         
         int g = 0;
         
         String rr =   originFileName.substring(originFileName.lastIndexOf('.')+1);
         ff.setFile_extension_name(rr);
         if(rr.equals( "JPG") ||rr.equals( "JPG")||rr.equals( "JPEG")||rr.equals( "PNG")||rr.equals( "GIF")||rr.equals( "BMP")) {
             g = 1;
             ff.setFile_type(g);
         }else if(rr.equals( "MP4") ||rr.equals( "MPEG4") || rr.equals( "MOV") || rr.equals( "AVI")) {
             g = 2;
             ff.setFile_type(g);
         }else if(rr.equals( "MP3") || rr.equals( "MPEG3") || rr.equals( "WAV") || rr.equals( "WMA")) {
             g =3;
             ff.setFile_type(g);
         }else {
            g =4;
             ff.setFile_type(g);
         }
         
         
         String root1 = request.getSession().getServletContext().getRealPath("resources");
         String file_thum = root1+"\\images"+"\\logo.png";  // WINDOW
//         String file_thum = root1+"/images"+"/logo.png"; // MAC
         ff.setFile_thumbnail(file_thum);
         String savePath = root1 + "\\muploadFiles"; // WINDOW
//         String savePath = root1 + "/muploadFiles"; // MAC
         ff.setFile_path(savePath);
         File folder = new File(savePath);
         if(!folder.exists()) {
            folder.mkdirs();
         }
         
         SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
         
         String renameFileName = sdf.format(new Date(System.currentTimeMillis()))+"."+originFileName.substring(originFileName.lastIndexOf(".")+1);
         System.out.println(renameFileName);
         ff.setFile_change_name(renameFileName);
         String renamePath = folder +"\\"+ renameFileName; // WINDOW
//         String renamePath = folder +"/"+ renameFileName; // MAC
         String size = "";
         File mFile1 = new File(renamePath);
         try {
            mFile.transferTo(new File(renamePath));
            
            if(mFile1.exists()) {
               long lFileSize =  mFile1.length();
               size = Long.toString(lFileSize)+"bytes";
            }else {
               long lFileSize =  mFile1.length();
               size = Long.toString(lFileSize)+"bytes";
            }
            
            ff.setFile_size(size);
            ff.setFile_thumbnail("0"); 
         } catch (IOException e) {
            e.printStackTrace();
         }
         
         if(!originFileName.isEmpty() || !"".equals(originFileName)) {
            System.out.println("originFileName: "+originFileName);
            System.out.println("geagew:?  ?  ?  ?  ");
            fService.insertFile(ff);
         }
         
      }
      return fileList;
   }
   
   @RequestMapping("final.fo")
   public String  finall(HttpSession session,Model model,@ModelAttribute("loginUser") Member m) {
      String userid = m.getUserId();
      List<register_Pro> rp1 =(List<register_Pro>)mService.register_pro(userid);
      List<register_file> rf = null;
      register_Pro tb = null;
      if(!rp1.isEmpty()) {
         String user = rp1.get(0).getRegister_user();
         rf = mService.userfileName(user);
         System.out.println("rp : "+ rp1);
         tb = rp1.get(0);
         int numd = rp1.size();
         System.out.println(rf);
      }else {
            rp1 = null;
         tb = null;
      }
      System.out.println("최신 버전"+tb);
      model.addAttribute("list", rf);
      model.addAttribute("registerUser_Pro", tb);
      return "member/expert_Enrollment";
   }
   
      @RequestMapping("final2.fo")
      public String  finall2(HttpSession session,Model model) {
      return "member/expert_Enrollment2";
      }
      
      
      
      @RequestMapping("expert.fo")
      public String expert(MultipartHttpServletRequest multipartRequest,
            HttpSession session,@ModelAttribute register_Pro rp ,HttpServletResponse response, HttpServletRequest request, SessionStatus sessionStatus) {
         
         int re3 = mService.registerNum();
            System.out.println("re3 : "+ re3);
            
             int num =mService.checkNo();
             System.out.println(num);
         if(num == 0) {
            rp.setRegister_no(0);
         }else {
         int   re = mService.registerNum();
         System.out.println("re : "+ re);
         int gg = re+1;
         System.out.println("gg : "+gg);
         rp.setRegister_no(gg);
         }
         
         SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
         String ff =   sdf.format(new Date(System.currentTimeMillis()));
         rp.setRegister_date(ff);
         
         Member member1 = (Member) session.getAttribute("registerUser");
         System.out.println("member1 :"+member1);
         Member member2 = (Member) session.getAttribute("loginUser");
         
         String userId = null;
         
         if(member1.getUserId() != null) {
            userId = member1.getUserId();
            rp.setRegister_user(userId);
         } else if(member2.getUserId() != null){
            userId = member2.getUserId();
            rp.setRegister_user(userId);
         }
         
         String tsc = null;
         String cate = rp.getTop_special_category();
         if(cate.isEmpty() || "".equals(cate)) {
            tsc = rp.getTop_special_category();
         }else {
            tsc = "NULL";
         }
         
         String msc = rp.getMiddle_special_category();
         String cate2 = null;
         if(msc == null || msc.equals("")) {
             cate2 =   "/"+"NULL";
         }else {
            cate2 =   "/"+rp.getMiddle_special_category();
         }
         
         String catego = cate.concat(cate2);
         rp.setTop_special_category(catego);
         
         String Ss= rp.getService_type();
         String ggg = null;
         if(Ss.isEmpty() || Ss.equals("")) {
         ggg = null;
         }else {
            ggg = rp.getService_type();
         }
         
         String aaa= rp.getForm_of_provision();
         String ggsg = null;
         if(aaa.isEmpty() || aaa.equals("")) {
            ggsg = "/"+"NULL";
         }else {
            ggsg = "/"+rp.getForm_of_provision();
         }
         
         String eee= rp.getAdditional_options();
         String ao = null;
         if(eee.isEmpty() || eee.equals("")) {
            ao =  "/"+"NULL";
         }else {
            ao = "/"+rp.getAdditional_options();
         }
         String St = Ss.concat(ggsg).concat(ao);
         rp.setService_type(St);
         rp.setRegister_approve('W');
         
         System.out.println("rp : " + rp);
         
         int result = mService.insertPro(rp);
         
         Map map = new HashMap();
         Enumeration eru = multipartRequest.getParameterNames();
         while(eru.hasMoreElements()) {
         String name = (String)eru.nextElement();
         String value = multipartRequest.getParameter(name);
         map.put(name, value);
      }
         
      List fileList = fileProcess1(userId, multipartRequest, request,rp);
         
      map.put("fileList", fileList);
         System.out.println(fileList);
         sessionStatus.setComplete();
         return "redirect:home.do";   
      }
      
      private List<String> fileProcess1(String userId, MultipartHttpServletRequest multipartRequest,HttpServletRequest request, register_Pro rp) {
         List<String> fileList = new ArrayList<String>();
         Iterator<String> fileNames = multipartRequest.getFileNames();
         System.out.println("?  ?  ?   ?:"+fileNames);
         while(fileNames.hasNext()) {
            register_file ff =    new register_file();
//            Member mem = (Member) session.getAttribute("loginUser");
            
            int id = rp.getRegister_no();
            System.out.println("id : "+id);
            ff.setRegister_no(id);
            String uu =   rp.getRegister_user();
            ff.setfile_upload(uu);
            int fnum = mService.checkfirstNumber();
             int aaa = mService.checkLast(id);
              if(fnum == 0) {
                 ff.setFile_number(1);
              }else {
               int gg = mService.fileNumber();
                  int re = gg+1;
                  ff.setFile_number(re);
            }
            
            
            String fileName = fileNames.next();
            
            MultipartFile mFile = multipartRequest.getFile(fileName);
            String originFileName=mFile.getOriginalFilename();
            ff.setFile_origin_name(originFileName);
            
            
            
            fileList.add(originFileName);
            
            int g = 0;
            String rr =   originFileName.substring(originFileName.lastIndexOf('.')+1);
            ff.setFile_extension_name(rr);
            if(rr.equals( "JPG") ||rr.equals( "JPG")||rr.equals( "JPEG")||rr.equals( "PNG")||rr.equals( "GIF")||rr.equals( "BMP")) {
                g = 1;
                ff.setFile_type(g);
            }else if(rr.equals( "MP4") ||rr.equals( "MPEG4") || rr.equals( "MOV") || rr.equals( "AVI")) {
                g = 2;
                ff.setFile_type(g);
            }else if(rr.equals( "MP3") || rr.equals( "MPEG3") || rr.equals( "WAV") || rr.equals( "WMA")) {
                g =3;
                ff.setFile_type(g);
            }else {
               g =4;
                ff.setFile_type(g);
            }
            
            
            String root1 = request.getSession().getServletContext().getRealPath("resources");
            String file_thum = root1+"\\images"+"\\logo.png";  // WINDOW
//            String file_thum = root1+"/images"+"/logo.png"; // MAC
            ff.setFile_thumbnail(file_thum);
            String savePath = root1 + "\\muploadFiles"; // WINDOW
//            String savePath = root1 + "/muploadFiles"; // MAC
            System.out.println(savePath);
            ff.setFile_path(savePath);
            File folder = new File(savePath);
            if(!folder.exists()) {
               folder.mkdirs();
            }
            
            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
            
            String renameFileName = sdf.format(new Date(System.currentTimeMillis()))+"."+originFileName.substring(originFileName.lastIndexOf(".")+1);
            System.out.println(renameFileName);
            ff.setFile_change_name(renameFileName);
            String renamePath = folder +"\\"+ renameFileName; // WINDOW
//            String renamePath = folder +"/"+ renameFileName; // MAC
            String size = "";
            File mFile1 = new File(renamePath);

            try {
               mFile.transferTo(new File(renamePath));
               
               if(mFile1.exists()) {
                  long lFileSize =  mFile1.length();
                  size = Long.toString(lFileSize)+"bytes";
               }else {
                  long lFileSize =  mFile1.length();
                  size = Long.toString(lFileSize)+"bytes";
               }
               
               ff.setFile_size(size);
               ff.setFile_thumbnail("0");
            } catch (IOException e) {
               e.printStackTrace();
            }
               
            int result123 =  mService.insertFile(ff);
            
         }
         return fileList;
      }
      
      
      @RequestMapping("univer.fo")
      public String univer() {

         return "member/university";

      }

      @RequestMapping("confrim.fo")
      public String confrim() {

         return "member/userid_pwd_select";

      }
   
}