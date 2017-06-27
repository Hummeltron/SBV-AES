// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require_tree .

var copyListItems = [];

$(document).ready(function() {
    $('#copyModal').on('shown.bs.modal', function() {
        $('#copyId').focus();
    }); 
});

function dismissCopies() {
    $('#copies').empty();
    copyListItems = [];
}

function removeCopy(node) {
    var list = document.getElementById("copies");
    copyListItems.splice(copyListItems.indexOf(node), 1);
    list.removeChild(node);
}

function addCopy() {
    var list = document.getElementById("copies");
    var input = document.getElementById("copyId");
    var node = document.createElement("li");
    var value = input.value;
    
    if (value != "") {
        var text = document.createTextNode(value);
        node.appendChild(text);
        node.setAttribute("onClick", "removeCopy(this)");
        list.appendChild(node);
        copyListItems.push(node);
        input.value = "";
    }
    
    return false;
}

function assignCopies() {
    var ids = [];
    for (var i = 0; i < copyListItems.length; i++) {
        ids.push(copyListItems[i].innerText);
    }
    
    // alert(ids.toString());
    
    $('#mode').val("0");
    $('#copy_ids').val(ids.toString());
    dismissCopies();
    $('#copy_assign_form').submit();
}

function unassignCopies() {
        var ids = [];
    for (var i = 0; i < copyListItems.length; i++) {
        ids.push(copyListItems[i].innerText);
    }
    
    // alert(ids.toString());
    
    $('#mode').val("1");
    $('#copy_ids').val(ids.toString());
    dismissCopies();
    $('#copy_assign_form').submit();
}

function searchCopy() {
    var id = $("#copyId").val();
    var path = "/copies/";
    
    window.location.href = path + id;
    
    return false;
}