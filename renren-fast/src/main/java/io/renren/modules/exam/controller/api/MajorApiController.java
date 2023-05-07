package io.renren.modules.exam.controller.api;

import io.renren.common.utils.R;
import io.renren.modules.exam.service.MajorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author 3fes
 * @Date 2023/1/15 14:52
 **/

@RestController
@RequestMapping("/api/exam/major")
public class MajorApiController {

    @Autowired
    private MajorService majorService;

    @GetMapping("/all")
    public R getAll() {
        return R.ok().put("data", majorService.getAll());
    }

}
