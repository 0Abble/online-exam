package io.renren.modules.exam.controller.api;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import io.renren.common.utils.R;
import io.renren.modules.exam.entity.SubjectEntity;
import io.renren.modules.exam.service.SubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author 3fes
 * @Date 2023/1/15 14:53
 **/

@RestController
@RequestMapping("/api/exam/subject")
public class SubjectApiController {

    @Autowired
    private SubjectService subjectService;

    @GetMapping("/all")
    public R all() {
        return R.ok().put("data", subjectService.list(new QueryWrapper<SubjectEntity>().eq("is_deleted", 0)));
    }
}
