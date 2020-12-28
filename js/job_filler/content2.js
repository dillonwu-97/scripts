var zenbu = document.querySelectorAll('label, input')
const dict = {
	"first name":"Dillon", 
	"last name":"Wu", 
	"linkedin":'https://www.linkedin.com/in/dillonwu/', 
	"email":"dillonwu999@gmail.com",
	"phone":'9178268232',
	'website':'https://github.com/dillonwu-97/algorithms-visualizer',
	'github':'https://github.com/dillonwu-97',
	'location': 'Brooklyn, New York, United States',
	'resume': null,
	'relocate': 'yes'

}
let s, tagName
let found_key = " "
for (var i = 0; i < zenbu.length; i++) {
    tagName = zenbu[i].tagName.toLowerCase()
    s = zenbu[i].textContent.toLowerCase()  

	if (tagName === 'label' && s.length > 0) {
		for (const key in dict) {
			if (s.includes(key) ) {
				console.log(s, i)
				// console.log(dict[key])
				found_key = key
			}
		}
	}

	// handling the label case; if triggered, subsequent case should be an input  
	// handle error for when we hit something that we're not supposed to
	try {
		if (tagName === 'input' && zenbu[i].type==='text' && found_key!== " ") {
	    	zenbu[i].value = dict[found_key]
	    	found_key = " "
	    }
	} 
	catch(err) {
		found_key = " "
	}
}
