package io.renren.modules.exam.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;

import io.renren.common.entity.BaseEntity;
import lombok.Data;

/**
 * 公告
 *
 * @author lijun
 * @email 1420794684@qq.com
 * @date 2023-01-24 15:47:26
 */
@Data
@TableName("exam_notice")
public class NoticeEntity extends BaseEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 *
	 */
	@TableId(type = IdType.ASSIGN_UUID)
	private String id;
	/**
	 * 题目
	 */
	private String title;
	/**
	 * 内容
	 */
	private String content;

}
