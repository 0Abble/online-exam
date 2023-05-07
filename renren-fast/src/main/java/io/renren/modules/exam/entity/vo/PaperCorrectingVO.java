package io.renren.modules.exam.entity.vo;

import lombok.Data;

/**
 * @Author 3fes
 * @Date 2023/1/20 11:19
 **/

@Data
public class PaperCorrectingVO extends PaperRecordVO{
    private String stuNo;
    private String stuName;
    private String paperRecordId;
}
