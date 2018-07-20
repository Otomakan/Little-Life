
import Vue from 'vue/dist/vue.js'
import TurbolinksAdapter from 'vue-turbolinks'
import VueResource from 'vue-resource'
import Element from 'element-ui'
import locale from 'element-ui/lib/locale/lang/en'
import 'element-ui/lib/theme-chalk/index.css';

Vue.use(Element,{locale})
Vue.use(TurbolinksAdapter)

document.addEventListener('turbolinks:load', () => {
  let userBoard = document.getElementById('user-board')
  if(userBoard){
  	let user = JSON.parse(userBoard.dataset.user)
	const app = new Vue({
    el: userBoard,
    data:{
    	user:user
    }
  })
  }
  

})

