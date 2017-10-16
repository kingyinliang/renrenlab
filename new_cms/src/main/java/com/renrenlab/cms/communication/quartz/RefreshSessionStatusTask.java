package com.renrenlab.cms.communication.quartz;

import com.renrenlab.cms.communication.model.SessionBaseInfo;
import com.renrenlab.cms.communication.model.SessionHistory;
import com.renrenlab.cms.communication.model.SessionMessage;
import com.renrenlab.cms.communication.service.ISessionBaseInfoService;
import com.renrenlab.cms.communication.service.ISessionHistoryService;
import com.renrenlab.cms.communication.service.ISessionMessageService;
import com.renrenlab.cms.communication.service.ISessionMessageTmpService;
import com.renrenlab.cms.communication.vo.SessionBriefInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

import static com.renrenlab.cms.common.constant.Constant.*;

/**
 * 更新会话状态
 *
 * Created by lihongxun on 2017/4/8.
 */
@Component
public class RefreshSessionStatusTask {

    private static Logger logger = LoggerFactory.getLogger(RefreshSessionStatusTask.class);

    @Autowired
    private ISessionBaseInfoService sessionService;

    @Autowired
    private ISessionHistoryService sessionHistoryService;

    @Autowired
    private ISessionMessageService messageService;

    @Autowired
    private ISessionMessageTmpService messageTmpService;


    // 用户最后一条消息
    private SessionMessage uMsg, sMsg;
    //当前会话最后一条消息
    private SessionMessage sMsgTmp;

    /**
     * 更新会话状态
     */
    void refreshStatus() {
        logger.info("invoke--------------RefreshSessionStatusTask");

        List<SessionBriefInfo> briefInfos = sessionService.selectAllSsId();
        for (SessionBriefInfo briefInfo : briefInfos) {
            Long cTime = System.currentTimeMillis();

            switch (briefInfo.getSsState()) {
                case SESSION_PENDING:
                    // 待接入
                    checkPending(cTime, briefInfo);
                    break;
                case SESSION_CHATTING:
                    // 正在聊天
                    checkChatting(cTime, briefInfo);
                    break;
                case SESSION_OVER:
                    // 会话结束
                    checkOver(cTime, briefInfo);
                    break;
                default:
                    break;
            }
        }
    }

    /**
     * 待接入会话
     * <p>
     * 会话状态从 0 到 3
     */
    private void checkPending(Long cTime, SessionBriefInfo briefInfo) {
        sMsgTmp = messageTmpService.selectLastMsgBySsId(briefInfo.getSsId());
        if (sMsgTmp != null) {
            if (cTime - sMsgTmp.getmTime().getTime() >= OVERTIME_48)
                updateSession(briefInfo.getSsId(), SESSION_PASSED);
        } else {
            sMsg = messageService.selectLastMsgBySsIdFromUser(briefInfo);

            if(sMsg == null)
                return;

            if (cTime - sMsg.getmTime().getTime() >= OVERTIME_48)
                updateSession(briefInfo.getSsId(), SESSION_PASSED);
        }

    }

    /**
     * 正在聊天会话
     * <p>
     * 1 到 2  1 到 0
     */
    private void checkChatting(Long cTime, SessionBriefInfo briefInfo) {
        // 用户最后一条消息
        sMsgTmp = messageTmpService.selectLastMsgBySsId(briefInfo.getSsId());
        SessionHistory sessionHistory = sessionHistoryService.selectLast(briefInfo.getSsId());

        if (sMsgTmp != null) {
            if ((cTime - Long.parseLong(sessionHistory.gethValue()) > OVERTIME_30)
                    && (cTime - sMsgTmp.getmTime().getTime() > OVERTIME_30)
                    && (briefInfo.getuId() == sMsgTmp.getmFrom())) {
                finishSession(sessionHistory, cTime);
                updateSession(briefInfo.getSsId(), SESSION_PENDING);
            } else {
                finishSession(sessionHistory, cTime);
                updateSession(briefInfo.getSsId(), SESSION_OVER);
            }
        } else {
            sMsg = messageService.selectLastMsgBySsId(briefInfo.getSsId());

            if (sMsg == null)
                return;

            if ((cTime - Long.parseLong(sessionHistory.gethValue()) > OVERTIME_30) &&
                    (cTime - sMsg.getmTime().getTime() > OVERTIME_30) &&
                    (briefInfo.getuId() == sMsg.getmFrom())) {
                finishSession(sessionHistory, cTime);
                updateSession(briefInfo.getSsId(), SESSION_PENDING);
            } else if((cTime - Long.parseLong(sessionHistory.gethValue()) > OVERTIME_30) &&
                    (cTime - sMsg.getmTime().getTime() > OVERTIME_30) &&
                    (briefInfo.getuId() != sMsg.getmFrom())) {
                finishSession(sessionHistory, cTime);
                updateSession(briefInfo.getSsId(), SESSION_OVER);
            }
        }
    }

    /**
     * 已结束会话
     * <p>
     * 2 到 3
     */
    private void checkOver(Long cTime, SessionBriefInfo briefInfo) {
        sMsgTmp = messageTmpService.selectLastMsgBySsId(briefInfo.getSsId());
        if (sMsgTmp != null) {
            if (cTime - sMsgTmp.getmTime().getTime() >= OVERTIME_48) {
                updateSession(briefInfo.getSsId(), SESSION_PASSED);
            }
        } else {
            uMsg = messageService.selectLastMsgBySsIdFromUser(briefInfo);

            if (uMsg == null)
                return;

            if (cTime - uMsg.getmTime().getTime() >= OVERTIME_48)
                updateSession(briefInfo.getSsId(), SESSION_PASSED);
        }
    }

    /**
     * 结束会话
     *
     * @param sessionHistory
     * @param cTime
     */
    private void finishSession(SessionHistory sessionHistory, Long cTime) {
        SessionHistory fs = new SessionHistory();
        fs.setsSid(sessionHistory.getsSid());
        fs.sethValue(cTime.toString());
        fs.sethKey("end");
        sessionHistoryService.insertSelective(fs);
    }

    /**
     * 更新会话状态
     *
     * @param ssId
     * @param ssState
     */
    private void updateSession(Long ssId, int ssState) {
        SessionBaseInfo session = new SessionBaseInfo();
        session.setsSid(ssId);
        session.setsState((Integer)ssState);
        sessionService.updateBySsId(session);
    }
}
