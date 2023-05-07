package io.renren.modules.exam.controller.api;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import io.renren.common.utils.R;
import io.renren.modules.exam.entity.StudentEntity;
import io.renren.modules.exam.entity.dto.PaperDTO;
import io.renren.modules.exam.service.PaperService;
import io.renren.modules.exam.service.StudentService;
import io.renren.modules.exam.service.impl.BaseService;
import io.renren.util.JWTTokenUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @Author 3fes
 * @Date 2023/1/15 13:52
 **/
@RestController
@RequestMapping("/api/exam")
public class PaperApiController {

    @Autowired
    private StudentService studentService;

    @Autowired
    private PaperService paperService;

    @Autowired
    private BaseService baseService;


    @GetMapping("/paper_list")
    public R getPaperListByClazzId(@RequestHeader("token") String token, PaperDTO paperDTO) throws Exception {
        if (JWTTokenUtils.verify(token)) {
            String account = JWTTokenUtils.geAccountByToken(token);
            StudentEntity studentEntity = studentService.getOne(new QueryWrapper<StudentEntity>().eq("is_deleted", 0).eq("stu_no", account));
            return R.ok().put("data", paperService.getPaperByClazzId(paperDTO, studentEntity.getClazz(), token));
        } else {
            baseService.studentLogout(token);
            return R.error(401, "token过期请重新登录");
        }
    }

    @GetMapping("/paper/{paperId}")
    public R getPaperByClazzIdAndPaperId(@RequestHeader("token") String token,
                                         @PathVariable("paperId") String paperId) throws Exception {
        if (JWTTokenUtils.verify(token)) {
            String account = JWTTokenUtils.geAccountByToken(token);
            StudentEntity studentEntity = studentService.getOne(new QueryWrapper<StudentEntity>().eq("is_deleted", 0).eq("stu_no", account));
            return R.ok().put("data", paperService.getPaperByClazzIdAndPaperId(paperId));
        } else {
            baseService.studentLogout(token);
            return R.error(401, "token过期请重新登录");
        }
    }

    @GetMapping("/paper_info")
    public R getPaperInfoByPaperId(String paperId) {
        return R.ok().put("data", paperService.getPaperInfoByPaperId(paperId));
    }
}
