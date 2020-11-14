package kr.or.ddit.drive.controller;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.drive.service.DriveServiceI;

@RequestMapping("/drive")
@Controller
public class DriveController {
	private static final Logger logger = LoggerFactory.getLogger(DriveController.class);
	
	@Resource(name="DriveService")
	private DriveServiceI driveService;
	
	@RequestMapping("/size")
	public String driveSize(String mem_id, Model model) {
		logger.debug("드라이브");
		int planSize = driveService.getPlanSize(mem_id)*1000;
		int useSize = driveService.getUseDriveSize(mem_id)/100000;
		
		if(planSize == 0) {
			planSize = 15000;
		}
		
		int percent = (useSize*100/planSize);
		model.addAttribute("useSize", useSize);
		model.addAttribute("planSize", planSize);
		model.addAttribute("percent", percent);
		
//		RequestDispatcher dispatcher = request.getRequestDispatcher("view/ourbox/capacity.jsp");
		return "ourbox/capacity";
	}

}
