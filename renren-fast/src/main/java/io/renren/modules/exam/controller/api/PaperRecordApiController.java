package io.renren.modules.exam.controller.api;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import io.renren.common.constant.ExamConstant;
import io.renren.common.utils.R;
import io.renren.modules.exam.entity.StudentEntity;
import io.renren.modules.exam.entity.dto.PaperRecordDTO;
import io.renren.modules.exam.service.PaperRecordService;
import io.renren.modules.exam.service.QuestionRecordService;
import io.renren.modules.exam.service.StudentService;
import io.renren.util.JWTTokenUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;

/**
 * @Author 3fes
 * @Date 2023/1/17 16:09
 **/
@RestController
@RequestMapping("/api/exam/paper_record")
public class PaperRecordApiController {

    @Autowired
    private StudentService studentService;

    @Autowired
    private PaperRecordService paperRecordService;

    @Autowired
    private QuestionRecordService questionRecordService;

    /**
     * 保存
     */
    @PostMapping("/save")
    public R save(@RequestBody PaperRecordDTO paperRecordDTO){
        paperRecordService.savePaperRecord(paperRecordDTO);
        return R.ok();
    }

    @PostMapping("/save/obsolete")
    public R saveObsoletePaper(
            @RequestHeader("token") String token,
            @RequestBody String paperIds) throws Exception {
        String account = JWTTokenUtils.geAccountByToken(token);
        StudentEntity studentEntity = studentService.getOne(new QueryWrapper<StudentEntity>().eq("is_deleted", 0).eq("stu_no", account));
        paperRecordService.saveObsoletePaper(studentEntity,Arrays.asList(paperIds.replace("\"", "").split(ExamConstant.splitChar)));
        return R.ok();
    }

    @PostMapping("/query")
    public R list(@RequestHeader("token") String token,
                  @RequestBody PaperRecordDTO paperRecordDTO) throws Exception {
        if (JWTTokenUtils.verify(token)) {
            String account = JWTTokenUtils.geAccountByToken(token);
            StudentEntity studentEntity = studentService.getOne(new QueryWrapper<StudentEntity>().eq("is_deleted", 0).eq("stu_no", account));
            paperRecordDTO.setStuNo(studentEntity.getStuNo());
            paperRecordDTO.setClazzId(Integer.valueOf(studentEntity.getClazz()));
            return R.ok().put("data", paperRecordService.queryPaperRecordByStuNo(paperRecordDTO));
        } else {
            return R.error(401, "token过期请重新登录");
        }
    }

    @GetMapping("/list/question/{quesResId}")
    public R questionRecordList(@PathVariable("quesResId") String quesResId) {
        return R.ok().put("data", questionRecordService.questionRecordsByQuesResId(quesResId));
    }
}
