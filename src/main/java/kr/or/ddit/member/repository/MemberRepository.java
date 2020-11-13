package kr.or.ddit.member.repository;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.common.vo.EnterVO;
import kr.or.ddit.common.vo.MemberVO;

@Repository("MemberRepository")
public class MemberRepository implements MemberRepositoryI {
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	public MemberVO loginMember(MemberVO memberVo) {
		MemberVO loginVo = sqlSession.selectOne("member.loginMember", memberVo);
		return loginVo;
	}
	public List<MemberVO> searchMember(EnterVO ev)  {
		return sqlSession.selectList("member.searchMember",ev);
	}
	
	public int enterGroup(EnterVO enterVo) {
		return sqlSession.insert("member.enterGroup", enterVo); 
	}
}
