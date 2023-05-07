package io.renren.modules.exam.entity.vo;

import io.renren.modules.exam.entity.PaperRecordEntity;
import lombok.Data;

import java.io.Serializable;

/**
 * @Author 3fes
 * @Date 2023/1/29 13:10
 **/
@Data
public class StuScoreVO extends PaperRecordEntity implements Serializable {

    private String paperTitle;
    private Float passMark;
    private Float totalPoint;
    private Integer subjectId;
    private String stuName;
    private Integer major;
    private Integer clazz;
}
