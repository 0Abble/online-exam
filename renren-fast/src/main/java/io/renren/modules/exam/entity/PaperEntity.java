package io.renren.modules.exam.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.renren.common.entity.BaseEntity;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * 试卷
 *
 * @author lijun
 * @email 1420794684@qq.com
 * @date 2023-01-06 22:13:25
 */
@Data
@TableName("exam_paper")
public class PaperEntity extends BaseEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 *
	 */
	@TableId(type = IdType.ASSIGN_UUID)
	private String id;
	/**
	 * 专业id
	 */
	private Integer majorId;

	private Integer subjectId;
	/**
	 * 试卷标题
	 */
	private String paperTitle;

	private Integer isChecked;

	private Integer isAffirm;

	private Float passMark;

	private Float totalPoint;

	/**
	 * 难度
	 */
	private Integer difficulty;

	/**
	 * 题目数量
	 */
	private Integer questionNum;

	/**
	 * 答题次数
	 */
	private Integer answerNum;

	/**
	 * 考试时间
	 */
	private Integer examTime;

	private String checkMsg;

	/**
	 * 开始日期
	 */
	@JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date examDateStart;

	@JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date examDateEnd;
}
