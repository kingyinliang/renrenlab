package com.renrenlab.rlab.controller.bg;

import com.github.pagehelper.PageInfo;
import com.renrenlab.rlab.common.response.Response;
import com.renrenlab.rlab.common.response.ResponseHelper;
import com.renrenlab.rlab.model.Infomation;
import com.renrenlab.rlab.model.LeaveMessageInfo;
import com.renrenlab.rlab.service.LeaveMessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by renrenlab on 18/3/12.
 * 留言
 */
@Controller
@RequestMapping(value = "/bg/leaveMessage")
public class LeaveMessageController {
    @Autowired
    LeaveMessageService leaveMessageService;


    @RequestMapping(value = "/list")
    public String infomationList(HttpServletRequest request,
                                 Model model,
                                 @RequestParam(required = false) String keyword,
                                 @RequestParam(required = false) Integer state,
                                 @RequestParam(required = false) String beginTime,
                                 @RequestParam(required = false) String endTime,
                                 @RequestParam(required = false, defaultValue = "1") Integer pageNo,
                                 @RequestParam(required = false, defaultValue = "10") Integer pageSize,
                                 @RequestParam(required = false) String order) {
        PageInfo<LeaveMessageInfo> infomations = leaveMessageService.list(keyword, state, beginTime, endTime, pageNo, pageSize, order);
        if (beginTime == null) {
            beginTime = "2016-01-01";
        }
        if (endTime == null) {
            endTime = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        }
        model.addAttribute("keyword", keyword);
        model.addAttribute("state", state);
        model.addAttribute("infomations", infomations.getList());
        model.addAttribute("total", infomations.getTotal());
        model.addAttribute("pageNo", pageNo);
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("pages", infomations.getPages());
        model.addAttribute("beginTime", beginTime);
        model.addAttribute("endTime", endTime);
        return "bg/page/leaveAmessage";
    }

    @RequestMapping(value = "/updataState", method = RequestMethod.POST)
    @ResponseBody
    public Response updateState(HttpServletRequest request,
                                  @RequestBody LeaveMessageInfo info){
        String uname = (String) request.getSession().getAttribute("nickname");
        if (uname == null){
            uname = request.getSession().getAttribute("uid").toString();
        }
        Integer result = leaveMessageService.updateState(info.getMessageId(), (int)info.getContactState(), uname);
        if (result != 1){
            return ResponseHelper.createErrorResponse("更新数据失败");
        }else {
            return ResponseHelper.createSuccessResponse();
        }
    }

    class State{
        Integer messageId;
        Integer state;
    }
}
