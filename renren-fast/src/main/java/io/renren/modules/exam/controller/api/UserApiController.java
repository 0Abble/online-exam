package io.renren.modules.exam.controller.api;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import io.renren.common.utils.R;
import io.renren.modules.sys.entity.SysRoleEntity;
import io.renren.modules.sys.entity.SysUserEntity;
import io.renren.modules.sys.entity.SysUserRoleEntity;
import io.renren.modules.sys.service.SysRoleService;
import io.renren.modules.sys.service.SysUserRoleService;
import io.renren.modules.sys.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @Author 3fes
 * @Date 2023/1/24 14:58
 **/
@RestController
@RequestMapping("/api/exam/user")
public class UserApiController {

    @Autowired
    private SysRoleService roleService;

    @Autowired
    private SysUserRoleService userRoleService;

    @Autowired
    private SysUserService userService;

    @GetMapping("/teacher")
    public R getTeacherList() {
        Long roleId = roleService.getOne(new QueryWrapper<SysRoleEntity>().eq("role_name", "教师")).getRoleId();
        List<SysUserRoleEntity> userRoleEntities = userRoleService.list(new QueryWrapper<SysUserRoleEntity>().eq("role_id", roleId));
        List<Long> userIds = userRoleEntities.stream().map(item -> item.getUserId()).collect(Collectors.toList());
        return R.ok().put("data", userService.list(new QueryWrapper<SysUserEntity>().in("user_id", userIds)));
    }
}
