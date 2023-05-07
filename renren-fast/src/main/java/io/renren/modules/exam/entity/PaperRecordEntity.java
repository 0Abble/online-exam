package io.renren.modules.exam.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;

import io.renren.common.entity.BaseEntity;
import lombok.Data;

/**
 * 考试记录 试卷记录
 *
 * @author lijun
 * @email 1420794684@qq.com
 * @date 2023-01-17 15:25:52
 */
@Data
@TableName("exam_paper_record")
public class PaperRecordEntity extends BaseEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 *
	 */
	@TableId(type = IdType.ASSIGN_UUID)
	private String id;
	/**
	 * 试卷id
	 */
	private String paperId;
	/**
	 * 学生学号
	 */
	private String stuNo;
	/**
	 * 正确数
	 */
	private Integer correctNum;
	/**
	 * 考试得分
	 */
	private Float examScore;
	/**
	 * 0: 改卷中 -1: 未及格 1 及格
	 */
	private Integer isChecked;

}
