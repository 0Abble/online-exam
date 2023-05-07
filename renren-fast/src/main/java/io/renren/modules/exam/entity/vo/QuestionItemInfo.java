package io.renren.modules.exam.entity.vo;

import io.renren.modules.exam.entity.QuestionEntity;
import io.renren.modules.exam.entity.QuestionTypeEntity;
import lombok.Data;

import java.util.List;

/**
 * @Author 3fes
 * @Date 2023/1/9 10:32
 **/

@Data
public class QuestionItemInfo extends QuestionTypeEntity {
    private List<QuestionEntity> list;
}
