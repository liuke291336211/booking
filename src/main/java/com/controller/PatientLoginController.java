package com.controller;

import com.Entity.Admin;
import com.Entity.Patient;
import com.service.SecureService;
import com.service.impl.PatientServiceImpl;
import com.sun.tracing.dtrace.Attributes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@SessionAttributes(value = {"patient"}, types = {Patient.class})
@RequestMapping("/patientLogin")
public class PatientLoginController {
    @Autowired
    SecureService secureService;

    @Autowired
    PatientServiceImpl patientService;
    /**
     * 患者登录控制
     */
    @RequestMapping("/PatientLogin.do")
    public String PatientLogin(@RequestParam(name = "phonenum", required = true) String phonenum,
                                     @RequestParam(name = "password", required = true) String password, Map<String, Object> map){
        if (secureService.isPatientSuccess(phonenum, password)){
            //成功将病人的idphonenum存储
            Patient patient =  secureService.findPatient(phonenum);
            map.put("patient", patient);
            return "patientIndex";
        } else {
             return  "Patientfailer";
        }
    }
    @RequestMapping("/patientLogout.do")
    public String patientLogout(SessionStatus session){
        session.setComplete();
        return "redirect:/";
    }

    /**
     *
     * @param phonenum
     * @return true :表示存在为true 不重复为flase
     */
    @RequestMapping("/findPhone.do")
    @ResponseBody
    public String  findPhonenum(String phonenum){
        if(phonenum == null ||  phonenum.equals("")) {
            return "null";
        }
        boolean isPhone =  patientService.isPhonenum(phonenum);

        if(isPhone) {
            return "true";
        } else {
            return "false";
        }
    }
}
