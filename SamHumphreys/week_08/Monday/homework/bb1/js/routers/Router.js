var app = app || {};

app.Router = Backbone.Router.extend ({
  routes: {
    '': 'index',
    'posts/:id': 'show'
  },
  index: function () {
    var appView = new app.AppView({collection: posts});
    appView.render();
  },
  show: function (id) {
    var post = posts.get(id);
    var postView = new app.PostView({model: post});
    postView.render();
  }
});
