<template>
    <canvas id="bmi-chart" width="400" height="400"></canvas>
</template>
<script>

export default{
    name:"bmi-chart",
     props: {
    weights: {
        type: Array,
        default:()=>{
            return
        },
    },
    heights: {
      type: Array,
      default:()=>{
        return
      },
    }
      },
      data(){
        return{
            days:[],
            bmi:[],
        }
      },
    mounted(){
        this.prepareData('In Mounted')
    },
    updated(){
        this.prepareData('In updated')
    },
    watch: {
    weights(newVal, oldVal) {
        let bmiVals = []
        let dayVals = []
        console.log("in watch")
        newVal.forEach((val,index)=>{
        if(index< this.heights.length){
          let square =  Math.pow(this.heights[index].height,2)
          let bmi = val.weight/square
            bmiVals.push(Math.round( bmi*100000 ) / 10)
          dayVals.push(val.day)
        }
        })
        this.days = dayVals
        this.bmi = bmiVals
      this.title = "Your BMI is " +this.bmi[this.bmi.length-1] + "which is " + this.getTitle()
      this.setUp()
    }
    },
    methods:{

        prepareData(cycle){
        let bmiVals = []
        let dayVals = []
        console.log(cycle)
        console.log(this.weights)
        console.log(this.heights)

        this.weights.forEach((val,index)=>{
        if(index< this.heights.length-1){
          let square =  Math.pow(this.heights[index].height,2)
          let bmi = val.weight/square
          bmiVals.push(Math.round( bmi*100000  ) / 10)
          dayVals.push(val.day)
        }
        })
        this.days = dayVals
        this.bmi = bmiVals
          this.title = "Your BMI is " +this.bmi[this.bmi.length-1] + "which is" + this.getTitle()
          this.setUp()
        },
        getTitle(){
      if(this.bmi[this.bmi.length-1]<18.5){
        return "underweight"
      }
      else if(this.bmi[this.bmi.length-1] <24.9){
        return "normal weight"
      }
        
      else if (this.bmi[this.bmi.length-1] < 29.9){
        return "over weight"
      }
      else if(this.bmi[this.bmi.length-1]>=30){
        return "obese"
      }
        
    
  },
        setUp(){
var ctx = document.getElementById("bmi-chart").getContext('2d');
var myChart = new Chart(ctx, {
    type: 'line',
    data: {
        labels: this.days,
        datasets: [{
            label: 'BMI Chart',
            data: this.bmi,
            backgroundColor: [
                'rgba(255, 99, 132, 0)'
            ],
            borderColor: [
                'rgba(255,255,255,1)'
            ],
            borderWidth: 3,
            pointBorderWidth:3,

        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero:true
                }
            }]
        },
        title:{
            display:true,
            text: this.title
        }
    }
});
        }
    }
}
</script>