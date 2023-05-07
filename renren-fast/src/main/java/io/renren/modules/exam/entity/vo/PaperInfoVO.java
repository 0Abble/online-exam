package io.renren.modules.exam.entity.vo;

import io.renren.modules.exam.entity.PaperEntity;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * @Author 3fes
 * @Date 2023/1/9 9:12
 **/
@Data
public class PaperInfoVO extends PaperEntity implements Serializable {

    private List<QuestionItemInfo> questionList;
}
