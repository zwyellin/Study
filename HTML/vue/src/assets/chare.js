var store={
  state:{
    a:1,
    b:2
  }
};
setTimeout(function () {
  console.log("store  "+store.state.a)
},5000);
export default store
