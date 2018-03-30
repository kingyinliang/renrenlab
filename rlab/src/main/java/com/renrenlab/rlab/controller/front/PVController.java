package com.renrenlab.rlab.controller.front;

import com.renrenlab.rlab.common.util.HttpRequestDeviceUtil;
import com.renrenlab.rlab.model.KeywordInfo;
import com.renrenlab.rlab.model.PVStatInfo;
import com.renrenlab.rlab.service.IComonService;
import com.renrenlab.rlab.service.IPVService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * Created by guanjipeng on 2017/11/29.
 */
@Controller
@RequestMapping("front/pv")
public class PVController {

    @Autowired
    IPVService ipvService;

    @Autowired
    IComonService comonService;

    /**
     * 获取指定日期范围的pv数据
     *
     * @param day
     * @return
     */
    @RequestMapping("statistics")
    public String getPV(Model model, HttpServletRequest request, @RequestParam Integer day,
                        @RequestParam(required = false, defaultValue = "30") Integer searchTermDays) {

        //类目指数
        List<Map<String, Object>> rankList = ipvService.rankList();
        //机构指数
        List<Map<String, Object>> orgRank = ipvService.getOrgRank();
        List<PVStatInfo> pvStatInfos = ipvService.getPV(day);
        double sumCounts = Double.valueOf(rankList.get(0).get("sumCount").toString());
        double sumIndex = Double.valueOf(orgRank.get(0).get("sumIndex").toString());
        double sum = (sumCounts + sumIndex) * 0.0382;
        pvStatInfos.forEach(pvStatInfo -> {
            double index = sum + pvStatInfo.getPvCount() * 0.618;
            pvStatInfo.setPvCount(Double.valueOf(String.format("%.2f", index)));
        });
        List<KeywordInfo> info7 = comonService.checkSearchTerm(7);
        List<KeywordInfo> info15 = comonService.checkSearchTerm(15);
        List<KeywordInfo> info30 = comonService.checkSearchTerm(30);
        model.addAttribute("info7", info7);
        model.addAttribute("info15", info15);
        model.addAttribute("info30", info30);

        model.addAttribute("orgRank", orgRank);
        model.addAttribute("rankList", rankList);
        model.addAttribute("pv", pvStatInfos);

        if (HttpRequestDeviceUtil.isMobileDevice(request)) {
            return "mobile/page/rank";
        }
        return "front/manage/rank";
    }

}
