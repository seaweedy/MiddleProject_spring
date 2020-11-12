package kr.or.ddit.member.repository;

import kr.or.ddit.common.vo.MemberVO;

public interface MemberRepositoryI {
	
	/**
	 * 입력한 ID와 비밀번호에 해당하는 회원을 반환하는 메서드
	 * @param mem_id
	 * @param mem_pass
	 * @return mem_id,mem_pass에 해당하는 MemberVO 객체
	 */
	public MemberVO loginMember(MemberVO memberVo);
	
}
