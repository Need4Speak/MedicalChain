package com.pancake.web.controller;

import com.pancake.entity.util.Result;
import com.pancake.service.component.UserService;
import com.pancake.service.pojo.CaseClassificationService;
import com.pancake.service.pojo.InfectiousDiseaseService;
import com.pancake.service.pojo.PatientBelongService;
import com.pancake.service.pojo.PatientCareerService;
import com.pancake.util.ResultUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by chao on 2017/6/13.
 */
@Controller
@RequestMapping("/record")
public class ManageController {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private PatientBelongService patientBelongService;
    @Autowired
    private PatientCareerService patientCareerService;
    @Autowired
    private CaseClassificationService caseClassificationService;
    @Autowired
    private InfectiousDiseaseService infectiousDiseaseService;

    /**
     * 跳转到添加页面
     * @return Result 对象
     */
    @RequestMapping(value = "add", method = RequestMethod.GET)
    public ModelAndView queryAll() {
        ModelAndView mav = new ModelAndView("add_record");
        try {
            mav.addObject("patientBelongList", patientBelongService.getAll());
            mav.addObject("patientCareerList", patientCareerService.getAll());
            mav.addObject("caseClassificationList", caseClassificationService.getAll());
            mav.addObject("infectiousDiseaseList", infectiousDiseaseService.getAll());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mav;
    }

    @RequestMapping(value = "save", method = RequestMethod.POST)
    public ModelAndView save() {
        ModelAndView mav = new ModelAndView("save_success");
        return mav;
    }
}
