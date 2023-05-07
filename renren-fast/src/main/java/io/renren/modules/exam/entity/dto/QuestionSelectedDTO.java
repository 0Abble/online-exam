package io.renren.modules.exam.entity.dto;

import lombok.Data;

/**
 * @Author 3fes
 * @Date 2023/1/8 18:48
 **/
@Data
public class QuestionSelectedDTO {
    private Integer questionTypeId;
    private Float score;
    private Integer selectVal;
    private String typeName;
}
