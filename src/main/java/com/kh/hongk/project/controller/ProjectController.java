package com.kh.hongk.project.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.hongk.approval.model.vo.PageInfo;
import com.kh.hongk.approval.model.vo.Pagination;
import com.kh.hongk.member.model.vo.Files;
import com.kh.hongk.member.model.vo.Member;
import com.kh.hongk.project.exception.ProjectException;
import com.kh.hongk.project.model.service.ProjectService;
import com.kh.hongk.project.model.vo.Pmember;
import com.kh.hongk.project.model.vo.Project;
import com.kh.hongk.project.model.vo.Pteam;
import com.kh.hongk.project.model.vo.Reply;
import com.kh.hongk.project.model.vo.Request;
import com.kh.hongk.project.model.vo.Task;
import com.kh.hongk.project.model.vo.TrReply;

@Controller
public class ProjectController {
	@Autowired
	private ProjectService pService;

	private Logger logger = LoggerFactory.getLogger(ProjectController.class);

	@RequestMapping("myProject.do")
	public ModelAndView myProject(ModelAndView mv, HttpServletRequest request) {
		// 내가 관련된 프로젝트 가져오기
		int mNo = ((Member) request.getSession().getAttribute("loginUser")).getmNo();
		// System.out.println("프로젝트 mNo : " + mNo);
		ArrayList<Project> list = pService.selectmyProject(mNo);
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		for(int i = 0; i<list.size();i++) {
			list.get(i).setDateString(format.format(list.get(i).getDeadLine())); 
		}
		System.out.println("list : " + list);

		if (list != null) {
			mv.addObject("list", list);
			mv.setViewName("project/myProject");
		}
		return mv;
	}

	@RequestMapping("project.do")
	public @ResponseBody ModelAndView projectDetail(int pId, ModelAndView mv,HttpServletRequest request) {
		// pId에 맞는 Project 정보 가져오기
		Project project = pService.projectDetail(pId);

		// pId에 맞는 pTeam 정보 가져오기
		ArrayList<Pteam> ptlist = pService.selectTeamlist(pId);
		// System.out.println("project : " + project);
		// System.out.println("pTeamList : " + ptlist);
		int mNo = ((Member) request.getSession().getAttribute("loginUser")).getmNo();
		Pmember p = new Pmember();
		p.setmNo(mNo);
		p.setpId(pId);
		ArrayList<Pteam> tCount = pService.selectTaskCount(pId);
		System.out.println(tCount);
		// 전체 task 수 
		for(int i=0; i<tCount.size(); i++) {
			for(int j =0; j<ptlist.size();j++) {
				if(tCount.get(i).getPtId() == ptlist.get(j).getPtId()) {
					ptlist.get(j).settCount(tCount.get(i).gettCount());
				}
			}
		}
		
		ArrayList<Pteam> completeTask = pService.selectCompleteTask(pId);
		
		System.out.println("ptlist :" + ptlist);
		ArrayList<Task> tl = pService.selectTaskList(p);
		System.out.println("cpt:" + completeTask);
		System.out.println(tl);
		for(int i =0; i<completeTask.size();i++) {
			for(int j=0;j<ptlist.size();j++) {
				if(completeTask.get(i).getPtId()==ptlist.get(j).getPtId()) {
					if(ptlist.get(i).gettCount() != 0) {
						double persentd = ((double)(completeTask.get(i).gettCount())/ptlist.get(j).gettCount())*100;
						System.out.println(persentd);
						int persent = (int)persentd;
						ptlist.get(j).setPersent(persent);
						System.out.println(persent);
					}
				}
			}
		}
		Pmember m = pService.selectMemberTeam(p);
		System.out.println(m);
		ArrayList<Request> rq = new ArrayList<>();
		if(m.getPtId() != 0) {
			rq = pService.selectRequestList(m.getPtId());
			for(int i = 0; i<rq.size(); i++) {
				if(rq.get(i).getTrManager() != 0) {
				Member mem = pService.selectMemberOne(rq.get(i).getTrManager());
				rq.get(i).setManager(mem.getmName());
				}
			}
		}
		System.out.println("rq : " +rq);
		if (project != null) {
			mv.addObject("tl",tl);
			mv.addObject("p", project);
			mv.addObject("pt", ptlist);
			mv.addObject("rqList",rq);
			mv.setViewName("project/projectPage");
		} else {
			throw new ProjectException("프로젝트 상세조회에 실패하였습니다");
		}

		return mv;
	}

