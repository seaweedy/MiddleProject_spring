package kr.or.ddit.drive.repository;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("DriveRepository")
public class DriveRepository implements DriveRepositoryI{
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	public int getUseDriveSize(String mem_id) {
		int size = 0;
		if(sqlSession.selectOne("drive.getUseDriveSize",mem_id)==null) {
			size = 0;
		}else {
			size = (int) sqlSession.selectOne("drive.getUseDriveSize",mem_id);
		}
		return size; 
	}

	public int getPlanSize(String mem_id) {
		if(sqlSession.selectOne("drive.getPlanSize",mem_id)==null) {
			return 0; 
		}else {
			return (int) sqlSession.selectOne("drive.getPlanSize",mem_id);
		}
		
	}

}
