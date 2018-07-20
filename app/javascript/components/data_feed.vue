<template>
<div class="feed">
	<div  v-if="routing.userFeed" id="user-feed-box">
		<comment-card v-if="comment[0]" title="Last Comment" v-bind:comment="comment[comment.length-1]" class="card" >
			

		</comment-card>
		<div v-if="comment[0]" class="card">
			<div ><h3>Get Some more Posts and Make some!</h3><a  v-on:click="showCommentFeed" id="my-plus" class="fa fa-plus"></a></div>
		</div>
	
		<div v-if="!comment[0]" class="card">

			<h1> You don't have any comments yet! Make one by clicking here!</h1> <a  v-on:click="showCommentFeed" id="my-plus" class="fa fa-plus"></a>
		</div>
		<!-- <div v-if="!comment[0]" class -->
		<div class="card"><h2>Enter calories for the day</h2>
			<el-form ref="form" :model="dailyCalories" label-width="120px">
				<el-form-item label="Calories">
			    <el-input v-model="dailyCalories.calories"></el-input>
			</el-form-item>
			<el-form-item label="Day">
				 <el-date-picker type="date" placeholder="Pick a date" v-model="dailyCalories.day" style="width: 100%;"></el-date-picker>
				</el-form-item>
			</el-form>
			<el-button v-on:click="postCalories">Submit</el-button>
		</div>
		<div class="card"><h2>Enter Weight and Height Data</h2>
			<el-form ref="form" :model="weightHeightData" label-width="120px">
				<el-form-item label="Weight (in kg)">
			    	<el-input v-model="weightHeightData.weight"></el-input>
				</el-form-item>
				<el-form-item label="Height (in cm)">
			    <el-input v-model="weightHeightData.height"></el-input>
			</el-form-item>
			<el-form-item label="Day">
				 <el-date-picker type="date" placeholder="Pick a date" v-model="weightHeightData.day" style="width: 100%;"></el-date-picker>
				</el-form-item>
			</el-form>
			<el-button v-on:click="postHeightWeight">Submit</el-button>
		</div>
		<div v-if="heightData" class="card bmi-chart-card" >
			<bmi-chart  :weights="weightData" :heights="heightData" ></bmi-chart>
			<div class="chart-legend">Be careful BMI is a poor indicator of general health and is is not adequate for children</div>
		</div>
		<div class="card">
				<bar-chart :dailyIntakes="caloriesData"></bar-chart>
		</div>
	</div>
	<div v-if="routing.commentsFeed" id="comments-feed">
		<comment-feed  :userid="user_id"></comment-feed>
		<div class="fa fa-arrow-left" v-on:click="showDataFeed"></div>
	</div>
</div>	
</template>

<script>
import BarChart from "./BarChart.vue"
import ChartJs from './chartjs.vue'
import CommentSection from "./commentSection.vue"
import CommentsFeed from "./commentsFeed.vue"
import CommentsCard from "./commentsCard.vue"
export default{
	components:{
		'bar-chart': BarChart,
		'bmi-chart':ChartJs,
		'comment-section': CommentSection,
		'comment-card':CommentsCard,
		'comment-feed': CommentsFeed,
	},
	name: "data-feed",
	props: {
		user_id: {
					type: Number,
					default:()=>{
						return
					}
				},
		comment: {
			type: Array,
			default:()=>{
				return
			}
		}
	},
	data() {
		return{
			routing:{
				userFeed: true,
				commentsFeed: false,
			},
			dailyCalories:{
				calories: 0,
				day: new Date,
			},
			weightHeightData:{
				weight:0,
				height:0,
				day: new Date
			},
			dailyCaloriesMessage:"",
			caloriesData:[],
			heightData:[],
			weightData:[],
			toComment: false,
		}
	},
	computed: {
		convertDate(){
			return this.dailyCalories.day.getUTCFullYear()+'-'+this.dailyCalories.day.getUTCMonth() +'-'+ this.dailyCalories.day.getUTCDate()
		},

	},
	beforeMount(){
		this.getHeightData()
		this.getWeightData()
	},
	mounted() {
		this.getHeightData()
		this.getWeightData()
		this.getCaloriesData()
	},
	methods:{
		showCommentFeed(){
			this.routing.userFeed = false;
			this.routing.commentsFeed = true;
		},
		showDataFeed(){
			this.routing.userFeed = true;
			this.routing.commentsFeed = false;
		},
		getCaloriesData(){
			$.ajax({
				type:"POST",
				url:"/reveal_intake.json",
				headers: {
	            'Content-Type': 'application/json',
	            'X-Requested-With': 'XMLHttpRequest',
	            'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
          		},
          		data: JSON.stringify({user_id: this.user_id.toString()}),
          		success:(res)=>{
          			this.caloriesData = res
					
          		},
          		error:(err)=>{
          			this.caloriesData = err
          		}
			})
		},
		postCalories (){
			  $.ajax({
          type: "POST",
          url: '/add_intake.json',
          headers: {
            'Content-Type': 'application/json',
            'X-Requested-With': 'XMLHttpRequest',
            'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
          },
          data : JSON.stringify({calories:this.dailyCalories.calories, day: this.dailyCalories.day, user_id: this.user_id.toString()}),
          success: (res)=>{
          	console.log(res)
          	this.getCaloriesData()
          },
          error:(error)=>{
          	console.log(error)
          }
        })

		},
		getHeightData(){
			$.ajax({
				type:"POST",
				url:"/reveal_height.json",
				headers: {
	            'Content-Type': 'application/json',
	            'X-Requested-With': 'XMLHttpRequest',
	            'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
          		},
          		data: JSON.stringify({user_id: this.user_id.toString()}),
          		success:(res)=>{
          			this.heightData = res
					
          		},
          		error:(err)=>{
          			this.heightData = err
          		}
			})
		},
		getWeightData(){
			$.ajax({
				type:"POST",
				url:"/reveal_weight.json",
				headers: {
	            'Content-Type': 'application/json',
	            'X-Requested-With': 'XMLHttpRequest',
	            'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
          		},
          		data: JSON.stringify({user_id: this.user_id.toString()}),
          		success:(res)=>{
          			this.weightData = res
					
          		},
          		error:(err)=>{
          			console.log(err)
          			this.weightData = err
          		}
			})
		},
		postHeightWeight (){
			  $.ajax({
          type: "POST",
          url: '/add_height_weight.json',
          headers: {
            'Content-Type': 'application/json',
            'X-Requested-With': 'XMLHttpRequest',
            'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
          },
          data : JSON.stringify({height:this.weightHeightData.height, weight:this.weightHeightData.weight, day: this.weightHeightData.day, user_id: this.user_id}),
          success: (res)=>{
          	console.log(res)
          	this.getHeightData()
          	this.getWeightData()
          },
          error:(error)=>{
          	console.log(error)
          }
        })

		}
		
		
	}
}
	
</script>