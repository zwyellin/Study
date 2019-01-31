//结构
<template>
  <div id="app">

    <router-link  :to="{name:'Nly1'}">ONe</router-link>
    <router-link :to="{path:'ly2'}">Two</router-link>
    <router-link to="/test">Test</router-link>
    <div class="routerView">
      <router-view ></router-view>
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
