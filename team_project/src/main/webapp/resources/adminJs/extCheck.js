/**
 * 
 */
function isExt(filename){
	var dotIndex=filename.lastIndexOf(".");
	var extension=filename.substring(dotIndex+1);
	console.log(" file extension ",extension);
	if(extension =='jpg' || extension == 'png' || extension=='jpeg'){
		return true;
	}
	return false;
}