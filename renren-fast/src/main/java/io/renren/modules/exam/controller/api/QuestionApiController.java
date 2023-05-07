package io.renren.modules.exam.controller.api;

import io.renren.common.utils.R;
import io.renren.modules.exam.entity.dto.PaperDTO;
import io.renren.modules.exam.entity.dto.QuestionSelectedDTO;
import io.renren.modules.exam.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @Author 3fes
 * @Date 2023/1/22 16:59
 **/
@RestController
    @RequestMapping("/api/exam/question")
public class QuestionApiController {

    @Autowired
    private QuestionService questionService;

    @GetMapping("/group_type/{subjectId}")
    public R  getQuestionNumWithSubjectIdGroupByType(@PathVariable("subjectId") Integer subjectId){
        return R.ok().put("data", questionService.getQuestionNumWithSubjectIdGroupByType(subjectId));
    }

    @PostMapping("/practice")
    public R getPracticeQuestionList(@RequestBody PaperDTO paperDTO) {
        return R.ok().put("data", questionService.getPracticeQuestionList(paperDTO));
    }
}
