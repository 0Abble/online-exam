package io.renren.modules.exam.controller;

import java.util.Arrays;
import java.util.Map;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import io.renren.modules.exam.entity.ClazzEntity;
import io.renren.modules.exam.service.ClazzService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 * 年级班级
 *
 * @author lijun
 * @email 1420794684@qq.com
 * @date 2023-01-07 12:40:37
 */
@RestController
@RequestMapping("/exam/clazz")
public class ClazzController extends AbstractController{
    @Autowired
    private ClazzService clazzService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    //@RequiresPermissions("exam:clazz:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = clazzService.queryPage(params);

        return R.ok().put("page", page);
    }

    @GetMapping("/all")
    public R allClazz() {
        return R.ok().put("data", clazzService.list(new QueryWrapper<ClazzEntity>().eq("is_deleted", 0)));
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    //@RequiresPermissions("exam:clazz:info")
    public R info(@PathVariable("id") Integer id){
		ClazzEntity clazz = clazzService.getById(id);

        return R.ok().put("clazz", clazz);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    //@RequiresPermissions("exam:clazz:save")
    public R save(@RequestBody ClazzEntity clazz){
        clazz.setCreateBy(String.valueOf(getUser().getWorkNo()));
		clazzService.save(clazz);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    //@RequiresPermissions("exam:clazz:update")
    public R update(@RequestBody ClazzEntity clazz){
        clazz.setUpdateBy(String.valueOf(getUser().getWorkNo()));
		clazzService.updateById(clazz);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    //@RequiresPermissions("exam:clazz:delete")
    public R delete(@RequestBody Integer[] ids){
		clazzService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
