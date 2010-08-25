VK.init({
  apiId: 1930589,
  nameTransportPath: "/xd_receiver.html"
});

VK.UI.button('vk_login');

function doLogin() {
  VK.Auth.login(null);
};

VK.Observer.subscribe('auth.login', function(response) {
	if (response.session) {
		 VK.Api.call('getVariable', {key: 1281}, function(username) {
		     console.log(username);
		 });
	}
});
