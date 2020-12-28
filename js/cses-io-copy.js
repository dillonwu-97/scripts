// ==UserScript==
// @name         CSES IO Copy
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  try to take over the world!
// @author       You
// @match        https://cses.fi/problemset/task/*
// @grant        none
// ==/UserScript==

let stylesheet = `
.copyBtn {
        background-color: green;
        padding: 5px;
    }`

// may need to create a better copy function at some point
let copy = (ele) => {
	let temp = document.createElement('textarea')
	document.body.appendChild(temp)
	temp.value = ele.textContent
	temp.select()
	document.execCommand('copy')
	temp.remove()
}

let create_copy_button = (ele) => {
	//let preTags = document.getElementsByTagName("pre")
	//let p = preTags[0]
	// console.log(p);
	let btn = document.createElement("button")
	//btn.innerHTML = "Copy"
    //btn.className = "copyBtn" // the stylesheet doesnt work
	btn.onclick = () => {
	    copy(ele)
	}
	//ele.insertBefore(document.createElement('br'), ele.childNodes[0]);
	ele.insertBefore(btn, ele.childNodes[0]);
}

window.addEventListener('load', () => {
	let preTags = document.getElementsByTagName("code")
    create_copy_button(preTags[0])
    let button = document.getElementsByClassName("copyBtn")[0]
//    button.addEventListener("click", function(){ console.log("Clicked!") })
//    console.log("hello")
    button.click()
})
