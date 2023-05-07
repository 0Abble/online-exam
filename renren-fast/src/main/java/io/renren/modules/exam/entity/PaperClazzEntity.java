package io.renren.modules.exam.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 试卷分配给班级
 * 
 * @author lijun
 * @email 1420794684@qq.com
 * @date 2023-01-09 18:35:47
 */
@Data
@TableName("exam_paper_clazz")
public class PaperClazzEntity implements Serializable {
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
	 * 班级id
	 */
	private Integer clazzId;

}
