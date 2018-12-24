<template>
    <div>
     路由1{{this.$route.params}}{{id}},aaaa{{name}}--{{storeA}}
      <input/>
      <div v-show="isShow">Show内容</div>
      <button @click="isShow=!isShow">切换</button>
      <button @click="method1">方式1</button>
      <button @click="method2">方式2</button>
      <router-view name="a"></router-view>
      <router-view name="b"></router-view>
    </div>
</template>

<script>
  import ly2 from './ly2'
  import store from '../assets/chare'
  console.log(store.state.a+"---ly1");
  store.state.a=11;
    export default {
        name: "ly1",
      props:['id','name'],
      data(){
          return {
             isShow:false,
            storeA:store
          }
      },
      components:{
          ly2
      },
      mounted:function () {
      },
      methods:{
        method1:function () {
          console.log("click")
          this.$router.push({name:'Nhello',params:{user:12,id:10}});

        },
        method2:function () {
          this.$router.push({path:'ly1/45', query: { plan: 'private' }});
        }

      },
      filters:{


      }
    }
</script>

<style scoped>

</style>
