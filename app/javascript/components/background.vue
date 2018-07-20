<template>
	<div id="background-cat">
		<!-- <img  :src="backgroundPicture"> -->
	</div>
</template>
<script>
	export default{
		name:"background-picture",
		data(){
			return{
				backgroundPicture:"http://24.media.tumblr.com/tumblr_m2avnjtFOP1qze0hyo1_1280.jpg",
			}
		},
		ready:()=>{
			this.backgroundPicture = "24.media.tumblr.com/tumblr_m2avnjtFOP1qze0hyo1_1280.jpg"
		}
	}

</script>

