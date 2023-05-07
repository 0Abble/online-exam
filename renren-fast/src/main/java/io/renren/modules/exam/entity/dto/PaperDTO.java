package io.renren.modules.exam.entity.dto;

import io.swagger.models.auth.In;
import lombok.Data;

import java.util.List;

/**
 * @Author 3fes
 * @Date 2023/1/8 18:20
 **/
@Data
public class PaperDTO {

    private String description;
    private Integer majorId;
    private Integer subjectId;
    private String paperTitle;
    private Float passMark;
    private Float totalPoint;
    private Integer difficulty;
    /**
     * 答题次数
     */
    private Integer answerNum;
    private Integer questionNum;
    /**
     * 考试时间
     */
    private Integer examTime;

    private String examDateStart;
    private String examDateEnd;

    private String createBy;
    private List<QuestionSelectedDTO> seleted;

    private Integer pageNo;
    private Integer pageSize;
}

