

<script>
	import { Line } from 'vue-chartjs'

export default {
  extends: Line,
  name: "bar-chart",
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
  methods:{
    getTitle(){
      if(this.bmi<18.5)
        return "underweight"
      else if(this.bmi <24.9)
        return "normal weight"
      else if (thisgetTi.bmi < 29.9)
        return "over weight"
      else
        return "obese"
    }
  },
  watch: {
  	weights(newVal, oldVal) {
  		let bmiVals = []
  		let dayVals = []

  		newVal.forEach((val,index)=>{
        if(index< this.heights.length){
          let square =  Math.pow(this.heights[index].height,2)
          let bmi = val.weight/square
          bmiVals.push(bmi*1000)
          dayVals.push(val.day)
        }
  		})
       console.log("BMI vals is:")
      console.log(bmiVals)
  		this.days = dayVals
  		this.bmi = bmiVals
      this.title = "Your BMI is " +this.bmi[this.bmi.length-1] + "which is" + this.getTitle()
     

  		this.renderChart({
      labels: this.days,
      datasets: [
        {
          label: 'BMI Chart',
          backgroundColor: '#f87979',
          data: this.bmi,
          backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)'
                ],
          options:{
            title:{
              display: true,
              text: "HEEEEELLOOO",
              position: 'bottom'
            },

          }
        }
      ]
    })


  	}
  }
  ,
  mounted () {
    // Overwriting base render method with actual data.
    this.renderChart({
      labels: ['2018-06-03', '2018-06-02', '2018-06-01' ],
      datasets: [
        {
          label: 'BMI Chart',
          backgroundColor: '#f87979',
          data: [1240, 2220, 12 ]
        }
      ]
    })
  }
}
</script>
<style >
	#line-chart{
		width:300px;
		height: 300px;
	}
</style>