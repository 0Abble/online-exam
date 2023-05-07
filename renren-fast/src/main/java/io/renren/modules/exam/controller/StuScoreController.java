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

import io.renren.modules.exam.entity.StuScoreEntity;
import io.renren.modules.exam.service.StuScoreService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 * 学生分数
 *
 * @author lijun
 * @email 1420794684@qq.com
 * @date 2023-01-06 22:27:32
 */
@RestController
@RequestMapping("/exam/stuscore")
public class StuScoreController {
    @Autowired
    private StuScoreService stuScoreService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    //@RequiresPermissions("exam:stuscore:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = stuScoreService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    //@RequiresPermissions("exam:stuscore:info")
    public R info(@PathVariable("id") Integer id){
		StuScoreEntity stuScore = stuScoreService.getById(id);

        return R.ok().put("stuScore", stuScore);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    //@RequiresPermissions("exam:stuscore:save")
    public R save(@RequestBody StuScoreEntity stuScore){
		stuScoreService.save(stuScore);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    //@RequiresPermissions("exam:stuscore:update")
    public R update(@RequestBody StuScoreEntity stuScore){
		stuScoreService.updateById(stuScore);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    //@RequiresPermissions("exam:stuscore:delete")
    public R delete(@RequestBody Integer[] ids){
		stuScoreService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
