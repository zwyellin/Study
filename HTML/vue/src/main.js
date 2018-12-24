// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter);

import App from './App'

Vue.config.productionTip = false;
//
import store from "./store/index"
console.log(store.state.mount);


//
//导入组件
import test from './components/test'
import HelloWorld from './components/HelloWorld'
import ly1 from './components/ly1'
import ly2 from './components/ly2'
//配置路由
const routes=[
  {path:'/test',component:test,alias:'/as', meta: {
      keepAlive: true
    },
    },
  {path:'/hello',component:HelloWorld,name:'Nhello'},
  {
    name:'Nly1',
    path: '/ly1/:id/:name',
    component: ly1,
    meta: {
      keepAlive: false
    },
    props:true,
    beforeEnter: (to, from, next) => {
      let videoReg = /^\/test/;
      if(from.path==="/"){
         console.log("页面刷新");
        to.meta.keepAlive=false;
      }
      else if (videoReg.test(from.path)) {
           to.meta.keepAlive=false;
           console.log("从test那里进来的")
      }else{
        to.meta.keepAlive=true;
      }
      next();
    }
  },
  {path:'/ly2',
    component:ly2,
    name:'Nly2',
    meta: {
      keepAlive: true
    },
    props:true,
  }
];
const router = new VueRouter({
  mode:'history',
  routes
});
/* eslint-disable no-new */
new Vue({
  el: '#app',
  components: { App},
  template: '<App/>',
  router//实例化
});

