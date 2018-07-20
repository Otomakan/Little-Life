
import Vue from 'vue/dist/vue.js'
import TurbolinksAdapter from 'vue-turbolinks'
import VueResource from 'vue-resource'
import Element from 'element-ui'
import locale from 'element-ui/lib/locale/lang/en'
import 'element-ui/lib/theme-chalk/index.css';
import UserProfile from '../components/userProfile.vue'
import BackgroundImage from '../components/background.vue'
import DataFeed from '../components/data_feed.vue'
import VueCharts from 'vue-chartjs'
// import { Bar, Line } from 'vue-chartjs'

Vue.use(Element,{locale})
Vue.use(TurbolinksAdapter)
Vue.use(VueCharts)
// Vue.use(UserProfile)
// Vue.use(UserProfile)

document.addEventListener('turbolinks:load', () => {
  let userBoard = document.getElementById('user-board')
  if(userBoard){
  	 const user_app = new Vue({
    el: userBoard,
    components:{UserProfile, BackgroundImage, DataFeed}
  })
  }
 

})

