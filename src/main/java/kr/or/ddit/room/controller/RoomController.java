package kr.or.ddit.room.controller;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.common.vo.EnterVO;
import kr.or.ddit.common.vo.MemberVO;
import kr.or.ddit.common.vo.RoomVO;
import kr.or.ddit.member.service.MemberServiceI;
import kr.or.ddit.room.service.RoomServiceI;

@RequestMapping("/room")
@Controller
public class RoomController {
	private static final Logger logger = LoggerFactory.getLogger(RoomController.class);
	@Resource(name="RoomService")
	private RoomServiceI roomService;
	
	@Resource(name="MemberService")
	private MemberServiceI memberService;
	
	@RequestMapping("/list")
	public String listRoom(MemberVO memberVo, Model model ) {
		logger.debug("room리스트 진입");
		logger.debug("아이디 {}" , memberVo.getMem_id());
		
		List<RoomVO> roomList = roomService.listRoomVO(memberVo.getMem_id());
		logger.debug("룸리스트 사이즈 :  {}",roomList.size());
		
		model.addAttribute("roomList",roomList);
		return"layout/listRoom";
//		return"layout/test";
	}
	
	@RequestMapping("/insertRoomView")
	public String insertRoom(MemberVO memberVo,Model model) {
		model.addAttribute("mem_id", memberVo.getMem_id());
		return "room/insertRoomForm";
	}
	
	@RequestMapping("/insertRoom")
	public String inviteList(RoomVO roomVo, String mem_id, Model model) {
		String room_content = roomVo.getRoom_content();
		logger.debug("룸 내용 {}", room_content);
		String room_name = roomVo.getRoom_name();
		logger.debug("룸 이름 {}", room_name);
		
		logger.debug("사용자 이름 {}",mem_id);
		int insertRoomCnt = roomService.insertRoom(roomVo);
		int room_seq = roomVo.getRoom_seq();
		logger.debug("룸시퀀스 {}",room_seq);
		
		
		EnterVO enterVo = new EnterVO();
		enterVo.setRoom_seq(room_seq);
		enterVo.setMem_id(mem_id);
		
		if(insertRoomCnt>0) {
			roomService.insertEnter(enterVo);
		}
		return "jsonView";
	}
	
	@RequestMapping("/inviteView")
	public String inviteView(int room_seq, String memId,Model model) {
		logger.debug("인바이트뷰");
		model.addAttribute("room_seq",room_seq);
		model.addAttribute("memId",memId);
		return "room/inviteForm";
	}
	
	@RequestMapping("/invite")
	public String invite(String other, int room_seq, Model model) {
		logger.debug("초대된사람:{}",other);
		logger.debug("방번호:{}",room_seq);
		
		EnterVO enterVo = new EnterVO();
		enterVo.setMem_id(other);
		enterVo.setRoom_seq(room_seq);
				
		memberService.enterGroup(enterVo); // enter생성 및 그룹 가입
		
		return "jsonView";
	}
	
	@RequestMapping("/otherList")
	public String otherList(String mem_id, int room_seq, String other, Model model) {
		EnterVO enterVo = new EnterVO();
		enterVo.setMem_id(other);
		enterVo.setRoom_seq(room_seq);
		
		logger.debug("회원아이디:{}",mem_id);
		logger.debug("룸시퀀스:{}",room_seq);
		logger.debug("아더:{}",other);
		
		List<MemberVO> otherList = memberService.searchMember(enterVo);
		model.addAttribute("room_seq",room_seq);
		model.addAttribute("otherList",otherList);
		model.addAttribute("mem_id",mem_id);
		return "room/invite";
	}
	
	@RequestMapping("/deleteRoom")
	public String deleteRoom(EnterVO enterVo, Model model) {
		
		enterVo.setMem_id(enterVo.getMem_id());
		enterVo.setRoom_seq(enterVo.getRoom_seq());
		
		roomService.deleteRoom(enterVo);
		
		return "ourbox/ourboxmember";
	}
}
