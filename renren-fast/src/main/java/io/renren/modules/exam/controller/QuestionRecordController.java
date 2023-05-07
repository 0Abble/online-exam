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
import io.renren.modules.exam.entity.dto.PaperQuestionRecordDTO;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import io.renren.modules.exam.entity.QuestionRecordEntity;
import io.renren.modules.exam.service.QuestionRecordService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;


/**
 * 考试记录 题目记录
 *
 * @author lijun
 * @email 1420794684@qq.com
 * @date 2023-01-17 15:25:52
 */
@RestController
@RequestMapping("/exam/questionrecord")
public class QuestionRecordController {
    @Autowired
    private QuestionRecordService questionRecordService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    //@RequiresPermissions("exam:questionrecord:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = questionRecordService.queryPage(params);

        return R.ok().put("page", page);
    }


    @GetMapping("/list/records/{quesResId}")
    public R questionRecords(@PathVariable("quesResId") String quesResId) {
        return R.ok().put("data", questionRecordService.questionRecordsByQuesResId(quesResId));
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    //@RequiresPermissions("exam:questionrecord:info")
    public R info(@PathVariable("id") Integer id){
		QuestionRecordEntity questionRecord = questionRecordService.getById(id);

        return R.ok().put("questionRecord", questionRecord);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    //@RequiresPermissions("exam:questionrecord:save")
    public R save(@RequestBody QuestionRecordEntity questionRecord){
		questionRecordService.save(questionRecord);

        return R.ok();
    }

    @PutMapping("/save/paper_question_record")
    public R savePaperQuestionRecord(@RequestBody PaperQuestionRecordDTO paperQuestionRecordDTO) {
        questionRecordService.savePaperQuestionRecord(paperQuestionRecordDTO);
        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    //@RequiresPermissions("exam:questionrecord:update")
    public R update(@RequestBody QuestionRecordEntity questionRecord){
		questionRecordService.updateById(questionRecord);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    //@RequiresPermissions("exam:questionrecord:delete")
    public R delete(@RequestBody Integer[] ids){
		questionRecordService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }


}
