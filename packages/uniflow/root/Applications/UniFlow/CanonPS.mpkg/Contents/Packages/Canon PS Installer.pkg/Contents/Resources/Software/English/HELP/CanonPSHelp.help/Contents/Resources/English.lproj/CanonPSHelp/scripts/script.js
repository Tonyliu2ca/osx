window.onload = function fncOnLoad(){
	try{
		var objAnchors = document.getElementsByTagName("a");
		for(var i = 0; i < objAnchors.length; i++){
			if(objAnchors[i].className == "open_close_next_sibling"){
				objAnchors[i].innerHTML = fncGetResourceElementById("open_next_sibling");
				objAnchors[i].className = "open_next_sibling";
				objAnchors[i].onclick = function(){
					fncOpenCloseNextSibling(this);
					return false;
				}
			}else if(objAnchors[i].className == "open_all"){
				objAnchors[i].innerHTML = fncGetResourceElementById("open_all");
				objAnchors[i].onclick = function(){
					fncOpenCloseAll("open");
					return false;
				}
			}else if(objAnchors[i].className == "close_all"){
				objAnchors[i].innerHTML = fncGetResourceElementById("close_all");
				objAnchors[i].onclick = function(){
					fncOpenCloseAll("close");
					return false;
				}
			}else if(objAnchors[i].id == "id_res_top"){
				objAnchors[i].innerHTML = fncGetResourceElementById("top");
			}
		}
	}catch(e){
	}
}
function fncOpenCloseNextSibling(eSrc){
	try{
		var objNextSibling;
		objNextSibling = eSrc.parentNode.nextSibling;
		while (objNextSibling.nodeType != 1) {
			objNextSibling = objNextSibling.nextSibling;
		}
		if (objNextSibling.style && objNextSibling.style.display.toLowerCase() != "block") {
			objNextSibling.style.display = "block";
			eSrc.innerHTML = fncGetResourceElementById("close_next_sibling");
			eSrc.className = "close_next_sibling";
		}else{
			objNextSibling.style.display = "none";
			eSrc.innerHTML = fncGetResourceElementById("open_next_sibling");
			eSrc.className = "open_next_sibling";
		}
	}catch(e){
	}
}
function fncOpenCloseAll(strMethod){
	try{
		var objDivs = document.getElementsByTagName("div");
		for(var i = 0; i < objDivs.length; i++){
			if(objDivs[i].className == "invisible"){
				var objPreviousSibling;
				objPreviousSibling = objDivs[i].previousSibling;
				while (objPreviousSibling.nodeType != 1) {
					objPreviousSibling = objPreviousSibling.previousSibling;
				}
				if(strMethod == "open"){
					objDivs[i].style.display = "block";
					if(		(objPreviousSibling.childNodes[0].className == "open_next_sibling")
						||	(objPreviousSibling.childNodes[0].className == "close_next_sibling")
					){
						objPreviousSibling.childNodes[0].innerHTML = fncGetResourceElementById("close_next_sibling");
						objPreviousSibling.childNodes[0].className = "close_next_sibling";
					}
				}else{
					objDivs[i].style.display = "none";
					if(		(objPreviousSibling.childNodes[0].className == "open_next_sibling")
						||	(objPreviousSibling.childNodes[0].className == "close_next_sibling")
					){
						objPreviousSibling.childNodes[0].innerHTML = fncGetResourceElementById("open_next_sibling");
						objPreviousSibling.childNodes[0].className = "open_next_sibling";
					}
				}
			}
		}
	}catch(e){
	}
}
function fncGetResourceElementById(strId){
	try{
		var r = eval(resource);
		for(var i = 0; i < r.length; i++){
			if(r[i].id == strId){
				return r[i].value;
			}
		}
	}catch(e){
	}
}