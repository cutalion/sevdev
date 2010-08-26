VK.init({
  apiId: 1930589,
  nameTransportPath: "/xd_receiver.html"
});

VK.UI.button('vk_login');

function doLogin() {
  VK.Auth.login(function(response) {
     if (response.session) {
  		 VK.Api.call('getVariable', {key: 1281}, function(hash) {
             new Ajax.Request('/user_session', {
                 method: 'post',
                 parameters: {login: hash.response},
                 onSuccess: function(transport){
                     document.location.reload(true);
                 }
             });
             
  		 });
     }
  });
};

VK.Observer.subscribe('auth.login', function(response) {

});
