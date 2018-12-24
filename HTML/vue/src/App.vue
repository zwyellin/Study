//结构
<template>
  <div id="app">

    <router-link  :to="{name:'Nly1',params:{name:10,id:11}}">ONe</router-link>
    <router-link :to="{path:'ly2?aa=12'}">Two</router-link>
    <router-link to="/test">Test</router-link>
    <div class="routerView">
      <keep-alive>
       <router-view v-if="!$route.meta.keepAlive"></router-view>
      </keep-alive>
      <router-view v-if="$route.meta.keepAlive"></router-view>
    </div>

  </div>
</template>
//行为
<script>
export default {
  name: 'App',
  components: {
  },
  data(){
    return {

    }
  }
}
</script>
//样式
<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
.routerView{
  border: 1px solid red;
  position: absolute;
  top: 50px;
  left: 5px;
  width: 400px;
  height: 200px;
}
</style>
