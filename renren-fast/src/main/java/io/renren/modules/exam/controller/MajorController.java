package io.renren.modules.exam.controller;

import java.util.Arrays;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import io.renren.modules.exam.entity.MajorEntity;
import io.renren.modules.exam.service.MajorService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 * 专业
 *
 * @author lijun
 * @email 1420794684@qq.com
 * @date 2023-01-06 22:27:32
 */
@RestController
@RequestMapping("/exam/major")
public class MajorController extends AbstractController{
    @Autowired
    private MajorService majorService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    //@RequiresPermissions("exam:major:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = majorService.queryPage(params);

        return R.ok().put("page", page);
    }

    @GetMapping("/all")
    //@RequiresPermissions("exam:major:list")
    public R getAll() {
        return R.ok().put("data", majorService.getAll());
    }

    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    //@RequiresPermissions("exam:major:info")
    public R info(@PathVariable("id") Integer id){
		MajorEntity major = majorService.getById(id);

        return R.ok().put("major", major);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    //@RequiresPermissions("exam:major:save")
    public R save(@RequestBody MajorEntity major){
        major.setCreateBy(String.valueOf(getUser().getWorkNo()));
		majorService.save(major);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    //@RequiresPermissions("exam:major:update")
    public R update(@RequestBody MajorEntity major){
        major.setUpdateBy(String.valueOf(getUser().getWorkNo()));
		majorService.updateById(major);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    //@RequiresPermissions("exam:major:delete")
    public R delete(@RequestBody Integer[] ids){
		majorService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
