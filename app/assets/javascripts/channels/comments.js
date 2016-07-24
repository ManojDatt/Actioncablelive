App.comments = App.cable.subscriptions.create("CommentsChannel", {
  collection: function() {
    return $("[data-channel='comments']");
  },

  connected: function() {
    return setTimeout((function(_this) {
      return function() {
        _this.followCurrentMessage();
        return _this.installPageChangeCallback();
      };
    })(this), 5000);
  },
  received: function(data) {
 
      return this.collection().append(data.comment);
    
  },
  
  followCurrentMessage: function() {
    var messageId;
    if (messageId = this.collection().data('message-id')) {
      return this.perform('follow', {
        message_id: messageId
      });
    } else {
      return this.perform('unfollow');
    }
  },
  installPageChangeCallback: function() {
    if (!this.installedPageChangeCallback) {
      this.installedPageChangeCallback = true;
      return $(document).on('page:change', function() {
        return App.comments.followCurrentMessage();
      });
    }
  }
});

// ---
// generated by coffee-script 1.9.2