package io.renren.modules.exam.controller;

import java.io.InputStream;
import java.net.URLEncoder;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.poi.excel.ExcelReader;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelWriter;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import io.renren.modules.exam.entity.QuestionRecordEntity;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import io.renren.modules.exam.entity.QuestionTypeEntity;
import io.renren.modules.exam.service.QuestionTypeService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;


/**
 * 题目类型
 *
 * @author lijun
 * @email 1420794684@qq.com
 * @date 2023-01-06 22:27:32
 */
@RestController
@RequestMapping("/exam/questiontype")
public class QuestionTypeController {
    @Autowired
    private QuestionTypeService questionTypeService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    //@RequiresPermissions("exam:questiontype:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = questionTypeService.queryPage(params);

        return R.ok().put("page", page);
    }

    @GetMapping("/all")
    public R all() {
        return R.ok().put("data", questionTypeService.list(new QueryWrapper<QuestionTypeEntity>().eq("is_deleted", 0)));
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    //@RequiresPermissions("exam:questiontype:info")
    public R info(@PathVariable("id") Integer id){
		QuestionTypeEntity questionType = questionTypeService.getById(id);

        return R.ok().put("questionType", questionType);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    //@RequiresPermissions("exam:questiontype:save")
    public R save(@RequestBody QuestionTypeEntity questionType){
		questionTypeService.save(questionType);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    //@RequiresPermissions("exam:questiontype:update")
    public R update(@RequestBody QuestionTypeEntity questionType){
		questionTypeService.updateById(questionType);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    //@RequiresPermissions("exam:questiontype:delete")
    public R delete(@RequestBody Integer[] ids){
		questionTypeService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }


}
