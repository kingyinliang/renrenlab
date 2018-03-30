package com.renrenlab.rlab.controller.bg;

import com.github.pagehelper.PageInfo;
import com.renrenlab.rlab.service.InstrumentUploadService;
import com.renrenlab.rlab.vo.InsturmentUploadHistoryInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * 仪器批量上传
 */
@Controller
@RequestMapping("/bg/instrument/upload")
public class InstrumentUploadController {

    @Autowired
    private InstrumentUploadService instrumentUploadService;

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @RequestMapping(value = "/uploadInstruments/{orgId}", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> uploadInstruments(@PathVariable Long orgId, @RequestParam("loadInput") MultipartFile file, HttpSession session) {
        Long uId = (Long) session.getAttribute("uid");
        //Long uId = 10495L;
        //orgId=23945L;
        Map<String, Object> result = instrumentUploadService.uploadInstrumentsNew(uId, orgId, file);
//        Map<String, Object> result = instrumentUploadService.uploadInstruments(uId, orgId, file);
        return result;
    }

    @RequestMapping(value = "/uploadInstruments", method = RequestMethod.GET)
    public String uploadInstruments(Model model) {
        return "/bg/page/insShareInfoToBatchUpload";
    }

    @RequestMapping(value = "/history", method = RequestMethod.GET)
    public String uploadInstrumentHistory(Model model,
                                          @RequestParam(value = "pageNo", required = false) Integer pageNo,
                                          @RequestParam(value = "pageSize", required = false) Integer pageSize) {
        if (pageNo == null) {
            pageNo = 1;
        }

        if (pageSize == null) {
            pageSize = 10;
        }

        PageInfo<InsturmentUploadHistoryInfo> list = instrumentUploadService.searchHistory(pageNo, pageSize);
        model.addAttribute("history", list.getList());
        model.addAttribute("total", list.getTotal());
        model.addAttribute("pages", list.getPages());
        model.addAttribute("pageNo", pageNo);
        model.addAttribute("pageSize", pageSize);
        return "/bg/page/insShareInfoUploadHistory";
    }

}
