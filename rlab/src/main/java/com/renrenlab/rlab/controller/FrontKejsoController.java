package com.renrenlab.rlab.controller;

import com.renrenlab.rlab.common.util.HttpRequestDeviceUtil;
import com.renrenlab.rlab.service.IKejsoService;
import com.renrenlab.rlab.vo.KejsoPaperListInfo;
import com.renrenlab.rlab.vo.KejsoProListInfo;
import com.renrenlab.rlab.vo.KejsoRelatedInfo;
import com.renrenlab.rlab.vo.KejsoSearchInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

/**
 * 科搜模块
 * @author Renrenlab
 *
 */
@Controller
@RequestMapping("/front/kejso")
public class FrontKejsoController {
	
	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private IKejsoService kejsoService ;
	

   /**
    * 跳转到相关知识页
    * @param model
    * @param query
    * @return
    */
    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String toSearch(HttpServletRequest request,Model model,@RequestParam(required = false) String query) {
    	model.addAttribute("keyword", query);
    	KejsoSearchInfo searchInfo = kejsoService.SearchMsgFromKejso(query);
		model.addAttribute("result", searchInfo);
		boolean isMobileDevice = HttpRequestDeviceUtil.isMobileDevice(request);
		log.debug("是否手机端登陆,{}",isMobileDevice);
		if(isMobileDevice){
			if(searchInfo==null||searchInfo.getSimilarFields()==null){
				return "/mobile/page/super_search_null";
			}
			return "/mobile/page/super_search";
		}
    	if(searchInfo==null){
    		return "/front/page/seientific_null";
    	}
        return "/front/page/scientific_search";
    }
    /**
     * 更多论文页
     * @param model
     * @param query
     * @param pageNo
     * @param pageSize
     * @return
     */
    @RequestMapping(value = "/morePaper", method = RequestMethod.GET)
    public String morePaper(HttpServletRequest request,Model model,
    		@RequestParam(value = "query", required = false) String query,
    		@RequestParam(value = "pageNo", required = true) Integer pageNo,
    		@RequestParam(value = "pageSize", required = false) Integer pageSize) {
    	model.addAttribute("keyword", query);
    	model.addAttribute("pageNo", pageNo);
    	model.addAttribute("pageSize", pageSize);
    	KejsoPaperListInfo paperList = kejsoService.morePaper(query,pageNo,pageSize);
    	if(paperList==null){
    		return "/front/page/seientific_null";
    	}
    	model.addAttribute("result", paperList);
    	return "/front/page/thesis";
    }
    /**
     * 更多项目页
     * @param model
     * @param query
     * @param pageNo
     * @param pageSize
     * @return
     */
    @RequestMapping(value = "/morePro", method = RequestMethod.GET)
    public String morePro(HttpServletRequest request,Model model,
    		@RequestParam(value = "query", required = false) String query,
    		@RequestParam(value = "pageNo", required = true) Integer pageNo,
    		@RequestParam(value = "pageSize", required = false) Integer pageSize) {
    	KejsoProListInfo proList = kejsoService.morePro(query,pageNo,pageSize);
    	model.addAttribute("keyword", query);
    	model.addAttribute("pageNo", pageNo);
    	model.addAttribute("pageSize", pageSize);
    	if(proList==null){
    		return "/front/page/seientific_null";
    	}
    	model.addAttribute("result", proList);
    	return "/front/page/project";
    }
    /**
     * 更多资讯页
     * @param model
     * @param query
     * @param pageNo
     * @param pageSize
     * @return
     */
    @RequestMapping(value = "/moreRelatedInfo", method = RequestMethod.GET)
    public String moreRelatedInfo(HttpServletRequest request, Model model,
								  @RequestParam(value = "query", required = false) String query,
								  @RequestParam(value = "pageNo", required = true) Integer pageNo,
								  @RequestParam(value = "pageSize", required = false) Integer pageSize) {
    	KejsoRelatedInfo relatedList = kejsoService.moreRelatedInfo(query,pageNo,pageSize);
    	model.addAttribute("keyword", query);
    	model.addAttribute("pageNo", pageNo);
    	model.addAttribute("pageSize", pageSize);
		if(relatedList==null){
    		return "/front/page/seientific_null";
    	}
    	model.addAttribute("result", relatedList);
    	return "/front/page/message";
    }




}
