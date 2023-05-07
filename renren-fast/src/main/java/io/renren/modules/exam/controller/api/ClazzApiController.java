package io.renren.modules.exam.controller.api;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import io.renren.common.utils.R;
import io.renren.modules.exam.entity.ClazzEntity;
import io.renren.modules.exam.service.ClazzService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author 3fes
 * @Date 2023/1/15 14:54
 **/

@RestController
@RequestMapping("/api/exam/clazz")
public class ClazzApiController {

    @Autowired
    private ClazzService clazzService;

    @GetMapping("/all")
    public R allClazz() {
        return R.ok().put("data", clazzService.list(new QueryWrapper<ClazzEntity>().eq("is_deleted", 0)));
    }
}
