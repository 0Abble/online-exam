package io.renren.modules.exam.entity.vo;

import io.renren.modules.exam.entity.QuestionEntity;
import lombok.Data;

import java.io.Serializable;

/**
 * @Author 3fes
 * @Date 2023/1/21 18:34
 **/
@Data
public class QuestionRecordList extends QuestionEntity implements Serializable {
    private String stuAnswer;
    private Integer questionRecordId;
}

