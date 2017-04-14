/*global $*/
    $(document).ready(function(){
        
        $("#signup_card").hide();
        $("#login_card").hide();
        
        $("#home").click(function(){
           setTimeout(function(){
               $("#header").slideDown("slow");
           }, 500);
           $("#signup_card").fadeOut(500);
           $("#login_card").fadeOut(500);
        });
        
        $("#signup_col").click(function() {
            setTimeout( function(){
                $('#signup_card').slideDown("slow");
            }, 700);
            $("#header").fadeOut(500);
            $("#login_card").fadeOut(500);
        });
        
        $("#login_col").click(function() {
            setTimeout( function(){
                $('#login_card').slideDown("slow");
            }, 700);
            $("#header").fadeOut(500);
            $("#signup_card").fadeOut(500);
        });
    
    
    // sign up form submmit     
       $("#submit").click(function(){
           var name = $("#name").val();
           var email = $("#email").val();
           var password = $("#password").val();
           var password_confirmation = $("#password_confirmation").val();
           
           var d = {
               'user': {
                   'name': name,
                    'email': email,
                    'password': password,
                    'password_confirmation': password_confirmation
               }
            };
            console.log(d)
            
        $.ajax({
            type: "POST",
            url: "/users",
            beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
            data: d    
            }).success(function(json){
            console.log("success", json);
        });
       });
    });