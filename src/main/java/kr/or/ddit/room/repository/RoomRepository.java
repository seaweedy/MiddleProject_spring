package kr.or.ddit.room.repository;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.common.vo.EnterVO;
import kr.or.ddit.common.vo.RoomVO;

@Repository("RoomRepository")
public class RoomRepository implements RoomRepositoryI {

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	public List<RoomVO> listRoomVO(String mem_id) {
		List<RoomVO> roomList=sqlSession.selectList("room.listRoom", mem_id);
		return roomList;
	}
	
	public int insertRoom(RoomVO roomVo) {
		int insertRoomCnt = sqlSession.insert("room.insertRoom",roomVo);
		return insertRoomCnt;
	}
	
	public int insertEnter(EnterVO enterVo) {
		int insertEnterCnt = sqlSession.insert("room.insertEnter", enterVo);
		return insertEnterCnt;
	}
	
	public int deleteRoom(EnterVO enterVo) {
		return sqlSession.update("room.deleteRoom",enterVo);
	}
}
