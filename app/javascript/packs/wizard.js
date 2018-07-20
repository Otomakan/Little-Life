/* eslint no-console: 0 */
// Run this example by adding <%= javascript_pack_tag 'hello_vue' %> (and
// <%= stylesheet_pack_tag 'hello_vue' %> if you have styles in your component)
// to the head of your layout file,
// like app/views/layouts/application.html.erb.
// All it does is render <div>Hello Vue</div> at the bottom of the page.

import Vue from 'vue/dist/vue.js'
import App from '../app.vue'
// import Vuikit from 'vuikit'
// import VuikitIcons from '@vuikit/icons'
// import VueFormWizard from '../../assets/javascripts/wizard-form.js'
import TurbolinksAdapter from "vue-turbolinks"
import VueFormWizard from "vue-form-wizard";
import Element from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css';

// Vue.use(Vuikit)
// Vue.use(VuikitIcons)
Vue.use(TurbolinksAdapter)
Vue.use(VueFormWizard)
import locale from 'element-ui/lib/locale/lang/en'

Vue.use(Element, { locale })

document.addEventListener('turbolinks:load', () => {
   const el = document.getElementById('wizard-form')
  if (el){
  	const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content')    
  	let user = JSON.parse(el.dataset.user)
  	user.weight = 0
  	user.height = 0
  	
  	const form = new Vue({
	  	el: "#wizard-form",
	  	data:{

	  		user: user,
	  		model: user,
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
		        age: [{
		        	required: true,
		        	message: "Please Enter Your age :)"
		        }],
		        weight: [{
		        	required:true,
		        	message: "We need Your weight to do proper data analysis"
		        }],
		        height:[{
		        	required:true,
		        	message: "We will need your weight too"
		        }],
		        diet_type:[{
		        	required:true,
		        	message: "Please select Diet Type in the list"
		        }],
		        blood_type:[{
		        	required: true,
		        	message: "Select Your blood type if you don't know it select NA"
		        }],
		        password: [{ 
		        	 required:true,
		        	 trigger: 'blur' }
          		],
          		password_confirmation: [{ 
          			required: true,
          			message: 'Password Is Required',
          			trigger: 'blur' 
          		}],
		    },
	  	},

	  	methods: {
  		onComplete: ()=>{
  			console.log(user)
  		let dob = user.dob.getUTCFullYear()+'-'+user.dob.getUTCMonth() +'-'+ user.dob.getUTCDate()
          $.ajax({
          type: "POST",
          url: '/signup.json',
          headers: {
            'Content-Type': 'application/json',
            'X-Requested-With': 'XMLHttpRequest',
            'X-CSRF-TOKEN': csrfToken
          },
          data : JSON.stringify({name: user.name, 
          				email: user.email,
          				 password: user.password,
          				 gender: user.gender,
          				 password_confirmation: user.password_confirmation,
          				weight: user.weight,
          				 dob: dob,
          				  height: user.height, diet_type: user.diet_type, blood_type: user.blood_type}),
        })
        },
        },

		
	})
	}
})
  // const app = new Vue({
  //   el,
  //   render: h => h(App)
  // })

//   console.log(app)
// })


// The above code uses Vue without the compiler, which means you cannot
// use Vue to target elements in your existing html templates. You would
// need to always use single file components.
// To be able to target elements in your existing html/erb templates,
// comment out the above code and uncomment the below
// Add <%= javascript_pack_tag 'hello_vue' %> to your layout
// Then add this markup to your html template:
//
// <div id='hello'>
//   {{message}}
//   <app></app>
// </div>


// import Vue from 'vue/dist/vue.esm'
// import App from '../app.vue'
//
// document.addEventListener('DOMContentLoaded', () => {
//   const app = new Vue({
//     el: '#hello',
//     data: {
//       message: "Can you say hello?"
//     },
//     components: { App }
//   })
// })
//
//
//
// If the using turbolinks, install 'vue-turbolinks':
//
// yarn add 'vue-turbolinks'
//
// Then uncomment the code block below:
//
// import TurbolinksAdapter from 'vue-turbolinks';
// import Vue from 'vue/dist/vue.esm'
// import App from '../app.vue'
//
// Vue.use(TurbolinksAdapter)
//
// document.addEventListener('turbolinks:load', () => {
//   const app = new Vue({
//     el: '#hello',
//     data: {
//       message: "Can you say hello?"
//     },
//     components: { App }
//   })
// })
