package kr.or.ddit.room.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.common.vo.EnterVO;
import kr.or.ddit.common.vo.RoomVO;
import kr.or.ddit.room.repository.RoomRepositoryI;

@Transactional
@Service("RoomService")
public class RoomService implements RoomServiceI {
	
	@Resource(name="RoomRepository")
	private RoomRepositoryI roomRepository; 

	public List<RoomVO> listRoomVO(String mem_id) {
		List<RoomVO> roomList = roomRepository.listRoomVO(mem_id);
		return roomList; 
	}

	public int insertRoom(RoomVO roomVo) {
		int insertRoomCnt = roomRepository.insertRoom(roomVo);
		return insertRoomCnt;  
	}

	@Override
	public int insertEnter(EnterVO enterVo) {
		int insertEnterCnt = roomRepository.insertEnter(enterVo);
		return insertEnterCnt;
	}
	
	public int deleteRoom(EnterVO enterVo) {
		return roomRepository.deleteRoom(enterVo);
	}


}