	@RequestMapping("teamcare.do")
	public ModelAndView teamCare(ModelAndView mv, int pId) {
		// System.out.println(pId);
		ArrayList<Pteam> ptlist = pService.selectTeamlist(pId);
		// 사원 직급/사원 명 리스트 가져오기
		if (ptlist != null) {
			for (int i = 0; i < ptlist.size(); i++) {
				int ptId = ptlist.get(i).getPtId();
				ArrayList<Member> list = (ArrayList<Member>) pService.selectTmemberlist(ptId);
				// System.out.println(list);
				String mL = "";
				for (int j = 0; j < list.size(); j++) {
					mL += list.get(j).getJobCode() + " " + list.get(j).getmName() + "<br>";
				}
				ptlist.get(i).setmList(mL);
			}
		}

		System.out.println(ptlist);

		mv.addObject("pId", pId);
		if (ptlist != null) {
			mv.addObject("pt", ptlist);
			mv.setViewName("project/team/teamCare");
		}
		return mv;
	}

	@RequestMapping("teamadd.do")
	public ModelAndView teamAdd(int pId, ModelAndView mv) {
		// 프로젝트 MEMBER 조직도 가져오기
		System.out.println(pId);
		ArrayList<Member> m = pService.selectProjectMember(pId);
		System.out.println(m);
		if (m != null) {
			mv.addObject("m", m);
			mv.addObject("pId", pId);
			mv.setViewName("project/team/teamAdd");
		}
		return mv;
	}

	@RequestMapping("teaminsert.do")
	public String teamInsert(Pteam pt, @RequestParam(name = "memberList", required = false) String memberList,
			HttpServletRequest request) {
		System.out.println(memberList);
		memberList += ",0";
		List<String> TmList = Arrays.asList(memberList.split(","));
		
		List<Integer> mList = new ArrayList<Integer>();

		pt.setTmList(TmList);
		System.out.println(pt);
		int result = pService.insertPteam(pt);// team 생성
		int update = 0;
		if (result > 0) {
			update = pService.updatePMember(pt);
		}
		if (update > 0) {
			return "redirect:teamcare.do?pId=" + pt.getpId();
		} else {
			throw new ProjectException("xx");
		}

	}


	@RequestMapping("askaddForm.do")
	public ModelAndView askAdd(int pId,HttpServletRequest request,ModelAndView mv) {
		int mNo = ((Member) request.getSession().getAttribute("loginUser")).getmNo();
		System.out.println("taskAdd mNo : " + mNo);
		Pmember p = new Pmember();
		p.setmNo(mNo);
		p.setpId(pId);
		Pmember pm = pService.selectMemberTeam(p);
		
		// ptId 이외의 팀 가져오기 
		ArrayList<Pteam> ptList = pService.selectOtherTeam(pm);  
		System.out.println("ptList : " + ptList);
		mv.addObject("pt",ptList);
		mv.addObject("pm",pm);
		mv.addObject("pId",pId);
		mv.setViewName("project/ask/askAdd");
		
		return mv;
	}

	@RequestMapping("progress.do")
	public ModelAndView progressUpdate(int pId,ModelAndView mv) {
		if(pId >0) {
			
			mv.addObject("pId",pId);
			mv.setViewName("project/popup/progressUpdate");
		}
		
		return mv;
	}

