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

var ids = [];

$(document).ready(function() {
    const url = window.location.host;
    
    $('#copyModal').on('show.bs.modal', function() {
        ids = [];
        $('#copies').empty();
    })
    
    $('#copyModal').on('shown.bs.modal', function() {
        $('#copyInputField').focus();
    });
    
    $('#editCopies').on("submit", function() {
        var id = $('#copyInputField').val();
        
        $('#copyInputField').val("");
        
        var fetchData = { method: 'GET', headers: new Headers() }
        
        fetch("/copies/" + id + ".json", fetchData)
            .then((resp) => resp.json())
            .then(function(data) {
                $('#copies').append("<li id=" + id + ">" + id + " - " + data.label + " [" + data.owner + "]</li>");
                $('#' + id).click(function() {
                    $('#' + id).remove();
                    
                    var index = ids.indexOf(id);
                    ids.splice(index, 1);
                });
                
                ids.push(id);
            })
            .catch(function(error) {
                alert("[FEHLER]: Buch nicht gefunden!!");
            });
            
        return false;
    });
    
    $('#cancelBtn').click(function() {
        ids = [];
        $('#copies').empty();
    });
    
    $('#unassignBtn').click(function() {
        $('#mode').val("1");
        $('#copy_ids').val(ids.toString());
        $('#copy_form').submit();
    });
    
    $('#assignBtn').click(function() {
        $('#mode').val("0");
        $('#copy_ids').val(ids.toString());
        $('#copy_form').submit();
    });
});