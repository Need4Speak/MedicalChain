package com.pancake.handler;

import com.pancake.entity.util.Const;
import com.pancake.service.message.impl.MessageService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by chao on 2017/12/5.
 */
public class PreparedMsgHandler implements Runnable{
    private final static Logger logger = LoggerFactory.getLogger(PreparedMsgHandler.class);
    private String realIp;
    private int port;
    private MessageService msgService = new MessageService();

    public PreparedMsgHandler(String realIp, int port) {
        this.realIp = realIp;
        this.port = port;
    }

    public void run() {

        String url = realIp + ":" + port;
        String ppmCollection = url + "." + Const.PPM;
        String pmCollection = url + "." + Const.PM;
        String pdmCollection = url + "." + Const.PDM;
        msgService.traversePPMAndSaveMsg(ppmCollection, pmCollection, pdmCollection, Const.PDM, realIp, port);
    }
}
