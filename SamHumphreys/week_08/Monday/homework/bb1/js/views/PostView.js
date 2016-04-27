var app = app || {};

app.PostView = Backbone.View.extend({
  el: '.main',
  render: function () {
    var template = $('.postView').html();
    var postViewHTML = _.template(template);
    this.$el.html(postViewHTML(this.model.toJSON()));
  }
});
