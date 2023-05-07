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
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import io.renren.modules.exam.entity.QuestionEntity;
import io.renren.modules.exam.service.QuestionService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;


/**
 * 题目
 *
 * @author lijun
 * @email 1420794684@qq.com
 * @date 2023-01-06 22:27:32
 */
@RestController
@RequestMapping("/exam/question")
public class QuestionController extends AbstractController{
    @Autowired
    private QuestionService questionService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    //@RequiresPermissions("exam:question:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = questionService.queryPage(params);

        return R.ok().put("page", page);
    }



    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    //@RequiresPermissions("exam:question:info")
    public R info(@PathVariable("id") Integer id){
		QuestionEntity question = questionService.getById(id);

        return R.ok().put("question", question);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    //@RequiresPermissions("exam:question:save")
    public R save(@RequestBody QuestionEntity question){
        question.setCreateBy(getUser().getWorkNo());
		questionService.save(question);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    //@RequiresPermissions("exam:question:update")
    public R update(@RequestBody QuestionEntity question){
        question.setUpdateBy(getUser().getWorkNo());
		questionService.updateById(question);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    //@RequiresPermissions("exam:question:delete")
    public R delete(@RequestBody Integer[] ids){
		questionService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
