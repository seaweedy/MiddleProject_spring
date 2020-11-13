package kr.or.ddit.room.service;

import java.util.List;

import kr.or.ddit.common.vo.EnterVO;
import kr.or.ddit.common.vo.RoomVO;

public interface RoomServiceI {
	public List<RoomVO> listRoomVO(String mem_id);
	
	public int insertRoom(RoomVO roomVo);
	
	public int insertEnter(EnterVO enterVo);
	
	public int deleteRoom(EnterVO enterVo);
	

}
