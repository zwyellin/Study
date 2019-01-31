// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter);

import App from './App'

Vue.config.productionTip = false;
//



//
//导入组件
import test from './components/test'
import HelloWorld from './components/HelloWorld'
import ly1 from './components/ly1'
import ly2 from './components/ly2'
//配置路由
const routes=[
  {path:'/test',component:test,alias:'/as'
  },
  {path:'/hello',component:HelloWorld,name:'Nhello'},
  {
    name:'Nly1',
    path: '/ly1',
    component: ly1,
  },
  { path:'/ly2',
    component:ly2,
    name:'Nly2',
  }
];
const router = new VueRouter({
  routes
});
/* eslint-disable no-new */
new Vue({
  el: '#app',
  components: { App},
  template: '<App/>',
  router//实例化
});

