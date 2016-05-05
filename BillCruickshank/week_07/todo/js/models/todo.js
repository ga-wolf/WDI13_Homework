var app = app || {};

app.Todo = Backbone.Model.extend({
  defaults: {
    title: '',
    completed: false
  },

  parse: function () {
    console.log("heloo");
  },

  toggle: function () {
    this.save({
      completed: !this.get('completed')
    })
  }
});
