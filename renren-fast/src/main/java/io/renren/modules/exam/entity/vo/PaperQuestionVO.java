package io.renren.modules.exam.entity.vo;

import lombok.Data;

import java.util.List;

/**
 * @Author 3fes
 * @Date 2023/1/8 15:31
 **/
@Data
public class PaperQuestionVO {

    private Integer questionTypeId;
    private String questionTypeName;

    private List<QuestionNumVO> questionNumList;

}
