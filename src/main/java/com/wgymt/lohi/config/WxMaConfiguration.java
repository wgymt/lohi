package com.wgymt.lohi.config;

import cn.binarywang.wx.miniapp.api.WxMaService;
import cn.binarywang.wx.miniapp.api.impl.WxMaServiceImpl;
import cn.binarywang.wx.miniapp.config.impl.WxMaDefaultConfigImpl;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class WxMaConfiguration {

    @Value("${wechat.appId:xxxxxxxx}")
    private static String appId;
    @Value("${wechat.secret:xxxxxxxx}")
    private static String secret;
    @Value("${wechat.token:xxxxxxxx}")
    private static String token;
    @Value("${wechat.aesKey:xxxxxxxx}")
    private static String aesKey;

    private static WxMaService wxMaService = null;

    @Bean
    public Object services() {
        WxMaDefaultConfigImpl config = new WxMaDefaultConfigImpl();
        config.setAppid(appId);
        config.setSecret(secret);
        config.setToken(token);
        config.setAesKey(aesKey);

        wxMaService = new WxMaServiceImpl();
        wxMaService.setWxMaConfig(config);

        return Boolean.TRUE;
    }

    public static WxMaService getWxMaService() {
        return wxMaService;
    }
}