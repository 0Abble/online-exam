package io.renren.modules.exam.controller.api;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import io.renren.common.utils.R;
import io.renren.modules.exam.entity.StudentEntity;
import io.renren.modules.exam.entity.form.LoginForm;
import io.renren.modules.exam.service.StudentService;
import io.renren.util.JWTTokenUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author 3fes
 * @Date 2023/1/14 19:41
 **/
@RestController
@RequestMapping("/api/exam")
public class StuLoginController {

    @Autowired
    private StudentService studentService;

    @PostMapping("/login")
    public R login(@RequestBody LoginForm form) {
        StudentEntity studentEntity = studentService.getOne(new QueryWrapper<StudentEntity>().eq("stu_no", form.getAccount()));
        //账号不存在、密码错误
        if(studentEntity == null ||! studentEntity.getPwd().equals(form.getPassword())) {
            return R.error("账号或密码不正确");
        }
        //账号锁定
        /*if(chatUser.getStatus() == 0){
            return R.error("账号已被锁定,请联系管理员");
        }*/
        return R.ok().put("token", JWTTokenUtils.token(studentEntity.getStuNo(), studentEntity.getPwd()));
    }
}
