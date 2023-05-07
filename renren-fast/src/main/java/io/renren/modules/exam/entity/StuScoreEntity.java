package io.renren.modules.exam.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;

import io.renren.common.entity.BaseEntity;
import lombok.Data;

/**
 * 学生分数
 *
 * @author lijun
 * @email 1420794684@qq.com
 * @date 2023-01-06 22:13:25
 */
@Data
@TableName("exam_stu_score")
public class StuScoreEntity extends BaseEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 *
	 */
	@TableId
	private Integer id;
	/**
	 * 学号
	 */
	private String stuNo;

	private String paperId;

	private Float score;
}