	@RequestMapping("proUpdateFrom.do")
	public ModelAndView projectUpdateForm(int pId, ModelAndView mv) {
		// 프로젝트 MEMBER 조직도 가져오기
		System.out.println(pId);
		ArrayList<Member> m = pService.selectMember();
		System.out.println("update Member " + m);
		ArrayList<Member> pm = pService.selectProjectMember(pId);
		Project project = pService.projectDetail(pId);
		System.out.println("update Project " + project);
		System.out.println("update ProjectMember " + pm);

		if (m != null && project != null) {
			mv.addObject("pm", pm);
			mv.addObject("m", m);
			mv.addObject("pId", pId);
			mv.addObject("p", project);
			mv.setViewName("project/projectUpdate");
		}
		return mv;
	}

	@RequestMapping("proUpdate.do")
	public String proUpdate(Project p, @RequestParam(name = "memberList", required = false) String memberList,
			HttpServletRequest request) {
		List<String> mlist = new ArrayList<>(Arrays.asList(memberList.split(",")));
		System.out.println("new List : " + mlist);
		List<Integer> mList = new ArrayList<Integer>();
		int pId = p.getpId();
		// 기존 인원 가져오기
		ArrayList<Member> m = pService.selectProjectMember(pId);
		List<String> originList = new ArrayList<String>();
		for (Member m1 : m) {
			originList.add(Integer.toString(m1.getmNo()));
		}
		System.out.println("originMember : " + originList);
		List<String> deleteList = new ArrayList<String>();
		List<String> mmList = new ArrayList<String>();
		List<Integer> dList = new ArrayList<Integer>();
		// 기존 인원과 새로 들어온 인원 비교
		Iterator iter = originList.iterator();
		while (iter.hasNext()) {
			String index = (String) iter.next();

			if (mlist.contains(index) == false) {
				deleteList.add(index);
			}
		}

		Iterator iter2 = mlist.iterator();
		while (iter2.hasNext()) {
			String index = (String) iter2.next();

			if (originList.contains(index) == false) {
				mmList.add(index);
			}
		}

		for (String s : mmList) {
			mList.add(Integer.valueOf(s));
		}

		for (String s : deleteList) {
			dList.add(Integer.valueOf(s));
		}
		System.out.println(dList);
		System.out.println(mList);
		Project dP = new Project();
		if(!dList.isEmpty()) {
			dP.setmList(dList);
			dP.setpId(p.getpId());
		}
		if(!mList.isEmpty()) {
			p.setmList(mList);			
		}

		System.out.println("a newList : " + p);
		System.out.println("dList : " + dP);
		int result1 = 1;
		// 기존 인원 삭제
		if (!dList.isEmpty()) {
			result1 = pService.deletePMember(dP);
		}
		int result = 1;
		// 새로운 인원 추가
		if (!mList.isEmpty()) {
			result = pService.insertPMember(p);
		}
		if (result > 0 && result1 > 0) {
			return "redirect:project.do?pId=" + p.getpId();

		} else {
			throw new ProjectException("xx");
		}

	}

	@RequestMapping("teamUpdateForm.do")
	public ModelAndView teamUpdateForm(int ptId, ModelAndView mv) {
		System.out.println(ptId);
		Pteam pt = pService.selectPTeam(ptId);
		int pId = pt.getpId();
		System.out.println("updateform pt : " + pt);
		// project에 맞는 사원 list 가져오기
		ArrayList<Member> m = pService.selectProjectMember(pId);
		System.out.println(m);
		// ptId에 맞는 사원 list 가져오기
		ArrayList<Member> pm = (ArrayList<Member>) pService.selectTmemberlist(ptId);
		System.out.println("udf Member list : " + pm);

		if (m != null && m != null) {
			mv.addObject("pm", pm);
			mv.addObject("m", m);
			mv.addObject("pId", pId);
			mv.addObject("pt", pt);
			mv.setViewName("project/team/teamUpdate");
		}

		return mv;

	}

