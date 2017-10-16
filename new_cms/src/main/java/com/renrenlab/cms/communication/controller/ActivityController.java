package com.renrenlab.cms.communication.controller;

import com.renrenlab.cms.communication.dao.PublishDao;
import com.renrenlab.cms.communication.model.Publish;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 发布会活动页
 */
@Controller
@RequestMapping("/wx/publish")
public class ActivityController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private PublishDao publishDao;

    /**
     * 企业录入
     *
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("/questionnaire")
    public String questionnaire(Model model, HttpSession session) {
        String wxOpenId = (String) session.getAttribute("OPENID");
        //wxOpenId="123";
        logger.info("---questionnaire---wxOpenId="+wxOpenId);
        Publish publish = publishDao.selectByOpenId(wxOpenId);
        if(publish==null){
            return "activity/questionnaire";
        }
        model.addAttribute("area",publish.getPubDistrict());
        return "activity/result";
    }

    /**
     * 结果页
     *
     * @param session
     * @return
     */
    @RequestMapping(value = "/result" , method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> result(HttpSession session, @RequestBody Publish publish) {
        Map<String,Object> map = new HashMap<>();
        String wxOpenId = (String) session.getAttribute("OPENID");
        //wxOpenId="123";
        logger.info("---result---wxOpenId="+wxOpenId);
        Publish p = publishDao.selectByOpenId(wxOpenId);
        if(p==null){
            publish.setPubWxOpenid(wxOpenId);
            publish.setPubState(1);
            if(publish.getPubDistrict()==0){
                publish.setPubLimit("20万");
                publish.setPubDiscount("5-6");
            }
            if(publish.getPubDistrict()==1){
                publish.setPubLimit("10万");
                publish.setPubDiscount("7-8");
            }
            publishDao.insertSelective(publish);
            map.put("code",200);
            map.put("desc","操作成功");
            return map;
        }
        map.put("code",201);
        map.put("desc","已提交过");
        return map;

    }
    /**
     * 结果页
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/result" , method = RequestMethod.GET)
    public String result(Model model, Integer area) {
        model.addAttribute("area",area);
        return "activity/result";
    }


    /**
     * 滚动页
     *
     * @return
     */
    @RequestMapping(value = "/list" , method = RequestMethod.GET)
    @ResponseBody
    public Map<String,Object> list(@RequestParam(value = "count",required = true) Integer count) {
        Map<String,Object> map = new HashMap<>();
        List<Publish> list = publishDao.listAll(count);
        map.put("code",200);
        map.put("list",list);
        map.put("count",list.size()+count);
        return map;

    }


}
