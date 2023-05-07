package io.renren.modules.exam.controller.api;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import io.renren.common.utils.R;
import io.renren.modules.exam.entity.StudentEntity;
import io.renren.modules.exam.service.StudentService;
import io.renren.util.JWTTokenUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author 3fes
 * @Date 2023/1/15 13:30
 **/
@RestController
@RequestMapping("/api/exam")
public class StudentApiController {

    @Autowired
    private StudentService studentService;


    @GetMapping("/user_info")
    public R getUserInfo(@RequestHeader("token") String token) throws Exception {
        if (JWTTokenUtils.verify(token)) {
            String account = JWTTokenUtils.geAccountByToken(token);
            StudentEntity studentEntity = studentService.getOne(new QueryWrapper<StudentEntity>().eq("is_deleted", 0).eq("stu_no", account));
            return R.ok().put("data", studentEntity);
        } else {
            return R.error(401, "token过期请重新登录");
        }
    }
}
