/*global $*/
    $(document).ready(function(){
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