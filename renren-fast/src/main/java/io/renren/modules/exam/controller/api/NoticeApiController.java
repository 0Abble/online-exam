package io.renren.modules.exam.controller.api;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import io.renren.common.utils.R;
import io.renren.modules.exam.entity.NoticeEntity;
import io.renren.modules.exam.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author 3fes
 * @Date 2023/1/24 16:22
 **/
@RestController
@RequestMapping("/api/exam/notice")
public class NoticeApiController {

    @Autowired
    private NoticeService noticeService;

    @GetMapping("/list")
    public R list() {
        return R.ok().put("data", noticeService.list(new QueryWrapper<NoticeEntity>().eq("is_deleted", 0)));
    }
}
