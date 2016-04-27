var app = app || {};

app.AppView = Backbone.View.extend({
  el: '.main',
  render: function () {
    var template = $('.mainAppView').html();
    this.$el.html(template);
    this.collection.each(function(p) {
      var postListView = new app.PostListView({model: p});
      postListView.render();
    });
  }
});
