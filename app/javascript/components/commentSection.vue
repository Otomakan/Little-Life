<template>
	<div class="card" style="background:white;" >
	<div class="comment-section">
		<h2>Create a New Comment</h2>
	<el-form ref="form" :model="post" label-width="120px">
			<el-form-item label="Title">
			    <el-input v-model="post.title"></el-input>
			</el-form-item>
			<el-form-item label="Content">
		    <el-input type="textarea" v-model="post.content"></el-input>
		  </el-form-item>
		   <el-form-item
			    label="Feel-Good grade (out of 10)"
			    prop="grade"
			    :rules="[{ required: true, message: 'This is required'}, { type: 'number', message: 'The grade must be a number!'}]" >
			    <el-input type="age" v-model.number="post.grade" auto-complete="off"></el-input>
			  </el-form-item>
		</el-form>
		<el-button v-on:click="postComment">Submit</el-button>
	</div>
	</div>
</template>

<script>
	export default{
		name: "comment-section",
		props:{
			userid: {
				type: Number,
				default:()=>{
					return
				}
			}, 
			numberValidateForm: {
        	 	 grade: ''
       		 },
		},
		data(){
			return{
				post:{

				content:'',
				title:'',
				grade:0,

				}
			}
		},

		methods:{
			postComment(){
				console.log(this.post.grade + this.post.content +this.post.title)
				$.ajax({
					type: "POST",
					url: '/add_comment.json',
					headers: {
			            'Content-Type': 'application/json',
			            'X-Requested-With': 'XMLHttpRequest',
			            'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
			        },
			        data: JSON.stringify({content: this.post.content, 
			        	grade: this.post.grade.toString(), 
			        	title: this.post.title, 
			        	user_id: this.userid.toString()}),
				        success:(res)=>{
				        	console.log(res)
				        },
				        error:(res)=>{
				        	console.log(res)
				        }
				})
			},
			submitForm(formName) {
        this.$refs[formName].validate((valid) => {
          if (valid) {
            alert('submit!');
          } else {
            console.log('error submit!!');
            return false;
          }
        });
      },
      resetForm(formName) {
        this.$refs[formName].resetFields();
      }
		}
	}
</script>