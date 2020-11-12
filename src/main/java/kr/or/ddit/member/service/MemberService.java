package kr.or.ddit.member.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.common.vo.MemberVO;
import kr.or.ddit.member.repository.MemberRepositoryI;

@Transactional
@Service("MemberService")
public class MemberService implements MemberServiceI {
	
	@Resource(name="MemberRepository")
	private MemberRepositoryI memberRepository;
	
	public MemberVO loginMember(MemberVO memberVo) {
		MemberVO loginVo = memberRepository.loginMember(memberVo);
		return loginVo;
	}

}
