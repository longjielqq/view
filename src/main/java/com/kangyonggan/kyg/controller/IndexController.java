package com.kangyonggan.kyg.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author kangyonggan
 * @since 2016/11/4
 */
@Controller
@RequestMapping("/")
public class IndexController extends BaseController {

    private static final String PATH_ROOT = "web/default/";
    private static final String PATH_INDEX = PATH_ROOT + "index";

    @RequestMapping(method = RequestMethod.GET)
    public String index() {
        log.debug("index");
        return PATH_INDEX;
    }

}
