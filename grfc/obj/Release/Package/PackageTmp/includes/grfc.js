if(document.images){
    domain = "grfc.co.uk";
    domain2 = "guildfordiansrfc.co.uk";
    vacancy = "Due the success of the club last season we have created a number of new committee positions for this season of which only a few remain, if you are interested in filling one of these positions and joining our fast expanding family of volunteers please contact the Club Secretary, Mike Holden - details as above";
    enlarge = "Click to enlarge photo";
    moreinfo = "Click here for more information";
    photolink = "Click here for photos of this event";
    matchreport = "Click here for match report";
}

function DiaryChange(className) {
    if (event.target.checked) {
        $("#diary ." + className).parent().show();
    } else {
        $("#diary ." + className).parent().hide();
    }
}

function stylechange(theClass){
	if (theClass.style.display == 'none') {
	    theClass.style.display = '';
	}
	else {
	    theClass.style.display = 'none';
	}
}