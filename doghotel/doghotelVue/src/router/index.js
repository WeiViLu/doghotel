import Vue from 'vue'
import Router from 'vue-router'
import Login from '@/components/Login'
import Index from '@/components/Index'
import Ucenter from '@/components/Ucenter'
import Item from '@/components/Item'
import PersonInfo from '@/components/PersonInfo'
import UpdateInfo from '@/components/UpdateInfo'
import Addlike from '@/components/Addlike'
import ItemDetail from '@/components/ItemDetail'
import MyOrder from '@/components/MyOrder'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: '',
      component: Login
    },
    {
      path: '/login',
      name: 'Login',
      component: Login
    },
    {
      path: '/index',
      name: 'Index',
      component: Index
    },
    {
      path: '/item',
      name: 'Item',
      component: Item
    },
    {
      path: '/ucenter',
      name: 'Ucenter',
      component: Ucenter
    },
    {
      path: '/personinfo',
      name: 'PersonInfo',
      component: PersonInfo
    },
    {
      path: '/updateinfo',
      name: 'UpdateInfo',
      component: UpdateInfo
    },
    {
      path: '/addlike',
      name: 'Addlike',
      component: Addlike
    },
    {
      path: '/itemdetail',
      name: 'ItemDetail',
      component: ItemDetail
    },
    {
      path:'/myorder',
      name:'MyOrder',
      component:MyOrder
    }
  ]
})
