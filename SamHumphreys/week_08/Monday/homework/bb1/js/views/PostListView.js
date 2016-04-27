var app = app || {};

app.PostListView = Backbone.View.extend({
  tagName: 'li',
  events: {
    'click': 'showPost'
  },
  render: function() {
    this.$el.text(this.model.get('title') + ' by ' + this.model.get('author'));
    $('.posts').append(this.$el);
  },
  showPost: function () {
    router.navigate('posts/' + this.model.get('id'), true);
  }
});
