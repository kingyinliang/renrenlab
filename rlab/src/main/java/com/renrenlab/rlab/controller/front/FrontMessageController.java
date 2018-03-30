package com.renrenlab.rlab.controller.front;

import com.renrenlab.rlab.common.response.Response;
import com.renrenlab.rlab.common.response.ResponseHelper;
import com.renrenlab.rlab.controller.bg.LeaveMessageController;
import com.renrenlab.rlab.model.LeaveMessageInfo;
import com.renrenlab.rlab.service.LeaveMessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by renrenlab on 18/3/19.
 * 留言
 */

@Controller
@RequestMapping(value = "/front/leavemessage")
public class FrontMessageController {
    @Autowired
    LeaveMessageService leaveMessageService;


    @RequestMapping(value = "/addMessage", method = RequestMethod.POST)
    @ResponseBody
    public Response updateState(HttpServletRequest request,
                                @RequestBody LeaveMessageInfo leaveMessageInfo){
        Integer result = leaveMessageService.addMessage(leaveMessageInfo);
        if (result != 1){
            return ResponseHelper.createErrorResponse("留言发布失败");
        }
        return ResponseHelper.createSuccessResponse();
    }
}
