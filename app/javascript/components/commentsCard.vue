<template>
	<div v-if="comment" class="card">
		<h1 v-if="title">{{title}}</h1>
			<div class="comment">

			<h3>
				{{comment.title}}
			</h3>
			<p> Feel Good index: {{comment.grade}}</p>
			<p> {{comment.content}}</p>
			<div v-if="redirect" >
				<a v-on:click="redirect" id="my-plus" class="fa fa-plus">
				</a>
			</div>
			</div>
		</div>
</template>

<script >
	export default{
		name: 'comment-card',
		props: {
			comment:{
				type: Object,
				default: null,
				},
			redirect:{
				type: Function,
				default:null,
			},
			title:{
				type: String,
				default:null,
			}
		}
	}
</script>