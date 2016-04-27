var app = app || {};

app.Post = Backbone.Model.extend({
  defaults: {
    title: '',
    author: 'Anonymous',
    content: ''
  }
});
