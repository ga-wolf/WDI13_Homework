var app = app || {};
$( document ).ready(function() {

// Todo Item View
// --------------


//the DOM element for a todo item
app.TodoView = Backbone.View.extend({

  //... is a list tag.
  tagName: "li",

  //cache the template function for a single item
  template: _.template( $('#item-template').html() ),

  // The DOM events specifiv to an item.
  events: {
    'click .toggle': 'togglecompleted',
    'dblclick label': 'edit',
    'click .destroy': 'clear',
    'keypress .edit': 'updateOnEnter',
    'blur .edit': 'close'
  },

  // the TodoView listens for changes to its model, Re-rendering. Since there's a one-to-one correspondence between a **Todo** and a **TodoView** in this app, we set a direct reference on the moddel for convenience.
  initialize: function() {
    this.listenTo(this.model, 'change', this.render);
    this. listenTo(this.model, 'destroy', this.remove);
    this.listenTo(this.model, 'visible', this.toggleVisible);
  },

  // Re-renders the titles of the todo item.
  render: function() {
    this.$el.html( this.template (this.model.attributes));

    this.$el.toggleClass( 'completed', this.model.get('completed'));
    this.toggleVisible();

    this.$input = this.$('.edit');

    return this;
  },

  // Toggles visibility of the item
  toggleVisible: function () {
    this.$el.toggleClass( 'hidden', this.isHidden());
  },

  // Determines if item should be hidden
  isHidden : function () {
    var isCompleted = this.model.get('completed');
    return (// hidden cases only
      (!isCompleted && app.TodoFilter === 'completed') || (isCompleted && app.TodoFilter === 'active')
    );
  },

  // Toggle the '"completed"' state of the model
  togglecompleted: function() {
    this.model.toggle();
  },

  // Switch this view into '"editing"' mode, displaying the input field.
  edit: function() {
    this.$el.addClass('editing');
    this.$input.focus();
  },

  // CLose the '"editing"' mode, saving changes to the todo.
  close: function () {
    var value = this.$input.val().trim();

    if (value) {
      this.model.save({title: value});
    }

    this.$el.removeClass('editing');
  },

  // If you hit 'enter', we're finished editing the item.
  updateOnEnter: function(e) {
    if ( e.which === ENTER_KEY) {
      this.close();
    }
  },

// Remove the item, destroy the model form *localSorage* and delte its view.
clear: function() {
  this.model.destroy();
}

});
});
