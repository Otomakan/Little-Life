<template>
<!-- 	<tab-content title="Personal details"
                         icon="ti-user">
      <el-form :model="user" :rules="rules" ref="form">
        <el-form-item for="name" label="Name" prop="name">
          <el-input v-model="user.name" placeholder="First name"></el-input>
        </el-form-item>
        <el-form-item label="Email" prop="email">
          <el-input v-model="user.email" placeholder="Email"></el-input>
        </el-form-item>
      </el-form>
</tab-content> -->
<h1>Hi</h1>
</template>

<script>
export default {
	  	created(){
	  		console.log(this.props)
	  		console.log(this.user)
	  		console.log(this)
	  		},
	data(){
		return{ 
		model:{
		name :'',
		email:''
			},
		rules:{
			  	name: [{
				          required: true,
				          message: 'First name is required',
				          trigger: 'blur'
			        	}],
			    email: [{
		          required: true,
		          message: 'Email is required',
		          trigger: 'blur'
		        },
		        {
		          type: 'email',
		          message: 'Invalid email',
		          trigger: 'change'
		        }],
		    },
		 

		}
	}
}

</script>
