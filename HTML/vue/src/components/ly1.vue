<template>
    <div>
     路由1
    </div>
</template>

<script>
  import ly2 from './ly2'
    export default {
      name: "ly1",
      data(){
          return {
             data1:"this is data1",
          }
      },
      components:{
          ly2
      },
      mounted:function () {

      },
      methods:{
          method1(){

          },
          method2(){
              
          }
      },
      filters:{

      },
      beforeCreate(){
          console.log(this.$options.name+"-----"+"beforeCreate");
      },
      created(){
          console.log(this.$options.name+"-----"+"Create");
          setTimeout(() => {
              this.data1=1;
          }, 2000);
          //只有视图中用到的属性，修改了才会触发更新 生命周期
          //一开始，会用初始值，渲染到DOM。不会触发 更新生命周期
      },
      beforeMount(){
           console.log(this.$options.name+"-----"+"beforeMount");
      },
      mounted(){
            console.log(this.$options.name+"-----"+"mounted");
      },
      beforeUpdate(){
          console.log(this.$options.name+"-----"+"beforeUpdate");
      },
      updated(){
          console.log(this.$options.name+"-----"+"updated");
      },
      activated(){
           console.log(this.$options.name+"-----"+"activated");
      },
      deactivated(){
          console.log(this.$options.name+"-----"+"deactivated");
      },
      beforeDestroy(){
           console.log(this.$options.name+"-----"+"beforeDestroy");
      },
      destroyed(){
           console.log(this.$options.name+"-----"+"destroyed");
      }

    }
</script>

<style scoped>

</style>
