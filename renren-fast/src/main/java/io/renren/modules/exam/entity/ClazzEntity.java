package io.renren.modules.exam.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;

import io.renren.common.entity.BaseEntity;
import lombok.Data;

/**
 * 年级班级
 *
 * @author lijun
 * @email 1420794684@qq.com
 * @date 2023-01-07 12:40:37
 */
@Data
@TableName("exam_clazz")
public class ClazzEntity extends BaseEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 *
	 */
	@TableId
	private Integer id;
	/**
	 * 班级名称
	 */
	private String className;


}
