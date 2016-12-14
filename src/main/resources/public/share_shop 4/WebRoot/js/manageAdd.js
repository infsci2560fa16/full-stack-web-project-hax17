$(document).ready(function () {	   		
	$.get("manageAdd.QTServlet",function(data){
	   		
		var $tbody = $("<tbody></tbody>");
		for (var i=0;i< data.length;i++) {
		    $tbody.append(tr(data[i]));
		}
		$("#AddressTable").append($tbody);
		
		$("#AddressTable").on("click","a.deleteAdd", function () {
			var recipients = $(this).parent().siblings(":eq(0)").text();
			var address = $(this).parent().siblings(":eq(1)").text();
			var tel = $(this).parent().siblings(":eq(2)").text();
			$.post("deleteAddress.QTServlet",
					{
						'recipients':recipients,
						'address':address,
						'tel':tel
					},
					function(data){
				        if(data == 'success'){
				        	window.location.reload();
				        }
			});
		});
		
		$("#AddressTable").on("click","a.editAddress", function () {
			var recipients = $(this).parent().siblings(":eq(0)").text();
			var address = $(this).parent().siblings(":eq(1)").text();
			var tel = $(this).parent().siblings(":eq(2)").text();
			var origin = recipients+","+address+","+tel;
			$('#addTable').find('input[name="recipients"]').val(recipients);
			$('#addTable').find('input[name="address"]').val(address);
			$('#addTable').find('input[name="tel"]').val(tel);
			$('#addTable').find('input[name="origin"]').val(origin);
		});
	});
	   		
	function tr(data){
		var $tbody = $("<tr></tr>");
		$tbody.append($("<td class='recipients'></td>").text(data.recipients));
		$tbody.append($("<td class='address'></td>").text(data.address));
		$tbody.append($("<td class='tel'></td>").text(data.tel));
		$tbody.append($("<td><a class='editAddress'>Edit</a><a class='deleteAdd'>Delete</a></td>"));
		return $tbody;
	 }
	
	
});