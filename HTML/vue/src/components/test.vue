<template>
    <div>
     test{{store}}
    </div>
</template>

<script>
  import store from '../assets/chare'
  console.log(store.state.a+"---test");
    export default {
        name: "test",
      data(){
          return{
            store:store
          }
      }

    }
</script>

<style scoped>

</style>
