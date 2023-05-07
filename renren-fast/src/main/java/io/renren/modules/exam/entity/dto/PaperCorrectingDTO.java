package io.renren.modules.exam.entity.dto;

import lombok.Data;

/**
 * @Author 3fes
 * @Date 2023/1/20 11:22
 **/
@Data
public class PaperCorrectingDTO extends PageDTO{

    private String paperTitle;
    private Integer majorId;
    private Integer subjectId;
    private Integer isChecked;
    private Integer clazzId;

    private String stuNo;
    private String stuName;
}