	@RequestMapping("teamUpdate.do")
	public String teamUpdate(Pteam pt,RedirectAttributes rd, @RequestParam(name = "memberList", required = false) String memberList,
			HttpServletRequest request) {
		List<String> TmList = Arrays.asList(memberList.split(","));
		List<Integer> mList = new ArrayList<Integer>();
		for (String s : TmList) {
			mList.add(Integer.valueOf(s));
		}
		pt.setTmList(TmList);
		System.out.println("update pt : " + pt);
		ArrayList<Pmember> pm =(ArrayList)pService.selectTmemberlist(pt.getPtId());
		if(pm.isEmpty()) {
			pt.setPtStatus("N");
		}
		int result = pService.teamUpdate(pt);
		if (result > 0) {
			rd.addFlashAttribute("msg","팀을 수정하였습니다.");

		} else {
			rd.addFlashAttribute("msg", "팀 수정 실패");
		}

		return "redirect:teamcare.do?pId=" + pt.getpId();
	}
	
	@RequestMapping("deleteTeam.do")
	public String deleteTeam(int ptId, int pId,RedirectAttributes rd) {
		int result = pService.deleteTeam(ptId);
		if(result>0) {
			rd.addFlashAttribute("msg", "삭제 되었습니다.");
			return "redirect:teamcare.do?pId=" +pId;
		}else {
			throw new ProjectException("팀 삭제에 실패하였습니다"); 
		}
	}
	@RequestMapping("progressUpdate.do")
	public String progressUpdate(String progress,int pId) {
		System.out.println(progress);
		System.out.println(pId);
		Project p = new Project();
		p.setProgress(progress);
		p.setpId(pId);
		int result = pService.updateProgress(p);
		if(result>0)
			return "redirect:project.do?pId="+pId;
		else 
			throw new ProjectException("진행상태 변경에 실패하였습니다.");
	}
	
	
	//----------------- task--------------------------
	

	@RequestMapping("taskaddForm.do")
	public ModelAndView taskAddFrom(ModelAndView mv,HttpServletRequest request,int pId) {
		// 내가 관련된 프로젝트 가져오기
		int mNo = ((Member) request.getSession().getAttribute("loginUser")).getmNo();
		System.out.println("taskAdd mNo : " + mNo);
		Pmember p = new Pmember();
		p.setmNo(mNo);
		p.setpId(pId);
		Pmember pm = pService.selectMemberTeam(p);
		int ptId = pm.getPtId();
		
		// ptId에 맞는 조직도 가져오기
		ArrayList<Member> pmList = pService.selectTmemberlist(ptId);  
		System.out.println(pmList);
		if(!pmList.isEmpty()) {
			mv.addObject("pmList", pmList);
			mv.addObject("pm",pm);
			mv.addObject("pId",pId);
			mv.addObject("ptId",ptId);
			mv.setViewName("project/task/taskAdd");			
		}else {
			throw new ProjectException("업무 등록창 조회에 실패하였습니다.");
		}
		return mv;
		
		
	}
	@RequestMapping("askadd.do")
	public String askAdd(Request rq, HttpServletRequest request, int pId,
			Files f, @RequestParam(value="file", required=false) MultipartFile file) {
		int mNo = ((Member) request.getSession().getAttribute("loginUser")).getmNo();
		System.out.println(file.getOriginalFilename());
		if(!file.getOriginalFilename().equals("")) {
			String renameFileName = saveFile(file, request);
			
			if(renameFileName != null) {
				f.setOriginal_FileName(file.getOriginalFilename());
				f.setReName_FileName(renameFileName);
			}
		}
		rq.setTrWriter(mNo);
		System.out.println(rq);
		f.setmNo(mNo);
		
		int result = pService.insertRequest(rq);
		int result1 = pService.insertAFile(f);
		
		if(result>0 && result1>0) {
			return "redirect:project.do?pId="+pId;
		}else {
			throw new ProjectException("요청 등록에 실패하였습니다");
		}
	}
	@RequestMapping("askClick.do")
	public ModelAndView askClick(int trId,int pId, ModelAndView mv) {
		System.out.println(trId);
		
		Request rq = pService.selectAsk(trId);
		if(rq.getTrManager() != 0) {
		int manager = rq.getTrManager();
		Member m = pService.selectMemberOne(manager);
		rq.setManager(m.getmName());
		}
		
		int writer = rq.getTrWriter();
		
		Member m2 = pService.selectMemberOne(writer);
		
		rq.setWriter(m2.getmName());
		
		Files f = pService.selectAskFile(trId);
		
		if(rq != null) {
		    mv.addObject("f",f);
			mv.addObject("rq",rq);
			mv.addObject("trId",trId);
			mv.addObject("pId",pId);
			mv.setViewName("project/ask/askClick");
		}
		
		return mv;
	}
	@RequestMapping("rrList.do")
	@ResponseBody
	public String rrList(int trId) { 
		ArrayList<TrReply> treply = pService.selectTrlist(trId);
	
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		System.out.println(treply);
		return gson.toJson(treply);
	
	
}
	@RequestMapping("taskadd.do")
	public String taskAdd(Task t,HttpServletRequest request,int pId) {
		int mNo = ((Member) request.getSession().getAttribute("loginUser")).getmNo();
		t.setTwWriter(mNo);
		System.out.println(t);
		
		int result = pService.insertTask(t);
		
		if(result>0) {
			return "redirect:project.do?pId="+pId;
		}else {
			throw new ProjectException("업무 등록에 실패하였습니다");
		}
	}
	@RequestMapping("trStatusUp.do")
	public String trStatusUp(int trId) {
		
		return "";
	}

