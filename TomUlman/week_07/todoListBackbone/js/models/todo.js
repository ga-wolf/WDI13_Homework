var app = app || {};

// todo model
// ----------
// Our basic **todo** model has 'title' and 'completed' attributes

app.Todo = Backbone.Model.extend({
//Default attributes ensure each created todo has "title" and "completed" keys.
  defaults: {
    title: '',
    completed: false
  },

  // Toggle 'completed' state of this todo item.
  toggle: function() {
    this.save({
      completed: !this.get('completed')
    });
  }
});
