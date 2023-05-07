package io.renren.modules.exam.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 考试记录 题目记录
 *
 * @author lijun
 * @email 1420794684@qq.com
 * @date 2023-01-17 15:25:52
 */
@Data
@TableName("exam_question_record")
public class QuestionRecordEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 *
	 */
	@TableId
	private Integer id;
	/**
	 * 考试记录试卷id
	 */
	private String paperRecordId;
	/**
	 * 题目id
	 */
	private Integer questionId;
	/**
	 * 学生答案
	 */
	private String stuAnswer;

	/**
	 * 是否正确
	 */
	private Integer isRight;

	/**
	 * 得分
	 */
	private Float score;
}
