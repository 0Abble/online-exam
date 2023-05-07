package io.renren.modules.exam.controller;

import java.util.Arrays;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.renren.modules.exam.entity.StudentEntity;
import io.renren.modules.exam.service.StudentService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 * 学生信息表
 *
 * @author lijun
 * @email 1420794684@qq.com
 * @date 2023-01-06 22:27:32
 */
@RestController
@RequestMapping("/exam/student")
public class StudentController extends AbstractController{
    @Autowired
    private StudentService studentService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    //@RequiresPermissions("exam:student:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = studentService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    //@RequiresPermissions("exam:student:info")
    public R info(@PathVariable("id") Integer id){
		StudentEntity student = studentService.getById(id);

        return R.ok().put("student", student);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    //@RequiresPermissions("exam:student:save")
    public R save(@RequestBody StudentEntity student){
        student.setCreateBy(String.valueOf(getUser().getWorkNo()));
        studentService.save(student);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    //@RequiresPermissions("exam:student:update")
    public R update(@RequestBody StudentEntity student){
        student.setUpdateBy(String.valueOf(getUser().getWorkNo()));
		studentService.updateById(student);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    //@RequiresPermissions("exam:student:delete")
    public R delete(@RequestBody Integer[] ids){
		studentService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
