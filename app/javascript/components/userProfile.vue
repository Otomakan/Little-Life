<template>

<div id="profile-card">
	<div id="profile-pic-wrapper">
		<!-- 	<div class="left-row"></div>
			<div class="right-row"></div>
		  <span class="square square2" style="transform: translate(-5000%,-5000%);" ></span>
		  <span class="square square3" style="transform: translate(5000%,-5000%);"></span>
		  <span class="circle circle1"></span>
		  <span class="circle circle2"></span>
		  <span class="plus">+</span> -->
		<img id="profile-pic" :src="profilePicture" />
		<h2>{{user.name}}</h2>
	</div>
	<div id="card-content">
		<div id="profile-text">
			<transition name="fade">
			<div v-if="reveal.basic" id="basics">
				<div class="basic-list">Height {{height}}</div>
				<div class="basic-list">Weight {{weight}}</div>
				<div class="basic-list"> Gender {{user.gender}}</div>
			</ul>
			</div>
			</transition>
			<transition name="fade">
			<div v-if="reveal.advanced" id="advanced">
				<ul>
					<div class="advanced-list">Diet Type: {{user.diet_type}}</div>
					<div class="advanced-list">Blood Type: {{user.blood_type}}</div>
				</ul>	
			</div>
			</transition>

		</div>
		<div id="tab-top-bar">
			<div id="yellow-bar"></div>
		</div>
		
	</div>
	<div id="select">
			<div class="select-child" v-bind:class="{selected:reveal.basic}" v-on:click="showBasic"id="to-basic">Basic</div>
			<div class="select-child" v-bind:class="{selected:reveal.advanced}" v-on:click="showAdvanced"id="to-advanced">Advanced</div>
	</div>
</div>
</template>


<script>
	export default {
		data () {
			return{
				profilePicture: this.getPicUrl(),
				reveal:{
					basic: true,
					advanced: false,
				}
				
			}
		},
		name: "user-profile",
		props:{
			user:{
				type: Object,
				default: ()=>{}
			},
			weight:{
				type: String,
				default:()=>{}
			},
			height:{
				type: String,
				default:()=>{}
			}
		},

		
		methods: {
			getPicUrl () {
				return "https://api.adorable.io/avatars/285/" + this.user.email
			},
			showUser () {
				console.log(this)
				
			},
			showBasic () {
				this.reveal.advanced = false
				this.reveal.basic =true
				$("#yellow-bar").css({
					"left": '0'
				})
			},
			showAdvanced () {
				this.reveal.basic = false
				this.reveal.advanced =true
				$("#yellow-bar").css({
					"left": '52.5%'
				})
			},
		}

	}

</script>

