package kr.or.ddit.drive.service;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.drive.repository.DriveRepositoryI;

@Transactional
@Service("DriveService")
public class DriveService implements DriveServiceI {
	
	@Resource(name="DriveRepository")
	private DriveRepositoryI driveRepository;

	@Override
	public int getUseDriveSize(String mem_id) {
		int useDriveSize = driveRepository.getUseDriveSize(mem_id);
		return useDriveSize;
	}

	@Override
	public int getPlanSize(String mem_id) {
		int planDdriveSize = driveRepository.getPlanSize(mem_id);
		return planDdriveSize;
	}
	

}