	@RequestMapping("taskClick.do")
	public ModelAndView taskClick(int twId, ModelAndView mv,
			@RequestParam(value="page", required=false) Integer page) {
		System.out.println("taskCLick : " + twId);
		Task t = pService.selectTask(twId);
		Member m = pService.selectMemberOne(t.getTwManager());
		t.setManager(m.getmName());
		System.out.println(t);
		
		// file 전체 수 
		int listCount = pService.fListCount(twId);
		int currentPage = page != null ? page : 1;
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5,6);
		ArrayList<Files> flist = pService.selectFileList(twId,pi);
		System.out.println(pi);
		if(t != null) {
			mv.addObject("pi",pi);
			mv.addObject("flist",flist);
			mv.addObject("t", t);
			mv.setViewName("project/task/taskClick");
		}
		return mv;
	}
	@RequestMapping("getManager.do")
	public String getManager(int twId, HttpServletRequest request,RedirectAttributes rd ) {
		Task t = new Task();
		t.setTwId(twId);
		int mNo = ((Member) request.getSession().getAttribute("loginUser")).getmNo();
		t.setTwManager(mNo);
		System.out.println(t);
		int result = pService.updateManager(t);
		
		if(result>0) {
			rd.addFlashAttribute("msg","담당자를 등록하였습니다.");
			return "redirect:taskClick.do?twId="+twId;
		}
		else
			throw new ProjectException("담당자 등록에 실패하였습니다.");
	}
	@RequestMapping("getRequestManager.do")
	public String getRequestManager(int trId,int pId, HttpServletRequest request, RedirectAttributes rd) {
		Request rq = new Request();
		rq.setTrId(trId);
		int mNo = ((Member) request.getSession().getAttribute("loginUser")).getmNo();
		rq.setTrManager(mNo);
		System.out.println(rq);
		int result = pService.updateRequestManager(rq);
		if(result>0) {
			rd.addFlashAttribute("msg","담당자가 등록되었습니다.");
			return "redirect:askClick.do?trId="+trId+"&pId="+pId;
		}
		else
			throw new ProjectException("담당자 등록에 실패하였습니다.");
	}

	@RequestMapping("taskfileUpload.do")
	@ResponseBody
	public String taskfileUpload(Files f,int twId,
			@RequestParam(value="file", required=false) MultipartFile file ,
			HttpServletRequest request
		) {		
		int mNo = ((Member) request.getSession().getAttribute("loginUser")).getmNo();
		System.out.println(file.getOriginalFilename());
		System.out.println(twId);
		f.setmNo(mNo);
		f.setRef_no(twId);
		if(!file.getOriginalFilename().equals("")){
			String renameFileName = saveFile(file,request);
			System.out.println(renameFileName);
			if(renameFileName != null) {
				f.setOriginal_FileName(file.getOriginalFilename());
				f.setReName_FileName(renameFileName);
			}
		}
		
		int result = pService.insertFile(f); 
		System.out.println(result);
		
		if(result>0) {
			return "success";
		}else {
			return "false";
		}
	}
	
	
	
	
