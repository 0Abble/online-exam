package io.renren.modules.exam.controller;

import java.util.Arrays;
import java.util.Map;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import io.renren.common.entity.BaseEntity;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import io.renren.modules.exam.entity.SubjectEntity;
import io.renren.modules.exam.service.SubjectService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 * 课程科目表
 *
 * @author lijun
 * @email 1420794684@qq.com
 * @date 2023-01-06 22:27:32
 */
@RestController
@RequestMapping("/exam/subject")
public class SubjectController extends AbstractController {
    @Autowired
    private SubjectService subjectService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    //@RequiresPermissions("exam:subject:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = subjectService.queryPage(params);

        return R.ok().put("page", page);
    }

    @GetMapping("/all")
    public R all() {
        return R.ok().put("data", subjectService.list(new QueryWrapper<SubjectEntity>().eq("is_deleted", 0)));
    }

    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    //@RequiresPermissions("exam:subject:info")
    public R info(@PathVariable("id") Integer id){
		SubjectEntity subject = subjectService.getById(id);

        return R.ok().put("subject", subject);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    //@RequiresPermissions("exam:subject:save")
    public R save(@RequestBody SubjectEntity subject){
        subject.setCreateBy(String.valueOf(getUser().getWorkNo()));
		subjectService.save(subject);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    //@RequiresPermissions("exam:subject:update")
    public R update(@RequestBody SubjectEntity subject){
        subject.setUpdateBy(String.valueOf(getUser().getWorkNo()));
		subjectService.updateById(subject);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    //@RequiresPermissions("exam:subject:delete")
    public R delete(@RequestBody Integer[] ids){
		subjectService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
