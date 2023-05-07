package io.renren.modules.exam.entity.vo;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * @Author 3fes
 * @Date 2023/1/21 16:44
 **/
@Data
public class QuestionRecordVO  implements Serializable {
    private List<QuestionRecordList> record;
    private String typeName;
    private Integer typeId;
}
