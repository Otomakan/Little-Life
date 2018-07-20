

<script>
	import { Line } from 'vue-chartjs'

export default {
  extends: Line,
  name: "bar-chart",
  props: {
  	dailyIntakes: {
  		type: Array,
  		default:()=>{
  			return
  		},
  	}
  },
  data(){
  	return{
  		days:[],
  		calories:[],
  	}
  },
  watch: {
  	dailyIntakes(newVal, oldVal) {
  		let calVals = []
  		let dayVals = []
  		newVal.map((el)=>{
  			calVals.push(el.calories)
  			dayVals.push(el.day)
  		})
  		this.days = dayVals
  		this.calories = calVals

  		this.renderChart({
      labels: this.days,
      datasets: [
        {
          label: 'Caloric Intake',
          backgroundColor: '#f87979',
          data: this.calories,
          backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)'
                ],
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
          label: 'GitHub Commits',
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