// 파일 저장
	private String saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		String savePath = root + "\\TaskUpload";
		File folder = new File(savePath);
		
		if(!folder.exists())
			folder.mkdirs();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName = file.getOriginalFilename();	// -> 원래 이름으로부터 확장자 추출
		String renameFileName = sdf.format(new Date()) 
				+ originFileName.substring(originFileName.lastIndexOf("."));
		
		String renamePath = folder + "\\" + renameFileName;
		
		try {
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return renameFileName;
	}
	
	@RequestMapping("addReply.do")
	@ResponseBody
	public String insertReply(String rContent,int twId,HttpServletRequest request) {
		int mNo = ((Member) request.getSession().getAttribute("loginUser")).getmNo();
		
		Reply r = new Reply();
		r.setWrContent(rContent);
		r.setmNo(mNo);
		r.setTwId(twId);
		
		int result = pService.insertReply(r);
		
		if(result>0) {
			return "success";
		}else {
			return "fail";
		}
	}
	@RequestMapping("wrList.do")
	@ResponseBody
	public String selectReplyList(int twId) {
		ArrayList<Reply> rList = pService.selectReplyList(twId);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		System.out.println(rList);
		return gson.toJson(rList);
		
		
	}
	@RequestMapping("deleteReply.do")
	public String deleteReply(int wrId,int twId,RedirectAttributes rd) {
		System.out.println(wrId);
		int result = pService.deleteReply(wrId);
		if(result>0) {
			rd.addFlashAttribute("msg","댓글이 삭제되었습니다.");
		}
		return "redirect:taskClick.do?twId="+twId;
	}
	@RequestMapping("deleteRReply.do")
	public String deleteRReply(int rrId,int trId,int pId,RedirectAttributes rd) {
		int result = pService.deleteRReply(rrId);
		if(result>0) {
			rd.addFlashAttribute("msg","댓글이 삭제되었습니다.");
		}
		return "redirect:askClick.do?trId="+trId+"&pId="+pId;
		
	}
	@RequestMapping("twStatusUp.do")
	public String twStatusUpdate(int twId, RedirectAttributes rd) {
		int result = pService.twStatusUpdate(twId);
		System.out.println(result);
		rd.addFlashAttribute("msg","업무 상태에 변경하였습니다.");
		
		return "redirect:taskClick.do?twId="+twId;
	}
	@RequestMapping("rrInsert.do")
	public String rrInsert(TrReply reply,HttpServletRequest request,
			 @RequestParam(name = "pId", required = false) int pId,RedirectAttributes rd) {
		System.out.println(reply);
		System.out.println("pId : " + pId);
		int mNo = ((Member) request.getSession().getAttribute("loginUser")).getmNo();
		reply.setmNo(mNo);
		int result = pService.insertTrReply(reply);
		if (result > 0) {
			rd.addFlashAttribute("msg","변경사항을 등록하였습니다.");
			return "redirect:askClick.do?trId="+ reply.getTrId()+"&pId="+pId;
		} else {
			throw new ProjectException("TrReply 등록에 실패하였습니다.");
		}

	}
}

 