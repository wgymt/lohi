package com.wgymt.lohi.controller;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("/wx/user/{appid}")
public class UserController {

    @GetMapping("/login")
    public String login(@PathVariable String appid, String code){
        if (StringUtils.isBlank(code)) {
            return "Empty JsCode";
        }
        return "";
    }
}
