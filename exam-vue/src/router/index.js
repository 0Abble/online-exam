import Vue from 'vue'
import VueRouter from 'vue-router'
// import HomeView from '../views/HomeView.vue'
import {
  getToken,
  removeToken
} from '@/util/auth'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    component: () => import('@/views/AppView.vue'),
    redirect: '/',
    children: [
      {
        path: '/',
        name: 'home',
        component: () => import('@/views/HomeView.vue')
      },
      {
        path: '/mine',
        name: 'minePaper',
        component: () => import('@/views/MinePaper.vue')
      },{
        path: '/record',
        name: 'examRecord',
        component: () => import('@/views/ExamRecord.vue')
      }, {
        path: '/practice',
        name: 'PersonPractice',
        component: () => import('@/views/PersonPractice.vue')
      }
    ]
  },
  {
    path: '/login',
    name: 'login',
    component: () => import('@/views/common/Login.vue')
  }, {
    path: '/forget',
    name: 'forget',
    component: () => import('@/views/common/Forget.vue')
  }, {
    path: '/answer/:paperId',
    name: 'answer',
    component: () => import('@/views/AnswerOfPaper.vue')

  }
]

// 解决路由重复报错
//获取原型对象上的push函数
const originalPush = VueRouter.prototype.push
  //修改原型对象中的push方法
VueRouter.prototype.push = function push(location) {
  return originalPush.call(this, location).catch(err => err)
}
const router = new VueRouter({
  mode: 'history',
  routes
})

// 挂载路由导航守卫
router.beforeEach((to, from, next) => {
  // to 将要访问的路径
  // from 代表重那个路径跳转而来
  // next 是个函数，表示放行 next() 放行 next('/login') 强制跳转

  if (to.path == '/register' || to.path == '/login') {
    return next()
  }
  let token = getToken()
  if (!token || !/\S/.test(token)) {
    next('/login')
  }
  next()
})

export default router
