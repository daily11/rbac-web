package com.swust.demo.controller;

import com.swust.demo.util.Result;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;

@RestController
public class DemoController {

    String path = "f://";

    @RequestMapping(value = "/demo1", method = RequestMethod.POST)
    public Result uploadFiles(@RequestParam("files") MultipartFile[] files) {
        Result result = null;
        try {
            if (files != null && files.length > 0) {
                for (int i = 0; i < files.length; i++) {
                    MultipartFile file = files[i];
                    if (!file.isEmpty()) {
                        String fileName = file.getOriginalFilename().toLowerCase();

                        // 原始图片存放路径
                        File filepath = new File(path, fileName);
                        if (!filepath.getParentFile().exists()) {
                            filepath.getParentFile().mkdirs();
                        }
                        file.transferTo(new File(path + File.separator + fileName));
                    }
                }
                result = new Result(200, "success", "success");
            } else {
                result = new Result(500, "error", "error");
            }
        } catch (Exception e) {
            e.printStackTrace();
            result = new Result(500, e.getMessage(), "error");
        } finally {
            return result;
        }
    }
}
