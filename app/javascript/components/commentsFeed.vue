<template>
	<div>
		<comment-section  :userid="userid"></comment-section>
		<div v-for="comment in comments.reverse()">
			<comment-card v-bind:comment="comment" class="card">
				
			</comment-card>
		</div>
	</div>
</template>

<script>
	
import CommentSection from "./commentSection.vue"
import CommentsCard from "./commentsCard.vue"
	export default {
		components:{
			'comment-section':CommentSection,
			'comment-card':CommentsCard
		},
		 
		props: {
			userid: {
				type: Number,
				default:()=>{
					return
				}
			}, 
			comments:{
				type: Array,
				default:()=>{
					return []
				}
			}
		},
		mounted(){
			this.getPosts()
		},
		methods:{
			getPosts(){
					$.ajax({
				type:"POST",
				url:"/reveal_posts.json",
				headers: {
	            'Content-Type': 'application/json',
	            'X-Requested-With': 'XMLHttpRequest',
	            'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
          		},
          		data: JSON.stringify({user_id: this.userid.toString()}),
          		success:(res)=>{
          			this.comments = res
					
          		},
          		error:(err)=>{
          			this.comments = err
          		}
			})
			}
		}
	}
</script>