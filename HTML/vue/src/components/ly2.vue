<template>
    <div>
      路由2{{$route.query}}{{aa}},{{store.state}}
      <input v-model="time"/>{{time}}
      <input v-model="time1"/>{{time1}}
    </div>
</template>

<script>
  import store from '../assets/chare'
  console.log(store.state.a+"---ly2");
    export default {
      name: "ly2",
      props:['aa'],
      data:()=>{
        return{
          time:'aa',
          time1:'',
          store:store
        }
      },
      mounted:function () {
          console.log(new Date());

          function getValue(Min,Max,count){ //获得指定范围的值,用来获取初始值
            if(count==undefined) count=2;//count代表保留小数点位数
            let Count=Math.pow(10,count);//默认是保留两位小数点
            let Range = Max - Min;
            let Rand = Math.random();
            let newValue=Min +Math.round(Rand * Range*Count)/Count;
             newValue=parseInt(newValue*Count)/Count;
            return newValue;
          }
          function RangeValue(data){//重新确定Min和Max值
            let oldValueMin=data.oldValue-data.Range;
            let oldValueMax=oldValue+data.Range;
            let Min=oldValueMin<data.Min?data.Min:oldValueMin;
            let Max=oldValueMax>data.Max?data.Max:oldValueMax;
            let count;
            if(data.count==undefined) count=2;
            return getValue(Min,Max,count);
          }
         function setRandowValue(time,callBack){
           //定义一个对象
           let setValue={
             secondsIntervalVar:undefined,
             hours:0,
             minutes:0,
             seconds:0,
             hoursInterval: function(){
               console.log(this);
               let date=new Date();
               this.hours=date.getHours();
               this.minutes=date.getMinutes();
               this.seconds=date.getSeconds();
               console.log("50分钟定时器一次，现在时间"+`${this.hours}:${this.minutes}:${this.seconds}`)
               if(this.hours===(time-1)&&this.secondsIntervalVar===undefined){
                 console.log((time-1)+"点钟，进入频繁定时器,秒定时器值为："+this.secondsIntervalVar);
                 this.secondsIntervalVar=setInterval(()=>{
                   let date=new Date();
                   this.hours=date.getHours();
                   this.minutes=date.getMinutes();
                   this.seconds=date.getSeconds();
                   console.log("频繁定时器："+`${this.hours}:${this.minutes}:${this.seconds}`);
                   if(this.minutes===59&&this.seconds>55){
                     clearInterval(this.secondsIntervalVar);
                     this.secondsIntervalVar=undefined;
                     callBack();
                     console.log("现在时间："+`${this.hours}:${this.minutes}:${this.seconds}`);
                   }
                 },2000);
               }
             }
             };
             //执行
             setValue.hoursInterval();
             setInterval(setValue.hoursInterval,1000*60*50);
           };

         //调用
        var setValueCallBack=function(){
          let data1={//好评率
            Min:94,
            Max:98,
            oldValue:95,
            Range:1,
            count:2
          };
          let data2={//使用率
            Min:72,
            Max:86,
            oldValue:80,
            Range:2,
            count:2
          }
          let value1=RangeValue(data1);
          let value2=RangeValue(data2);
          console.log("已更新数据,新数据为:好评率："+value1+"，使用率"+value2);
        }
        setRandowValue(8,setValueCallBack);

    },
      methods:{

        }
    }
</script>

<style scoped>

</style>
