package kr.or.ddit.room.repository;

import java.util.List;

import kr.or.ddit.common.vo.EnterVO;
import kr.or.ddit.common.vo.RoomVO;

public interface RoomRepositoryI {
	public List<RoomVO> listRoomVO(String mem_id);
	
	public int insertRoom(RoomVO roomVo);
	
	public int insertEnter(EnterVO enterVo);
	
	public int deleteRoom(EnterVO enterVo);
}
