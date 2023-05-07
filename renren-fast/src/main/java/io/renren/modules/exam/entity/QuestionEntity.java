package io.renren.modules.exam.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;

import io.renren.common.entity.BaseEntity;
import lombok.Data;

/**
 * 题目
 *
 * @author lijun
 * @email 1420794684@qq.com
 * @date 2023-01-06 22:13:25
 */
@Data
@TableName("exam_question")
public class QuestionEntity extends BaseEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 *
	 */
	@TableId
	private Integer id;
	/**
	 * 题目类型id
	 */
	private Integer questionTypeId;
	/**
	 * 课程科目id
	 */
	private Integer subjectId;
	/**
	 * 问题题目
	 */
	private String questionTitle;
	/**
	 * 题目内容
	 */
	private String content;
	/**
	 * 答案
	 */
	private String answer;
	/**
	 * 题目分析
	 */
	private String analyse;
	/**
	 * 题目分数
	 */
	private Float score;

	/**
	 * 题目难度
	 */
	private Integer difficulty;
}
