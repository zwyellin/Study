Ext.onReady(function(){
		var divs = document.getElementsByTagName('div');
		for(var i=0;i<divs.length;i++){
			var ele = divs[i];
			var index = ele.id.indexOf('CICSU_ATTACHMENT_TAG');
			
 			if(index!=-1 && index == 0){
			var readonly = ele.getAttribute('readonly');
			var moduleId = ele.getAttribute('moduleId');
 			var word2html = ele.getAttribute('word2html');
			var ownerDelete = ele.getAttribute('ownerDelete');
			
			var datatype = ele.getAttribute('datatype');			
			
			var suffix = ele.getAttribute('suffix');
			var width = ele.getAttribute('width');
			// 添加附件按钮的名称
			var addName = ele.getAttribute('addName');
			
 			var uploadPanel = new Ext.ux.UploadPanel({
				id : "P_" + ele.id,
				url : word2html ? 'Attachment_uploadWord2Html_1_1.action' : 'Attachment_uploadAttachment_1_1.action',
				width : ((width && width!='') ? width : 200),
				datatype : datatype ? datatype : undefined,
				addName : addName,
				suffix : suffix ? suffix : undefined,
				enableProgress:false,
				moduleId : moduleId ? moduleId : undefined,
				ownerDelete : ownerDelete ? ownerDelete : undefined,
				readonly : readonly == "true" ? true : false,
				renderTo : ele.id
			});
			if(!moduleId){
				var attachIdField = ele.id.substring('CICSU_ATTACHMENT_TAG'.length,ele.id.length);
				
				var attachIdFieldName = "attachmentId" + attachIdField;
				
				uploadPanel.attachIdFieldName = attachIdFieldName;
				
				var tmpObj = document.createElement("div");
	
				tmpObj.innerHTML = "<input type='hidden' name='"+ attachIdFieldName +"' value=''></input>";
	
				ele.parentNode.appendChild(tmpObj);
			}			
			}
		}
})

function fileIsExist(id) {
	var flag = false;
	Ext.Ajax.request({
		url : './Attachment!fileIsExist.action',
		method : 'POST',
		async : false,// 同步执行
		params : {
			id : id
		},
		success : function(response) {
			var res = Ext.util.JSON.decode(response.responseText);
			if (res.exist == true) {
				flag = true;
			} else {
				flag = false;
			}
		},
		failure : function(response) {
			flag = false;
		}
	});
	return flag;
}
function downloadAttachment(aid){
	var exist = fileIsExist(aid);
  	if (exist == false) {
		Ext.Msg.alert("提示", "该文件可能不存在！");
	} else {
		window.open("./Attachment!downloadAttachment.action?aid=" + aid);
		//window.location.href= "./Attachment!downloadAttachment.action?aid=" + aid;	
 	}
  	
}