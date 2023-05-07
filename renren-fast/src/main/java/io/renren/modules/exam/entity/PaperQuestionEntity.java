package io.renren.modules.exam.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 试卷与题目关联表
 * 
 * @author lijun
 * @email 1420794684@qq.com
 * @date 2023-01-08 19:05:12
 */
@Data
@TableName("exam_paper_question")
public class PaperQuestionEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId
	private Integer id;
	/**
	 * 试卷id
	 */
	private String paperId;
	/**
	 * 题目id
	 */
	private Integer questionId;

}
