package kr.or.ddit.member.service;

import java.util.List;

import kr.or.ddit.common.vo.EnterVO;
import kr.or.ddit.common.vo.MemberVO;

public interface MemberServiceI {
	
	public MemberVO loginMember(MemberVO memberVo);
	
	public List<MemberVO> searchMember(EnterVO ev);
	
	public int enterGroup(EnterVO enterVo);
}
