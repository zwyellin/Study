<template>
    <div>
      路由2
    </div>
</template>

<script>
    export default {
      name: "ly2",
      data:()=>{
        return{
          time:'aa',
          time1:'',
         
        }
      },
      mounted:function () {


      },
      methods:{

        },
      beforeCreate(){
          console.log(this.$options.name+"-----"+"beforeCreate");
      },
      created(){
          console.log(this.$options.name+"-----"+"Create");
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
