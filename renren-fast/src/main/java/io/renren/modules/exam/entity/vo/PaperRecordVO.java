package io.renren.modules.exam.entity.vo;

import io.renren.modules.exam.entity.PaperEntity;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @Author 3fes
 * @Date 2023/1/19 15:52
 **/
@Data
public class PaperRecordVO extends PaperEntity implements Serializable {

    /**
     * 提交时间
     */
    private Date submitTime;

    /**
     * 试卷状态
     */
    private Integer paperStatus;

    /**
     * 正确数
     */
    private Integer correctNum;
    /**
     * 考试得分
     */
    private Float examScore;

    private String majorName;
    private String subjectName;
    private String className;

    private String paperRecordId;
}
