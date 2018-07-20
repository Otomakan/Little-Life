<template>
	<el-menu  class="el-menu-demo" mode="horizontal" >
<el-menu-item v-on:click="redirect('/')" index="1"> Hi there</el-menu-item>
     <el-menu-item index="2">Login</el-menu-item>
         <el-submenu index="3">
        <template slot='title'>Navigation</template>
    <el-menu-item index="3.1">"About"</el-menu-item>
      <el-menu-item index="3.2">See all users", '/test' %></el-menu-item>
      <el-menu-item index="3.3">Help</el-menu-item>
      <el-menu-item index="3.4"></el-menu-item>
    </el-submenu>
    <el-menu-item index="4">Contact</el-menu-item>

</el-menu>
</template>

<script>
	export default{
		name: "little-nav",
		data(){
			return{}
		},
		// data(){
		// 	return{

		// 	}
		// },
		methods:{
			redirect(link){
				window.location.replace(link)
			}
		}
	}

</script>
<!-- 
 <% if logged_in? %>
      <% greet = "Hi! " + current_user.name + "!" %>
      <el-menu-item index="1"> <%= link_to greet, '/home'%></el-menu-item>
  
      <el-menu-item index="2"><%= id = '/users/' + current_user.id.to_s
      link_to "Dashboard", id %></el-menu-item>
      <el-submenu index="3">
        <template slot='title'>Navigation</template>
      <el-menu-item index="3.1"><%= link_to "About", '/about' %></el-menu-item>
      <el-menu-item index="3.2"><%= link_to "See all users", '/test' %></el-menu-item>
      <el-menu-item index="3.3"><%= link_to "Help", '/help' %></el-menu-item>
      <el-menu-item index="3.4"><%= link_to "Home", '/' %></el-menu-item>
    </el-submenu>
      <el-menu-item index="4"><%= link_to "Log out", logout_path, method: :delete %></el-menu-item>

    <%else%> -->