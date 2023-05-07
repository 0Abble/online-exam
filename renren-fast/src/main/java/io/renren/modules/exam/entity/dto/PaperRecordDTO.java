package io.renren.modules.exam.entity.dto;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * @Author 3fes
 * @Date 2023/1/17 15:30
 **/
@Data
public class PaperRecordDTO extends PageDTO implements Serializable {

    private String paperId;
    private String stuNo;

    private List<QuestionRecordDTO> questionRecordList;

    private String paperTitle;
    private Integer majorId;
    private Integer subjectId;
    private Integer isChecked;
    private Integer clazzId;
}
